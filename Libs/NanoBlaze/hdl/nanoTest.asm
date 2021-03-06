                ;===============================================================
                ; nanoTest.asm
                ;   Used for checking the NanoBlaze instruction set
                ;===============================================================
                ; 1) Test logical operations with direct values
                ;---------------------------------------------------------------
								LOAD      s7, 01
                CONSTANT  testPattern, 0F
                ;---------------------------------------------------------------
                ; Test "LOAD", "AND"
                ;---------------------------------------------------------------
								LOAD      s0, testPattern
								AND       s0, 33
								COMPARE   s0, 03
								JUMP      NZ, error
                ;---------------------------------------------------------------
                ; Test "OR"
                ;---------------------------------------------------------------
								LOAD      s1, testPattern
								OR        s1, 33
								COMPARE   s1, 3F
								JUMP      NZ, error
                ;---------------------------------------------------------------
                ; Test "XOR"
                ;---------------------------------------------------------------
								LOAD      s2, testPattern
								XOR       s2, 33
								COMPARE   s2, 3C
								JUMP      NZ, error
                ;===============================================================
                ; 2) Test logical operations with registers
                ;---------------------------------------------------------------
								ADD       s7, 01
                ;---------------------------------------------------------------
                ; Test "LOAD"
                ;---------------------------------------------------------------
                LOAD      s0, 33
                LOAD      s3, s0
                COMPARE   s3, 33
                JUMP      NZ, error
                ;---------------------------------------------------------------
                ; Test "AND"
                ;---------------------------------------------------------------
                LOAD      s0, 0F
                AND       s0, s3
                COMPARE   s0, 03
                JUMP      NZ, error
                ;---------------------------------------------------------------
                ; Test "OR"
                ;---------------------------------------------------------------
                LOAD      s1, 0F
                OR        s1, s3
                COMPARE   s1, 3F
                JUMP      NZ, error
                ;---------------------------------------------------------------
                ; Test "XOR"
                ;---------------------------------------------------------------
                LOAD      s2, 0F
                XOR       s2, s3
                COMPARE   s2, 3C
                JUMP      NZ, error
                ;===============================================================
                ; 3) Test arithmetic operations with constants
                ;---------------------------------------------------------------
								ADD       s7, 01
                ;---------------------------------------------------------------
                ; Test "ADD" and "ADDCY"
                ;---------------------------------------------------------------
                LOAD      s0, 0F
                ADD       s0, 31        ;  40
                ADDCY     s0, F0        ; 130
                ADDCY     s0, F0        ; 121
                ADD       s0, 0F        ;  30
                COMPARE   s0, 30
                JUMP      NZ, error
                ;---------------------------------------------------------------
                ; Test "SUB" and "SUBCY"
                ;---------------------------------------------------------------
                LOAD      s1, 0F
                SUB       s1, 0C        ;  03
                SUBCY     s1, F0        ; 113
                SUBCY     s1, F0        ;  22
                SUB       s1, 01        ;  21
                COMPARE   s1, 21
                JUMP      NZ, error
                ;===============================================================
                ; 4) Test arithmetic operations with registers
                ;---------------------------------------------------------------
								ADD       s7, 01
                ;---------------------------------------------------------------
                ; Test "ADD" and "ADDCY"
                ;---------------------------------------------------------------
                LOAD      s0, 0F
                LOAD      s1, 31
                LOAD      s2, F0
                LOAD      s3, 0F
                ADD       s0, s1        ;  40
                ADDCY     s0, s2        ; 130
                ADDCY     s0, s2        ; 121
                ADD       s0, s3        ;  30
                COMPARE   s0, 30
                JUMP      NZ, error
                ;---------------------------------------------------------------
                ; Test "SUB" and "SUBCY"
                ;---------------------------------------------------------------
                LOAD      s1, 0F
                LOAD      s0, 0C
                LOAD      s2, F0
                LOAD      s3, 01
                SUB       s1, s0        ;  03
                SUBCY     s1, s2        ; 113
                SUBCY     s1, s2        ;  22
                SUB       s1, s3        ;  21
                COMPARE   s1, 21
                JUMP      NZ, error
                ;===============================================================
                ; 5) Test shifts
                ;---------------------------------------------------------------
								ADD       s7, 01
                ;---------------------------------------------------------------
                ; Test shift right
                ;---------------------------------------------------------------
                LOAD      s0, 0F        ; 0F
                SR0       s0            ; 07
                SRX       s0            ; 03
                SR1       s0            ; 81
                SRX       s0            ; C0, C=1
                SRA       s0            ; E0, C=0
                SRA       s0            ; 70
                COMPARE   s0, 70
                JUMP      NZ, error
                ;---------------------------------------------------------------
                ; Test shift left
                ;---------------------------------------------------------------
                LOAD      s1, F0        ; FO
                SL0       s1            ; E0
                SLX       s1            ; C0
                SL1       s1            ; 81
                SLX       s1            ; 03, C=1
                SLA       s1            ; 07, C=0
                SLA       s1            ; 0E
                COMPARE   s1, 0E
                JUMP      NZ, error
                ;===============================================================
                ; 6) Test comparison operators
                ;---------------------------------------------------------------
								ADD       s7, 01
                ;---------------------------------------------------------------
                ; Test "COMPARE"
                ;---------------------------------------------------------------
                LOAD      s0, 0F
                COMPARE   s0, F0        ; A < B => C=1
                JUMP      NC, error
                COMPARE   s0, F0        ; A < B => Z=0
                JUMP      Z, error
                COMPARE   s0, s0        ; A = B => Z=1
                JUMP      NZ, error
                COMPARE   s0, 08        ; A > B => C=0
                JUMP      C, error
                COMPARE   s0, 08        ; A > B => Z=0
                JUMP      Z, error
                ;---------------------------------------------------------------
                ; Test "TEST"
                ;---------------------------------------------------------------
                LOAD      s0, 0F
                TEST      s0, F0        ; AND is 00 => Z=1
                JUMP      NZ, error
                TEST      s0, FF        ; AND is 0F => Z=0
                JUMP      Z, error
                ;===============================================================
                ; 7) Test INPUT and OUTPUT operators
                ;---------------------------------------------------------------
								ADD       s7, 01
                ;---------------------------------------------------------------
                ; Test "INPUT" and "OUTPUT" direct
                ;
                ; The testbench should invert the word written at address FC.
                ;---------------------------------------------------------------
                LOAD      s0, AA
                OUTPUT    s0, FC
                INPUT     s1, FC
                COMPARE   s1, 55
                JUMP      NZ, error
                ;---------------------------------------------------------------
                ; Test "INPUT" and "OUTPUT" indexed
                ;---------------------------------------------------------------
                LOAD      s0, CC
                LOAD      s2, FC
                OUTPUT    s0, (s2)
                INPUT     s1, (s2)
                COMPARE   s1, 33
                JUMP      NZ, error
                ;===============================================================
                ; 8) Test STORE and FETCH operators
                ;---------------------------------------------------------------
								ADD       s7, 01
                ;---------------------------------------------------------------
                ; Test "STORE" and "FETCH" direct
                ;---------------------------------------------------------------
                LOAD      s0, 0F
                STORE     s0, 03
                FETCH     s1, 03
                COMPARE   s1, 0F
                JUMP      NZ, error
                ;---------------------------------------------------------------
                ; Test "STORE" and "FETCH" indexed
                ;---------------------------------------------------------------
                LOAD      s0, F0
                LOAD      s2, 04
                STORE     s0, (s2)
                FETCH     s1, (s2)
                COMPARE   s1, F0
                JUMP      NZ, error
                ;===============================================================
                ; 9) Test JUMP instructions
                ;---------------------------------------------------------------
								ADD       s7, 01
                ;---------------------------------------------------------------
                ; Test "JUMP NC"
                ;---------------------------------------------------------------
                LOAD      s0, F0
                ADD       s0, 00        ; s0=F0, C=0, Z=0
                JUMP      NC, continue1
                JUMP      error
                ;---------------------------------------------------------------
                ; Test "JUMP NZ"
                ;---------------------------------------------------------------
     continue1: ADD       s0, 00        ; s0=F0, C=0, Z=0
                JUMP      NZ, continue2
                JUMP      error
                ;---------------------------------------------------------------
                ; Test "JUMP C"
                ;---------------------------------------------------------------
     continue2: ADD       s0, F0        ; s0=E0, C=1, Z=0
                JUMP      C, continue3
                JUMP      error
                ;---------------------------------------------------------------
                ; Test "JUMP Z"
                ;---------------------------------------------------------------
     continue3: SUB       s0, E0        ; s0=00, C=0, Z=1
                JUMP      Z, continue4
                JUMP      error
     continue4: NOP
                ;===============================================================
                ; 10) Test call instructions
                ;---------------------------------------------------------------
								ADD       s7, 01
                ;---------------------------------------------------------------
                ; define subroutine
                ;---------------------------------------------------------------
                JUMP      continue5
      subRetDo: ADD       s0, 01
                RETURN
                JUMP      error
                ;---------------------------------------------------------------
                ; Test "CALL"
                ;---------------------------------------------------------------
     continue5: LOAD      s0, 00
                LOAD      s1, F0
                CALL      subRetDo      ; s0=01
                ;---------------------------------------------------------------
                ; Test "CALL NC"
                ;---------------------------------------------------------------
                ADD       s1, 00        ; s1=F0, C=0, Z=0
                CALL      NC, subRetDo  ; s0=02
                ;---------------------------------------------------------------
                ; Test "CALL NZ"
                ;---------------------------------------------------------------
                ADD       s1, 00        ; s1=F0, C=0, Z=0
                CALL      NZ, subRetDo  ; s0=03
                ;---------------------------------------------------------------
                ; Test "CALL C"
                ;---------------------------------------------------------------
                ADD       s1, F0        ; s0=E0, C=1, Z=0
                CALL      C, subRetDo   ; s0=04
                ;---------------------------------------------------------------
                ; Test "CALL Z"
                ;---------------------------------------------------------------
                SUB       s1, E0        ; s0=00, C=0, Z=1
                CALL      Z, subRetDo   ; s0=05
                COMPARE   s0, 05
                jump      nz, error
                ;===============================================================
                ; 11) Test call return instructions
                ;---------------------------------------------------------------
								ADD       s7, 01
                ;---------------------------------------------------------------
                ; define subroutines
                ;---------------------------------------------------------------
                JUMP      continue6
      subRetNC: ADD       s0, 01
                RETURN    NC
                JUMP      error
      subRetNZ: ADD       s0, 01
                RETURN    NZ
                JUMP      error
       subRetC: ADD       s0, 01
                RETURN    C
                JUMP      error
       subRetZ: ADD       s0, 01
                RETURN    Z
                JUMP      error
                ;---------------------------------------------------------------
                ; Test "RETURN NC"
                ;---------------------------------------------------------------
     continue6: LOAD      s0, 00        ; increment will give C=0, Z=0
                CALL      NC, subRetNC
                ;---------------------------------------------------------------
                ; Test "RETURN NZ"
                ;---------------------------------------------------------------
                LOAD      s0, 00        ; increment will give C=0, Z=0
                CALL      NZ, subRetNZ
                ;---------------------------------------------------------------
                ; Test "RETURN C"
                ;---------------------------------------------------------------
                LOAD      s0, FF        ; increment will give C=1, Z=1
                CALL      C, subRetC
                ;---------------------------------------------------------------
                ; Test "RETURN Z"
                ;---------------------------------------------------------------
                LOAD      s0, FF        ; increment will give C=1, Z=1
                CALL      Z, subRetZ
                ;===============================================================
                ; End of tests
                ;
                ; The testbench should react if value 1 is written to address 00.
                ;---------------------------------------------------------------
                LOAD      s0, 01
                OUTPUT    s0, 00
                JUMP      endOfMemory
                ;===============================================================
                ; Assert error
                ;
                ; The testbench should react if value 0 is written to address 00.
                ;---------------------------------------------------------------
ADDRESS 3FD
         error: LOAD      s0, 00
                OUTPUT    s0, 00
                ;===============================================================
                ; End of instruction memory
                ;---------------------------------------------------------------
   endOfMemory: JUMP      endOfMemory
