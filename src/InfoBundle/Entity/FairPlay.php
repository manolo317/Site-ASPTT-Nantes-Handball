<?php

namespace InfoBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * FairPlay
 *
 * @ORM\Table(name="fair_play")
 * @ORM\Entity(repositoryClass="InfoBundle\Repository\FairPlayRepository")
 */
class FairPlay
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
     * @ORM\Column(name="title", type="string", length=255)
     */
    private $title;

    /**
     * @var string
     *
     * @ORM\Column(name="fair_play_content", type="text")
     */
    private $fairPlayContent;


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
     * Set title
     *
     * @param string $title
     *
     * @return FairPlay
     */
    public function setTitle($title)
    {
        $this->title = $title;

        return $this;
    }

    /**
     * Get title
     *
     * @return string
     */
    public function getTitle()
    {
        return $this->title;
    }

    /**
     * Set fairPlayContent
     *
     * @param string $fairPlayContent
     *
     * @return FairPlay
     */
    public function setFairPlayContent($fairPlayContent)
    {
        $this->fairPlayContent = $fairPlayContent;

        return $this;
    }

    /**
     * Get fairPlayContent
     *
     * @return string
     */
    public function getFairPlayContent()
    {
        return $this->fairPlayContent;
    }
}

