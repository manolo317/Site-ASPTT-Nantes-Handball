<?php

namespace PlanningBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use Doctrine\Common\Collections\ArrayCollection;

/**
 * Day
 *
 * @ORM\Table(name="day")
 * @ORM\Entity(repositoryClass="PlanningBundle\Repository\DayRepository")
 */
class Day
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
     * @ORM\Column(name="name", type="string", length=255, unique=true)
     */
    private $name;

    /**
     * One Day has Many Trainings.
     * @ORM\OneToMany(targetEntity="PlanningBundle\Entity\Training", mappedBy="day", cascade={"persist", "remove"})
     */
    private $trainings;

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
     * Set name
     *
     * @param string $name
     *
     * @return Day
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }
    /**
     * Constructor
     */
    public function __construct()
    {
        $this->trainings = new ArrayCollection();
    }

    /**
     * Add training
     *
     * @param \PlanningBundle\Entity\Training $training
     *
     * @return Day
     */
    public function addTraining(Training $training)
    {
        $this->trainings[] = $training;

        return $this;
    }

    /**
     * Remove training
     *
     * @param \PlanningBundle\Entity\Training $training
     */
    public function removeTraining(Training $training)
    {
        $this->trainings->removeElement($training);
    }

    /**
     * Get trainings
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getTrainings()
    {
        return $this->trainings;
    }
}
