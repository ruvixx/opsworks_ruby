# frozen_string_literal: true

require 'spec_helper'

describe Drivers::Framework::Rails do
  let(:driver) { described_class.new(dummy_context(node), aws_opsworks_app) }

  it 'receives and exposes app and node' do
    expect(driver.app).to eq aws_opsworks_app
    expect(driver.send(:node)).to eq node
    expect(driver.options).to eq({})
  end

  it 'has the correct driver_type' do
    expect(driver.driver_type).to eq('framework')
  end

  it 'returns proper out data' do
    expect(driver.out).to eq(
      assets_precompile: true,
      assets_precompilation_command: 'bundle exec rake assets:precompile',
      envs_in_console: true,
      deploy_environment: { 'RAILS_ENV' => 'staging' },
      migration_command: 'rake db:migrate',
      migrate: false
    )
  end
end
