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
        $em = $this->getDoctrine()->getManager();
        $posts = $em->getRepository('EventBundle:Post')->findThreeLastPosts();

        $form = $this->get('form.factory')->createBuilder(FormType::class)
            ->add('search', TextType::class)
            ->add('filter', SubmitType::class)
            ->getForm();


        if ($request->isMethod('POST')) {
            $form->handleRequest($request);
            $data = $form->getData();
            $research = $data['search'];

            $posts = $em->getRepository('EventBundle:Post')->getByResearch($research);
            if(empty($posts)){

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
        $em = $this->getDoctrine()->getManager();
        $posts = $em->getRepository('EventBundle:Post')->getPostsByCategory(2);

        return $this->render('AppBundle:page/post:post_club.html.twig', ['posts' => $posts]);
    }

    public function showEventHandballAction()
    {
        $em = $this->getDoctrine()->getManager();
        $posts = $em->getRepository('EventBundle:Post')->getPostsByCategory(1);

        return $this->render('AppBundle:page/post:post_hand.html.twig', ['posts' => $posts]);
    }

}