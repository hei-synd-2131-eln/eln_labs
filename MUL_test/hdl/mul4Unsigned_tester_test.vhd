library std_developersKit;
  use std_developersKit.std_ioPak.To_String;

ARCHITECTURE test OF mul4Unsigned_tester IS

  constant clockFrequency: real := 10.0E6;
  constant clockPeriod: time := 1.0 / clockFrequency * 1 sec;

BEGIN

  test: PROCESS
  BEGIN
    -- test all cases!!
    for i in 0 to 15 loop
      for j in 0 to 15 loop
        a   <=to_unsigned(i, a'length);
        b   <=to_unsigned(j, b'length);
        WAIT FOR clockPeriod;
        assert (p = to_unsigned(i*j,8))
          report "test for" & To_String(i,"%10d") & " *" & To_String(j,"%10d") & " wrong"
          severity note;
       end loop;
     end loop;

    WAIT;
  END PROCESS test;

END ARCHITECTURE test;

