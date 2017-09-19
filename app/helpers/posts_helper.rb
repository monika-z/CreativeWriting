module PostsHelper
    
    def post_date(post)
        post.created_at.in_time_zone("Europe/Warsaw").strftime('%d-%m-%Y %H:%M:%S')
    end
    
    def post_comments(post)
        link_to "#{I18n.t('post.comment')} #{post.comments.size}", post
    end    
    
    def post_new
        if current_user.username == "admin" 
           "#{I18n.t('post.admin')}"  
        else 
           "#{I18n.t('post.new')}"  
        end
    end    
    
end
