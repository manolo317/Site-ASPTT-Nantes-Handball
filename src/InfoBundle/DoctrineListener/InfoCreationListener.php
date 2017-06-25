<?php

namespace InfoBundle\DoctrineListener;

use Doctrine\Common\Persistence\Event\LifecycleEventArgs;
use AppBundle\Services\UpdateNotifier;
use InfoBundle\Entity\Edito;

class InfoCreationListener
{
    /**
     * @var UpdateNotifier
     */
    private $updateNotifier;

    public function __construct(UpdateNotifier $updateNotifier)
    {
        $this->updateNotifier = $updateNotifier;
    }

    public function postUpdate(LifecycleEventArgs $args)
    {
        $entity = $args->getObject();

        // On ne veut envoyer un email que pour les entités Edito
        if (!$entity instanceof Edito) {
            return;
        }

        $this->updateNotifier->notifEmail($entity);
    }
}