;==================================================
; day3_summary.ks
; 3日間の選択をまとめる専用リザルト画面
;==================================================

*start

; 通常の会話UIとキャラクターを片付ける
[cm]
[clearfix]
[chara_hide name="toyopon" layer="1" time="0"]
[chara_hide name="agent009" layer="1" time="0"]
[layopt layer="message0" visible="false"]
[layopt layer="message1" visible="false"]
[layopt layer="0" visible="true"]
[layopt layer="1" visible="true"]
[hidemenubutton]

; 夜の部屋に暗いオーバーレイを重ねる
[room/night time="600"]

; 古いセーブデータでも結果画面を表示できるよう値を補う
[eval exp="tf.result_day1_morning=f.summary_day1_morning || '記録なし'"]
[eval exp="tf.result_day1_afternoon=f.summary_day1_afternoon || '記録なし'"]
[eval exp="tf.result_day1_evening=f.summary_day1_evening || '記録なし'"]
[eval exp="tf.result_day2_morning=f.summary_day2_morning || '記録なし'"]
[eval exp="tf.result_day2_evening=f.summary_day2_evening || '記録なし'"]
[eval exp="tf.result_day2_night=f.summary_day2_night || '記録なし'"]
[eval exp="tf.result_day3=(f.summary_day6 && f.summary_day6!='未記録') ? f.summary_day6 : '喫茶店の問題に取り組んだ'"]
[eval exp="tf.result_choice=f.final_choice || '選択結果なし'"]
[eval exp="tf.result_message=(f.summary_final && f.summary_final!='未記録') ? f.summary_final : ((f.final_choice=='AGENT009') ? '新しい性能と可能性を持つAGENT009を選んだ' : '三日間を一緒に過ごした相棒を選んだ')"]

[jump target="*record_page"]


;==================================================
; 1ページ目：これまでの選択記録
;==================================================

*record_page

[clearfix]
[freeimage layer="0"]
[freeimage layer="1"]

; 背景を暗くし、テキストを読みやすくする
[image layer="0" storage="black.png" x="0" y="0" width="1280" height="720" opacity="155" time="0"]
[image layer="0" storage="black.png" x="70" y="112" width="1140" height="480" opacity="175" time="0"]

[ptext layer="1" x="70" y="28" width="1140" align="center" text="3日間の選択記録" size="42" bold="true" color="0xffffff" edge="0x16324f"]
[ptext layer="1" x="70" y="80" width="1140" align="center" text="あなたが物語の中で選んだ行動です" size="20" color="0xbfe8ff"]

[ptext layer="1" x="105" y="132" width="170" text="DAY 1　出会い" size="23" bold="true" color="0x65d7ff"]
[ptext layer="1" x="290" y="132" width="860" text="&tf.result_day1_morning" size="21" color="0xffffff"]

[ptext layer="1" x="105" y="202" width="170" text="DAY 1　行動" size="23" bold="true" color="0x65d7ff"]
[ptext layer="1" x="290" y="202" width="860" text="&tf.result_day1_afternoon" size="21" color="0xffffff"]

[ptext layer="1" x="105" y="272" width="170" text="DAY 1　放課後" size="23" bold="true" color="0x65d7ff"]
[ptext layer="1" x="290" y="272" width="860" text="&tf.result_day1_evening" size="21" color="0xffffff"]

[ptext layer="1" x="105" y="342" width="170" text="DAY 2　朝" size="23" bold="true" color="0xffd36a"]
[ptext layer="1" x="290" y="342" width="860" text="&tf.result_day2_morning" size="21" color="0xffffff"]

[ptext layer="1" x="105" y="412" width="170" text="DAY 2　学校" size="23" bold="true" color="0xffd36a"]
[ptext layer="1" x="290" y="412" width="860" text="&tf.result_day2_evening" size="21" color="0xffffff"]

[ptext layer="1" x="105" y="482" width="170" text="DAY 2　帰宅後" size="23" bold="true" color="0xffd36a"]
[ptext layer="1" x="290" y="482" width="860" text="&tf.result_day2_night" size="21" color="0xffffff"]

[glink color="blue" size="25" x="440" y="625" width="400" target="*final_page" text="最終結果を見る"]
[s]


;==================================================
; 2ページ目：最終選択を強調して表示
;==================================================

*final_page

[clearfix]
[freeimage layer="0"]
[freeimage layer="1"]

[image layer="0" storage="black.png" x="0" y="0" width="1280" height="720" opacity="165" time="0"]
[image layer="0" storage="black.png" x="150" y="115" width="980" height="430" opacity="195" time="0"]

[ptext layer="1" x="100" y="35" width="1080" align="center" text="YOUR RESULT" size="26" bold="true" color="0x65d7ff"]
[ptext layer="1" x="100" y="72" width="1080" align="center" text="あなたの最終選択" size="40" bold="true" color="0xffffff" edge="0x16324f"]

[ptext layer="1" x="200" y="145" width="880" align="center" text="3日目　喫茶店での行動" size="22" bold="true" color="0xffd36a"]
[ptext layer="1" x="210" y="185" width="860" align="center" text="&tf.result_day3" size="21" color="0xffffff"]

[ptext layer="1" x="200" y="265" width="880" align="center" text="あなたが選んだ相棒" size="25" bold="true" color="0x65d7ff"]
[ptext layer="1" x="180" y="310" width="920" align="center" text="&tf.result_choice" size="54" bold="true" color="0xffffff" edge="0x087fb5"]
[ptext layer="1" x="210" y="400" width="860" align="center" text="&tf.result_message" size="24" color="0xffffff"]

[ptext layer="1" x="180" y="485" width="920" align="center" text="この選択に唯一の正解はありません。それでも、あなたは自分で選びました。" size="20" color="0xbfe8ff"]

[glink color="gray" size="22" x="210" y="625" width="330" target="*record_page" text="記録を見返す"]
[glink color="green" size="22" x="740" y="625" width="330" target="*finish" text="終わる"]
[s]


;==================================================
; 終了画面
;==================================================

*finish

[clearfix]
[freeimage layer="0"]
[freeimage layer="1"]
[image layer="0" storage="black.png" x="0" y="0" width="1280" height="720" opacity="205" time="0"]

[ptext layer="1" x="100" y="210" width="1080" align="center" text="THANK YOU FOR PLAYING" size="46" bold="true" color="0xffffff" edge="0x087fb5"]
[ptext layer="1" x="100" y="300" width="1080" align="center" text="3日間の体験はここで終了です" size="26" color="0xbfe8ff"]
[ptext layer="1" x="100" y="355" width="1080" align="center" text="プレイしてくれてありがとうございました" size="22" color="0xffffff"]

[s]
