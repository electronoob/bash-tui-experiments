#include "font.h"
#include "stdio.h"

#define W 6
#define H 8

int dump(unsigned int c) {
	int h=0,w=0;
	const unsigned char *chr = font[c*W];
	for (w=0; w<W; w++) {
		for(h=0;h<H;h++) {
			/*  chr holds ptr to start of character in font list
			 *  we go through each byte of the character
			 *  character width may be say, 6, and so we iterate
			 *  at each col/row/whatever convert to binary
			 *  by bit-shifting left, character height times
			 *  if bit in byte at offset h
			 *  is true, print X else print space
			 * */
			if( chr[w] & (1<<h))
			{
				printf("X");
			} else {
				printf(" ");
			}
		}
		printf("\n");
	}
	return 0;
}
int main () {
	dump(6);
	return 0;
}

