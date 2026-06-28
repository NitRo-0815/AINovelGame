;==================================================
; day3_summary.ks
; 最終ログ画面（2ページ構成）
;==================================================



;--------------------------------------------------
*start
;--------------------------------------------------

; キャラ非表示
[chara_hide name="toyopon" time="0"]
[chara_hide name="agent001" time="0"]

; 背景（少し暗めにしたいなら別画像でもOK）
[bg storage="room.jpg" time="0"]

; 画面全体テキストボックス
[position left="40" top="40" width="1120" height="620" color="0x000000" opacity="235" frame="none"]
[position margint="40" marginl="30" marginr="30" marginb="20"]

; 名前欄（タイトル用）
[free name="chara_name_area" layer="message0"]
[ptext name="chara_name_area" layer="message0" zindex="102" size="36" x="60" y="45"]
[chara_config ptext="chara_name_area"]

[jump *log_page1]





;==================================================
; ページ1（1日目＋2日目）
;==================================================

*log_page1

[cm]

#三日間の記録（1/2）

【1日目】[r][r]

■ 朝（出会い）[r]
[emb exp="f.summary_day1_morning"][r][r]

■ 昼（宿題）[r]
[emb exp="f.summary_day1_afternoon"][r][r]

■ 夕方（外出）[r]
[emb exp="f.summary_day1_evening"][r][r]

■ 夜（お風呂・睡眠）[r]
[emb exp="f.summary_day1_night"][p]

【2日目】[r][r]

■ 朝（宿題）[r]
[emb exp="f.summary_day2_morning"][r][r]

■ 昼（読み聞かせ）[r]
[emb exp="f.summary_day2_afternoon"][p]

[glink color=green size=28 x=360 y=620 width=400 target=*log_page2 text="次の記録へ"]

[s]





;==================================================
; ページ2（2日目後半＋3日目）
;==================================================

*log_page2

[cm]

#三日間の記録（2/2）

【2日目】[r][r]

■ 夕方（お風呂）[r]
[emb exp="f.summary_day2_evening"][r][r]

■ 夜（睡眠）[r]
[emb exp="f.summary_day2_night"][p]

【3日目】[r][r]

■ 朝（宿題）[r]
[emb exp="f.summary_day3_morning"][r][r]

■ 昼（喫茶店）[r]
[emb exp="f.summary_day3_afternoon"][r][r]

■ 最終選択[r]
[if exp="f.final=='toyopon'"]
とよぽんを選んだ[r]
[else]
AGENT001を選んだ[r]
[endif]

[p]

#

三日間の選択は、すべてここに残っている。[p]

#

どれが正しかったのかは、まだわからない。[p]

#

でも、選んだことだけは消えない。[p]

[glink color=green size=28 x=360 y=620 width=400 target=*finish text="END"]

[s]





;==================================================
; 終了
;==================================================

*finish

[cm]

#END

三日間の体験はここで終了です。[p]

[s]
``