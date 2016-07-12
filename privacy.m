function [DB] = privacy(PT,k,eps)

debug_on_warning(1);
debug_on_error(1);

  [C,A] = MDAV(PT,k);
  DB= diff_Private(C,A,k,eps);
endfunction