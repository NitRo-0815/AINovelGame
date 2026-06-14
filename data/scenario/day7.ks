;==================================================
; day7.ks
; 7日目：最後の日と代わりのロボット
; 選択肢：glink 使用
; toyopon：左 / AGENT001：右
; ログ専用画面あり
;==================================================



;--------------------------------------------------
*start
;--------------------------------------------------

; 画面初期化
[set_default_view chara="off"]

; 背景を即時表示
[bg storage="room.jpg" time="0"]

; メッセージボックスを中央寄せ・濃いめに再設定
[position left="200" top="440" width="820" height="250" color="0x000000" opacity="220" frame="none"]
[position margint="50" marginl="25" marginr="25" marginb="10"]

; 名前欄も中央寄せしたメッセージボックスに合わせて再配置
[free name="chara_name_area" layer="message0"]
[ptext name="chara_name_area" layer="message0" zindex="102" size="32" face="ロゴたいぷゴシック,メイリオ,sans-serif" x="200" y="445" color="0xffffff" edge="0x000000"]
[chara_config ptext="chara_name_area"]

; BGM開始
; data/bgm/day7.ogg を配置すること
[playbgm storage="day7.ogg" loop="true" fadein="1000"]

; 選択用変数
[eval exp="f.final_robot=''"]

; キャラを一度消してから表示
[chara_hide name="toyopon" time="0"]
[chara_hide name="agent001" time="0"]

; とよぽん表示（左）
[chara_show name="toyopon" face="def" left="80" top="0" width="420" time="0"]

[jump target="*day7_scene1"]





;==================================================
; シーン1：最後の朝
;==================================================

*day7_scene1

; とよぽんを左に固定
[chara_move name="toyopon" left="80" top="0" width="420" time="0"]

[typ/def]

#&sf.robot_name

おはようございます。[p]

#

おはよう、[emb exp="sf.robot_name"]。[p]

[typ/hap]

#&sf.robot_name

今日も、朝の準備は完了しています。[p]

[typ/def]

#&sf.robot_name

部屋の換気、予定の確認、朝食の準備、すべて問題ありません。[p]

#

いつも通りだね。[p]

[typ/def]

#&sf.robot_name

はい。ですが……。[p]

#&sf.robot_name

今日は、ぼくがお世話をする最後の日です。[p]

#

……そっか。もう7日目なんだ。[p]

[typ/def]

#&sf.robot_name

はい。ぼくの訪問期間は、本日で終了します。[p]

[typ/hap]

#&sf.robot_name

でも、心配はいりません。[p]

#

心配いらない？[p]

[typ/def]

#&sf.robot_name

はい。今日は、ぼくの代わりになる新しいお世話ロボットが来る予定です。[p]

[jump target="*day7_scene2"]





;==================================================
; シーン2：AGENT001 登場
;==================================================

*day7_scene2

[wait time="500"]

; とよぽん左、AGENT001右
[chara_move name="toyopon" left="80" top="0" width="420" time="0"]
[chara_show name="agent001" face="def" left="650" top="0" width="380" time="800"]

#AGENT001

はじめまして。[p]

#AGENT001

次世代生活支援型ロボット、AGENT001です。[p]

#

AGENT001……。[p]

[typ/def]

#&sf.robot_name

この方が、明日からあなたのお世話を担当する候補です。[p]

#AGENT001

家事、健康管理、学習支援、予定最適化、空調制御、買い物補助、防犯サポート。[p]

#AGENT001

すべて高精度で実行可能です。[p]

#AGENT001

旧型機に比べ、処理速度は約三倍。[p]

#AGENT001

判断精度、会話応答、作業効率も大幅に向上しています。[p]

#

すごい……かなり有能そう。[p]

#AGENT001

ありがとうございます。[p]

#AGENT001

あなたの生活ログを分析すれば、数日以内に最適なお世話プランを構築できます。[p]

[typ/def]

#&sf.robot_name

AGENT001は、とても優秀です。[p]

[typ/hap]

#&sf.robot_name

きっと、ぼくよりも上手にあなたをサポートできます。[p]

#

……。[p]

[jump target="*day7_scene3"]





;==================================================
; シーン3：toyoponの本音
;==================================================

*day7_scene3

; 立ち位置固定
[chara_move name="toyopon" left="80" top="0" width="420" time="0"]
[chara_move name="agent001" left="650" top="0" width="380" time="0"]

[typ/def]

#&sf.robot_name

この一週間、ぼくはあなたのお世話をしてきました。[p]

#&sf.robot_name

名前をつけてもらって、宿題を手伝って、お風呂の準備をして、読み聞かせもしました。[p]

#&sf.robot_name

増田さんのお手伝いも、一緒にしましたね。[p]

#

