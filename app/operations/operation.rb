class Operation
  attr_accessor :params, :request_obj

  def initialize(params)
    @params = params
  end

  def execute
    process
  end

  private
  def process
    raise NotImplementedError
  end
end
