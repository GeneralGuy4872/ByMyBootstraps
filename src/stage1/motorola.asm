MOVEB:

	move.b d0,(a7)
	move.b (a7)+#$F,d0 
	END MOVEB

MOVEW:

	move.w d0,(a7)
	move.w (a7)+#$F,d0 
	END MOVEW

MOVEL:

	move.l d0,(a7)
	move.l (a7)+#$F,d0 
	END MOVEL

ZEROFILLBW:

	move.w d0,(a7)
	eor.w #$FF00,d0 
	END ZEROFILLBW

ZEROFILLWL:

	move.l d0,(a7)
	eor.l #$FFFF0000,d0 
	END ZEROFILLWL

SIGNFILLBW:

	move.b d0,(a7)
	ext.w d1 
	END SIGNFILLBW

SIGNFILLWL:

	move.b d0,(a7)
	ext.l d1 
	END SIGNFILLWL
