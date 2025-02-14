.DELETE_ON_ERROR:

AS = rgbasm
ASFLAGS = -E
LD = rgblink
FIX = rgbfix
FIXFLAGS = -f gh

ROM = tetrisv11.gb
NAME = hack
SOURCE_FILE = $(NAME).asm
OBJECT_FILE = $(NAME).o
OUTPUT_ROM = $(NAME).gb
OBJS = $(OBJECT_FILE) $(OUTPUT_ROM)

$(OUTPUT_ROM): $(OBJECT_FILE)
	$(LD) -O $(ROM) -o $@ $<
	$(FIX) $(FIXFLAGS) $@

$(OBJECT_FILE): $(SOURCE_FILE)
	$(AS) $(ASFLAGS) $< -o $@

.PHONY: all clean test
clean:
	rm -rf $(OBJS)
