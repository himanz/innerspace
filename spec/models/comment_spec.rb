require 'spec_helper'
# require 'acts_as_votable'

module Commontator
  describe Comment do
    before do
      setup_model_spec
      @comment = Comment.new
      @comment.thread = @thread
      @comment.creator = @user
      @comment.body = 'Something'
    end
    
    # it 'must be votable if acts_as_votable is installed' do
    #   Comment.must_respond_to(:acts_as_votable)
    #   @comment.is_votable?.must_equal true
    #   @comment.acts_as_votable_initialized.must_equal true
    # end
    
    it 'must know if it has been modified' do
      @comment.save!
      
      expect(@comment.is_modified?).to be false
      
      @comment.body = 'Something else'
      @comment.editor = @user
      @comment.save!
      
      expect(@comment.is_modified?).to be true
    end
    
    it 'must know if it has been deleted' do
      user = create(:default_user)
      
      expect(@comment.is_deleted?).to be false
      expect(@comment.editor).to be nil
      
      @comment.delete_by(user)
      
      expect(@comment.is_deleted?).to be true
      expect(@comment.editor).to eq user
      
      @comment.undelete_by(user)
      
      expect(@comment.is_deleted?).to be false
    end

    it 'must make proper timestamps' do
      @comment.save!

      expect(@comment.created_timestamp).to eq I18n.t('commontator.comment.status.created_at',
                                                   :created_at => I18n.l(@comment.created_at,
                                                                         :format => :commontator))
      expect(@comment.updated_timestamp).to eq I18n.t('commontator.comment.status.updated_at',
                                                   :editor_name => "Anonymous",
                                                   :updated_at => I18n.l(@comment.updated_at,
                                                                         :format => :commontator))

      user2 = create(:admin_user)
      @comment.body = 'Something else'
      @comment.editor = user2
      @comment.save!

      expect(@comment.created_timestamp).to eq I18n.t('commontator.comment.status.created_at',
                                                   :created_at => I18n.l(@comment.created_at,
                                                                         :format => :commontator))
      expect(@comment.updated_timestamp).to eq I18n.t('commontator.comment.status.updated_at',
                                                   :editor_name => "Anonymous",
                                                   :updated_at => I18n.l(@comment.updated_at,
                                                                         :format => :commontator))
    end
  end
end

