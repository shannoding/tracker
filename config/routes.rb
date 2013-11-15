Abtt::Application.routes.draw do
  resources :accounts do
    collection do
      get 'confirm_paid'
      get 'events'
      get 'list'
      get 'unpaid'
      get 'unpaid_print'
      get 'view'
    end
  end

  resources :attachments, only: [:destroy, :index]

  resources :comments, only: [:create, :destroy]

  resources :email, only: [:view] do
    collection do
      get 'file'
      get 'list'
      get 'mark_status'
      get 'new_thread'
      get 'pull_email'
      get 'reply_to'
      get 'send_email'
      get 'unfile'
    end
    member do
      get 'view'
    end
  end

  resources :email_forms, except: [:index] do
    collection do
      get 'list'
    end
  end

  resources :equipment, only: [] do
    collection do
      get 'delgroup'
      get 'delitem'
      get 'editgroup'
      get 'edititem'
      get 'newgroup'
      get 'newitem'
      get 'savegroup'
      get 'saveitem'
      get 'tree'
      get 'treesave'
      get 'usage'
    end
  end

  resources :events do
    member do
      get 'delete_conf'
      get 'mobile_email'
    end
    collection do
      get 'delete_conf'
      get 'calendar'
      get 'iphone'
      get 'mobile'
      get 'lost'
    end
  end

  resources :heartbeat, only: [:index]

  resources :invoice, only: [:create, :edit, :new] do
    collection do
      get 'email'
      get 'email_confirm'
      get 'list'
      get 'prettyView'
      get 'view'
    end
  end  

  resources :invoice_items, except: [:show] do
    collection do
      get 'list'
    end
  end

  resources :journal, except: [:show, :update] do
    collection do
      get 'list'
    end
    member do
      post 'save'
      get 'view'
    end
  end

  resources :locations

  resources :member_filter, only: [:edit, :new, :save]

  resources :members do
    collection do
      get 'edit_self'
      get 'settings'
    end
  end

  resources :organizations

  resources :permissions

  resources :roles

  resources :timecards do
    member do
      get 'view'
    end
  end

  resources :timecard_entries, except: :show

  resources :tshirts, only: :index

  resources :version, only: :show

  post 'login' => 'useraccount#login'
  get 'logout' => 'useraccount#logout'
  get 'useraccount/access_denied'

  get 'calendar/generate.:format' => 'events#generate'
  get 'calendar' => 'events#calendar'
  get 'mobile' => 'events#mobile'
  get 'iphone' => 'events#iphone'
  get 'i' => 'events#iphone'
  post 'invoice/email/:id' => 'invoice#email'

  root to: 'events#index'
end
