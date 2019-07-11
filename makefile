all: crawler

crawler: main.o crawler.o connserver.o queue.o bloomfilter.o hashmap.o hash.o
	gcc -o crawler main.o crawler.o connserver.o queue.o bloomfilter.o hashmap.o hash.o -levent -lpthread -fno-stack-protector -g

main.o: main.c crawler.h 
	gcc -o main.o -c main.c -levent -lpthread -fno-stack-protector -g

crawler.o: crawler.c crawler.h common.h queue.h connserver.h bloomfilter.h hashmap.h
	gcc -o crawler.o -c crawler.c -levent -lpthread -fno-stack-protector -g

connserver.o: connserver.c connserver.h queue.h common.h
	gcc -o connserver.o -c connserver.c -levent -lpthread -fno-stack-protector -g

queue.o: queue.c queue.h 
	gcc -o queue.o -c queue.c -levent -fno-stack-protector -g

bloomfilter.o: bloomfilter.c bloomfilter.h hash.h
	gcc -o bloomfilter.o -c bloomfilter.c -levent -fno-stack-protector -g

hashmap.o: hashmap.c hashmap.h
	gcc -o hashmap.o -c hashmap.c -levent -fno-stack-protector -g

hash.o: hash.c hash.h
	gcc -o hash.o -c hash.c -levent -fno-stack-protector -g

.PHONY :clean

clean: 
	-rm crawler main.o crawler.o connserver.o queue.o bloomfilter.o hashmap.o hash.o
