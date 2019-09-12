-------------------------------------------------------------------------------
-- Algorithm:
--
--  LOAD    s0, 0A          ; load divisor
--  INPUT   s1              ; load dividend
--  LOAD    s2, 00          ; initialize 4-bit word
--  LOAD    s3, 00          ; initialize quotient (for quotient)
--  SL0     s1              ; push MSB to CY
--  SLA     s2              ; push CY to LSB
--  SL0     s1              ; push MSB-1 to CY
--  SLA     s2              ; push CY to LSB
--  SL0     s1              ; push MSB-2 to CY
--  SLA     s2              ; push CY to LSB
--  SL0     s1              ; push MSB-3 to CY
--  SLA     s2              ; push CY to LSB
--  SUB     s2, s0          ; substract divider
--  JUMP    NC <+n>         ; jump if positive
--  ADD     s2, s0          ; add back if negative
--  JUMP    <+2>            ; and don't increment quotient (for quotient)
--  ADD     s3, 01          ; increment quotient if positive (for quotient)
--  SL0     s3              ; shift partial quotient up (for quotient)
--  SL0     s1              ; push MSB-4 to CY
--  SLA     s2              ; push CY to LSB
--  SUB     s2, s0          ; substract divider
--  JUMP    NC <+n>         ; jump if positive
--  ADD     s2, s0          ; add back if negative
--  JUMP    <+2>            ; and don't increment quotient (for quotient)
--  ADD     s3, 01          ; increment quotient if positive (for quotient)
--  SL0     s3              ; shift partial quotient up (for quotient)
--  SL0     s1              ; push MSB-4 to CY
--  SLA     s2              ; push CY to LSB
--  SUB     s2, s0          ; substract divider
--  JUMP    NC <+n>         ; jump if positive
--  ADD     s2, s0          ; add back if negative
--  JUMP    <+2>            ; and don't increment quotient (for quotient)
--  ADD     s3, 01          ; increment quotient if positive (for quotient)
--  SL0     s3              ; shift partial quotient up (for quotient)
--  SL0     s1              ; push MSB-4 to CY
--  SLA     s2              ; push CY to LSB
--  SUB     s2, s0          ; substract divider
--  JUMP    NC <+n>         ; jump if positive
--  ADD     s2, s0          ; add back if negative
--  JUMP    <+2>            ; and don't increment quotient (for quotient)
--  ADD     s3, 01          ; increment quotient if positive (for quotient)
--  SL0     s3              ; shift partial quotient up (for quotient)
--  SL0     s1              ; push MSB-4 to CY
--  SLA     s2              ; push CY to LSB
--  SUB     s2, s0          ; substract divider
--  JUMP    NC <+2>         ; check if positive
--  ADD     s2, s0          ; add back if negative
--  JUMP    <+2>            ; and don't increment quotient (for quotient)
--  ADD     s3, 01          ; increment quotient if positive (for quotient)
--  OUTPUT  s2              ; output remainder
--  OUTPUT  s3              ; output quotient (for quotient)
-------------------------------------------------------------------------------


ARCHITECTURE divRem OF MIB_tester IS

  constant clockPeriod: time := 10 ns;
  constant instructionPeriod: time := 2*clockPeriod;
  signal clock_int: std_uLogic := '0';
  signal aluCode_int: std_uLogic_vector(4 downto 0);
  signal instruction: string(1 to 7);

