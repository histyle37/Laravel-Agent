<?php

namespace App\Http\Middleware;
use App\Models\Generalsetting;
use Closure;

class MaintenanceMode
{
    public function handle($request, Closure $next)

    {
        return $next($request);
    }
}
