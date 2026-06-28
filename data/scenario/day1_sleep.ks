;==================================================
; day1_sleep.ks
; 1日目 夜：寝る準備
; 内容：
; ・翌日の起き方を選ぶ
; ・とよぽんに起こしてもらう / アラームを使う / 自力で起きる
; ・選択肢ごとに結果、メリット、デメリットを表示
; ・振り返り記録対応
;==================================================



;--------------------------------------------------
*start
;--------------------------------------------------

; 画面初期化
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
; day1 寝る準備用変数初期化
;==================================================

[eval exp="f.day1_sleep_choice='未選択'"]
[eval exp="f.day1_sleep_result='未記録'"]
[eval exp="f.day1_sleep_merit='未記録'"]
[eval exp="f.day1_sleep_demerit='未記録'"]

; 選択肢表示用テキスト
[eval exp="f.day1_wake_toyopon_text=sf.robot_name + 'に起こしてもらう'"]

; とよぽん表示
[chara_show name="toyopon" face="def" x="30" y="180" width="480" time="0"]

[jump target="*day1_sleep_scene1"]





;==================================================
; シーン1：寝る前
;==================================================

*day1_sleep_scene1

[typ/def]

#

お風呂のあと、部屋に戻ってきた。[p]

#

外出の疲れもあって、少し眠くなってきた。[p]

[typ/hap]

#&sf.robot_name

今日は一日、たくさんのことがありましたね。[p]

[typ/def]

#&sf.robot_name

宿題、外出、お風呂の準備。[p]

#&sf.robot_name

それぞれで、あなたが選んだことに結果がありました。[p]

#

たしかに、ただ過ごしただけじゃなくて、いろいろ選んだ気がする。[p]

[typ/def]

#&sf.robot_name

明日も予定があります。[p]

#&sf.robot_name

なので、寝る前にひとつ決めておくことがあります。[p]

#

決めておくこと？[p]

[typ/hap]

#&sf.robot_name

はい。明日の朝、どうやって起きるかです。[p]

#

朝か……。[p]

#

正直、ちゃんと起きられるか少し不安だ。[p]

[typ/def]

#&sf.robot_name

起き方にも、それぞれ良いところと困るところがあります。[p]

#&sf.robot_name

あなたに合いそうな方法を選んでください。[p]

[jump target="*day1_sleep_choice"]





;==================================================
; シーン2：翌日の起き方を選ぶ
;==================================================

*day1_sleep_choice

[typ/def]

#&sf.robot_name

明日の朝は、どうやって起きますか？[p]

[glink color=blue size=28 x=350 y=150 width=500 target=*day1_wake_toyopon text=&f.day1_wake_toyopon_text]
[glink color=blue size=28 x=350 y=260 width=500 target=*day1_wake_alarm text="アラームで起きる"]
[glink color=blue size=28 x=350 y=370 width=500 target=*day1_wake_self text="自力で起きる"]

[s]





;==================================================
; 選択肢1：とよぽんに起こしてもらう
;==================================================

*day1_wake_toyopon

[cm]

[eval exp="f.day1_sleep_choice=sf.robot_name + 'に起こしてもらう'"]

[typ/def]

#

明日の朝は、[emb exp="sf.robot_name"]に起こしてもらいたい。[p]

[typ/hap]

#&sf.robot_name

わかりました！[p]

#&sf.robot_name

起床予定時刻に合わせて、やさしく声をかけますね。[p]

[typ/def]

#&sf.robot_name

必要なら、カーテンを少し開けたり、部屋の明るさも調整します。[p]

#

それなら安心かもしれない。[p]

#

自分で起きる自信はあまりないけれど、[emb exp="sf.robot_name"]が起こしてくれるなら寝坊しなさそうだ。[p]

#

翌朝。[p]

[typ/hap]

#&sf.robot_name

おはようございます。[p]

#&sf.robot_name

朝ですよ。ゆっくり起きましょう。[p]

#

やさしい声で目が覚めた。[p]

#

大きな音でびっくりすることもなく、気持ちよく起きられた。[p]

#

ただ、起きるところまで[emb exp="sf.robot_name"]に頼っている気もした。[p]

#

もし[emb exp="sf.robot_name"]がいなかったら、自分だけで起きられるだろうか。[p]

[typ/def]

#&sf.robot_name

今日は予定通り起きられましたね。[p]

#&sf.robot_name

ただ、毎日ぼくが起こすだけだと、自分で起きる練習は少なくなるかもしれません。[p]

[eval exp="f.day1_sleep_result='予定通り気持ちよく起きられたが、起きることをロボットに頼りすぎる不安も残った'"]
[eval exp="f.day1_sleep_merit='安心して眠れて、朝もやさしく起きられた'"]
[eval exp="f.day1_sleep_demerit='自分で起きる練習が少なくなり、ロボットに頼りやすくなった'"]

