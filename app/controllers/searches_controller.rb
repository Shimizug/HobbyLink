class SearchesController < ApplicationController
  
  def search
    #どのモデルの要素を検索するかを指定
    @model = params['model']
    #検索文字列を入力
    @content = params['content']
    #検索する方式（前方一致など）を指定
    @method = params['method']
    @result = search_for(@model, @content, @method)
  end

  private

  def search_for(model, content, method)
    if model == 'member'
      if member_signed_in?
        if method == 'forward'
          Member.where('nickname LIKE?', content + '%').where(is_deleted: false)
        elsif method == 'backward'
          Member.where('nickname LIKE?', '%' + content).where(is_deleted: false)
        elsif method == 'perfect'
          Member.where(nickname: content).where(is_deleted: false)
        else # partial
          Member.where('nickname LIKE?', '%' + content + '%').where(is_deleted: false)
        end
      else
        if method == 'forward'
         Member.where('nickname LIKE?', content + '%')
        elsif method == 'backward'
          Member.where('nickname LIKE?', '%' + content)
        elsif method == 'perfect'
          Member.where(nickname: content).where(is_deleted: false)
        else # partial
          Member.where('nickname LIKE?', '%' + content + '%')
        end
      end
    elsif model == 'post'
      if method == 'forward'
        Post.where('titke LIKE ?', content + '%')
      elsif method == 'backward'
        Post.where('titke LIKE ?', '%' + content)
      elsif method == 'perfect'
        Post.where(title: content)
      else # partial
        Post.where('title LIKE ?', '%' + content + '%')
      end
    elsif model == 'board'
      if method == 'forward'
        Board.where('titke LIKE ?', content + '%')
      elsif method == 'backward'
        Board.where('titke LIKE ?', '%' + content)
      elsif method == 'perfect'
        Board.where(title: content)
      else # partial
        Board.where('title LIKE ?', '%' + content + '%')
      end
    else
      [] # 空配列を返す
    end
  end
end