# SEcret

This is a Sleeper PC build project.

The idea is to reuse the case from a Macintosh SE to house a Mini-ITX
computer

## Specs

No concrete final specs yet (depends when I finish it) but I'm
designing it to fit the following:
1. Mini-ITX motherboard
2. iPad replacement screen with HDMI/DisplayPort controller board
3. Small form factor GPU
4. Standard PSU
5. Cooling

The goal is to build a computer that does not require destructive
modifications to the original case - I don't intend to reuse it, as it
was a non-functional donor machine to restore another one, but I
cannot bring myself to damage it.

## Risks

To say that the portable Macintosh line from the 80s has poor airflow
is an understatement. I am not skilled in modelling this to be able to
quantify how bad it will be, but I think it will be pretty bad. For
this reason the CPU and GPU will have to be water cooled. This is so
that I can force the exhaust straight out of the case afterwards. The
small fan at the rear will be used as an intake, and there will be a
radiator ant the bottom with ducting to force the hot air straight
out.

The plan is to make the parts 3D printable. Given the potentially high
temperatures inside, I do not fully trust the parts to not sag, so
will also be designing them with metal fabrication in mind. Most of
the parts should be able to be laser cut from aluminium, with only a
few parts needing to be machined or printed - I am trying to design
them so that, while they will be structural, they shouldn't be as
affected by sagging.

I do not know how long this project will take. It will depend on how
quickly I can prototype it, and how badly I suck at CAD - it is
definitely not one of my strengths.

## Status

At this point, I have created 4 pieces:
1. Display mount - this holds the iPad screen in place of the CRT
2. Motherboard mount - this screws to the display mount and... holds
   the motherboard
3. Side panel - this is almost a duplicate of the motherboard mount,
   but just sits opposite, for rigidity, and will eventually mount the
   single intake fan.
4. Tie bracket - This sits between the side panel and motherboard
   mount, and ties them back into the display mount, hopefully
   providing additional rigidity.
   
Additionally, there is a 'bracket' which is a little generic
connecting piece that is required for if the parts are made from sheet
metal.

> NOTE: The metal fabrication designs are not in any way even close to
> ready yet. The bracket and flat pieces need screw holes to connect
> them together, and all screw holes need resizing to accommodate
> tapping, rather than heat inserts. This is planned, but until I have
> verified that the parts fit with 3D printing, I'm not worrying about
> this at all.

## TODO

The main part of the build should be ready to test print now. So I
need to do that, and confirm that it fits with the screen, and with a
mini-ITX motherboard, and fits in the case. After that the following
things, in no particular order:

* Add bracket for display controller board
* Add mounting for GPU
* Add bracket for PSU and cabling (probably needs extension cable to
  the original socket)
* Add bracket for radiator
* Add ducting
* Add output port bracketry
