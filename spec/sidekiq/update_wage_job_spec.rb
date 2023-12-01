require 'rails_helper'
RSpec.describe UpdateWageJob, type: :job do
  let(:proponent) { create(:proponent) }
  let(:new_wage) { (proponent.wage + 150).to_s }

  it { expect { described_class.perform_async(proponent.id, new_wage) }.to change(described_class.jobs, :size).by(1) }

  it do
    described_class.new.perform(proponent.id, new_wage)
    proponent.reload
    expect(proponent.wage.to_f).to eq(new_wage.to_f)
  end
end
