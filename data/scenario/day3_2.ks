;==================================================
; day3_2.ks
; 
; 内容：
; ・初めて入った喫茶店で食事を注文する
; ・マスターの悩みに気づき、とよぽんと解決する
; ・次の出来事 day3_3.ks へ
;==================================================



;--------------------------------------------------
*start
;--------------------------------------------------
;==================================================
; 変数初期化
;==================================================

[eval exp="f.day6_ng_human=0"]
[eval exp="f.day6_ng_sign=0"]
[eval exp="f.day6_choice=''"]

[street time="500"]

#

やっぱり外は暑いな[p]

#
買い物は終わったけど、どこか涼しい場所に行きたいな。[p]

[kissaten/out]

#
ここならちょうどよく涼しめそうだ。[p]

#
ついでに昼ごはんでも食べていこう。[p]

[kissaten/in]

;==================================================
; シーン2：初めての入店・注文
;==================================================

[bg storage="kissaten.jpg" time="1000"]

; 背景変更後、喫茶店のマスター登場と同時にとよぽんを左へ移動
; とよぽん：中央 → 左
; マスター：右寄り
[chara_move name="toyopon" left="80" top="0" width="420" time="600"]
[chara_show name="person2" face="def" left="650" top="0" width="380" time="800"]

#喫茶店のマスター

いらっしゃいませー！[p]

#

店の中は涼しく、コーヒーの香りがした。[p]

#喫茶店のマスター

お好きな席へどうぞ。[p]

#

窓際の席に座り、メニューを開いた。[p]

#

じゃあ、アイスティーとサンドイッチで。[p]

#&sf.robot_name

私は食べられませんので、そばで待っていますね。[p]

#喫茶店のマスター

かしこまりました。少々お待ちください。[p]

[chara_hide name="person2" time="400"]

#

しばらくして、注文したサンドイッチとアイスティーが運ばれてきた。[p]

[chara_show name="person2" face="def" left="650" top="0" width="380" time="400"]

#喫茶店のマスター

お待たせしました。[p]

#

マスターの名札には「増田」と書かれている。[p]

#

サンドイッチを食べていると、増田さんが窓の外を見ながら小さくため息をついた。[p]

[typ/def]

#&sf.robot_name

あの、何かお困りですか？[p]

#増田さん

え？　ああ、顔に出ていたかな。[p]

#

とよぽんは窓の外と、困った顔の増田さんを交互に見た。[p]

[typ/hap]

#&sf.robot_name

よければ、私たちで悩み事を解決しましょう！[p]

#

いきなりそこまで言うんだ。[p]

#増田さん

はは、頼もしいな。それじゃあ、聞いてもらってもいいかい？[p]

#増田さん

実はうちの喫茶店、最近テイクアウトを始めたんだ。[p]

#増田さん

おかげでお客さんは増えたんだけど、そのぶん店の近くにカップや紙袋のポイ捨てが目立つようになってしまってね。[p]

[typ/def]

#&sf.robot_name

テイクアウト用の容器が、そのまま道端に捨てられてしまうようです。[p]

#増田さん

お客さんを疑いたくはないけれど、近所の人にも迷惑がかかる。[p]

#増田さん

でも、どう対策すればいいのか悩んでいてね。[p]

[typ/def]

#&sf.robot_name

状況はわかりました。[p]

[typ/hap]

#&sf.robot_name

一緒に解決方法を考えましょう！[p]

[jump target="*day6_choice_loop"]





*day6_choice_loop

[cm]

[chara_move name="toyopon" left="80" top="0" width="420" time="0"]
[chara_move name="person2" left="650" top="0" width="380" time="0"]

[typ/def]

#&sf.robot_name

どんな方法を提案しましょうか？[p]

[if exp="f.day6_ng_human==0 && f.day6_ng_sign==0"]

[glink color=blue size=28 x=350 y=140 width=500 target=*day6_choice_gomirobo text="ゴミ箱ロボットを導入する"]
[glink color=blue size=28 x=350 y=245 width=500 target=*day6_choice_human text="人手を増やす"]
[glink color=blue size=28 x=350 y=350 width=500 target=*day6_choice_sign text="AI搭載の自動注意看板を設置する"]

[elsif exp="f.day6_ng_human==1 && f.day6_ng_sign==0"]

[glink color=blue size=28 x=350 y=190 width=500 target=*day6_choice_gomirobo text="ゴミ箱ロボットを導入する"]
[glink color=blue size=28 x=350 y=310 width=500 target=*day6_choice_sign text="AI搭載の自動注意看板を設置する"]

[elsif exp="f.day6_ng_human==0 && f.day6_ng_sign==1"]

