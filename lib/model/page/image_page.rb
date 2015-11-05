module Model
	module Page
		class ImagePage  < SitePrism::Page
				set_url "https://imgflip.com"
				
        element :image_title,           "#img-title"

        def image_text
        	find('#img-title').text
        end
		end
	end
end