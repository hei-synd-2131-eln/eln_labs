ARCHITECTURE studentVersion OF AU8_tester IS

  constant clockFrequency: real := 66.0E6;
  constant clockPeriod: time := 1.0 / clockFrequency * 1 sec;

  signal opCode: string(1 to 16);

BEGIN

  testSequence: process
  begin

    ---------------------------------------------------------------------------
    -- Test 1: ADD sX, kk
    ---------------------------------------------------------------------------
    opCode <= "ADD sX, kk      ";
    code <= "00";

    cIn <=              '0';
    A <=         "00000000";
    B <=         "11111111";
    wait for clockPeriod;
    assert (Y =  "10010110") and (cOut = '0')
      report "test 1 ADD wrong"
      severity note;

    wait;

  end process testSequence;

END ARCHITECTURE studentVersion;

