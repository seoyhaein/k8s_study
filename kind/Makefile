# Makefile

BIN_DIR  := $(HOME)/dotfile/bin
DEST_DIR := /usr/local/bin
SCRIPT   := kubectl

OWNER    := $(shell if [ -n "$$SUDO_USER" ]; then echo $$SUDO_USER; else whoami; fi)

.PHONY: install
install:
	@echo "→ Installing $(SCRIPT) to $(BIN_DIR) as $(OWNER)…"
	@mkdir -p "$(BIN_DIR)"
	@echo "→ Copy ./${SCRIPT} to ${BIN_DIR}/${SCRIPT}"
	@cp ./$(SCRIPT) "$(BIN_DIR)/$(SCRIPT)"
	@chmod +x "$(BIN_DIR)/$(SCRIPT)"
	@sudo chown $(OWNER):$(OWNER) "$(BIN_DIR)/$(SCRIPT)"
	@echo "→ Linking to $(DEST_DIR)…"
	@sudo ln -sf "$(BIN_DIR)/$(SCRIPT)" "$(DEST_DIR)/$(SCRIPT)"
	@echo "✔ Installed."

.PHONY: uninstall
uninstall:
	@echo "→ Removing link from $(DEST_DIR)…"
	@sudo rm -f "$(DEST_DIR)/$(SCRIPT)"
	@echo "→ Removing script from $(BIN_DIR)…"
	@sudo rm -f "$(BIN_DIR)/$(SCRIPT)"
	@echo "✔ Uninstalled."
