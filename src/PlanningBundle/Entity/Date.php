<?php

namespace PlanningBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use PlanningBundle\Entity\Event;
use Gedmo\Mapping\Annotation as Gedmo;

/**
 * Date
 *
 * @ORM\Table(name="date")
 * @ORM\Entity(repositoryClass="PlanningBundle\Repository\DateRepository")
 */
class Date
{
    /**
     * @var int
     *
     * @ORM\Column(name="id", type="integer")
     * @ORM\Id
     * @ORM\GeneratedValue(strategy="AUTO")
     */
    private $id;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="date", type="datetimetz", unique=true)
     */
    private $date;

    /**
     * One Date has Many Events.
     * @ORM\OneToMany(targetEntity="PlanningBundle\Entity\Event", mappedBy="date")
     */
    private $events;

    /**
     * Get id
     *
     * @return int
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set date
     *
     * @param \DateTime $date
     *
     * @return Date
     */
    public function setDate($date)
    {
        $this->date = $date;

        return $this;
    }

    /**
     * Get date
     *
     * @return \DateTime
     */
    public function getDate()
    {
        return $this->date;
    }
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->events = new ArrayCollection();
    }

    /**
     * Add event
     *
     * @param \PlanningBundle\Entity\Event $event
     *
     * @return Date
     */
    public function addEvent(Event $event)
    {
        $this->events[] = $event;

        return $this;
    }

    /**
     * Remove event
     *
     * @param \PlanningBundle\Entity\Event $event
     */
    public function removeEvent(Event $event)
    {
        $this->events->removeElement($event);
    }

    /**
     * Get events
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getEvents()
    {
        return $this->events;
    }
}
