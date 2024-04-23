# Балтаев Тимур ИУ8-22
## Создание .github/workflows, test1.sh и actions.yml
```sh
$ mkdir .github/workflows && cd .github/workflows
$ touch test1.sh
$ touch actions.yml
```
## test1.sh
```sh
root=./
cmake --build $root/formatter_lib
cmake --build $root/formatter_ex_lib 
cmake --build $root/hello_world_application 
cmake --build $root/solver_lib
cmake --build $root/solver_application

$root/hello_world_application/_build/main
echo -e '1\n2\n3' | $root/solver_application/_build/main
```
## actions.yml
```sh
name: actions
run-name: BaltaevTimur is running lab04
on: [push]
jobs:
  container-job:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - name: test
        run: ./.github/workflows/test1.sh
```
