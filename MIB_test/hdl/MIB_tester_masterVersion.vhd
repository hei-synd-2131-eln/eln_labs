-------------------------------------------------------------------------------
-- Algorithm:
--
--  LOAD    s3, FF  ; load stop bit
--  OUTPUT  s3      ; output stop bit
--  LOAD    s3, s3  ; no operation
--  LOAD    s3, s3  ; no operation
--  LOAD    s3, s3  ; no operation
--  LOAD    s3, s3  ; no operation
--  LOAD    s0, 00  ; load start bit
--  OUTPUT  s0      ; output start bit
--  INPUT   s1      ; load word to send
--  OUTPUT  s1      ; output word, LSB is considered
--  SR0     s1      ; shift word, bit 1 -> LSB
--  OUTPUT  s1      ; output bit 1
--  SR0     s1      ; bit 2 -> LSB
--  OUTPUT  s1      ; output bit 2
--  SR0     s1      ; bit 3 -> LSB
--  OUTPUT  s1      ; output bit 3
--  SR0     s1      ; bit 4 -> LSB
--  OUTPUT  s1      ; output bit 4
--  SR0     s1      ; bit 5 -> LSB
--  OUTPUT  s1      ; output bit 5
--  SR0     s1      ; bit 6 -> LSB
--  OUTPUT  s1      ; output bit 6
--  SR0     s1      ; bit 7 -> LSB
--  OUTPUT  s1      ; output bit 7
--  LOAD    s3, s3  ; no operation
--  OUTPUT  s3      ; output stop bit
-------------------------------------------------------------------------------


ARCHITECTURE masterVersion OF MIB_tester IS

  constant clockPeriod: time := 10 ns;
  constant instructionPeriod: time := 2*clockPeriod;
  signal clock_int: std_uLogic := '0';

  signal aluCode_int: std_uLogic_vector(4 downto 0);
  signal portInOE_int, instrDataOE_int, registerFileOE_int: std_uLogic;
  signal instruction: string(1 to 7);

