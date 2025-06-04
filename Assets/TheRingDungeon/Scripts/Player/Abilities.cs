
using UnityEngine;
using UnityEngine.UI;
public class Abilities : MonoBehaviour
{
    [Header("Ability 1")]
    public Image abilityImage1;
    public Text abilityText1;
    public KeyCode ability1Key;
    public float ability1Cooldown = 5;
    public Canvas ability1Canvas;
    public Image ability1Skillshot;

    [Header("Ability 2")]
    public Image abilityImage2;
    public Text abilityText2;
    public KeyCode ability2Key;
    public float ability2Cooldown = 5;
    public Canvas ability2Canvas;
    public Image ability2RangeIndicator;
    public float maxAbility2Distance = 7;

    [Header("Ability 3")]
    public Image abilityImage3;
    public Text abilityText3;
    public KeyCode ability3Key;
    public float ability3Cooldown = 5;
    public Canvas ability3Canvas;
    public Image ability3Cone;

    [Header("Ability 4")]
    public Image abilityImage4;
    public Text abilityText4;
    public KeyCode ability4Key;
    public float ability4Cooldown = 5;

    private bool isAbility1Cooldown = false;
    private bool isAbility2Cooldown = false;
    private bool isAbility3Cooldown = false;
    private bool isAbility4Cooldown = false;


    private float currentAbility1Cooldown;
    private float currentAbility2Cooldown;
    private float currentAbility3Cooldown;
    private float currentAbility4Cooldown;

    private Vector3 position;
    private RaycastHit hit;
    private Ray ray;

    [SerializeField] private float lookRotationSpeed = 10f;

    [SerializeField] private SkillQ skillQ;
    [SerializeField] private Transform handTransform;

    private void Start()
    {
        abilityImage1.fillAmount = 0;
        abilityImage2.fillAmount = 0;
        abilityImage3.fillAmount = 0;
        abilityImage4.fillAmount = 0;


        abilityText1.text = "";
        abilityText2.text = "";
        abilityText3.text = "";
        abilityText4.text = "";

        ability1Skillshot.enabled = false;
        ability2RangeIndicator.enabled = false;
        ability3Cone.enabled = false;

        ability1Canvas.enabled = false;
        ability2Canvas.enabled = false; 
        ability3Canvas.enabled = false;
    }

    private void Update()
    {
        ray = Camera.main.ScreenPointToRay(Input.mousePosition);

        Ability1Input();
        Ability2Input();
        Ability3Input();
        Ability4Input();


        AbilityCooldown(ref currentAbility1Cooldown, ability1Cooldown, ref isAbility1Cooldown, abilityImage1, abilityText1);
        AbilityCooldown(ref currentAbility2Cooldown, ability2Cooldown, ref isAbility2Cooldown, abilityImage2, abilityText2);
        AbilityCooldown(ref currentAbility3Cooldown, ability3Cooldown, ref isAbility3Cooldown, abilityImage3, abilityText3);
        AbilityCooldown(ref currentAbility4Cooldown, ability4Cooldown, ref isAbility4Cooldown, abilityImage4, abilityText4);

        Ability1Canvas();
        Ability2Canvas();
        Ability3Canvas();

    }

    private void Ability1Canvas()
    {
        if(ability1Skillshot.enabled)
        {
            if(Physics.Raycast(ray, out hit, Mathf.Infinity))
            {
                position = new Vector3(hit.point.x, hit.point.y, hit.point.z);
            }

            Quaternion ab1Canvas = Quaternion.LookRotation(position - transform.position);
            ab1Canvas.eulerAngles = new Vector3(0, ab1Canvas.eulerAngles.y, ab1Canvas.eulerAngles.z);

            ability1Canvas.transform.rotation = Quaternion.Lerp(ab1Canvas, ability1Canvas.transform.rotation, 0);
        }
    }

    private void Ability2Canvas()
    {
        int layerMask = ~LayerMask.GetMask("Player");

        if(Physics.Raycast(ray, out hit, Mathf.Infinity, layerMask))
        {
            if(hit.collider.gameObject != this.gameObject)
            {
                position = hit.point;
            }
        }

        var hitPosDir = (hit.point - transform.position).normalized;
        float distance = Vector3.Distance(hit.point, transform.position);
        distance = Mathf.Min(distance, maxAbility2Distance);

        var newHitPos = transform.position + hitPosDir * distance;
        ability2Canvas.transform.position = (newHitPos);
    }

