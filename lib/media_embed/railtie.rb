module MediaEmbed
  class Railtie < Rails::Railtie
    initializer "media_embed.handler" do
      ActiveSupport.on_load(:action_view) do
        include MediaEmbed::Handler
      end
    end
  end
end

