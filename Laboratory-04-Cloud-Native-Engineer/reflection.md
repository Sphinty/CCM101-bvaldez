# Mission  Reflection

Deploying the Nginx container was honestly a completely different experience than
setting up a VM. When you install an OS on a virtual machine, the hypervisor has to
boot a whole guest operating system before anything can even run, which takes a few
minutes at least. My Nginx container was up and answering requests in seconds, because
it just borrows the host machine's kernel instead of booting its own. That gap is
basically the whole pitch for containers if you're trying to move fast.

The port mapping part (`-p 8080:80`) confused me a little at first, but it makes sense:
Nginx inside the container is listening on port 80, and there's no direct line into the
container from outside unless you build one. Mapping host port 8080 to container port 80
is that line: anything sent to `localhost:8080` on my machine gets forwarded into the
container's port 80. Skip that step and the web server is running, but nobody can reach it.

Running `docker rm my-nginx` wiped the container and everything inside it. Containers
aren't meant to hold onto data past their own lifespan unless you've mounted a volume
outside the container itself. That's not a minor detail either — if this were a real
database instead of a static Nginx page, deleting the container would mean losing the
data too.

I think containerization changes the developer/ops relationship mostly by getting rid
of the "works on my machine" excuse. If the app and its dependencies are all packaged
into one image, what a developer tests locally is what actually ships. That's a big
part of what people mean by DevOps: the same image moves from a laptop to staging to
production without anyone re-explaining the environment.

As for my portfolio, it's turning into something more than a folder of homework.
Starting from the basic cloud concepts lab through the infrastructure blueprint and the
multi-cloud comparison, and now this one, each folder has the commands and the
reasoning behind them. That's the part I'd actually want to show someone if I were
applying for a job.
