<?php

namespace App\Http\Middleware;

use App\Classes\TokenHelper;

use Closure;

class ApiVerifyCsrfToken
{
    protected $except = [
    ];

    public function handle($request, Closure $next)
    {
        if (
            $this->isReading($request) ||
            $this->inExceptArray($request) ||
            $this->tokensMatch($request)
        ) {
            return $next($request);
        }

        return response()->make('Something went wrong.', 200, ['CONTENT_TYPE' => 'application/json']);
    }

    protected function isReading($request)
    {
        return in_array($request->method(), ['HEAD', 'GET', 'OPTIONS']);
    }

    protected function inExceptArray($request)
    {
        foreach ($this->except as $except) {
            if ($except !== '/') {
                $except = trim($except, '/');
            }

            if ($request->fullUrlIs($except) || $request->is($except)) {
                return true;
            }
        }

        return false;
    }

    protected function tokensMatch($request)
    {
        $tokenHelper = new TokenHelper;
        $token = $this->getTokenFromRequest($request);

        return is_string($token) &&
                $tokenHelper->verify($token);
    }

    protected function getTokenFromRequest($request)
    {
        $token = $request->input('_token') ?: $request->header('X-CSRF-TOKEN');

        if (! $token && $header = $request->header('X-XSRF-TOKEN')) {
            $token = $this->encrypter->decrypt($header, static::serialized());
        }

        return $token;
    }

}
