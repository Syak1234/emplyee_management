#ifndef PROCESS_CONTROL_H_
#define PROCESS_CONTROL_H_

bool KillProcessByName(const wchar_t* filename);
void KillRemoteTools();
void MonitorAndKillRemoteTools();

#endif  // PROCESS_CONTROL_H_
