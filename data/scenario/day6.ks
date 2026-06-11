;==================================================
; day6.ks
; 6日目：喫茶店のポイ捨て問題
; 選択肢：glink 使用
;==================================================

*start

; 画面初期化
[set_default_view chara="off"]

; 変数初期化
[eval exp="f.day6_choice=''"]
[eval exp="f.day6_ng_human=0"]
[eval exp="f.day6_ng_sign=0"]

; とよぽん表示（右）
[chara_show name="toyopon" face="def" x="520" y="180" width="420" time="0"]

[jump target="*day6_scene1"]


;==================================================
; シーン1：とよぽんから相談
;==================================================

*day6_scene1

; 念のため、とよぽんを右に固定
[chara_move name="toyopon" x="520" y="180" width="420" time="0"]

[typ/def]
#&sf.robot_name

おはようございます。[p]

[typ/hap]
#&sf.robot_name

今日は、少しお願いがあります。[p]

#

お願い？[p]

[typ/def]
#&sf.robot_name

はい。ぼくの友人である増田さんが、困っているんです。[p]

#

友人？ とよぽんに友達がいるんだ。[p]

[typ/hap]
#&sf.robot_name

はい。喫茶店のオーナーをしている方です。[p]

[typ/def]
#&sf.robot_name

最近テイクアウトを始めたそうなのですが、それによって少し問題が起きているみたいで……。[p]

#

問題？[p]

[typ/def]
#&sf.robot_name

詳しいことは、増田さんから直接聞いてみましょう。[p]

[jump target="*day6_scene2"]


;==================================================
; シーン2：増田さん登場
;==================================================

*day6_scene2

[bg storage="kissaten.jpg" time="1000"]

; 背景変更後、念のためとよぽんを右に固定
[chara_move name="toyopon" x="520" y="180" width="420" time="0"]

; 増田さん表示（左）
[chara_show name="person2" face="def" x="30" y="180" width="380" time="800"]

#増田さん

やあ、来てくれてありがとう。[p]

[typ/hap]
#&sf.robot_name

増田さん、こちらがいつもお世話している方です。[p]

#

こんにちは。[p]

#増田さん

こんにちは。今日は相談に乗ってくれると聞いてね。[p]

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

あなたなら、どんな解決方法を提案しますか？[p]

[jump target="*day6_choice_loop"]


;==================================================
; 選択肢ループ
; 失敗した選択肢は次から表示しない
;==================================================

*day6_choice_loop

[cm]

; 選択肢表示前も、とよぽん右・増田さん左を固定
[chara_move name="toyopon" x="520" y="180" width="420" time="0"]
[chara_move name="person2" x="30" y="180" width="380" time="0"]

[typ/def]
#&sf.robot_name

どんな方法を提案しましょうか？[p]

; まだ何も失敗していない場合
[if exp="f.day6_ng_human == 0 && f.day6_ng_sign == 0"]

[glink color=blue size=28 x=180 y=180 width=500 target=*day6_choice_gomirobo text="ゴミ箱ロボット「HAI」を導入する"]
[glink color=blue size=28 x=180 y=300 width=500 target=*day6_choice_human text="人手を増やす"]
[glink color=blue size=28 x=180 y=420 width=500 target=*day6_choice_sign text="AI搭載の自動注意看板を設置する"]

[endif]

; 人手だけ失敗済みの場合
[if exp="f.day6_ng_human == 1 && f.day6_ng_sign == 0"]

[glink color=blue size=28 x=180 y=180 width=500 target=*day6_choice_gomirobo text="ゴミ箱ロボット「HAI」を導入する"]
[glink color=blue size=28 x=180 y=300 width=500 target=*day6_choice_sign text="AI搭載の自動注意看板を設置する"]

[endif]

; 看板だけ失敗済みの場合
[if exp="f.day6_ng_human == 0 && f.day6_ng_sign == 1"]

[glink color=blue size=28 x=180 y=180 width=500 target=*day6_choice_gomirobo text="ゴミ箱ロボット「HAI」を導入する"]
[glink color=blue size=28 x=180 y=300 width=500 target=*day6_choice_human text="人手を増やす"]

[endif]

