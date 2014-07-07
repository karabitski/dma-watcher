#!/usr/bin/env ruby

require './config/environment.rb'

IRB.start
IRB.conf[:PROMPT][:SUGARCRM] = {
  :PROMPT_C => "SugarCRM :%03n > ", 
  :AUTO_INDENT=>true, 
  :RETURN=>" => %s \n", 
  :PROMPT_I=>"SugarCRM :%03n > ", 
  :PROMPT_N=>"SugarCRM :%03n?> ", 
  :PROMPT_S=>"SugarCRM :%03n%l> "
}
IRB.conf[:PROMPT_MODE] = :SUGARCRM

