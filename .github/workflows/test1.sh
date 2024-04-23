root=/home/timur/BaltaevTimur/workspace/lab04
cmake --build $root/formatter_lib/_buind
cmake --build $root/formatter_ex_lib/_buind 
cmake --build $root/hello_world_application/_buind 
cmake --build $root/solver_lib/_buind
cmake --build $root/solver_application/_buind

$root/hello_world_application/_build/main
echo -e '1\n2\n3' | $root/solver_application/_build/main
