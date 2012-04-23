module BigML
  class Client
    module Source
      def get_sources(options = {})
        response = get("/source", options)
        response['objects'].map { |source| BigML::Source.new(source) } if response.success?
      end

      def get_source(id, options = {})
        response = get("/source/#{id}", options)
        BigML::Source.new(response) if response.success?
      end

      def update_source(id, options = {})
        put("/source/#{id}", options)
      end

      def create_source(file, options ={})
        response = post("/source", options.merge(:multipart => true, :file => File.new(file)))
        BigML::Source.new(response) if response.success?
      end

      def find_sources(options = {})
        response = get("/source", options)
        response['objects'].map { |source| BigML::Source.new(response) } if response.success?
      end

      def delete_source(id)
        response = delete("/source/#{id}")
        response.success?
      end
    end
  end
end
