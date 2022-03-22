# README

<h1 align="center">Hi 👋, I'm RYOTA OKADA</h1>

<h2>Stock Communication</h2>
<p>株や投資についてのコミュニケーションサイトです。<br>
  投資を始めて見たいけど、何を買えば良いか分からない。<br>
  初めての方にも分かりやすいように投稿。それに対してコメントもできます。</p>
  
<p>自分の知りたい会社を検索することもできます。</p>

<h3>なぜ作ったのか</h3>
<p>証券営業をしている身として、今まで様々なお客様のニーズを伺ってきました。<br>
   その中で、「投資に興味はあるけど、何をすれば良いかの分からない。」「株は怖い。」<br>
   そんな声が多かったので、このサイトを作りました。<br>
   投資に関するアプリやサイトは数多く存在します。難しい言葉で説明されていたり、<br>
   どれを見れば良いか迷ってしまうと思います。<br>
   このサイトはそんな課題を解決できるよう、分かりやすさとシンプルさをこだわりました。
</p>

<h3>使い方</h3>
<p>新規登録後、企業登録より自分が知っている（詳しい）企業について情報を入力できます。<br>
   また、既に登録されている企業についてはコメントをすることができ、みんなで情報を出し合って共有できます。<br>
   企業一覧から登録されている企業を見ることができます。見たい企業について検索することもできます。
</p>

![76c98662bdc703e03f9267650728d0f3-1](https://user-images.githubusercontent.com/75375422/156875815-a674c6c1-a366-4f24-9ce8-863bf6903125.jpg)

<img width="1111" alt="7526a924623fd156227d5c1cb44f1284" src="https://user-images.githubusercontent.com/75375422/156889883-f9d63675-cfbf-4e41-8f6b-12f6776721aa.png">

<img width="963" alt="725735160695cf7e274e9c44f9c53f2e" src="https://user-images.githubusercontent.com/75375422/156889888-40d96253-3b5e-4125-ab30-afe3d4341cd3.png">




<h2>デプロイ先URL</h2>
http://sample-alb-312890317.ap-northeast-1.elb.amazonaws.com/

<h2>データーベース設計</h2>
<img width="719" alt="6dda97933255a49415cc3809fae83b37" src="https://user-images.githubusercontent.com/75375422/156884061-892893f4-07f2-4a72-830c-5422d0457a3a.png">

<h2>使用技術</h2>
<p>・ Ruby 2.6.6</p> 
<p>・ Ruby on Rails 6.1.4.4</p>
<p>・ MySQL 8.0</p>
<p>・ Nginx</p>
<p>・ Puma</p>
<p>・ Terraform</p>
<p>・ Amazon ECS (Fargate)</p>
<p>・ GitHub Actions</p>
<p>・ Docker/Docker-compase</p>
<p>・ RSpec</p>
<p>・ Rubocop Airbnb</p>

<p align="left"> <a href="https://aws.amazon.com" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/amazonwebservices/amazonwebservices-original-wordmark.svg" alt="aws" width="40" height="40"/> </a> <a href="https://getbootstrap.com" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/bootstrap/bootstrap-plain-wordmark.svg" alt="bootstrap" width="40" height="40"/> </a> <a href="https://www.docker.com/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/docker/docker-original-wordmark.svg" alt="docker" width="40" height="40"/> </a> <a href="https://git-scm.com/" target="_blank" rel="noreferrer"> <img src="https://www.vectorlogo.zone/logos/git-scm/git-scm-icon.svg" alt="git" width="40" height="40"/> </a> <a href="https://www.w3.org/html/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/html5/html5-original-wordmark.svg" alt="html5" width="40" height="40"/> </a> <a href="https://www.linux.org/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/linux/linux-original.svg" alt="linux" width="40" height="40"/> </a> <a href="https://www.mysql.com/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/mysql/mysql-original-wordmark.svg" alt="mysql" width="40" height="40"/> </a> <a href="https://www.nginx.com" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/nginx/nginx-original.svg" alt="nginx" width="40" height="40"/> </a> <a href="https://nodejs.org" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/nodejs/nodejs-original-wordmark.svg" alt="nodejs" width="40" height="40"/> </a> <a href="https://rubyonrails.org" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/rails/rails-original-wordmark.svg" alt="rails" width="40" height="40"/> </a> <a href="https://www.ruby-lang.org/en/" target="_blank" rel="noreferrer"> <img src="https://raw.githubusercontent.com/devicons/devicon/master/icons/ruby/ruby-original.svg" alt="ruby" width="40" height="40"/> </a> </p>

<h2>AWS構成図</h2>

<img width="836" alt="769b2648107c1775279af719234af336" src="https://user-images.githubusercontent.com/75375422/156881307-5278856a-364a-45b1-8637-fabc17b2b3b8.png">

<p>・　Terraformでリソース一式を調達してAmazon ECSにデプロイ。</p>
<p>・　master/developブランチにプッシュ後、自動でビルド・デプロイが走ります。</p>



<h2>機能一覧</h2>
<p>・ ユーザー登録、ログイン機能（device)</p>
<p>・ 投稿機能</p>
<p>・ コメント機能</p>
<p>・ いいね!機能</p>
<p>・ 通知機能</p>
<p>・ 検索機能（ransack)</p>
<p>・ ページネーション機能（kaminari)</p>

<h2>テスト</h2>
<p>・ Rspec</p>
<p>&emsp;&emsp;○ 単体テスト（model）</p>
<p>&emsp;&emsp;○ 機能テスト（request）</p>
<p>&emsp;&emsp;○ 統合テスト（system）</p>


