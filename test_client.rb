#!/usr/bin/env ruby

require 'kcl'

class SimpleProcessor < Kcl::AdvancedRecordProcessor
  def process_record data
    p data
  end
end

Kcl::Executor.new do |executor|
  executor.config stream_name: 'data-kinesis-EventQueue-3IGL5ISZIUIZ',
                  application_name: 'RubyKCLSample',
                  max_records: 5,
                  idle_time_between_reads_in_millis: 500

  executor.record_processor do
    SimpleProcessor.new
  end
end

Kcl::Executor.run
