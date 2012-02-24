
require 'bundler/setup'
require 'eventmachine'

module EchoServer
  def receive_data(data)
    send_data ">>> You sent: #{data}"
    close_connection if data =~ /quit|exit/i
  end
end

EventMachine::run {
  EventMachine::start_server "127.0.0.1", 8081, EchoServer
}
