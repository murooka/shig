require 'router'

module Shig
  class Web
    module Dispatcher

      attr_accessor :router
      attr_accessor :base_module_path

      def _router
        self.router ||= Router.new
      end

      def connect(path, dest)
        self._router.add(path, dest)
      end

      def base(module_path)
        self.base_module_path = module_path
      end

      def dispatch(c)
        path = c.req.path_info
        dest = self._router.match(path)
        if dest
          klass = Module.const_get("#{self.base_module_path}::#{dest}")
          klass.call(c)
        else
          nil
        end
      end

    end
  end
end
