ARCHITECTURE RTL OF counter IS

  signal sCountOut: unsigned(countOut'range);

BEGIN

  count: process(reset, clock)
  begin
    if reset = '1' then
      sCountOut <= (others => '0');
    elsif rising_edge(clock) then
      sCountOut <= sCountOut + 1;
    end if;
  end process count;

  countOut <= sCountOut;

END ARCHITECTURE RTL;

