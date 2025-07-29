resource "aws_cloudwatch_metric_alarm" "ecs_high_cpu" {
  alarm_name          = "ecs-high-cpu"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/ECS"
  period              = 60
  statistic           = "Average"
  threshold           = 0.8

  dimensions = {
    ClusterName = aws_ecs_cluster.main.name
    ServiceName = aws_ecs_service.app.name
  }

  alarm_description = "Triggers if ECS CPU usage is over 80% for 2 minutes"
  alarm_actions     = [aws_sns_topic.ecs_alerts.arn]
}


resource "aws_cloudwatch_metric_alarm" "container_restarts" {
  alarm_name          = "ecs-container-restarts"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "ContainerRestartCount"
  namespace           = "ECS/ContainerInsights"
  period              = 60
  statistic           = "Sum"
  threshold           = 1

  treat_missing_data = "notBreaching"

  dimensions = {
    ClusterName = aws_ecs_cluster.main.name
    ServiceName = aws_ecs_service.app.name
  }

  alarm_description = "Triggers when a container restarts"
  alarm_actions     = [aws_sns_topic.ecs_alerts.arn]
}


resource "aws_cloudwatch_metric_alarm" "health_check_failures" {
  alarm_name          = "ecs-health-check-failure"
  comparison_operator = "LessThanThreshold"
  evaluation_periods  = 1
  metric_name         = "HealthCheckStatus"
  namespace           = "ECS/ContainerInsights"
  period              = 60
  statistic           = "Average"
  threshold           = 0.5

  dimensions = {
    ClusterName = aws_ecs_cluster.main.name
    ServiceName = aws_ecs_service.app.name
  }

  treat_missing_data = "notBreaching"

  alarm_description = "Triggers if health check status average is below 50%"
  alarm_actions     = [aws_sns_topic.ecs_alerts.arn]
}
