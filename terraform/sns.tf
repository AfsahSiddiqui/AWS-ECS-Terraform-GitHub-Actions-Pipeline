resource "aws_sns_topic" "ecs_alerts" {
  name = "ecs-alerts-topic"
}

resource "aws_sns_topic_subscription" "email_sub" {
  topic_arn = aws_sns_topic.ecs_alerts.arn
  protocol  = "email"
  endpoint  = var.email_address
}

