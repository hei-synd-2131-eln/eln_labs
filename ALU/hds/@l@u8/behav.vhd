ARCHITECTURE behav OF LU8 IS
BEGIN
  logicOp: process(code, A, B)
  begin
    case to_integer(unsigned(code)) is
      when 0 => Y <= B; 
      when 1 => Y <= A and B; 
      when 2 => Y <= A or B; 
      when 3 => Y <= A xor B; 
      when others => null; 
    end case; 
  end process logicOp;
END behav;
