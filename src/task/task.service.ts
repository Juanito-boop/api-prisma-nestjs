// import { Injectable } from '@nestjs/common';
// import { tasks } from '@prisma/client';
// import { PrismaService } from 'src/prisma/prisma.service';

// @Injectable()
// export class TaskService {
//   constructor(private prisma: PrismaService) {}

//   async getAllTasks(): Promise<tasks[]> {
//     return this.prisma.tasks.findMany();
//   }

//   async getTaskByID(id: number): Promise<tasks> {
//     return this.prisma.tasks.findUnique({
//       where: {
//         id: id,
//       },
//     });
//   }

//   async createTask(data: tasks): Promise<tasks> {
//     return this.prisma.tasks.create({
//       data,
//     });
//   }

//   async updateTask(id: number, data: tasks): Promise<tasks> {
//     return this.prisma.tasks.update({
//       where: {
//         id: id,
//       },
//       data,
//     });
//   }

//   async deleteTask(id: number): Promise<tasks> {
//     return this.prisma.tasks.delete({
//         where: {
//             id: id,
//         },
//     });
//   }
// }
