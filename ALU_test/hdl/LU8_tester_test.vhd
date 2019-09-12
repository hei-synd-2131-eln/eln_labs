ARCHITECTURE test OF LU8_tester IS

  constant clockFrequency: real := 66.0E6;
  constant clockPeriod: time := 1.0 / clockFrequency * 1 sec;

  signal opCode: string(1 to 16);

BEGIN

  TestSequence: process
  begin

    ---------------------------------------------------------------------------
    -- Test 1: LOAD sX, kk
    ---------------------------------------------------------------------------
    opCode <= "LOAD sX, kk     ";
    code <= "00";

    A <=        "00001100";
    B <=        "00001010";
    wait for clockPeriod;
    assert Y =  "00001010"
      report "test 1 LOAD wrong"
      severity note;

    ---------------------------------------------------------------------------
    -- Test 2: AND sX, kk
    ---------------------------------------------------------------------------
    opCode <= "AND sX, kk      ";
    code <= "01";

    A <=        "00001010";
    B <=        "00001100";
    wait for clockPeriod;
    assert Y =  "00001000"
      report "test 2 AND wrong"
      severity note;

    ---------------------------------------------------------------------------
    -- Test 3: OR sX, kk
    ---------------------------------------------------------------------------
    opCode <= "OR sX, kk       ";
    code <= "10";

    A <=        "00001100";
    B <=        "00001010";
    wait for clockPeriod;
    assert Y =  "00001110"
      report "test 3 OR wrong"
      severity note;

    ---------------------------------------------------------------------------
    -- Test 4: XOR sX, kk
    ---------------------------------------------------------------------------
    opCode <= "XOR sX, kk      ";
    code <= "11";

    A <=        "00001010";
    B <=        "00001100";
    wait for clockPeriod;
    assert Y =  "00000110"
      report "test 4 XOR wrong"
      severity note;

    wait;

  end process TestSequence;

END ARCHITECTURE test;