[jump target="*day1_sleep_result"]





;==================================================
; 選択肢2：アラームで起きる
;==================================================

*day1_wake_alarm

[cm]

[eval exp="f.day1_sleep_choice='アラームで起きる'"]

[typ/def]

#

明日はアラームで起きることにする。[p]

[typ/hap]

#&sf.robot_name

いいですね。[p]

#&sf.robot_name

自分で起きるための準備として、とてもわかりやすい方法です。[p]

[typ/def]

#&sf.robot_name

では、起きる時刻にアラームを設定しましょう。[p]

#

スマホのアラームをセットした。[p]

#

音量も確認して、枕元に置いておく。[p]

#

これならたぶん起きられるはずだ。[p]

#

翌朝。[p]

#

ピピピピピ、とアラームの音が鳴った。[p]

#

少しびっくりして目が覚めた。[p]

#

眠くて止めたくなったけれど、音が鳴ったおかげで起きるきっかけにはなった。[p]

[typ/def]

#&sf.robot_name

アラームで起きられましたね。[p]

[typ/hap]

#&sf.robot_name

自分で設定して、自分で起きる流れができています。[p]

#

ただ、音が少し大きくて、目覚めはあまり気持ちよくなかった。[p]

#

それに、止めて二度寝していたら危なかったかもしれない。[p]

[typ/def]

#&sf.robot_name

アラームは便利ですが、止めたあとに起き上がる工夫も必要ですね。[p]

[eval exp="f.day1_sleep_result='アラームで起きることはできたが、音に少し驚き、止めたあと二度寝する危険もあった'"]
[eval exp="f.day1_sleep_merit='自分で設定して起きる練習になった'"]
[eval exp="f.day1_sleep_demerit='音で驚きやすく、止めたあと二度寝する可能性がある'"]

[jump target="*day1_sleep_result"]





;==================================================
; 選択肢3：自力で起きる
;==================================================

*day1_wake_self

[cm]

[eval exp="f.day1_sleep_choice='自力で起きる'"]

[typ/def]

#

明日は、自力で起きてみる。[p]

[typ/def]

#&sf.robot_name

自力で、ですか。[p]

[typ/hap]

#&sf.robot_name

自分の力で起きようとするのは、とても良い挑戦です。[p]

[typ/def]

#&sf.robot_name

ただ、寝坊する可能性もあります。[p]

#

うん。でも、試してみたい。[p]

[typ/hap]

#&sf.robot_name

わかりました。[p]

#&sf.robot_name

では、寝る前に明日の予定を思い出してから眠りましょう。[p]

#

明日は朝から予定がある。[p]

#

それを何度か頭の中で確認して、布団に入った。[p]

#

アラームはかけない。[p]

#

[emb exp="sf.robot_name"]にも、起こさなくていいと伝えた。[p]

#

翌朝。[p]

#

自然に目が覚めた。[p]

#

……と思ったけれど、時計を見ると予定より少し遅かった。[p]

#

大きな寝坊ではなかったけれど、朝の準備は少し慌ただしくなった。[p]

[typ/def]

#&sf.robot_name

自分で起きようとしたことは、良い挑戦でした。[p]

#&sf.robot_name

ただ、予定がある日は、保険の方法もあると安心ですね。[p]

#

自力で起きられた感じは少しうれしい。[p]

#

でも、もう少し早く起きられたらよかった。[p]

[typ/hap]

#&sf.robot_name

次は、自力で起きる練習をしながら、予備のアラームを使う方法もありますね。[p]

[eval exp="f.day1_sleep_result='自力で起きようとして少し成功したが、予定より遅くなり朝の準備が慌ただしくなった'"]
[eval exp="f.day1_sleep_merit='自分で起きる練習になり、少し自信がついた'"]
[eval exp="f.day1_sleep_demerit='寝坊する可能性があり、朝の準備が慌ただしくなった'"]

[jump target="*day1_sleep_end"]




;==================================================
; 1日目終了
;==================================================

*day1_sleep_end

[cm]

[typ/hap]

#&sf.robot_name

今日は一日、おつかれさまでした。[p]

[typ/def]

#&sf.robot_name

名前をくれて、宿題のことを考えて、外にも出て、お風呂の準備もしました。[p]

#&sf.robot_name

そして、明日の朝の起き方も選びました。[p]

#

思い返すと、たしかにいろいろあった。[p]

#

まだ一日目なのに、[emb exp="sf.robot_name"]がいる生活には少し慣れてきた気がする。[p]

[typ/hap]

#&sf.robot_name

おやすみなさい。[p]

#&sf.robot_name

よい夢を。[p]

#

部屋の明かりを消す。[p]

#

静かな夜の中で、今日選んだことを少しだけ思い出した。[p]

#

こうして、[emb exp="sf.robot_name"]との一日目が終わった。[p]

[jump storage="day2_morning.ks"]