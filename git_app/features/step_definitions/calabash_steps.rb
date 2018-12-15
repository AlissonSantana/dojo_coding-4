require 'calabash-android/calabash_steps'

When(/^I found the project "([^"]*)"$/) do |project_name|
  @project_name = project_name
  @actions = Basic.new
  @actions.scroll_until_find_text(project_name, 'main_list')
end

Then(/^a list all pull requests and stars$/) do
  name_list = @actions.get_text_elements_by_id('repo_name')
  fork_list = @actions.get_text_elements_by_id('repo_forks')
  start_list = @actions.get_text_elements_by_id('repo_stars')

  project_info = @actions.merge_project_fork_star_info(name_list, fork_list, start_list)

  project_info.each do |item|
    puts item if item['nome'] == @project_name
  end
end

When(/^click in the project$/) do
  @actions.click_element_by_text(@project_name)
end

Then(/^a list all commits$/) do
  wait_for_element_exists("AppCompatTextView {text CONTAINS 'opened'}")
  total_commits_header_element = query("AppCompatTextView {text CONTAINS 'opened'}").first
  total_commits = (total_commits_header_element['text'].split(" ").first).to_i
  list_commits = []
  list_usernames = []
  while list_commits.count < total_commits

    # find all commits on screen
    titles = @actions.find_element_by_id('repo_detail_title')

    # for each commit
    titles.each do |item|
      # add the title-commit ot list_commits if not exists in the list
      unless list_commits.include?(item['text'])
        list_commits << item['text']
      end
    end

    usernames = @actions.find_element_by_id('repo_detail_username')
    usernames.each do |item|
      list_usernames << item['text'] unless list_usernames.include?(item['text'])
    end

    #scroll down the screen until list_commits.count < total_commits
    @actions.scroll_down_by_element_id('detail_list')

  end

  # print commits titles and authors in the console output
  for i in 0..list_commits.count-1
    puts "#{i+1} - Commit Title: #{list_commits[i]} - Author: #{list_usernames[i]}\n"
  end

  # verify if the total commits counter in the header is iqual to the list commits count
  expect(list_commits.count).to eq total_commits
end
