module Model
	module Page
		class Preview  < SitePrism::Page
				set_url "https://imgflip.com/memegenerator"

        element :go_image,           ".l"
        
        def go_to_image
        find('#doneLinks').find("a",:text=>"Go to image page").click
        end
				
		end
	end
end