BEGIN

  -----------------------------------------------------------------------------
                                                             -- clock and reset
  reset <= '1', '0' after clockPeriod/4;

  clock_int <= not clock_int after clockPeriod/2;
  clock <= transport clock_int after 4*clockPeriod/10;

  -----------------------------------------------------------------------------
                                                               -- test sequence
  microprocessorCode: process     
  begin       

    writeEnable <= '0';
    writeStrobe <= '0';

    ---------------------------------------------------------------------------
    --  LOAD    s0, 0A          ; load divisor
    ---------------------------------------------------------------------------
    portInOE            <= '0';
    instrDataOE         <= '1';
    registerFileOE      <= '0';
    carryIn             <= '-';
    aluCode_int         <= "00000";
    addressA            <= "00";
    addressB            <= "--";
    instrData           <= "00001010";
    wait for clockPeriod;
    writeEnable <= '1';
    wait for clockPeriod;
    writeEnable <= '0';

    ---------------------------------------------------------------------------
    --  INPUT   s1              ; load dividend
    ---------------------------------------------------------------------------
    portInOE            <= '1';
    instrDataOE         <= '0';
    registerFileOE      <= '0';
    carryIn             <= '-';
    aluCode_int         <= "00010";
    addressA            <= "01";
    addressB            <= "--";
    instrData           <= "--------";
    wait for clockPeriod;
    writeEnable <= '1';
    wait for clockPeriod;
    writeEnable <= '0';

    ---------------------------------------------------------------------------
    --  LOAD    s2, 00          ; initialize 4-bit word
    ---------------------------------------------------------------------------
    portInOE            <= '0';
    instrDataOE         <= '1';
    registerFileOE      <= '0';
    carryIn             <= '-';
    aluCode_int         <= "00000";
    addressA            <= "10";
    addressB            <= "--";
    instrData           <= "00000000";
    wait for clockPeriod;
    writeEnable <= '1';
    wait for clockPeriod;
    writeEnable <= '0';

    ---------------------------------------------------------------------------
    --  LOAD    s3, 00          ; initialize quotient
    ---------------------------------------------------------------------------
    portInOE            <= '0';
    instrDataOE         <= '1';
    registerFileOE      <= '0';
    carryIn             <= '-';
    aluCode_int         <= "00000";
    addressA            <= "11";
    addressB            <= "--";
    instrData           <= "00000000";
    wait for clockPeriod;
    writeEnable <= '1';
    wait for clockPeriod;
    writeEnable <= '0';

    for index in 1 to 4 loop

      -------------------------------------------------------------------------
      --  SL0     s1              ; push MSB to CY
      -------------------------------------------------------------------------
      portInOE            <= '0';
      instrDataOE         <= '1';
      registerFileOE      <= '0';
      carryIn             <= '0';
      aluCode_int         <= "10001";
      addressA            <= "01";
      addressB            <= "--";
      instrData           <= "--------";
      wait for clockPeriod;
      writeEnable <= '1';
      wait for clockPeriod;
      writeEnable <= '0';

      -------------------------------------------------------------------------
      --  SLA     s2              ; push CY to LSB
      -------------------------------------------------------------------------
      portInOE            <= '0';
      instrDataOE         <= '1';
      registerFileOE      <= '0';
      carryIn             <= cout;
      aluCode_int         <= "10001";
      addressA            <= "10";
      addressB            <= "--";
      instrData           <= "--------";
      wait for clockPeriod;
      writeEnable <= '1';
      wait for clockPeriod;
      writeEnable <= '0';

    end loop;

    for index in 1 to 5 loop

      -------------------------------------------------------------------------
      --  SUB     s2, s0          ; substract divider
      -------------------------------------------------------------------------
      portInOE            <= '0';
      instrDataOE         <= '0';
      registerFileOE      <= '1';
      carryIn             <= '0';
      aluCode_int         <= "01110";
      addressA            <= "10";
      addressB            <= "00";
      instrData           <= "--------";
      wait for clockPeriod;
      writeEnable <= '1';
      wait for clockPeriod;
      writeEnable <= '0';

      if cout = '1' then

        -------------------------------------------------------------------------
        --  ADD     s2, s0          ; add back if negative
        -------------------------------------------------------------------------
        portInOE            <= '0';
        instrDataOE         <= '0';
        registerFileOE      <= '1';
        carryIn             <= '-';
        aluCode_int         <= "01100";
        addressA            <= "10";
        addressB            <= "00";
        instrData           <= "--------";
        wait for clockPeriod;
        writeEnable <= '1';
        wait for clockPeriod;
        writeEnable <= '0';

      else

        -------------------------------------------------------------------------
        --  ADD     s3, 01          ; increment quotient if positive
        -------------------------------------------------------------------------
        portInOE            <= '0';
        instrDataOE         <= '1';
        registerFileOE      <= '0';
        carryIn             <= '-';
        aluCode_int         <= "01100";
        addressA            <= "11";
        addressB            <= "--";
        instrData           <= "00000001";
        wait for clockPeriod;
        writeEnable <= '1';
        wait for clockPeriod;
        writeEnable <= '0';

      end if;

      if index < 5 then

        -------------------------------------------------------------------------
        --  SL0     s3              ; shift partial quotient up
        -------------------------------------------------------------------------
        portInOE            <= '0';
        instrDataOE         <= '1';
        registerFileOE      <= '0';
        carryIn             <= '0';
        aluCode_int         <= "10001";
        addressA            <= "11";
        addressB            <= "--";
        instrData           <= "--------";
        wait for clockPeriod;
        writeEnable <= '1';
        wait for clockPeriod;
        writeEnable <= '0';

      end if;

      -------------------------------------------------------------------------
      --  SL0     s1              ; push MSB to CY
      -------------------------------------------------------------------------
      portInOE            <= '0';
      instrDataOE         <= '1';
      registerFileOE      <= '0';
      carryIn             <= '0';
      aluCode_int         <= "10001";
      addressA            <= "01";
      addressB            <= "--";
      instrData           <= "--------";
      wait for clockPeriod;
      writeEnable <= '1';
      wait for clockPeriod;
      writeEnable <= '0';

      -------------------------------------------------------------------------
      --  SLA     s2              ; push CY to LSB
      -------------------------------------------------------------------------
      portInOE            <= '0';
      instrDataOE         <= '1';
      registerFileOE      <= '0';
      carryIn             <= cout;
      aluCode_int         <= "10001";
      addressA            <= "10";
      addressB            <= "--";
      instrData           <= "--------";
      wait for clockPeriod;
      writeEnable <= '1';
      wait for clockPeriod;
      writeEnable <= '0';

    end loop;

    ---------------------------------------------------------------------------
    --  OUTPUT  s2              ; output remainder
    ---------------------------------------------------------------------------
    portInOE            <= '0';
    instrDataOE         <= '1';
    registerFileOE      <= '0';
    carryIn             <= '-';
    aluCode_int         <= "10110";
    addressA            <= "10";
    addressB            <= "--";
    instrData           <= "--------";
    wait for clockPeriod;
    writeStrobe <= '1';
    wait for clockPeriod;
    writeStrobe <= '0';

    ---------------------------------------------------------------------------
    --  OUTPUT  s3              ; output quotient
    ---------------------------------------------------------------------------
    portInOE            <= '0';
    instrDataOE         <= '1';
    registerFileOE      <= '0';
    carryIn             <= '-';
    aluCode_int         <= "10110";
    addressA            <= "11";
    addressB            <= "--";
    instrData           <= "--------";
    wait for clockPeriod;
    writeStrobe <= '1';
    wait for clockPeriod;
    writeStrobe <= '0';

    wait;

  end process microprocessorCode;

  aluCode <= aluCode_int;

  -----------------------------------------------------------------------------
                                                           -- debug information
  ALUInstrDecode: process(aluCode_int)     
  begin       
    case to_integer(unsigned(aluCode_int)) is
      when  0 => instruction <= "LOAD   ";
      when  2 => instruction <= "INPUT  ";
      when  3 => instruction <= "FETCH  ";
      when  5 => instruction <= "AND    ";
      when  6 => instruction <= "OR     ";
      when  7 => instruction <= "XOR    ";
      when  9 => instruction <= "TEST   ";
      when 10 => instruction <= "COMPARE";
      when 12 => instruction <= "ADD    ";
      when 13 => instruction <= "ADDC   ";
      when 14 => instruction <= "SUB    ";
      when 15 => instruction <= "SUBC   ";
      when 16 => instruction <= "SR     ";
      when 17 => instruction <= "SL     ";
      when 22 => instruction <= "OUT    ";
      when others => instruction <= "XXXXXXX";
    end case;
  end process ALUInstrDecode;

END ARCHITECTURE divRem;

