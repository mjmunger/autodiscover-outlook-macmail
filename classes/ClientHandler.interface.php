<?php

namespace Autodiscover;

interface iClientHandler {
    public function parseEmailAddress();
    public function getVars();
    public function generateDocument();
    public function respond();
}