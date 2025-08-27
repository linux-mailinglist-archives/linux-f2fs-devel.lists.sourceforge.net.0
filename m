Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3DEB38990
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Aug 2025 20:30:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlpW27xo4ut4wh+ulgnaNxR/LwKi2MVCyVqFKqUogk8=; b=XW8yvT3zKVUR4Q+pWPQRT5XAxS
	krsnnTaT+dHB4yw8/gVlQVjs9DeiZN3t5/Nx77S0GYHsXi8rrLDaPjLS7xD3kTZtb5yhBgEdFyzgO
	pc9sTw3Op2idPIotvAxRtWrCGMWexHbrwUCZ68H9h0ZjH03p2997cyseqlAvUjmv9FoY=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1urKuh-0007XU-Qh;
	Wed, 27 Aug 2025 18:30:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shivankg@amd.com>) id 1urKuh-0007XL-6S
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Aug 2025 18:30:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+pzaw/tMHhGW5q3HtuFLiF+Jhys0tvCCauTRmjgnHzU=; b=kqPSNwq600kHDFnCjT8qMHDWQw
 tAAjENgcOKUpwKgLPCC5kHUmA8pf05BBxuOeSu4jjCIhEbasPTc2nz5keueLSxrbVUYrigQ2EqBOk
 BTOUtSvKLchnSfuF1IjUne6G1GjpjYeg257qNNaTP371VINQ7ob/yHldBeNDkIwdyP7U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+pzaw/tMHhGW5q3HtuFLiF+Jhys0tvCCauTRmjgnHzU=; b=L3yOTePCgyy0MmN8qx46xnTRYe
 JiF2MwhpUJkx8ozDa+wHKYgKGwcMx2U9h3fUFSOHCrUeO/Aj2yOflwir4pAzAODXWlvXQQNy3HhVM
 nABNg2XxmYSJJz3YjFYQ+AdOCvcBNQA2EEpbM3ARtF7RZHVRi6+rxTo+/sP5TbzjOYC4=;
