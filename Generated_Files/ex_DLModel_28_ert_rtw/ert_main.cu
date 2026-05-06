//
// File: ert_main.cu
//
// Code generated for Simulink model 'ex_DLModel_28'.
//
// Model version                  : 12.4
// Simulink Coder version         : 25.2 (R2025b) 28-Jul-2025
// C/C++ source code generated on : Tue May  5 18:06:16 2026
//
// Target selection: ert.tlc
// Embedded hardware selection: ARM Compatible->ARM 64-bit (LP64)
// Code generation objectives: Unspecified
// Validation result: Not run
//
#include <stdio.h>
#include <stdlib.h>
#include "ex_DLModel_28.h"
#include "ex_DLModel_28_private.h"
#include "rtwtypes.h"
#include "limits.h"
#include "rt_nonfinite.h"
#include "MW_nvidia_init.h"
#include "linuxinitialize.h"
#define UNUSED(x)                      x = x

// Deep learning network
static addFPSModelClass::DeepLearning_ex_DLModel_28_T ex_DLModel_28_DeepLearning;
static addFPSModelClass ex_DLModel_28_Obj( &ex_DLModel_28_DeepLearning);// Instance of model class 

#define NAMELEN                        16

// Function prototype declaration
void exitFcn(int sig);
void *terminateTask(void *arg);
void *baseRateTask(void *arg);
void *subrateTask(void *arg);
volatile boolean_T stopRequested = false;
volatile boolean_T runModel = true;
sem_t stopSem;
sem_t baserateTaskSem;
pthread_t schedulerThread;
pthread_t baseRateThread;
void *threadJoinStatus;
int terminatingmodel = 0;
void *baseRateTask(void *arg)
{
  runModel = (ex_DLModel_28_Obj.getRTM()->getErrorStatus() == (NULL));
  while (runModel) {
    sem_wait(&baserateTaskSem);
    ex_DLModel_28_Obj.step();

    // Get model outputs here
    stopRequested = !((ex_DLModel_28_Obj.getRTM()->getErrorStatus() == (NULL)));
  }

  runModel = 0;
  terminateTask(arg);
  pthread_exit((void *)0);
  return NULL;
}

void exitFcn(int sig)
{
  UNUSED(sig);
  ex_DLModel_28_Obj.getRTM()->setErrorStatus("stopping the model");
  runModel = 0;
}

void *terminateTask(void *arg)
{
  UNUSED(arg);
  terminatingmodel = 1;

  {
    runModel = 0;
  }

  // Terminate model
  ex_DLModel_28_Obj.terminate();
  sem_post(&stopSem);
  return NULL;
}

int main(int argc, char **argv)
{
  UNUSED(argc);
  UNUSED(argv);
  ex_DLModel_28_Obj.getRTM()->setErrorStatus(0);

  // Initialize model
  ex_DLModel_28_Obj.initialize();

  // Call RTOS Initialization function
  myRTOSInit(0.05, 0);

  // Wait for stop semaphore
  sem_wait(&stopSem);

#if (MW_NUMBER_TIMER_DRIVEN_TASKS > 0)

  {
    int i;
    for (i=0; i < MW_NUMBER_TIMER_DRIVEN_TASKS; i++) {
      CHECK_STATUS(sem_destroy(&timerTaskSem[i]), 0, "sem_destroy");
    }
  }

#endif

  return 0;
}

//
// File trailer for generated code.
//
// [EOF]
//
