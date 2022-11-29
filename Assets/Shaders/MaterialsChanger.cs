using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MaterialsChanger : MonoBehaviour
{
    public Material _material1;
    public Material _material2;
    public Material _material3;
    public int _materialCase = 1;
    public MeshRenderer _rend;
    
    
    // Update is called once per frame
    private void Start()
    {
        InvokeRepeating("Case",10,10);
    }

    void Update()
    {
        ChangeMaterial();
    }

    public void Case()
    {
        if (_materialCase == 1) _materialCase=2;
        else if (_materialCase == 2) _materialCase = 3;
        else if (_materialCase == 3) _materialCase = 1;
        else _materialCase = 1;
    }
    public void ChangeMaterial()
    {
        
        switch(_materialCase)
        {
        case 1:
            _rend.material= _material1;
            break;
        case 2:
            _rend.material= _material2;
            break;
        case 3:
            _rend.material= _material3;
            break;
            
        }    
    }
    
}
