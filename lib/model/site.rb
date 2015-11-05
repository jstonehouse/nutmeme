module Model
	class Site
		
		def self.instance
    	@instance ||= new
  	end

    def home_page
      @home_page ||= Model::Page::HomePage.new
    end

    def meme_generator
      @meme_generator ||= Model::Page::MemeGenerator.new
    end

    def preview
      @preview ||= Model::Page::Preview.new
    end

    def image_page
      @image_page ||= Model::Page::ImagePage.new
    end

  end
end