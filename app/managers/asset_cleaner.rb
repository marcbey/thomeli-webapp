class AssetCleaner
  attr_reader :assets

  def initialize
    @assets = Asset.where( 'created_at < ?', 30.days.ago )
  end

  def clean_up
    self.assets.each do |asset|
      asset.destroy
    end
  end
end