BEGIN

  -----------------------------------------------------------------------------
                                                             -- clock and reset
  reset <= '1', '0' after clockPeriod/4;

  clock_int <= not clock_int after clockPeriod/2;
  clock <= transport clock_int after 9*clockPeriod/10;

  -----------------------------------------------------------------------------
                                                               -- test sequence
  microprocessorCode: process
  begin

    writeEnable <= '0';
    writeStrobe <= '0';

    ---------------------------------------------------------------------------
    --  LOAD    s3, FF          ; load stop bit
    ---------------------------------------------------------------------------
    portInOE_int        <= '0';
    instrDataOE_int     <= '1';
    registerFileOE_int  <= '0';
    carryIn             <= '-';
    aluCode_int         <= "00000";
    addressA            <= "11";
    addressB            <= "--";
    instrData           <= "11111111";
    wait for clockPeriod;
    writeEnable <= '1';
    wait for clockPeriod;
    writeEnable <= '0';

    ---------------------------------------------------------------------------
    --  OUTPUT  s3              ; output stop bit
    ---------------------------------------------------------------------------
    portInOE_int        <= '0';
    instrDataOE_int     <= '1';
    registerFileOE_int  <= '0';
    carryIn             <= '-';
    aluCode_int         <= "10110";
    addressA            <= "11";
    addressB            <= "--";
    instrData           <= "--------";
    wait for clockPeriod;
    writeStrobe <= '1';
    wait for clockPeriod;
    writeStrobe <= '0';

    for index in 1 to 4 loop
      -------------------------------------------------------------------------
      --  LOAD    s3, s3          ; no operation
      -------------------------------------------------------------------------
      portInOE_int        <= '0';
      instrDataOE_int     <= '0';
      registerFileOE_int  <= '1';
      carryIn             <= '-';
      aluCode_int         <= "00000";
      addressA            <= "11";
      addressB            <= "11";
      instrData           <= "--------";
      wait for clockPeriod;
      writeEnable <= '1';
      wait for clockPeriod;
      writeEnable <= '0';
    end loop;

    ---------------------------------------------------------------------------
    --  LOAD    s0, 80          ; load start bit
    ---------------------------------------------------------------------------
    portInOE_int        <= '0';
    instrDataOE_int     <= '1';
    registerFileOE_int  <= '0';
    carryIn             <= '-';
    aluCode_int         <= "00000";
    addressA            <= "00";
    addressB            <= "--";
    instrData           <= "10000000";
    wait for clockPeriod;
    writeEnable <= '1';
    wait for clockPeriod;
    writeEnable <= '0';

    ---------------------------------------------------------------------------
    --  OUTPUT  s0              ; output start bit
    ---------------------------------------------------------------------------
    portInOE_int        <= '0';
    instrDataOE_int     <= '1';
    registerFileOE_int  <= '0';
    carryIn             <= '-';
    aluCode_int         <= "10110";
    addressA            <= "00";
    addressB            <= "--";
    instrData           <= "--------";
    wait for clockPeriod;
    writeStrobe <= '1';
    wait for clockPeriod;
    writeStrobe <= '0';

    ---------------------------------------------------------------------------
    --  INPUT   s1              ; load word to send
    ---------------------------------------------------------------------------
    portInOE_int        <= '1';
    instrDataOE_int     <= '0';
    registerFileOE_int  <= '0';
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
      --  OUTPUT  s1              ; output data bit
      -------------------------------------------------------------------------
      portInOE_int        <= '0';
      instrDataOE_int     <= '1';
      registerFileOE_int  <= '0';
      carryIn             <= '-';
      aluCode_int         <= "10110";
      addressA            <= "01";
      addressB            <= "--";
      instrData           <= "--------";
      wait for clockPeriod;
      writeStrobe <= '1';
      wait for clockPeriod;
      writeStrobe <= '0';

      -------------------------------------------------------------------------
      --  SR0     s1              ; shift bits down
      -------------------------------------------------------------------------
      portInOE_int        <= '0';
      instrDataOE_int     <= '1';
      registerFileOE_int  <= '0';
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
    --  OUTPUT  s1              ; output data bit
    ---------------------------------------------------------------------------
    portInOE_int        <= '0';
    instrDataOE_int     <= '1';
    registerFileOE_int  <= '0';
    carryIn             <= '-';
    aluCode_int         <= "10110";
    addressA            <= "01";
    addressB            <= "--";
    instrData           <= "--------";
    wait for clockPeriod;
    writeStrobe <= '1';
    wait for clockPeriod;
    writeStrobe <= '0';

    -------------------------------------------------------------------------
    --  LOAD    s3, s3          ; no operation
    -------------------------------------------------------------------------
    portInOE_int        <= '0';
    instrDataOE_int     <= '0';
    registerFileOE_int  <= '1';
    carryIn             <= '-';
    aluCode_int         <= "00000";
    addressA            <= "11";
    addressB            <= "11";
    instrData           <= "--------";
    wait for clockPeriod;
    writeEnable <= '1';
    wait for clockPeriod;
    writeEnable <= '0';

    ---------------------------------------------------------------------------
    --  OUTPUT  s3              ; output stop bit
    ---------------------------------------------------------------------------
    portInOE_int        <= '0';
    instrDataOE_int     <= '1';
    registerFileOE_int  <= '0';
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
  portInOE <= portInOE_int;
  instrDataOE <= instrDataOE_int;
  registerFileOE <= registerFileOE_int;

  -----------------------------------------------------------------------------
                                                       -- verify bus B tristate
  testBusB: process
    variable busDriverCount: natural;
  begin
    wait on portInOE_int, instrDataOE_int, registerFileOE_int;
    wait for 1 ns;
    busDriverCount := 0;
    if portInOE_int = '1' then busDriverCount := busDriverCount+1; end if;
    if instrDataOE_int = '1' then busDriverCount := busDriverCount+1; end if;
    if registerFileOE_int = '1' then busDriverCount := busDriverCount+1; end if;
    assert busDriverCount >= 1
      report "bus B is tri-state!"
      severity error;
    assert busDriverCount <= 1
      report "collision on bus B!"
      severity error;
  end process testBusB;

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

END ARCHITECTURE masterVersion;
