
; == macro.ks ==============================================

; マクロを定義してリターンするだけのシナリオファイルです。
; first.ksからサブルーチンとして呼び出されます。
; 最後に[return]必須。
;
;
; マクロって何さ、という方は公式ページの説明をご一読くださいませ。
; http://tyrano.jp/usage/tech/macro
;
;
; ＝定義しているマクロ一覧＝
; 
; ├表情変更マクロ
; │├あかね
; ││├[akn/def]
; ││├[akn/hap]
; ││├[akn/sad]
; ││├[akn/dok]
; ││├[akn/ang]
; │├やまと
; │　├[ymt/def]
; │　├[ymt/hap]
; │　├[ymt/sad]
; │　├[ymt/thh]
; │　├[ymt/ang]
; │
; ├画面破壊/再構築マクロ
; │├[destroy]
; │├[reset_all]
; │├[set_message_window]
; │├[set_default_view]
; │
; ├部屋背景マクロ
; │├[room/day]
; │├[room/evening]
; │└[room/night]
; │
; ├目次表示マクロ
; 　├[index_reset]
; 　└[list_item]
;
; ==========================================================




; ----------------------------------------------------------
; 表情変更用マクロ
; ----------------------------------------------------------


; == macro.ks ==============================================
;
; とよぽんゲーム用マクロ集
; first.ks から [call storage="macro.ks"] で読み込む
;
; ==========================================================



; ----------------------------------------------------------
; とよぽん 表情変更マクロ
; 名前欄は変更せず、表情だけ変更する
; ----------------------------------------------------------

; 通常
[macro name="typ/def"]

[chara_mod name="toyopon" face="def"]

[endmacro]


; 笑顔
[macro name="typ/hap"]

[chara_mod name="toyopon" face="happy"]

[endmacro]


; スマホ通常
[macro name="typ/ph_def"]

[chara_mod name="toyopon" face="phone_def"]

[endmacro]


; スマホ笑顔
[macro name="typ/ph_hap"]

[chara_mod name="toyopon" face="phone_happy"]

[endmacro]


; エアコン稼働
[macro name="typ/air_run"]

[chara_mod name="toyopon" face="aircon_run"]

[endmacro]


; エアコン停止
[macro name="typ/air_off"]

[chara_mod name="toyopon" face="aircon_off"]

[endmacro]


; ----------------------------------------------------------
; 部屋背景マクロ
; time を省略した場合は 500ms で切り替える。
; 例: [room/day time="0"]
; ----------------------------------------------------------

[macro name="room/day"]
[if exp="!mp.time"]
[eval exp="mp.time='500'"]
[endif]
[bg storage="room.jpg" time="&mp.time"]
[endmacro]

[macro name="room/evening"]
[if exp="!mp.time"]
[eval exp="mp.time='500'"]
[endif]
[bg storage="roomevening.jpg" time="&mp.time"]
[endmacro]

[macro name="room/night"]
[if exp="!mp.time"]
[eval exp="mp.time='500'"]
[endif]
[bg storage="roomnight.jpg" time="&mp.time"]
[endmacro]








; ----------------------------------------------------------
; 画面の破壊/再構築系マクロ
; ----------------------------------------------------------



; ----------------------------------------------------------
; [destroy]
; すべてのレイヤーの画像やテキスト、ボタンなどを破壊し、
; ゲーム画面を更地に戻します。
[macro name="destroy"]
; メニューボタンを隠す
[hidemenubutton]
; メッセージの削除およびフリーレイヤーの解放
; (フリーレイヤー＝ボタンやHTMLなどが挿入されるレイヤー)
[cm]
; fixレイヤーの解放
[clearfix]
; 合成レイヤーの解放
[free_layermode time="0"]
; フィルターの解放
[free_filter]
; レイヤーの解放
[freeimage layer="base"]
[freeimage layer="0"]
[freeimage layer="1"]
[freeimage layer="2"]
[freeimage layer="base" page="back"]
[freeimage layer="0"    page="back"]
[freeimage layer="1"    page="back"]
[freeimage layer="2"    page="back"]
; メッセージウィンドウの非表示
[layopt layer="message0" visible="false"]
[layopt layer="message1" visible="false"]
[endmacro]


[macro name="reset_all"]
[destroy]
[hidemenubutton]

[position width="928" height="608" left="16" top="16" color="0x000000" opacity="128" margint="8" marginr="8" marginb="8" marginl="8" frame="none"]
[deffont size="24" face="メイリオ"]
[resetfont]
[free name="chara_name_area" layer="message0"]
[layopt layer="base" visible="true"]
[layopt layer="0" visible="false"]
[layopt layer="1" visible="false"]
[layopt layer="2" visible="false"]
[layopt layer="message0" visible="true"]
[layopt layer="message1" visible="false"]
[endmacro]

; ----------------------------------------------------------
; [set_default_view]
; 画面をマスク→デストロイした後に
; 教室の背景＋あかねの立ち絵＋メッセージウィンドウを表示して
; マスクオフします。
; chara="off"を指定すると、キャラクターを表示しません。
[macro name="set_default_view"]

; [mask]～[mask_off]　マスクしている間に、画面の破壊と再構築を行います。
[mask color="white" time="400"]

; [destroy] 独自マクロ。画面にあるもの、画面にある効果、すべてを破壊します。
[destroy]

; [set_message_window] 独自マクロ。メッセージウィンドウをセットしなおします。
[set_message_window]

; [layopt] メッセージウィンドウを表示します。
[layopt layer="message0" visible="true"]

; [bg][chara_show][wait] 解説画面用の背景、キャラを表示してから、ちょっと待機します。
[room/day time="0"]
[if exp="chara != 'off'"]
[chara_show time="0" name="toyopon" face="def" x="30" y="180" width="480"]
[endif]
[wait       time="100"]

[mask_off time="400"]


[endmacro]



; ----------------------------------------------------------
; [set_message_window]
; ----------------------------------------------------------
; [set_message_window]
; メッセージウィンドウだけを表示する。
; 画面下のロールボタンは表示しない仕様。
; ----------------------------------------------------------
[macro name="set_message_window"]

; メッセージレイヤーのウィンドウ位置・画像・余白
[position left="0" top="440" width="960" height="200" frame="window0/_frame.png"]
[position margint="50" marginl="25" marginr="25" marginb="10"]

; 名前欄をリセット
[free name="chara_name_area" layer="message0"]

; fixボタンを消す
[clearfix]

; ゲーム中に音量設定へ入れるようメニューボタンを表示
[showmenubutton]

; 名前欄用ptext
[ptext name="chara_name_area" layer="message0" zindex="102" size="32" face="ロゴたいぷゴシック,メイリオ,sans-serif" x="36" y="445" color="0xffffff" edge="0x000000"]
[chara_config ptext="chara_name_area"]

; フォント設定
[deffont size="40" face="ロゴたいぷゴシック,メイリオ,sans-serif" color="0xffffff" edge="0x000000"]
[resetfont]

[endmacro]
[return]
