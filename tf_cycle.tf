locals {
  service_account_list = {
  "base-enrichment": [
      "roles/pubsub.editor"
    ],
    "sniffer": [
      "roles/pubsub.editor"
    ],
    "ip-investigator": [
      "roles/pubsub.editor"
    ],
    "network-scoring": [
      "roles/pubsub.editor"
    ],
    "reader": [
      "roles/pubsub.editor"
    ],
    "persist-keyvalue": [
      "roles/pubsub.admin"
    ]
  }
}

output "debug" {
  value = [ for user, roles in local.service_account_list:
            [ for role in roles:
                { "user" = user
                  "role" = role
                }
            ]
          ]
}
