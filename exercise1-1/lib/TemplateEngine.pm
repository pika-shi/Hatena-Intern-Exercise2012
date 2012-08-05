package TemplateEngine;

use strict;
use warnings;
use utf8;

sub new {
    my ($class, %args) = @_;
    my $self = { %args };
    bless $self, $class;
    return $self;
}

sub render {
    my ($self, $data) = @_;
    open(IN, $self->{file}) or die("Can't open $self->{file}");
    my $template;
    while (my $line = <IN>){
        while ((my $key, my $val) = each (%$data)) {
            if (index($line, '{% $key %}')){
                my $str = $val;
                $str =~ s/&/&amp;/g;
                $str =~ s/</&lt;/g;
                $str =~ s/>/&gt;/g;
                $str =~ s/"/&quot;/g;
                $line =~ s/{% $key %}/$str/;
            }
        }
        utf8::encode($line);
        $template .= $line;
    }
    return $template;
}

1;
__END__
