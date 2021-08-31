// Operating System Interfaces

#pragma once

#include <stdlib.h>
#include <stdint.h>
#include <stdbool.h>

// File System
void *file_open(const char *filename, const char *mode);
int file_close(void *stream);
int file_read(void *buffer, size_t size, size_t count, void *file_handle);
