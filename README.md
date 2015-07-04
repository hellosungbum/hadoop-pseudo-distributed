# hadoop-pseudo-distributed
Hadoopの擬似分散モードで仮想マシンを構築するスクリプトです。基本的には [CDH5の公式](http://www.cloudera.com/content/cloudera/en/documentation/core/v5-3-x/topics/cdh_qs_yarn_pseudo.html) に沿って必要最低限の構成で作成しています。インストールしているパッケージ等は`setup.sh`に全て記載。

## Requirements

* [virtualbox](https://www.virtualbox.org/)
* [vagrant](https://www.vagrantup.com/)

## Installation
VagrantとVirtualBoxのインストール
```
$ brew install caskroom/cask/brew-cask
$ brew cask install vagrant
$ brew cask install virtualbox
```

Vagrant Pluginのインストール
```
$ vagrant plugin install vagrant-vbguest
$ vagrant plugin install vagrant-hostmanager
```

リポジトリのクローン
```
$ git clone git@github.com:tasukujp/hadoop-pseudo-distributed.git
```

## Usage
仮想マシンを生成
```
$ vagrant up
```
