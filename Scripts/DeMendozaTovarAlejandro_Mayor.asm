# DeMendoza_Tovar_Alejandro.asm
# Programa: leer N (3..5) números y mostrar el mayor (con validación de N)
.data
msg_n:     .asciiz "Digite la cantidad de numeros a comparar (3-5): "  # Prompt para solicitar N
msg_num:   .asciiz "Digite un numero: "                              # Prompt para solicitar cada número
msg_res:   .asciiz "El numero mayor es: "                            # Texto antes del resultado
msg_error: .asciiz "Error: la cantidad debe estar entre 3 y 5.\n"    # Mensaje de error para N inválido

.text
.globl main
main:
    li   $v0, 4            # servicio 4 -> imprimir cadena
    la   $a0, msg_n        # cargar dirección de msg_n en $a0
    syscall                # imprimir prompt para N

    li   $v0, 5            # servicio 5 -> leer entero
    syscall                # leer entero y dejarlo en $v0
    move $t0, $v0          # $t0 = N (cantidad solicitada)

    blt  $t0, 3, invalid   # si N < 3 -> salto a invalid
    bgt  $t0, 5, invalid   # si N > 5 -> salto a invalid

    # Leer primer número para inicializar el máximo
    li   $v0, 4            # servicio 4 -> imprimir cadena
    la   $a0, msg_num      # cargar dirección de msg_num
    syscall                # imprimir prompt para el primer número

    li   $v0, 5            # servicio 5 -> leer entero
    syscall                # leer primer número en $v0
    move $t2, $v0          # $t2 = max_actual (semilla: primer número)
    li   $t1, 1            # $t1 = contador, ya leímos 1 número

loop:
    beq  $t1, $t0, fin     # si contador == N -> fin

    li   $v0, 4            # servicio 4 -> imprimir cadena
    la   $a0, msg_num      # cargar prompt para siguiente número
    syscall                # imprimir prompt

    li   $v0, 5            # servicio 5 -> leer entero
    syscall                # leer número en $v0
    move $t3, $v0          # $t3 = número leído

    ble  $t3, $t2, skip    # si $t3 <= $t2 -> no es mayor -> saltar a skip
    move $t2, $t3          # si $t3 > $t2 -> actualizar max_actual = $t3

skip:
    addi $t1, $t1, 1       # contador++ (t1 = t1 + 1)
    j    loop              # volver al inicio del bucle

fin:
    li   $v0, 4            # servicio 4 -> imprimir cadena
    la   $a0, msg_res      # cargar mensaje de resultado
    syscall                # imprimir "El numero mayor es: "

    li   $v0, 1            # servicio 1 -> imprimir entero
    move $a0, $t2          # pasar max_actual en $a0
    syscall                # imprimir el valor máximo

    li   $v0, 10           # servicio 10 -> exit
    syscall                # terminar programa

invalid:
    li   $v0, 4            # servicio 4 -> imprimir cadena
    la   $a0, msg_error    # cargar mensaje de error
    syscall                # imprimir error
    li   $v0, 10           # servicio 10 -> exit
    syscall                # terminar programa
