Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 151F9B9D4A6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Sep 2025 05:11:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:To:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3wJvkOpjKN8BoNZE7SBMbepOYkGWdbHcVSq2lNRXJ8s=; b=Bfz5jca8/b5cB7XcyDufsSGyQg
	JGJsX+5eCJgN4KitjakM0Vt4DI0szuXcDE0IFJuwflJGIumQqhJBBqyN+ihQyUcl9oWvU0DEvtSeB
	0g+qDeT2uheMGvqpsAIc4+Q9EHXRK+lQ6xF07TnCXN04581NZnZttRlZOGaYS52kdmVY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v1cOT-0007Ln-5N;
	Thu, 25 Sep 2025 03:11:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Ashish.Kalra@amd.com>) id 1v1cOR-0007Le-6v
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Sep 2025 03:11:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=suh4C75ktQKXPgZ1yuZpuqhdixVMXh0SuYK+jegbXWI=; b=cMIbwuhutYz5sFeU0pYXtyyae1
 pM+2O+uph1ZR8COgcxjyTC/9AEll6pM8NNsK4g4rPSanjyC7udNmtVhSHIma4Ul1XIRX0bzH8hNX+
 GShKf8yFEVOYpdHa66I58Y6KBYiY7VAVUYEglYh6hSTXwPVK3Qa60qbJnarIv/aPl7yw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=suh4C75ktQKXPgZ1yuZpuqhdixVMXh0SuYK+jegbXWI=; b=KZ5XWyf69+ZvoIyxsgTPhkQxLK
 iP23ki+3KNvHbY2Tp+ZT3KEKH2JMGFdf4PkPaTI/U3ubQUSUA1M9azVbQGte0X4VTfvOBPLR261Vn
 3RkJTnr8GOP3UFvMtjZB+GwG1zJpzffSDOTjeQFTOuPMi4ghKc+YvOXzs5J5bvoxekr0=;
