<?php

require_once 'tagelitious.civix.php';

/**
 * Implementation of hook_civicrm_config
 */
function tagelitious_civicrm_config(&$config) {
  _tagelitious_civix_civicrm_config($config);
}

function tagelitious_civicrm_buildForm ($formName, &$form ){
  if ("CRM_Contact_Form_Contact" != $formName) return false;

  // Add js for in-place editing and jstree for tags
    CRM_Core_Resources::singleton()
      ->addScriptFile('civicrm', 'packages/jquery/plugins/jstree/jquery.jstree.js', 0, 'html-header', FALSE)
      ->addStyleFile('civicrm', 'packages/jquery/plugins/jstree/themes/default/style.css', 0, 'html-header');

}

/**
 * Implementation of hook_civicrm_xmlMenu
 *
 * @param $files array(string)
 */
function tagelitious_civicrm_xmlMenu(&$files) {
  _tagelitious_civix_civicrm_xmlMenu($files);
}

/**
 * Implementation of hook_civicrm_install
 */
function tagelitious_civicrm_install() {
  return _tagelitious_civix_civicrm_install();
}

/**
 * Implementation of hook_civicrm_uninstall
 */
function tagelitious_civicrm_uninstall() {
  return _tagelitious_civix_civicrm_uninstall();
}

/**
 * Implementation of hook_civicrm_enable
 */
function tagelitious_civicrm_enable() {
  return _tagelitious_civix_civicrm_enable();
}

/**
 * Implementation of hook_civicrm_disable
 */
function tagelitious_civicrm_disable() {
  return _tagelitious_civix_civicrm_disable();
}

/**
 * Implementation of hook_civicrm_upgrade
 *
 * @param $op string, the type of operation being performed; 'check' or 'enqueue'
 * @param $queue CRM_Queue_Queue, (for 'enqueue') the modifiable list of pending up upgrade tasks
 *
 * @return mixed  based on op. for 'check', returns array(boolean) (TRUE if upgrades are pending)
 *                for 'enqueue', returns void
 */
function tagelitious_civicrm_upgrade($op, CRM_Queue_Queue $queue = NULL) {
  return _tagelitious_civix_civicrm_upgrade($op, $queue);
}

/**
 * Implementation of hook_civicrm_managed
 *
 * Generate a list of entities to create/deactivate/delete when this module
 * is installed, disabled, uninstalled.
 */
function tagelitious_civicrm_managed(&$entities) {
  return _tagelitious_civix_civicrm_managed($entities);
}
