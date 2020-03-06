class ChecklistItemsController < ApplicationController
    # before_action :authenticate, only:[:create]
    def index 
        @checklist_item = ChecklistItem.all
        render json: {checklist_item: @checklist_item}, include: :user
    end
    def show 
        @checklist_item = ChecklistItem.find(params[:id])
        render json:{checklist_item: @checklist_item}
    end
    def create 
        @checklist_item = ChecklistItem.create(
            item: params[:item],
            user_id: params[:user_id]
        )
        render json: {checklist_item: @checklist_item}
    end
    def update
        if @checklist_item.update(params[:id])
          render json: @checklist_item
        else
          render json: @checklist_item.errors, status: :unprocessable_entity
        end
      end
    
      def destroy
        @checklist_item = ChecklistItem.find(params[:id])
        @checklist_item.destroy
        render status: 200
      end
end
