#!/usr/bin/env perl
use Mojolicious::Lite;

# Documentation browser under "/perldoc"
plugin 'PODRenderer';

get '/' => sub {
    my $c    = shift;
    my $hoge = 1 * 2;
    $c->stash(hoge => $hoge);
    $c->render(template => 'index');
};

get '/hoge' => sub {
    my $c = shift;
    $c->render(template => 'index2');
};

get '/profile' => sub {
    my $c = shift;

    my %hash = (
        hoge     => 'hoge',
        name     => '若林信敬',
        hobby    => 'プログラミング',
        language => 'Perl',
    );
    $c->stash(%hash);
    $c->render(template => 'index');
};

app->start;
__DATA__

@@ profile.html.ep
<html>
<head><title><%= $name %>のプロフィール</title></head>
<body style='padding: 30px;'>
  私の名前は<%= $name %>です.<br>
  趣味は<%= $hobby %>で, 好きなプログラミング言語は<%= $language %>です.
</body>
</html>

@@ index2.html.ep
% layout 'default2';
% title 'Welcome';
<h1>index2</h1>

@@ index.html.ep
% layout 'default';
% title 'Welcome';
<h1>web framework!</h1>
<h2><%= $hoge %></h2>
% $hoge = 'テンプレートの中で定義';
<h3>
%= $hoge
</h3>
To learn more, you can browse through the documentation
<%= link_to 'here' => '/perldoc' %>.

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>

@@ layouts/default2.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><pre><%= content %></pre></body>
</html>
