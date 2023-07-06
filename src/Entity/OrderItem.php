<?php

namespace App\Entity;

class OrderItem{

    private int $quantity;
    private float $itemPrice;
    private int $id_product;
    private int $id_order;
    private ?int $id;
    public function __construct(int $quantity,float $itemPrice,int $id_order,int $id_product,?int $id=null){
        $this->quantity = $quantity;
		$this->itemPrice = $itemPrice;
        $this->id_order = $id_order;
		$this->id_product = $id_product;
		$this->id = $id;
    }
      


	/**
	 * @return int
	 */
	public function getQuantity(): int {
		return $this->quantity;
	}
	
	/**
	 * @param int $quantity 
	 * @return self
	 */
	public function setQuantity(int $quantity): self {
		$this->quantity = $quantity;
		return $this;
	}
	
	/**
	 * @return float
	 */
	public function getItemPrice(): float {
		return $this->itemPrice;
	}
	
	/**
	 * @param float $itemPrice 
	 * @return self
	 */
	public function setItemPrice(float $itemPrice): self {
		$this->itemPrice = $itemPrice;
		return $this;
	}
	
	/**
	 * @return int
	 */
	public function getId_product(): int {
		return $this->id_product;
	}
	
	/**
	 * @param int $id_product 
	 * @return self
	 */
	public function setId_product(int $id_product): self {
		$this->id_product = $id_product;
		return $this;
	}
	
	/**
	 * @return int
	 */
	public function getId_order(): int {
		return $this->id_order;
	}
	
	/**
	 * @param int $id_order 
	 * @return self
	 */
	public function setId_order(int $id_order): self {
		$this->id_order = $id_order;
		return $this;
	}
	
	/**
	 * @return 
	 */
	public function getId(): ?int {
		return $this->id;
	}
	
	/**
	 * @param  $id 
	 * @return self
	 */
	public function setId(?int $id): self {
		$this->id = $id;
		return $this;
	}
}