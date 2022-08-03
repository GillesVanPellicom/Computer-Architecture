element_to_be_found = 9                 # 0
start = 0                               # 1
size = 15                               # 2
array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]      # 3
element_to_be_found = 9                 # 4

main:
        lw      r1, r0, 0               # 5
        lw      r2, r0, 1               # 6
        ori     r3, 1                   # 7
        lw      r4, r2, 2               # 8
        sub     r4, r4, r3              # 9
        add     r3, r4, r2              # 10
        j       find_element            # 11
find_element:
        gt      r4, r2, r3              # 12
        brnz    r4, element_not_found   # 13
        add     r4, r2, r3              # 14
        sll     r4, r4                  # 15
        lw      r5, r4, 0               # 16
        eq      r5, r4, r1              # 17
        brnz    r5, element_found       # 18
        gt      r5, r4, r1              # 19
        brnz    r5, set_to_left         # 20
        ori     r5, 1                   # 21
        sub     r3, r4, r5              # 22
        j       find_element            # 23
set_to_left:
        ori     r5, 1                   # 24
        add     r2, r4, r5              # 25
        j       find_element            # 26
element_found:
        j       exit                    # 27
element_not_found:
        ori     r4, -1                  # 28
        lui     r4, -1                  # 29
        j       exit                    # 30