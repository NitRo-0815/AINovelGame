
; == first.ks ==============================================

; ゲームを起動したとき、一番最初に読み込まれるシナリオファイルです。
; このシナリオファイルは、プラグインの読み込みやマクロの定義などの
;《ゲーム全体で必要な初期設定》を行うために使います。
; 初期設定が終わったら、[jump]タグでタイトル画面などに移行しましょう。
; (なお、このシナリオファイルのファイル名を変えてはいけません。)
;
; ==========================================================



; [title] タイトルバーに表示されるテキストを変更します。
[title name="とよぽんとの1週間"]

; [call]x3 設定用サブルーチンを3つ呼びます。
[call target="*Sub_Layer"    ]
[call target="*Sub_Plugin"   ]
[call target="*Sub_Character"]

; [hidemenubutton] メニューボタンを隠します。
[hidemenubutton]

; [jump] day1.ksへ。
[jump storage="title.ks"]

[s]







;　～以下設定用のラベル～



; ----------------------------------------------------------
*Sub_Layer
; ----------------------------------------------------------

; レイヤーの表示非表示などを設定するサブルーチンラベルです。
; [call] でここに飛んできます。
; そして [return] に達した時点で、[call] の位置に戻ります。

; [hidemenubutton] メニューボタンを隠します。
[hidemenubutton]

; [layopt] メッセージレイヤー0番を非表示にします。
[layopt layer="message0" visible="false"]

; [layopt] 通常レイヤー0番･1番･2番を表示してあげます。
; 初期状態では非表示なので注意。
[layopt layer="0" visible="true"]
[layopt layer="1" visible="true"]
[layopt layer="2" visible="true"]

; [return] 帰ります。
[return]



; ----------------------------------------------------------
*Sub_Plugin
; ----------------------------------------------------------

; プラグインの読み込みなどを行うサブルーチンラベルです。

; [call] サブルーチンを呼びます。
[call storage="macro.ks"]

; [loadcss] cssファイルを読み込みます。独自フォントを使用するためのものです。
[loadcss file="data/others/font/font.css"]
[loadcss file="data/others/glink/glink.css"]

; [return] 帰ります。
[return]



; ----------------------------------------------------------
*Sub_Character
; ----------------------------------------------------------

; キャラクターの定義を行うサブルーチンラベルです。


; とよぽんのキャラクター定義
[chara_new  name="toyopon"  jname="とよぽん" storage="chara/toyopon/default.png"]

[chara_face name="toyopon" face="def"          storage="chara/toyopon/default.png"]
[chara_face name="toyopon" face="happy"        storage="chara/toyopon/happy.png"]
[chara_face name="toyopon" face="sad"        storage="chara/toyopon/sad.PNG"]

[chara_face name="toyopon" face="phone_def"    storage="chara/toyopon/phonedefault.png"]
[chara_face name="toyopon" face="phone_happy"  storage="chara/toyopon/phonehappy.png"]

[chara_face name="toyopon" face="aircon_run"   storage="chara/toyopon/airconrun.png"]
[chara_face name="toyopon" face="aircon_off"   storage="chara/toyopon/airconoff.png"]


; 増田さんのキャラクター定義
[chara_new  name="person2"  jname="増田さん" storage="chara/person2/default.png"]

[chara_face name="person2" face="def"          storage="chara/person2/default.png"]
[chara_face name="person2" face="happy"        storage="chara/person2/happy.png"]


; ゴミ箱ロボット HAI のキャラクター定義
[chara_new  name="gomirobo"  jname="HAI" storage="chara/gomirobo/p_dustbox_def.png"]

[chara_face name="gomirobo" face="def"         storage="chara/gomirobo/p_dustbox_def.png"]


; ゴミ箱ロボット（ピンク）のキャラクター定義
[chara_new  name="p_dustbox"  jname="ゴミ箱ロボット" storage="chara/gomirobo/p_dustbox_def.PNG"]

[chara_face name="p_dustbox" face="def"        storage="chara/gomirobo/p_dustbox_def.PNG"]
[chara_face name="p_dustbox" face="happy"      storage="chara/gomirobo/p_dustbox_hap.PNG"]
[chara_face name="p_dustbox" face="sad"        storage="chara/gomirobo/p_dustbox_sad.PNG"]


; ゴミ箱ロボット（青）のキャラクター定義
[chara_new  name="b_dustbox"  jname="ゴミ箱ロボット" storage="chara/gomirobo/b_dustbox_def.PNG"]

[chara_face name="b_dustbox" face="def"        storage="chara/gomirobo/b_dustbox_def.PNG"]
[chara_face name="b_dustbox" face="happy"      storage="chara/gomirobo/b_dustbox_hap.PNG"]
[chara_face name="b_dustbox" face="sad"        storage="chara/gomirobo/b_dustbox_sad.PNG"]


; agent009 のキャラクター定義
[chara_new  name="agent009"  jname="AGENT009" storage="chara/agent009/default.png"]
[chara_face name="agent009" face="def" storage="chara/agent009/default.png"]


; [return] 帰ります。
[return]