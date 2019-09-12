library ieee;
  use ieee.math_real.all;

ARCHITECTURE test OF PWM_tester IS

  constant clockFrequency: real := 66.0E6;
  constant clockPeriod: time := 1.0/clockFrequency * 1 sec;
  signal clock_int: std_ulogic := '0';

  signal tReal: real := 0.0;
  signal outAmplitude: real := 1.0;
  signal outReal: real := 0.0;
  signal outUnsigned: unsigned(parallelIn'range);

BEGIN
  -----------------------------------------------------------------------------
                                                             -- clock and reset
  reset <= '1', '0' after 4*clockPeriod;

  clock_int <= not clock_int after clockPeriod/2;
  clock <= transport clock_int after 9*clockPeriod/10;

  ------------------------------------------------------------------------------
                                                                 -- time signals
  process(clock_int)
  begin
    if rising_edge(clock_int) then
      tReal <= tReal + (1.0/clockFrequency);
    end if;
  end process;

  outReal <= outAmplitude * (0.5 + 0.5*sin(2.0*math_pi*sineFrequency*tReal));

  outUnsigned <= to_unsigned(
    integer(outReal * real(2**outUnsigned'length-1)),
    outUnsigned'length
  );

  parallelIn <=
    (others => '0') when now < 20 us else
    (others => '1') when now < 40 us else
    outUnsigned;

END ARCHITECTURE test;
