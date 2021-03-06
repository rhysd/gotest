#!/usr/bin/env ruby

GREEN='[92m'
RED='[91m'
YELLOW='[93m'
GRAY='[90m'
BOLD='[1m'
RESET='[0m'

abort 'This script must be run from root of repository' unless Dir.exist? '.git'

def check_run(out, f)
  abort "#{f}: fail because bold text is not rendered:\n#{out}" unless out.include? "#{BOLD}=== RUN "
end
def check_skip(out, f)
  abort "#{f}: fail because yellow text is not rendered:\n#{out}" unless out.include? "#{YELLOW}--- SKIP: "
end
def check_pass(out, f)
  abort "#{f}: fail because green text is not rendered:\n#{out}" unless out.include? "#{GREEN}--- PASS: "
end
def check_fail(out, f)
  abort "#{f}: fail because red text is not rendered:\n#{out}" unless out.include? "#{RED}--- FAIL: "
end
def check_result(out, f, text)
  abort "#{f}: fail because result is not rendered:\n#{out}" unless out.include? "#{BOLD}#{text}#{RESET}"
end

f = 'pass_test.go'
out = `./gotest ./test/smoke/#{f}`
abort "#{f}: fail due to non-zero exit status: #{$?}" unless $?.success?

check_run(out, f)
check_skip(out, f)
check_pass(out, f)
check_result(out, f, "#{GREEN}PASS")

f = 'fail_test.go'
out = `./gotest ./test/smoke/#{f}`
abort "#{f}: fail due to non-zero exit status: #{$?}" if $?.success?
check_run(out, f)
check_skip(out, f)
check_pass(out, f)
check_fail(out, f)

check_result(out, f, "#{RED}FAIL")

puts 'OK'
