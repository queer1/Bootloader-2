CC=g++
CFLAGS=-c -Wall
LDFLAGS=
SOURCES=./src/main.c
OBJECTS=$(SOURCES:.cpp=.o)
EXECUTABLE=main.bin

all: $(SOURCES) $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS)
	    $(CC) $(LDFLAGS) $(OBJECTS) -o $@

.cpp.o:
	    $(CC) $(CFLAGS) $< -o $@


clean:
	rm -rf *.hex
.phony: install
install:
