/*
 * HW3_sim.c
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

/* Block signals (auto storage) */
B_HW3_sim_T HW3_sim_B;

/* Continuous states */
X_HW3_sim_T HW3_sim_X;

/* Block states (auto storage) */
DW_HW3_sim_T HW3_sim_DW;

/* Real-time model */
RT_MODEL_HW3_sim_T HW3_sim_M_;
RT_MODEL_HW3_sim_T *const HW3_sim_M = &HW3_sim_M_;

/*
 * This function updates continuous states using the ODE3 fixed-step
 * solver algorithm
 */
static void rt_ertODEUpdateContinuousStates(RTWSolverInfo *si )
{
  /* Solver Matrices */
  static const real_T rt_ODE3_A[3] = {
    1.0/2.0, 3.0/4.0, 1.0
  };

  static const real_T rt_ODE3_B[3][3] = {
    { 1.0/2.0, 0.0, 0.0 },

    { 0.0, 3.0/4.0, 0.0 },

    { 2.0/9.0, 1.0/3.0, 4.0/9.0 }
  };

  time_T t = rtsiGetT(si);
  time_T tnew = rtsiGetSolverStopTime(si);
  time_T h = rtsiGetStepSize(si);
  real_T *x = rtsiGetContStates(si);
  ODE3_IntgData *id = (ODE3_IntgData *)rtsiGetSolverData(si);
  real_T *y = id->y;
  real_T *f0 = id->f[0];
  real_T *f1 = id->f[1];
  real_T *f2 = id->f[2];
  real_T hB[3];
  int_T i;
  int_T nXc = 4;
  rtsiSetSimTimeStep(si,MINOR_TIME_STEP);

  /* Save the state values at time t in y, we'll use x as ynew. */
  (void) memcpy(y, x,
                (uint_T)nXc*sizeof(real_T));

  /* Assumes that rtsiSetT and ModelOutputs are up-to-date */
  /* f0 = f(t,y) */
  rtsiSetdX(si, f0);
  HW3_sim_derivatives();

  /* f(:,2) = feval(odefile, t + hA(1), y + f*hB(:,1), args(:)(*)); */
  hB[0] = h * rt_ODE3_B[0][0];
  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0]);
  }

  rtsiSetT(si, t + h*rt_ODE3_A[0]);
  rtsiSetdX(si, f1);
  HW3_sim_step();
  HW3_sim_derivatives();

  /* f(:,3) = feval(odefile, t + hA(2), y + f*hB(:,2), args(:)(*)); */
  for (i = 0; i <= 1; i++) {
    hB[i] = h * rt_ODE3_B[1][i];
  }

  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1]);
  }

  rtsiSetT(si, t + h*rt_ODE3_A[1]);
  rtsiSetdX(si, f2);
  HW3_sim_step();
  HW3_sim_derivatives();

  /* tnew = t + hA(3);
     ynew = y + f*hB(:,3); */
  for (i = 0; i <= 2; i++) {
    hB[i] = h * rt_ODE3_B[2][i];
  }

  for (i = 0; i < nXc; i++) {
    x[i] = y[i] + (f0[i]*hB[0] + f1[i]*hB[1] + f2[i]*hB[2]);
  }

  rtsiSetT(si, tnew);
  rtsiSetSimTimeStep(si,MAJOR_TIME_STEP);
}