Received: from mail-dm6nam12on2057.outbound.protection.outlook.com
 ([40.107.243.57] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1urKuh-0005jn-9k for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Aug 2025 18:30:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rC3qCTY/WZSpUqrTuoLP5zYuGXQNSPFGGckMJajzWrAt7gYQQxdgsyv9kOeob34zSGk3RGcf+Yf1q22wA/Dm/7u4kGejVoT/AFxFm9nGmqzNoBdx+cip2fNti8Takc4TO/Ks80LgipCKCavGqVdi6mqCNzmQk2qQK9uKSDf2ikpVvMm/YeLbf1IrBs7OT6LCX31yFjvj1R54/m71bq2M6d5nh8fXFEiLzqIU79ZFF3zn980SBQevHhXlpgmkli7DH120FkuW6cDnfK+R5UaBxfTkm9qEoHGaKYpHi8q409zjagO3szinNbDP+WsZNP8X3Xnb6s0g5XC0+RfW873K9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+pzaw/tMHhGW5q3HtuFLiF+Jhys0tvCCauTRmjgnHzU=;
 b=LqjF82CNpk5Ddwwjk5EtOyExNj1yvorRWvsM6Vv/daLyFwfvugbHMwVpZ+niIGlbxDsLfEGV0KcymsPl1n+esQ9XErwJjUyAwwesW6M7VtWGXeMVwrJbm4DZt/a/p55AbB24jEquNaVnHOnxw8Ij3IHKpQHlNKLqJaJtlgDxSGUDegEBXzC95vlVwR73+Ci0gKxRvlq1gIn23tHAvAi8VqGayQte9TMtZBn2lwSE0cszqddSt3Mci0lyzuzPpUVborPQusw0CPzgCAW4XUUDvsBH3dfd/ZVM+LZjsaVDsG5pAUHVmS8OyOBVQdVyFsG+7TJnAqzwQO2IkeGgm8zbwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pzaw/tMHhGW5q3HtuFLiF+Jhys0tvCCauTRmjgnHzU=;
 b=sKejWGMi/n/GKknBq/Z+GeqD6dZ+QZDh0VZQORifeCBtTmuM8Ozv0AVtdSjvLMz9sK2XZNwE5k+i2FkSRAjOWXrIQq2x4vfFymXIZzWq19HH2mUT/zwzTB08c/PRcfOLEOKzU9muFnsikR9soE/Vw340i+bnOpoOARe+pu4gCcI=
Received: from SJ0PR13CA0135.namprd13.prod.outlook.com (2603:10b6:a03:2c6::20)
 by BY5PR12MB4306.namprd12.prod.outlook.com (2603:10b6:a03:206::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 27 Aug
 2025 17:55:42 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::4) by SJ0PR13CA0135.outlook.office365.com
 (2603:10b6:a03:2c6::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.5 via Frontend Transport; Wed,
 27 Aug 2025 17:55:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Wed, 27 Aug 2025 17:55:41 +0000
Received: from kaveri.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 12:55:22 -0500
To: <willy@infradead.org>, <akpm@linux-foundation.org>, <david@redhat.com>,
 <pbonzini@redhat.com>, <shuah@kernel.org>, <seanjc@google.com>,
 <vbabka@suse.cz>
Date: Wed, 27 Aug 2025 17:52:43 +0000
Message-ID: <20250827175247.83322-4-shivankg@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827175247.83322-2-shivankg@amd.com>
References: <20250827175247.83322-2-shivankg@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|BY5PR12MB4306:EE_
X-MS-Office365-Filtering-Correlation-Id: 704515d4-baf1-47b1-06ca-08dde592f084
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|82310400026|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jB/+Sj+sdis2Lh5H6ALTX11EUaHH62zfkM/Zg0onQGGjWM1B4v5L/wlgLqCq?=
 =?us-ascii?Q?sgObBCd0YmL3G1I/rmSLUSBgVcYhdJBsXG9v+Qb224t+RgPbyyWiDzVetiTZ?=
 =?us-ascii?Q?tMM618175vjKc/7R1a5ZYic+uHpyH0zUFMV1yKOMKVHtBayDYnJ2nH07ORNj?=
 =?us-ascii?Q?pa9mSJd0LdphQ/mOXksz7RtoaRMROvjDkDb2499qK3hPIxQ5txXYmhKbKtby?=
 =?us-ascii?Q?9RxWvIajn62FJWzbhEfosExuFvL8NaFxZTdcxQ+qF+aPV+hcrGl96RsSrh0/?=
 =?us-ascii?Q?UpdGEAvhvSO1NUaqDT+bYr+dJZSZuRCVMr+UPE1anGjFPkQdD1JrRCqTeMwZ?=
 =?us-ascii?Q?ZvR49rAHzYdPxgUUNEAKBzU5/xDYLrZz4fXLcnzkiv/lt+CdSVukkMCzbjak?=
 =?us-ascii?Q?0PoIRCspN92xugxp/qDz5Mx0OuLJfrwdUZ95+kyNoKWRoojAzdptqD2FNeip?=
 =?us-ascii?Q?OzuorC/J2SOXu9GJmcWKEZ4w2qcvEUbpZvRx/eFYwXaQu3+yEoDpVGaRvCZx?=
 =?us-ascii?Q?dPOFiuF61Hlf3kqP9TMoH969jhhUdsxHr/MZrL1+Uh00SeSLanBLFE2m6RCV?=
 =?us-ascii?Q?UYb3HqhdAAKkI5GCXmB39GcPvHrw2dh5rD5OA4vOfe6KRnty8mu747PF/yCq?=
 =?us-ascii?Q?lNCKbOEPxJApXQ238/T4pqDwNMXbrc0xAmS/DEdpr/CnPgwBFvx1AHmCNh00?=
 =?us-ascii?Q?PRb9UDWBna1IxFx3vb2ZRnQMDSD5UqonDpCL9vOVeguZ5uhXjRxJgZAydmeD?=
 =?us-ascii?Q?jk+G/Drs+pXpn6kkdPfmZHzaboELTlEQAhCTKBLg0Lo85HKGAMVFB9d25z9u?=
 =?us-ascii?Q?UDk7b8/D9qdjeLP8dKGBlEtJ14uxFTQ9DPbdrtCWiTSrxzt/GuvjJno8pnfq?=
 =?us-ascii?Q?UXySmDTZAaGUrALteUNF+nNZr10wEge16tneVpRxC/78OK0s+C2h4kZzdgvX?=
 =?us-ascii?Q?s0lvuOLJi4vlB3R5iVTETsubEcXRSYPJjZHGOhpvkzY+AG2xI9zm1hOs+Eez?=
 =?us-ascii?Q?Npzl7RIBVwMvcTt8sGKs+l7zxwYmfECryEjWAFp5fuZhLv9V6KoQqe1JcXRc?=
 =?us-ascii?Q?5nivamZgqUszz1ENUgHDJEfowUWjyBApy2j4weLnZe9vFlnOeEFUX+/DliU4?=
 =?us-ascii?Q?rKLbaJ737jyjlpGRc7b/DS+8aB4ckgBW4ncsjdA469fas2boy1C+fZF79Bzq?=
 =?us-ascii?Q?eXAkT43mkjO6swxLZGgvwOzuS2igRoUwiRwDydhB5nM17A4478gpwm6TkebI?=
 =?us-ascii?Q?m3/1EwnYmvZBDvEjSCcY01lsgw0l4Q7oywNQOQj6hCc9qBm73jwWB1nhxL3R?=
 =?us-ascii?Q?4DjpN/P3o3b8eis81KrutsTxYTI4DtB08psFtqexIqhG7ZS6RUB97c7IDRuI?=
 =?us-ascii?Q?T9oWBDx6E7yRj1FWH18HhaEEw+4zDyPtMQDiR1e2ggVNSyaLykBYlpDeWEyT?=
 =?us-ascii?Q?oOfFrGLHIG2iyo7TnDF7MC+cA4ipFT7gmvvbwDaG0EruG8GE+v/bILdv5zA/?=
 =?us-ascii?Q?9U1krwIyEIwENi4+F3RtX1KuiKGNOK/woPoq?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(82310400026)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 17:55:41.8313 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 704515d4-baf1-47b1-06ca-08dde592f084
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4306
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: "Matthew Wilcox (Oracle)" <willy@infradead.org> Add
 a mempolicy parameter to filemap_alloc_folio() to enable NUMA-aware page cache
 allocations. This will be used by upcoming changes to support NUMA policies
 in guest-memfd, where guest_memory need t [...] 
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
 [40.107.243.57 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1urKuh-0005jn-9k
Subject: [f2fs-dev] [PATCH kvm-next V11 1/7] mm/filemap: Add NUMA mempolicy
 support to filemap_alloc_folio()
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

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Add a mempolicy parameter to filemap_alloc_folio() to enable NUMA-aware
page cache allocations. This will be used by upcoming changes to
support NUMA policies in guest-memfd, where guest_memory need to be
allocated NUMA policy specified by VMM.

All existing users pass NULL maintaining current behavior.

Reviewed-by: Pankaj Gupta <pankaj.gupta@amd.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: David Hildenbrand <david@redhat.com>
Signed-off-by: Shivank Garg <shivankg@amd.com>
---
 fs/bcachefs/fs-io-buffered.c |  2 +-
 fs/btrfs/compression.c       |  4 ++--
 fs/btrfs/verity.c            |  2 +-
 fs/erofs/zdata.c             |  2 +-
 fs/f2fs/compress.c           |  2 +-
 include/linux/pagemap.h      |  8 +++++---
 mm/filemap.c                 | 14 +++++++++-----
 mm/readahead.c               |  2 +-
 8 files changed, 21 insertions(+), 15 deletions(-)

diff --git a/fs/bcachefs/fs-io-buffered.c b/fs/bcachefs/fs-io-buffered.c
index 1c54b9b5bd69..3af2eabb7ed3 100644
--- a/fs/bcachefs/fs-io-buffered.c
+++ b/fs/bcachefs/fs-io-buffered.c
@@ -124,7 +124,7 @@ static int readpage_bio_extend(struct btree_trans *trans,
 			if (folio && !xa_is_value(folio))
 				break;
 
-			folio = filemap_alloc_folio(readahead_gfp_mask(iter->mapping), order);
+			folio = filemap_alloc_folio(readahead_gfp_mask(iter->mapping), order, NULL);
 			if (!folio)
 				break;
 
diff --git a/fs/btrfs/compression.c b/fs/btrfs/compression.c
index d09d622016ef..139f9609e737 100644
--- a/fs/btrfs/compression.c
+++ b/fs/btrfs/compression.c
@@ -474,8 +474,8 @@ static noinline int add_ra_bio_pages(struct inode *inode,
 			continue;
 		}
 
-		folio = filemap_alloc_folio(mapping_gfp_constraint(mapping,
-								   ~__GFP_FS), 0);
+		folio = filemap_alloc_folio(mapping_gfp_constraint(mapping, ~__GFP_FS),
+					    0, NULL);
 		if (!folio)
 			break;
 
diff --git a/fs/btrfs/verity.c b/fs/btrfs/verity.c
index b7a96a005487..c43a789ba6d2 100644
--- a/fs/btrfs/verity.c
+++ b/fs/btrfs/verity.c
@@ -742,7 +742,7 @@ static struct page *btrfs_read_merkle_tree_page(struct inode *inode,
 	}
 
 	folio = filemap_alloc_folio(mapping_gfp_constraint(inode->i_mapping, ~__GFP_FS),
-				    0);
+				    0, NULL);
 	if (!folio)
 		return ERR_PTR(-ENOMEM);
 
diff --git a/fs/erofs/zdata.c b/fs/erofs/zdata.c
index 2d73297003d2..e9a1bf7568c9 100644
--- a/fs/erofs/zdata.c
+++ b/fs/erofs/zdata.c
@@ -562,7 +562,7 @@ static void z_erofs_bind_cache(struct z_erofs_frontend *fe)
 			 * Allocate a managed folio for cached I/O, or it may be
 			 * then filled with a file-backed folio for in-place I/O
 			 */
-			newfolio = filemap_alloc_folio(gfp, 0);
+			newfolio = filemap_alloc_folio(gfp, 0, NULL);
 			if (!newfolio)
 				continue;
 			newfolio->private = Z_EROFS_PREALLOCATED_FOLIO;
diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 5c1f47e45dab..56a51c9ba4f1 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1942,7 +1942,7 @@ static void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi,
 		return;
 	}
 
-	cfolio = filemap_alloc_folio(__GFP_NOWARN | __GFP_IO, 0);
+	cfolio = filemap_alloc_folio(__GFP_NOWARN | __GFP_IO, 0, NULL);
 	if (!cfolio)
 		return;
 
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 12a12dae727d..ce617a35dc35 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -646,9 +646,11 @@ static inline void *detach_page_private(struct page *page)
 }
 
 #ifdef CONFIG_NUMA
-struct folio *filemap_alloc_folio_noprof(gfp_t gfp, unsigned int order);
+struct folio *filemap_alloc_folio_noprof(gfp_t gfp, unsigned int order,
+		struct mempolicy *policy);
 #else
-static inline struct folio *filemap_alloc_folio_noprof(gfp_t gfp, unsigned int order)
+static inline struct folio *filemap_alloc_folio_noprof(gfp_t gfp, unsigned int order,
+		struct mempolicy *policy)
 {
 	return folio_alloc_noprof(gfp, order);
 }
@@ -659,7 +661,7 @@ static inline struct folio *filemap_alloc_folio_noprof(gfp_t gfp, unsigned int o
 
 static inline struct page *__page_cache_alloc(gfp_t gfp)
 {
-	return &filemap_alloc_folio(gfp, 0)->page;
+	return &filemap_alloc_folio(gfp, 0, NULL)->page;
 }
 
 static inline gfp_t readahead_gfp_mask(struct address_space *x)
diff --git a/mm/filemap.c b/mm/filemap.c
index 751838ef05e5..495f7f5c3d2e 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -989,11 +989,16 @@ int filemap_add_folio(struct address_space *mapping, struct folio *folio,
 EXPORT_SYMBOL_GPL(filemap_add_folio);
 
 #ifdef CONFIG_NUMA
-struct folio *filemap_alloc_folio_noprof(gfp_t gfp, unsigned int order)
+struct folio *filemap_alloc_folio_noprof(gfp_t gfp, unsigned int order,
+		struct mempolicy *policy)
 {
 	int n;
 	struct folio *folio;
 
+	if (policy)
+		return folio_alloc_mpol_noprof(gfp, order, policy,
+				NO_INTERLEAVE_INDEX, numa_node_id());
+
 	if (cpuset_do_page_mem_spread()) {
 		unsigned int cpuset_mems_cookie;
 		do {
@@ -1978,7 +1983,7 @@ struct folio *__filemap_get_folio(struct address_space *mapping, pgoff_t index,
 			err = -ENOMEM;
 			if (order > min_order)
 				alloc_gfp |= __GFP_NORETRY | __GFP_NOWARN;
-			folio = filemap_alloc_folio(alloc_gfp, order);
+			folio = filemap_alloc_folio(alloc_gfp, order, NULL);
 			if (!folio)
 				continue;
 
@@ -2517,7 +2522,7 @@ static int filemap_create_folio(struct kiocb *iocb, struct folio_batch *fbatch)
 	if (iocb->ki_flags & (IOCB_NOWAIT | IOCB_WAITQ))
 		return -EAGAIN;
 
-	folio = filemap_alloc_folio(mapping_gfp_mask(mapping), min_order);
+	folio = filemap_alloc_folio(mapping_gfp_mask(mapping), min_order, NULL);
 	if (!folio)
 		return -ENOMEM;
 	if (iocb->ki_flags & IOCB_DONTCACHE)
@@ -3916,8 +3921,7 @@ static struct folio *do_read_cache_folio(struct address_space *mapping,
 repeat:
 	folio = filemap_get_folio(mapping, index);
 	if (IS_ERR(folio)) {
-		folio = filemap_alloc_folio(gfp,
-					    mapping_min_folio_order(mapping));
+		folio = filemap_alloc_folio(gfp, mapping_min_folio_order(mapping), NULL);
 		if (!folio)
 			return ERR_PTR(-ENOMEM);
 		index = mapping_align_index(mapping, index);
diff --git a/mm/readahead.c b/mm/readahead.c
index 406756d34309..a4dfa837dfbd 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -183,7 +183,7 @@ static struct folio *ractl_alloc_folio(struct readahead_control *ractl,
 {
 	struct folio *folio;
 
-	folio = filemap_alloc_folio(gfp_mask, order);
+	folio = filemap_alloc_folio(gfp_mask, order, NULL);
 	if (folio && ractl->dropbehind)
 		__folio_set_dropbehind(folio);
 
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
