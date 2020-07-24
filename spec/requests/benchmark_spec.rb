 require 'rails_helper'

RSpec.describe 'serializer benchmarks' do
  def ping
    get posts_path
  end

  before(:all) { GC.disable }
  after(:all) { GC.enable }

  it 'fast_jsonapi 1.5' do
    # setup
    ping_n = 100
    posts_n = 25
    comments_n = 5
    posts_n.times do
      post = create(:post)
      create_list(:comment, comments_n, post: post)
    end

    # assert apples to apples
    ping

    json = JSON.parse(response.body)

    expect(json.keys).to contain_exactly('data', 'included')
    json['data'].each do |datum|
      expect(datum.keys).to contain_exactly('id', 'type', 'attributes', 'relationships')
      expect(datum['attributes'].keys).to contain_exactly('title', 'body')
      expect(datum['relationships'].keys).to contain_exactly('user', 'comments')
      expect(datum.dig('relationships', 'comments', 'data').size).to eq(comments_n)
    end

    expect(json['included'].map { |obj| obj['type'] }.uniq).to contain_exactly('jas_user', 'jas_comment')

    included_users = json['included'].select { |obj| obj['type'] == 'jas_user' }
    expect(included_users.size).to eq(posts_n)
    expect(included_users.first.keys).to contain_exactly('id', 'type', 'attributes')
    expect(included_users.first['attributes'].keys).to contain_exactly('email', 'name')

    included_comments = json['included'].select { |obj| obj['type'] == 'jas_comment' }
    expect(included_comments.size).to eq(posts_n * comments_n)
    expect(included_comments.first.keys).to contain_exactly('id', 'type', 'attributes')
    expect(included_comments.first['attributes'].keys).to contain_exactly('body', 'post_id')

    # benchmark
    real = Benchmark.measure { ping_n.times { ping } }.real
    puts "result: #{real}s"
  end
end
