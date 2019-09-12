library std_developersKit;
  use std_developersKit.std_ioPak.To_String;

ARCHITECTURE test OF ALU8_tester IS
  constant sTestPeriod: time := 50 ns;
  signal opCode: string(1 to 16);
BEGIN
  sequence: process
  begin
    ---------------------------------------------------------------------------
    -- LOAD sX, kk
    ---------------------------------------------------------------------------
    opCode <= "LOAD sX, kk     ";
    code <= "00000";

    cIn <= '0';
    A <=        "00001010";
    B <=        "00110011";
    wait for sTestPeriod;
    assert Y =  "00110011"
      report "-------------------------------- test LOAD 1 wrong --------------------------------"
      severity note;








    wait;
  end process sequence;
END test;