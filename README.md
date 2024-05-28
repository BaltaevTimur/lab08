# Балтаев Тимур ИУ8-22
```sh
$ git clone https://github.com/BaltaevTimur/lab06
$ mkdir logs
$ cd logs/
$ touch log.txt
$ cd..
$ $ touch Dockerfile
```
## CMakeLists.txt
```sh
cmake_minimum_required(VERSION 3.22.1) 

project(solver)				
set(SOURCE_EXE equation.cpp)			
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/../formatter_ex_lib/"
					"${CMAKE_CURRENT_SOURCE_DIR}/../solver_lib/")
add_executable(main ${SOURCE_EXE})	
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../formatter_ex_lib/ formatter_ex_lib)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../solver_lib/ solver_lib)

target_link_libraries(main formatter_ex_lib solver_lib)		

```
## Dockerfile
```sh
FROM ubuntu:18.04
RUN apt update
RUN apt  install -yy gcc g++ cmake
COPY . /solver_application
WORKDIR /solver_application
RUN cmake -H. -B_build -DDCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=_install
RUN cmake --build _build
RUN cmake --build _build --target install
ENV LOG_PATH /home/logs/log.txt
VOLUME /home/logs
WORKDIR /solver_application/_build/
ENTRYPOINT ./solver
```
## actions.yml
```sh
name: testDocker

on:
 push:
  branches: [main]


jobs: 
 build_Linux:

  runs-on: ubuntu-latest

  steps:
  - uses: actions/checkout@v4

  - name: Build the Docker
    run: docker build -t logger .

  - name: Put logs
    run: docker run -v "$(pwd)/logs/:/home/logs/" logger 1 4 3
```
