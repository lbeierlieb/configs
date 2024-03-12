#include QMK_KEYBOARD_H
#include <stdio.h>
#include "keymap_german.h"

#define GUI_R LGUI_T(DE_R)
#define SYM_S LT(2, DE_S)
#define SHF_T LSFT_T(DE_T)
#define CTR_H LCTL_T(DE_H)

#define CTR_N LCTL_T(DE_N)
#define SHF_A LSFT_T(DE_A)
#define SYM_I LT(1, DE_I)
#define GUI_O LGUI_T(DE_O)

#define NAV_SPC LT(4, KC_SPC)
#define SPE_ENT LT(5, KC_ENT)
//#define ALT_TAB LALT_T(KC_TAB)
#define NUM_E LT(3, DE_E)
#define MS_ESC LT(7, KC_ESC)

#define SH_ADIA S(DE_ADIA)
#define SH_ODIA S(DE_ODIA)
#define SH_UDIA S(DE_UDIA)

const uint16_t PROGMEM keymaps[][MATRIX_ROWS][MATRIX_COLS] = {
  [0] = LAYOUT_split_3x6_3( // BASE layer
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      XXXXXXX,    DE_J,    DE_C,    DE_Y,    DE_F,    DE_K,                         DE_Z,    DE_L, KC_BSPC,    DE_U,    DE_Q,   TG(9),
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      KC_LALT,   GUI_R,   SYM_S,   SHF_T,   CTR_H,    DE_D,                         DE_M,   CTR_N,   SHF_A,   SYM_I,   GUI_O, KC_LALT,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, XXXXXXX,    DE_V,    DE_G,    DE_P,    DE_B,                         DE_X,    DE_W,  KC_TAB, XXXXXXX, XXXXXXX,   TG(8),
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                           TG(10),  MS_ESC, NAV_SPC,      NUM_E, SPE_ENT,   MO(6)
                                      //`--------------------------'  `--------------------------'

  ),
  //[9] = LAYOUT_split_3x6_3(  // RSTHD
  ////,-----------------------------------------------------.                    ,-----------------------------------------------------.
  //     KC_ESC,    DE_J,    DE_C,    DE_Y,    DE_F,    DE_K,                         DE_Z,    DE_L, KC_BSPC,    DE_U,   DE_Q,  _______,
  ////|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
  //    KC_LCTL,    DE_R,    DE_S,    DE_T,    DE_H,    DE_D,                         DE_M,    DE_N,    DE_A,    DE_I,    DE_O,  KC_ENT,
  ////|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
  //    KC_LSFT, XXXXXXX,    DE_V,    DE_G,    DE_P,    DE_B,                         DE_X,    DE_W, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  ////|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
  //                                        KC_LGUI, XXXXXXX,  KC_SPC,       DE_E, XXXXXXX, KC_LALT
  //                                    //`--------------------------'  `--------------------------'

  [1] = LAYOUT_split_3x6_3( // left hand symbols
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      XXXXXXX, DE_LABK, DE_MINS,  DE_EQL, DE_RABK, DE_COLN,                      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|-------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, DE_EXLM, DE_LPRN, DE_RPRN, DE_SCLN, DE_ASTR,                      XXXXXXX, KC_LCTL, KC_LSFT, _______, KC_LGUI, KC_LALT,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, DE_DQUO, DE_PERC, DE_QUOT, DE_COMM, DE_CIRC,                      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          XXXXXXX, XXXXXXX, DE_UNDS,    XXXXXXX, XXXXXXX, XXXXXXX
                                      //`--------------------------'  `--------------------------'
  ),

  [2] = LAYOUT_split_3x6_3( // right hand symbols
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      DE_PIPE, DE_LCBR, DE_RCBR, DE_QUES,   DE_AT, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      KC_LALT, KC_LGUI, _______, KC_LSFT, KC_LCTL, XXXXXXX,                      DE_AMPR,  DE_DOT, DE_SLSH, DE_PLUS, DE_BSLS, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                       DE_DLR, DE_LBRC, DE_RBRC, DE_TILD, DE_HASH, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          XXXXXXX, XXXXXXX, XXXXXXX,    XXXXXXX, XXXXXXX, XXXXXXX
                                      //`--------------------------'  `--------------------------'
  ),

  [3] = LAYOUT_split_3x6_3( // numbers
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+   -----+--------+--------+--------+--------|
      XXXXXXX,    DE_1,    DE_2,    DE_3,    DE_4,    DE_5,                         DE_6,    DE_7,    DE_8,    DE_9,    DE_0, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+   -----+--------+--------+--------+--------|
      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, KC_LSFT, XXXXXXX,                      XXXXXXX, KC_LSFT, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+-----------+-----+--------+--------+--------+--------|
                                          XXXXXXX, KC_LCTL, KC_LGUI,    _______, XXXXXXX, XXXXXXX
                                      //`--------------------------'  `--------------------------'
  ),

  [4] = LAYOUT_split_3x6_3( // navigation
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      KC_HOME, KC_PGDN, KC_PGUP,  KC_END, KC_BSPC, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, XXXXXXX, XXXXXXX, KC_LSFT, KC_LCTL, XXXXXXX,                      KC_LEFT, KC_DOWN,   KC_UP,KC_RIGHT,  KC_DEL, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          XXXXXXX, XXXXXXX, _______,    XXXXXXX, XXXXXXX, XXXXXXX
                                      //`--------------------------'  `--------------------------'
  ),

  [5] = LAYOUT_split_3x6_3( // special
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      XXXXXXX, XXXXXXX, XXXXXXX, DE_UDIA, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, XXXXXXX,   DE_SS, XXXXXXX, XXXXXXX, XXXXXXX,                      XXXXXXX, XXXXXXX, DE_ADIA, XXXXXXX, DE_ODIA, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          XXXXXXX, KC_LSFT, XXXXXXX,    XXXXXXX, _______, XXXXXXX
                                      //`--------------------------'  `--------------------------'
  ),

  [6] = LAYOUT_split_3x6_3( // keyboard
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      QK_BOOT, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          XXXXXXX, XXXXXXX, XXXXXXX,    XXXXXXX, XXXXXXX, _______
                                      //`--------------------------'  `--------------------------'
  ),

  [7] = LAYOUT_split_3x6_3( // mouse
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      XXXXXXX, KC_WH_U, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, XXXXXXX, XXXXXXX, KC_LSFT, KC_LCTL, XXXXXXX,                      KC_MS_L, KC_MS_D, KC_MS_U, KC_MS_R, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      XXXXXXX, KC_WH_D, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          XXXXXXX, _______, XXXXXXX,    KC_BTN1, KC_BTN3, KC_BTN2
                                      //`--------------------------'  `--------------------------'
  ),

  [8] = LAYOUT_split_3x6_3(  // QWERTZ
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
       KC_ESC,    DE_Q,    DE_W,    DE_E,    DE_R,    DE_T,                         DE_Z,    DE_U,    DE_I,    DE_O,   DE_P,  KC_BSPC,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      KC_LCTL,    DE_A,    DE_S,    DE_D,    DE_F,    DE_G,                         DE_H,    DE_J,    DE_K,    DE_L, XXXXXXX,  KC_ENT,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      KC_LSFT,    DE_Y,    DE_X,    DE_C,    DE_V,    DE_B,                         DE_N,    DE_M, DE_COMM,  DE_DOT, DE_MINS, _______,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          KC_LGUI, XXXXXXX,  KC_SPC,     KC_SPC, XXXXXXX, KC_LALT
                                      //`--------------------------'  `--------------------------'

  ),

  [9] = LAYOUT_split_3x6_3(  // Minecraft
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
         DE_L,    DE_Q,    DE_W, XXXXXXX, XXXXXXX, XXXXXXX,                      XXXXXXX, KC_WH_D, XXXXXXX, XXXXXXX, XXXXXXX, _______,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      KC_LCTL,    DE_A,    DE_S,    DE_D, XXXXXXX, XXXXXXX,                      KC_MS_L, KC_MS_D, KC_MS_U, KC_MS_R, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      KC_LSFT, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,                      XXXXXXX, KC_WH_D, XXXXXXX, XXXXXXX, XXXXXXX, XXXXXXX,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                             DE_E,  KC_ESC,  KC_SPC,    KC_BTN1, KC_BTN3, KC_BTN2
                                      //`--------------------------'  `--------------------------'

  ),

  [10] = LAYOUT_split_3x6_3( // Colemak-DH for Yannik
  //,-----------------------------------------------------.                    ,-----------------------------------------------------.
       KC_TAB,    DE_Q,    DE_W,    DE_F,    DE_P,    DE_B,                         DE_J,    DE_L,    DE_U,    DE_Y, DE_SCLN, KC_BSPC,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      KC_LSFT,    DE_A,    DE_R,    DE_S,    DE_T,    DE_G,                         DE_M,    DE_N,    DE_E,    DE_I,    DE_O, DE_QUOT,
  //|--------+--------+--------+--------+--------+--------|                    |--------+--------+--------+--------+--------+--------|
      KC_LCTL,    DE_Z,    DE_X,    DE_C,    DE_D,    DE_V,                         DE_K,    DE_K, DE_COMM,  DE_DOT, DE_SLSH,  KC_ESC,
  //|--------+--------+--------+--------+--------+--------+--------|  |--------+--------+--------+--------+--------+--------+--------|
                                          _______, KC_LGUI,  KC_SPC,     KC_ENT, XXXXXXX, KC_RALT
                                      //`--------------------------'  `--------------------------'

  ),
};

