Given(/^I have seleted a specfic template$/) do
  imgflip.home_page.load
  imgflip.home_page.generate_meme_select
  imgflip.meme_generator.meme_settings.select_random_template
  @memetitle = imgflip.meme_generator.meme_title
  #binding.pry
  imgflip.meme_generator.top_text.set('So you Think')
  imgflip.meme_generator.bottom_text.set('This Is Funny?')
end

When(/^I submit my completed template$/) do
  imgflip.meme_generator.generate.click
  imgflip.preview.go_to_image
end

Then(/^I succesfully create a new meme$/) do
 @ititle = imgflip.image_page.image_text
 expect(@memetitle).to eq @ititle
end