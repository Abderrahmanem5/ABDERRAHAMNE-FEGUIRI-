.data
prompt_hex: .asciiz "Enter a hexadecimal number: "
mask_msg:   .asciiz "Lower 8 bits = "
shift_msg:  .asciiz "After shifting right by 2 bits = "
newline:    .asciiz "\n"

.text
main:
    # Ask for hex
    la $a0, prompt_hex
    li $v0, 4
    syscall

    li $v0, 5    # read number as integer
    syscall
    move $t0, $v0

    # Mask lower 8 bits
    li $t1, 0xFF
    and $t2, $t0, $t1

    la $a0, mask_msg
    li $v0, 4
    syscall
    move $a0, $t2
    li $v0, 34     # print hex
    syscall
    la $a0, newline
    li $v0, 4
    syscall

    # Shift right by 2
    srl $t3, $t2, 2

    la $a0, shift_msg
    li $v0, 4
    syscall
    move $a0, $t3
    li $v0, 34
    syscall
    la $a0, newline
    li $v0, 4
    syscall

    # exit
    li $v0, 10
    syscall
