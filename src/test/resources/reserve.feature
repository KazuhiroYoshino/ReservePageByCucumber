#Author: your.email@your.domain.com
#Keywords Summary :
#Feature: List of scenarios.
#Scenario: Business rule through list of steps with arguments.
#Given: Some precondition step
#When: Some key actions
#Then: To observe outcomes or validation
#And,But: To enumerate more Given,When,Then steps
#Scenario Outline: List of steps for data-driven as an Examples and <placeholder>
#Examples: Container for s table
#Background: List of steps run before each of the scenarios
#""" (Doc Strings)
#| (Data Tables)
#@ (Tags/Labels):To group Scenarios
#<> (placeholder)
#""
## (Comments)
#Sample Feature Definition Template
#language: ja

フィーチャ: 予約ページ
	背景: 宿泊初日の曜日と連泊数によって、週末料金アップ適用が異なる。オプションは別料金。連泊数・宿泊人数・オプションでトータル料金が決まる。

  シナリオ: テスト設定
  	前提 Webドライバは"Chrome"を選択する
#Hotel Planisphere TOPページを開く
    前提 ページ"http://example.selenium.jp/reserveApp_Renewal/"を表示する
    もし  Windowを最大化する

	シナリオアウトライン: 宿泊料金検証テストケース
		もし  宿泊初日の曜日を<宿泊初日>として
    ならば "1"秒待つ
    もし  連泊数選択をクリックして
		もし  連泊数を<連泊数>にして
		もし  宿泊人数を<宿泊人数>にして
		もし  朝食バイキング有無を<朝食>にして
		もし  昼からチェックインプランを<昼からチェックインプラン>にして
		もし  お得な観光プランを<お得な観光プラン>にして
		もし  氏名を<氏名>として
		もし  予約内容を記録して

		もし  利用規約に同意して次へボタンをクリックする

		ならば  合計金額は<合計金額>となり
		ならば  宿泊期間の表示が正しく
		ならば  宿泊人数の表示が<宿泊人数>名様となり
		ならば  追加プランが<朝食>または<昼からチェックインプラン>または<お得な観光プラン>で正しく
		ならば  氏名の表示が<氏名>様となり

		もし    確定ボタンをクリックする

		ならば  ポップアップ表示に"ご来館、心よりお待ちしております。"が表示され
		もし    HOMEボタンをクリックする

		例:
		|宿泊初日   |連泊数|宿泊人数|朝食 |昼からチェックインプラン|お得な観光プラン|氏名      |合計金額|
		|"Monday"   |"1"   |"1"     |"off"|"off"                   |"off"           |"武田晴信"|"7000"|
		|"Monday"   |"2"   |"8"     |"on" |"on"                    |"on"            |"真田昌虎"|"144000"|
		|"Monday"   |"3"   |"9"     |"off"|"off"                   |"on"            |"山本寛太"|"198000"|
		|"Monday"   |"5"   |"2"     |"on" |"on"                    |"off"           |"上杉景虎"|"82000"|
		|"Monday"   |"9"   |"2"     |"on" |"on"                    |"off"           |"直江愛子"|"153000"|
		|"Tuesday"  |"1"   |"9"     |"on" |"on"                    |"on"            |"武田晴信"|"90000"|
		|"Tuesday"  |"2"   |"2"     |"off"|"on"                    |"on"            |"真田昌虎"|"32000"|
		|"Tuesday"  |"3"   |"1"     |"on" |"off"                   |"off"           |"山本寛太"|"24000"|
		|"Tuesday"  |"5"   |"9"     |"off"|"off"                   |"off"           |"上杉景虎"|"330750"|
		|"Tuesday"  |"9"   |"8"     |"off"|"off"                   |"on"            |"直江愛子"|"540000"|
		|"Wednesday"|"1"   |"2"     |"on" |"on"                    |"on"            |"武田晴信"|"20000"|
		|"Wednesday"|"2"   |"2"     |"on" |"on"                    |"off"           |"真田昌虎"|"34000"|
		|"Wednesday"|"3"   |"8"     |"on" |"off"                   |"on"            |"山本寛太"|"200000"|
		|"Wednesday"|"5"   |"1"     |"off"|"on"                    |"off"           |"上杉景虎"|"39500"|
		|"Wednesday"|"9"   |"9"     |"on" |"on"                    |"on"            |"直江愛子"|"697500"|
		|"Thursday" |"1"   |"2"     |"off"|"off"                   |"on"            |"武田晴信"|"16000"|
		|"Thursday" |"2"   |"1"     |"on" |"on"                    |"off"           |"真田昌虎"|"17000"|
		|"Thursday" |"3"   |"8"     |"off"|"off"                   |"off"           |"山本寛太"|"182000"|
		|"Thursday" |"5"   |"9"     |"on" |"on"                    |"off"           |"上杉景虎"|"400500"|
		|"Thursday" |"9"   |"8"     |"on" |"off"                   |"on"            |"直江愛子"|"612000"|
		|"Friday"   |"1"   |"8"     |"off"|"off"                   |"on"            |"武田晴信"|"64000"|
		|"Friday"   |"2"   |"9"     |"off"|"off"                   |"off"           |"真田昌虎"|"141750"|
		|"Friday"   |"3"   |"2"     |"on" |"on"                    |"on"            |"山本寛太"|"59000"|
		|"Friday"   |"5"   |"8"     |"off"|"off"                   |"off"           |"上杉景虎"|"308000"|
		|"Friday"   |"9"   |"1"     |"on" |"on"                    |"on"            |"直江愛子"|"79250"|
		|"Saturday" |"1"   |"1"     |"off"|"off"                   |"off"           |"武田晴信"|"8750"|
		|"Saturday" |"2"   |"2"     |"off"|"off"                   |"off"           |"真田昌虎"|"35000"|
		|"Saturday" |"3"   |"8"     |"off"|"on"                    |"off"           |"山本寛太"|"204000"|
		|"Saturday" |"5"   |"2"     |"on" |"off"                   |"on"            |"上杉景虎"|"89000"|
		|"Saturday" |"9"   |"9"     |"on" |"on"                    |"on"            |"直江愛子"|"729000"|
		|"Sunday"   |"1"   |"9"     |"on" |"on"                    |"on"            |"武田晴信"|"105750"|
		|"Sunday"   |"2"   |"1"     |"on" |"off"                   |"off"           |"真田昌虎"|"17750"|
		|"Sunday"   |"3"   |"1"     |"on" |"on"                    |"on"            |"山本寛太"|"27750"|
		|"Sunday"   |"5"   |"8"     |"on" |"off"                   |"on"            |"上杉景虎"|"342000"|
		|"Sunday"   |"9"   |"2"     |"off"|"off"                   |"off"           |"直江愛子"|"136500"|

	シナリオ: テスト終了
	  もし シナリオを終了してブラウザを閉じる
