-------------------------------------------------------------------------------
-- Algorithm:
--
--  LOAD    s0, 01          ; initialize result
--  INPUT   s1              ; load word to calculate parity from
--  LOAD    s2, s1          ; copy s1 before mask (unnecessary)
--  AND     s2, 01          ; mask all but LSB (unnecessary)
--  XOR     s0, s2          ; parity, bit 0
--  SR0     s1              ; shift word for next bit
--  LOAD    s2, s1          ; copy s1 before mask
--  AND     s2, 01          ; mask all but LSB (unnecessary)
--  XOR     s0, s2          ; parity, bit 1
--  SR0     s1              ; shift word for next bit
--  LOAD    s2, s1          ; copy s1 before mask
--  AND     s2, 01          ; mask all but LSB (unnecessary)
--  XOR     s0, s2          ; parity, bit 2
--  SR0     s1              ; shift word for next bit
--  LOAD    s2, s1          ; copy s1 before mask
--  AND     s2, 01          ; mask all but LSB (unnecessary)
--  XOR     s0, s2          ; parity, bit 3
--  SR0     s1              ; shift word for next bit
--  LOAD    s2, s1          ; copy s1 before mask
--  AND     s2, 01          ; mask all but LSB (unnecessary)
--  XOR     s0, s2          ; parity, bit 4
--  SR0     s1              ; shift word for next bit
--  LOAD    s2, s1          ; copy s1 before mask
--  AND     s2, 01          ; mask all but LSB (unnecessary)
--  XOR     s0, s2          ; parity, bit 5
--  SR0     s1              ; shift word for next bit
--  LOAD    s2, s1          ; copy s1 before mask
--  AND     s2, 01          ; mask all but LSB (unnecessary)
--  XOR     s0, s2          ; parity, bit 6
--  SR0     s1              ; shift word for next bit
--  LOAD    s2, s1          ; copy s1 before mask
--  AND     s2, 01          ; mask all but LSB (unnecessary)
--  XOR     s0, s2          ; parity, bit 7
--  OUTPUT  s0              ; output parity bit
-------------------------------------------------------------------------------


ARCHITECTURE parity_masterVersion OF MIB_tester IS

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
    --  LOAD    s0, 01          ; initialize result
    ---------------------------------------------------------------------------
    portInOE            <= '0';
    instrDataOE         <= '1';
    registerFileOE      <= '0';
    carryIn             <= '-';
    aluCode_int         <= "00000";
    addressA            <= "00";
    addressB            <= "--";
    instrData           <= "00000001";
    wait for clockPeriod;
    writeEnable <= '1';
    wait for clockPeriod;
    writeEnable <= '0';

    ---------------------------------------------------------------------------
    --  INPUT   s1              ; load word to calculate parity from
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

    for index in 1 to 7 loop

      -------------------------------------------------------------------------
      --  LOAD    s2, s1          ; copy s1 before mask (unnecessary)
      -------------------------------------------------------------------------
      portInOE            <= '0';
      instrDataOE         <= '0';
      registerFileOE      <= '1';
      carryIn             <= '-';
      aluCode_int         <= "00000";
      addressA            <= "10";
      addressB            <= "01";
      instrData           <= "--------";
      wait for clockPeriod;
      writeEnable <= '1';
      wait for clockPeriod;
      writeEnable <= '0';

      -------------------------------------------------------------------------
      --  AND     s2, 01          ; mask all but LSB (unnecessary)
      -------------------------------------------------------------------------
      portInOE            <= '0';
      instrDataOE         <= '1';
      registerFileOE      <= '0';
      carryIn             <= '-';
      aluCode_int         <= "00101";
      addressA            <= "10";
      addressB            <= "--";
      instrData           <= "00000001";
      wait for clockPeriod;
      writeEnable <= '1';
      wait for clockPeriod;
      writeEnable <= '0';

      -------------------------------------------------------------------------
      --  XOR     s0, s2          ; parity, bit 0
      -------------------------------------------------------------------------
      portInOE            <= '0';
      instrDataOE         <= '0';
      registerFileOE      <= '1';
      carryIn             <= '-';
      aluCode_int         <= "00111";
      addressA            <= "00";
      addressB            <= "10";
      instrData           <= "--------";
      wait for clockPeriod;
      writeEnable <= '1';
      wait for clockPeriod;
      writeEnable <= '0';

      -------------------------------------------------------------------------
      --  SR0     s1              ; shift bits down
      -------------------------------------------------------------------------
      portInOE            <= '0';
      instrDataOE         <= '1';
      registerFileOE      <= '0';
      carryIn             <= '0';
      aluCode_int         <= "10000";
      addressA            <= "01";
      addressB            <= "--";
      instrData           <= "--------";
      wait for clockPeriod;
      writeEnable <= '1';
      wait for clockPeriod;
      writeEnable <= '0';

    end loop;

    ---------------------------------------------------------------------------
    --  OUTPUT  s0              ; output parity bit
    ---------------------------------------------------------------------------
    portInOE            <= '0';
    instrDataOE         <= '1';
    registerFileOE      <= '0';
    carryIn             <= '-';
    aluCode_int         <= "10110";
    addressA            <= "00";
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

END ARCHITECTURE parity_masterVersion;
