---
title: Making a Bog Website
date: 2025-02-17
draft: false
tags:
  - blog
lastmod: 2025-02-18T04:57:00.192Z
---
## Intro

The idea here is to create a blog based personal website that doesn't cost anything but a bit of time and elbow grease.

This is the tech stack I'll be using:

* [Hugo](https://gohugo.io/) - A static website generator.
* [GitHub Pages](https://pages.github.com/) - Hosts the static website for free.
* [Obsidian](https://obsidian.md/) - A note taking application used to create the blog posts and adds the Markdown for formatting.
* [Dropbox](https://dropbox.com) - I'm using cloud storage to keep things backed up.

This solution could cost money if I want a custom domain name or need additional cloud storage,  but a decent site can be created gratis.

The basic idea for this blog setup came from a tutorial by [NetworkChuck](https://youtu.be/dnE7c0ELEH8?si=r46KP3Ydwdom2U1z). I'm only giving a general overview here, so check it out for more details.

## Setup

### File Location

In Dropbox I created a folder called `Website` where I will store all my files and they can live quite happily in the cloud.

### Generate Hugo Site

Inside that folder I generated my Hugo site using

```bash
hugo new site {nameofmysite}
```

Of course replacing `{nameofmysite}` with the name of YOUR site.

### Hugo Needs a Theme

Inside your newly created Hugo project, do a `git init` to initiate a Git repository. Then find yourself a [Hugo Theme](https://themes.gohugo.io/).

Follow the installation directions associated with your chosen theme. Be aware that older themes may have issues with newer versions of Hugo.

I'm using the [Terminal](https://themes.gohugo.io/themes/hugo-theme-terminal/) theme, which can be installed using `git submodule`.

```bash
git submodule add -f https://github.com/panr/hugo-theme-terminal.git themes/terminal
```

Now I open my site folder in my code editor and update the `hugo.toml` file with the configuration recommended by the theme documentation.

### Testing

To make sure the site is working we run the Hugo server, remembering to specify our chosen theme.

```bash
hugo server -t terminal
```

Which results in

```
ERROR deprecated: site config key paginate was deprecated in Hugo v0.128.0 and subsequently removed. Use pagination.pagerSize instead.
```

Remember what I said earlier about Hugo versions and themes? Even though the Terminal theme was updated just a few months ago, they still managed to slip in some breaking changes.

At least the error message is helpful. All I have to do is go into `hugo.tomal` and replace `paginate` with `pagination.pagerSize`, rerun the server, and I'm good as gold!

In your browser, navigate to `localhost:1313` and voila!\
![Screenshot\_2025-02-17\_19-49-54.png](/home/jacquesvb/Dropbox/Website/jacques-blog/static/attachments/Screenshot_2025-02-17_19-49-54.png)

### Posts

Now we want to be able to write our posts in Obsidian and then migrate them over to Hugo where it can be turned into a static website and sent to GitHub Pages.

In your Hugo code, create a posts directory under the content directory.

```
jacques-blog
		|
		content
			|
			posts	
```

### Obsidian

Now we need to configure Obsidian so we can use it as a blogging platform. This is easy to do because Obsidian allows you to create custom vaults which can pretty much exist anywhere.

First thing we need to do is create a new vault in the same folder as the Hugo project.
