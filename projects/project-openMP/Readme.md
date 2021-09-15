## project-openmp
test [openmp](https://premake.github.io/docs/openmp/)

It is a test for compiler toolset.

`openmp "On"` is mostly equivalent to:
```
filter "toolset:msc*"
	buildoptions "/openmp"
filter "toolset:not msc*" -- gcc/clang
	buildoptions "-fopenmp"
```
with the exception that visual studio project has dedicated display option.
