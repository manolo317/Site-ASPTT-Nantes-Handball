<?php


namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\FormType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\HttpFoundation\Request;
use EventBundle\Entity\Post;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\ParamConverter;
use EventBundle\Form\PostType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;




class PostController extends Controller
{

    public function indexAction(Request $request)
    {
        // Page d'index des Evenements
        $em = $this->getDoctrine()->getManager();
        $posts = $em->getRepository('EventBundle:Post')->findThreeLastPosts();
        //récupération des 3 derniers

        // Je construis un formulaire pour faire des recherches par mots clés
        $form = $this->get('form.factory')->createBuilder(FormType::class)
            ->add('search', TextType::class) //champ text
            ->add('filter', SubmitType::class)// bouton submit
            ->getForm();

        // si le formulaire est rempli
        if ($request->isMethod('POST')) {
            $form->handleRequest($request);
            // récuperation de la recherche
            $data = $form->getData();
            $research = $data['search'];
            //Je cherche dans mes posts avec le mot clé
            $posts = $em->getRepository('EventBundle:Post')->getByResearch($research);

            if(empty($posts)){
                // si pas de résulatst, j'envoi un message
                $session = $request->getSession();
                $session->getFlashBag()->add('notice', 'Pas de résultats pour '.$research.' !');
            }

        }

        return $this->render('AppBundle:page/post:post_index.html.twig', [
            'posts' => $posts,
            'form' => $form->createView()
        ]);
    }

    public function viewAction(Post $post)
    {

        return $this->render('AppBundle:page/post:post_detail.html.twig', ['post' => $post]);
    }

    public function showEventClubAction()
    {
        //Page Evenement Club
        $em = $this->getDoctrine()->getManager();
        $posts = $em->getRepository('EventBundle:Post')->getPostsByCategory(2);

        return $this->render('AppBundle:page/post:post_club.html.twig', ['posts' => $posts]);
    }

    public function showEventHandballAction()
    {
        //Page Evenement Hand
        $em = $this->getDoctrine()->getManager();
        $posts = $em->getRepository('EventBundle:Post')->getPostsByCategory(1);

        return $this->render('AppBundle:page/post:post_hand.html.twig', ['posts' => $posts]);
    }

}