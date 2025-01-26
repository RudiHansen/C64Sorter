*=$1000

start:
        lda #$0
        sta $d020
        sta $d021
        lda #$91
        sta $286
        jsr $e544
        ldx #$0

introloop:
        lda introtext,x
        beq get_input
        sta $0400,x
        inx
        jmp introloop

get_input:
        jsr $ffe4
        cmp #$0
        beq get_input
        cmp #$103
        beq quit
        sec
        sbc #$40
        ldx #$0

secren_fill:
        sta $0400,x
        sta $0400+255,x
        sta $0400+510,x
        sta $0400+744,x
        inx
        bne screen_fill
        jmp get_input

introtext:
        .text "press any key or runstop to quit",0


quit:
        jsr $e544
        rts
