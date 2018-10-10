class StocksController < ApplicationController
  
  def search
   if params[:stock].present?
     @stock = Stock.new_form_lookup[:stock]
     if @stock
       respond_to do |format|
         format.js { render partial: 'users/result'}
       end 
     else
       flash[:danger] = "You entered an incorretc symbol"
       render partial: 'users/result'
     end 
   else
     flash[:danger] = "you have entered empty search string"
     render partial: 'users/result'
   end 
  end 
end 
