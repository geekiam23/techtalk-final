module PostsHelper
  def post_form_for(content_type)
  form_for(Post.new, url: content_type.new) do |form|
    form.fields_for(:content) { |content_form| yield(content_form) } +
    form.submit("Post!")
    end
  end
end
