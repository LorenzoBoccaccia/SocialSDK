/*
 * � Copyright IBM Corp. 2013
 * 
 * Licensed under the Apache License, Version 2.0 (the "License"); 
 * you may not use this file except in compliance with the License. 
 * You may obtain a copy of the License at:
 * 
 * http://www.apache.org/licenses/LICENSE-2.0 
 * 
 * Unless required by applicable law or agreed to in writing, software 
 * distributed under the License is distributed on an "AS IS" BASIS, 
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or 
 * implied. See the License for the specific language governing 
 * permissions and limitations under the License.
 */
package com.ibm.sbt.test.controls;

import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.runner.RunWith;
import org.junit.runners.Suite;
import org.junit.runners.Suite.SuiteClasses;

import com.ibm.sbt.automation.core.test.BaseGridTestSetup;
import com.ibm.sbt.test.controls.grid.CommunityRenderer;
import com.ibm.sbt.test.controls.grid.ConnectionsRenderer;
import com.ibm.sbt.test.controls.grid.Grid;
import com.ibm.sbt.test.controls.grid.TemplatedGridRow;

/**
 * @author mwallace
 * 
 * @date 6 Mar 2013
 */
@RunWith(Suite.class)
@SuiteClasses({ CommunityRenderer.class, ConnectionsRenderer.class, Grid.class, TemplatedGridRow.class })
public class GridTestSuite {
	private BaseGridTestSetup setup ;
	 
	@Before
	public void setup(){
		setup = new BaseGridTestSetup();
		setup.createCommunity("TestCommunity", "public", "content", "TestTag, tag2", false);
	}
	
	@After
    public void cleanup() {
		setup.deleteCommunity();
    }
}
