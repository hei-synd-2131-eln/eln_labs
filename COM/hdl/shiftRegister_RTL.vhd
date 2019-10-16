ARCHITECTURE masterVersion OF shiftRegister IS

  signal shiftReg: std_ulogic_vector(dataOut'range);

BEGIN

  process (reset, clock)
  begin
    if reset = '1' then
      shiftReg <= (others => '0');
    elsif rising_edge(clock) then
      if shiftEn = '1' then
        shiftReg(shiftReg'high) <= serialIn;
        shiftReg(shiftReg'high-1 downto 0) <= shiftReg(shiftReg'high downto 1);
      end if;
    end if;
  end process;

  dataOut <= shiftReg;

END ARCHITECTURE masterVersion;
