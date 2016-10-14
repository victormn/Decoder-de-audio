CFLAGS= -I inc/

all: classes
	@gcc ./src/encoder.c $(CFLAGS) -o encoder ./obj/file_manager.o ./obj/bit_manager.o ./obj/testes.o ./obj/diferenca.o -lm -Wall -g -O0
	@echo "! Compilado com sucesso !"
	@echo
	@echo "Para rodar, utilize:"
	@echo "./encoder -d -c -h <entrada.wav> <saida.bin>"
	@echo "As flags -d -c -h sao opcionais e podem ser inseridas em qualquer ordem"

classes:
	@gcc -c ./src/file_manager.c $(CFLAGS) -o ./obj/file_manager.o -g
	@gcc -c ./src/bit_manager.c $(CFLAGS) -o ./obj/bit_manager.o -g
	@gcc -c ./src/testes.c $(CFLAGS) -o ./obj/testes.o -g
	@gcc -c ./src/diferenca.c $(CFLAGS) -o ./obj/diferenca.o -g

clean:
	@rm -f ./obj/*.o encoder
	@find -name "*~" | xargs rm -rf

memory:
	@valgrind --track-origins=yes ./encoder -d -c -h files/inputs/sample1.wav files/output/output.wav

run:
	@echo "Apenas para testes..."
	@./encoder -d -c -h files/inputs/sample1.wav files/output/output.wav