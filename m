Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7123CB38952
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Aug 2025 20:11:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yhl57/bP9uyeMedl1FxxSrk44qyPTXBstO5FQ7jg5eg=; b=Y0iYWxAqZTAb/8+08FGgCcCwaT
	1R+bOEZfSQckiD2BCftywGgSFsFSya+KCi6XlMvABagZJiU/Icy888Mfxu9x+mpzwNGezOehcAKMZ
	NXsBYfoPEIrLMiteXioXwXHskdB0FgSxNWSi3XpAniwccXi0QqIjL/vKri40zZG9pqDQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1urKcZ-0005ew-Vz;
	Wed, 27 Aug 2025 18:11:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shivankg@amd.com>) id 1urKcZ-0005el-HF
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Aug 2025 18:11:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lxZI0XnfKEPRmBNAqV7ZPx9xYGIyZsZhBVXBJa35aDI=; b=E1ZxtteZuGw/9dsuPZmeFAocEV
 bsQ7NQ459ygiZqNGX2gfWa4D3gCFlFAXHxQOkYKOayiETMfmQQoMU7yTZ+fNMvBMagou84dBEzhqW
 xl9Z8B4xMiYXVVZvRro5e+o/3RovOL91EKgdVAaUYFUhYCgmUjCyu9/15uMzZjtbfD1w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lxZI0XnfKEPRmBNAqV7ZPx9xYGIyZsZhBVXBJa35aDI=; b=VEIMiU+JCADnu7sc8M8/S/7CA3
 8eGfjVXETpHNunFob+nx+0v3XVeLBSi1iV7+yebnm5MfSVDdKIkvDXRK4+T8bPrkYm5h/GRw6GG2r
 2yfcCyFTSV9XsKhzThFSlZqNEfepdg3r6L+pwy4o2x6bE7p0AZwc7ct4/JNVYqLqRBMk=;
