ASM=nasm
SRC_DIR=src
BUILD_DIR=build

$(BUILD_DIR)/main_floppy.img: $(BUILD_DIR)/main.bin
	@echo "┌────────────┐"
	@echo "│  Floppy    │"
	@echo "└────────────┘"
	cp $(BUILD_DIR)/main.bin $(BUILD_DIR)/main_floppy.img
	truncate -s 1440k $(BUILD_DIR)/main_floppy.img

$(BUILD_DIR)/main.bin: $(SRC_DIR)/main.asm
	@echo "┌────────────┐"
	@echo "│  Assembly  │"
	@echo "└────────────┘"
	mkdir -p $(BUILD_DIR)
	$(ASM) $(SRC_DIR)/main.asm -f bin -o $(BUILD_DIR)/main.bin
clean:
	@rm -rf $(BUILD_DIR)
