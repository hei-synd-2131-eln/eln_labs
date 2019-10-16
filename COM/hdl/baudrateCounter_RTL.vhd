ARCHITECTURE masterVersion OF baudrateCounter IS

  signal counterInt: unsigned(countOut'range);

BEGIN

  process (reset, clock)
  begin
    if reset = '1' then
      counterInt <= (others => '0');
    elsif rising_edge(clock) then
      if restartCounter = '1' then
        counterInt <= (others => '0');
      else
        counterInt <= counterInt + 1;
      end if;
    end if;
  end process;

  countOut <= counterInt;

END ARCHITECTURE masterVersion;
