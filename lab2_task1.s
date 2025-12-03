.data
prompt1:    .asciiz "Enter first integer: "
prompt2:    .asciiz "Enter second integer: "

sum_msg:    .asciiz "Sum = "
diff_msg:   .asciiz "Difference = "
prod_msg:   .asciiz "Product = "
quot_msg:   .asciiz "Quotient = "
newline:    .asciiz "\n"

.text
main:
    # Ask for first number
    la $a0, prompt1
    li $v0, 4
    syscall

    li $v0, 5      # read int
    syscall
    move $t0, $v0  # store first number in $t0

    # Ask for second number
    la $a0, prompt2
    li $v0, 4
    syscall

    li $v0, 5
    syscall
    move $t1, $v0  # store second number in $t1

    # --------------------
    # SUM
    # --------------------
    add $t2, $t0, $t1

    la $a0, sum_msg
    li $v0, 4
    syscall

    move $a0, $t2
    li $v0, 1
    syscall

    la $a0, newline
    li $v0, 4
    syscall

    # --------------------
    # DIFFERENCE
    # --------------------
    sub $t3, $t0, $t1

    la $a0, diff_msg
    li $v0, 4
    syscall

    move $a0, $t3
    li $v0, 1
    syscall

    la $a0, newline
    li $v0, 4
    syscall

    # --------------------
    # PRODUCT
    # --------------------
    mul $t4, $t0, $t1

    la $a0, prod_msg
    li $v0, 4
    syscall

    move $a0, $t4
    li $v0, 1
    syscall

    la $a0, newline
    li $v0, 4
    syscall

    # --------------------
    # QUOTIENT
    # (division uses div + mflo)
    # --------------------
    div $t0, $t1    # quotient → LO

    mflo $t5        # load quotient

    la $a0, quot_msg
    li $v0, 4
    syscall

    move $a0, $t5
    li $v0, 1
    syscall

    la $a0, newline
    li $v0, 4
    syscall

    # Exit
    li $v0, 10
    syscall
