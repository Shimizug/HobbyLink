class SearchesController < ApplicationController
  
  def search
    @model = params['model']
    @content = params['content']
    @method = params['method']
    @result = search_for(@model, @content, @method)
  end

  private

  def search_for(model, content, method)
    if model == 'member'
      if member_signed_in?
        if method == 'forward'
          Member.where(
            'last_name LIKE ? OR first_name LIKE? OR last_name_kana LIKE? OR first_name_kana LIKE?',
            "#{content}%", "#{content}%", "#{content}%", "#{content}%"
          ).where(is_deleted: false)
        elsif method == 'backward'
          Member.where(
            'last_name LIKE ? OR first_name LIKE? OR last_name_kana LIKE? OR first_name_kana LIKE?',
            "%#{content}", "%#{content}", "%#{content}", "%#{content}"
          ).where(is_deleted: false)
        elsif method == 'perfect'
          Member.where(
            'last_name = ? OR first_name = ? OR last_name_kana = ? OR first_name_kana = ?',
            content, content, content, content
          ).where(is_deleted: false)
        else # partial
          Member.where(
            'last_name LIKE ? OR first_name LIKE? OR last_name_kana LIKE? OR first_name_kana LIKE?',
            "%#{content}%", "%#{content}%", "%#{content}%", "%#{content}%"
          ).where(is_deleted: false)
        end
      else
        if method == 'forward'
          Member.where(
            'last_name LIKE ? OR first_name LIKE? OR last_name_kana LIKE? OR first_name_kana LIKE?',
            "#{content}%", "#{content}%", "#{content}%", "#{content}%"
          )
        elsif method == 'backward'
          Member.where(
            'last_name LIKE ? OR first_name LIKE? OR last_name_kana LIKE? OR first_name_kana LIKE?',
            "%#{content}", "%#{content}", "%#{content}", "%#{content}"
          )
        elsif method == 'perfect'
          Member.where(
            'last_name = ? OR first_name = ? OR last_name_kana = ? OR first_name_kana = ?',
            content, content, content, content
          )
        else # partial
          Member.where(
            'last_name LIKE ? OR first_name LIKE? OR last_name_kana LIKE? OR first_name_kana LIKE?',
            "%#{content}%", "%#{content}%", "%#{content}%", "%#{content}%"
          )
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