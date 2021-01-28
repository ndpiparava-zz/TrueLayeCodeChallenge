
Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
s.name         = "TLList"
s.version      = "1.0.0"
s.summary      = "A TLList."
s.description  = "TrueLayer Sdk is to server while you focus on your business applications."
s.homepage     = "http://github.com/ndpiparava"
s.license      = "MIT"
s.author       = "Nitin"
s.platform     = :ios, "13.5"
s.source       = { :path => '.' }
s.source_files = "TLList"
s.resources = "TLList/*.png", "TLList/*.jpg", 'TLList/*.xib', "TLList/*.otf", "TLList/*.xcdatamodeld"

s.swift_version = "4.2" 
 
end
