/*
    Copyright 2017 Zheyong Fan, Ville Vierimaa, Mikko Ervasti, and Ari Harju
    This file is part of GPUMD.
    GPUMD is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.
    GPUMD is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.
    You should have received a copy of the GNU General Public License
    along with GPUMD.  If not, see <http://www.gnu.org/licenses/>.
*/

#pragma once

class Box;
class Neighbor;
class Group;
#include "utilities/gpu_vector.cuh"
#include <vector>

void initialize_position(
  char* input_dir,
  int& N,
  int& has_velocity_in_xyz,
  int& number_of_types,
  Box& box,
  Neighbor& neighbor,
  std::vector<Group>& group,
  std::vector<int>& cpu_type,
  std::vector<int>& cpu_type_size,
  std::vector<double>& cpu_mass,
  std::vector<double>& cpu_position_per_atom,
  std::vector<double>& cpu_velocity_per_atom);

void allocate_memory_gpu(
  const int N,
  Neighbor& neighbor,
  std::vector<Group>& group,
  std::vector<int>& cpu_type,
  std::vector<double>& cpu_mass,
  std::vector<double>& cpu_position_per_atom,
  GPU_Vector<int>& type,
  GPU_Vector<double>& mass,
  GPU_Vector<double>& position_per_atom,
  GPU_Vector<double>& velocity_per_atom,
  GPU_Vector<double>& potential_per_atom,
  GPU_Vector<double>& force_per_atom,
  GPU_Vector<double>& virial_per_atom,
  GPU_Vector<double>& heat_per_atom,
  GPU_Vector<double>& thermo);
