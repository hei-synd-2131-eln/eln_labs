ARCHITECTURE RTL OF aluBOpSelector IS
BEGIN

  selectDataSource: process(
    registerFileSel, registerFileIn,
    portInSel,       portIn,
    instrDataSel,    instrData
  )
  begin
    if registerFileSel = '1' then
      opB <= registerFileIn;
    elsif portInSel = '1' then
      opB <= portIn;
    elsif instrDataSel = '1' then
      opB <= instrData;
    else
      opB <= (others => '-');
    end if;
  end process selectDataSource;

END ARCHITECTURE RTL;
