# Makefile para writer (Assignment 1 y 2)
# Soporta compilación nativa y cruzada vía CROSS_COMPILE

# Si no se pasa CROSS_COMPILE, se usa compilador nativo gcc
CROSS_COMPILE ?=
CC := $(CROSS_COMPILE)gcc
CFLAGS := -Wall -Werror

SRCS := writer.c
OBJS := $(SRCS:.c=.o)
TARGET := writer

# Objetivo por defecto: compila el ejecutable
all: $(TARGET)

# Enlaza objeto(s) en el binario
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

# Regla genérica para .o desde .c
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Limpia el ejecutable y todos los .o
clean:
	rm -f $(TARGET) $(OBJS)

.PHONY: all clean
