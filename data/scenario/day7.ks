;==================================================
; day7.ks
; 7日目：最後の日と代わりのロボット
;==================================================

*start

; 画面初期化
[set_default_view chara="off"]

; 選択用変数
[eval exp="f.final_robot=''"]

; とよぽん表示
[chara_show name="toyopon" face="def" x="520" y="180" width="420" time="0"]

[jump target="*day7_scene1"]


;==================================================
; シーン1：最後の朝
;==================================================

*day7_scene1

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

[typ/def]
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
; シーン2：agent001 登場
;==================================================

*day7_scene2

[wait time="500"]

[chara_show name="agent001" face="def" x="30" y="160" width="380" time="800"]

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

旧型機に比べ、処理速度は約三倍。判断精度、会話応答、作業効率も大幅に向上しています。[p]

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

[typ/def]
#&sf.robot_name

この一週間、ぼくはあなたのお世話をしてきました。[p]

[typ/def]
#&sf.robot_name

名前をつけてもらって、宿題を手伝って、お風呂の準備をして、読み聞かせもしました。[p]

[typ/def]
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

[typ/def]
#&sf.robot_name

ですが……。[p]

[typ/def]
#&sf.robot_name

もし、性能だけでは決められないと思ってくれるなら。[p]

[typ/def]
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

#

これから一緒にいるロボットを選ぼう。[l][r]

[link target="*day7_choose_toyopon"]今まで一緒に過ごした[emb exp="sf.robot_name"]を選ぶ[endlink][r]
[link target="*day7_choose_agent001"]高性能なAGENT001を選ぶ[endlink]

[s]


;==================================================
; toyoponを選ぶ
;==================================================

*day7_choose_toyopon

[cm]
[eval exp="f.final_robot='toyopon'"]

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

[typ/hap]
#&sf.robot_name

ぼくは最新型ではありません。完璧でもありません。[p]

[typ/hap]
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

理解しました。サポート権限をtoyoponに引き継ぎます。[p]

[typ/hap]
#&sf.robot_name

はい！これからもよろしくお願いします！[p]

#

よろしくね、[emb exp="sf.robot_name"]。[p]

[jump target="*day7_end"]


;==================================================
; agent001を選ぶ
;==================================================

*day7_choose_agent001

[cm]
[eval exp="f.final_robot='agent001'"]

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
; 終了
;==================================================

*day7_end

[wait time="500"]

[cm]

#

一週間のお世話ロボット生活は、今日で終わる。[p]

#

