desc "Run the test suite"

task :test do
  Dir.chdir "Sample" do 
    system "pod install"
  end

  build = "xcodebuild \
    -workspace Sample/Sample.xcworkspace \
    -scheme Sample \
    -sdk iphonesimulator -destination 'platform=iOS Simulator,name=iPhone 6,OS=8.1'"
  system "#{build} test | xcpretty --test --color"  
end

task :default => :test

