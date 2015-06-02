class RegistrationsController < Devise::RegistrationsController

  protected

  def update_resource(resource, params)
    logger.info(params.inspect)
    params.delete(:password)
    logger.info(params.inspect)
    resource.update_without_password(params)
  end
end