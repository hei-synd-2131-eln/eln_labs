ARCHITECTURE RTL OF programCounter IS

  signal pCounter: unsigned(progCounter'range);

BEGIN

  updateProgramCounter: process(reset, clock)
  begin
    if reset = '1' then
      pCounter <= (others => '0');
    elsif rising_edge(clock) then
      if incPC = '1' then
        pCounter <= pCounter + 1;
      end if;
    end if;
  end process updateProgramCounter;

  progCounter <= pCounter;

END ARCHITECTURE RTL;
