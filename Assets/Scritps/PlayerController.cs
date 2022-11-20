using System;
using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class PlayerController : MonoBehaviour
{
    [SerializeField] private CharacterController _playerController;
    private float horizontalMove;
    private float verticalMove;
    private Vector3 playerInput;

    [SerializeField] private float playerSpeed;
    private Vector3 movePlayer;

    [SerializeField] private float gravity = 9.8f;
    [SerializeField] private float fallVelocity;
    [SerializeField] private float jumpForce;

    [SerializeField] private Transform groundCheck;
    [SerializeField] private LayerMask groundLayer;
    [SerializeField] private float radiousCheck;
    private bool isGrounded;

    [SerializeField] private Camera _camera;
    private Vector3 cameraForward;
    private Vector3 cameraRight;

    [SerializeField] private Animator _animator;
    
    // Start is called before the first frame update
    void Start()
    {
        _playerController = GetComponent<CharacterController>();
        _animator = GetComponent<Animator>();
    }

    // Update is called once per frame
    void Update()
    {
        horizontalMove = Input.GetAxis("Horizontal");
        verticalMove = Input.GetAxis("Vertical");

        playerInput = new Vector3(horizontalMove, 0, verticalMove);
        playerInput = Vector3.ClampMagnitude(playerInput, 1);
        
        _animator.SetFloat("WalkVelocity", playerInput.magnitude * playerSpeed);
        
        CameraDirection();
        movePlayer = playerInput.x * cameraRight + playerInput.z * cameraForward;
        movePlayer = movePlayer * playerSpeed;
        _playerController.transform.LookAt(_playerController.transform.position + movePlayer);
       
        SetGravity();
        PlayerSkills();
        
        _playerController.Move(movePlayer * Time.deltaTime);
        Debug.Log(playerInput.magnitude);
    }

    private void FixedUpdate()
    {
        isGrounded = Physics.CheckSphere(groundCheck.position, radiousCheck, groundLayer);
    }

    private void CameraDirection()
    {
        cameraForward = _camera.transform.forward;
        cameraRight = _camera.transform.right;

        cameraForward.y = 0;
        cameraRight.y = 0;

        cameraForward = cameraForward.normalized;
        cameraRight = cameraRight.normalized;
    }

    private void SetGravity()
    {
        
        if (_playerController.isGrounded)
        {
            fallVelocity = -gravity * Time.deltaTime;
            movePlayer.y = fallVelocity;
        }
        else
        {
            fallVelocity -= gravity * Time.deltaTime;
            movePlayer.y = fallVelocity;
            _animator.SetFloat("VerticalVelocity", _playerController.velocity.y);
        }
        _animator.SetBool("IsGrounded", isGrounded);
    }

    private void PlayerSkills()
    {
        if (isGrounded && Input.GetButtonDown("Jump"))
        {
            fallVelocity = jumpForce;
            movePlayer.y = fallVelocity;
            
            if (playerInput.magnitude == 0)
            {
                _animator.SetTrigger("Jump");
            }
            else
            {
                _animator.SetTrigger("JumpRunning");
            }
        }
    }

    private void OnAnimatorMove()
    {
        
    }
}
