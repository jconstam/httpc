// Operating System Interfaces - File System

#include <stdio.h>

#define file_open(file_name, mode) fopen(file_name, mode)
#define file_close(file_handle) fclose(file_handle)
#define file_read(buffer, size, count, file_handle) fread(buffer, size, count, file_handle)
