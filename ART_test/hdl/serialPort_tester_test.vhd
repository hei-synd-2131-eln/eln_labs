ARCHITECTURE test OF serialPort_tester IS

  constant clockFrequency: real := 66.0E6;
  constant clockPeriod: time := 1.0/clockFrequency * 1 sec;
  signal clock_int: std_uLogic := '0';

BEGIN

  -----------------------------------------------------------------------------
                                                             -- clock and reset
  reset <= '1', '0' after 4*clockPeriod;

  clock_int <= not clock_int after clockPeriod/2;
  clock <= transport clock_int after 9*clockPeriod/10;

  testSequence : process
  begin
  	send <= '0';
  	dataToSend <= (others => '0');

    wait for 10*clockPeriod;
    send <= '1', '0' after clockPeriod;
    dataToSend <= std_ulogic_vector(to_unsigned(character'pos('H'), dataToSend'length));
    wait until received = '1';

    wait for 10*clockPeriod;
    send <= '1', '0' after clockPeriod;
    dataToSend <= std_ulogic_vector(to_unsigned(character'pos('e'), dataToSend'length));
    wait until received = '1';

    wait for 10*clockPeriod;
    send <= '1', '0' after clockPeriod;
    dataToSend <= std_ulogic_vector(to_unsigned(character'pos('l'), dataToSend'length));
    wait until received = '1';

    wait for 10*clockPeriod;
    send <= '1', '0' after clockPeriod;
    dataToSend <= std_ulogic_vector(to_unsigned(character'pos('l'), dataToSend'length));
    wait until received = '1';

    wait for 10*clockPeriod;
    send <= '1', '0' after clockPeriod;
    dataToSend <= std_ulogic_vector(to_unsigned(character'pos('o'), dataToSend'length));
    wait until received = '1';

    wait;
  end process testSequence;

END ARCHITECTURE test;
