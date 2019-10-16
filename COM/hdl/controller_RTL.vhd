ARCHITECTURE RTL OF controller IS

  constant opCodeLength : integer := 5;

  signal aluOpSel: std_ulogic;
  signal regWriteEn: std_ulogic;

  signal flagsEn, flagsEnable: std_ulogic;
  signal carrySaved: std_ulogic;
  signal zeroSaved: std_ulogic;

  signal phase: std_ulogic;

BEGIN

  ------------------------------------------------------------------------------
                                                                 -- ALU controls
  selectdataSource: process(opCode)
  begin
    aluOpSel      <= '0';
    portInSel     <= '0';
    case opCode(opCodeLength-1 downto 0) is
      when "00000" => aluOpSel      <= '1';     -- load
      when "00010" => portInSel     <= '1';     -- input
      when "00101" => aluOpSel      <= '1';     -- and
      when "00110" => aluOpSel      <= '1';     -- or
      when "00111" => aluOpSel      <= '1';     -- xor
      when "01001" => aluOpSel      <= '1';     -- test
      when "01010" => aluOpSel      <= '1';     -- comp
      when "01100" => aluOpSel      <= '1';     -- add
      when "01101" => aluOpSel      <= '1';     -- addcy
      when "01110" => aluOpSel      <= '1';     -- sub
      when "01111" => aluOpSel      <= '1';     -- subcy
      when "10000" => aluOpSel      <= '1';     -- sh/rot
      when others  => aluOpSel      <= '-';
                      portInSel     <= '-';
    end case;
  end process selectdataSource;
  registerFileSel <= aluOpSel and      twoRegInstr;
  instrDataSel    <= aluOpSel and (not twoRegInstr);

  regWriteEn <= phase;

  regWriteTable: process(opCode, regWriteEn)
  begin
    case opCode(opCodeLength-1 downto 0) is
      when "00000" => regWrite <= regWriteEn;   -- load
      when "00010" => regWrite <= regWriteEn;   -- input
      when "00011" => regWrite <= regWriteEn;   -- fetch
      when "00101" => regWrite <= regWriteEn;   -- and
      when "00110" => regWrite <= regWriteEn;   -- or
      when "00111" => regWrite <= regWriteEn;   -- xor
      when "01100" => regWrite <= regWriteEn;   -- add
      when "01101" => regWrite <= regWriteEn;   -- addcy
      when "01110" => regWrite <= regWriteEn;   -- sub
      when "01111" => regWrite <= regWriteEn;   -- subcy
      when "10000" => regWrite <= regWriteEn;   -- sh/rot
      when others  => regWrite <= '0';
    end case;
  end process regWriteTable;

  ------------------------------------------------------------------------------
                                                                 -- I/O controls
  readStrobe  <= not(phase) when opCode = "00010" else '0';
  writeStrobe <= phase when opCode = "10110" else '0';

  ------------------------------------------------------------------------------
                                                                  -- Carry logic
  flagsEn <= '1';

  flagsEnableTable: process(opCode, flagsEn)
  begin
    case opCode(opCodeLength-1 downto 0) is
      when "00101" => flagsEnable <= flagsEn;   -- and
      when "00110" => flagsEnable <= flagsEn;   -- or
      when "00111" => flagsEnable <= flagsEn;   -- xor
      when "01001" => flagsEnable <= flagsEn;   -- test
      when "01010" => flagsEnable <= flagsEn;   -- compare
      when "01100" => flagsEnable <= flagsEn;   -- add
      when "01101" => flagsEnable <= flagsEn;   -- addcy
      when "01110" => flagsEnable <= flagsEn;   -- sub
      when "01111" => flagsEnable <= flagsEn;   -- subcy
      when "10000" => flagsEnable <= flagsEn;   -- sh/rot
      when others  => flagsEnable <= '0';
    end case;
  end process flagsEnableTable;

  saveCarries: process(reset, clock)
  begin
    if reset = '1' then
      carrySaved <= '0';
      zeroSaved <= '0';
    elsif rising_edge(clock) then
      if flagsEnable = '1' then
        carrySaved <= cOut;
        zeroSaved <= zero;
      end if;
    end if;
  end process saveCarries;

  cIn <= carrySaved;

  ------------------------------------------------------------------------------
                                                     -- Program counter controls
  buildPhases: process(reset, clock)
  begin
    if reset = '1' then
      phase <= '0';
    elsif rising_edge(clock) then
      phase <= not phase;
    end if;
  end process buildPhases;

  incPC <= phase;

END ARCHITECTURE RTL;
