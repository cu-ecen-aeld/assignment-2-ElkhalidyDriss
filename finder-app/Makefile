CC = gcc
CROSS_COMPILE =
CFLAGS = -Wall -Wextra -g
src = writer.c
obj = $(src:.c=.o)
target = writer

ifeq ($(CROSS_COMPILE),aarch64-none-linux-gnu-)
    CC = aarch64-linux-gnu-gcc 
endif

.PHONY: all clean

all: $(target)
	@echo "Using compiler: $(CC)"
	@chmod +x $(target)

clean:
	rm -f $(target) $(obj)

$(target): $(obj)
	$(CC) $(CFLAGS) -o $@ $^

%.o: %.c
	$(CC) $(CFLAGS) -c -o $@ $<