Received: from mail-dm6nam10on2073.outbound.protection.outlook.com
 ([40.107.93.73] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1urKcZ-00047g-46 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Aug 2025 18:11:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aEC7/5TJXHBZZC3gCYhV7+HH5/SlFdmviSE6GBgTa9q4S4LeifcFhYRBK3E/jtPGDh5faUu1FSlBSk0LF1TyZ+f9ly5URBMD+J5z2Em6gqzXld7rS7YdKaaqwiBQ/ERzI0bincxP63uNA/5cSldvsF6pB9N7DyeM7NJra5hPjgP9xZyBRvVn9WwNpt+omuGW/E0cFS2L4vQynwwfA0WrrOYb71Sei4vF/fKjSd+6N1a464d/DDK0k94fi7TI4PJDVT5fFiA2GxrzDCW6800Ohf7HNbk27mzbKuBrtpfJPbNDlyDXG9nClGyFtwGoAETVp3fNyrv5W1UFp6dgzQhgvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lxZI0XnfKEPRmBNAqV7ZPx9xYGIyZsZhBVXBJa35aDI=;
 b=PH6AxBlqZ3tU1RZGPE5WLNETD1M7RCDO031JXGYVhy+stdxtUfdD0JySYGHc891PKXSQtGf6sZ+vjv7p5+L8wbRJxDDliQY+qFgYlE31KncMJ7kZwUP5wlWOmMXCiyisz9HLL1zM+hxozl5QkDdDMSHCpLPbv2YeA37ZEqj0k2WQtb1lJJOs46Thr8kklEPIj/uy13Vk5aILzCyKFrR8huJ2ViMrRrEI5KbC0oL/02Hzg0b5eGoF8hbclwhBoOGc8nh3XtWeFA0pZ47bKcIIlXNzkpXGM/rr3jxYIAvs2I9umXqw5+kbcwHTl01k7MZi4niQc22JhjRSV3gzgaBc7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lxZI0XnfKEPRmBNAqV7ZPx9xYGIyZsZhBVXBJa35aDI=;
 b=jD0Gdc/XPPDF/UCc7T5N0ctccleofEpAn05GYqgKbZXe4aVhMyK/lT193zyFSvsw9KFEzW+H7yFlKN9DAVZ2d60Fp5KwsI0BM6uHcVGDF22KUuhdauMbGDBNM0VQfIbwgD7kQYepMK+oE8KuYWvYVIK9NLYWI+S+e03lxhks3G8=
Received: from SJ0PR13CA0136.namprd13.prod.outlook.com (2603:10b6:a03:2c6::21)
 by PH0PR12MB8008.namprd12.prod.outlook.com (2603:10b6:510:26f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.20; Wed, 27 Aug
 2025 17:56:32 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::18) by SJ0PR13CA0136.outlook.office365.com
 (2603:10b6:a03:2c6::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.12 via Frontend Transport; Wed,
 27 Aug 2025 17:56:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Wed, 27 Aug 2025 17:56:32 +0000
Received: from kaveri.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 12:56:13 -0500
To: <willy@infradead.org>, <akpm@linux-foundation.org>, <david@redhat.com>,
 <pbonzini@redhat.com>, <shuah@kernel.org>, <seanjc@google.com>,
 <vbabka@suse.cz>
Date: Wed, 27 Aug 2025 17:52:45 +0000
Message-ID: <20250827175247.83322-6-shivankg@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827175247.83322-2-shivankg@amd.com>
References: <20250827175247.83322-2-shivankg@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|PH0PR12MB8008:EE_
X-MS-Office365-Filtering-Correlation-Id: ce52832b-9b33-4321-d48f-08dde5930eb9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|7416014|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6D+v3/Nm0j0TRH1xh4733kthLNmgOxH6pMXCiiwUvd4OpnQtP7xe9YF4C6wz?=
 =?us-ascii?Q?Q3nU7X82phmKJ6IU1tk2tO2Soxr2xYfTcZqoTj4brr8bHwxUTEsBXrLtUAOd?=
 =?us-ascii?Q?DzlGWoRxERqSU1HhK9WzqfkHYJcLvwHso0XVhhVa84lDBjLLXXA3U+ZW7XNv?=
 =?us-ascii?Q?irVM7/BxDT4oRZKi7zBVCauoTnYbHmZMt+WT9iiu/fqnK/WrdnXQi+JKrRf+?=
 =?us-ascii?Q?uwIg8WWONGUUOdt4jEmFT3zljKOFG017+MlLgB5RuedqEcU4yHCmBChqeJmB?=
 =?us-ascii?Q?8wk6EJGb4lkjPwqbPUeqnCek0MTW0lUr5UFLu/XNxVSgb/Po0GQtSLGHNq/E?=
 =?us-ascii?Q?f2tj5qfdd4N5fi6OhHKgRnut8Jhs3YGuI1ORg/lYHPCJaF7jpHnHZO0zPuzd?=
 =?us-ascii?Q?sMZkYHXojVRvoC1Tvmz1vthrcyAY7kDl7nXMQrxGqxegnBgnjqrvXPEoIytW?=
 =?us-ascii?Q?7ygf7UowQWk2LPMeLC3a0rAf83ur5tocOAs/lNzhWJrRa1+qv94SpsFPXRrr?=
 =?us-ascii?Q?LWxqhAIQnBMhzM/HlhEwFIyDJBcGxbftofRFL0MLzQF0Ba67VUg/jgw+Xbme?=
 =?us-ascii?Q?zmscYua90/ok9+vyrdYDkEg5oiLhosRSsG6D3dlgK5EP8wBE7zVg5wy6mSjx?=
 =?us-ascii?Q?899GbVu0pDW1F0XSBnOcCGwOht6yKKiRgPa0CJLue1QuVvnI0exDkp0HOPoN?=
 =?us-ascii?Q?5BnYAK5XRIYgEcSKXsex3scOR9LTzkDZN0N4vPMuGDWNpwPQLQL2tt5Zfvod?=
 =?us-ascii?Q?LUnBNljYNbhsGZGrI2DhzWKwE1L3i9/6x3WLmoTUvhs15MqsZUi0WApI6RlB?=
 =?us-ascii?Q?uOEH8Oo5rlx2EaGVWYjXxHfuh+S4bunA0mk2PD71yH8uhIMVF3t3vpJ0k/ND?=
 =?us-ascii?Q?kK2p2oqMOLKsa8b6MKlTDkKwvMLF+WCUbgXDCh+i64FKKjw/k7o15qgIioDF?=
 =?us-ascii?Q?vySVoA8RogK2W2W2DZq0QZZ4Ff84+2WaUIyHwr5UrEbSA5OytEurT4qm85HD?=
 =?us-ascii?Q?RFqmFeEjEwHnQJfyvJdWMCE6y4OnKOSa286llXfoDSQiAb7cVfs6ssAhHdgt?=
 =?us-ascii?Q?V0rOX5/mqNlzBNFjKw8QAV7qcOelT67eSaO9RZokwOu1EsEe+e41QylnRfrB?=
 =?us-ascii?Q?ijfXU7dVeHf2rzXk/p1BKNYIz04nQ7bW8ancfJ9dNWohsU4qqcqiSa0+iOLP?=
 =?us-ascii?Q?jaUbYqtorUkREAD/LWzodQZkmnEiy2mTDzAdaBbpAetI+XEZcgGpcZqdtZ3U?=
 =?us-ascii?Q?OnkGL1RNVGs9WuiYdKt5wuK0yQrilrkVu4a68XmvRnhfe9xTTpw9mS1ub7Qs?=
 =?us-ascii?Q?Idir/X0suU0XgBZtfbPLXFaYVuFEsTKI6bbHQ5lq70dddEV7Dkzn3GrhApqU?=
 =?us-ascii?Q?eOjlGnTK2VbGIEGiWBR36evloSBWfVxzK3mojJJ7aXpxhTp2mD5rrxvwpjg0?=
 =?us-ascii?Q?RbMVxA66U5Co2rbFRICZfhnjJ4wShWSjqT/XmODkpWF1QoNK3mHsBcO1AuQ2?=
 =?us-ascii?Q?mQsMWvdnJ4tJku3Gzuz4AGkCO6sKchFsJjPL?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(36860700013)(7416014)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 17:56:32.5138 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ce52832b-9b33-4321-d48f-08dde5930eb9
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8008
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: KVM guest_memfd wants to implement support for NUMA policies
 just like shmem already does using the shared policy infrastructure. As
 guest_memfd
 currently resides in KVM module code, we have to export [...] 
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
 [40.107.93.73 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1urKcZ-00047g-46
Subject: [f2fs-dev] [PATCH kvm-next V11 3/7] mm/mempolicy: Export memory
 policy symbols
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

KVM guest_memfd wants to implement support for NUMA policies just like
shmem already does using the shared policy infrastructure. As
guest_memfd currently resides in KVM module code, we have to export the
relevant symbols.

In the future, guest_memfd might be moved to core-mm, at which point the
symbols no longer would have to be exported. When/if that happens is
still unclear.

Acked-by: David Hildenbrand <david@redhat.com>
Acked-by: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: Shivank Garg <shivankg@amd.com>
---
 mm/mempolicy.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index eb83cff7db8c..3d797d47a040 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -354,6 +354,7 @@ struct mempolicy *get_task_policy(struct task_struct *p)
 
 	return &default_policy;
 }
+EXPORT_SYMBOL_FOR_MODULES(get_task_policy, "kvm");
 
 static const struct mempolicy_operations {
 	int (*create)(struct mempolicy *pol, const nodemask_t *nodes);
@@ -487,6 +488,7 @@ void __mpol_put(struct mempolicy *pol)
 		return;
 	kmem_cache_free(policy_cache, pol);
 }
+EXPORT_SYMBOL_FOR_MODULES(__mpol_put, "kvm");
 
 static void mpol_rebind_default(struct mempolicy *pol, const nodemask_t *nodes)
 {
@@ -2885,6 +2887,7 @@ struct mempolicy *mpol_shared_policy_lookup(struct shared_policy *sp,
 	read_unlock(&sp->lock);
 	return pol;
 }
+EXPORT_SYMBOL_FOR_MODULES(mpol_shared_policy_lookup, "kvm");
 
 static void sp_free(struct sp_node *n)
 {
@@ -3170,6 +3173,7 @@ void mpol_shared_policy_init(struct shared_policy *sp, struct mempolicy *mpol)
 		mpol_put(mpol);	/* drop our incoming ref on sb mpol */
 	}
 }
+EXPORT_SYMBOL_FOR_MODULES(mpol_shared_policy_init, "kvm");
 
 int mpol_set_shared_policy(struct shared_policy *sp,
 			struct vm_area_struct *vma, struct mempolicy *pol)
@@ -3188,6 +3192,7 @@ int mpol_set_shared_policy(struct shared_policy *sp,
 		sp_free(new);
 	return err;
 }
+EXPORT_SYMBOL_FOR_MODULES(mpol_set_shared_policy, "kvm");
 
 /* Free a backing policy store on inode delete. */
 void mpol_free_shared_policy(struct shared_policy *sp)
@@ -3206,6 +3211,7 @@ void mpol_free_shared_policy(struct shared_policy *sp)
 	}
 	write_unlock(&sp->lock);
 }
+EXPORT_SYMBOL_FOR_MODULES(mpol_free_shared_policy, "kvm");
 
 #ifdef CONFIG_NUMA_BALANCING
 static int __initdata numabalancing_override;
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
