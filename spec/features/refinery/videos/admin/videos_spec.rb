# encoding: utf-8
require "spec_helper"

module Refinery
  module Videos
    module Admin
      describe Video, type: :feature do
        refinery_login

        describe "videos list" do
          before do
            FactoryGirl.create(:video, :title => "UniqueTitleOne")
            FactoryGirl.create(:video, :title => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.videos_admin_videos_path
            expect(page).to have_content("UniqueTitleOne")
            expect(page).to have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.videos_admin_videos_path

            click_link "Add New Video"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Title", :with => "This is a test of the first string field"
              click_button "Save"

              expect(page).to have_content("'This is a test of the first string field' was successfully added.")
              expect(Refinery::Videos::Video.count).to eq 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              expect(page).to have_content("Title can't be blank")
              expect(Refinery::Videos::Video.count).to eq 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:video, :title => "UniqueTitle") }

            it "should fail" do
              visit refinery.videos_admin_videos_path

              click_link "Add New Video"

              fill_in "Title", :with => "UniqueTitle"
              click_button "Save"

              expect(page).to have_content("There were problems")
              expect(Refinery::Videos::Video.count).to eq 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:video, :title => "A title") }

          it "should succeed" do
            visit refinery.videos_admin_videos_path

            within ".actions" do
              click_link "Edit this video"
            end

            fill_in "Title", :with => "A different title"
            click_button "Save"

            expect(page).to have_content("'A different title' was successfully updated.")
            expect(page).to have_no_content("A title")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:video, :title => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.videos_admin_videos_path

            click_link "Remove this video forever"

            expect(page).to have_content("'UniqueTitleOne' was successfully removed.")
            expect(Refinery::Videos::Video.count).to eq 0
          end
        end

      end
    end
  end
end
