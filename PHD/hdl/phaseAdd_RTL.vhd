ARCHITECTURE masterVersion OF offsetUpdate IS
BEGIN
  offsetOut <= offsetIn + period when add_sub = '1'
    else offsetIn - period;
END ARCHITECTURE masterVersion;
