module Warder
  # responsible for aruba cli app test integration
  class ArubaApp
    def initialize(argv, stdin = STDIN, stdout = STDOUT,
                   stderr = STDERR, kernel = Kernel)
      @stdin = stdin
      @stdout = stdout
      @stderr = stderr
      @kernel = kernel
      argv
    end

    def execute!
      @kernel.exit execute || 0
    end

    def execute
    end
  end
end
