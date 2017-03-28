<?php

namespace PlanningBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use TeamBundle\Entity\Team;
use PlaceBundle\Entity\Place;

/**
 * Training
 *
 * @ORM\Table(name="training")
 * @ORM\Entity(repositoryClass="PlanningBundle\Repository\TrainingRepository")
 */
class Training
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
     * @ORM\Column(name="hour", type="datetimetz")
     */
    private $hour;

    /**
     * Many Training have One Day.
     * @ORM\ManyToOne(targetEntity="PlanningBundle\Entity\Day", inversedBy="trainings")
     * @ORM\JoinColumn(name="day_id", referencedColumnName="id", nullable=false)
     */
    private $day;

    /**
     * Many Trainings have One Team.
     * @ORM\ManyToOne(targetEntity="TeamBundle\Entity\Team")
     * @ORM\JoinColumn(nullable=false)
     */
    private $team;

    /**
     * Many Trainings have One Place.
     * @ORM\ManyToOne(targetEntity="PlaceBundle\Entity\Place")
     * @ORM\JoinColumn(nullable=true)
     */
    private $place;

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
     * Set hour
     *
     * @param \DateTime $hour
     *
     * @return Training
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
     * Set day
     *
     * @param \PlanningBundle\Entity\Day $day
     *
     * @return Training
     */
    public function setDay(Day $day)
    {
        $this->day = $day;

        return $this;
    }

    /**
     * Get day
     *
     * @return \PlanningBundle\Entity\Day
     */
    public function getDay()
    {
        return $this->day;
    }

    /**
     * Set team
     *
     * @param \TeamBundle\Entity\Team $team
     *
     * @return Training
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
     * @return Training
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
}
