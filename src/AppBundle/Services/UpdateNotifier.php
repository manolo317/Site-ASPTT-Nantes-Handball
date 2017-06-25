<?php
/**
 * Created by PhpStorm.
 * User: Emmanuel
 * Date: 25/06/2017
 * Time: 13:31
 */

namespace AppBundle\Services;


use InfoBundle\Entity\Edito;

class UpdateNotifier
{

    /**
     * @var \Swift_Mailer
     */
    private $mailer;

    public function __construct(\Swift_Mailer $mailer)
    {
        $this->mailer = $mailer;
    }
    public function notifEmail(Edito $edito){

        $datetime = new \DateTime('now');
        // Je construit le message avec les données de mon form
        $message = \Swift_Message::newInstance("modification Edito")
            ->setFrom(['admin@asptt.com' => "Message automatique"])
            ->setTo(['admin@asptt.com'])
            ->setBody("l'edito a été modifié à ".$datetime->format('Y-m-d H:i:s')." auteur: ".$edito->getAuthor());

        return $this->mailer->send($message);
    }
}