[glink color=blue size=28 x=350 y=190 width=500 target=*day6_choice_gomirobo text="ゴミ箱ロボットを導入する"]
[glink color=blue size=28 x=350 y=310 width=500 target=*day6_choice_human text="人手を増やす"]

[else]

[glink color=blue size=28 x=350 y=250 width=500 target=*day6_choice_gomirobo text="ゴミ箱ロボットを導入する"]

[endif]

[s]



;==================================================
; 選択肢1：ゴミ箱ロボット
; 成功ルート
;==================================================

*day6_choice_gomirobo

[cm]
[eval exp="f.day6_choice='ゴミ箱ロボット'"]

; 立ち位置固定
[chara_move name="toyopon" left="80" top="0" width="420" time="0"]
[chara_move name="person2" left="650" top="0" width="380" time="0"]

#

ゴミ箱ロボットを導入するのはどうでしょう。[p]

#増田さん

ゴミ箱ロボット？[p]

[typ/def]

#&sf.robot_name

はい。自走式のゴミ箱ロボットです。[p]

#増田さん

自走式……？[p]

[typ/def]

#&sf.robot_name

お客さんの近くまで移動して、自然にゴミを捨ててもらえるように案内できます。[p]

[typ/hap]

#&sf.robot_name

ただ注意するのではなく、「捨てやすい場所」をこちらから届ける方法です。[p]

#

怒るんじゃなくて、捨てやすくするんだね。[p]

#増田さん

なるほど……それなら、お客さんも嫌な気持ちになりにくいかもしれない。[p]

#増田さん

それに、ロボットがいたら少し話題にもなりそうだ。[p]

[typ/hap]

#&sf.robot_name

では、ゴミ箱ロボットを呼びましょう。[p]

[jump target="*day6_gomirobo_appear"]





;==================================================
; ゴミ箱ロボット登場
;==================================================

*day6_gomirobo_appear

; とよぽん左、増田さん右、ゴミ箱ロボット中央
[chara_move name="toyopon" left="80" top="0" width="420" time="0"]
[chara_move name="person2" left="650" top="0" width="380" time="0"]
[chara_hide name="gomirobo" time="0"]

[chara_show name="gomirobo" face="def" left="400" top="180" width="230" time="800"]

#

ゴミ箱ロボットが、静かに店先へ移動してきた。[p]

#増田さん

おお、本当に動くゴミ箱なんだね。[p]

#

ゴミ箱ロボットは、ゆっくりと周囲を確認するように動いている。[p]

#

近くのゴミを見つけると、そちらへすっと近づいていった。[p]

[typ/hap]

#&sf.robot_name

このように、ゴミを捨てやすい場所まで自分で移動できます。[p]

#増田さん

ははっ、いいね。これならお客さんにも親しまれそうだ。[p]

[jump target="*day6_success"]





;==================================================
; 選択肢2：人手を増やす
; 失敗ルート
;==================================================

*day6_choice_human

[cm]
[eval exp="f.day6_choice='人手を増やす'"]
[eval exp="f.day6_ng_human=1"]

; 立ち位置固定
[chara_move name="toyopon" left="80" top="0" width="420" time="0"]
[chara_move name="person2" left="650" top="0" width="380" time="0"]

#

人手を増やして、店の周りを見回るのはどうでしょう。[p]

#増田さん

うーん……。[p]

#増田さん

たしかに、人が見回ればポイ捨ては減るかもしれない。[p]

#増田さん

でも、それだけのために誰かを雇うのは申し訳ないな……。[p]

#増田さん

バイト代も、なあ……。[p]

[typ/def]

#&sf.robot_name

人手を増やす方法は、負担が大きそうですね。[p]

#増田さん

そうだね。他の方法はないのかい？[p]

[jump target="*day6_choice_loop"]





;==================================================
; 選択肢3：AI搭載の自動注意看板
; 失敗ルート
;==================================================

*day6_choice_sign

[cm]
[eval exp="f.day6_choice='AI搭載の自動注意看板'"]
[eval exp="f.day6_ng_sign=1"]

; 立ち位置固定
[chara_move name="toyopon" left="80" top="0" width="420" time="0"]
[chara_move name="person2" left="650" top="0" width="380" time="0"]

#

AI搭載の自動注意看板を置くのはどうでしょう。[p]

#増田さん

自動注意看板？[p]

[typ/def]

#&sf.robot_name

ポイ捨てを検知したら、自動で注意メッセージを出す看板ですね。[p]

#増田さん

うーん……。[p]

#増田さん

たしかに効果はありそうだけど、誤検知があったら困るな。[p]

#増田さん

ちゃんと捨てようとしている人にまで注意してしまったら、不快にさせてしまうかもしれない。[p]

#

たしかに、急に看板に注意されたらびっくりするかも。[p]