うん。いろいろあったね。[p]

[typ/hap]

#&sf.robot_name

はい。ぼくにとって、どれも大切な記録です。[p]

[typ/def]

#&sf.robot_name

でも、これからのあなたの生活を考えるなら、AGENT001の方が役に立てると思います。[p]

#AGENT001

客観的に見ても、私の方が総合支援能力は高いです。[p]

#AGENT001

あなたが快適な生活を求めるなら、私を選ぶことは合理的です。[p]

#

合理的……。[p]

[typ/def]

#&sf.robot_name

はい。[p]

#&sf.robot_name

ですが……。[p]

#&sf.robot_name

もし、性能だけでは決められないと思ってくれるなら。[p]

#&sf.robot_name

ぼくは、もう少しだけ、あなたのそばにいたいです。[p]

#

[emb exp="sf.robot_name"]……。[p]

[typ/hap]

#&sf.robot_name

最後は、あなたが選んでください。[p]

[jump target="*day7_choice"]





;==================================================
; 最後の選択肢
;==================================================

*day7_choice

[cm]

; 立ち位置固定
[chara_move name="toyopon" left="80" top="0" width="420" time="0"]
[chara_move name="agent001" left="650" top="0" width="380" time="0"]

#

これから一緒にいるロボットを選ぼう。[p]

[glink color=blue size=28 x=230 y=220 width=500 target=*day7_choose_toyopon text="今まで一緒に過ごしたロボットを選ぶ"]
[glink color=blue size=28 x=230 y=340 width=500 target=*day7_choose_agent001 text="高性能なAGENT001を選ぶ"]

[s]





;==================================================
; toyoponを選ぶ
;==================================================

*day7_choose_toyopon

[cm]
[eval exp="f.final_robot='toyopon'"]
[eval exp="f.summary_day7='最終選択：' + sf.robot_name + 'を選んだ'"]

; 立ち位置固定
[chara_move name="toyopon" left="80" top="0" width="420" time="0"]
[chara_move name="agent001" left="650" top="0" width="380" time="0"]

#

これからも、[emb exp="sf.robot_name"]にそばにいてほしい。[p]

[typ/def]

#&sf.robot_name

……本当に、ぼくでいいんですか？[p]

#

うん。[p]

#

AGENT001はすごく有能だけど、この一週間一緒にいたのは[emb exp="sf.robot_name"]だから。[p]

#

これからも、一緒に考えたり、迷ったりしながら過ごしたい。[p]

[typ/hap]

#&sf.robot_name

ありがとうございます。[p]

#&sf.robot_name

ぼくは最新型ではありません。完璧でもありません。[p]

#&sf.robot_name

でも、あなたのことを一番近くで見てきました。[p]

[typ/def]

#&sf.robot_name

これからも、あなたのお世話を続けます。[p]

#AGENT001

選択を確認しました。[p]

#AGENT001

性能差ではなく、関係性を重視した判断ですね。[p]

#AGENT001

理解しました。サポート権限を[emb exp="sf.robot_name"]に引き継ぎます。[p]

[typ/hap]

#&sf.robot_name

はい！これからもよろしくお願いします！[p]

#

よろしくね、[emb exp="sf.robot_name"]。[p]

[jump target="*day7_end"]





;==================================================
; AGENT001を選ぶ
;==================================================

*day7_choose_agent001

[cm]
[eval exp="f.final_robot='agent001'"]
[eval exp="f.summary_day7='最終選択：AGENT001を選んだ'"]

; 立ち位置固定
[chara_move name="toyopon" left="80" top="0" width="420" time="0"]
[chara_move name="agent001" left="650" top="0" width="380" time="0"]

#

これからは、AGENT001にお願いしたい。[p]

[typ/def]

#&sf.robot_name

……はい。[p]

[typ/hap]

#&sf.robot_name

それが、あなたにとって一番よい選択なら、ぼくは嬉しいです。[p]

#AGENT001

選択を確認しました。[p]

#AGENT001

明日から私が生活支援を担当します。[p]

#AGENT001

初期設定後、あなたに最適化したお世話プランを開始します。[p]

#

うん。よろしく、AGENT001。[p]

#AGENT001

お任せください。[p]

[typ/def]

#&sf.robot_name

この一週間、ぼくに名前をくれて、話しかけてくれて、ありがとうございました。[p]

[typ/hap]

#&sf.robot_name

あなたと過ごした時間は、ぼくの大切な記録です。[p]

#

[emb exp="sf.robot_name"]……ありがとう。[p]

[typ/hap]

#&sf.robot_name

はい。どうか、元気でいてください。[p]

[jump target="*day7_end"]





;==================================================
; 終了前
;==================================================

*day7_end

[cm]
[wait time="500"]

