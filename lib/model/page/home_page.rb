module Model
	module Page
		class HomePage  < SitePrism::Page
				set_url "https://imgflip.com"
				
        element :create_meme,           "a[href='/memegenerator']"
				section  :go_create, 							Model::Section::GoCreate, 	"#go-create"
				
        def generate_meme_select
        	all("a[href='/memegenerator']").first.click
        end
		end
	end
end

