module Model
	module Page
		class MemeGenerator < SitePrism::Page
				set_url "https://imgflip.com/memegenerator"
				
				element  :generate,                 ".mm-generate"
				#element  :top_text,								"textarea[placeholder='TOP TEXT']"
			  #element  :bottom_text,						"textarea[placeholder='BOTTOM TEXT']"
				section  :meme_settings, 							Model::Section::MemeSettings, 	"#mm-settings"


			  def meme_title
			  	find('#mm-meme-title').text
			  end
				
		end
	end
end