class Discharge < ApplicationRecord
  self.inheritance_column = nil
  audited

  belongs_to :user, foreign_key: "member_id"

  enum type: {honorable: "Honorable",
              general: "General",
              dishonorable: "Dishonorable"}

  enum forum_id: {phpbb: "PHPBB",
                  smf: "SMF",
                  vanilla: "Vanilla",
                  discourse: "Discourse"}

  attr_accessor :end_assignments

  validates :user, presence: true
  validates :date, presence: true
  validates_date :date
  validates :type, presence: true
  validates :reason, presence: true
  validates :forum_id, presence: true, if: -> { topic_id.present? }
  validates :topic_id, numericality: {only_integer: true}, allow_nil: true
end
