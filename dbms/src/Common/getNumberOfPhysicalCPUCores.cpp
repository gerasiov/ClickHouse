#include <Common/getNumberOfPhysicalCPUCores.h>
#include <thread>

#include <Common/config.h>

#if USE_CPUINFO
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
#else
unsigned getNumberOfPhysicalCPUCores()
{
	return std::thread::hardware_concurrency();
}
#endif
