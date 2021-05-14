# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

# 現状の課題
 * ラジオについて、Slackチャンネルに投稿しているのみだが、過去分をさかのぼって聞くことに手間がある。
 * PCであれば、別タブを開いた状態での再生はできるが、スマホでのバックグラウンド再生ができない。
 * ラジオに関するWebアプリがない

# ゴール（本来あるべき状態）
 * ラジオ配信アプリがある
 * 一画面をスクロールしてワンクリックでラジオが聞ける
 * ワンクリックでラジオ概要が見れる
 * いいねなどスタンプが押せる
 * 再生回数がカウントできる（クリック）
 * 特定のユーザーのみがアクセスできるサイトである（ユーザー管理は大西さんに一任）
 * 権限を持ったユーザーのみが動画のアップと削除をできる
 * バックグランドで再生ができる
 * スマホでロック画面でも再生できる△
 * 倍速再生△
# 追加ゴール
 * ラジオのランキング機能
 * ラジオのタグ付け機能
 * お気に入り機能
 * 検索機能
 * コメント

# 現状とゴールのギャップ（解決すべき課題）
 * 上記ゴールのアプリがない


# DB設計

## テーブル解説
radio-infoテーブルはゲストと第○回の情報を保存する。

radio-contentテーブルと分ける理由は、ラジオ目次の中身を細かく保存し、表示させるため。

timeカラムには〇〇分〇〇秒頃を保存する。

contentカラムには目次内容を保存する。

そのため、radio-info has_many radio-contents

radio-content belongs_to radio-infoとした。


### userテーブル
| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| id(PK)             | デフォルト            | null: false             |
| nickname           | string              | null: false,index: true |
| role               | integer             | null: false, default: 2 |
| email              | string              | null: false             |
| encrypted_password | string              | null: false             |

【アソシエーション】

has_many radio_infos

### radio-infoテーブル
| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| id(PK)                              | デフォルト   | null: false       |
| guest                               | string     | null: false       |
| info                                | string     | null: false       |
| time_info                           | string     | null: false       |
| user_id                             | references | foreign_key: true |

【アソシエーション】

has_many radio-contents

belongs_to user

### radio-contentテーブル
| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| id(PK)                              | デフォルト   | null: false       |
| time                                | string     | null: false       |
| content                             | string     | null: false       |
| radio_info_id                       | references | foreign_key: true |

【アソシエーション】

belongs_to radio_info

