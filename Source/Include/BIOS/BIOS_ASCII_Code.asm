;***********************************************************************
; American Standard Code for Information Interchange (ASCII)
; Resource: https://theasciicode.com.ar/
;***********************************************************************
;=======================================================================
; ASCII control characters
;=======================================================================
ASCII_NULL          equ     00      ; (Null Character)
ASCII_SOH           equ     01      ; (Start of Header)
ASCII_STX           equ     02      ; (Start of Text)
ASCII_ETX           equ     03      ; (End of Text)
ASCII_EOT           equ     04      ; (End of Transmission)
ASCII_ENQ           equ     05      ; (Enquiry)
ASCII_ACK           equ     06      ; (Acknowledgement)
ASCII_BEL           equ     07      ; (Bell)
ASCII_BS            equ     08      ; (Backspace)
ASCII_HT            equ     09      ; (Horizontal Tab)
ASCII_LF            equ     10      ; (Line Feed)
ASCII_VT            equ     11      ; (Vertical Tab)
ASCII_FF            equ     12      ; (Form Feed)
ASCII_CR            equ     13      ; (Carriage Return)
ASCII_SO            equ     14      ; (Shift Out)
ASCII_SI            equ     15      ; (Shift In)
ASCII_DLE           equ     16      ; (Data Link Escape)
ASCII_DC1           equ     17      ; (Device Control 1)
ASCII_DC2           equ     18      ; (Device Control 2)
ASCII_DC3           equ     19      ; (Device Control 3)
ASCII_DC4           equ     20      ; (Device Control 4)
ASCII_NAK           equ     21      ; (Negative Acknowledgement)
ASCII_SYN           equ     22      ; (Synchronous Idle)
ASCII_ETB           equ     23      ; (End of Transmission block)
ASCII_CAN           equ     24      ; (Cancel)
ASCII_EM            equ     25      ; (End of Medium)
ASCII_SUB           equ     26      ; (Substitute)
ASCII_ESC           equ     27      ; (Escape)
ASCII_FS            equ     28      ; (File Separator)
ASCII_GS            equ     29      ; (Group Separator)
ASCII_RS            equ     30      ; (Record Separator)
ASCII_US            equ     31      ; (Unit Separator)
ASCII_DEL           equ     127     ; (Delete)
;=======================================================================
; ASCII printable characters
;=======================================================================
ASCII_SPACE                     equ  32
ASCII_EXCLAMATION_MARK          equ  33 ; Ex Claymation ?
ASCII_DOUBLE_QUOTATION_MARK     equ  34
ASCII_NUMBER_SIGN               equ  35
ASCII_DOLLAR_SIGN               equ  36
ASCII_PERCENT_SIGN              equ  37 ; Per Cent ?
ASCII_AMPERSAND                 equ  38 ; Am Per Sand / Ampers And ?
ASCII_APOSTROPHE                equ  39 ; Single Quot., Apostrophe = A Post Rophe !?
ASCII_ROUND_BRACKETS_OPEN       equ  40 ; Parenthesis = Parent Hesis !? OPEN
ASCII_ROUND_BRACKETS_CLOSE      equ  41 ; Parenthesis = Parent Hesis !? CLOSE
ASCII_ASTERISK                  equ  42 ; As Te Risk ?
ASCII_PLUS_SIGN                 equ  43
ASCII_COMMA                     equ  44
ASCII_HYPHEN                    equ  45 ; Hyp Hen = Hypo Hen !? [:p]
ASCII_DOT                       equ  46 ; FUll Stop
ASCII_FORWARD_SLASH             equ  47
ASCII_ZERO                      equ  48
ASCII_ONE                       equ  49
ASCII_TWO                       equ  50
ASCII_THREE                     equ  51
ASCII_FOUR                      equ  52
ASCII_FIVE                      equ  53
ASCII_SIX                       equ  54
ASCII_SEVEN                     equ  55
ASCII_EIGHT                     equ  56
ASCII_NINE                      equ  57
ASCII_COLON                     equ  58
ASCII_SEMICOLON                 equ  59
ASCII_LESS_THAN_SIGN            equ  60
ASCII_EQUALS_SIGN               equ  61
ASCII_GREATER_THAN_SIGN         equ  62
ASCII_QUESTION_MARK             equ  63
ASCII_AT_SIGN                   equ  64
ASCII_UPPERCASE_A               equ  65
ASCII_UPPERCASE_B               equ  66
ASCII_UPPERCASE_C               equ  67
ASCII_UPPERCASE_D               equ  68
ASCII_UPPERCASE_E               equ  69
ASCII_UPPERCASE_F               equ  70
ASCII_UPPERCASE_G               equ  71
ASCII_UPPERCASE_H               equ  72
ASCII_UPPERCASE_I               equ  73
ASCII_UPPERCASE_J               equ  74
ASCII_UPPERCASE_K               equ  75
ASCII_UPPERCASE_L               equ  76
ASCII_UPPERCASE_M               equ  77
ASCII_UPPERCASE_N               equ  78
ASCII_UPPERCASE_O               equ  79
ASCII_UPPERCASE_P               equ  80
ASCII_UPPERCASE_Q               equ  81
ASCII_UPPERCASE_R               equ  82
ASCII_UPPERCASE_S               equ  83
ASCII_UPPERCASE_T               equ  84
ASCII_UPPERCASE_U               equ  85
ASCII_UPPERCASE_V               equ  86
ASCII_UPPERCASE_W               equ  87
ASCII_UPPERCASE_X               equ  88
ASCII_UPPERCASE_Y               equ  89
ASCII_UPPERCASE_Z               equ  90
ASCII_SQUARE_BRACKETS_OPEN      equ  91
ASCII_BACK_SLASH                equ  92
ASCII_SQUARE_BRACKETS_CLOSE     equ  93
ASCII_CARET                     equ  94 ; Circumflex Accent
ASCII_UNDERSCORE                equ  95 ; Under Score / Under Strike ?
ASCII_GRAVE_ACCENT              equ  96
ASCII_LOWERCASE_A               equ  97
ASCII_LOWERCASE_B               equ  98
ASCII_LOWERCASE_C               equ  99
ASCII_LOWERCASE_D               equ  100
ASCII_LOWERCASE_E               equ  101
ASCII_LOWERCASE_F               equ  102
ASCII_LOWERCASE_G               equ  103
ASCII_LOWERCASE_H               equ  104
ASCII_LOWERCASE_I               equ  105
ASCII_LOWERCASE_J               equ  106
ASCII_LOWERCASE_K               equ  107
ASCII_LOWERCASE_L               equ  108
ASCII_LOWERCASE_M               equ  109
ASCII_LOWERCASE_N               equ  110
ASCII_LOWERCASE_O               equ  111
ASCII_LOWERCASE_P               equ  112
ASCII_LOWERCASE_Q               equ  113
ASCII_LOWERCASE_R               equ  114
ASCII_LOWERCASE_S               equ  115
ASCII_LOWERCASE_T               equ  116
ASCII_LOWERCASE_U               equ  117
ASCII_LOWERCASE_V               equ  118
ASCII_LOWERCASE_W               equ  119
ASCII_LOWERCASE_X               equ  120
ASCII_LOWERCASE_Y               equ  121
ASCII_LOWERCASE_Z               equ  122
ASCII_CURLY_BRACKETS_OPEN       equ  123
ASCII_VERTICAL_SLASH            equ  124
ASCII_CURLY_BRACKETS_CLOSE      equ  125
ASCII_TILDE                     equ  126 ; Swung Dash
;=======================================================================
; Extended ASCII characters
;=======================================================================
ASCII_MAJUSCULE_C_CEDILLA                   equ  128
ASCII_LOWERCASE_U_WITH_DIAERESIS            equ  129 ; Or letter u with umlaut
ASCII_LOWERCASE_E_WITH_ACUTE_ACCENT         equ  130
ASCII_LOWERCASE_A_WITH_CARE                 equ  131 ; Or letter a with circumflex accent
ASCII_LOWERCASE_A_WITH_DIAERESIS            equ  132 ; Or letter a with umlaut
ASCII_LOWERCASE_A_WITH_GRAVE_ACCENT         equ  133
ASCII_LOWERCASE_A_WITH_RING                 equ  134
ASCII_MINUSCULE_C_CEDILLA                   equ  135
ASCII_LOWERCASE_E_WITH_CARET                equ  136 ; Or letter e with circumflex accent
ASCII_LOWERCASE_E_WITH_DIAERESIS            equ  137 ; Or letter e with umlaut
ASCII_LOWERCASE_E_WITH_GRAVE_ACCENT         equ  138
ASCII_LOWERCASE_I_WITH_DIAERESIS            equ  139 ; Or letter i with umlaut
ASCII_LOWERCASE_I_WITH_CARET                equ  140 ; Or letter i with circumflex accent
ASCII_LOWERCASE_I_WITH_GRAVE_ACCENT         equ  141
ASCII_UPPERCASE_A_WITH_DIAERESIS            equ  142 ; Or letter A with umlaut
ASCII_UPPERCASE_A_WITH_RING                 equ  143
ASCII_UPPERCASE_E_WITH_ACUTE_ACCENT         equ  144
ASCII_LOWERCASE_AE_LATIN_DIPHTHONG          equ  145
ASCII_UPPERCASE_AE_LATIN_DIPHTHONG          equ  146
ASCII_LOWERCASE_O_WITH_CARET                equ  147 ; Or letter o with circumflex accent
ASCII_LOWERCASE_O_WITH_DIAERESIS            equ  148 ; Or letter o with umlaut
ASCII_LOWERCASE_O_WITH_GRAVE_ACCENT         equ  149
ASCII_LOWERCASE_U_WITH_CARET                equ  150 ; Or letter u with circumflex accent
ASCII_LOWERCASE_U_WITH_GRAVE_ACCENT         equ  151
ASCII_LOWERCASE_Y_WITH_DIAERESIS            equ  152 ; Or letter y with umlaut
ASCII_UPPERCASE_O_WITH_DIAERESIS            equ  153 ; Or letter O with umlaut
ASCII_UPPERCASE_U_WITH_DIAERESIS            equ  154 ; Or letter U with umlaut
ASCII_LOWERCASE_SLASHED_ZERO                equ  155 ; Or empty set
ASCII_POUND_SIGN                            equ  156 ; symbol for the pound sterling
ASCII_UPPERCASE_SLASHED_ZERO                equ  157 ; Or empty set
ASCII_MULTIPLICATION_SIGN                   equ  158
ASCII_FUNCTION_SIGN                         equ  159 ; f with hook sign / florin sign
ASCII_LOWERCASE_A_WITH_ACUTE_ACCENT         equ  160
ASCII_LOWERCASE_I_WITH_ACUTE_ACCENT         equ  161
ASCII_LOWERCASE_O_WITH_ACUTE_ACCENT         equ  162
ASCII_LOWERCASE_U_WITH_ACUTE_ACCENT         equ  163
ASCII_LOWERCASE_N_WITH_TILDE                equ  164
ASCII_UPPERCASE_N_WITH_TILDE                equ  165
ASCII_FEMININE_ORDINAL_INDICATOR            equ  166
ASCII_MASCULINE_ORDINAL_INDICATOR           equ  167
ASCII_INVERTED_QUESTION_MARK                equ  168
ASCII_REGISTERED_TRADEMARK_SYMBOL           equ  169
ASCII_LOGICAL_NEGATION_SYMBOL               equ  170
ASCII_ONE_HALF                              equ  171
ASCII_ONE_FOURTH                            equ  172
ASCII_INVERTED_EXCLAMATION_MARK             equ  173
ASCII_LEFT_POINTING_QUOTATION_MARK          equ  174 ; Guillemets, angle quotes
ASCII_RIGHT_POINTING_QUOTATION_MARK         equ  175 ; Guillemets, angle quotes
ASCII_ALTER_176                             equ  176
ASCII_ALTER_177                             equ  177
ASCII_ALTER_178                             equ  178
ASCII_ALTER_179                             equ  179
ASCII_ALTER_180                             equ  180
ASCII_UPPERCASE_A_WITH_ACUTE_ACCENT         equ  181
ASCII_UPPERCASE_A_WITH_CARET                equ  182 ; Or letter A with circumflex accent
ASCII_UPPERCASE_A_WITH_GRAVE_ACCENT         equ  183
ASCII_COPYRIGHT_SYMBOL                      equ  184
ASCII_ALTER_185                             equ  185
ASCII_ALTER_186                             equ  186
ASCII_ALTER_187                             equ  187
ASCII_ALTER_188                             equ  188
ASCII_CENT_SYMBOL                           equ  189
ASCII_YEN_AND_YUAN_SIGN                     equ  190
ASCII_ALTER_191                             equ  191
ASCII_ALTER_192                             equ  192
ASCII_ALTER_193                             equ  193
ASCII_ALTER_194                             equ  194
ASCII_ALTER_195                             equ  195
ASCII_ALTER_196                             equ  196
ASCII_ALTER_197                             equ  197
ASCII_LOWERCASE_A_WITH_TILDE                equ  198
ASCII_UPPERCASE_A_WITH_TILDE                equ  199
ASCII_ALTER_200                             equ  200
ASCII_ALTER_201                             equ  201
ASCII_ALTER_202                             equ  202
ASCII_ALTER_203                             equ  203
ASCII_ALTER_204                             equ  204
ASCII_ALTER_205                             equ  205
ASCII_ALTER_206                             equ  206
ASCII_GENERIC_CURRENCY_SIGN                 equ  207
ASCII_LOWERCASE_LETTER_ETH                  equ  208
ASCII_UPPERCASE_LETTER_ETH                  equ  209
ASCII_UPPERCASE_E_WITH_CARET                equ  210 ; Or letter E with circumflex accent
ASCII_UPPERCASE_E_WITH_DIAERESIS            equ  211 ; Or letter E with umlaut
ASCII_UPPERCASE_E_WITH_GRAVE_ACCENT         equ  212
ASCII_LOWERCASE_DOT_LESS_I                  equ  213
ASCII_UPPERCASE_I_WITH_ACUTE_ACCENT         equ  214
ASCII_UPPERCASE_I_WITH_CARET                equ  215 ; Or letter I with circumflex accent
ASCII_UPPERCASE_I_WITH_DIAERESIS            equ  216 ; Or letter E with umlaut
ASCII_ALTER_217                             equ  217
ASCII_ALTER_218                             equ  218
ASCII_BLOCK                                 equ  219
ASCII_BOTTOM_HALF_BLOCK                     equ  220
ASCII_VERTICAL_BROKEN_BAR                   equ  221
ASCII_UPPERCASE_I_WITH_GRAVE_ACCENT         equ  222
ASCII_TOP_HALF_BLOCK                        equ  223
ASCII_UPPERCASE_O_WITH_ACUTE_ACCENT         equ  224
ASCII_LETTER_ESZETT                         equ  225 ; Scharfes S or sharp S
ASCII_UPPERCASE_O_WITH_CARET                equ  226 ; Or letter O with circumflex accent
ASCII_UPPERCASE_O_WITH_GRAVE_ACCENT         equ  227
ASCII_LOWERCASE_O_WITH_TILDE                equ  228
ASCII_UPPERCASE_O_WITH_TILDE                equ  229
ASCII_MICRO_SIGN                            equ  230 ; Or micron, Lowercase letter Mu
ASCII_LOWERCASE_LETTER_THORN                equ  231
ASCII_UPPERCASE_LETTER_THORN                equ  232
ASCII_UPPERCASE_U_WITH_ACUTE_ACCENT         equ  233
ASCII_UPPERCASE_U_WITH_CARET                equ  234 ; Or letter U with circumflex accent
ASCII_UPPERCASE_U_WITH_GRAVE_ACCENT         equ  235
ASCII_LOWERCASE_Y_WITH_ACUTE_ACCENT         equ  236
ASCII_UPPERCASE_Y_WITH_ACUTE_ACCENT         equ  237
ASCII_MACRON_SYMBOL                         equ  238
ASCII_ACUTE_ACCENT                          equ  239
ASCII_THREE_HYPHEN                          equ  240
ASCII_PLUS_MINUS_SIGN                       equ  241
ASCII_DOUBLE_UNDERLINE                      equ  242 ; Or underscore
ASCII_THREE_QUARTERS                        equ  243 ; Or three-fourths
ASCII_PARAGRAPH_SIGN                        equ  244 ; Or pilcrow, end paragraph mark
ASCII_SECTION_SIGN                          equ  245
ASCII_DIVISION_SIGN                         equ  246
ASCII_CEDILLA                               equ  247
ASCII_DEGREE_SYMBOL                         equ  248
ASCII_DIARESIS                              equ  249
ASCII_SPACE_DOT                             equ  250 ; Or interpunct
ASCII_SUPERSCRIPT_ONE                       equ  251 ; Exponent 1, first power
ASCII_SUPERSCRIPT_THREE                     equ  252 ; Exponent 3, cube, third power
ASCII_SUPERSCRIPT_TWO                       equ  253 ; Exponent 2, square, second power
ASCII_BLACK_SQUARE                          equ  254
ASCII_NO_BREAK_SPACE                        equ  255 ; (nbsp) Or Non-breaking space
;***********************************************************************
;//EOF
