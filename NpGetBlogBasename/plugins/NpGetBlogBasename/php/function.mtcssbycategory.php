<?php
    function smarty_function_mtcssbycategory($args, &$ctx) {
        $entry = $ctx->stash('entry');
        if (!$entry) {
             return $ctx->error('You used an MTCSSByCategory tag outside of the proper context.');
        }

        $cat = $entry->category();
        if (!$cat) {
            return;
        }

        while (1) {
            if ($cat->parent == 0) {
                $basenames[] = $cat->basename;
                break;
            }
            $basenames[] = $cat->basename;
            $loaded = $cat->Load("category_id = " . $cat->parent);
        }

        $cat_tmp = 'cat-' . join ('-', array_reverse($basenames));
        $cat_tmp .= '/screen.css';

        $mt = MT::get_instance();
        $css_dir = $mt->config('StaticWebPath') or '/mt-static/';
        if (!ereg('\/$', $css_dir)) {
            $css_dir .= '/';
        }
        $css_dir .= 'support/css/';

        return '<link rel="stylesheet" href="' . $css_dir . $cat_tmp . '" type="text/css" />';
    }
?>
