<?php

namespace App\Http\Middleware;
use Closure;

class HTTPSConnection {

    public function handle($request, Closure $next)

    {
            // if($gs->is_secure == 1) {
            //     if (!$request->secure()) {

            //         return redirect()->secure($request->getRequestUri());
            //     }
            // }
            return $next($request);

    }

}



?>