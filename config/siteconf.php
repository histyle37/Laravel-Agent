<?php

return [

    'photo' => [
        'valid_extentions' => ['jpg', 'jpeg', 'png', 'gif', 'svg', 'webp'],
        'filename_length' => 2,
        'dimensions' => [
            'screen' => 800,
            'screen_watermark' => 800,
            'thumbnail' => 200,
            'large_thumbnail' => 400
        ]
    ],

    //resource_path('views'),
    // 'compiled' => realpath(storage_path('framework/views')),

];
