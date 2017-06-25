<?php

namespace AppBundle\Services;

class ApplicationMailer
{

    public function sendEmail($data, $myappContactMail, $myappContactPassword){

        // J'instancie un objet Mailer
        $transport = \Swift_SmtpTransport::newInstance('smtp.gmail.com', 465, 'ssl')
            ->setUsername($myappContactMail)
            ->setPassword($myappContactPassword);

        $mailer = \Swift_Mailer::newInstance($transport);
        // Je construit le message avec les données de mon form
        $message = \Swift_Message::newInstance("Contact Asptt Nantes Handball ". $data["subject"])
            ->setFrom([$myappContactMail => "Message de ".$data["name"]])
            ->setTo([$myappContactMail])
            ->setBody($data["message"]."\r\nMail expéditeur :".$data["email"]);

        return $mailer->send($message);
    }
}