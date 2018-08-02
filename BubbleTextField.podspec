Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.name         = "BubbleTextField"
  s.version      = "0.0.2"
  s.summary      = "An Expanding Bubble Text Field 💬 written in Swift."

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC
			An auto-expanding bubble text field. 💬 Written in Swift, and inspired by Xcode's refactor text field.
                   DESC

  s.homepage     = "https://github.com/chriszielinski/BubbleTextField"
  s.screenshots  = "https://github.com/chriszielinski/BubbleTextField/raw/master/readme-assets/BubbleTextField.gif"


  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.license      = { :type => "MIT", :file => "LICENSE" }


  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.authors            = { "chriszielinski" => "chrisz@berkeley.edu" }
  s.social_media_url   = "http://twitter.com/mightbesuperman"

  # ――― Platform Specifics ――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.platform     = :osx, "10.11"


  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source       = { :git => "https://github.com/chriszielinski/BubbleTextField.git", :tag => "#{s.version}" }


  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source_files  = "BubbleTextField"
  s.swift_version = "4.1"


end
