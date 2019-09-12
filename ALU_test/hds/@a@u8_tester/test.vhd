ARCHITECTURE test OF AU8_tester IS
  constant sTestPeriod: time := 20 ns;
  signal opCode: string(1 to 16);
BEGIN
  sequence: process
  begin
    ---------------------------------------------------------------------------
    -- ADD sX, kk
    ---------------------------------------------------------------------------
    opCode <= "ADD sX, kk      ";
    code <= "00";

    cIn <=             '0';
    A <=        "00000110";
    B <=        "00001111";
    wait for sTestPeriod;
    assert (Y = "00010101") and (cOut = '0')
      report "test 1 ADD wrong"
      severity note;







    wait;
  end process sequence;
END test;
