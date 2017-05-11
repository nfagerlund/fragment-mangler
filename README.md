# DON'T USE THIS

If you're on the Puppet docs team: We moved these scripts into the main puppet-docs repo! They're in the `util` folder. You have to run them with bundle exec, like `bundle exec ./util/mangle_files output/pe/2017.2/*.html`.

Don't download and use this version of the scripts! Use the built-in one!


## Old docs

The two executable scripts are `sentence_segmenter.rb` and `sentence_unsegmenter.rb`.

In order to run these scripts, you'll need to put them somewhere on your PATH. /usr/local/bin is a good bet, unless you have another place you like to keep your scripts.

I meant for you to be able to use bundle install and bundle exec to run these, but unfortunately, installing Nokogiri with bundler on Mac is a recipe for misery. So you'll need to run:

    sudo gem install nokogiri
    sudo gem install pragmatic_segmenter
    sudo gem install punkt-segmenter

before running these scripts.

The scripts work with regular shell globs too, so if you have your HTML fragments in a folder, you can `cd` to that folder and run `sentence_segmenter.rb *.html`.
