# https://work.weixin.qq.com/api/doc/90000/90136/91770
require 'httparty'
require 'base64'
require 'digest/md5'

class WechatWorkWebhook
  VERSION = "0.1.0"
  class Error < StandardError; end

  def initialize(webhook_url)
    @webhook_url = webhook_url
  end

  def text(text, mentioned_list = [], mentioned_mobile_list = [])
    data = {
        "msgtype" => "text",
        "text" => {
            "content" => text,
            "mentioned_list" => mentioned_list,
            "mentioned_mobile_list" => mentioned_mobile_list
        }
    }
    HTTParty.post(@webhook_url, body: data.to_json).parsed_response
  end

  def markdown(markdown)
    data = {
        "msgtype" => "markdown",
        "markdown" => {
            "content" => markdown
        }
    }
    HTTParty.post(@webhook_url, body: data.to_json).parsed_response
  end

  def news(articles)
    data = {
        "msgtype" => "news",
        "news" => {
            "articles" => articles
        }
    }
    HTTParty.post(@webhook_url, body: data.to_json).parsed_response
  end

  def image(image_path)
    image_base64 = Base64.strict_encode64(File.read(image_path))
    image_md5 = Digest::MD5.hexdigest(File.read(image_path))

    data = {
        "msgtype": "image",
        "image": {
            "base64": image_base64,
            "md5": image_md5
        }
    }
    HTTParty.post(@webhook_url, body: data.to_json).parsed_response
  end

  def media(media_id)
    data = {
        "msgtype" => "file",
        "file" => {
            "media_id" => media_id
        }
    }
    HTTParty.post(@webhook_url, body: data.to_json).parsed_response
  end

  def upload_media(file_path)
    upload_url = @webhook_url.sub('send', 'upload_media') + '&type=file'
    HTTParty.post(upload_url, body: { media: File.open(file_path)}).parsed_response
  end

  def file(file_path)
    media_id = upload_media(file_path)['media_id']
    media(media_id)
  end
end