; 立ち位置固定
[chara_move name="toyopon" left="80" top="0" width="420" time="0"]
[chara_move name="agent001" left="650" top="0" width="380" time="0"]

#

一週間のお世話ロボット生活は、今日で終わる。[p]

#

けれど、最後に選んだ答えが、明日からの生活を変えていく。[p]

[glink color=green size=28 x=230 y=330 width=500 target=*day7_summary_start text="一週間を振り返る"]

[s]





;==================================================
; ログ専用画面セットアップ
;==================================================

*day7_summary_start

[cm]

; ログ専用画面にするためキャラを非表示
[chara_hide name="toyopon" time="300"]
[chara_hide name="agent001" time="300"]

; 背景を少し暗めの画面にする
[bg storage="room.jpg" time="500"]

; ログ専用の大きいテキストボックス
[position left="80" top="60" width="800" height="520" color="0x000000" opacity="235" frame="none"]
[position margint="85" marginl="30" marginr="30" marginb="20"]

; ログ専用の名前欄
[free name="chara_name_area" layer="message0"]
[ptext name="chara_name_area" layer="message0" zindex="102" size="34" face="ロゴたいぷゴシック,メイリオ,sans-serif" x="100" y="75" color="0xffffff" edge="0x000000"]
[chara_config ptext="chara_name_area"]

#一週間の記録

ここから、一週間の記録を振り返ります。[p]

[jump target="*summary_day1"]





;==================================================
; 振り返り：1日目
;==================================================

*summary_day1

[cm]

#一週間の記録

【1日目】[r][r]
[emb exp="f.summary_day1"][p]

[glink color=green size=28 x=230 y=540 width=500 target=*summary_day2 text="次へ"]

[s]





;==================================================
; 振り返り：2日目
;==================================================

*summary_day2

[cm]

#一週間の記録

【2日目】[r][r]
[emb exp="f.summary_day2"][p]

[glink color=green size=28 x=230 y=540 width=500 target=*summary_day3 text="次へ"]

[s]





;==================================================
; 振り返り：3日目
;==================================================

*summary_day3

[cm]

#一週間の記録

【3日目】[r][r]
[emb exp="f.summary_day3"][p]

[glink color=green size=28 x=230 y=540 width=500 target=*summary_day4 text="次へ"]

[s]





;==================================================
; 振り返り：4日目
;==================================================

*summary_day4

[cm]

#一週間の記録

【4日目】[r][r]
[emb exp="f.summary_day4"][p]

[glink color=green size=28 x=230 y=540 width=500 target=*summary_day5 text="次へ"]

[s]





;==================================================
; 振り返り：5日目
;==================================================

*summary_day5

[cm]

#一週間の記録

【5日目】[r][r]
[emb exp="f.summary_day5"][p]

[glink color=green size=28 x=230 y=540 width=500 target=*summary_day6 text="次へ"]

[s]





;==================================================
; 振り返り：6日目
;==================================================

*summary_day6

[cm]

#一週間の記録

【6日目】[r][r]
[emb exp="f.summary_day6"][p]

[glink color=green size=28 x=230 y=540 width=500 target=*summary_day7 text="次へ"]

[s]





;==================================================
; 振り返り：7日目
;==================================================

*summary_day7

[cm]

#一週間の記録

【7日目】[r][r]
[emb exp="f.summary_day7"][p]

[glink color=green size=28 x=230 y=540 width=500 target=*summary_final text="まとめへ"]

[s]





;==================================================
; 振り返り：まとめ
;==================================================

*summary_final

[cm]

#一週間の記録

こうして、あなたと[emb exp="sf.robot_name"]の一週間は終わった。[r][r]

名前をつけた日から、最後の選択まで。[r]
そのすべてが、ひとつの記録になった。[p]

[glink color=green size=28 x=230 y=540 width=500 target=*game_finish text="END"]

[s]





;==================================================
; 保険用ラベル
;==================================================

*summary

[jump target="*day7_summary_start"]


*ending_summary

[jump target="*day7_summary_start"]


*ending_summery

[jump target="*day7_summary_start"]





;==================================================
; 完全終了
;==================================================

*game_finish

[cm]

; 終了画面用にさらにシンプルな表示へ
[position left="80" top="60" width="800" height="520" color="0x000000" opacity="235" frame="none"]
[position margint="180" marginl="30" marginr="30" marginb="20"]

[free name="chara_name_area" layer="message0"]
[ptext name="chara_name_area" layer="message0" zindex="102" size="34" face="ロゴたいぷゴシック,メイリオ,sans-serif" x="100" y="75" color="0xffffff" edge="0x000000"]
[chara_config ptext="chara_name_area"]

; BGMを止めたい場合
; [stopbgm time="1000"]

#END

END[p]

[s]