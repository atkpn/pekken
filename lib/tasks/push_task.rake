namespace :push_task do
  desc "LINEBOT：タスクの通知" 
    task :push_line_message_task => :environment do
        client = Line::Bot::Client.new { |config|
            config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
            config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
        }

        limit_tasks = Notification.where(due_date: Date.today)
        limit_tasks.each do |t|
            message = {
                type: 'text',
                text: "今日は「#{t.task}」の日です"
            }
            response = client.push_message(t.user_uid, message)
            p response
        end
    end
end
