Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sFw5Lby6oGnClwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 22:27:24 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D44F01AFC66
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 22:27:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UXBzDxeB775qwId7kOocqKQ09eoDkg7VLvAVUMBeHDo=; b=PCHCck4tz90MwMTE0S6ASGfsKT
	gjGsBB62U23ahrZPNrRH3h0dG3S5tAFRSdbz7MmjWedAxLSeLYtataCjfyD55CL1uBSYdKPJx9dQl
	UGOkQgVq5xdLyUKDFPmVoxawiM+iUVM897Z74xqONq3bJ/l9AINVoyU2ciaqCcNZBLfI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvit9-0007kd-C2;
	Thu, 26 Feb 2026 21:27:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ziy@nvidia.com>) id 1vvit7-0007kO-UD
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Feb 2026 21:27:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7rM/1BmA+PZAWoZM5grA/Mjk0zRUV9ElpVm9qFatzyc=; b=lS7hD8Y3xFVVoB6xDpTzJAANKu
 3p7djr5y0Rsk6uJh3g8i+T4vqAmnLQ4GdG0Bwwq/h20eXHf5V9R9ZCbULJ81nOWafCBE4PWhHFjKM
 BXi426ilvEPxE5Mk1i0X6romhowAxxPPIJboN8iyZVwt7CqxTwFohVfkU6OPGgo0VtNI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7rM/1BmA+PZAWoZM5grA/Mjk0zRUV9ElpVm9qFatzyc=; b=fDSqMKhkL5XWCsLxP/Cda8Yudm
 Jk1khsUEWmEtYO8ALKD/GiYtIeRV03NCWJL75oEECr5vDj3gohCZhxD6bcgitl1WaXjtM9AgfU8CF
 n5rSBI5uTQiPKPwMfxxuu7ME/TRYPqDUY5j2AalDuB04zzgLPTKiah8k8eeGNWFqIuas=;
