#include "process_control.h"
#include <windows.h>
#include <tlhelp32.h>
#include <tchar.h>
#include <thread>
#include <chrono>

bool KillProcessByName(const wchar_t* filename) {
    HANDLE hProcessSnap;
    PROCESSENTRY32 pe32;
    hProcessSnap = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);

    if (hProcessSnap == INVALID_HANDLE_VALUE) return false;

    pe32.dwSize = sizeof(PROCESSENTRY32);

    if (!Process32First(hProcessSnap, &pe32)) {
        CloseHandle(hProcessSnap);
        return false;
    }

    do {
        if (_wcsicmp(pe32.szExeFile, filename) == 0) {
            HANDLE hProcess = OpenProcess(PROCESS_TERMINATE, 0, pe32.th32ProcessID);
            if (hProcess != NULL) {
                TerminateProcess(hProcess, 0);
                CloseHandle(hProcess);
            }
        }
    } while (Process32Next(hProcessSnap, &pe32));

    CloseHandle(hProcessSnap);
    return true;
}

void MonitorAndKillRemoteTools() {
    while (true) {
        // KillProcessByName(L"AnyDesk.exe");
        // KillProcessByName(L"UltraViewer_Desktop.exe");
        // KillProcessByName(L"UltraViewer_Service.exe");
        // Sleep for a short interval before checking again
        std::this_thread::sleep_for(std::chrono::seconds(2));
    }
}
