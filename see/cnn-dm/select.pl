#!/usr/bin/env perl

# randomly selects n stories from each of the 2 supplied folders
# then writes them to a selected/{cnn,dailymail}/stories folder

use File::Copy;

sub select_stories_from_source {
    my($source_dir, $N) = @_;
    
    my $n = 925;
    my $dest_dir = "selected";

    my @selected_stories_indeces = ();
    until (scalar(@selected_stories_indeces) == $n) {
        my $random_index;
        do {
            $random_index = int(rand($N));
        } while (grep(/^$random_index$/, @selected_stories_indeces));
        push @selected_stories_indeces, $random_index;
    }
    
    opendir(SOURCE_DIR, $source_dir) or die "Unable to open $source_dir";
    if (!-d "$dest_dir/$source_dir") {
        `mkdir -p "$dest_dir/$source_dir"`;
    }
    my $i = 0; # index of the current story
    while (my $story_filename = readdir(SOURCE_DIR)) {
        if (grep(/^$i$/, @selected_stories_indeces)) {
            copy("$source_dir/$story_filename", "$dest_dir/$source_dir/$story_filename")
                or die "Cannot write $dest_dir/$source_dir/$story_filename";
        }
        $i++;
    }
}

my $CNN_STORIES_LOCATION = "cnn/stories";
my $DAILYMAIL_STORIES_LOCATION = "dailymail/stories";
my $CNN_STORIES_N = 92579;
my $DAILYMAIL_STORIES_N = 219506;
select_stories_from_source($DAILYMAIL_STORIES_LOCATION, $DAILYMAIL_STORIES_N);
