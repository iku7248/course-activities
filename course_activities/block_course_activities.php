<?php
// This file is part of Moodle - http://moodle.org/
//
// Moodle is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// Moodle is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with Moodle.  If not, see <http://www.gnu.org/licenses/>.

/**
 *
 * @package    block_course_activities
 * @author     Ikram Ahmad (ikram.ahmad24@gmail.com)
 * @license    http://www.gnu.org/copyleft/gpl.html GNU GPL v3 or later
 */

defined('MOODLE_INTERNAL') || die();
require_once($CFG->libdir . '/filelib.php');
require_once($CFG->libdir . '/completionlib.php');

class block_course_activities extends block_list {
    public function init() {
        $this->title = get_string('pluginname', 'block_course_activities');
    }

    public function get_content() {
        global $CFG, $DB, $OUTPUT, $USER;

        if ($this->content !== null) {
            return $this->content;
        }
        $this->content = new stdClass;
        $this->content->items = [];
        $this->content->footer = '';
        $course = $this->page->course;
        require_once($CFG->dirroot.'/course/lib.php');
        
        $completioninfo = new completion_info($course);
        $activities = $completioninfo->get_activities();
        foreach ($activities as $cm) {
            // Exclude activities that aren't visible or have no view link (e.g. label). Account for folder being displayed inline.
            if (!$cm->uservisible || !$cm->has_view()) {
                continue;
            }
            $exporter = new \core_completion\external\completion_info_exporter($course, $cm, $USER->id);
            $renderer = $this->page->get_renderer('core');
            $data = (array)$exporter->export($renderer);
            $results = array_merge([
                'cmid'     => $cm->id,
                'modname'  => $cm->modname,
                'instance' => $cm->instance,
                'tracking' => $cm->completion,
                'name' => $cm->name,
            ], $data);
            $completion = $results['state'] == 1 ? get_string('completed', 'block_course_activities') : get_string('incomplete', 'block_course_activities');
            $activitydetails = $cm->id. ' - '. $cm->name. ' - '. date('d-M-Y', $cm->added). ' - '. $completion;
            $this->content->items[] = html_writer::link($cm->url, $activitydetails, ['style' => 'text-decoration: none;']);
        }
        return $this->content;
    }

    public function applicable_formats() {
        return array('course-view' => true);
    }

    public function instance_allow_multiple() {
        return false;
    }
}