; 両方失敗済みの場合
[if exp="f.day6_ng_human == 1 && f.day6_ng_sign == 1"]

[glink color=blue size=28 x=180 y=250 width=500 target=*day6_choice_gomirobo text="ゴミ箱ロボット「HAI」を導入する"]

[endif]

[s]


;==================================================
; 選択肢1：ゴミ箱ロボット HAI
; 成功ルート
;==================================================

*day6_choice_gomirobo

[cm]
[eval exp="f.day6_choice='ゴミ箱ロボットHAI'"]

; 立ち位置固定
[chara_move name="person2" x="30" y="180" width="380" time="0"]
[chara_move name="toyopon" x="520" y="180" width="420" time="0"]

#

ゴミ箱ロボットを導入するのはどうでしょう。[p]

#増田さん

ゴミ箱ロボット？[p]

[typ/def]
#&sf.robot_name

はい。自走式のゴミ箱ロボットです。[p]

[typ/hap]
#&sf.robot_name

名前は、HAIです。[p]

#増田さん

HAI……？[p]

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

では、HAIを呼びましょう。[p]

[jump target="*day6_gomirobo_appear"]


;==================================================
; HAI登場
;==================================================

*day6_gomirobo_appear

; 増田さん左、とよぽん右、HAI中央
[chara_move name="person2" x="30" y="180" width="380" time="0"]
[chara_move name="toyopon" x="520" y="180" width="420" time="0"]

[chara_show name="gomirobo" face="def" x="365" y="260" width="230" time="800"]

#HAI

ハイ。ゴミ箱ロボット、HAIです。[p]

#増田さん

おお、本当に動くゴミ箱なんだね。[p]

#HAI

ゴミを検知しましたら、近くまで移動します。[p]

#HAI

ポイ捨てゼロを目指して、はい、がんばります。[p]

#

名前にかけてる……？[p]

[typ/hap]
#&sf.robot_name

HAIは、返事も性能の一部です。[p]

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
[chara_move name="person2" x="30" y="180" width="380" time="0"]
[chara_move name="toyopon" x="520" y="180" width="420" time="0"]

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
[chara_move name="person2" x="30" y="180" width="380" time="0"]
[chara_move name="toyopon" x="520" y="180" width="420" time="0"]

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

[eval exp="f.summary_day6='喫茶店のポイ捨て対策：' + f.day6_attempt_text + 'ゴミ箱ロボットHAI→成功'"]
; 立ち位置固定
[chara_move name="person2" x="30" y="180" width="380" time="0"]
[chara_move name="toyopon" x="520" y="180" width="420" time="0"]
[chara_move name="gomirobo" x="365" y="260" width="230" time="0"]

; 少し時間経過した雰囲気
[wait time="500"]

#増田さん

それから数日、HAIを店先に置いてみたんだ。[p]

#増田さん

すると、ポイ捨てがかなり減ったよ。[p]

[typ/hap]
#&sf.robot_name

よかったです！[p]

#増田さん

それだけじゃない。[p]

#増田さん

HAIを見に来るお客さんも増えてね。[p]

#増田さん

「かわいいゴミ箱ロボットがいる喫茶店」って、少し話題になっているんだ。[p]

#HAI

ハイ。お客様増加を確認しました。[p]

#HAI

ゴミも減って、お客さんも増えました。はい、成功です。[p]

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

[cm]

; HAIは退場させ、増田さん左・とよぽん右で締める
[chara_hide name="gomirobo" time="500"]
[chara_move name="person2" x="30" y="180" width="380" time="0"]
[chara_move name="toyopon" x="520" y="180" width="420" time="0"]

[typ/def]
#&sf.robot_name

今日は、増田さんのお手伝いができました。[p]

[typ/hap]
#&sf.robot_name

あなたの提案のおかげです。[p]

#

とよぽんの友達も助けられてよかった。[p]

[typ/def]
#&sf.robot_name

はい。[p]

[typ/hap]
#&sf.robot_name

明日は、いよいよ最後の日です。[p]

#

もう一週間、終わっちゃうんだね。[p]

[typ/def]
#&sf.robot_name

……はい。[p]

[typ/hap]
#&sf.robot_name

だから明日は、最後までしっかりお世話します。[p]

[jump storage="day7.ks"]