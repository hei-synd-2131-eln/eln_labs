ARCHITECTURE test OF MIB_tester IS

  constant clockPeriod: time := 10 ns;
  constant instructionPeriod: time := 2*clockPeriod;
  signal sClock: std_uLogic := '0';
  signal sALUCode: std_uLogic_vector(4 downto 0);
  signal instruction: string(1 to 4);

BEGIN

  reset <= '1', '0' after clockPeriod/4;

  sClock <= not sClock after clockPeriod/2;
  clock <= transport sClock after 4*clockPeriod/10;
  
  carryIn <= '-';
  ALUCode <= sAluCode;

  microprocessorCode: process     
  begin       
    
    writeEnable <= '0';
    writeStrobe <= '0';
    
    ---------------------------------------------------------------------------
    --  LOAD    s3, FF          ; load stop bit
    ---------------------------------------------------------------------------
    portInOE            <= '0';
    instrDataOE         <= '1';
    registerFileOE      <= '0';
    sAluCode            <= "00000";
    addressA            <= "11";
    addressB            <= "--";
    instrData           <= "11111111";
    wait for clockPeriod;
    writeEnable <= '1';
    wait for clockPeriod;
    writeEnable <= '0';

    ---------------------------------------------------------------------------
    --  Output    s3            ; output stop bit
    ---------------------------------------------------------------------------
    portInOE            <= '0';
    instrDataOE         <= '1';
    registerFileOE      <= '0';
    sAluCode            <= "01110";
    addressA            <= "11";
    addressB            <= "--";
    instrData           <= "--------";
    wait for clockPeriod;
    writeStrobe <= '1';
    wait for clockPeriod;
    writeStrobe <= '0';
    

    
    wait;
  
  end process microprocessorCode;
      
  ALUInstrDecode: process(sAluCode)     
  begin       
    case sAluCode is
      when "00000" => instruction <= "LOAD";
      when "00001" => instruction <= "AND ";
      when "00010" => instruction <= "OR  ";
      when "00011" => instruction <= "XOR ";
      when "00100" => instruction <= "ADD ";
      when "00101" => instruction <= "ADDC";
      when "00110" => instruction <= "SUB ";
      when "00111" => instruction <= "SUBC";
      when "01010" => instruction <= "IN  ";
      when "01011" => instruction <= "IN  ";
      when "01101" => instruction <= "SL  ";  
      when "11101" => instruction <= "SR  ";
      when "01110" => instruction <= "OUT ";
      when "01111" => instruction <= "OUT ";
      when others => instruction <= "XXXX";
    end case;
  end process ALUInstrDecode;
      
END test;
