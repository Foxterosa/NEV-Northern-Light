//for style
#define MAX_HUMAN_STYLE 10
#define MIN_HUMAN_STYLE -10
#define STYLE_MODIFIER 0.20

//for desires
#define TASTE_SOUR "bebida agria"
#define TASTE_BITTER "bebida amarga"
#define TASTE_SWEET "bebida dulce"
#define TASTE_STRONG "bebida fuerte"
#define TASTE_LIGHT	"bebida suave"
#define TASTE_BUBBLY "bebida con gas"
#define TASTE_SPICY "bebida picante"
#define TASTE_SALTY "bebida salada"
#define TASTE_SLIMEY "bebida cremosa"
#define TASTE_REFRESHING "bebida cremosa"
#define TASTE_DRY "bebida seca"
var/global/list/all_taste_drinks = list(TASTE_SOUR,
								 TASTE_BITTER,
								 TASTE_SWEET,
								 TASTE_STRONG,
								 TASTE_LIGHT,
								 TASTE_BUBBLY,
								 TASTE_SPICY,
								 TASTE_SALTY,
								 TASTE_SLIMEY, //for dense,creamy, solid stuff
								 TASTE_REFRESHING,
								 TASTE_DRY) //for stuff like martinis

#define SWEET_FOOD "comida dulce"
#define MEAT_FOOD "comida carnivora"
#define COCO_FOOD "chocolate"
#define	VEGAN_FOOD "comida vegana"
#define	VEGETARIAN_FOOD "comida vegetariana"
#define	CHEESE_FOOD "queso"
#define	INSECTS_FOOD "insectos"
#define	BLAND_FOOD "comida blanda"
#define SALTY_FOOD "comida salada"
#define SPICY_FOOD "comida picante"
#define FLOURY_FOOD "productos horneados"
#define UMAMI_FOOD "comida umami"

var/global/list/all_types_food = list(SWEET_FOOD,
									MEAT_FOOD,
									COCO_FOOD,
									VEGAN_FOOD,
									VEGETARIAN_FOOD,
									CHEESE_FOOD,
									SALTY_FOOD,
									SPICY_FOOD, // more about well spiced not necessarely HOT spicy
									FLOURY_FOOD, //baked goods
									UMAMI_FOOD, //mostly for shrroms but also some fried and other small foods
									BLAND_FOOD)
