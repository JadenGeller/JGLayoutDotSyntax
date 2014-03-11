Pod::Spec.new do |s|
  s.name         = "JGLayoutDotSyntax"
  s.version      = "0.0.1"
  s.summary      = "Allows developers to set up autolayout constraints using familiar dot syntax—even with font sizes!"

  s.description  = <<-DESC
                   A longer description of JGLayoutDotSyntax in Markdown format.

                   * Think: Why did you write this? What is the focus? What does it do?
                   * CocoaPods will be using this to generate tags, and improve search results.
                   * Try to keep it short, snappy and to the point.
                   * Finally, don't worry about the indent, CocoaPods strips it!
                   DESC

  s.homepage     = "https://github.com/JadenGeller/JGLayoutDotSyntax"
  s.screenshots  = "https://github.com/JadenGeller/JGLayoutDotSyntax/blob/master/example_layout_landscape.png", "https://github.com/JadenGeller/JGLayoutDotSyntax/blob/master/example_layout_portrait.png"


  s.license      = { :type => 'MIT', :file => 'LICENSE.md' }

  # s.author             = { "Jaden Geller" => "email@address.com" }
  # s.authors          = { "Jaden Geller" => "email@address.com", "other author" => "email@address.com" }
  s.author           = 'Jaden Geller'
  # s.social_media_url = "http://twitter.com/Jaden Geller"

  s.platform     = :ios, '6.0'

  s.source       = { :git => "https://github.com/JadenGeller/JGLayoutDotSyntax.git", :tag => "0.0.1" }

  s.source_files  = 'JGLayoutDotSyntax', 'JGLayoutDotSyntax/**/*.{h,m}'

  s.requires_arc = true

end
