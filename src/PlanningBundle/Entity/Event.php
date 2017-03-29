<?php

namespace PlanningBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;
use TeamBundle\Entity\Team;
use PlaceBundle\Entity\Place;
use UserBundle\Entity\User;

/**
 * Event
 *
 * @ORM\Table(name="event")
 * @ORM\Entity(repositoryClass="PlanningBundle\Repository\EventRepository")
 */
class Event
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
     * @var string
     *
     * @ORM\Column(name="opponent", type="string", length=255)
     */
    private $opponent;

    /**
     * @var \DateTime
     *
     * @ORM\Column(name="hour", type="datetimetz")
     */
    private $hour;


    /**
     * Many Events have One Date.
     * @ORM\ManyToOne(targetEntity="PlanningBundle\Entity\DateEvent", inversedBy="events")
     * @ORM\JoinColumn(name="date_id", referencedColumnName="id", nullable=false)
     */
    private $date;

    /**
     * Many Events have One Team.
     * @ORM\ManyToOne(targetEntity="TeamBundle\Entity\Team", inversedBy="events")
     * @ORM\JoinColumn(name="team_id", referencedColumnName="id", nullable=false)
     */
    private $team;

    /**
     * Many Events have One Place.
     * @ORM\ManyToOne(targetEntity="PlaceBundle\Entity\Place")
     * @ORM\JoinColumn(nullable=true)
     */
    private $place;

    /**
     * Many Events have One PlaceResponsable.
     * @ORM\ManyToOne(targetEntity="UserBundle\Entity\User")
     * @ORM\JoinColumn(nullable=true)
     */
    private $placeResponsable;

    /**
     * Many Events have One TableResponsable.
     * @ORM\ManyToOne(targetEntity="TeamBundle\Entity\Team")
     * @ORM\JoinColumn(nullable=true)
     */
    private $tableResponsable;

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
     * Set opponent
     *
     * @param string $opponent
     *
     * @return Event
     */
    public function setOpponent($opponent)
    {
        $this->opponent = $opponent;

        return $this;
    }

    /**
     * Get opponent
     *
     * @return string
     */
    public function getOpponent()
    {
        return $this->opponent;
    }

    /**
     * Set hour
     *
     * @param \DateTime $hour
     *
     * @return Event
     */
    public function setHour($hour)
    {
        $this->hour = $hour;

        return $this;
    }

    /**
     * Get hour
     *
     * @return \DateTime
     */
    public function getHour()
    {
        return $this->hour;
    }


    /**
     * @param \PlanningBundle\Entity\DateEvent $date
     *
     * @return Event
     */
    public function setDate(DateEvent $date)
    {
        $this->date = $date;

        return $this;
    }

    /**
     * Get date
     *
     * @return \PlanningBundle\Entity\DateEvent
     */
    public function getDate()
    {
        return $this->date;
    }

    /**
     * Set team
     *
     * @param Team $team
     *
     * @return Event
     */
    public function setTeam(Team $team)
    {
        $this->team = $team;

        return $this;
    }

    /**
     * Get team
     *
     * @return \TeamBundle\Entity\Team
     */
    public function getTeam()
    {
        return $this->team;
    }

    /**
     * Set place
     *
     * @param \PlaceBundle\Entity\Place $place
     *
     * @return Event
     */
    public function setPlace(Place $place = null)
    {
        $this->place = $place;

        return $this;
    }

    /**
     * Get place
     *
     * @return \PlaceBundle\Entity\Place
     */
    public function getPlace()
    {
        return $this->place;
    }

    /**
     * Set placeResponsable
     *
     * @param \UserBundle\Entity\User $placeResponsable
     *
     * @return Event
     */
    public function setPlaceResponsable(User $placeResponsable = null)
    {
        $this->placeResponsable = $placeResponsable;

        return $this;
    }

    /**
     * Get placeResponsable
     *
     * @return \UserBundle\Entity\User
     */
    public function getPlaceResponsable()
    {
        return $this->placeResponsable;
    }

    /**
     * Set tableResponsable
     *
     * @param \TeamBundle\Entity\Team $tableResponsable
     *
     * @return Event
     */
    public function setTableResponsable(Team $tableResponsable = null)
    {
        $this->tableResponsable = $tableResponsable;

        return $this;
    }

    /**
     * Get tableResponsable
     *
     * @return \TeamBundle\Entity\Team
     */
    public function getTableResponsable()
    {
        return $this->tableResponsable;
    }
}
