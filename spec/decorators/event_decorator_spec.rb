require 'rails_helper'

RSpec.describe EventDecorator do
  describe "#date_display" do
    let(:event) { create(:event, start_date: start_date, end_date: end_date).decorate }

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

  describe "#date_range" do
    let(:event) { create(:event, start_date: start_date, end_date: end_date).decorate }

    context "for a single date event" do
      let(:start_date) { "2017-11-03"}
      let(:end_date) { "2017-11-03"}

      it "returns array with one date" do
        expect(event.date_range).to eq [Date.parse("2017-11-03")]  
      end
    end

    context "for a two-day event" do
      let(:start_date) { "2017-11-03"}
      let(:end_date) { "2017-11-04"}

      it "returns array with two dates" do
        expect(event.date_range).to eq [Date.parse("2017-11-03"), Date.parse("2017-11-04")]  
      end
    end

    context "for a three-day event" do
      let(:start_date) { "2017-11-03"}
      let(:end_date) { "2017-11-05"}

      it "returns array with three dates" do
        expect(event.date_range).to eq [Date.parse("2017-11-03"), Date.parse("2017-11-04"), Date.parse("2017-11-05")]  
      end
    end
  end

  describe "#name_and_iterator" do
    let(:event) { create(:event, iterator: "1").decorate }

    it "returns string with name and iterator" do
      expect(event.name_and_iterator).to eq "Farmhouse Conf 1"
    end
  end

  describe "#location" do
    let(:event) { create(:event).decorate }

    it "returns string with 'City, State'" do
      expect(event.location).to eq "Hollywood, CA"
    end
  end
end
