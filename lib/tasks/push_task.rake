namespace :push_task do
  desc "LINEBOT：タスクの通知"
    task :push_line_message_task => :environment do
        client = Line::Bot::Client.new { |config|
            config.channel_secret = ENV["LINE_CHANNEL_SECRET"]
            config.channel_token = ENV["LINE_CHANNEL_TOKEN"]
        }

        # byebug
        # Notificationのdue_dateに入っている時間が本日のものをとりだす
        # limit_tasks = Notification.where(due_date: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day)

        # 現在の時刻を取り出し、直前の00分、15分、30分、45分のいずれかの時刻に変更してcurrent_timeに格納
        current_time = Time.zone.now
        current_time = current_time.change(min: (current_time.min / 15).floor * 15)

        # ユーザーが登録した通知日時が、current_timeのものをlimit_taskに格納
        limit_tasks = Notification.where(due_date: current_time)

        # limit_tasks=タスク実行時間と同じ場合は、下記のeachの処理を実行？
        limit_tasks.each do |t|
            message = {
                type: 'text',
                text: "今日は「#{t.task}」の日です！"
            }
            response = client.push_message(t.user_uid, message)
            p response
        end
    end
end
