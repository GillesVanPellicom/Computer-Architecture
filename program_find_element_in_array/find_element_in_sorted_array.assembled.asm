element_to_be_found = 9
start = 3
size = 15
array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
element_to_be_found = 9

main:
        lw      r1, r0, 0               # 0     1001001000000
        lw      r2, r0, 1               # 1     1001010000001
        ori     r3, 1                   # 2     1011011000001
        lw      r4, r0, 2               # 3     1001100000010
        sub     r4, r4, r3              # 4     0100100100011
        add     r3, r4, r2              # 5     0011011100010
        j       find_element            # 6     1111000001110
find_element:
        gt      r4, r2, r3              # 7     0110100010011
        brnz    r4, element_not_found   # 8     1101100010000
        add     r4, r2, r3              # 9     0011100010011
        srl     r4, r4                  # 10    0000100100100
        lw      r5, r4, 0               # 11    1001101100000
        eq      r6, r5, r1              # 12    0111110101001
        brnz    r6, element_found       # 13    1101110001010
        gt      r6, r5, r1              # 14    0110110101001
        brnz    r6, set_to_left         # 15    1101110000100
        zero    r5                      # 16    0000101000000
        ori     r5, 1                   # 17    1011101000001
        add     r2, r4, r5              # 18    0011010100101
        j       find_element            # 19    1111000001110
set_to_left:
        zero    r5                      # 20    0000101000000
        ori     r5, 1                   # 21    1011101000001
        sub     r3, r4, r5              # 22    0100011100101
        j       find_element            # 23    1111000001110
element_found:
        j       exit                    # 24    1111000111010
element_not_found:
        zero    r4                      # 25    0000100000000
        lui     r4, -1                  # 26    1100100111111
        ori     r4, -1                  # 27    1011100111111
        j       exit                    # 28    1111000111010