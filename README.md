# TeraNavi開発プロジェクト
***
## ディレクトリとファイルの概要
* documentsディレクトリ
    * Apacheの設定ファイルやContext.xmlなど。他にも表定義とか要件定義とか置く予定。
* srcディレクトリ
    * main
        * java
            * ここにJavaのソースを配置する。このディレクトリ直下に自分たちのパッケージをつくってクラスをつくって・・・という感じ。
        * webapp
            * ここにはWEB-INFやjsファイル、CSSファイル配置。デザイン班の領域。
    * test
        * java
            * 未定ですが、JUnitを使ったテストクラスをここに配置します。
* target
    * コンパイルされたものが格納されるディレクトリです。基本的にいじる必要はありません
* pom.xml
    * 依存関係定義ファイルです。Javaのバージョンや必要なjarファイルなどが書かれています。**勝手にいじらないように！**
* README.md
    * 読んで字のごとくというか、このファイルです。
* Vagrantfile
    * ローカルに仮想環境を立ち上げるためのファイルです。本番環境がLinuxのため、ローカル段階からLinuxを使っていきます。その際、TomcatインストールとかApacheのインストールと設定とかMySQLのインストールとかその他いろいろ面倒なことを全部自動でやってくれるように設定しています。
***
## 開発環境について
### 環境概要
* OS
    * 開発環境: Windows10
    * 本番環境: CentOS6
* 使用言語およびフレームワーク
    * Java7
    * HTML5
    * CSS3
    * JavaScript
    * 使用フレームワーク
        * BootStrap3
        * JUnit
        * Mockit?
        * DbUnit?
* ミドルソフトウェア
    * tomcat7
    * Apache
* データベース
    * MySQL

### ローカルで仮想環境を立ち上げる
　**最初にVagrantとVirtualBoxをインストールしてください**
* Vagrant [ダウンロードはこちら](https://releases.hashicorp.com/vagrant/1.7.4/vagrant_1.7.4.msi)
* VirtualBox version5.0.10 r104061 [ダウンロードはこちら](https://www.virtualbox.org/wiki/Downloads)

#### Vagrantの使い方
Vagrantは仮想環境の構築と開発・テスト環境の構築をまとめておこなってくれるツールです。（VirtualBoxを内部的に使っています)
* 仮想環境を立ち上げる→vagrant up
* 仮想環境を停止する→vagrant halt
* 仮想環境をぶっ壊す→vagrant destroy ※なおもういっかいvagrant upすればきれいな環境をつくってくれます。

***

## 開発の流れ
### 概要
#### バージョン管理
#### コンパイル
#### テスト
