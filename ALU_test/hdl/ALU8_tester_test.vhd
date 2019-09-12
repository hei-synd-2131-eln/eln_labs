ARCHITECTURE test OF ALU8_tester IS

  constant clockFrequency: real := 20.0E6;
  constant clockPeriod: time := 1.0 / clockFrequency * 1 sec;

  signal opCode: string(1 to 16);

BEGIN

  TestSequence: process
  begin

    ---------------------------------------------------------------------------
    -- Test 1: LOAD sX, kk
    ---------------------------------------------------------------------------
    opCode <= "LOAD sX, kk     ";
    code <= "00000";

    cIn <=             '1';
    A <=        "00001100";
    B <=        "00001010";
    wait for clockPeriod;
    assert Y =  "00001010"
      report "test 1 LOAD wrong"
      severity note;

    ---------------------------------------------------------------------------
    -- Test 2: INPUT sX, pp
    ---------------------------------------------------------------------------
    opCode <= "INPUT sX, pp    ";
    code <= "00010";

    cIn <=             '1';
    A <=        "00001100";
    B <=        "00001010";
    wait for clockPeriod;
    assert Y =  "00001010"
      report "test 2 INPUT wrong"
      severity note;

    ---------------------------------------------------------------------------
    -- Test 3: FETCH sX, ss
    ---------------------------------------------------------------------------
    opCode <= "FETCH sX, ss    ";
    code <= "00011";

    cIn <=             '1';
    A <=        "00001100";
    B <=        "00001010";
    wait for clockPeriod;
    assert Y =  "00001010"
      report "test 3 FETCH wrong"
      severity note;

    ---------------------------------------------------------------------------
    -- Test 4: AND sX, kk
    ---------------------------------------------------------------------------
    opCode <= "AND sX, kk      ";
    code <= "00101";

    cIn <=             '1';
    A <=        "00001100";
    B <=        "00001010";
    wait for clockPeriod;
    assert Y =  "00001000"
      report "test 4 AND wrong"
      severity note;

    ---------------------------------------------------------------------------
    -- Test 5: OR sX, kk
    ---------------------------------------------------------------------------
    opCode <= "OR sX, kk       ";
    code <= "00110";

    cIn <=             '1';
    A <=        "00001100";
    B <=        "00001010";
    wait for clockPeriod;
    assert Y =  "00001110"
      report "test 5 OR wrong"
      severity note;

    ---------------------------------------------------------------------------
    -- Test 6: XOR sX, kk
    ---------------------------------------------------------------------------
    opCode <= "XOR sX, kk      ";
    code <= "00111";

    cIn <=             '1';
    A <=        "00001100";
    B <=        "00001010";
    wait for clockPeriod;
    assert Y =  "00000110"
      report "test 6 XOR wrong"
      severity note;

    ---------------------------------------------------------------------------
    -- Test 7: TEST sX, kk
    ---------------------------------------------------------------------------
    opCode <= "TEST sX, kk     ";
    code <= "01001";

    cIn <=             '1';
    A <=        "00001100";
    B <=        "00001010";
    wait for clockPeriod;
    assert Y =  "00001000"
      report "test 7 TEST wrong"
      severity note;

    ---------------------------------------------------------------------------
    -- Test 8: COMPARE sX, kk
    ---------------------------------------------------------------------------
    opCode <= "COMPARE sX, kk  ";
    code <= "01010";

    cIn <=              '0';
    A <=         "11000110";
    B <=         "01101100";
    wait for clockPeriod;
    assert (Y =  "01011010") and (cOut = '0')
      report "test 2 SUB wrong"
      severity note;

    ---------------------------------------------------------------------------
    -- Test 9: ADD sX, kk
    ---------------------------------------------------------------------------
    opCode <= "ADD sX, kk      ";
    code <= "01100";

    cIn <=              '1';
    A <=         "00111100";
    B <=         "01011010";
    wait for clockPeriod;
    assert (Y =  "10010110") and (cOut = '0')
      report "test 9 ADD wrong"
      severity note;

    ---------------------------------------------------------------------------
    -- Test 10: ADDCY sX, kk
    ---------------------------------------------------------------------------
    opCode <= "ADDCY sX, kk    ";
    code <= "01101";

    cIn <=              '0';
    A <=         "00111100";
    B <=         "01011010";
    wait for clockPeriod;
    assert (Y =  "10010110") and (cOut = '0')
      report "test 10 ADDCY wrong"
      severity note;

    ---------------------------------------------------------------------------
    -- Test 11: ADDCY sX, kk
    ---------------------------------------------------------------------------
    opCode <= "ADDCY sX, kk    ";
    code <= "01101";

    cIn <=              '1';
    A <=         "00111100";
    B <=         "01011010";
    wait for clockPeriod;
    assert (Y =  "10010111") and (cOut = '0')
      report "test 11 ADDCY wrong"
      severity note;

    ---------------------------------------------------------------------------
    -- Test 12: SUB sX, kk
    ---------------------------------------------------------------------------
    opCode <= "SUB sX, kk      ";
    code <= "01110";

    cIn <=              '1';
    A <=         "11000110";
    B <=         "01101100";
    wait for clockPeriod;
    assert (Y =  "01011010") and (cOut = '0')
      report "test 12 SUB wrong"
      severity note;

    ---------------------------------------------------------------------------
    -- Test 13: SUBCY sX, kk
    ---------------------------------------------------------------------------
    opCode <= "SUBCY sX, kk    ";
    code <= "01111";

    cIn <=              '0';
    A <=         "11000110";
    B <=         "01101100";
    wait for clockPeriod;
    assert (Y =  "01011010") and (cOut = '0')
      report "test 13 SUBCY wrong"
      severity note;

    ---------------------------------------------------------------------------
    -- Test 14: SUBCY sX, kk
    ---------------------------------------------------------------------------
    opCode <= "SUBCY sX, kk    ";
    code <= "01111";

    cIn <=              '1';
    A <=         "11000110";
    B <=         "01101100";
    wait for clockPeriod;
    assert (Y =  "01011001") and (cOut = '0')
      report "test 14 SUBCY wrong"
      severity note;

    ---------------------------------------------------------------------------
    -- Test 15: SR1 sX
    ---------------------------------------------------------------------------
    opCode <= "SR1 sX          ";
    code <= "10000";

    cIn <=              '1';
    A <=         "11000110";
    B <=         "01101100";
    wait for clockPeriod;
    assert (Y =  "11100011") and (cOut = '0')
      report "test 15 SR1 wrong"
      severity note;

    ---------------------------------------------------------------------------
    -- Test 16: SL1 sX
    ---------------------------------------------------------------------------
    opCode <= "SL1 sX          ";
    code <= "10001";

    cIn <=              '1';
    A <=         "11000110";
    B <=         "01101100";
    wait for clockPeriod;
    assert (Y =  "10001101") and (cOut = '1')
      report "test 16 SL1 wrong"
      severity note;

    wait;

  end process TestSequence;

END ARCHITECTURE test;

