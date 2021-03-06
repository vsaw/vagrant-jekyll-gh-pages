This will bootstrap a small ubuntu server running [Jekyll](http://jekyllrb.com/) configured by the [guidelines of GitHub Pages](https://help.github.com/articles/using-jekyll-with-pages/).

The **Requirements** are only [Vagrant](https://www.vagrantup.com/). The rest will be automatically retrieved and installed by the script.

# Getting Started
1. Clone the repository with `git clone git@github.com:vsaw/vagrant-jekyll-gh-pages.git`
2. Go inside the cloned project `cd vagrant-jekyll-gh-pages`
3. Start Vagrant `vagrant up`

That's it you're done and can immediately visit your page at [http://127.0.0.1:4000/](http://127.0.0.1:4000/)

# Advanced Administration
Jekyll ist installed as a normal ubuntu service. You can control it directly using

```bash
# SSH into the vagrant container
$ vagrant ssh

# Control the service inside vagrant
$ sudo service jekyll (start|stop|restart|status)
```

# License
See [LICENSE](https://github.com/vsaw/vagrant-jekyll-gh-pages/blob/master/LICENSE)
