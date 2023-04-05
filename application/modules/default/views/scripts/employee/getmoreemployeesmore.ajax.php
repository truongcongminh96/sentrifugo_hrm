<script src="<?php echo EXPENSES_MEDIA_PATH; ?>js/materialize.js"></script>
<style>
    table {
        font-family: arial, sans-serif;
        border-collapse: collapse;
        width: 100%;
    }

    td, th {
        border: 1px solid #dddddd;
        text-align: left;
        padding: 8px;
    }

    tr:nth-child(even) {
        background-color: #dddddd;
    }
</style>
<?php
$auth = Zend_Auth::getInstance();
if ($auth->hasIdentity()) {
    $loginUserId = $auth->getStorage()->read()->id;
    $loginuserRole = $auth->getStorage()->read()->emprole;
    $loginuserGroup = $auth->getStorage()->read()->group_id;
}
$baseUrl = $this->serverUrl() . $this->baseUrl();
if ($this->empflag == 'myemployees') {
    $roleflag = MYEMPLOYEES;
} else {
    $roleflag = EMPLOYEE;
}
?>
<?php if ($this->totalcount > 0) { ?>


    <?php
    foreach ($this->dataArray as $data) {
        foreach ($data as $emp) {
            ?>
            <tr>
                <td ><?php echo $emp['userfullname'] ?></td>
                <td><?php echo $emp['emprole_name'] ?></td>
                <td ><?php echo $emp['department_name'] ?></td>

                <td ><?php echo $emp['employeeId'] ?></td>
                <td ><?php echo $emp['emailaddress'] ?></td>
                <td ><?php echo $emp['contactnumber'] ?></td>

                <td><?php echo $emp['reporting_manager_name'] ?></td>
                <td ><?php echo $emp['emp_status_name'] ?></td>
                <td>
                    <?php
                    if (sapp_Global::_checkprivileges($roleflag, $loginuserGroup, $loginuserRole, 'view') == 'Yes') {
                        ?>
                        <button><a href="<?php echo BASE_URL . 'employee/view/id/' . $emp['id'];
                            ?>"></a><i class="fa fa-eye"></i></button>
                    <?php } ?>


                    <?php if (sapp_Global::_checkprivileges($roleflag, $loginuserGroup, $loginuserRole, 'edit') == 'Yes') { ?>
                        <button><a href="<?php echo BASE_URL . 'employee/edit/id/' . $emp['id'];
                            ?>"> </a><i class="fa fa-edit"></i></button>
                    <?php } ?>
                </td>
            </tr>


            <?php
        }
    }
    }
    else {
        echo "<p class='no-data'>No Data Found</p>";
    }
    ?>

<script type="text/javascript">
    $(document).ready(function () {
        var offsetval = '<?php echo $this->inc_offset;?>';
        var totalcount = '<?php echo $this->totalcount;?>';
        var empcount = '<?php echo $this->empcount;?>';
        $("#offset").val('<?php echo $this->inc_offset;?>');
        $("#count_remaining").val('<?php echo $this->remainingcount;?>');

        $("#viewmorediv").html("View More..(<?php echo $this->remainingcount . '';?> remaining)");

        if (parseInt(totalcount) >= parseInt(empcount)) {
            $("#viewmorediv").show();
        }
        if (parseInt(offsetval) >= parseInt(totalcount)) {
            $("#viewmorediv").hide();
        }


    });
</script>
