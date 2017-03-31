<?php

namespace TeamBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
use TeamBundle\Entity\Category;
use TeamBundle\Entity\Image;
use UserBundle\Entity\User;
use Doctrine\Common\Collections\ArrayCollection;
use PlanningBundle\Entity\Event;
use Gedmo\Mapping\Annotation as Gedmo;
use Symfony\Component\Validator\Constraints as Assert;

/**
 * Team
 *
 * @ORM\Table(name="team")
 * @ORM\Entity(repositoryClass="TeamBundle\Repository\TeamRepository")
 * @ORM\HasLifecycleCallbacks()
 */
class Team
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
     * @Assert\NotBlank()
     */
    private $name;


    /**
     * @var string
     *
     * @ORM\Column(name="level", type="string", length=255, unique=false)
     * @Assert\NotBlank()
     */
    private $level;

    /**
     * @var string
     *
     * @ORM\Column(name="palmares", type="text")
     * @Assert\Length(max=5000, maxMessage="Le texte ne doit pas faire plus de {{ limit }} caractères.")
     */
    private $palmares;

    /**
     * @var string
     *
     * @ORM\Column(name="ranking", type="string", length=255, unique=false)
     * @Assert\Length(max=255, maxMessage="L'Url ne doit pas faire plus de {{ limit }} caractères.")
     * @Assert\Url(message = "L'Url '{{ value }}' n'est pas valide",
     *     protocols = {"http", "https"}
     * )
     */
    private $ranking;

    /**
     * Many Team have One Category.
     * @ORM\ManyToOne(targetEntity="TeamBundle\Entity\Category")
     * @ORM\JoinColumn(nullable=false)
     */
    private $category;

    /**
     * @ORM\OneToOne(targetEntity="TeamBundle\Entity\Image", cascade={"persist", "remove"})
     */
    private $image;

    /**
     * @Gedmo\Slug(fields={"name"})
     * @ORM\Column(name="slug", type="string", length=255, unique=true)
     */
    private $slug;

    /**
     * One Team has Many Events.
     * @ORM\OneToMany(targetEntity="PlanningBundle\Entity\Event", mappedBy="team", cascade={"persist", "remove"})
     */
    private $events;

    /**
     * One Team has Many Trainings.
     * @ORM\OneToMany(targetEntity="PlanningBundle\Entity\Training", mappedBy="team", cascade={"persist", "remove"})
     */
    private $trainings;

    /**
     * One Team has Many Users.
     * @ORM\OneToMany(targetEntity="UserBundle\Entity\User", mappedBy="team", cascade={"persist", "remove"})
     */
    private $users;

    /**
     * @ORM\Column(name="updated_at", type="datetime", nullable=true)
     */
    private $updatedAt;

    /**
     * Constructor
     */
    public function __construct()
    {
        $this->events = new ArrayCollection();
    }

    /**
     * Get the string representation.
     *
     * @return string
     */
    public function __toString()
    {
        return $this->getName();
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
     * Set name
     *
     * @param string $name
     *
     * @return Team
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
     * Set level
     *
     * @param string $level
     *
     * @return Team
     */
    public function setLevel($level)
    {
        $this->level = $level;

        return $this;
    }

    /**
     * Get level
     *
     * @return string
     */
    public function getLevel()
    {
        return $this->level;
    }

    /**
     * Set palmares
     *
     * @param string $palmares
     *
     * @return Team
     */
    public function setPalmares($palmares)
    {
        $this->palmares = $palmares;

        return $this;
    }

    /**
     * Get palmares
     *
     * @return string
     */
    public function getPalmares()
    {
        return $this->palmares;
    }

    /**
     * Set ranking
     *
     * @param string $ranking
     *
     * @return Team
     */
    public function setRanking($ranking)
    {
        $this->ranking = $ranking;

        return $this;
    }

    /**
     * Get ranking
     *
     * @return string
     */
    public function getRanking()
    {
        return $this->ranking;
    }

    /**
     * Set category
     *
     * @param Category $category
     */
    public function setCategory(Category $category)
    {
        $this->category = $category;
    }

    /**
     * Get category
     *
     * @return Category
     */
    public function getCategory()
    {
        return $this->category;
    }

    /**
     * Set image
     *
     * @param \TeamBundle\Entity\Image $image
     *
     * @return Team
     */
    public function setImage(Image $image = null)
    {
        $this->image = $image;

        return $this;
    }

    /**
     * Get image
     *
     * @return \TeamBundle\Entity\Image
     */
    public function getImage()
    {
        return $this->image;
    }

    /**
     * @return mixed
     */
    public function getUpdatedAt()
    {
        return $this->updatedAt;
    }

    /**
     * @param mixed $updatedAt
     */
    public function setUpdatedAt($updatedAt)
    {
        $this->updatedAt = $updatedAt;
    }


    /**
     * @ORM\PreUpdate
     */
    public function updateDate()
    {
        $this->setUpdatedAt(new \Datetime());
    }

    /**
     * Set slug
     *
     * @param string $slug
     *
     * @return Team
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
        return $this->slug;
    }

    /**
     * Add event
     *
     * @param \PlanningBundle\Entity\Event $event
     *
     * @return Team
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
     * Add user
     *
     * @param \UserBundle\Entity\User $user
     *
     * @return Team
     */
    public function addUser(User $user)
    {
        $this->users[] = $user;

        return $this;
    }

    /**
     * Remove user
     *
     * @param \UserBundle\Entity\User $user
     */
    public function removeUser(User $user)
    {
        $this->users->removeElement($user);
    }

    /**
     * Get users
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getUsers()
    {
        return $this->users;
    }

    /**
     * Add training
     *
     * @param \PlanningBundle\Entity\Training $training
     *
     * @return Team
     */
    public function addTraining(\PlanningBundle\Entity\Training $training)
    {
        $this->trainings[] = $training;

        return $this;
    }

    /**
     * Remove training
     *
     * @param \PlanningBundle\Entity\Training $training
     */
    public function removeTraining(\PlanningBundle\Entity\Training $training)
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
