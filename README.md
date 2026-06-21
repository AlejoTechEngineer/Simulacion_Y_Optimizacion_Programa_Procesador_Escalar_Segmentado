<div align="center">

# 📁 Simulacion Y Optimizacion Programa Procesador Escalar Segmentado

### Desarrollo propio — Alejandro De Mendoza

[![Academic](https://img.shields.io/badge/Academic-Project-1565C0?style=for-the-badge)](#)
[![GitHub](https://img.shields.io/badge/GitHub-AlejoTechEngineer-181717?style=for-the-badge&logo=github)](https://github.com/AlejoTechEngineer)

*Proyecto desarrollado en el marco de la Ingeniería Informática, Especialización en IA e Ingeniería de Software y Maestría en Arquitectura de Software — Politécnico Grancolombiano*

</div>

---

## ¿Qué es esto?

Proyecto de desarrollo propio realizado por **Alejandro De Mendoza** como parte de su formación académica y profesional en Ingeniería Informática, especialización en Inteligencia Artificial e Ingeniería de Software, y Maestría en Arquitectura de Software.

---

## Arquitectura

```mermaid
flowchart TD
    A[Scripts/ - Programa en Assembler MIPS] --> B[MARS 4.5 Simulator - Mars4_5.jar]
    B --> C[Procesador Escalar Segmentado - Pipeline]
    C --> D[Etapa IF - Instruction Fetch]
    C --> E[Etapa ID - Instruction Decode]
    C --> F[Etapa EX - Execute / ALU]
    C --> G[Etapa MEM - Memory Access]
    C --> H[Etapa WB - Write Back]
    D --> E --> F --> G --> H
    H --> I[Analisis de Hazards - datos / control / estructurales]
    I --> J[Optimizacion del pipeline - Reduccion de ciclos de penalizacion]
```

## Autor

**Alejandro De Mendoza**  
Ingeniero Informático · Especialista en IA · Especialista en Ingeniería de Software · Máster en Arquitectura de Software

[![GitHub](https://img.shields.io/badge/GitHub-AlejoTechEngineer-181717?style=for-the-badge&logo=github)](https://github.com/AlejoTechEngineer)