/* Model step function */
void HW3_sim_step(void)
{
  if (rtmIsMajorTimeStep(HW3_sim_M)) {
    /* set solver stop time */
    if (!(HW3_sim_M->Timing.clockTick0+1)) {
      rtsiSetSolverStopTime(&HW3_sim_M->solverInfo,
                            ((HW3_sim_M->Timing.clockTickH0 + 1) *
        HW3_sim_M->Timing.stepSize0 * 4294967296.0));
    } else {
      rtsiSetSolverStopTime(&HW3_sim_M->solverInfo,
                            ((HW3_sim_M->Timing.clockTick0 + 1) *
        HW3_sim_M->Timing.stepSize0 + HW3_sim_M->Timing.clockTickH0 *
        HW3_sim_M->Timing.stepSize0 * 4294967296.0));
    }
  }                                    /* end MajorTimeStep */

  /* Update absolute time of base rate at minor time step */
  if (rtmIsMinorTimeStep(HW3_sim_M)) {
    HW3_sim_M->Timing.t[0] = rtsiGetT(&HW3_sim_M->solverInfo);
  }

  /* StateSpace: '<Root>/Plant' */
  HW3_sim_B.Plant[0] = 0.0;
  HW3_sim_B.Plant[1] = 0.0;
  HW3_sim_B.Plant[2] = 0.0;
  HW3_sim_B.Plant[3] = 0.0;
  HW3_sim_B.Plant[0] += HW3_sim_P.Plant_C[0] * HW3_sim_X.Plant_CSTATE[0];
  HW3_sim_B.Plant[1] += HW3_sim_P.Plant_C[1] * HW3_sim_X.Plant_CSTATE[1];
  HW3_sim_B.Plant[2] += HW3_sim_P.Plant_C[2] * HW3_sim_X.Plant_CSTATE[2];
  HW3_sim_B.Plant[3] += HW3_sim_P.Plant_C[3] * HW3_sim_X.Plant_CSTATE[3];
  if (rtmIsMajorTimeStep(HW3_sim_M)) {
    /* Gain: '<Root>/Feedback Gain' incorporates:
     *  ZeroOrderHold: '<Root>/A//D'
     */
    HW3_sim_B.FeedbackGain = ((HW3_sim_P.K[0] * HW3_sim_B.Plant[0] +
      HW3_sim_P.K[1] * HW3_sim_B.Plant[1]) + HW3_sim_P.K[2] * HW3_sim_B.Plant[2])
      + HW3_sim_P.K[3] * HW3_sim_B.Plant[3];
  }

  /* Gain: '<Root>/C' */
  HW3_sim_B.C = ((HW3_sim_P.C[0] * HW3_sim_B.Plant[0] + HW3_sim_P.C[1] *
                  HW3_sim_B.Plant[1]) + HW3_sim_P.C[2] * HW3_sim_B.Plant[2]) +
    HW3_sim_P.C[3] * HW3_sim_B.Plant[3];
  if (rtmIsMajorTimeStep(HW3_sim_M)) {
  }

  if (rtmIsMajorTimeStep(HW3_sim_M)) {
    /* Matfile logging */
    rt_UpdateTXYLogVars(HW3_sim_M->rtwLogInfo, (HW3_sim_M->Timing.t));
  }                                    /* end MajorTimeStep */

  if (rtmIsMajorTimeStep(HW3_sim_M)) {
    /* signal main to stop simulation */
    {                                  /* Sample time: [0.0s, 0.0s] */
      if ((rtmGetTFinal(HW3_sim_M)!=-1) &&
          !((rtmGetTFinal(HW3_sim_M)-(((HW3_sim_M->Timing.clockTick1+
               HW3_sim_M->Timing.clockTickH1* 4294967296.0)) * 0.01)) >
            (((HW3_sim_M->Timing.clockTick1+HW3_sim_M->Timing.clockTickH1*
               4294967296.0)) * 0.01) * (DBL_EPSILON))) {
        rtmSetErrorStatus(HW3_sim_M, "Simulation finished");
      }
    }

    rt_ertODEUpdateContinuousStates(&HW3_sim_M->solverInfo);

    /* Update absolute time for base rate */
    /* The "clockTick0" counts the number of times the code of this task has
     * been executed. The absolute time is the multiplication of "clockTick0"
     * and "Timing.stepSize0". Size of "clockTick0" ensures timer will not
     * overflow during the application lifespan selected.
     * Timer of this task consists of two 32 bit unsigned integers.
     * The two integers represent the low bits Timing.clockTick0 and the high bits
     * Timing.clockTickH0. When the low bit overflows to 0, the high bits increment.
     */
    if (!(++HW3_sim_M->Timing.clockTick0)) {
      ++HW3_sim_M->Timing.clockTickH0;
    }

    HW3_sim_M->Timing.t[0] = rtsiGetSolverStopTime(&HW3_sim_M->solverInfo);

    {
      /* Update absolute timer for sample time: [0.01s, 0.0s] */
      /* The "clockTick1" counts the number of times the code of this task has
       * been executed. The resolution of this integer timer is 0.01, which is the step size
       * of the task. Size of "clockTick1" ensures timer will not overflow during the
       * application lifespan selected.
       * Timer of this task consists of two 32 bit unsigned integers.
       * The two integers represent the low bits Timing.clockTick1 and the high bits
       * Timing.clockTickH1. When the low bit overflows to 0, the high bits increment.
       */
      HW3_sim_M->Timing.clockTick1++;
      if (!HW3_sim_M->Timing.clockTick1) {
        HW3_sim_M->Timing.clockTickH1++;
      }
    }
  }                                    /* end MajorTimeStep */
}