#ifdef OLED_ENABLE
oled_rotation_t oled_init_user(oled_rotation_t rotation) {
  if (!is_keyboard_master()) {
    return OLED_ROTATION_180;  // flips the display 180 degrees if offhand
  }
  return rotation;
}

void oled_render_layer_state(void) {
    oled_write_P(PSTR("Layer: "), false);
    switch (layer_state) {
        case 0b0:
            oled_write_ln_P(PSTR("Default"), false);
            break;
        case 0b10:
            oled_write_ln_P(PSTR("Symbols left"), false);
            break;
        case 0b100:
            oled_write_ln_P(PSTR("Symbols right"), false);
            break;
        case 0b1000:
            oled_write_ln_P(PSTR("Numbers"), false);
            break;
        case 0b10000:
            oled_write_ln_P(PSTR("Navigation"), false);
            break;
        case 0b100000:
            oled_write_ln_P(PSTR("Special"), false);
            break;
        case 0b1000000:
            oled_write_ln_P(PSTR("Bootloader"), false);
            break;
        case 0b10000000:
            oled_write_ln_P(PSTR("Mouse"), false);
            break;
        case 0b100000000:
            oled_write_ln_P(PSTR("QWERTZ"), false);
            break;
        case 0b1000000000:
            oled_write_ln_P(PSTR("Minecraft"), false);
            break;
        case 0b10000000000:
            oled_write_ln_P(PSTR("Colemak-DH"), false);
            break;
    }
}


