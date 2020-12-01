class Challenge < ApplicationRecord
  has_many :challengesets, dependent: :destroy

  validates :message, presence: true
  validates :nb_days_veggie, inclusion: { in: (0..7) }
  validates :nb_days_local, inclusion: { in: (0..7) }
  validates :total_days_of_challenge, exclusion: { in: [0], message: "A challenge have to be on 1 day minimum! :)" }

  def total_days_of_challenge
    self.nb_days_veggie + self.nb_days_local
  end
end
