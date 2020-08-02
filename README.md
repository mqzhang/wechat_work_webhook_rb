# WechatWorkWebhook

企业微信群机器人Webhook Ruby 客户端. 支持文本消息, markdown, 图片, 图文, 文件 消息 ( https://work.weixin.qq.com/api/doc/90000/90136/91770 ).

A wechat work webhook Ruby client which support text, markdown, image, news, file message ( https://work.weixin.qq.com/api/doc/90000/90136/91770 ).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'wechat_work_webhook'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install wechat_work_webhook

## Usage

```ruby
require 'wechat_work_webhook'

wechat = WechatWorkWebhook.new('WEBHOOK_URL')

wechat.text('test', ['@all'])

wechat.markdown('实时新增用户反馈<font color=\"warning\">132例</font>，请相关同事注意。')

wechat.news([{
                   "title" => "中秋节礼品领取",
                   "description" => "今年中秋节公司有豪礼相送",
                   "url" => "URL",
                   "picurl" => "http://res.mail.qq.com/node/ww/wwopenmng/images/independent/doc/test_pic_msg1.png"
               }])

wechat.image('test.png')

wechat.media(wechat.upload_media('test.csv')['media_id'])

wechat.file('test.csv')
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/mqzhang/wechat_work_webhook_rb. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/mqzhang/wechat_work_webhook_rb/blob/master/CODE_OF_CONDUCT.md).


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the WechatWorkWebhook project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/mqzhang/wechat_work_webhook_rb/blob/master/CODE_OF_CONDUCT.md).
