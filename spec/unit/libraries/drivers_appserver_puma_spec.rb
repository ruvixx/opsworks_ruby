# frozen_string_literal: true

require 'spec_helper'

describe Drivers::Appserver::Puma do
  let(:driver) { described_class.new(dummy_context(node), aws_opsworks_app) }

  it 'receives and exposes app and node' do
    expect(driver.app).to eq aws_opsworks_app
    expect(driver.send(:node)).to eq node
    expect(driver.options).to eq({})
  end

  it 'has the correct driver_type' do
    expect(driver.driver_type).to eq('appserver')
  end

  it 'returns proper out data' do
    expect(driver.out).to eq(worker_processes: 8, thread_min: 0, thread_max: 16, after_deploy: 'stop-start')
  end
end
