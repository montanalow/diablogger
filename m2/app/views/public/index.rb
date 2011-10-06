require File.expand_path "../layout", __FILE__

class Public::Index < Public::Layout
  def render_content
    h1 "Dialog is"
    ul :id => "features" do
      li :style => "display:none" do
        h2 raw "It&#146;s Blogging in Stereo"
        p raw "Whether it&#146;s counterpoint or harmony, two voices can create a singular work for others to enjoy.  Monolog is so 2000."
      end
      li :style => "display:none" do
        h2 raw "It&#146;s Challenging"
        p raw "As iron sharpens iron, so too, one man sharpens another. Put your convictions to the test against the best the opposition has to offer."
      end
      li :style => "display:none" do
        h2 raw "It&#146;s Fun"
        p raw "Few things in life are as enjoyable as good conversation. Dialog enables you to share your thoughts with the people you care about."
      end
      li :style => "display:none" do
        h2 raw "It&#146;s Inspirational"
        p raw "Two heads are better than one. As your peers present you with new challenges, you&#146;ll be continuously exposed to fresh perspectives."
      end
      li :style => "display:none" do
        h2 raw "It&#146;s Social"
        p raw "Gone are the days of isolated commentary. It&#146;s time to have real conversations with people who&#146;s thoughts inspire and challenge your own."
      end
      li :style => "display:none" do
        h2 raw "It&#146;s Exciting"
        p raw "Discovering new people and ideas is one of life&#146;s greatest rewards. Dialog makes it easy to find the deepest thinkers and most persuasive speakers."
      end
    end

    a :id => "start", :href => "/start" do
      h2 "Get Started"
      text raw "It&#146;s "; b "free"; text " and "; b "easy"; text "!"
    end

#    h2 "Most Convincing"
#    ul :id => "headlines" do
##      Dialog.all.each do |dialog|
##        li dialog.headline
##      end
#    end
#
#    h2 "Most Controversial"
#
#    h2 "Latest Posts"

    img :src => "/images/logo.jpg", :id => "logo", :width => "273px", :height => "163px"
    img :src => "/images/home/cloud.jpg", :id => "cloud", :style => "display:none", :width => "462px", :height => "189px"
    img :src => "/images/home/cloud1.gif", :id => "cloud0", :style => "display:none", :width => "13px", :height => "18px"
    img :src => "/images/home/cloud2.gif", :id => "cloud1", :style => "display:none", :width => "23px", :height => "29px"
    img :src => "/images/home/cloud3.gif", :id => "cloud2", :style => "display:none", :width => "30px", :height => "33px"
  end

  def render_scripts
    javascript "
      var features = $('features').childElements();
      var current_feature = -1;
      var timer;
      function show_next_feature(cloud) {
        if(cloud >= 0) $('cloud' + (cloud % 3)).shake({distance:2});
        if(features[current_feature]) features[current_feature].hide();
        current_feature = (current_feature + 1) % features.size();
        features[current_feature].appear();
        if( timer ) clearTimeout( timer );
        timer = setTimeout('show_next_feature(current_feature)', 10000);
      }
      $('cloud0').observe('mouseover', function(){show_next_feature(0)});
      $('cloud1').observe('mouseover', function(){show_next_feature(1)});
      $('cloud2').observe('mouseover', function(){show_next_feature(2)});
      $('cloud0').appear({delay:1});
      $('cloud1').appear({delay:2});
      $('cloud2').appear({delay:3});
      $('cloud').appear({delay:4});
      setTimeout( 'show_next_feature(current_feature)', 4000);

      $('start').observe('mouseover', function(){$('glow').appear({ duration: 3.0 })});
    "
  end
end
