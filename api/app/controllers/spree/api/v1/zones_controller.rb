module Spree
  module Api
    module V1
      class ZonesController < Spree::Api::V1::BaseController
        def index
          @zones = Zone.order('name ASC')
        end

        def show
          @zone = Zone.find(params[:id])
        end

        def new
        end

        def create
          authorize! :create, Zone
          @zone = Zone.new(params[:zone])
          if @zone.save
            render :show, :status => 201
          else
            invalid_resource!(@zone)
          end
        end

        def update
          authorize! :update, Zone
          zone = Spree::Zone.find(params[:id])
          if @zone.update_attributes(params[:zone])
            render :show, :status => 200
          else
            invalid_resource!(@zone)
          end
        end
        
        def add_country
          authorize! :update, Zone
          @zone = Spree::Zone.find(params[:id])
          @member = Spree::Country.find(params[:country_id])
          if @zone.members << @member
             render :show, :status => 200
          else
            invalid_resource!(@member)
          end
        end
        
      end
    end
  end
end
