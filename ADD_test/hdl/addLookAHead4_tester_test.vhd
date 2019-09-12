ARCHITECTURE test OF addLookAHead4_tester IS

  constant clockFrequency: real := 66.0E6;
  constant clockPeriod: time := 1.0 / clockFrequency * 1 sec;

BEGIN

  test: PROCESS
  BEGIN

    ----------------------------------------------------------------------------
    -- Test 1:    0 + 0 + 0 = 0
    --
    a   <="0000";
    b   <="0000";
    cin <='0';
    WAIT FOR clockPeriod;
    assert (cout = '0') AND (s="0000")
      report "test 1 wrong"
      severity note;

    ----------------------------------------------------------------------------
    -- Test 2:    1 + 2 + 0 = 3
    --
    cin <='0';
    a   <="0001";
    b   <="0010";
    cin <='0';
    WAIT FOR clockPeriod;
    assert (cout = '0') AND (s="0011")
      report "test 2 wrong"
      severity note;

    ----------------------------------------------------------------------------
    -- Test 3:    2 + 5 + 0 = 7
    --
    a   <="0010";
    b   <="0101";
    cin <='0';
    WAIT FOR clockPeriod;
    assert (cout = '0') AND (s="0111")
      report "test 3 wrong"
      severity note;

    ----------------------------------------------------------------------------
    -- Test 4:    1 + 1 + 1 = 3
    --
    a   <="0001";
    b   <="0001";
    cin <='1';
    WAIT FOR clockPeriod;
    assert (cout = '0') AND (s="0011")
      report "test 4 wrong"
      severity note;

    ----------------------------------------------------------------------------
    -- Test 5:    8 + 7 + 0 = 15
    --
    a   <="1000";
    b   <="0111";
    cin <='0';
    WAIT FOR clockPeriod;
    assert (cout = '0') AND (s="1111")
      report "test 5 wrong"
      severity note;

    ----------------------------------------------------------------------------
    -- Test 6:    15 + 15 + 1 = 15 plus carry
    --
    a   <="1111";
    b   <="1111";
    cin <='1';
    WAIT FOR clockPeriod;
    assert (cout = '1') AND (s="1111")  -- 15+15+1 = 31 = 16+15
      report "test 6 wrong"
      severity note;

    WAIT;
  END PROCESS test;

END ARCHITECTURE test;

