<?php

namespace AppBundle\Services;

class ApplicationMailer
{

    /**
     * @var \Swift_Mailer
     */
    private $mailer;

    public function __construct(\Swift_Mailer $mailer)
    {
        $this->mailer = $mailer;
    }

    public function sendEmail($data, $myappContactMail)
    {
        // Je construit le message avec les données de mon form
        $message = \Swift_Message::newInstance("Contact Asptt Nantes Handball ". $data["subject"])
            ->setFrom([$myappContactMail => "Message de ".$data["name"]])
            ->setTo([$myappContactMail])
            ->setBody($data["message"]."\r\nMail expéditeur :".$data["email"]);

        return $this->mailer->send($message);
    }
}