data "aws_route53_zone" "grabtable_net" {
  name = "grabtable.net"
}

resource "aws_route53_record" "api_grabtable_net" {
  zone_id = data.aws_route53_zone.grabtable_net.zone_id
  name    = "api.grabtable.net"
  type    = "CNAME"
  ttl     = 172800
  records = [
    aws_lb.terraform_lb.dns_name
  ]
}