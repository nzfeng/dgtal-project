# DGtal project

Trying to compile DGtal in a project that splits declaration and definition (currently many linker errors about duplicate definitions of STB functions.)

```
git clone --recursive https://github.com/nzfeng/dgtal-project.git
cd dgtal-project
mdkir build && cd build
cmake ..
make -j8
```

## Attempts
* Using `cmake -DNO_ADD_STBIMAGE_IMPLEMENT=Off ..` or `cmake -DNO_ADD_STBIMAGE_IMPLEMENT=On ..` doesn't work