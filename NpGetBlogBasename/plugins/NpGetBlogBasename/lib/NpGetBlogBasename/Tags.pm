package NpGetBlogBasename::Tags;
use strict;

sub _hdlr_get_blog_basename {
    my ($ctx, $args) = @_;

    require MT::Blog;
    my $blog_id = $ctx->stash('blog_id');
    my $blog = MT::Blog->load($blog_id);


use Data::Dumper;
#doLog(Dumper($blog));
doLog($blog->site_path());
doLog($blog->raw_site_url());

    my $return = $blog->raw_site_url();
    $return =~ s/\///g;
    return $return;

}

sub doLog {
    my ($msg, $class) = @_;
    return unless defined($msg);

    require MT::Log;
    my $log = new MT::Log;
    $log->message($msg);
    $log->level(MT::Log::DEBUG());
    $log->class($class) if $class;
    $log->save or die $log->errstr;
}

1;
