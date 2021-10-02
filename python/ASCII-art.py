
# ------------------------------------------------
#
#   DINOSAY
#       https://github.com/MatteoGuadrini/dinosay
#
# ------------------------------------------------

from dinosay import dinoprint, DINO_TYPE
dinoprint(message="Hello world! I'm a corythosaur.", body=DINO_TYPE['corythosaur'], behavior="dead")


dinoprint('I\'m a nerd', DINO_TYPE['triceratops'], behavior='joking')
dinoprint('I\'m a nerd', DINO_TYPE['triceratops'], behavior='nerd')



from dinosay import dinoprint, DINO_ALIAS
dinoprint('I\'m a nerd', DINO_ALIAS['trex'], behavior='dead')


DINO_ALIAS.keys()





# ------------------------------------------------
#
#   cowpy
#       https://github.com/jeffbuttars/cowpy
#
# ------------------------------------------------

from cowpy import cow

print(cow.Moose().milk("wahahahha"))
print(cow.Moose(eyes='dead', tongue=True).milk("wahahahha"))
print(cow.Moose(eyes='dead', tongue=True, thoughts=True).milk("wahahahha"))

print(cow.milk_random_cow("agadkjfasldkj"))


# list options
print(cow.cow_options())
print(cow.eye_options())





# ------------------------------------------------
#
#   pyFiglet
#       https://github.com/pwaller/pyfiglet
#       fonts: http://www.figlet.org/examples.html
#
# ------------------------------------------------

from pyfiglet import Figlet

f = Figlet(font='slant')
print( f.renderText("asdkjaldkja")

print( Figlet(font="big").renderText("asdkjaldkja"))






