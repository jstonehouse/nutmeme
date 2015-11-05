module Model
	module Section
		class GoCreate  < SitePrism::Section
				
				#element :go_create,						"#go-create"
				element :create_meme,           "a[href='/memegenerator']"
		end 
	end
end