# DeMendoza_Tovar_Alejandro_Fibonacci.asm
# Programa para generar N términos de Fibonacci e imprimir la serie y su suma.
.data
msg1: .asciiz "Ingrese la cantidad de numeros de la serie Fibonacci: "  # Prompt para N
msg2: .asciiz "La serie es: "                                         # Cabecera de la serie
msg3: .asciiz "\nLa suma de la serie es: "                             # Texto para la suma final
space: .asciiz " "                                                      # espacio separador

.text
.globl main
main:
    li $v0, 4              # servicio 4 (imprimir string)
    la $a0, msg1           # cargar msg1
    syscall                # imprimir prompt para N

    li $v0, 5              # servicio 5 (leer entero)
    syscall                # leer N en $v0
    move $t0, $v0          # $t0 <- N (cantidad de términos)

    move $t1, $zero        # $t1 <- 0 (contador i)
    move $t2, $zero        # $t2 <- fib0 = 0 (término actual)
    li   $t3, 1            # $t3 <- fib1 = 1 (siguiente término)
    move $t4, $zero        # $t4 <- suma acumulada = 0

    li $v0, 4              # servicio 4 (imprimir string)
    la $a0, msg2           # cargar msg2
    syscall                # imprimir "La serie es: "

fib_loop:
    beq $t1, $t0, fib_done # si i == N, terminar bucle

    li $v0, 1              # servicio 1 (imprimir entero)
    move $a0, $t2          # cargar en $a0 el término actual (fib0)
    syscall                # imprimir fib0

    li $v0, 4              # servicio 4 (imprimir string)
    la $a0, space          # cargar espacio
    syscall                # imprimir espacio separador

    add $t4, $t4, $t2      # suma += fib0

    add $t5, $t2, $t3      # t5 = fib0 + fib1 (siguiente término)
    move $t2, $t3          # fib0 = fib1
    move $t3, $t5          # fib1 = siguiente (t5)

    addi $t1, $t1, 1       # i++ (contador)
    j fib_loop             # repetir

fib_done:
    li $v0, 4              # servicio 4 (imprimir string)
    la $a0, msg3           # cargar msg3
    syscall                # imprimir texto de suma

    li $v0, 1              # servicio 1 (imprimir entero)
    move $a0, $t4          # pasar suma acumulada en $a0
    syscall                # imprimir suma

    li $v0, 10             # servicio 10 (exit)
    syscall                # terminar programa