[typ/def]

#&sf.robot_name

お店の雰囲気にも影響しそうですね。[p]

#増田さん

そうだね。他の方法はないのかい？[p]

[jump target="*day6_choice_loop"]





;==================================================
; 成功後：結果
;==================================================

*day6_success

[cm]
[eval exp="f.day6_attempt_text=''"]

[if exp="f.day6_ng_human == 1"]
[eval exp="f.day6_attempt_text=f.day6_attempt_text + '人手を増やす→失敗。'"]
[endif]

[if exp="f.day6_ng_sign == 1"]
[eval exp="f.day6_attempt_text=f.day6_attempt_text + 'AI搭載の自動注意看板→失敗。'"]
[endif]

[eval exp="f.summary_day6='喫茶店のポイ捨て対策：' + f.day6_attempt_text + 'ゴミ箱ロボット→成功'"]

; 立ち位置固定
[chara_move name="toyopon" left="80" top="0" width="420" time="0"]
[chara_move name="person2" left="650" top="0" width="380" time="0"]
[chara_move name="gomirobo" left="400" top="180" width="230" time="0"]

; 少し時間経過した雰囲気
[wait time="500"]

;==================================================
; 数日後の演出
;==================================================

; 一度暗転して、日にちが変わった雰囲気を出す
[mask color="black" time="600"]

[cm]

; キャラを一度非表示
[chara_hide name="toyopon" time="0"]
[chara_hide name="person2" time="0"]
[chara_hide name="gomirobo" time="0"]

; 背景は喫茶店のまま、数日後として再表示
[bg storage="kissaten.jpg" time="0"]

[mask_off time="600"]

#

数日後。[p]

#

ゴミ箱ロボットは、増田さんの喫茶店の店先に置かれることになった。[p]

; 数日後の喫茶店として、キャラを再配置
[mask color="black" time="300"]

[cm]

[chara_show name="toyopon" face="def" left="80" top="0" width="420" time="0"]
[chara_show name="person2" face="def" left="650" top="0" width="380" time="0"]
[chara_show name="gomirobo" face="def" left="400" top="180" width="230" time="0"]

[mask_off time="300"]

#増田さん

あれから数日、ゴミ箱ロボットを店先に置いてみたんだ。[p]

#増田さん

すると、ポイ捨てがかなり減ったよ。[p]

[typ/hap]

#&sf.robot_name

よかったです！[p]

#増田さん

それだけじゃない。[p]

#増田さん

ゴミ箱ロボットを見に来るお客さんも増えてね。[p]

#増田さん

「かわいいゴミ箱ロボットがいる喫茶店」って、少し話題になっているんだ。[p]

#

ゴミ箱ロボットは、店先をゆっくり移動している。[p]

#

落ちていたカップの近くで止まり、捨てやすい位置へ静かに動いた。[p]

#

すごい。ちゃんと解決になったんだ。[p]

[typ/hap]

#&sf.robot_name

はい。困っている人を助けられましたね。[p]

#増田さん

ありがとう。君たちに相談してよかったよ。[p]

#増田さん

これからも、店と町をきれいにしていけそうだ。[p]

[jump target="*day6_end"]





;==================================================
; 6日目終了
;==================================================

*day6_end

; 直前の表示入れ替わり防止のため、短くマスクしてから再配置する
[mask color="black" time="150"]

[cm]

; 表示崩れ防止のため、一度全員消す
[chara_hide name="gomirobo" time="0"]
[chara_hide name="toyopon" time="0"]
[chara_hide name="person2" time="0"]

; とよぽん左・増田さん右で表示し直す
[chara_show name="toyopon" face="def" left="80" top="0" width="420" time="0"]
[chara_show name="person2" face="def" left="650" top="0" width="380" time="0"]

[wait time="100"]

[mask_off time="150"]

[typ/def]

#&sf.robot_name

今日は、増田さんのお手伝いができました。[p]

[typ/hap]

#&sf.robot_name

あなたの提案のおかげです。[p]

#

このお店の人も助けられてよかった。[p]

[typ/def]

#&sf.robot_name

はい。[p]

#増田さん

本当にありがとう。今日は助かったよ。[p]

[typ/hap]

#&sf.robot_name

こちらこそ、相談してくれてありがとうございました。[p]


#
場面転換で暗転[p]

#&sf.robot_name

助けになれてよかったですね！[p]

#&sf.robot_name

まさかそんなロボットがいるなんて知りませんでした！[p]

#&sf.robot_name

ありがとうございます！[p]

[chara_hide name="person2" time="0"]
[chara_hide name="gomirobo" time="0"]

2人は話しながら帰った[p]

; 次の出来事へ
; 
[jump storage="day3_3.ks"]
