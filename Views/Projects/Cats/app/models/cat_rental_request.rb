# == Schema Information
#
# Table name: cat_rental_requests
#
#  id         :bigint           not null, primary key
#  cat_id     :integer          not null
#  start_date :date             not null
#  end_date   :date             not null
#  status     :string           default("PENDING"), not null
#
class CatRentalRequest < ApplicationRecord
    validates :cat_id, presence: true
    validates :start_date, presence: true
    validates :end_date, presence: true
    validates :status, presence: true, inclusion: { in: %w(PENDING DENIED APPROVED) }
    validate :no_overlaps

    


    belongs_to(
        :cat,
        class_name: "Cat",
        foreign_key: :cat_id,
        primary_key: :id
    )

    def overlapping_requests
        start = self.start_date
        ed = self.end_date
        req = CatRentalRequest
        .where("start_date BETWEEN ? AND ? OR end_date BETWEEN ? AND ?", start, ed, start, ed)
        .where("cat_id = ?", self.cat_id)

        req
    end

    def overlapping_approved_requests
        overlapping_requests.find_by(status: "APPROVED")
    end

    private

    def no_overlaps
        unless self.overlapping_approved_requests == nil
            self.errors[:start_date] << "You must choose a date that is open"
        end
    end



end
