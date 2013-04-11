#!/usr/bin/env ruby
# encoding=utf-8

# Purpose: Convert the Scim table to Uim table
# Author : Anh K. Huynh
# Date   : 2013 Mar 7th
# Usage  :
#   $0 --telex < src/Telex.txt.in > xteltex.scm
#   $0 --vni   < src/VNI.txt.in   > xvni.scm

mode = true
ARGV.each do |p|
  mode = case p
  when "--telex" then true
  when "--vni"   then false
  end
end

name = {true => "Telex", false => "VNI"} [mode]
xname = {true => "xtelex", false => "xvni"} [mode]

reg  = {true => /^(\p{Alpha}+)\p{Space}+([^\p{Space}]+)\p{Space}+0$/,
        false => /^(\p{Alnum}+)\p{Space}+([^\p{Space}]+)\p{Space}+0$/ } [mode]

puts <<-EOF
(require "generic.scm")
(define #{xname}-rule
  '(
EOF

STDIN.readlines.each do |line|
  line.strip!
  if gs = line.match(reg)
    input, output = gs[1,2]
    input = input.split(//).map{|c| "\"#{c}\""}.join(" ")
    puts sprintf("(((%s ))(\"%s\"))", input, output)
  end
end

puts <<-EOF
  ))
(define #{xname}-init-handler
  (lambda (id im arg)
    (generic-context-new id im #{xname}-rule #f)))

(generic-register-im
 '#{xname}
 "vi"
 "UTF-8"
 (N_ "X#{name}")
 (N_ "Big table of predefined words for Vietnamese #{name} users")
 #{xname}-init-handler)
EOF
