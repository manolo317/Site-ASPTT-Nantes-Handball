<?php


namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use EventBundle\Entity\Post;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;




class PostController extends Controller
{
    public function indexAction(Request $request)
    {
        // permet de récuperer les infos dans doctrine
        $em = $this->getDoctrine()->getManager();
    	// Appel la fonction définit dans le repository de la classe post	
        $posts = $em->getRepository('EventBundle:Post')->findThreeLastPosts();
        // retourne le résultat dans le fichier twig (chemin définit) 
        return $this->render('AppBundle:page:post.html.twig', [
            'posts' => $posts,
        ]);
    }
    public function viewAction(Post $post)
    {

        return $this->render('AppBundle:page:post.html.twig', ['post' => $post]);
    }
}