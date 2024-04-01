# Serie Fibonacci en MARS MIPS
.data
prompt: .asciiz "Introduce un n�mero para la serie Fibonacci: "
result: .asciiz "La serie Fibonacci es: "

.text
.globl main

main:
    # Mostrar el prompt para ingresar el n�mero
    li $v0, 4
    la $a0, prompt
    syscall

    # Leer el n�mero ingresado por el usuario
    li $v0, 5
    syscall
    move $t0, $v0  # Guardar el n�mero en $t0

    # Inicializar los primeros dos t�rminos de la serie
    li $t1, 0  # F(0)
    li $t2, 1  # F(1)

    # Mostrar los primeros dos t�rminos
    li $v0, 4
    la $a0, result
    syscall
    move $a0, $t1
    li $v0, 1
    syscall
    move $a0, $t2
    li $v0, 1
    syscall

    # Generar y mostrar los siguientes t�rminos de la serie
    loop:
        add $t3, $t1, $t2  # F(n) = F(n-1) + F(n-2)
        move $t1, $t2
        move $t2, $t3

        # Mostrar el t�rmino actual
        move $a0, $t3
        li $v0, 1
        syscall

        # Verificar si hemos alcanzado el n�mero deseado de t�rminos
        subi $t0, $t0, 1
        bnez $t0, loop  # Si no hemos llegado al n�mero deseado, repetir el bucle

    # Terminar el programa
    li $v0, 10
    syscall
