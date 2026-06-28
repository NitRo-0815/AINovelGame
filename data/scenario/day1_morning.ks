;==================================================
; day1_morning.ks
; 1日目 朝：お世話ロボットがやってくる
; 内容：
; ・とよぽん初登場
; ・できることの紹介
; ・名前をつける
; ・次の出来事 day1_afternoon.ks へ
;==================================================



;--------------------------------------------------
*start
;--------------------------------------------------

; 画面初期化
; 背景を先に表示したいので、ここではキャラを表示しない
[set_default_view chara="off"]

; 背景を即時表示
[bg storage="room.jpg" time="0"]

; メッセージボックス設定
[position left="250" top="440" width="820" height="250" color="0x000000" opacity="220" frame="none"]
[position margint="50" marginl="25" marginr="25" marginb="10"]

; 名前欄設定
[free name="chara_name_area" layer="message0"]
[ptext name="chara_name_area" layer="message0" zindex="102" size="32" face="ロゴたいぷゴシック,メイリオ,sans-serif" x="250" y="445" color="0xffffff" edge="0x000000"]
[chara_config ptext="chara_name_area"]

; BGM開始
; data/bgm/day1.ogg を配置すること
[playbgm storage="day1.ogg" loop="true" fadein="1000"]

;==================================================
; 変数初期化
;==================================================

; 名前用
[eval exp="f.robot_name=''"]
[eval exp="sf.robot_name=''"]

; 3日構成用の記録
[eval exp="f.summary_day1_morning='未記録'"]
[eval exp="f.summary_day1_afternoon='未記録'"]
[eval exp="f.summary_day1_evening='未記録'"]
[eval exp="f.summary_day1_night='未記録'"]

[eval exp="f.summary_day2_morning='未記録'"]
[eval exp="f.summary_day2_afternoon='未記録'"]
[eval exp="f.summary_day2_evening='未記録'"]
[eval exp="f.summary_day2_night='未記録'"]

[eval exp="f.summary_day3_morning='未記録'"]
[eval exp="f.summary_day3_afternoon='未記録'"]
[eval exp="f.summary_day3_evening='未記録'"]
[eval exp="f.summary_day3_night='未記録'"]

; 最終振り返り用
[eval exp="f.summary_final='未記録'"]

; 背景を少し見せてから登場
[wait time="300"]

; とよぽん初登場
; first.ks で toyopon は定義済み
[chara_show name="toyopon" face="def" x="30" y="180" width="480" time="800"]

[jump target="*day1_morning_scene1"]

[s]





;==================================================
; シーン1：初登場
;==================================================

*day1_morning_scene1

[typ/def]

#？？？

初めまして。[p]

#？？？

今日から、あなたの生活をサポートするために来ました。[p]

#

部屋に、小さなお世話ロボットが立っている。[p]

#

丸い体に、少し不思議な表情。[p]

#

でも、なんだか悪い感じはしない。[p]

[typ/hap]

#？？？

これから三日間、あなたのお世話を担当します。[p]

#

三日間？[p]

[typ/def]

#？？？

はい。短い期間ですが、家事や学習、外出のサポートなど、できることはたくさんあります。[p]

[jump target="*day1_morning_scene2"]

[s]





;==================================================
; シーン2：できること紹介
;==================================================

*day1_morning_scene2

[typ/hap]

#？？？

まずは、ぼくにできることを紹介します！[p]

[typ/def]

#？？？

掃除、洗濯、料理、片付け、予定管理、目覚まし、話し相手。[p]

#？？？

宿題のサポートや、外出先での道案内もできます。[p]

[typ/hap]

#？？？

さらに、スマホや家電に一時的に乗り移ることもできます！[p]

#

スマホにも？[p]

[typ/hap]

#？？？

はい！外に出るときは、スマホに入って一緒に移動できます。[p]

[typ/def]

#？？？

必要なら、朝起こすこともできますし、お風呂の準備もできます。[p]

#

かなり色々できるんだな……。[p]

[typ/hap]

#？？？

はい。あなたの生活が少し楽になるように、できるだけお手伝いします。[p]

[jump target="*day1_morning_scene3"]

[s]





;==================================================
; シーン3：名前をつけてほしい
;==================================================

*day1_morning_scene3

[typ/def]

#？？？

ただ、ひとつだけお願いがあります。[p]

#

お願い？[p]

[typ/hap]

#？？？

はい。[p]

#？？？

