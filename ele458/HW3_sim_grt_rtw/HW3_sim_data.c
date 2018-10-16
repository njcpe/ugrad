/*
 * HW3_sim_data.c
 *
 * Classroom License -- for classroom instructional use only.  Not for
 * government, commercial, academic research, or other organizational use.
 *
 * Code generation for model "HW3_sim".
 *
 * Model version              : 1.1
 * Simulink Coder version : 8.12 (R2017a) 16-Feb-2017
 * C source code generated on : Thu Mar 08 14:42:04 2018
 *
 * Target selection: grt.tlc
 * Note: GRT includes extra infrastructure and instrumentation for prototyping
 * Embedded hardware selection: Intel->x86-64 (Windows64)
 * Code generation objectives: Unspecified
 * Validation result: Not run
 */

#include "HW3_sim.h"
#include "HW3_sim_private.h"

/* Block parameters (auto storage) */
P_HW3_sim_T HW3_sim_P = {
  /*  Variable: C
   * Referenced by: '<Root>/C'
   */
  { 0.0, 0.0, 0.0, 1.0 },

  /*  Variable: K
   * Referenced by: '<Root>/Feedback Gain'
   */
  { -1.2582720288746088, 0.28190089792036205, -0.028851701154283142,
    0.04469723045918815 },

  /*  Variable: x0
   * Referenced by: '<Root>/Plant'
   */
  { 0.0, 0.0, 0.0, -1.0 },

  /*  Computed Parameter: Plant_A
   * Referenced by: '<Root>/Plant'
   */
  { -30.0, 1.0, 1225.0, -1225.0, -21.0, 1.0 },
  30.0,                                /* Computed Parameter: Plant_B
                                        * Referenced by: '<Root>/Plant'
                                        */

  /*  Computed Parameter: Plant_C
   * Referenced by: '<Root>/Plant'
   */
  { 1.0, 1.0, 1.0, 1.0 }
};
