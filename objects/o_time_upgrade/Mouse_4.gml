image_index = 1;
if (o_controller.coins >= o_controller.upgrade_cost)
{
    o_controller.coins -= o_controller.upgrade_cost;
    o_controller.time_left += o_controller.time_upgrade;
    o_controller.time_upgrade += o_controller.upgrade_step;
}