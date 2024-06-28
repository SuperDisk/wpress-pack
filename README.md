# wpress-pack

This is a mega-simple tool to create .wpress archive files compatible with the [All-in-One WP Migration and Backup](https://wordpress.org/plugins/all-in-one-wp-migration/) tool. I guess it's kind of a niche use-case, but I recently had to migrate a site where one of the mu-plugins was causing a crash on the new host, and since I couldn't just remove it on the old one, I had to create the archive, unpack it, remove the plugin manually, repack, and then import that. So maybe this will come in handy for you.

If you need to extract a .wpress archive, use [Felix Haus' tool.](https://github.com/ofhouse/wpress-extract)

# Usage

```sh
./wpack <input-dir> <output>.wpress
```
