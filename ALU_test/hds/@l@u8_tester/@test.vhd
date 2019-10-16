ARCHITECTURE Test OF LU8_tester IS
  constant sTestPeriod: time := 20 ns;
  signal opCode: string(1 to 16);
BEGIN
  sequence: process
  begin
    ---------------------------------------------------------------------------
    -- LOAD sX, kk
    ---------------------------------------------------------------------------
    opCode <= "LOAD sX, kk     ";
    code <= "00";

    A <=        "00001010";
    B <=        "00110011";
    wait for sTestPeriod;
    assert Y =  "00110011"
      report "test 1 LOAD wrong"
      severity note;







    wait;
  end process sequence;
END Test;