ぼくには、まだあなたに呼んでもらう名前がありません。[p]

[typ/def]

#？？？

型番はありますが、それだと少し味気ないので……。[p]

[typ/hap]

#？？？

よければ、あなたが名前をつけてくれませんか？[p]

#

名前……。[p]

#

これから一緒に過ごすなら、呼びやすい名前がいいかもしれない。[p]

[jump target="*day1_name_edit"]

[s]





;==================================================
; 名前入力画面
;==================================================

*day1_name_edit

; 再入力時のため、一時変数を空にしておく
[eval exp="f.robot_name=''"]

; 入力中はメッセージウィンドウを隠す
[layopt layer="message0" visible="false"]

; 入力用の背景画像
; data/image/15_input_A.png が必要
[image layer="1" storage="15_input_A.png" x="0" y="0"]

; 入力欄
[edit name="f.robot_name" left="450" top="450" width="400" height="52" size="30" maxchars="8"]

; 決定ボタン
[button graphic="config/arrow_next.png" target="*day1_name_commit" x="600" y="550"]

; 入力待ち
[s]





;==================================================
; 入力内容をcommitして確認
;==================================================

*day1_name_commit

; edit の内容を f.robot_name に反映
[commit]

; 未入力だった場合の保険
[if exp="f.robot_name == ''"]
[eval exp="f.robot_name='とよぽん'"]
[endif]

; 入力欄とボタンを消す
[cm]

; 入力用画像を消す
[freeimage layer="1"]

; メッセージウィンドウを再表示
[layopt layer="message0" visible="true"]

; メッセージボックス再設定
[position left="250" top="440" width="820" height="250" color="0x000000" opacity="220" frame="none"]
[position margint="50" marginl="25" marginr="25" marginb="10"]

; 名前欄再設定
[free name="chara_name_area" layer="message0"]
[ptext name="chara_name_area" layer="message0" zindex="102" size="32" face="ロゴたいぷゴシック,メイリオ,sans-serif" x="250" y="445" color="0xffffff" edge="0x000000"]
[chara_config ptext="chara_name_area"]

#？？？

「[emb exp="f.robot_name"]」ですね！[l][r]

[link target="*day1_name_ok"]【はい】[endlink]／
[link target="*day1_name_edit"]【いいえ】[endlink]

[s]





;==================================================
; 名前確定
;==================================================

*day1_name_ok

; 入力された名前を、以降も使えるように保存
[eval exp="sf.robot_name=f.robot_name"]

; 朝イベントの記録
[eval exp="f.summary_day1_morning='お世話ロボットが登場。できることを紹介してもらい、名前を「' + sf.robot_name + '」に決めた。'"]

; 画面を整える
[cm]

[chara_mod name="toyopon" face="happy" time="500"]

[jump target="*day1_morning_scene4"]

[s]





;==================================================
; シーン4：名前確定後
;==================================================

*day1_morning_scene4

[typ/hap]

#&sf.robot_name

[emb exp="sf.robot_name"]ですね！[p]

#&sf.robot_name

ありがとうございます。とても大切な名前です。[p]

#

名前を呼ぶと、ロボットはうれしそうにこちらを見た。[p]

[typ/def]

#&sf.robot_name

これから三日間、ぼくはあなたの生活をサポートします。[p]

#&sf.robot_name

でも、全部をぼくが決めるわけではありません。[p]

#

え？[p]

[typ/def]

#&sf.robot_name

何を頼るか、何を自分でするか。[p]

#&sf.robot_name

それは、あなたが選んでください。[p]

[typ/hap]

#&sf.robot_name

ぼくは、その選択の結果も含めて、そばで見守ります。[p]

#

選んだことには、ちゃんと結果がある。[p]

#

そう言われると、少しだけ緊張した。[p]

[typ/hap]

#&sf.robot_name

それでは、さっそく今日の予定を確認しましょう。[p]

#&sf.robot_name

まずは、残っている宿題があります。[p]

#

そうだった……。[p]

#

短い三日間の生活が、ここから始まる。[p]

[jump target="*day1_morning_end"]

[s]





;==================================================
; 朝イベント終了
;==================================================

*day1_morning_end

[cm]

[typ/def]

#&sf.robot_name

次は、宿題をどうするか決めましょう。[p]

#

[emb exp="sf.robot_name"]との一日目が、本格的に始まった。[p]

; 次の出来事へ
; 1日目 午後：宿題イベント
[jump storage="day1_afternoon.ks"]