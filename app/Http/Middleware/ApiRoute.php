<?php

namespace App\Http\Middleware;
use Auth;
use Closure;

class ApiRoute
{
    public function handle($request, Closure $next)
    {
        header('Access-Control-Allow-Origin: *');
        header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
        header('Access-Control-Allow-Headers: Origin, Content-Type, Accept, Authorization, X-Requested-With');
        header('Access-Control-Allow-Credentials: true');
        return $next($request);
    }
}
