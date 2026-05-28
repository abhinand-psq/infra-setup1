resource "local_file" "ansible_inventory" {
  filename = "../ansible/inventory.ini"

  content = <<EOF
[k8s_master]
${aws_instance.custom_servers["master_node"].public_ip} ansible_user=ubuntu

[k8s_workers]
${aws_instance.custom_servers["work_node_1"].public_ip} ansible_user=ubuntu
${aws_instance.custom_servers["work_node_2"].public_ip} ansible_user=ubuntu
EOF
}
