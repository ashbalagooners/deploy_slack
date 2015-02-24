module Rack
  module Bug
    class SQLPanel

      class Query
        include Rack::Bug::FilteredBacktrace

        attr_reader :sql
        attr_reader :time

        def initialize(sql, time, backtrace = [])
          @sql = sql
          @time = time
          @backtrace = backtrace
        end

        def human_time
          "%.2fms" % (@time * 1_000)
        end

        def inspectable?
          sql.strip =~ /^SELECT /i
        end

        def with_profiling
          self.class.execute("SET PROFILING=1")
          result = yield
          self.class.execute("SET PROFILING=0")
          return result
        end

        def explain
          self.class.execute "EXPLAIN #{@sql}"
        end

        def profile
          with_profiling do
            execute
            self.class.execute <<-SQL
              SELECT *
                FROM information_schema.profiling
               WHERE query_id = (SELECT query_id FROM information_schema.profiling ORDER BY query_id DESC LIMIT 1)
            SQL
          end
        end

        def execute
          self.class.execute(@sql)
        end

        def valid_hash?(secret_key, possible_hash)
          hash = Digest::SHA1.hexdigest [secret_key, @sql].join(":")
          possible_hash == hash
        end

        def self.execute(sql)
          ActiveRecord::Base.connection.execute(sql)
        end
      end

    end
  end
end
