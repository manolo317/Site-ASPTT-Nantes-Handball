<?php
/**
 * Created by PhpStorm.
 * User: Emmanuel
 * Date: 30/03/2017
 * Time: 15:46
 */

namespace AppBundle\Controller;

use AppBundle\Services\ApplicationMailer;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;


class MailController extends Controller
{
    /**
     * @Route("/contact", name="contact")
     */
    public function contactAction(Request $request)
    {
        // Création du formulaire avec la modèle ContactType
        $form = $this->createForm('AppBundle\Form\ContactType', null, [
            // Je set la méthode et la page où le form va être traiter (cette page)
            'action' => $this->generateUrl('app_contact'),
            'method' => 'POST'
        ]);
        /** @var ApplicationMailer $mailer */
        $mailer = $this->get('asptt.email.application_mailer');

        // Je récupère mon adresse mail et mon password dans parameters.yml
        $myappContactMail = $this->container->getParameter('mailer_user');

        if ($request->isMethod('POST')) {
            // Si le form a bien été envoyé
            $form->handleRequest($request);
            // Si il est valide
            if ($form->isValid()) {
                // J'envoie le mail
                if ($mailer->sendEmail($form->getData(), $myappContactMail)) {

                    $session = $request->getSession();
                    // J'envoie un message pour prévenir l'utilisateur
                    $session->getFlashBag()->add('notice', 'Mail bien envoyé');
                    // Je redirige vers la page d'accueil
                    return $this->redirectToRoute('app_index');
                } else {
                    $session = $request->getSession();
                    // J'envoie un message pour prévenir l'utilisateur que ça n'a pas marché
                    $session->getFlashBag()->add('notice', "Erreur lors de l'envoi du mail");
                    // Je redirige vers la page d'accueil
                    return $this->redirectToRoute('app_index');
                }
            }
        }

        return $this->render('AppBundle:page/annexes:contact.html.twig', ['form' => $form->createView()]);

    }
}