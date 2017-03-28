<?php
/**
 * Created by PhpStorm.
 * User: Emmanuel
 * Date: 27/03/2017
 * Time: 21:15
 */

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;


class AdminController extends Controller
{
    public function indexAction(Request $request)
    {
        // replace this example code with whatever you need
        return $this->render('AppBundle:Admin:index.html.twig');
    }

    public function menuAction()
    {



        return $this->render('AppBundle:Admin:admin_navbar.html.twig');
    }
}