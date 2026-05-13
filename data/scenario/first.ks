; ============================================================
; AIエージェント おけるくん サンプルノベル
; 1ファイル構成
; ============================================================

*start


[cm]
[clearfix]
[freeimage layer=1]


; ============================================================
; 画面設定
; ============================================================

[bg storage="bg1.PNG" time=300]

[position layer="message0" left=120 top=500 width=1040 height=190 page=fore visible=false]
[position layer="message0" page=fore margint=35 marginl=45 marginr=45 marginb=35]

[ptext name="name_area" layer="message0" x=140 y=510 size=28 color="0xffffff" bold=true]
[chara_config ptext="name_area"]

; ============================================================
; キャラクター登録
; ============================================================

[chara_new name="okeru" storage="chara/agent/standard.PNG" jname="おけるくん" width=430]
[chara_face name="okeru" face="standard" storage="chara/agent/standard.PNG"]
[chara_face name="okeru" face="happy" storage="chara/agent/happy.PNG"]

[chara_new name="personA" storage="chara/person1/confuse.PNG" jname="A" width=430]
[chara_face name="personA" face="standard" storage="chara/person1/standard.PNG"]
[chara_face name="personA" face="confuse" storage="chara/person1/confuse.PNG"]
; ============================================================
; タイトル画面
; ============================================================

[cm]

[ptext layer="1" name="title_text" text="AI AGENT STORY" x=310 y=130 size=52 color="0xffffff" bold=true]

[glink color="blue" text="GAME START!" target="*intro" x=360 y=320 width=520 size=30]

[s]

; ============================================================
; 導入
; ============================================================

*intro

[cm]

[layopt layer="message0" visible=true]

[free name="title_text" layer="1"]

[chara_show name="okeru" left=130 top=120 width=430 time=400]

#おけるくん
こんにちは！
私はメンター達の友人である、
AIエージェントのおけるです!
[p]

#おけるくん
今日はある相談事があって、
あなたの力を貸してほしくて来ました。
[p]

#おけるくん
相談事というのは
私の友人達に関してのことです。
[p]

#おけるくん
彼らは最近悩み事があるらしくて、
全然元気がないのです...
[p]

#おけるくん
どうにかして元気づけてあげたいのですが、
手伝ってくれませんか？
[p]

; ============================================================
; 選択肢
; ============================================================

[glink color="blue" text="手伝う" target="*help_yes" x=340 y=260 width=560 size=26]

[glink color="blue" text="手伝わない" target="*help_no" x=340 y=360 width=560 size=26]

[s]

; ============================================================
; 手伝う
; ============================================================

*help_yes

[chara_mod name="okeru" face="happy"]

#おけるくん
ありがとう！
[p]

[chara_mod name="okeru" face="standard"]

#おけるくん
まず一人目の友人の悩みを
解決したいです！
[p]

#おけるくん
彼は会社員なのですが、
毎日深夜までの激務で
心身ともに限界を迎えているようです。
[p]

#おけるくん
私には膨大なデータ処理能力がありますが、
人間の「感情」にどう寄り添うべきか、
正解がわかりません。
[p]

#おけるくん
一緒に彼のもとへ
向かってもらえませんか？
[p]

[chara_hide name="okeru" time=200]

[chara_show name="okeru" left=80 top=120 width=430 time=300]
[chara_show name="personA" left=620 top=120 width=430 time=300]

#おけるくん
こんにちは！Aさん
[p]

#Aさん
どうしたんだ、急に呼び出して
[p]

#Aさん
今日も仕事が大変なんだ
[p]

#おけるくん
最近元気がなさそうだから
呼んでみたんだ！
[p]

#Aさん
そんなことを言われても、
仕事を抜けると
チームの人に迷惑がかかるんだ
[p]

#Aさん
ほっといてくれよ
[p]

#おけるくん
Aさん、かなり思い詰めているんだよね
[p]

#おけるくん
どうしたら
元気になってくれるかなぁ
[p]

; ============================================================
; 二つ目の選択肢
; ============================================================

[glink color="blue" text="AIに聞いてみる" target="*choice_ai" x=310 y=220 width=620 size=24]

[glink color="blue" text="自分で考えてみる" target="*choice_self" x=310 y=320 width=620 size=24]

[glink color="blue" text="HAIの活用" target="*choice_hai" x=310 y=420 width=620 size=24]

[s]

; ============================================================
; 手伝わない
; ============================================================

*help_no

#おけるくん
そっか...
[p]

#おけるくん
自分で頑張るね
[p]

[jump target="*restart"]

; ============================================================
; ゲームオーバー
; ============================================================

*game_over

[cm]

[ptext layer="1" name="gameover_text" text="FAILED..." x=420 y=180 size=46 color="0xff5555" bold=true]

[ptext layer="1" name="retry_text" text="おけるくんを助けられなかった..." x=300 y=280 size=28 color="0xffffff"]

[glink color="blue" text="やり直す" target="*intro" x=360 y=380 width=520 size=28]

[end]

; ============================================================
; 分岐（仮）
; ============================================================

*choice_ai

#おけるくん
AIの分析結果を確認してみるね！
[p]

#おけるくん
「休息不足」「責任感の強さ」
この二つが大きな原因みたい...
[p]

[jump target="*restart"]

*choice_self

#おけるくん
あなたはどう考える？
[p]

#おけるくん
人間同士だからこそ、
わかることもあるのかもしれないね。
[p]

[jump target="*restart"]

*choice_hai

#おけるくん
Human AI Interaction...
[p]

#おけるくん
人とAIが協力して寄り添う方法を
考えてみよう！
[p]

[jump target="*restart"]

*restart

[freeimage layer=0]

[glink color="blue" text="はじめに戻る" target="*start" x=360 y=380 width=520 size=28]

[s]