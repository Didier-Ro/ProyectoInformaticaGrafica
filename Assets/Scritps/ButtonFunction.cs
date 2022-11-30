using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ButtonFunction : MonoBehaviour
{
    [SerializeField] private float speed = 5;
    private GameObject _gameObject;
    
    public void RotateObject()
    {
        _gameObject.transform.Rotate(new Vector3(0,90 * Time.deltaTime * speed,0));
    }

    public void ScaleObject()
    {
        _gameObject.transform.localScale += new Vector3(2, 2, 2);
    }

    public void AssignGameObject(GameObject obj)
    {
        _gameObject = obj;
    }
}
