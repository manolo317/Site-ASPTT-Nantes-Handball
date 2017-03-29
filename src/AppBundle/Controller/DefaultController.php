<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use TeamBundle\Entity\Team;
use InfoBundle\Entity\Fairplay;



class DefaultController extends Controller
{
    /**
     * @Route("/", name="homepage")
     */
    public function indexAction(Request $request)
    {
        // replace this example code with whatever you need
        return $this->render('AppBundle:page:index.html.twig');
    }

    public function menuAction()
    {

        //on récupère chaque catégorie
        $em = $this->getDoctrine()->getManager();
        $senior = $em->getRepository('TeamBundle:Category')
            ->findOneByName('Senior');
        $junior = $em->getRepository('TeamBundle:Category')
            ->findOneByName('Jeunes');
        $kids = $em->getRepository('TeamBundle:Category')
            ->findOneByName('Enfants');
        $loisirs = $em->getRepository('TeamBundle:Category')
            ->findOneByName('Loisirs');

        //puis la liste des équipes par catégorie pour construire le menu des équipes
        $repository = $em->getRepository('TeamBundle:Team');
        $seniorTeams = $repository->getTeamsByCategory($senior);
        $juniorTeams = $repository->getTeamsByCategory($junior);
        $kidsTeams = $repository->getTeamsByCategory($kids);
        $loisirsTeams = $repository->getTeamsByCategory($loisirs);

        return $this->render('AppBundle::navbar.html.twig', ['senior' => $senior,
                                                             'jeunes' => $junior,
                                                             'kids' => $kids,
                                                             'loisirs' => $loisirs,
                                                             'seniorTeams' => $seniorTeams,
                                                             'juniorTeams' => $juniorTeams,
                                                             'kidsTeams' => $kidsTeams,
                                                             'loisirsTeams' => $loisirsTeams]);
    }

    /**
     * @Route("/contact", name="contact")
     */
    public function contactAction(Request $request)
    {
        // Création du formulaire avec la modèle ContactType
        $form = $this->createForm('AppBundle\Form\ContactType',null,array(
            // To set the action use $this->generateUrl('route_identifier')
            'action' => $this->generateUrl('app_contact'),
            'method' => 'POST'
        ));

        if ($request->isMethod('POST')) {
            // Refill the fields in case the form is not valid.
            $form->handleRequest($request);

            if($form->isValid()){
                // Send mail
                if($this->sendEmail($form->getData())){

                    // Everything OK, redirect to wherever you want ! :

                    return $this->redirectToRoute('app_index');
                }else{
                    // An error ocurred, handle
                    var_dump("Errooooor :(");
                }
            }
        }

        return $this->render('AppBundle:page:contact.html.twig', ['form' => $form->createView()]);

    }

    private function sendEmail($data){

        $myappContactMail = 'mycontactmail@mymail.com';
        $myappContactPassword = 'yourmailpassword';

        // In this case we'll use the ZOHO mail services.
        // If your service is another, then read the following article to know which smpt code to use and which port
        // http://ourcodeworld.com/articles/read/14/swiftmailer-send-mails-from-php-easily-and-effortlessly
        $transport = \Swift_SmtpTransport::newInstance('smtp.gmail.com\', 465,\'ssl')
            ->setUsername($myappContactMail)
            ->setPassword($myappContactPassword);

        $mailer = \Swift_Mailer::newInstance($transport);

        $message = \Swift_Message::newInstance("Our Code World Contact Form ". $data["subject"])
            ->setFrom(array($myappContactMail => "Message by ".$data["name"]))
            ->setTo(array(
                $myappContactMail => $myappContactMail
            ))
            ->setBody($data["message"]."<br>ContactMail :".$data["email"]);

        return $mailer->send($message);
    }

    public function listContactAction(Request $request)
    {
        // replace this example code with whatever you need
        return $this->render('AppBundle:page:contact_list.html.twig');
    }

}
