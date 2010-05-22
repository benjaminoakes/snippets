function prod = fn()
  tic;
  prod = stress_test();
  toc

  function prod = stress_test()
    for i = 1:100000
      prod = fn2();
    end
  end

  function prod = fn2()
    prod = 123123 * 12314;
  end
end