    private void Ability3Canvas()
    {
        if (ability3Cone.enabled)
        {
            if (Physics.Raycast(ray, out hit, Mathf.Infinity))
            {
                position = new Vector3(hit.point.x, hit.point.y, hit.point.z);
            }

            Quaternion ab3Canvas = Quaternion.LookRotation(position - transform.position);
            ab3Canvas.eulerAngles = new Vector3(0, ab3Canvas.eulerAngles.y, ab3Canvas.eulerAngles.z);

            ability3Canvas.transform.rotation = Quaternion.Lerp(ab3Canvas, ability3Canvas.transform.rotation, 0);
        }
    }
    private void Ability1Input()
    {
        if(Input.GetKeyDown(ability1Key) && !isAbility1Cooldown)
        {
            

            ability1Canvas.enabled = true;
            ability1Skillshot.enabled = true;

            ability2Canvas.enabled = false;
            ability2RangeIndicator.enabled = false;
            ability3Canvas.enabled = false;
            ability3Cone.enabled = false;

            //Cursor.visible = true;

        }
        if (ability1Skillshot.enabled && Input.GetMouseButtonDown(0))
        {
            Ray ray = Camera.main.ScreenPointToRay(Input.mousePosition);
            if (Physics.Raycast(ray, out RaycastHit hit))
            {
                // 1. Tính h??ng t? tay ? v? trí tr? chu?t
                Vector3 direction = (hit.point - handTransform.position).normalized;
                Quaternion rotation = Quaternion.LookRotation(direction);

                // 2. G?i Execute t? SkillQ
                skillQ.Execute(handTransform.position, rotation);

                // 3. B?t ??u cooldown
                isAbility1Cooldown = true;
                currentAbility1Cooldown = ability1Cooldown;

                FaceDirection(direction);
                // 4. T?t indicator
                ability1Canvas.enabled = false;
                ability1Skillshot.enabled = false;
            }


        }
        if (ability1Skillshot.enabled && (Input.GetMouseButtonDown(1)))
        {
            CancelAllIndicators();
        }
    }
    private void Ability2Input()
    {
        if (Input.GetKeyDown(ability2Key) && !isAbility2Cooldown)
        {
            

            ability2Canvas.enabled = true;
            ability2RangeIndicator.enabled = true;

            ability1Canvas.enabled=false;
            ability1Skillshot.enabled=false;
            ability3Canvas.enabled=false;
            ability3Cone.enabled=false;

            //Cursor.visible = false;
        }
        if (ability2Canvas.enabled && Input.GetMouseButtonDown(0))
        {
            isAbility2Cooldown = true;
            currentAbility2Cooldown = ability2Cooldown;

            ability2Canvas.enabled = false;
            ability2RangeIndicator.enabled = false;

            Vector3 direction = (position - transform.position).normalized;
            FaceDirection(direction);

            //Cursor.visible = true;
        }
        if (ability2Canvas.enabled && (Input.GetMouseButtonDown(1)))
        {
            CancelAllIndicators();
        }
    }
    private void Ability3Input()
    {
        if (Input.GetKeyDown(ability3Key) && !isAbility3Cooldown)
        {

            ability3Canvas.enabled = true;
            ability3Cone.enabled = true;

            ability1Canvas.enabled = false;
            ability1Skillshot.enabled = false;

            ability2Canvas.enabled = false;
            ability2RangeIndicator.enabled = false;

            //Cursor.visible = true;

        }
        if (ability3Cone.enabled && Input.GetMouseButtonDown(0))
        {
            isAbility3Cooldown = true;
            currentAbility3Cooldown = ability3Cooldown;

            ability3Canvas.enabled = false;
            ability3Cone.enabled = false;

            Vector3 direction = (position - transform.position).normalized;
            FaceDirection(direction);
        }
        if (ability3Cone.enabled && (Input.GetMouseButtonDown(1)))
        {
            CancelAllIndicators();
        }
    }
    private void Ability4Input()
    {
        if (Input.GetKeyDown(ability4Key) && !isAbility4Cooldown)
        {
            isAbility4Cooldown = true;
            currentAbility4Cooldown = ability4Cooldown;
        }
    }

    private void AbilityCooldown(ref float currentCooldown, float maxCooldown, ref bool isCooldown, Image skillImage, Text skillText)
    {
        if (isCooldown)
        {
            currentCooldown -= Time.deltaTime;
            if(currentCooldown <= 0f)
            {
                isCooldown = false;
                currentCooldown = 0f;
                if(skillImage != null)
                {
                    skillImage.fillAmount = 0f;
                }
                if(skillText != null)
                {
                    skillText.text = "";
                }  
            }
            else
            {
                if(skillImage != null)
                {
                    skillImage.fillAmount = currentCooldown / maxCooldown;
                }
                if(skillText != null)
                {
                    skillText.text = Mathf.Ceil(currentCooldown).ToString();
                }
            }
        }
    }

    private void CancelAllIndicators()
    {
        ability1Canvas.enabled = false;
        ability1Skillshot.enabled = false;
        ability2Canvas.enabled = false;
        ability2RangeIndicator.enabled = false;
        ability3Canvas.enabled = false;
        ability3Cone.enabled = false;
    }

    private void FaceDirection(Vector3 dir)
    {
        dir.y = 0;

        if (dir.sqrMagnitude < 0.01f) return; // b? qua n?u g?n b?ng zero

        Quaternion lookRotation = Quaternion.LookRotation(dir);
        // T?m th?i: xoay tr?c ti?p, sau này b?n có th? làm m??t n?u c?n
        transform.rotation = lookRotation;
    }
}
