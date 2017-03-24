<?php

namespace PlanningBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Gedmo\Mapping\Annotation as Gedmo;
use TeamBundle\Entity\Team;

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
     * @ORM\ManyToOne(targetEntity="PlanningBundle\Entity\Date", inversedBy="events")
     * @ORM\JoinColumn(name="date_id", referencedColumnName="id", nullable=false)
     */
    private $date;

    /**
     * Many Events have One Team.
     * @ORM\ManyToOne(targetEntity="TeamBundle\Entity\Team")
     * @ORM\JoinColumn(nullable=false)
     */
    private $team;

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
     * Set date
     *
     * @param \PlanningBundle\Entity\Date $date
     *
     * @return Event
     */
    public function setDate(Date $date)
    {
        $this->date = $date;

        return $this;
    }

    /**
     * Get date
     *
     * @return \PlanningBundle\Entity\Date
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
}
