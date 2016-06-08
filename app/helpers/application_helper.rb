module ApplicationHelper

  # alert helper
  def alert_for(flash_type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }
    [flash_type.to_sym] || flash_type.to_s
  end

  # Helper to display how long ago post was created
  def how_long_ago(post)
    if post.created_at > Time.now.beginning_of_day
      "Posted " + time_ago_in_words(post.created_at) + " ago"
    else
      "Posted on " + post.created_at.strftime("%b %d, %Y")
    end
  end

end
