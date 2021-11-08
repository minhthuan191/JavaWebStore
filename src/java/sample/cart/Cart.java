/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package sample.cart;

import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author USER
 */
public class Cart {
    private Map<String, CartItem> cart;

    public Cart() {
    }

    public Cart(Map<String, CartItem> cart) {
        this.cart = cart;
    }

    public Map<String, CartItem> getCart() {
        return cart;
    }

    public void setCart(Map<String, CartItem> cart) {
        this.cart = cart;
    }
    
    public boolean add(CartItem cartItem){
        boolean check = false;
        if(this.cart == null){
            this.cart = new HashMap<>();
        }
        if(this.cart.containsKey((cartItem.getProduct()).getProductID())){
            int currentQuantity = this.cart.get((cartItem.getProduct()).getProductID()).getQuantity();
            cartItem.setQuantity(currentQuantity+ cartItem.getQuantity());
        }
        cart.put(cartItem.getProduct().getProductID(), cartItem);
        check = true;
        return check;
    }
    
    public boolean delete(String id){
        boolean check = false;
        if(cart!=null){
           if(this.cart.containsKey(id)){
               this.cart.remove(id);
               check = true;
           } 
        }
        return check;
    }
    
    public boolean update(String id, CartItem cartItem){
        boolean check = false;
        if(this.cart != null){
            if(this.cart.containsKey(id)){
                this.cart.replace(id, cartItem);
                check = true;
            }
        }
        return check;
    }
}
