library std_developersKit;
  use std_developersKit.std_ioPak.To_String;

ARCHITECTURE test OF bMul4Signed_tester IS
  constant sTestPeriod : time := 100 ns;
BEGIN

  test: PROCESS  -- process is required when using 'wait' statement
  BEGIN
    -- test all cases!!
    for i in -8 to 7 loop
      for j in -8 to 7 loop
        a   <=to_signed(i,4);
        b   <=to_signed(j,4);
        WAIT FOR sTestPeriod;
        assert (p = to_signed(i*j,8))
          report "test for" & To_String(i,"%10d") & " *" & To_String(j,"%10d") & " wrong"  -- convert to string int i*j on 10 char
          severity note;
       end loop;
     end loop;

    WAIT;
  END PROCESS test;

END test;
