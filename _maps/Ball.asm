Map_Ball:       dc.w entry_5E82-*
                dc.w entry_5ea1-Map_Ball
                dc.w entry_5eb6-Map_Ball
                dc.w entry_5ecb-Map_Ball
entry_5E82:     dc.b 6
                dc.b $F0, 4, 0, $24, $F0
                dc.b $F8, 4, $10, $24, $F0
                dc.b $E8, $A, 0, 0, $E8
                dc.b $E8, $A, 8, 0, 0
                dc.b 0, $A, $10, 0, $E8
                dc.b 0, $A, $18, 0, 0
entry_5ea1:     dc.b   4
                dc.b $E8, $A, 0, 9, $E8
                dc.b $E8, $A, 8, 9, 0
                dc.b 0, $A, $10, 9, $E8
                dc.b 0, $A, $18, 9, 0
entry_5eb6:     dc.b   4
                dc.b $E8, $A, 0, $12, $E8
                dc.b $E8, $A, 0, $1B, 0
                dc.b 0, $A, $18, $1B, $E8
                dc.b 0, $A, $18, $12, 0
entry_5ecb:     dc.b   4
                dc.b $E8, $A, 8, $1B, $E8
                dc.b $E8, $A, 8, $12, 0
                dc.b 0, $A, $10, $12, $E8
                dc.b 0, $A, $10, $1B, 0