using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.InputSystem.Composites;

public class ButtonController : MonoBehaviour
{
    [SerializeField] private GameObject button;
    [SerializeField] private GameObject button2;
    [SerializeField] private ButtonFunction _buttonFunction;
    private void OnTriggerStay(Collider other)
    {
        button.SetActive(true);
        button2.SetActive(true);
        _buttonFunction.AssignGameObject(other.gameObject);
    }

    private void OnTriggerExit(Collider other)
    {
        button.SetActive(false);
        button2.SetActive(false);
    }
}
