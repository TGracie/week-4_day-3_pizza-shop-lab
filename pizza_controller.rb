require( 'sinatra' )
require( 'sinatra/contrib/all' )
require( 'pry-byebug' )
require_relative( './models/pizza_order' )
also_reload( './models/*' )

# #RESTful routing

  ## INDEX ROUTE
  get('/pizza-orders') do
    @pizzas = PizzaOrder.all()
    erb(:index)
  end

  ## NEW ROUTE ##
  get('/pizza-orders/new') do
    erb(:new)
  end

  ## SHOW ##   ## specific pizza order ##
  get('/pizza-orders/:id') do
    id = params[:id].to_i #everything in params is a string so needs an   integer
    @pizza = PizzaOrder.find(id)
    erb(:show)
  end

  ## CREATE ##
  post('/pizza-orders') do
    @pizza = PizzaOrder.new(params)
    @pizza.save
    erb(:create)

  end
