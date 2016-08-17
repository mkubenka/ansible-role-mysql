# https://medium.com/brigade-engineering/reduce-chef-infrastructure-integration-test-times-by-75-with-test-kitchen-and-docker-bf638ab95a0a#.qcnmutao9

require 'kitchen/driver/docker'

module Kitchen
  module Driver
    class Docker < Kitchen::Driver::SSHBase
      def rm_container(state)
        container_id = state[:container_id]
        if defined? instance.provisioner[:attributes][:systemd]
            docker_command("exec #{container_id} shutdown now")
            docker_command("wait #{container_id}") # Wait for shutdown
            docker_command("rm #{container_id}")
        else
            docker_command("stop -t 0 #{container_id}")
            docker_command("rm #{container_id}")
        end
      end
    end
  end
end
