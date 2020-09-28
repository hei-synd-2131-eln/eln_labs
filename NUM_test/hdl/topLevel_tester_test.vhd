ARCHITECTURE test OF sinewave_tester IS

  constant clockFrequency: real := 66.0E6;
  constant clockPeriod: time := 1.0 / clockFrequency * 1 sec;
  signal sClock: std_uLogic := '1';

BEGIN

  reset <= '1', '0' after 2 * clockPeriod;

  sClock <= not sClock after clockPeriod/2;
  clock <= transport sClock after 9.0/10.0 * clockPeriod;

END ARCHITECTURE test;

