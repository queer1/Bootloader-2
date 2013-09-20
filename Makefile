
DESTINATION_DIR:=bin

ATMEL_PROJECT_DIR:=firmware

APP_PROJECT_DIR:=app

#Atmel_COMMANDS= \
#	$(MAKE) -C $(ATMEL_PROJECT_DIR) $${TARGET} && \
#	mkdir -p $(DESTINATION_DIR)/$${NAME}/$${HWVER}/ && \
#	cp $(ATMEL_PROJECT_DIR)/$${NAME}/$${BOARD}/$${NAME}*.bin $(DESTINATION_DIR)/$${NAME}/$${HWVER}/
ATMEL_COMMANDS= \
	$(MAKE) -C $(ATMEL_PROJECT_DIR) $${TARGET}&& \
	mkdir -p $(DESTINATION_DIR)/$${NAME}/ && \
	cp $(ATMEL_PROJECT_DIR)/*.bin $(DESTINATION_DIR)/$${NAME}/
APP_COMMANDS= \
	$(MAKE) -C $(APP_PROJECT_DIR) $${TARGET} && \
	mkdir -p $(DESTINATION_DIR)/ && \
	cp $(APP_PROJECT_DIR)/*.bin $(DESTINATION_DIR)/

all: TOOLS ATMEL_DEVICES
	

#******************************************************************************
# CLEANING TARGETS
#******************************************************************************

clean : clean_local clean_atmel

clean_atmel:
	$(MAKE) -C $(ATMEL_PROJECT_DIR) clean

clean_tools:
	$(MAKE) -C $(APP_PROJECT_DIR) clean

clean_local:
	@echo "removing" $(DESTINATION_DIR) "folder."
	rm -rf $(DESTINATION_DIR)



TOOLS: command_line_tool 


ATMEL_DEVICES: atmega128



command_line_tool:
	NAME=application ; \
	#HWVER=V0.4 ; \
	TARGET=all ; \
	#BOARD=PROTO_P00C3 ; \
	$(APP_COMMANDS)

atmega128:	
        NAME: Atmel ;\ 
	TARGET:Atmega128 ;\
	HWVER: v1.0  ;\
	BOARD:proto ;\
	$(ATMEL_COMMANDS)	

help:
	@echo ""
	@echo "Make all (ATMEL + Application)."
	@echo ""
	@echo "Available MAKE targets:"
	@echo "  all:                 all targets (default target)"
	@echo "  Atmega128:               all Cortex based Kings and IP modules"
	@echo "  App:                 all Cortex based Kings and IP modules"
	@echo "  clean:               cleans the output dirs"
	@echo ""

.PHONY: help
