ARCHITECTURE test OF bAdd4_tester IS
  constant sTestPeriod : time := 20 ns;
BEGIN
  test: PROCESS  -- process is required when using 'wait' statement
  BEGIN
    cin <='0';
    a   <="0000";
    b   <="0000";
    WAIT FOR sTestPeriod;
    assert (cout = '0') AND (s="0000")
      report "test 1 wrong"
      severity note;


    cin <='0';
    a   <="0001";
    b   <="0000";
    WAIT FOR sTestPeriod;
    assert (cout = '0') AND (s="0001")
      report "test 2 wrong"
      severity note;

    cin <='0';
    a   <="0001";
    b   <="0001";
    WAIT FOR sTestPeriod;
    assert (cout = '0') AND (s="0010")
      report "test 3 wrong"
      severity note;

    cin <='0';
    a   <="0010";
    b   <="0010";
    WAIT FOR sTestPeriod;
    assert (cout = '0') AND (s="0100")
      report "test 4 wrong"
      severity note;

    cin <='0';
    a   <="1111";
    b   <="0111";
    WAIT FOR sTestPeriod;
    assert (cout = '1') AND (s="0110")  --15+7=22=16+6
      report "test 5 wrong"
      severity note;

    cin <='1';
    a   <="1111";
    b   <="1111";
    WAIT FOR sTestPeriod;
    assert (cout = '1') AND (s="1111")  --15+15+1=31=16+15
      report "test 6 wrong"
      severity note;

    WAIT;
  END PROCESS test;
END test;