char keylog_str[24] = {};

const char code_to_name[60] = {
    ' ', ' ', ' ', ' ', 'a', 'b', 'c', 'd', 'e', 'f',
    'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p',
    'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z',
    '1', '2', '3', '4', '5', '6', '7', '8', '9', '0',
    'R', 'E', 'B', 'T', '_', '-', '=', '[', ']', '\\',
    '#', ';', '\'', '`', ',', '.', '/', ' ', ' ', ' '};

void set_keylog(uint16_t keycode, keyrecord_t *record) {
  char name = ' ';
    if ((keycode >= QK_MOD_TAP && keycode <= QK_MOD_TAP_MAX) ||
        (keycode >= QK_LAYER_TAP && keycode <= QK_LAYER_TAP_MAX)) { keycode = keycode & 0xFF; }
  if (keycode < 60) {
    name = code_to_name[keycode];
  }

  // update keylog
  snprintf(keylog_str, sizeof(keylog_str), "%dx%d, k%2d : %c",
           record->event.key.row, record->event.key.col,
           keycode, name);
}

void oled_render_keylog(void) {
    //oled_write(keylog_str, false);
}

void render_bootmagic_status(bool status) {
    /* Show Ctrl-Gui Swap options */
    static const char PROGMEM logo[][2][3] = {
        {{0x97, 0x98, 0}, {0xb7, 0xb8, 0}},
        {{0x95, 0x96, 0}, {0xb5, 0xb6, 0}},
    };
    if (status) {
        oled_write_ln_P(logo[0][0], false);
        oled_write_ln_P(logo[0][1], false);
    } else {
        oled_write_ln_P(logo[1][0], false);
        oled_write_ln_P(logo[1][1], false);
    }
}

void oled_render_logo(void) {
    static const char PROGMEM crkbd_logo[] = {
        0x80, 0x81, 0x82, 0x83, 0x84, 0x85, 0x86, 0x87, 0x88, 0x89, 0x8a, 0x8b, 0x8c, 0x8d, 0x8e, 0x8f, 0x90, 0x91, 0x92, 0x93, 0x94,
        0xa0, 0xa1, 0xa2, 0xa3, 0xa4, 0xa5, 0xa6, 0xa7, 0xa8, 0xa9, 0xaa, 0xab, 0xac, 0xad, 0xae, 0xaf, 0xb0, 0xb1, 0xb2, 0xb3, 0xb4,
        0xc0, 0xc1, 0xc2, 0xc3, 0xc4, 0xc5, 0xc6, 0xc7, 0xc8, 0xc9, 0xca, 0xcb, 0xcc, 0xcd, 0xce, 0xcf, 0xd0, 0xd1, 0xd2, 0xd3, 0xd4,
        0};
    oled_write_P(crkbd_logo, false);
}

bool oled_task_user(void) {
    if (is_keyboard_master()) {
        oled_render_layer_state();
        oled_render_keylog();
    } else {
        oled_render_logo();
    }
    return false;
}

bool process_record_user(uint16_t keycode, keyrecord_t *record) {
  if (record->event.pressed) {
    set_keylog(keycode, record);
  }
  return true;
}
#endif // OLED_ENABLE
