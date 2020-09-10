class BizPlansController < ApplicationController
    
    get '/biz_plans' do
        redirect_if_not_logged_in? 
        @biz_plans = BizPlan.all
        erb :'biz_plans/index'
    end
    
    get '/biz_plans/new' do
        redirect_if_not_logged_in? 
        erb :'biz_plans/new'
    end

    post '/biz_plans' do
        redirect_if_not_logged_in? 
        @biz_plan = current_user.biz_plans.build(params)
        if @biz_plan.save
            redirect '/biz_plans'
        else
            erb :'biz_plans/new'
        end
    end

    get "/biz_plans/:id/edit" do
        redirect_if_not_logged_in? 
        get_biz_plan
        if @biz_plan.user == current_user
            erb :'biz_plans/edit'
        else
            redirect 'biz_plans'
        end
    end
    
    patch '/biz_plans/:id' do
        redirect_if_not_logged_in? 
        get_biz_plan
        if @biz_plan.user == current_user # authorization check
            if @biz_plan.update(name: params[:name], mission: params[:mission], budget: params[:budget]) # model validation check
                redirect '/biz_plans'
            else
                erb :'biz_plans/edit'
            end
        else
            redirect '/biz_plans'
        end
    end

    get '/biz_plans/:id' do
        redirect_if_not_logged_in? 
        @biz_plan = BizPlan.find_by_id(params[:id])
        erb :'biz_plans/show'
    end
    

    delete '/biz_plans/:id' do
        redirect_if_not_logged_in?
        get_biz_plan
        if @biz_plan.user == current_user
            @biz_plan.delete
        end
        redirect to '/biz_plans'
    end

    private
    
    def get_biz_plan
        @biz_plan = BizPlan.find_by_id(params[:id])
    end
end
 