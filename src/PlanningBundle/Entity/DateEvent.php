<?php

namespace PlanningBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;
use PlanningBundle\Entity\Event;
use Gedmo\Mapping\Annotation as Gedmo;

use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Bridge\Doctrine\Validator\Constraints\UniqueEntity;

/**
 * DateEvent
 *
 * @ORM\Table(name="date")
 * @ORM\Entity(repositoryClass="PlanningBundle\Repository\DateEventRepository")
 * @UniqueEntity(fields="date", message="{{ value }} existe déjà .")
 */
class DateEvent
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
     * @ORM\Column(name="date", type="datetime", unique=true)
     */
    private $date;


    /**
     * @Gedmo\Slug(fields={"date"})
     * @ORM\Column(name="slug", type="string", length=255, unique=true)
     */
    private $slug;

    /**
     * One DateEvent has Many Events.
     * @ORM\OneToMany(targetEntity="PlanningBundle\Entity\Event", mappedBy="date")
     */
    private $events;

    /**
     * Get the string representation.
     *
     * @return string
     */
    public function __toString()
    {
        return $this->getSlug();
    }

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
     * @return DateEvent
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
     * @return DateEvent
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

    /**
     * Set slug
     *
     * @param string $slug
     *
     * @return DateEvent
     */
    public function setSlug($slug)
    {
        $this->slug = $slug;

        return $this;
    }

    /**
     * Get slug
     *
     * @return string
     */
    public function getSlug()
    {
        $slug = $this->slug;
        $slug = substr($slug, 0, 10); //j'enlève la partie heure, minutes, secondes
        return $slug;

    }
}
