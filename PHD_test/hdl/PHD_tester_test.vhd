ARCHITECTURE test OF PHD_tester IS

  constant clockFrequency: real := 66.0E6;
  constant clockPeriod: time := 1.0/clockFrequency * 1 sec;
  signal clock_int: std_ulogic := '0';

  constant refFreqDivide: positive := 2**phaseBitNb * 7/8;
  constant fbFreqDiff: positive := 2**phaseBitNb * 1/16;
  signal fbFreqDivide: positive := refFreqDivide;

BEGIN
  -----------------------------------------------------------------------------
                                                             -- clock and reset
  reset <= '1', '0' after 4*clockPeriod;

  clock_int <= not clock_int after clockPeriod/2;
  clock <= transport clock_int after 9*clockPeriod/10;

  -----------------------------------------------------------------------------
                                                               -- phase signals
  process
  begin
    phaseRef <= '0';
    for index in 1 to refFreqDivide-1 loop
      wait until rising_edge(clock_int);
    end loop;
    phaseRef <= '1';
    wait until rising_edge(clock_int);
  end process;

  fbFreqDivide <=
    refFreqDivide - fbFreqDiff,
    refFreqDivide + fbFreqDiff after 100 us;

  process
  begin
    phaseFb <= '0';
    for index in 1 to fbFreqDivide-1 loop
      wait until rising_edge(clock_int);
    end loop;
    phaseFb <= '1';
    wait until rising_edge(clock_int);
  end process;

END ARCHITECTURE test;
