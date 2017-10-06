require 'rails_helper'

RSpec.describe Event, type: :model do
  describe "#date_display" do
    let(:event) { create :event, start_date: start_date, end_date: end_date }

    context "for single day" do
      let(:start_date) { "1982-08-05" }
      let(:end_date) { "1982-08-05" }

      it "returns correct string" do
        expect(event.date_display).to eq "August 5th, 1982"
      end
    end

    context "for multi-day in the same month and year" do
      let(:start_date) { "1982-08-05" }
      let(:end_date) { "1982-08-07" }

      it "returns correct string" do
        expect(event.date_display).to eq "August 5th - 7th, 1982"
      end
    end

    context "for multi-day and multi-month in the same year" do
      let(:start_date) { "1982-08-05" }
      let(:end_date) { "1982-09-01" }

      it "returns correct string" do
        expect(event.date_display).to eq "August 5th - September 1st, 1982"
      end
    end

    context "for multi-month with the same day in the same year" do
      let(:start_date) { "1982-08-01" }
      let(:end_date) { "1982-09-01" }

      it "returns correct string" do
        expect(event.date_display).to eq "August 1st - September 1st, 1982"
      end
    end

    context "for multi-day and multi-month and multi-year" do
      let(:start_date) { "1982-08-05" }
      let(:end_date) { "1983-02-06" }

      it "returns correct string" do
        expect(event.date_display).to eq "August 5th, 1982 - February 6th, 1983"
      end
    end
  end
end
