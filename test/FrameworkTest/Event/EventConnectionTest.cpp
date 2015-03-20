﻿// Copyright (c) 2013-2015 mogemimi.
// Distributed under the MIT license. See LICENSE.md file for details.

#include <Pomdog/Event/EventConnection.hpp>
#include <Pomdog/Event/Event.hpp>
#include <Pomdog/Event/EventHandler.hpp>
#include <gtest/iutest_switch.hpp>
#include <utility>

using Pomdog::Event;
using Pomdog::EventHandler;
using Pomdog::EventConnection;

TEST(EventConnection, Disconnect)
{
	EventHandler eventHandler;
	EventConnection connection;
	int count = 0;

	connection = eventHandler.Connect([&](Event const&) {
		++count;
	});
	
	eventHandler.Invoke<std::string>("event");
	EXPECT_EQ(1, count);
	eventHandler.Invoke<std::string>("event");
	EXPECT_EQ(2, count);
	eventHandler.Invoke<std::string>("event");
	EXPECT_EQ(3, count);
	
	connection.Disconnect();
	
	eventHandler.Invoke<std::string>("event");
	EXPECT_EQ(3, count);
}

TEST(EventConnection, CopyAssignmentOperator)
{
	EventHandler eventHandler;
	int count = 0;
	
	EventConnection connection1;
	{
		EventConnection connection2;
		
		connection2 = eventHandler.Connect([&](Event const&){
			++count;
		});
		
		eventHandler.Invoke<std::string>("event");
		EXPECT_EQ(1, count);
		
		connection1 = connection2;
	}
	
	eventHandler.Invoke<std::string>("event");
	EXPECT_EQ(2, count);
	
	connection1.Disconnect();
	
	eventHandler.Invoke<std::string>("event");
	EXPECT_EQ(2, count);
}

TEST(EventConnection, MoveAssignmentOperator)
{
	EventHandler eventHandler;
	int count = 0;
	
	EventConnection connection1;
	{
		EventConnection connection2;
		
		connection2 = eventHandler.Connect([&](Event const&){
			++count;
		});
		
		eventHandler.Invoke<std::string>("event");
		EXPECT_EQ(1, count);
		
		connection1 = std::move(connection2);
		
		eventHandler.Invoke<std::string>("event");
		EXPECT_EQ(2, count);
		
		connection2.Disconnect();
		
		eventHandler.Invoke<std::string>("event");
		EXPECT_EQ(3, count);
	}
	
	eventHandler.Invoke<std::string>("event");
	EXPECT_EQ(4, count);
	
	connection1.Disconnect();
	
	eventHandler.Invoke<std::string>("event");
	EXPECT_EQ(4, count);
}
