ARCHITECTURE masterVersion OF AU8_tester IS

  constant clockFrequency: real := 66.0E6;
  constant clockPeriod: time := 1.0 / clockFrequency * 1 sec;

  signal opCode: string(1 to 16);

BEGIN

  TestSequence: process
  begin

    ---------------------------------------------------------------------------
    -- Test 1: ADD sX, kk
    ---------------------------------------------------------------------------
    opCode <= "ADD sX, kk      ";
    code <= "00";

    cIn <=              '0';
    A <=         "00111100";
    B <=         "01011010";
    wait for clockPeriod;
    assert (Y =  "10010110") and (cOut = '0')
      report "test 1 ADD wrong"
      severity note;

    ---------------------------------------------------------------------------
    -- Test 2: SUB sX, kk
    ---------------------------------------------------------------------------
    opCode <= "SUB sX, kk      ";
    code <= "01";

    cIn <=              '0';
    A <=         "11000110";
    B <=         "01101100";
    wait for clockPeriod;
    assert (Y =  "01011010") and (cOut = '0')
      report "test 2 SUB wrong"
      severity note;

    ---------------------------------------------------------------------------
    -- Test 3: SL0 sX
    ---------------------------------------------------------------------------
    opCode <= "SL0 sX          ";
    code <= "10";

    cIn <=              '0';
    A <=         "11000110";
    B <=         "01101100";
    wait for clockPeriod;
    assert (Y =  "10001100") and (cOut = '1')
      report "test 3 SL0 wrong"
      severity note;

    wait;

  end process TestSequence;

END ARCHITECTURE masterVersion;

