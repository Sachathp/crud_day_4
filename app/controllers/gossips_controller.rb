
class GossipsController < ApplicationController
  def new
    @gossip = Gossip.new
  end


  def create
    @gossip = Gossip.new(title: params[:title], content: params[:content], user: User.first)
    p "#"*50
    p "la aussi tout va bien"

    if @gossip.save
      redirect_to root_path, notice: "The super potin was successfully saved!"
      p "#"*50
      p "sur le if RAS"
    else
      render new_gossip_path
    end
  end

  def show
    @gossip = Gossip.find(params[:id])
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(title: params[:gossip][:title], content: params[:gossip][:content])
      redirect_to @gossip
    else
      render :edit
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to gossips_path
  end
end
