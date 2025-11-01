# Smart Home Database Management System

A comprehensive database solution for managing smart home ecosystems, featuring user management, device tracking, automation rules, and real-time monitoring capabilities. This project demonstrates advanced database design principles and SQL implementation for IoT home automation systems.

## 🏠 Project Overview

This database system provides a robust foundation for smart home applications, enabling efficient management of users, devices, rooms, sensors, and automation rules. The system is designed to handle complex relationships between smart home components while maintaining data integrity and performance.

## 📊 Database Schema

### Core Entities
- **Users** - Home occupants and their profiles
- **Homes** - Property management and user associations  
- **Rooms** - Spatial organization of smart devices
- **Devices** - Smart home equipment (lights, thermostats, sensors, etc.)
- **Sensors** - Environmental and status monitoring devices
- **Automations** - Custom rules and triggers for device control
- **Device_Status** - Real-time state tracking
- **User_Devices** - Access control and permissions

### Key Relationships
- Users can own multiple homes with different access levels
- Rooms organize devices within specific home areas
- Sensors monitor environmental conditions and device states
- Automations create intelligent behaviors based on sensor data
- Real-time status tracking for all connected devices

## 🛠️ Technical Implementation

### Database Technologies
- **Database System**: MySQL
- **Design Tools**: ERD (Entity Relationship Diagram)
- **File Format**: SQL scripts for easy deployment

### Key Features
- **Normalized Database Design** - 3NF compliance for data integrity
- **Complex Relationships** - Many-to-many and hierarchical relationships
- **Automation Engine** - Rule-based device control system
- **Access Control** - User-level device permissions
- **Real-time Monitoring** - Continuous status tracking
- **Scalable Architecture** - Supports multiple homes and users
