PREFIX ?= /usr/local
BINDIR  = $(PREFIX)/bin
LIBDIR  = $(PREFIX)/lib

RESET = \033[0m
GREEN = \033[0;32m
CYAN = \033[0;36m
YELLOW = \033[0;33m
RED = \033[0;31m

ERR_PERM= $(RED)MKP_ERROR:$(RESET) Permission denied, make sure to run make install with $(YELLOW)sudo$(RESET)

dependencies:

	@OS=$$(uname -s); \
	case "$$OS" in \
		Linux) \
			sudo apt update && sudo apt install -y git build-essential ;; \
		Darwin) \
			if ! xcode-select -p >/dev/null 2>&1; then \
				xcode-select --install; \
			fi ;; \
		*) \
			echo "Unsupported OS: $$OS"; exit 1 ;; \
	esac

install: dependencies

	@if [ -f "$(BINDIR)/mkp" ] && [ -f "$(LIBDIR)/mkp_utils.sh" ]; then \
		echo "$(CYAN)MKP_INFO:$(RESET) Already installed at $(BINDIR)/mkp"; \
		exit 1; \
	fi
	@echo "Installing mkp..."
	@install -d $(BINDIR) $(LIBDIR) || { echo "$(ERR_PERM)"; exit 1; }
	@install -m 755 mkp $(BINDIR)/mkp || { echo "$(ERR_PERM)"; exit 1; }
	@install -m 644 mkp_utils.sh $(LIBDIR)/mkp_utils.sh || { echo "$(ERR_PERM)"; exit 1; }
	@echo "$(GREEN)MKP_SUCCESS:$(RESET) Installation $(GREEN)successful$(RESET)"

uninstall:

	@if [ ! -f "$(BINDIR)/mkp" ] && [ ! -f "$(LIBDIR)/mkp_utils.sh" ]; then \
		echo "$(CYAN)MKP_INFO:$(RESET) Not installed"; \
		exit 1; \
	fi

	@if [ -f "$(BINDIR)/mkp" ]; then \
		rm -f $(BINDIR)/mkp; \
	fi

	@if [ -f "$(LIBDIR)/mkp_utils.sh" ]; then \
		rm -f $(LIBDIR)/mkp_utils.sh; \
	fi

	@echo "$(GREEN)MKP_SUCCESS:$(RESET) Uninstallation successful."