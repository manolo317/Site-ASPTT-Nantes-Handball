<?php

namespace EventBundle\Entity;

use Doctrine\ORM\Mapping as ORM;
// use EventBundle\Entity\Seo;
// use TeamBundle\Entity\Image;

/**
 * Post
 *
 * @ORM\Table(name="post")
 * @ORM\Entity(repositoryClass="EventBundle\Repository\PostRepository")
 * @ORM\HasLifecycleCallbacks()
 */
class Post
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
     * @ORM\Column(name="content", type="text")
     */
    private $content;

    /**
     * @var string
     *
     * @ORM\Column(name="author", type="string", length=255)
     */
    private $author;

    /**
     * @ORM\OneToOne(targetEntity="EventBundle\Entity\Seo", cascade={"persist", "remove"})
     */
    private $seo;

    /**
     * @ORM\OneToOne(targetEntity="TeamBundle\Entity\Image", cascade={"persist", "remove"})
     */
    private $image;


    /**
    * @ORM\Column(name="published_at", type="datetime", nullable=false)
    */
    private $publishedAt;

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
     * @return Post
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
     * Set content
     *
     * @param string $content
     *
     * @return Post
     */
    public function setContent($content)
    {
        $this->content = $content;

        return $this;
    }

    /**
     * Get content
     *
     * @return string
     */
    public function getContent()
    {
        return $this->content;
    }

    /**
     * Set author
     *
     * @param string $author
     *
     * @return Post
     */
    public function setAuthor($author)
    {
        $this->author = $author;

        return $this;
    }

    /**
     * Get author
     *
     * @return string
     */
    public function getAuthor()
    {
        return $this->author;
    }


    /**
     * Set seo
     *
     * @param \EventBundle\Entity\Seo $seo
     *
     * @return Post
     */
    public function setSeo(\EventBundle\Entity\Seo $seo = null)
    {
        $this->seo = $seo;

        return $this;
    }

    /**
     * Get seo
     *
     * @return \EventBundle\Entity\Seo
     */
    public function getSeo()
    {
        return $this->seo;
    }

    /**
     * Set image
     *
     * @param \TeamBundle\Entity\Image $image
     *
     * @return Post
     */
    public function setImage(\TeamBundle\Entity\Image $image = null)
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
     * Set publishedAt
     *
     * @param \DateTime $publishedAt
     *
     * @return Post
     */
    public function setPublishedAt($publishedAt)
    {
        $this->publishedAt = $publishedAt;
        return $this;
    }
    /**
     * Get publishedAt
     *
     * @return \DateTime
     */
    public function getPublishedAt()
    {
        return $this->publishedAt;
    }
}
