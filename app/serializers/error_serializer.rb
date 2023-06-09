class ErrorSerializer
	attr_reader :status

	def initialize(object)
		@object = object
		@status = status
	end


	def error
		{
		 	message: "your query could not be completed",
			errors: [
					{
			 			status: status.to_s,
						title: @object.message
					}
				]
			}
	end

  def status
    return 404 if @object.class == ActiveRecord::RecordNotFound
    400
  end
end