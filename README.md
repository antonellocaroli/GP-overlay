# GP-overlay
GentooPlayer overlay

Preparing Overlays (Layman >=2.3.0)
-----------------------------------

First, make sure you have Layman 2.3.0 or greater, if not 

    # echo ">=app-portage/layman-2.3.0" >> /etc/portage/package.accept_keywords

Now, install Layman (checking that the `git` USE flag is enabled):

    emerge --ask layman

Add my `repositories.xml` file to Layman with `nano -w /etc/layman/layman.cfg`:

    #  original unsigned lists and definitions
    #  one url per line, indented

    overlays  :
        https://api.gentoo.org/overlays/repositories.xml
        https://raw.githubusercontent.com/antonellocaroli/GP-overlay/master/repositories.xml

Update the cached remote list(s):

    layman --fetch

Fetching Overlays (Layman)
--------------------------

Add the generic GP-overlay overlay:

    layman --add antonellocaroli

In the future, to update all overlays, use:

    layman -s antonellocaroli

or
    
    layman --sync-all
