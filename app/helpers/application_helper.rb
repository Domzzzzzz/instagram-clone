module ApplicationHelper

  # Helper to display how long ago a post was created
  def how_long_ago(post)
    if post.created_at > Time.now.beginning_of_day
      "Posted " + time_ago_in_words(post.created_at) + " ago"
    else
      "Posted on " + post.created_at.strftime("%b %d, %Y")
    end
  end

  # Helper displays default placeholder img if a post img doesn't exist
  def form_image_select(post)
    if post.image.exists?
      image_tag post.image, id: 'image-preview', class: 'img-responsive'
    else
      image_tag 'placeholder.jpg', id: 'image-preview', class: 'img-responsive'
    end
  end

  # Helper displays default avatar if user's avatar doesn't exist
  def profile_avatar_select(user)
    if user.avatar.exists?
      image_tag user.avatar.url(:medium), id: 'image-preview', class: 'img-responsive img-circle profile-image'
    else
      image_tag 'default-avatar.jpg', id: 'image-preview', style: 'height:100px;width:100px;', class: 'img-responsive img-circle profile-image'
    end
  end

end
