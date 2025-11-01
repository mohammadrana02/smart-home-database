Database Schema Description
This repository contains the Entity-Relationship Diagram (ERD) and SQL scripts for a Smart Home Management System database. The schema is designed to efficiently manage users, their homes, connected devices, and automation routines.

The core of the database is built around several key entities:

Users & Homes: Manages user accounts and associates them with their respective smart homes.

Devices & Sensors: Tracks all connected smart devices (like lights and thermostats) and their associated sensors, storing their types, statuses, and configurations.

Rooms: Organizes devices within the physical layout of a home.

Automations: Allows users to define custom automation rules (e.g., "turn on lights at sunset") that are triggered by specific conditions.

The relationships between these entities ensure data integrity and enable powerful features like user access control, device state history logging, and flexible automation scenarios.

