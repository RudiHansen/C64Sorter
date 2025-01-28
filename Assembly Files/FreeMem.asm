*=$C000               ; Startadresse for maskinkoden (49152 decimal)

        lda $2D               ; Læs low-byte af fri hukommelse
        sta $C100             ; Gem det i RAM (49408 decimal)

        lda $2E               ; Læs high-byte af fri hukommelse
        sta $C101             ; Gem det i RAM (49409 decimal)

        rts                   ; Returner til BASIC
