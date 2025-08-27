Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF8EAB3894F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Aug 2025 20:10:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1M1HI/YweQ82N7Durh81xAdZoBxhSBBGwdf89w4GLkk=; b=Eq7/zMSD+fYaK56lnB9Fs+baAQ
	yIxwgJmXZ5wiA1ouNL4IMRuV+KjeUlAJQTCRB0ZFWRp6VP+Wi4aYSSFhH9iNx5CvxtdatZE0Gz7rI
	VuMd+CBLtYPmi6JbCLS5JynWvvuvf++XhJnqFWvGDjHzPgSMtDLMyldFTEeiQWCoie8s=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1urKaj-0000iX-Tl;
	Wed, 27 Aug 2025 18:09:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shivankg@amd.com>) id 1urKai-0000iR-8Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Aug 2025 18:09:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8ftMmDOFMjejJvDjBTrKWY03TXiMqFTDHYCYDhcRj58=; b=PKoANsE5Qbbnb0ZFoYFbnU/aMW
 YWqQUd4tpn7YB6uH+ZiJrK6qvRoX6d+dcS1cvJSEgJWuk9AGH+L2oAIuwjzTr81Se9KFQLWOp4j7S
 /wpphMQSHS64Cl6OQG14C887tEbRDrMq205+u9OLtO4NtAm0qqkbuXwprAjOgUryWXng=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8ftMmDOFMjejJvDjBTrKWY03TXiMqFTDHYCYDhcRj58=; b=L
 P0LVovH6fZyM6nVMi3JZU7jwYeGjlL5Ijm0MlBzomBBXCO6wz1afeL2bscqDOLsHJmK8/mlVKAUxJ
 tMVNWmaghfP9bxNgResgofjpy8G10B5vapM4ZC7nFpWQ3dQl87mWwUiJ7Ch3vDTF/G/jIxgczgo5Q
 iH4f+p5SI5coo/Hc=;
