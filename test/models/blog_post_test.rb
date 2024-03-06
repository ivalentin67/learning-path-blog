require "test_helper"
#ERREUR A CORRIGER

class BlogPostTest < ActiveSupport::TestCase
  #draft
  # Premier moyen de raccourcir le code
  test "draft? returns true for draft blog post" do
    assert draft_blog_post.draft?
  end

  # Deuxième moyen de raccourcir le code
  test "draft? returns false for published blog post" do
    refute blog_posts(:published).draft?
  end
  test "draft? returns false for scheduled blog post" do
    refute BlogPost.new(published_at: 1.year.from_now).draft?
    end

  #published
  test "published? returns true for published blog post" do
    assert BlogPost.new(published_at: 1.year.ago).published?
  end
  test "published? returns false for draft blog post" do
    refute BlogPost.new(published_at: nil).published?
  end
  test "published? returns false for scheduled blog post" do
    refute BlogPost.new(published_at: 1.year.from_now).published?
    end

  #scheduled
  test "scheduled? returns true for scheduled blog post" do
    assert BlogPost.new(published_at: 1.year.from_now).scheduled?
  end
  test "scheduled? returns false for draft blog post" do
    refute BlogPost.new(published_at: nil).scheduled?
  end
  test "scheduled? returns false for published blog post" do
    refute BlogPost.new(published_at: 1.year.ago).scheduled?
  end

  def draft_blog_post
    BlogPost.new(published_at: nil)
  end
end
