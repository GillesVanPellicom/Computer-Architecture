        .data
element_to_be_found = 9
start = 3
size = 15
array = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]

        .text
        # Variable dictionary
        # r2: start of the partiton to be searched
        # r3: end of the partition to be searched
        # r4: adress of element in memory
main:
        lw      r1, r0, 0               # load element to be found

        lw      r2, r0, 1               # set start to start location of the array
        ori     r3, 1                   # set r3 temporarily to 1
        lw      r4, r0, 2               # load size variable
        sub     r4, r4, r3              # subtract 1 from size
        add     r3, r4, r2              # set end to start + size - 1
        j       find_element            # start find element routine

find_element:
        gt      r4, r2, r3
        brnz    r4, element_not_found

        add     r4, r2, r3              # add start to end
        srl     r4, r4                  # devide start + end by two
        lw      r5, r4, 0               # load element at index

        eq      r6, r5, r1              # check if loaded element is equal to searched element
        brnz    r6, element_found       # jump to element found routine

        gt      r6, r5, r1              # check if element is in left side of partition
        brnz    r6, set_to_left         # set variables to left side of partition

        zero    r5
        ori     r5, 1                   # load one into register to subtract with
        add     r2, r4, r5              # subtract 1 from the index

        j       find_element            # call function again

set_to_left:
        zero    r5
        ori     r5, 1                   # load one into register to subtract with
        sub     r3, r4, r5              # subtract 1 from the index

        j       find_element            # call function again

element_found:
        j       exit

element_not_found:
        zero    r4
        lui     r4, -1
        ori     r4, -1                  # to store a 12 bit negative number both the upper and lower bits need to be set
        j       exit
        