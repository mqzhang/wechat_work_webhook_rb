require_relative 'lib/wechat_work_webhook.rb'

Gem::Specification.new do |spec|
  spec.name          = "wechat_work_webhook"
  spec.version       = WechatWorkWebhook::VERSION
  spec.authors       = ["mqzhang"]
  spec.email         = ["zmingqian@qq.com"]

  spec.summary       = %q{企业微信群机器人Webhook Ruby 客户端. A wechat work webhook Ruby client.}
  spec.description   = %q{企业微信群机器人Webhook Ruby 客户端. 支持文本消息, markdown, 图片, 图文, 文件 消息 ( https://work.weixin.qq.com/api/doc/90000/90136/91770 ). A wechat work webhook Ruby client which support text, markdown, image, news, file message ( https://work.weixin.qq.com/api/doc/90000/90136/91770 ).}
  spec.homepage      = "https://github.com/mqzhang/wechat_work_webhook_rb"
  spec.license       = "MIT"

  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  spec.metadata["allowed_push_host"] = "https://rubygems.org/"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/mqzhang/wechat_work_webhook_rb"
  spec.metadata["changelog_uri"] = "https://github.com/mqzhang/wechat_work_webhook_rb"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency('httparty')
end
