# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, "モデルに関するテスト", type: :model do
  describe '実際に保存してみる' do
    it "有効な投稿内容の場合は保存されるか" do
      expect(FactoryBot.build(:post)).to be_valid
    end
  end
  context "空白のバリデーションチェック" do
    it "titleが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      post = Post.new(title: '', body:'hoge')
      expect(post).to be_invalid
      expect(post.errors[:title]).to include("can't be blank")
    end
    it "bodyが空白の場合にバリデーションチェックされ空白のエラーメッセージが返ってきているか" do
      post = Post.new(title: 'hoge', body:'')
      expect(post).to be_invalid
      expect(post.errors[:body]).to include("can't be blank")
    end
  end
  feature "titleを空白で投稿した場合に画面にエラーメッセージが表示されているか" do
    before do
      visit posts_path
      fill_in 'post[title]', with: ''
    end
    scenario "エラーメッセージは正しく表示されるか" do
      find("input[name='commit']").click
      expect(page).to have_content "can't be blank"
    end
  end
  feature "bodyを空白で投稿した場合に画面にエラーメッセージが表示されているか" do
    before do
      visit posts_path
      fill_in 'post[body]', with: ''
    end
    scenario "エラーメッセージは正しく表示されるか" do
      find("input[name='commit']").click
      expect(page).to have_content "can't be blank"
    end
  end
  

end
