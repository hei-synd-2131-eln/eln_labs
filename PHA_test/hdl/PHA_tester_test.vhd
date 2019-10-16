ARCHITECTURE test OF PHA_tester IS

  constant clockFrequency: real := 100.0E6;
  constant clockPeriod: time := 1.0/clockFrequency * 1 sec;

BEGIN
  ------------------------------------------------------------------------------
                                            -- count through all possible values
  buildPhase: process
  begin
    for index in 2**phaseDiff'length-1 downto 0 loop
      phaseDiff <= to_unsigned(index, phaseDiff'length);
      wait for clockPeriod;
    end loop;
    wait;
  end process buildPhase;

END ARCHITECTURE test;
