<<<<<<< HEAD
# lab04
=======
# Балтаев Тимур ИУ8-22
## Задание 1

Вам поручили перейти на систему автоматизированной сборки CMake. Исходные файлы находятся в директории formatter_lib. В этой директории находятся файлы для статической библиотеки formatter. Создайте CMakeList.txt в директории formatter_lib, с помощью которого можно будет собирать статическую библиотеку formatter.

```sh
$ cd lab03hw
$ git clone https://github.com/tp-labs/lab03
$ git init
$ git remote add origin https://github.com/BaltaevTimur/lab03hw.git
$ cd formatter_lib
```
```sh
$ cat > CMakeLists.txt <<EOF
cmake_minimum_required(VERSION 3.4)
project(formatter)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CURRENT_SOURCE_DIR /home/timur/BaltaevTimur/workspace/lab03_hw/lab03/formatter_lib/)
add_library(formatter STATIC \${CMAKE_CURRENT_SOURCE_DIR}/formatter.cpp)
include_directories(\${CMAKE_CURRENT_SOURSE_DIR}/formatter.h)
EOF
```
```sh
$ cmake -H. -B_build
```
```sh
-- The C compiler identification is GNU 10.3.1
-- The CXX compiler identification is GNU 10.3.1
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /usr/bin/cc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done
-- Generating done
-- Build files have been written to: /home/timur/BaltaevTimur/workspace/lab03hw/formatter_lib/_build
```
$ cmake --build _build
```
```sh
[ 50%] Building CXX object CMakeFiles/formatter.dir/home/timur/BaltaevTimur/workspace/lab03_hw/lab03/formatter_lib/formatter.cpp.o
[100%] Linking CXX static library libformatter.a
[100%] Built target formatter
```
### CMakeLists.txt
```sh
cmake_minimum_required(VERSION 3.4)
project(formatter)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CURRENT_SOURCE_DIR /home/timur/BaltaevTimur/workspace/lab03hw/formatter_lib/)
add_library(formatter STATIC ${CMAKE_CURRENT_SOURCE_DIR}/formatter.cpp)
include_directories(${CMAKE_CURRENT_SOURSE_DIR}/formatter.h)
```
## Задание 2

У компании "Formatter Inc." есть перспективная библиотека, которая является расширением предыдущей библиотеки. Т.к. вы уже овладели навыком созданием CMakeList.txt для статической библиотеки formatter, ваш руководитель поручает заняться созданием CMakeList.txt для библиотеки formatter_ex, которая в свою очередь использует библиотеку formatter.

```sh
$ cd..
$ cd formatter_ex_lib
```
```sh
cat > CMakeLists.txt <<EOF
cmake_minimum_required(VERSION 3.4)
project(formatter_ex)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CURRENT_SOURCE_DIR /home/timur/BaltaevTimur/workspace/lab03hw/formatter_ex_lib/)
add_library(formatter_ex STATIC ${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex.cpp)
include_directories(/home/timur/BaltaevTimur/workspace/lab03hw/formatter_lib/)
include_directories(${CMAKE_CURRENT_SOURSE_DIR}/formatter_ex.h)
EOF
```
```sh
$ cmake -H. -B_build
```
```sh
-- Configuring done
-- Generating done
-- Build files have been written to: /home/timur/BaltaevTimur/workspace/lab03hw/formatter_ex_lib/_build
```
```sh
$ cmake --build _build
```
```sh
[ 50%] Building CXX object CMakeFiles/formatter_ex.dir/formatter_ex.cpp.o
[100%] Linking CXX static library libformatter_ex.a
[100%] Built target formatter_ex
```
### CMakeLists.txt
```sh
cmake_minimum_required(VERSION 3.4)
project(formatter_ex)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CURRENT_SOURCE_DIR /home/timur/BaltaevTimur/workspace/lab03hw/formatter_ex_lib/)
add_library(formatter_ex STATIC ${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex.cpp)
include_directories(/home/timur/BaltaevTimur/workspace/lab03hw/formatter_lib/)
include_directories(${CMAKE_CURRENT_SOURSE_DIR}/formatter_ex.h)
```
# Задание 3

Конечно же ваша компания предоставляет примеры использования своих библиотек. Чтобы продемонстрировать как работать с библиотекой formatter_ex, вам необходимо создать два CMakeList.txt для двух простых приложений:

 - hello_world, которое использует библиотеку formatter_ex;
 - solver, приложение которое испольует статические библиотеки formatter_ex и solver_lib.

```sh
$ cd..
$ cd hello_world_application
```
```sh
$ cat > CMakeLists.txt <<EOF
cmake_minimum_required(VERSION 3.4)
project(hello_world)
set(CMAKE_CXX_STANDART 11)
set(CMAKE_CXX_STANDART_REQUIRED ON)
set(CMAKE_CURRENT_SOURCE_DIR /home/timur/BaltaevTimur/workspace/lab03hw/)
add_library(formatter STATIC ${CMAKE_CURRENT_SOURCE_DIR}/formatter_lib/formatter.cpp)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/formatter_lib)
add_library(formatter_ex STATIC ${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex_lib/formatter_ex.cpp)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex_lib)
add_executable(hello_world ${CMAKE_CURRENT_SOURCE_DIR}/hello_world_application/hello_world.cpp)
target_link_libraries(formatter_ex formatter)
target_link_libraries(hello_world formatter_ex)
EOF
```
```sh
$ cmake -H. -B_build
```
```sh
-- Configuring done
-- Generating done
-- Build files have been written to: /home/timur/BaltaevTimur/workspace/lab03hw/hello_world_application/_build
```
```sh
$ cmake --build _build
```
```sh
[ 16%] Building CXX object CMakeFiles/formatter.dir/home/timur/BaltaevTimur/workspace/lab03hw/formatter_lib/formatter.cpp.o
[ 33%] Linking CXX static library libformatter.a
[ 33%] Built target formatter
[ 50%] Building CXX object CMakeFiles/formatter_ex.dir/home/timur/BaltaevTimur/workspace/lab03hw/formatter_ex_lib/formatter_ex.cpp.o
[ 66%] Linking CXX static library libformatter_ex.a
[ 66%] Built target formatter_ex
[ 83%] Building CXX object CMakeFiles/hello_world.dir/hello_world.cpp.o
[100%] Linking CXX executable hello_world
[100%] Built target hello_world
```
### CMakeLists.txt
```sh
cmake_minimum_required(VERSION 3.4)
project(hello_world)
set(CMAKE_CXX_STANDART 11)
set(CMAKE_CXX_STANDART_REQUIRED ON)
set(CMAKE_CURRENT_SOURCE_DIR /home/timur/BaltaevTimur/workspace/lab03hw/)
add_library(formatter STATIC ${CMAKE_CURRENT_SOURCE_DIR}/formatter_lib/formatter.cpp)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/formatter_lib)
add_library(formatter_ex STATIC ${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex_lib/formatter_ex.cpp)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex_lib)
add_executable(hello_world ${CMAKE_CURRENT_SOURCE_DIR}/hello_world_application/hello_world.cpp)
target_link_libraries(formatter_ex formatter)
target_link_libraries(hello_world formatter_ex)
```
```sh
$ cd..
$ cd solver_lib/
$ cat > CMakeLists.txt <<EOF
cmake_minimum_required(VERSION 3.4)
project(solver)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CURRENT_SOURCE_DIR /home/timur/BaltaevTimur/workspace/lab03hw/solver_lib/)
add_library(solver STATIC ${CMAKE_CURRENT_SOURCE_DIR}/solver.cpp)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/solver.h)
```
```sh
$ cmake -H. -B_build
```
```sh
-- The C compiler identification is GNU 10.3.1
-- The CXX compiler identification is GNU 10.3.1
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /usr/bin/cc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done
-- Generating done
-- Build files have been written to: /home/timur/BaltaevTimur/workspace/lab03hw/solver_lib/_build
```
```sh
$ cmake --build _build/
```
```sh
[ 50%] Building CXX object CMakeFiles/solver.dir/solver.cpp.o
[100%] Linking CXX static library libsolver.a
[100%] Built target solver
```
### CMakeLists.txt
```sh
cmake_minimum_required(VERSION 3.4)
project(solver)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CURRENT_SOURCE_DIR /home/timur/BaltaevTimur/workspace/lab03hw/solver_lib/)
add_library(solver STATIC ${CMAKE_CURRENT_SOURCE_DIR}/solver.cpp)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/solver.h)
```
```sh
$ cd..
$ cd solver_application
```
```sh
cat > CMakeLists.txt <<EOF
cmake_minimum_required(VERSION 3.4)
project(equation)
set(CMAKE_CXX_STANDART 11)
set(CMAKE_CXX_STANDART_REQUIRED ON)
set(CMAKE_CURRENT_SOURCE_DIR /home/timur/BaltaevTimur/workspace/lab03hw/)
add_library(solver STATIC ${CMAKE_CURRENT_SOURCE_DIR}/solver_lib/solver.cpp)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/solver_lib)
add_library(formatter STATIC ${CMAKE_CURRENT_SOURCE_DIR}/formatter_lib/formatter.cpp)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/formatter_lib)
add_library(formatter_ex STATIC ${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex_lib/formatter_ex.cpp)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex_lib)
add_executable(equation ${CMAKE_CURRENT_SOURCE_DIR}/solver_application/equation.cpp)
target_link_libraries(formatter_ex formatter)
target_link_libraries(equation solver)
target_link_libraries(equation formatter_ex)
```
```sh
$ cmake -H. -B_build
```
```sh
-- The C compiler identification is GNU 10.3.1
-- The CXX compiler identification is GNU 10.3.1
-- Detecting C compiler ABI info
-- Detecting C compiler ABI info - done
-- Check for working C compiler: /usr/bin/cc - skipped
-- Detecting C compile features
-- Detecting C compile features - done
-- Detecting CXX compiler ABI info
-- Detecting CXX compiler ABI info - done
-- Check for working CXX compiler: /usr/bin/c++ - skipped
-- Detecting CXX compile features
-- Detecting CXX compile features - done
-- Configuring done
-- Generating done
-- Build files have been written to: /home/timur/BaltaevTimur/workspace/lab03hw/solver_application/_build
```
```sh
$ cmake --build _build/
```
```sh
[ 12%] Building CXX object CMakeFiles/solver.dir/home/timur/BaltaevTimur/workspace/lab03hw/solver_lib/solver.cpp.o
[ 25%] Linking CXX static library libsolver.a
[ 25%] Built target solver
[ 37%] Building CXX object CMakeFiles/formatter.dir/home/timur/BaltaevTimur/workspace/lab03hw/formatter_lib/formatter.cpp.o
[ 50%] Linking CXX static library libformatter.a
[ 50%] Built target formatter
[ 62%] Building CXX object CMakeFiles/formatter_ex.dir/home/timur/BaltaevTimur/workspace/lab03hw/formatter_ex_lib/formatter_ex.cpp.o
[ 75%] Linking CXX static library libformatter_ex.a
[ 75%] Built target formatter_ex
[ 87%] Building CXX object CMakeFiles/equation.dir/equation.cpp.o
[100%] Linking CXX executable equation
[100%] Built target equation
```
### CMakeLists.txt
```sh
cmake_minimum_required(VERSION 3.4)
project(equation)
set(CMAKE_CXX_STANDART 11)
set(CMAKE_CXX_STANDART_REQUIRED ON)
set(CMAKE_CURRENT_SOURCE_DIR /home/timur/BaltaevTimur/workspace/lab03hw/)
add_library(solver STATIC ${CMAKE_CURRENT_SOURCE_DIR}/solver_lib/solver.cpp)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/solver_lib)
add_library(formatter STATIC ${CMAKE_CURRENT_SOURCE_DIR}/formatter_lib/formatter.cpp)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/formatter_lib)
add_library(formatter_ex STATIC ${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex_lib/formatter_ex.cpp)
include_directories(${CMAKE_CURRENT_SOURCE_DIR}/formatter_ex_lib)
add_executable(equation ${CMAKE_CURRENT_SOURCE_DIR}/solver_application/equation.cpp)
target_link_libraries(formatter_ex formatter)
target_link_libraries(equation solver)
target_link_libraries(equation formatter_ex)
```
>>>>>>> 28e3eec (coppied lab03)