/* Derivatives for root system: '<Root>' */
void HW3_sim_derivatives(void)
{
  XDot_HW3_sim_T *_rtXdot;
  _rtXdot = ((XDot_HW3_sim_T *) HW3_sim_M->derivs);

  /* Derivatives for StateSpace: '<Root>/Plant' */
  _rtXdot->Plant_CSTATE[0] = 0.0;
  _rtXdot->Plant_CSTATE[1] = 0.0;
  _rtXdot->Plant_CSTATE[2] = 0.0;
  _rtXdot->Plant_CSTATE[3] = 0.0;
  _rtXdot->Plant_CSTATE[0] += HW3_sim_P.Plant_A[0] * HW3_sim_X.Plant_CSTATE[0];
  _rtXdot->Plant_CSTATE[1] += HW3_sim_P.Plant_A[1] * HW3_sim_X.Plant_CSTATE[2];
  _rtXdot->Plant_CSTATE[2] += HW3_sim_P.Plant_A[2] * HW3_sim_X.Plant_CSTATE[0];
  _rtXdot->Plant_CSTATE[2] += HW3_sim_P.Plant_A[3] * HW3_sim_X.Plant_CSTATE[1];
  _rtXdot->Plant_CSTATE[2] += HW3_sim_P.Plant_A[4] * HW3_sim_X.Plant_CSTATE[2];
  _rtXdot->Plant_CSTATE[3] += HW3_sim_P.Plant_A[5] * HW3_sim_X.Plant_CSTATE[1];
  _rtXdot->Plant_CSTATE[0] += HW3_sim_P.Plant_B * HW3_sim_B.FeedbackGain;
}

