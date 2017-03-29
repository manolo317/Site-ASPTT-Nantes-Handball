<?php
/**
 * Created by PhpStorm.
 * User: Emmanuel
 * Date: 23/03/2017
 * Time: 11:17
 */

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use TeamBundle\Entity\Team;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;




class TeamController extends Controller
{
    public function viewAction(Team $team)
    {
//        dump($team);
//        die();
        return $this->render('AppBundle:page:team.html.twig', ['team' => $team]);
    }
}