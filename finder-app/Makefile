# Variables
CC = $(CROSS_COMPILE)gcc
CFLAGS = -Wall -Werror
TARGET = writer
OBJS = writer.o

# Regla por defecto
all: $(TARGET)

# Cómo compilar el ejecutable
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $(TARGET) $(OBJS)

# Regla para compilar el .c a .o
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Regla clean
clean:
	rm -f $(TARGET) *.o