Received: from mail-centralusazon11011022.outbound.protection.outlook.com
 ([52.101.62.22] helo=DM5PR21CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v1cOQ-0003iN-JK for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Sep 2025 03:11:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wVt84lDl6Yjq5Qa1UTUN7JGeY489oJGgjIPHP/fp+001Q0+xpMg/ay/3Dxkq5LrvBPaoxzggg83euLbjN7KRqdQ+hh3HpXJfzRoepVQsTh91HeTuIdy8VYpGpBS1S/5yXS0KHi2oV99+qHxQwstdJ/2Z7YSXJq3M31TuQcy1B15/H6qDJnPyGxiu/85ij+x5ZYgISka4YghukGTJ5z6BPYSF/TS/7G+QKuPy4EIWOzA3zhm1ZBgh83QEEWwfrExrpwUzwIB+YwGwGS2N/bPXvDyAbyYm9gfN8wy6F0NXv2pDz+YhIwIiS3r1Gk3eEN+mWyIiSZDRr9VRH4wnqTzeJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=suh4C75ktQKXPgZ1yuZpuqhdixVMXh0SuYK+jegbXWI=;
 b=Of88vWkIxB0v9qHIlvNtCXoWQvSYjgGy8qRkn0wZ0bvE7j6Qj9G4cokw7queE4YgF4Z8LQX4ILbHi6HKsmtf7mEWo0zbAdRjDGpPNp73zVS5xx3foGAhWRWOjYgdwEdXljsgQzI+AM/s5NXVkZa9ueGEdlfo9w+vsdW+E8s1iaSQaF391pHZsHO8Yr7jFeAcH22R+0UzxyWhh76ItKdBklSiLGKd2B4P4q0L8aXOOKofOaahDQkrR8td399HMoBCuwIBD1lu8oG4yKChJFss6X9elNO9md2CPCcHr17qWb2yXJme3PrQUAUhAPcbQ29CG2OolgfEzoY6ai8v8byCrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=suh4C75ktQKXPgZ1yuZpuqhdixVMXh0SuYK+jegbXWI=;
 b=1RJUEe3GdJNGQwsfmz3Eid8db/tmjSumgINLFfsQnm3hPAIAxlwX1lTaacbLQb/OfXnuAxhAo7DsW7R21ziysI7vFXyHqxuuN//XLyZ3my4cYmcYYerijT24ASpIEFwtw8uFQXAV9eVLnceRbGn5VAlZlb0+SqngSTCSAXmXC94=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL3PR12MB9049.namprd12.prod.outlook.com (2603:10b6:208:3b8::21)
 by CY5PR12MB6202.namprd12.prod.outlook.com (2603:10b6:930:25::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.9; Wed, 24 Sep
 2025 20:35:19 +0000
Received: from BL3PR12MB9049.namprd12.prod.outlook.com
 ([fe80::ae6a:9bdd:af5b:e9ad]) by BL3PR12MB9049.namprd12.prod.outlook.com
 ([fe80::ae6a:9bdd:af5b:e9ad%5]) with mapi id 15.20.9160.008; Wed, 24 Sep 2025
 20:35:19 +0000
Message-ID: <b4abbdfa-8a4e-4c2b-a979-f940fcab37aa@amd.com>
Date: Wed, 24 Sep 2025 15:35:12 -0500
User-Agent: Mozilla Thunderbird
To: David Hildenbrand <david@redhat.com>, Shivank Garg <shivankg@amd.com>,
 willy@infradead.org, akpm@linux-foundation.org, pbonzini@redhat.com,
 shuah@kernel.org, seanjc@google.com, vbabka@suse.cz
References: <20250827175247.83322-2-shivankg@amd.com>
 <1b01ebab-a43e-4344-ae38-50f0a031332f@redhat.com>
Content-Language: en-US
In-Reply-To: <1b01ebab-a43e-4344-ae38-50f0a031332f@redhat.com>
X-ClientProxiedBy: SA1P222CA0058.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::9) To BL3PR12MB9049.namprd12.prod.outlook.com
 (2603:10b6:208:3b8::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR12MB9049:EE_|CY5PR12MB6202:EE_
X-MS-Office365-Filtering-Correlation-Id: 67873eba-aa38-473e-a5ab-08ddfba9e069
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Vm5Zek5iRFhtb3lHS3hSYktBbWt4SUlMeFRJZnFEc3pEdFhLaCtQdjZmT0Ru?=
 =?utf-8?B?TXZCQ085QmpGNm1uRWdMMTFBOEFhd3Z6c0hqN1V4T1pKYk9Qb1pwdkZ6UWFk?=
 =?utf-8?B?YlFQWnFwREVwRnUxY0pOTTZGZDJNUlJobFRrbTVhS2MyL3pNbjJtL1hueFV6?=
 =?utf-8?B?MnNRL1VVejFhQ0lURVJkdmRaYm9OdHk0Mm8vdVVNZWFtbDRIdVUvL1Jwek1Y?=
 =?utf-8?B?STJCZVNIS2JIOHNNL0Vxd1RESzhiUUNKeUtBQ2dUNU9xYk9UMS81ajdDZWhP?=
 =?utf-8?B?NDdKOVRGRTNiakZYaEJ5bHNOTGdKUUJVbkNobENsaUNCMmtlYkRxWDJORkdz?=
 =?utf-8?B?Vzk3M1FiZ3JKcGZmc3ZXWlBWUC9KYnoyU2hSeU01dVR3RlMrRjIvdWFJSXNx?=
 =?utf-8?B?R1dhcDVOMjNVam03N3lyUG1jd2I1LzdHQjZyWWRHYnJxWFByM1V3TVVpU0pp?=
 =?utf-8?B?aXBGaEhaUzFMNzI4S3dPMzB4ZjdsYktEaDJDNTNlaFhwUXo3WlJGSk1Xcmcr?=
 =?utf-8?B?Z0hYU1k0SEQ0a0hJcXdMSk41d0RpTVNQNmpwOWNMN0h4UWY1OG1jMkJ4SUJ5?=
 =?utf-8?B?M0JaZXZsejUxSnc2SGoyL1pYdjRsNkp5RDR5bDFZRU5iOVJyU3hYUVl2ZDhu?=
 =?utf-8?B?ZmlRZmhJN3ZEazJnSVJvbnRyR1l4cUljWjVlVVNleGFSbnNWWG1zQytMb25B?=
 =?utf-8?B?OGxpYkUwRXU3aTJEbndkSTZrQXgzREpUd0V6UE5ON2oyLytrMkpObnlSN2tk?=
 =?utf-8?B?S2plcGFUZ3FSaTQ2VTMwdzlockhpTzFxUm8yR2NjV1F5RDNKZW5naGg1dERu?=
 =?utf-8?B?cHZwZkhKd04zdGZMVjFTVXB6aXBvektRNk9iZ1N3NEZwczBJYis4dDgxWm9J?=
 =?utf-8?B?Y3Myd0h5NnhBSVlMUHAxcTllRmtTY2tGVmhNYXFHd1Rad0tmVTR1ZDE3TEhz?=
 =?utf-8?B?YTViNi92ME44dXA3alQyYmxZZTlTcmxlT1hUa1lwM3lkNllNQTlrMzQzdEJz?=
 =?utf-8?B?cjQydjdlUXZzZzJBVWFkZFhZRFY5dGNKZUZCbFdZeDQ1ZVBieXFZWGt5Z2g3?=
 =?utf-8?B?NEVzWi9QeW1IcnVZUldhQTJKVzhJQzZHSURPMzdXMlNNb2lpdENoSzVCS212?=
 =?utf-8?B?YTl3aDd6Z092T3FiVXZuTXFWUlkyOUN1L2tZSFRmUjdkZWRnTTB3V3lmdFNB?=
 =?utf-8?B?MHVLcjk5M01GVGNLbCt0bmJtU3BKaHVNLy9FVjVqVGM3R2NvcGRxeFFFb3Nl?=
 =?utf-8?B?NW51ajNSZWNiTkN1ZmkvRk9yOW5FK2xOK29aYUJLeVlJMzVIbU5NaHlMN05P?=
 =?utf-8?B?RGJPZkRsWWhCcVpKSGlvRmhBcjUzTHFDTE9pTlgvR3JXeWIwZnNseW15SHlY?=
 =?utf-8?B?eG1oTWJFdE8xUmR5amd2Y0JNMlVlaHNnWnp2Y0drVVlvdkphcXNETXdmeUE3?=
 =?utf-8?B?Vi9ET2VrK29nZFZJR215bmVTYzgrWS8zd3NndXhON3pZZ3E1c3FkYk9XS29w?=
 =?utf-8?B?MFFmRUd0OC9yTGxPYk5EREdnUGtTN01tWFcyMkNwYXFhNnZmU3lhNC9NYWJG?=
 =?utf-8?B?NklZUGRtUUVNREM3UnVlZUFjQTFUNS9XaFFFVGJyL3lTM0dHeXc4UVpzemJk?=
 =?utf-8?B?aVdCMHdMRkczWlVZWTQxZTNjeTRYd0xlY1NXMk9Fb2tXa2h3RGlWVmpJSWR3?=
 =?utf-8?B?NHVRZnBhWEJ0M3IrTHBxNzNVK01sdlJJSkFBNnJBNTdlbkphQU56Wm9tVE9r?=
 =?utf-8?B?UHE3MWhUNzJlT3ZONVc2Z3BYOGJxcnBPNWVtclhybGJzZ3RRYUN3MGhMUWZP?=
 =?utf-8?B?bzV3S0VWZ0Y5dURTVmpmT2FUcE5NdHVrRHVRcFlVOFQ1ZEl2UzFiY0JMbFJw?=
 =?utf-8?B?ajBOWXdNM0NIc1BvMXFRalZrOG5RY1AzL1ZmVkREMFJzeTBnb09uUHozS0dY?=
 =?utf-8?Q?Cd8iQK1pkUk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR12MB9049.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cWduQjJnTzRLVjU5eVpGd0xUdVVWQzcwZk0vMEdsMWxVY010b1BMRnJkWXZk?=
 =?utf-8?B?ZG8ycitFbnBZVERpQ2J4VjRqbjdpY2NmRXZKZjhEM1Q2MXBVekNFQ2ZkR2lP?=
 =?utf-8?B?Yk9rYmRMQmdJOEdzb28zQUQwRGFxUVpaaUtnY0lDNHh2K014WFlyaGY4TFpP?=
 =?utf-8?B?VU5Nc1FSbTcrMkNJdW5CUm16Yk54M2FseUZGclZFR1RGUXUveFFOZmVHcnBa?=
 =?utf-8?B?NTg1NHI3TVJZbm1semh5Z0VSSGVnd1dHYTNjUnJ1OUdCS1FsSlU3d3FTK0tB?=
 =?utf-8?B?OGJwM2JmbVZjOW1wZjFVOERuc2RMYzVVUm1Fb2MwZVE3bER0NjJrRVkwblhz?=
 =?utf-8?B?ekpVaXZLdkx5SjhFcTdEL2tHZmU1UkE1VHNSdE5tcEJLVldwNS85M3BTcDhF?=
 =?utf-8?B?T3F5UXJXMVRxbEp0c0c3ZG4zUnk5ZDA0U2QwMXIxQjhSNXk4ZDRxcjlEWXNV?=
 =?utf-8?B?eUpGeERCSDNTVGorT09oNnZuMnh2ekwzckJjNHltS2VPWHZEbzEybk10S2pz?=
 =?utf-8?B?R3lBTjM4Q0g3dU5KWkVUR0ZXU1RyNEpzUVhVZG5iUmY1OFVwaVBPV1d4Wm9V?=
 =?utf-8?B?aFpTVThadktIK0d5VjVzS28vRDIzTUY5TENWaEx5N3FneFJWK05YNGdqRXQv?=
 =?utf-8?B?bG1ydUk5amdHQVRadXpKbzFobFl0VCt3Umtrdks4eFcvTnJsa1ljL0k2UWp3?=
 =?utf-8?B?L080L3FsVFEra0JuRlhWY3RUM0RmT2hCNVVzamFGOGJGZ1FydFhrMTVvQWRQ?=
 =?utf-8?B?V01RV1Z4U1FLREN0cVJleHF3cG9WejN6QjhkZTFjMmtuYTlBWVg0UklsaWdM?=
 =?utf-8?B?eFo4NjdqamJGSGRlNFlOSTlpbkVwbUlsKzFNYmNGQ0d4eUpvNmsyUVRXSFo0?=
 =?utf-8?B?c2FHUFo3aHJXQzNXblBaUTBDY1ZlNi9xZ0VYV1h4alZRV1d2NzQvc01rbXBh?=
 =?utf-8?B?NUF6L2FQV25QdXgrR1o5emFtKzZ6Mzc3M0M1TUU1akxhYms4S2hZVnBjUEJ0?=
 =?utf-8?B?bUpJWDZTdHd2ZXVNb2NHcmhxbzU3UW1WZnUyR2pSN1YrSGhyckt2dTJZa3Zx?=
 =?utf-8?B?bS9LTFBDdUVHNWJ0MEpKQkFxT01hTU1kcEFWcll3cmYrRnJhOFg1MjR5QWxB?=
 =?utf-8?B?dXFPeTVFc3FiOXdDSzk5cDlkczM5T2dQTFl6YUM5Z1IrSEZ5N1JBZldob3FG?=
 =?utf-8?B?UG15cCtvbXJjT3FzTnVFWW5CcklURXdpeGhud0RqTUIwaU8xbDd5RmZ3dk4v?=
 =?utf-8?B?d2NXa0tkVFdKWEVLSUp2dGd5SS9kNmVnNFFLb2d2WExZNkNjM2s2TWdBcW1v?=
 =?utf-8?B?MWxrMkxQSURlaHA5dlR1VWFaajRKZy9GTis5d05UOUpjeHVkbGwvMGt2SXpU?=
 =?utf-8?B?eFowcWVuUkozTTNYOGFvay9ham0ybFBZWCtWUTNIMEh0OW9ZcFJjbnZrd0Vt?=
 =?utf-8?B?clJXK296eEpwZ1NadW1vTE0xOVVWUG0xK0Joa3VpaTBhVC9UaXdpYVpVeEx3?=
 =?utf-8?B?WUFMajY3WnduZFU3RGJNUHlBaU1KM2lmcUYvclV3VkZTSnE5VzlyZTV6dDA3?=
 =?utf-8?B?ZERuYnozYVRzbEpqb2g0MkY5bUIzcC9lWWJvM21RZE5PckoraXNINThjV3E2?=
 =?utf-8?B?dU02M3lNcXVOeXZNcWVDb2lRNnMxYjVla0tVQ3FRRTVSMlRiR2lkM0xpSktJ?=
 =?utf-8?B?bHJpNGpsNzNRWHpPQUF4eUJYUktFZDZnR3lrYnQvUzJ5RzAwcS9hL01Hc29x?=
 =?utf-8?B?TjlNd09BRnFtbWhmZU85Ym9sWHdMam1jWm5RRUZzL1RtcmZuUnpjdkd0QU5V?=
 =?utf-8?B?VGhIUy9KMk9SMXFCRXByZU1aTFhUb3JsMnh1Yi9Vd3QvcjdiRm4vdW1mTDRi?=
 =?utf-8?B?NTE0RFcvQVVuU0ZGOUt6RmJlUktlTVFjMWJSUjUyRU9yVnJWNlVNKyt2V1hs?=
 =?utf-8?B?RThTUHRiWWorM2hRdmJGaGs2OENTWXZZNVA4aG1IYmxrUVpLdk5OYVdlNDhq?=
 =?utf-8?B?Q2t1bElSNjJ6cXlwZ0x3NWc2WVd6OW1VTU5KSzhxWFJ5SjBpeFJtTVQ1L2h3?=
 =?utf-8?B?cUt6R1JYMGFHWXJOTWRmNkZJUHIzY2ZyY085YUpkTDN4c21jNmtsb09LbUp2?=
 =?utf-8?Q?ijPlpT+Il+LaYH0egt/5hcJhE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 67873eba-aa38-473e-a5ab-08ddfba9e069
X-MS-Exchange-CrossTenant-AuthSource: BL3PR12MB9049.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2025 20:35:19.2546 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kCMTo9GysLar1J+9LclyPYzGP96O5SNYNpl7u87iacJi4hyw0At1cN/aJ00a+jZZgfH+dD7PnvBknB1WgEqj5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6202
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Tested the patch series by auditing the actual userspace
 (HVA)
 mappings and seeing if the corresponding physical PFNs correspond to the
 expected NUMA node. Enabled QEMU's kvm_set_user_memory tracepoint to dump
 the HVA/guest_memfd/guest_memfd_offset/base GPA/size. This helped determine
 the HVAs and the memslot that QEMU registers with KVM via the kvm_set_ [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.62.22 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v1cOQ-0003iN-JK
Subject: Re: [f2fs-dev] [PATCH kvm-next V11 0/7] Add NUMA mempolicy support
 for KVM guest-memfd
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
From: "Kalra,
 Ashish via Linux-f2fs-devel" <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Kalra, Ashish" <ashish.kalra@amd.com>
Cc: jgowans@amazon.com, mhocko@suse.com, jack@suse.cz, kvm@vger.kernel.org,
 dhavale@google.com, linux-btrfs@vger.kernel.org, aik@amd.com, papaluri@amd.com,
 kalyazin@amazon.com, peterx@redhat.com, linux-mm@kvack.org, clm@fb.com,
 ddutile@redhat.com, linux-kselftest@vger.kernel.org, shdhiman@amd.com,
 gshan@redhat.com, ying.huang@linux.alibaba.com, ira.weiny@intel.com,
 roypat@amazon.co.uk, matthew.brost@intel.com, linux-coco@lists.linux.dev,
 zbestahu@gmail.com, lorenzo.stoakes@oracle.com, linux-bcachefs@vger.kernel.org,
 apopple@nvidia.com, jmorris@namei.org, hch@infradead.org, chao.gao@intel.com,
 cgzones@googlemail.com, ziy@nvidia.com, rientjes@google.com, yuzhao@google.com,
 xiang@kernel.org, nikunj@amd.com, gourry@gourry.net, serge@hallyn.com,
 amit@infradead.org, thomas.lendacky@amd.com, pankaj.gupta@amd.com,
 chao.p.peng@intel.com, yan.y.zhao@intel.com, byungchul@sk.com,
 michael.day@amd.com, Neeraj.Upadhyay@amd.com, michael.roth@amd.com,
 bfoster@redhat.com, bharata@amd.com, josef@toxicpanda.com,
 Liam.Howlett@oracle.com, ackerleytng@google.com, dsterba@suse.com,
 viro@zeniv.linux.org.uk, jefflexu@linux.alibaba.com, jaegeuk@kernel.org,
 dan.j.williams@intel.com, surenb@google.com, tabba@google.com,
 paul@paul-moore.com, joshua.hahnjy@gmail.com, brauner@kernel.org,
 quic_eberman@quicinc.com, rakie.kim@sk.com, pvorel@suse.cz,
 linux-erofs@lists.ozlabs.org, kent.overstreet@linux.dev,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-security-module@vger.kernel.org, lihongbo22@huawei.com,
 linux-fsdevel@vger.kernel.org, vannapurve@google.com, suzuki.poulose@arm.com,
 rppt@kernel.org, jgg@nvidia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Tested the patch series by auditing the actual userspace (HVA) mappings and seeing if the
corresponding physical PFNs correspond to the expected NUMA node.

Enabled QEMU's kvm_set_user_memory tracepoint to dump the HVA/guest_memfd/guest_memfd_offset/base GPA/size.
This helped determine the HVAs and the memslot that QEMU registers with KVM via the kvm_set_user_memory_region() helper.

After that dumped the PFNs getting mapped into the guest for a particular GPA via enabling the
kvm_mmu_set_spte kernel trace events, performed the GPA->memslot->HVA mapping (via QEMU traces above) and then looked in 
/proc/<qemu_pid>/numa_maps to validate the HVA is bound to the NUMA node associated with that memslot/guest_memfd.
 
Additionally, looked up the PFN (from kernel traces) in /proc/zoneinfo to validate that the physical page belongs to the
NUMA node associated with the memslot/guest_memfd.


This testing/validation is based on the following trees:

Host Kernel: 

https://github.com/AMDESE/linux/commits/snp-hugetlb-v2-wip0/

This tree is based on commit 27cb583e25d0 from David Hildenbrand's guestmemfd_preview tree
(which already includes base mmap support) with Google's HugeTLB v2 patches rebased on top of those
(which include both in-place conversion and hugetlb infrastructure), along with additional
patches to enable in-place conversion and hugetlb for SNP.

QEMU:

https://github.com/AMDESE/qemu/commits/snp-hugetlb-dev-wip0/
   
QEMU command line used for testing/validation:

qemu-system-x86_64 --enable-kvm -object sev-snp-guest,id=sev0,cbitpos=51,reduced-phys-bits=1,convert-in-place=true
-object memory-backend-memfd,id=ram0,host-nodes=0,policy=bind,size=150000M,prealloc=false 
-numa node,nodeid=0,memdev=ram0,cpus=0-31,cpus=64-95 
-object memory-backend-memfd,id=ram1,host-nodes=1,policy=bind,size=150000M,prealloc=false
-numa node,nodeid=1,memdev=ram1,cpus=32-63,cpus=96-127 

(guest NUMA configuration mapped 1:1 to host NUMA configuration).

Tested-by: Ashish Kalra <ashish.kalra@amd.com>

Thanks,
Ashish

On 9/24/2025 1:19 PM, David Hildenbrand wrote:
> On 27.08.25 19:52, Shivank Garg wrote:
>> This series introduces NUMA-aware memory placement support for KVM guests
>> with guest_memfd memory backends. It builds upon Fuad Tabba's work (V17)
>> that enabled host-mapping for guest_memfd memory [1] and can be applied
>> directly applied on KVM tree [2] (branch kvm-next, base commit: a6ad5413,
>> Merge branch 'guest-memfd-mmap' into HEAD)
>>
> 
> Heads-up: I'll queue this (incl. the replacement patch for #4 from the reply) and send it tomorrow as a PR against kvm/next to Paolo.
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