Received: from mail-bn8nam12on2080.outbound.protection.outlook.com
 ([40.107.237.80] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1urKah-0003zd-IR for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Aug 2025 18:09:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RjDSF89s8YNMUj0dWtmynEZbC7gAJ4GCh7UAvOuIigaoEbKpauUhjclW3WZICGQtIDz2rJTe4lQ8WGHKvorya7cQqOhSNRv78ow4WImkw5x2BNl1+JQ6BgyOcZ2Nl0pZoHt6IDuDEc4EvHGlaRKUTDnJCFytxtO3X89ODNk05I3bT73HCcDAh3S3Uq0FlwcL19P/l0WJBzml/eC8ICtgXr/HmrbDIvGGRT5mtkVSQBuuma3OHWUTvQcZ0eZkFeJx1NgJz7yYG3SEvKaMz37vlwQ52om1/Cxz7oLh+2Rm69SHMYMEalhWGSmb+cr4ozKqKVe0i6NAu+D2VZOag34l1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8ftMmDOFMjejJvDjBTrKWY03TXiMqFTDHYCYDhcRj58=;
 b=vkFEUdIKSdDdIyFT6Pz5rLL+mcJ8Gl9LKoAnDEBM/8DAqsvHJUZyPq/F20b/zmdtT5bjZejSEo+V7jJdzhXjY4tUYRDxZhgYqYeSlFOP50C0KCbmRcrpyBLCam41ztiBs5Bb2umegfDlhxoCx7R4OzQ6wxB4uESLLQdSHU0wjBfV6xmvmP5baz0w3vd63t2i/dStMRSnmjWvaEKTlAPDo5wvlU1ehabNT2tRtIhedpgVBdQnTDNmp9o1xxXvrY3m9tjH0nCaIIZhDEKnhcEwGFJzIxFC+oaTXz69HgJ1+zV8BOc5FjydTt+kad9JWLESuVnGuCqCfo3+ZfBf0fh8Bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8ftMmDOFMjejJvDjBTrKWY03TXiMqFTDHYCYDhcRj58=;
 b=g827RGIiwqJFVqmLBtC2Ya0/nBa4yymvYeW2hAtnYkEzJRgYVH+ZaPXMXFS/JUrDU40Emsm/zUBoAoM8dZDxKgJJkDsO7v2EaFKT+1PsTSQZHcGK79EiYKZ0n+MQ5NBNBJC8CaOoH0aKdxOAtURjWI79KeiqbEb6syNYmeIN2Fk=
Received: from SJ2PR07CA0008.namprd07.prod.outlook.com (2603:10b6:a03:505::8)
 by DM4PR12MB6349.namprd12.prod.outlook.com (2603:10b6:8:a4::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.24; Wed, 27 Aug 2025 17:55:10 +0000
Received: from SJ1PEPF000023CE.namprd02.prod.outlook.com
 (2603:10b6:a03:505:cafe::78) by SJ2PR07CA0008.outlook.office365.com
 (2603:10b6:a03:505::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.16 via Frontend Transport; Wed,
 27 Aug 2025 17:55:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CE.mail.protection.outlook.com (10.167.244.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Wed, 27 Aug 2025 17:55:10 +0000
Received: from kaveri.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 12:54:45 -0500
To: <willy@infradead.org>, <akpm@linux-foundation.org>, <david@redhat.com>,
 <pbonzini@redhat.com>, <shuah@kernel.org>, <seanjc@google.com>,
 <vbabka@suse.cz>
Date: Wed, 27 Aug 2025 17:52:41 +0000
Message-ID: <20250827175247.83322-2-shivankg@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CE:EE_|DM4PR12MB6349:EE_
X-MS-Office365-Filtering-Correlation-Id: be4b3d7d-3382-48fd-86b0-08dde592dd8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|7416014|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ykdI7UKSSiagd9uFHC0kt0JYKIN8kp69uR7ogMpa28ypxL1LcJ8UT7kDEFvE?=
 =?us-ascii?Q?4CqyEKW8jlNCszRA12tXqJQAtDx/mQpv1zzWZgkVJcupiry9MZpPOmeSqNRC?=
 =?us-ascii?Q?JOiQvBQxzgKK04lgeMjYNZV0/HWzh54V26F/DViE1AEBHQ2Yc/N4S2EM7oM0?=
 =?us-ascii?Q?kCuh/4ZQ5BssUiHo0vsGeC90vcje9zcHaAtrgFQGLGrKCuM9tNSRPh1kIwlE?=
 =?us-ascii?Q?MhJ3PDE8mvCw9rp26Dhi8vz1jtI04jsqDfNPlm6y6f7XkdQhz/lPWZieMbvQ?=
 =?us-ascii?Q?rQXK1alrrDKHnT9yfSZ73rN/LO37W+DtnhIDMH4OApUP92KXskB9FIy60X63?=
 =?us-ascii?Q?+LlKRPwrHiArH/ZdcEiXBy17PDlTnj1IVXZ8btkSGHUXbg3QjiclIGc4tNC7?=
 =?us-ascii?Q?B26OEtotJxXZ3LLO4o6P1OKokagrGJBhNg7vXYeb8ZaVrvvJzX5KDlYvttiL?=
 =?us-ascii?Q?zBAJH7jxJUC1NiieYpMhXgSgzyD0BP5zSwMF9WdB6qAbMQWImGJedhu1+06F?=
 =?us-ascii?Q?sAFcXBuYHnTXuWp0pkyOCtq1t1jA9gw+oVduO43TdKAo3SEZ/A+wsjmhAeui?=
 =?us-ascii?Q?DLCPsLhh1pSjCJ7yapwPF/hPaKi1Io3CFbfsXFXYsMZJug6MdB1aaBRYj8GS?=
 =?us-ascii?Q?jko0K0NQWyXpP1g0jkEqNWa5Flp74tCvHQQ+m9gPiE/7yT4DF3sGU9H+Q/AU?=
 =?us-ascii?Q?Fy4T1Vyp4RYY4r9kZklgeHTvLnNCUCcuhAfMAg2bH6Sn7ZUhhlfk6DhBEVaN?=
 =?us-ascii?Q?Zwft3VzPCzLccZA2j9w85WImgklTyDCiGJh9FvWEQ6/7dqSIyYBdejxFMCG6?=
 =?us-ascii?Q?ZrwWrGbjNr0lVwUG7TtQs8mBTR9/ISAFahzmKbfdBFvzh715WYk6QL9FRYNv?=
 =?us-ascii?Q?hvBOjpk4Y4va4tE/okXT9rR3Hzu0YRRar4WYdB11b5RPx8cF0YI+udop0TlX?=
 =?us-ascii?Q?fGcJyLkqSSOl0mYAMAaCCzD83BoMH+ppm2BoJaGe8DAzSyFno0ZQNY4CWOdD?=
 =?us-ascii?Q?cjhvUd/NlzdMJ25r3Kc0UlowwLxosN4xl7uPxAstWg3AAEu7ZJTgEdOH/W0W?=
 =?us-ascii?Q?F5VLYaYbQ2aQWY3aF/g8Mgsk05n3WmThc4LQsHSoxm+UFUGQOE93s+JtZczp?=
 =?us-ascii?Q?SgaUzt7b5t+RCrEQv3g8kUxq0uyc1rg+6LMi2slQId9nJxXOghuutWPOe5ej?=
 =?us-ascii?Q?SqD1+Ztzu/BkwTbQHjLTqUB6agWL5a1knyyzcmTxBf/ONOuBcDCxD3iPMG05?=
 =?us-ascii?Q?Er1xrQG6J4TDXFvIZjyo5CkSQypOhxooVWGPW19NLvEcUZ9hCvExUr8gP6Dj?=
 =?us-ascii?Q?Oghqrm70i3HBXVgShnhKWGCYc7omzF+mB5OWdzmtr9KC8sy1mAm9HDfnEToA?=
 =?us-ascii?Q?OIpDjBBDqFBFLC469nmTMH26ShLmjqYEL3+ko6stnFB90hwMSIMy9gQmF6bU?=
 =?us-ascii?Q?lCUbpehJHJcU5NQXadXJY95ni2+Co3LzMzlolhfOHHOG+vcZoKggAw=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(7416014)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 17:55:10.0405 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: be4b3d7d-3382-48fd-86b0-08dde592dd8d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CE.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6349
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This series introduces NUMA-aware memory placement support
 for KVM guests with guest_memfd memory backends. It builds upon Fuad Tabba's
 work (V17) that enabled host-mapping for guest_memfd memory [1] [...] 
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
 [40.107.237.80 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1urKah-0003zd-IR
Subject: [f2fs-dev] [PATCH kvm-next V11 0/7] Add NUMA mempolicy support for
 KVM guest-memfd
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
From: Shivank Garg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Shivank Garg <shivankg@amd.com>
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
 shivankg@amd.com, thomas.lendacky@amd.com, ashish.kalra@amd.com,
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
 pankaj.gupta@amd.com, linux-security-module@vger.kernel.org,
 lihongbo22@huawei.com, amit@infradead.org, linux-fsdevel@vger.kernel.org,
 vannapurve@google.com, suzuki.poulose@arm.com, rppt@kernel.org, jgg@nvidia.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This series introduces NUMA-aware memory placement support for KVM guests
with guest_memfd memory backends. It builds upon Fuad Tabba's work (V17)
that enabled host-mapping for guest_memfd memory [1] and can be applied
directly applied on KVM tree [2] (branch kvm-next, base commit: a6ad5413,
Merge branch 'guest-memfd-mmap' into HEAD)

== Background == 
KVM's guest-memfd memory backend currently lacks support for NUMA policy
enforcement, causing guest memory allocations to be distributed across host
nodes  according to kernel's default behavior, irrespective of any policy
specified by the VMM. This limitation arises because conventional userspace
NUMA control mechanisms like mbind(2) don't work since the memory isn't
directly mapped to userspace when allocations occur.
Fuad's work [1] provides the necessary mmap capability, and this series
leverages it to enable mbind(2).

== Implementation ==
This series implements proper NUMA policy support for guest-memfd by:

1. Adding mempolicy-aware allocation APIs to the filemap layer.
2. Introducing custom inodes (via a dedicated slab-allocated inode cache,
   kvm_gmem_inode_info) to store NUMA policy and metadata for guest memory.
3. Implementing get/set_policy vm_ops in guest_memfd to support NUMA
   policy.

With these changes, VMMs can now control guest memory placement by mapping
guest_memfd file descriptor and using mbind(2) to specify:
- Policy modes: default, bind, interleave, or preferred
- Host NUMA nodes: List of target nodes for memory allocation

These Policies affect only future allocations and do not migrate existing
memory. This matches mbind(2)'s default behavior which affects only new
allocations unless overridden with MPOL_MF_MOVE/MPOL_MF_MOVE_ALL flags (Not
supported for guest_memfd as it is unmovable by design).

== Upstream Plan ==
Phased approach as per David's guest_memfd extension overview [3] and
community calls [4]:

Phase 1 (this series):
1. Focuses on shared guest_memfd support (non-CoCo VMs).
2. Builds on Fuad's host-mapping work [1].

Phase2 (future work):
1. NUMA support for private guest_memfd (CoCo VMs).
2. Depends on SNP in-place conversion support [5].

This series provides a clean integration path for NUMA-aware memory
management for guest_memfd and lays the groundwork for future confidential
computing NUMA capabilities.

Thanks,
Shivank

== Changelog ==

- v1,v2: Extended the KVM_CREATE_GUEST_MEMFD IOCTL to pass mempolicy.
- v3: Introduced fbind() syscall for VMM memory-placement configuration.
- v4-v6: Current approach using shared_policy support and vm_ops (based on
         suggestions from David [6] and guest_memfd bi-weekly upstream
         call discussion [7]).
- v7: Use inodes to store NUMA policy instead of file [8].
- v8: Rebase on top of Fuad's V12: Host mmaping for guest_memfd memory.
- v9: Rebase on top of Fuad's V13 and incorporate review comments
- V10: Rebase on top of Fuad's V17. Use latest guest_memfd inode patch
       from Ackerley (with David's review comments). Use newer kmem_cache_create()
       API variant with arg parameter (Vlastimil)
- V11: Rebase on kvm-next, remove RFC tag, use Ackerley's latest patch
       and fix a rcu race bug during kvm module unload.

[1] https://lore.kernel.org/all/20250729225455.670324-1-seanjc@google.com
[2] https://git.kernel.org/pub/scm/virt/kvm/kvm.git/log/?h=next 
[3] https://lore.kernel.org/all/c1c9591d-218a-495c-957b-ba356c8f8e09@redhat.com
[4] https://docs.google.com/document/d/1M6766BzdY1Lhk7LiR5IqVR8B8mG3cr-cxTxOrAosPOk/edit?tab=t.0#heading=h.svcbod20b5ur
[5] https://lore.kernel.org/all/20250613005400.3694904-1-michael.roth@amd.com
[6] https://lore.kernel.org/all/6fbef654-36e2-4be5-906e-2a648a845278@redhat.com
[7] https://lore.kernel.org/all/2b77e055-98ac-43a1-a7ad-9f9065d7f38f@amd.com
[8] https://lore.kernel.org/all/diqzbjumm167.fsf@ackerleytng-ctop.c.googlers.com

Ackerley Tng (1):
  KVM: guest_memfd: Use guest mem inodes instead of anonymous inodes

Matthew Wilcox (Oracle) (2):
  mm/filemap: Add NUMA mempolicy support to filemap_alloc_folio()
  mm/filemap: Extend __filemap_get_folio() to support NUMA memory
    policies

Shivank Garg (4):
  mm/mempolicy: Export memory policy symbols
  KVM: guest_memfd: Add slab-allocated inode cache
  KVM: guest_memfd: Enforce NUMA mempolicy using shared policy
  KVM: guest_memfd: selftests: Add tests for mmap and NUMA policy
    support

 fs/bcachefs/fs-io-buffered.c                  |   2 +-
 fs/btrfs/compression.c                        |   4 +-
 fs/btrfs/verity.c                             |   2 +-
 fs/erofs/zdata.c                              |   2 +-
 fs/f2fs/compress.c                            |   2 +-
 include/linux/pagemap.h                       |  18 +-
 include/uapi/linux/magic.h                    |   1 +
 mm/filemap.c                                  |  23 +-
 mm/mempolicy.c                                |   6 +
 mm/readahead.c                                |   2 +-
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../testing/selftests/kvm/guest_memfd_test.c  | 121 ++++++++
 virt/kvm/guest_memfd.c                        | 262 ++++++++++++++++--
 virt/kvm/kvm_main.c                           |   7 +-
 virt/kvm/kvm_mm.h                             |   9 +-
 15 files changed, 412 insertions(+), 50 deletions(-)

-- 
2.43.0

---
== Earlier Postings ==
v10: https://lore.kernel.org/all/20250811090605.16057-2-shivankg@amd.com  
v9: https://lore.kernel.org/all/20250713174339.13981-2-shivankg@amd.com
v8: https://lore.kernel.org/all/20250618112935.7629-1-shivankg@amd.com
v7: https://lore.kernel.org/all/20250408112402.181574-1-shivankg@amd.com
v6: https://lore.kernel.org/all/20250226082549.6034-1-shivankg@amd.com
v5: https://lore.kernel.org/all/20250219101559.414878-1-shivankg@amd.com
v4: https://lore.kernel.org/all/20250210063227.41125-1-shivankg@amd.com
v3: https://lore.kernel.org/all/20241105164549.154700-1-shivankg@amd.com
v2: https://lore.kernel.org/all/20240919094438.10987-1-shivankg@amd.com
v1: https://lore.kernel.org/all/20240916165743.201087-1-shivankg@amd.com



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
