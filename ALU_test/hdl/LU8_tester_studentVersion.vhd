ARCHITECTURE studentVersion OF LU8_tester IS

  constant clockFrequency: real := 66.0E6;
  constant clockPeriod: time := 1.0 / clockFrequency * 1 sec;

  signal opCode: string(1 to 16);

BEGIN

  testSequence: process
  begin

    ---------------------------------------------------------------------------
    -- Test 1: LOAD sX, kk
    ---------------------------------------------------------------------------
    opCode <= "LOAD sX, kk     ";
    code <= "00";

    A <=        "00000000";
    B <=        "11111111";
    wait for clockPeriod;
    assert Y =  "00001010"
      report "test 1 LOAD wrong"
      severity note;

    wait;

  end process testSequence;

END ARCHITECTURE studentVersion;

