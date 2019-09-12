library std_developersKit;
  use std_developersKit.std_ioPak.To_String;

ARCHITECTURE test OF bMul4Unsigned_tester IS
  constant sTestPeriod : time := 100 ns;
BEGIN

  test: PROCESS  -- process is required when using 'wait' statement
  BEGIN
    -- test all cases!!
    for i in 0 to 15 loop
      for j in 0 to 15 loop
        a   <=to_unsigned(i,4);
        b   <=to_unsigned(j,4);
        WAIT FOR sTestPeriod;
        assert (p = to_unsigned(i*j,8))
          report "test for" & To_String(i,"%10d") & " *" & To_String(j,"%10d") & " wrong"  -- convert to string int i*j on 10 char
          severity note;
       end loop;
     end loop;

    WAIT;
  END PROCESS test;

END test;