/* Model initialize function */
void HW3_sim_initialize(void)
{
  /* Registration code */

  /* initialize non-finites */
  rt_InitInfAndNaN(sizeof(real_T));

  /* initialize real-time model */
  (void) memset((void *)HW3_sim_M, 0,
                sizeof(RT_MODEL_HW3_sim_T));

  {
    /* Setup solver object */
    rtsiSetSimTimeStepPtr(&HW3_sim_M->solverInfo, &HW3_sim_M->Timing.simTimeStep);
    rtsiSetTPtr(&HW3_sim_M->solverInfo, &rtmGetTPtr(HW3_sim_M));
    rtsiSetStepSizePtr(&HW3_sim_M->solverInfo, &HW3_sim_M->Timing.stepSize0);
    rtsiSetdXPtr(&HW3_sim_M->solverInfo, &HW3_sim_M->derivs);
    rtsiSetContStatesPtr(&HW3_sim_M->solverInfo, (real_T **)
                         &HW3_sim_M->contStates);
    rtsiSetNumContStatesPtr(&HW3_sim_M->solverInfo,
      &HW3_sim_M->Sizes.numContStates);
    rtsiSetNumPeriodicContStatesPtr(&HW3_sim_M->solverInfo,
      &HW3_sim_M->Sizes.numPeriodicContStates);
    rtsiSetPeriodicContStateIndicesPtr(&HW3_sim_M->solverInfo,
      &HW3_sim_M->periodicContStateIndices);
    rtsiSetPeriodicContStateRangesPtr(&HW3_sim_M->solverInfo,
      &HW3_sim_M->periodicContStateRanges);
    rtsiSetErrorStatusPtr(&HW3_sim_M->solverInfo, (&rtmGetErrorStatus(HW3_sim_M)));
    rtsiSetRTModelPtr(&HW3_sim_M->solverInfo, HW3_sim_M);
  }

  rtsiSetSimTimeStep(&HW3_sim_M->solverInfo, MAJOR_TIME_STEP);
  HW3_sim_M->intgData.y = HW3_sim_M->odeY;
  HW3_sim_M->intgData.f[0] = HW3_sim_M->odeF[0];
  HW3_sim_M->intgData.f[1] = HW3_sim_M->odeF[1];
  HW3_sim_M->intgData.f[2] = HW3_sim_M->odeF[2];
  HW3_sim_M->contStates = ((X_HW3_sim_T *) &HW3_sim_X);
  rtsiSetSolverData(&HW3_sim_M->solverInfo, (void *)&HW3_sim_M->intgData);
  rtsiSetSolverName(&HW3_sim_M->solverInfo,"ode3");
  rtmSetTPtr(HW3_sim_M, &HW3_sim_M->Timing.tArray[0]);
  rtmSetTFinal(HW3_sim_M, 0.5);
  HW3_sim_M->Timing.stepSize0 = 0.01;

  /* Setup for data logging */
  {
    static RTWLogInfo rt_DataLoggingInfo;
    rt_DataLoggingInfo.loggingInterval = NULL;
    HW3_sim_M->rtwLogInfo = &rt_DataLoggingInfo;
  }

  /* Setup for data logging */
  {
    rtliSetLogXSignalInfo(HW3_sim_M->rtwLogInfo, (NULL));
    rtliSetLogXSignalPtrs(HW3_sim_M->rtwLogInfo, (NULL));
    rtliSetLogT(HW3_sim_M->rtwLogInfo, "tout");
    rtliSetLogX(HW3_sim_M->rtwLogInfo, "");
    rtliSetLogXFinal(HW3_sim_M->rtwLogInfo, "");
    rtliSetLogVarNameModifier(HW3_sim_M->rtwLogInfo, "rt_");
    rtliSetLogFormat(HW3_sim_M->rtwLogInfo, 4);
    rtliSetLogMaxRows(HW3_sim_M->rtwLogInfo, 0);
    rtliSetLogDecimation(HW3_sim_M->rtwLogInfo, 1);
    rtliSetLogY(HW3_sim_M->rtwLogInfo, "");
    rtliSetLogYSignalInfo(HW3_sim_M->rtwLogInfo, (NULL));
    rtliSetLogYSignalPtrs(HW3_sim_M->rtwLogInfo, (NULL));
  }

  /* block I/O */
  (void) memset(((void *) &HW3_sim_B), 0,
                sizeof(B_HW3_sim_T));

  /* states (continuous) */
  {
    (void) memset((void *)&HW3_sim_X, 0,
                  sizeof(X_HW3_sim_T));
  }

  /* states (dwork) */
  (void) memset((void *)&HW3_sim_DW, 0,
                sizeof(DW_HW3_sim_T));

  /* Matfile logging */
  rt_StartDataLoggingWithStartTime(HW3_sim_M->rtwLogInfo, 0.0, rtmGetTFinal
    (HW3_sim_M), HW3_sim_M->Timing.stepSize0, (&rtmGetErrorStatus(HW3_sim_M)));

  /* InitializeConditions for StateSpace: '<Root>/Plant' */
  HW3_sim_X.Plant_CSTATE[0] = HW3_sim_P.x0[0];
  HW3_sim_X.Plant_CSTATE[1] = HW3_sim_P.x0[1];
  HW3_sim_X.Plant_CSTATE[2] = HW3_sim_P.x0[2];
  HW3_sim_X.Plant_CSTATE[3] = HW3_sim_P.x0[3];
}

/* Model terminate function */
void HW3_sim_terminate(void)
{
  /* (no terminate code required) */
}
