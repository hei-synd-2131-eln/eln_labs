ARCHITECTURE test OF cordic_tester IS

--  constant clockFrequency: real := 66.0E6;
  constant clockFrequency: real := 6.60E6;
  constant clockPeriod: time := 1.0/clockFrequency * 1 sec;


  signal phase_int: unsigned(phase'range) := (others => '0');

BEGIN

  phase_int <= phase_int+1 after clockPeriod;
  phase <= phase_int;

END ARCHITECTURE test;
