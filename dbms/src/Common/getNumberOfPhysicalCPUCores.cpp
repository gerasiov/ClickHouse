#include <Common/getNumberOfPhysicalCPUCores.h>
#include <thread>

#include <cpuinfo.h>

unsigned getNumberOfPhysicalCPUCores()
{
        uint32_t cores = 0;
        if (cpuinfo_initialize())
                cores = cpuinfo_get_cores_count();

        if (cores)
                return cores;
        else
                return std::thread::hardware_concurrency();
}