Received: from mail-westusazon11010040.outbound.protection.outlook.com
 ([52.101.85.40] helo=BYAPR05CU005.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvit8-0006F9-8y for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Feb 2026 21:27:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fUiRWSmT3BX68D7q9R1Kahv2QBfewkCN0MKvCGwzYhWbPezZdcQ1ecBQX9yoCCCYXlWJy+r1RpSzGTkBpcbXqmhGTECiI84Va0MgYffZIneMN/3AtIZfygNPWXXGBvDR1DyiIM6lNH6GGql8gPooc5sYXj0pZs4gFqdaGp3qphkJ9AefvGYj3iRzsJw+Nyhop/fPxdBtVNwd1SCjvxFgHT1Bh7ROGos8KOo919j0vTHmU0va02u94SXmD2ZIKuIJGtaWJ9CO3OwBP1cJ319+uTYIst/DVNXUqFCimTUqm+qSNSQLtWOHDAb7+9/+A9w0Lc1DYXSJW9VWBsPPNe1D2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7rM/1BmA+PZAWoZM5grA/Mjk0zRUV9ElpVm9qFatzyc=;
 b=Bn3SixIWutP1X/r+kR34ajeuJhte2lyxNX7+aQ/mcikfmMSDgWzC12XVFIQIKNREvZCAZu0uK54Zc6WsoUhSXoKuBcm9Hf/0Q+uCwbVeXdkbOFZ3AVmQwgS+hCF43tUm4Am0Gn7N+1RWo+wG7DDNWrdqiaS6HVFjciJERnmx27Ok6CM94eZnfSn9Bqdg5Psm2mvXxc0qD74nrUcq3OommbK7wJzUVXJa3I8bou4G2HBWYd3IIk8uyvVk5QBipS/g7/a5g893GO5TjR38O0s6GE7G5wOqtOUAtK411NwI++4Y7D6Kfv58chJaeUwJw6nbzJElUiQdNpy+Ikqx+7yTHg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7rM/1BmA+PZAWoZM5grA/Mjk0zRUV9ElpVm9qFatzyc=;
 b=NTzCbC4zK26Ou9M5vbmyA3i+fod1QpkDQOZMVWYat96ovvHpbMMqyjlPgdhPJmifcQF39OPaoovRQZ9YRnf7cyKwv7W+hZ2Ox+EfEh4SSX8fzF9YVP3qBqbdOotJfdv08I8Gr/URza5VwmVsj6LQlD/QVPm1pgs32hshRBoaTD0prFR/9pcddkIBDIT0VdRlvBR2vmFmC5YI8kpMuqGAHMKyeBVYiXhGZ1fQKk462Xl5Bp2dD6yE5U3tLBZJmKQyInXp7OfEloDEDAibHwP5oK378yWjiK7L4Fvx5k/o0rQ18cqYfEdk6kipYy+ZiJ49yLDSs0c5sPyAbel4JLYcYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 PH7PR12MB6860.namprd12.prod.outlook.com (2603:10b6:510:1b6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.14; Thu, 26 Feb
 2026 21:26:57 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 21:26:56 +0000
To: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 26 Feb 2026 16:26:42 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <9208B145-365D-4502-A97E-A88F19EC2EB7@nvidia.com>
In-Reply-To: <20260225-pagevec_cleanup-v2-3-716868cc2d11@columbia.edu>
References: <20260225-pagevec_cleanup-v2-0-716868cc2d11@columbia.edu>
 <20260225-pagevec_cleanup-v2-3-716868cc2d11@columbia.edu>
X-ClientProxiedBy: SJ0PR05CA0163.namprd05.prod.outlook.com
 (2603:10b6:a03:339::18) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|PH7PR12MB6860:EE_
X-MS-Office365-Filtering-Correlation-Id: 8e728e8c-669e-4321-ea8f-08de757dc4db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: kQ6l35SQMirkvsRLXGIe3u+dPlvi468e5ni2B8fD9YCbRZc2DvsiTa3lWLpo2xuEFjvio/HfqWTTccCZhCCA3znB92bN8H2jSrrVwFXlw4MGE5sB6YnVk9VXbJEqs+BYn8+vceCFQPXEqzqDslbzNccfR1/tnUw+n+xrDejSOtaCJET0eY+Hl9BWDybXkWZsg8PaPcAPBgOd6z5eJWlyPAx2eVFxgFXxh0KhYj4qqzIjQX7dnsXolmtimoXKRuCbyVPYECqziROIiD+EMgmtc/XZHqnen1IqfILKdJzl8M5YcPARjvEy9T2NBkxaYm2f6Q6/GUocvxcTW9HCV7RgiZP21AdGpueVbz0Nu5gJDyLO/Y9dZpKSqkjkdrlXQnvrjOOyZyQIpCBA5xCp+K00G5Q4eXP6ufGsNd3WzxYr6d+qrKCcoHZ7UC6YM7elpvMm4q5Ax2wIjtbb6Us/A+0DRH9StlIwguVxuRMd4tUb7RgqumYZrezMSQC2BTUKnpYVEIfq+gtfjX9iV5oITCZp7R1PnqW61ap3jy9MPiqY3lzPSMHpVDlC0l4mUKiuw+TbB82wphFWkB5O01NaeQyQwD2W/nYCqSpn1ApT05NdCp7UtNoAONIPSjmH9cW4gkekZjCrf5A1l/223aODWG3Ax0y3Vib/WxP1FMEPhKwD4LK6zVmFSK2XO1uAVyYp7BpA+eOIN1KTtc9xH6b1tweyeyK81/UEOOHrKXb9SkVNEnA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j5fmxgyJGUjwbJl4YQ6dkjauhR0PjA1UGO4sF5OBApKHkMdKKXP7wVmE9QiQ?=
 =?us-ascii?Q?Lt4E0WyDH2y4eyaAwxBGn8bSDGJLMYsoRxy+vnBXSmwsZ+Y4HVuDJcuVKoDF?=
 =?us-ascii?Q?alVdUuvpLY/yrsTbhhOaETHzKPn5U88dMtplk/KEAnxLstAz4JS7drzl+ZKI?=
 =?us-ascii?Q?GK2EwTgRr85AxA/9rmbaj+VDIJjow7wA/KWZ0Rt+iy23UXoZsYeP0kqt239a?=
 =?us-ascii?Q?JSJgBqVc9OshXOloR9h4hlq5tjT+Jf3tccM9f6xB+RaMxHtytd7mgwEvjR3O?=
 =?us-ascii?Q?Wp68U0J6QrMuo5zu6kyuuJvY6JL11gTIKy0hvC3WVrHqduzr3Khp8ZXGHnm/?=
 =?us-ascii?Q?b5GS6h1ioTyYJv6vDtbcdx56idI5Q2CSLXuvIX4x+Lum2a7WN5F6aD1jV6rs?=
 =?us-ascii?Q?7WxG33z7OPXhOD/feXPvb9jX7tENQAc7RjvrODkqOpP1lg0lAglfOlm4wx3h?=
 =?us-ascii?Q?b9tBPj+kH6DQbDJJ92KcFEiXWHgkHFKTSADH5PQexxcPozxWFQCa4Kb9WPvz?=
 =?us-ascii?Q?MVhqH4chU2izKLSgXh/QzzkIzLs6MYO2EPtGz8u12pbwahJAw/7kWQ2G0WwL?=
 =?us-ascii?Q?xEbDQg8hb3AAqO6Ev5WELHHQTgyMmzM6tlwWPnQPirvogb/ZamwGWkmiq5vz?=
 =?us-ascii?Q?XkHfDksHgPdOLyjOkWIiW1tECMBo9CIRNhWdiM2ii76A5xJ//18TWrZd78N4?=
 =?us-ascii?Q?IfbI5DWbJjin75TNe90UGIQkCny/4fwbMwKIwMy3t5WTTk92Zg/ZhwHTWSAC?=
 =?us-ascii?Q?MOL3nCs6Fo+pKWdOVuvMQ0Ue3e1MLu9XiSTKrKBkzWsvNmfANZtqsqRSUFav?=
 =?us-ascii?Q?owHHuxKz20J0X8V7WfjowAzh47+zn4YAKMAZbcfk6thnQRfahKv+wvF9Sv8e?=
 =?us-ascii?Q?FBQqbkNNl1Bh7sArqU8CvooxbFBET1i4wwV4tmPWnnI73g0MeJK0b4GPjFQ9?=
 =?us-ascii?Q?Ayi7MFGJ+Guu2kmJJctdSF1Ra30OJVZNyGfg6HJlch8qtTY1fxDP5lguz+Zt?=
 =?us-ascii?Q?ecNtQOMJtidq32jyH+j7+gNdqIYEdBCCzoQcvASCXSy+Ona3arhJTzZT2gfF?=
 =?us-ascii?Q?Kvqm4tNaOq51Rtca7nKyKr+XJo7i1qofgE4TUlqWs1vEYO74Lm34o+BQ297Y?=
 =?us-ascii?Q?nSyRywAx5eD7q2JTrdWVPzFGdTT0qSV3pnFu4R2dmSwUCsPc1gQAlbrUYCij?=
 =?us-ascii?Q?WAJZKHHgoq+YhfJcOUqTXSwXAWvd/Mz9iXHou3q6mHtjOviQVEAQYXGWXZ5s?=
 =?us-ascii?Q?4YSo23ll0I2Fkfcfy0BloUslGxywXAI7zELXOuOQJi/01yD3IzndG226i+yb?=
 =?us-ascii?Q?d1lBaj4w5v7yQFUxasZyFbgEkHe8vIfV6mIkkInKhhPTdIinmRmNDLyDF6MC?=
 =?us-ascii?Q?reBuc6EgTJnN1scDYaUdVIn/DPmB5fW5vdsh/3RKC3ze33SWL4FVtOrFKIRt?=
 =?us-ascii?Q?PexA3Vt/tTNEF089Kx6MPdXLt4OMHk54Z33sFTpK3VIrZ5Gv3SPydzP8GEwJ?=
 =?us-ascii?Q?Ci5vKzwIU7KxFlO4Agd5eD8pTKX1Vm9nS73dLeKkSS3ccZwqjGstTvbtXyvv?=
 =?us-ascii?Q?xwazIEnEaHQHT8nYozHjn3NU2wwcVI5NN50izyxFA/Q4Vns5dGfBUr7D6uZr?=
 =?us-ascii?Q?TsXj1ajUY9JR01a7ffDitUwCe/eqSF15eOaBHx9LVlD8VfA95KVVBg5aNhRf?=
 =?us-ascii?Q?YZm4kmO0VZjzCIhhw2z4vEDzh8WwIhG1wp9785pFMm1DrZfW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e728e8c-669e-4321-ea8f-08de757dc4db
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 21:26:56.8383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jenr18HfKHbKz4HQm4TCl2fMsxVd7fcik5qHhR7FFRxWO38/ehINumbRHg2R0gBt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6860
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 25 Feb 2026, at 18:44, Tal Zussman wrote: > struct pagevec
 was removed in commit 1e0877d58b1e ("mm: remove struct > pagevec"). Rename
 include/linux/pagevec.h to reflect reality and update > includes tree-wide.
 Add the new filename to MAINTAIN [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.85.40 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vvit8-0006F9-8y
Subject: Re: [f2fs-dev] [PATCH v2 3/4] folio_batch: Rename pagevec.h to
 folio_batch.h
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
From: Zi Yan via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zi Yan <ziy@nvidia.com>
Cc: nvdimm@lists.linux.dev, Paulo Alcantara <pc@manguebit.org>,
 "Darrick J. Wong" <djwong@kernel.org>, dri-devel@lists.freedesktop.org,
 ceph-devel@vger.kernel.org, linux-xfs@vger.kernel.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Brendan Jackman <jackmanb@google.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Shyam Prasad N <sprasad@microsoft.com>, Chris Li <chrisl@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 David Hildenbrand <david@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 Chuck Lever <chuck.lever@oracle.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Trond Myklebust <trondmy@kernel.org>, samba-technical@lists.samba.org,
 Simona Vetter <simona@ffwll.ch>, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>,
 Hugh Dickins <hughd@google.com>, Olga Kornievskaia <okorniev@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, ocfs2-devel@lists.linux.dev,
 Jani Nikula <jani.nikula@linux.intel.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Barry Song <baohua@kernel.org>, Kairui Song <kasong@tencent.com>,
 Theodore Ts'o <tytso@mit.edu>, Muchun Song <muchun.song@linux.dev>,
 linux-f2fs-devel@lists.sourceforge.net, Anna Schumaker <anna@kernel.org>,
 Alex Markuze <amarkuze@redhat.com>, Kemeng Shi <shikemeng@huaweicloud.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Peter Xu <peterx@redhat.com>, Chris Mason <clm@fb.com>,
 Pedro Falcato <pfalcato@suse.de>, Marc Dionne <marc.dionne@auristor.com>,
 linux-afs@lists.infradead.org, Baoquan He <bhe@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, Viacheslav Dubeyko <slava@dubeyko.com>,
 NeilBrown <neil@brown.name>, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, cgroups@vger.kernel.org,
 Shakeel Butt <shakeel.butt@linux.dev>, Dan Williams <dan.j.williams@intel.com>,
 Oscar Salvador <osalvador@suse.de>, gfs2@lists.linux.dev,
 linux-nfs@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>, linux-mm@kvack.org,
 Jeff Layton <jlayton@kernel.org>, Steve French <sfrench@samba.org>,
 netfs@lists.linux.dev, Mike Rapoport <rppt@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Qi Zheng <zhengqi.arch@bytedance.com>, Yuanchu Xie <yuanchu@google.com>,
 David Howells <dhowells@redhat.com>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, David Airlie <airlied@gmail.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, Mark Fasheh <mark@fasheh.com>,
 Dai Ngo <Dai.Ngo@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Axel Rasmussen <axelrasmussen@google.com>, Jann Horn <jannh@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Tom Talpey <tom@talpey.com>,
 Bharath SM <bharathsm@microsoft.com>, David Sterba <dsterba@suse.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, Wei Xu <weixugc@google.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tz2294@columbia.edu,m:nvdimm@lists.linux.dev,m:pc@manguebit.org,m:djwong@kernel.org,m:dri-devel@lists.freedesktop.org,m:ceph-devel@vger.kernel.org,m:linux-xfs@vger.kernel.org,m:lorenzo.stoakes@oracle.com,m:jackmanb@google.com,m:tursulin@ursulin.net,m:sprasad@microsoft.com,m:chrisl@kernel.org,m:jhubbard@nvidia.com,m:viro@zeniv.linux.org.uk,m:ronniesahlberg@gmail.com,m:david@kernel.org,m:surenb@google.com,m:brauner@kernel.org,m:linux-kernel@vger.kernel.org,m:chuck.lever@oracle.com,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:trondmy@kernel.org,m:samba-technical@lists.samba.org,m:simona@ffwll.ch,m:linux-cifs@vger.kernel.org,m:linux-nilfs@vger.kernel.org,m:vbabka@kernel.org,m:hughd@google.com,m:okorniev@redhat.com,m:mripard@kernel.org,m:ocfs2-devel@lists.linux.dev,m:jani.nikula@linux.intel.com,m:jaegeuk@kernel.org,m:baohua@kernel.org,m:kasong@tencent.com,m:tytso@mit.edu,m:muchun.song@linux.dev,m:linux-f2fs-devel@lists.sourceforge.net,m:anna@ker
 nel.org,m:amarkuze@redhat.com,m:shikemeng@huaweicloud.com,m:joonas.lahtinen@linux.intel.com,m:peterx@redhat.com,m:clm@fb.com,m:pfalcato@suse.de,m:marc.dionne@auristor.com,m:linux-afs@lists.infradead.org,m:bhe@redhat.com,m:willy@infradead.org,m:slava@dubeyko.com,m:neil@brown.name,m:idryomov@gmail.com,m:linux-ext4@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:baolin.wang@linux.alibaba.com,m:rodrigo.vivi@intel.com,m:cgroups@vger.kernel.org,m:shakeel.butt@linux.dev,m:dan.j.williams@intel.com,m:osalvador@suse.de,m:gfs2@lists.linux.dev,m:linux-nfs@vger.kernel.org,m:nphamcs@gmail.com,m:linux-mm@kvack.org,m:jlayton@kernel.org,m:sfrench@samba.org,m:netfs@lists.linux.dev,m:rppt@kernel.org,m:mhocko@suse.com,m:jack@suse.cz,m:roman.gushchin@linux.dev,m:zhengqi.arch@bytedance.com,m:yuanchu@google.com,m:dhowells@redhat.com,m:joseph.qi@linux.alibaba.com,m:adilger.kernel@dilger.ca,m:airlied@gmail.com,m:agruenba@redhat.com,m:mark@fasheh.com,m:Dai.Ngo@oracle.com,m:jgg@ziepe.ca,m:axelrasmussen@go
 ogle.com,m:jannh@google.com,m:maarten.lankhorst@linux.intel.com,m:Liam.Howlett@oracle.com,m:tom@talpey.com,m:bharathsm@microsoft.com,m:dsterba@suse.com,m:konishi.ryusuke@gmail.com,m:weixugc@google.com,m:tzimmermann@suse.de,m:hannes@cmpxchg.org,m:linux-btrfs@vger.kernel.org,m:jlbec@evilplan.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,manguebit.org,kernel.org,lists.freedesktop.org,vger.kernel.org,oracle.com,google.com,ursulin.net,microsoft.com,nvidia.com,zeniv.linux.org.uk,gmail.com,linux-foundation.org,lists.samba.org,ffwll.ch,redhat.com,linux.intel.com,tencent.com,mit.edu,linux.dev,lists.sourceforge.net,huaweicloud.com,fb.com,suse.de,auristor.com,lists.infradead.org,infradead.org,dubeyko.com,brown.name,linux.alibaba.com,intel.com,kvack.org,samba.org,suse.com,suse.cz,bytedance.com,dilger.ca,fasheh.com,ziepe.ca,talpey.com,cmpxchg.org,evilplan.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,Nvidia.com:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[95];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,Nvidia.com:s=selector2];
	NEURAL_HAM(-0.00)[-0.934];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[ziy@nvidia.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[columbia.edu:email,nvidia.com:mid,nvidia.com:email,nvidia.com:replyto,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: D44F01AFC66
X-Rspamd-Action: no action

On 25 Feb 2026, at 18:44, Tal Zussman wrote:

> struct pagevec was removed in commit 1e0877d58b1e ("mm: remove struct
> pagevec"). Rename include/linux/pagevec.h to reflect reality and update
> includes tree-wide. Add the new filename to MAINTAINERS explicitly, as
> it no longer matches the "include/linux/page[-_]*" pattern in MEMORY
> MANAGEMENT - CORE.
>
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> ---
>  MAINTAINERS                                | 1 +
>  drivers/gpu/drm/drm_gem.c                  | 2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c  | 2 +-
>  drivers/gpu/drm/i915/gt/intel_gtt.h        | 2 +-
>  drivers/gpu/drm/i915/i915_gpu_error.c      | 2 +-
>  fs/btrfs/compression.c                     | 2 +-
>  fs/btrfs/extent_io.c                       | 2 +-
>  fs/btrfs/tests/extent-io-tests.c           | 2 +-
>  fs/buffer.c                                | 2 +-
>  fs/ceph/addr.c                             | 2 +-
>  fs/ext4/inode.c                            | 2 +-
>  fs/f2fs/checkpoint.c                       | 2 +-
>  fs/f2fs/compress.c                         | 2 +-
>  fs/f2fs/data.c                             | 2 +-
>  fs/f2fs/node.c                             | 2 +-
>  fs/gfs2/aops.c                             | 2 +-
>  fs/hugetlbfs/inode.c                       | 2 +-
>  fs/nilfs2/btree.c                          | 2 +-
>  fs/nilfs2/page.c                           | 2 +-
>  fs/nilfs2/segment.c                        | 2 +-
>  fs/ramfs/file-nommu.c                      | 2 +-
>  include/linux/{pagevec.h => folio_batch.h} | 8 ++++----
>  include/linux/folio_queue.h                | 2 +-
>  include/linux/iomap.h                      | 2 +-
>  include/linux/sunrpc/svc.h                 | 2 +-
>  include/linux/writeback.h                  | 2 +-
>  mm/filemap.c                               | 2 +-
>  mm/gup.c                                   | 2 +-
>  mm/memcontrol.c                            | 2 +-
>  mm/mlock.c                                 | 2 +-
>  mm/page-writeback.c                        | 2 +-
>  mm/page_alloc.c                            | 2 +-
>  mm/shmem.c                                 | 2 +-
>  mm/swap.c                                  | 2 +-
>  mm/swap_state.c                            | 2 +-
>  mm/truncate.c                              | 2 +-
>  mm/vmscan.c                                | 2 +-
>  37 files changed, 40 insertions(+), 39 deletions(-)
>
Acked-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
