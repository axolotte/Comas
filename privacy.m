function [DB] = privacy(k,eps, row1, row2)

debug_on_warning(1);
debug_on_error(1);

  PT = input(row1, row2);
  [C,A] = MDAV(PT,k);
  DB= diff_Private(C,A,k,eps);
endfunction