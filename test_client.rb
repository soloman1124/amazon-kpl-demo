#!/usr/bin/env ruby

require 'kcl'

class SimpleProcessor < Kcl::AdvancedRecordProcessor
  def process_record data
    p data
  end
end


SimpleProcessor.new.run
