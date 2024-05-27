<<<<<<< HEAD

=======
>>>>>>> f4a16b4c2e5d6697d90d574f163c916f84454178
project(solver)				
set(SOURCE_EXE equation.cpp)			
include_directories("${CMAKE_CURRENT_SOURCE_DIR}/../formatter_ex_lib/"
					"${CMAKE_CURRENT_SOURCE_DIR}/../solver_lib/")
add_executable(main ${SOURCE_EXE})	
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../formatter_ex_lib/ formatter_ex_lib)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/../solver_lib/ solver_lib)

target_link_libraries(main formatter_ex_lib solver_lib)		
