def NUM_TETROMINOES equ 6
def PIECE_LONGBAR   equ $08

SECTION "free_space", ROM0[$00da]
remove_longbar::
        cp      a, PIECE_LONGBAR
        jr      c, .end
        add     4
.end
        ; replace original instructions
        ld      d, a
        ld      a, [$ffae]
        ret

SECTION "change_num_tetrominoes", ROM0[$204e]
        cp      NUM_TETROMINOES*4
SECTION "call_my_code", ROM0[$2054]
        call    remove_longbar
