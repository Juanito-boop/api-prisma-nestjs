// import {
//   Body,
//   Controller,
//   Delete,
//   Get,
//   NotFoundException,
//   Param,
//   Post,
//   Put,
// } from '@nestjs/common';
// import { tasks } from '@prisma/client';
// import { TaskService } from './task.service';

// @Controller('tasks')
// export class TaskController {
//   constructor(private readonly taskService: TaskService) {}

//   @Get()
//   async getAllTasks() {
//     return this.taskService.getAllTasks();
//   }

//   @Get(':id')
//   async getTaskByID(@Param('id') id: string) {
//     const taskFound = await this.taskService.getTaskByID(Number(id));
//     if (!taskFound) throw new NotFoundException('Task not found!');
//     return taskFound;
//   }

//   @Post()
//   async createTask(@Body() data: tasks) {
//     return this.taskService.createTask(data);
//   }

//   @Delete(':id')
//   async deleteTask(@Param('id') id: string) {
//     try {
//       return await this.taskService.deleteTask(Number(id));
//     } catch (error) {
//       throw new NotFoundException('Task not found!');
//     }
//   }

//   @Put(':id')
//   async updateTask(@Param('id') id: string, @Body() data: tasks) {
//     try {
//       return await this.taskService.updateTask(Number(id), data);
//     } catch (error) {
//       throw new NotFoundException('Task not found!');
//     }
//   }
// }
