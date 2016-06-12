module ApplicationHelper

  # Helper to display how long ago post was created
  def how_long_ago(post)
    if post.created_at > Time.now.beginning_of_day
      "Posted " + time_ago_in_words(post.created_at) + " ago"
    else
      "Posted on " + post.created_at.strftime("%b %d, %Y")
    end
  end

  # Helper displays default placeholder img if a post img don't exist
  def form_image_select(post)
    if post.image.exists?
      image_tag post.image, id: 'image-preview', class: 'img-responsive'
    else
      image_tag 'placeholder.jpg', id: 'image-preview', class: 'img-responsive'
    end
  end

end
