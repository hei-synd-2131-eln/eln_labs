ARCHITECTURE studentVersion OF sinewaveGenerator IS
BEGIN

  table : process(phase)
  begin
    case to_integer(phase) is
      when  0 => sine <= to_signed(16#00#,8);
      when  1 => sine <= to_signed(16#00#,8);
      when  2 => sine <= to_signed(16#00#,8);
      when  3 => sine <= to_signed(16#00#,8);
      when  4 => sine <= to_signed(16#00#,8);
      when  5 => sine <= to_signed(16#00#,8);
      when  6 => sine <= to_signed(16#00#,8);
      when  7 => sine <= to_signed(16#00#,8);
      when  8 => sine <= to_signed(16#7F#,8);  --max
      when  9 => sine <= to_signed(16#7F#,8);
      when 10 => sine <= to_signed(16#7F#,8);
      when 11 => sine <= to_signed(16#7F#,8);
      when 12 => sine <= to_signed(16#7F#,8);
      when 13 => sine <= to_signed(16#7F#,8);
      when 14 => sine <= to_signed(16#7F#,8);
      when 15 => sine <= to_signed(16#7F#,8);
      when 16 => sine <= to_signed(16#00#,8);  --0
      when 17 => sine <= to_signed(16#00#,8);
      when 18 => sine <= to_signed(16#00#,8);
      when 19 => sine <= to_signed(16#00#,8);
      when 20 => sine <= to_signed(16#00#,8);
      when 21 => sine <= to_signed(16#00#,8);
      when 22 => sine <= to_signed(16#00#,8);
      when 23 => sine <= to_signed(16#00#,8);
      when 24 => sine <= to_signed(16#80#,8);  --min
      when 25 => sine <= to_signed(16#80#,8);
      when 26 => sine <= to_signed(16#80#,8);
      when 27 => sine <= to_signed(16#80#,8);
      when 28 => sine <= to_signed(16#80#,8);
      when 29 => sine <= to_signed(16#80#,8);
      when 30 => sine <= to_signed(16#80#,8);
      when 31 => sine <= to_signed(16#80#,8);
      when others => sine  <="--------";
    end case;
  end process table;

END ARCHITECTURE studentVersion;

