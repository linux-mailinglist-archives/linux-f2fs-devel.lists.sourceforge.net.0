Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D0DB3898D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Aug 2025 20:29:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yt/qLrm3D0erd7EHj0fmBlrGKcYFi4Sa1AlD+YqTD9s=; b=HAfhaqTN92QV0agoLhoe2CCGRC
	7h/sWSJJQ3jJTHJdSPdPlmVVwXU1ZXCquAcZ8cPFiVRgOaKzeqO56OpFQq51H9bV3YIvT8tpWjvcH
	AMxgczPTxGJzn5oMzZ9tLoQTLPoL5/clMYh/q5pH799i+QZOKMdCLL6gyTost4Emdt2E=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1urKuD-0002YW-GE;
	Wed, 27 Aug 2025 18:29:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shivankg@amd.com>) id 1urKuC-0002YQ-Ic
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Aug 2025 18:29:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mh45BlQRd8lKAcWzWmeHjSQU39/827vrG2yxSJSUH2s=; b=OrfjjBclWw0MmxYIUs2ZY/uVbD
 +wNceunn+lofBEPn8sdFBLm1yQkzHwX0DbVg4Yoexa96INvDfV66Yq6qdG2PX9assvLcv5wHfqju8
 UDo9ofMbOSz67MISu1r4aeZqqaXj5Fmh+xv+QY7EYNpWPkcUVFoxkt00tFZIL+Ri/Two=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Mh45BlQRd8lKAcWzWmeHjSQU39/827vrG2yxSJSUH2s=; b=foKx9x5oqenwbzbfe74bywxjVz
 /JXbNhVYbSYz9Sl04fBGxvu6rx5FuAetSYQnub7A7zmCmPfc0uoMpSWNFg5+bKlbnvkR5AZJA46jG
 li5QwjlM9i6wi573H9cjNPq5uoi18dNcY+wQh1guBJ2eYL2ydE0j2yJPByd9j6yuj6pQ=;
Received: from mail-bn8nam12on2077.outbound.protection.outlook.com
 ([40.107.237.77] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1urKuC-0005h0-3c for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Aug 2025 18:29:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Crbxdl7vQNLQxLfHFuTNfAYDotXG4cZausWBd2QQ12uhsZkpSPC0Olnn6ln6p1BtwIcSsqQBpvYVIl041iZNoWI8NP6vdfwNaSKBCngNYxHvr3WmtL5lbsFgjE38Sq8OTuuOyRnkejKPFumQERjVzYkk19Iwn+hcgBzlHLHjKoK7v8t4FVuyE0W+A22tbrwUOvNla9cxy34O+PmAU6oD2kXACB9B/ZdJbL0XiIcNJZLCAA+4AAoDvtmaB1sffnq/mcl6Qu3WHnELrXvhzidkIU5yGfmAHqsY7T3xDPn6jQdM70rHoXz9Qz11ViXOYB8dLJcijU8tY0wh1tn8WrpmPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mh45BlQRd8lKAcWzWmeHjSQU39/827vrG2yxSJSUH2s=;
 b=XxAwEoG34XHdDgaZ7XhQHRf/JblZjgxVDV8T0eTY4P5NvOy4+LQYaNf0S18f8mIRhPbISTPhs8K02yPCBsZ9TKOzxk/nwyrO1DSe43H/b4Yr1b7ooFwSGmcVlBop35z6B+Fj+nNlctU/0VZsJDeWmKXfLaKzjb+pYa6lJwVzlACwFgH0ePXfwMB2s3OvLr/2be+ilGnhQLOa0Sq30UDdAeDhWI9DY6MBJjkv/eCbXzhWgcRN4DhFizWFl/7THXJ79vG7fpM87QXdSwP1+q40THciv+t485x3mjglmDQxvIJAGZlIwmAw80jWUiLNWs+LKoqeqagz7vA4H0vm8K78pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mh45BlQRd8lKAcWzWmeHjSQU39/827vrG2yxSJSUH2s=;
 b=saqCQBEKniu2NdXJ0fKOFA32ETu+Ouz/ptHQgvAj9A6g2SvdgGJeUHYj6NTyOmx0O4G/4lHrGA0jhYQCi7i/2R+4hKq4az0EFlXiFT1tYWQfj1ae6tbDYx/aATKbnVpLelPV+yYbkQrXJdTjh+7CsnI/vBm6jzAvAnSDO6xX66A=
Received: from SJ0PR13CA0149.namprd13.prod.outlook.com (2603:10b6:a03:2c6::34)
 by CH3PR12MB8233.namprd12.prod.outlook.com (2603:10b6:610:129::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.20; Wed, 27 Aug
 2025 17:57:11 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::e0) by SJ0PR13CA0149.outlook.office365.com
 (2603:10b6:a03:2c6::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9094.6 via Frontend Transport; Wed,
 27 Aug 2025 17:57:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Wed, 27 Aug 2025 17:57:11 +0000
Received: from kaveri.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 12:56:50 -0500
To: <willy@infradead.org>, <akpm@linux-foundation.org>, <david@redhat.com>,
 <pbonzini@redhat.com>, <shuah@kernel.org>, <seanjc@google.com>,
 <vbabka@suse.cz>
Date: Wed, 27 Aug 2025 17:52:47 +0000
Message-ID: <20250827175247.83322-8-shivankg@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827175247.83322-2-shivankg@amd.com>
References: <20250827175247.83322-2-shivankg@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|CH3PR12MB8233:EE_
X-MS-Office365-Filtering-Correlation-Id: df7a1307-3632-461b-0cd8-08dde59325fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IrCqZiqASNJkr8Bzps5Md5zNXQTaaQPHmuCU5wucKi7dGsruYQeAD5qsMHUv?=
 =?us-ascii?Q?roDslivbOLCdj2GVZnKw2s1MkXKf3Fw4k7iKNNZUettCfVFr4vZcmwfD2Bb8?=
 =?us-ascii?Q?XYFkwo3Jiw8YFfr0VElE8pntEtoANb8CHcO38Iwvmmb3iCFNP0HPi+s4ZoLo?=
 =?us-ascii?Q?L52T+wJ7nKZ6onP1ad+WD6b/7zFCreWepCAVlYAxioAPcTqpSnWUoo7iWbTo?=
 =?us-ascii?Q?TNMIHUWLFCYfo5BifYKe3bQB8de+b226750KwgFrcumeM4vJSKUd4wqZA/t0?=
 =?us-ascii?Q?0eRDzH89kiBiUOfx6Vca4eeCz+K5CdnmPfpkYThBY1KJB97g9/NvW9Utbixo?=
 =?us-ascii?Q?3fSLsZECxYspI0hJf5WiBgh3qyfTVaKwf41z7EBcgMsBSW4PIyUQOqDN6JO1?=
 =?us-ascii?Q?EgDPKXvRp0WuLXbF9gNv2Cyog+NuiYcYEvAEylSQXqpSZyN3F4wp8TAdX3sA?=
 =?us-ascii?Q?IpdB1S67xW1w/gmO0I036w+dI5JnWHssgyPBDWlX8ib3jz1wcxHWmBBBJArP?=
 =?us-ascii?Q?EobxRz0FxaRfZ2z4ioPkLwuVRyAceBTT9rHCYLc0PN6g57L4T982WJnULy04?=
 =?us-ascii?Q?lpmnXJq31FKkOTGyKqJWy31Pu+4kGtsfvrj7NsVrB53qaUJbTU2cq4iegbXy?=
 =?us-ascii?Q?iqkyQYonJ9jQaqPJHKwBgqyaevt6+V04jkCtvNDeH863NjFVC39OLzrMNJ0A?=
 =?us-ascii?Q?X06t7tqTBiLm69WEMzat559QoFgQKHkxQvIh8txi9JhNaZN8e+ihFreMHsm5?=
 =?us-ascii?Q?mALpbGVAYN1TmvYAYxwGgkc9yEXnEGK1s1Cp8Y/3u9nBmnwiSjWfzjjOF0hK?=
 =?us-ascii?Q?QmsjJrz9hlienBq1lyqEJ30IdzRX0K6u8KyXhl7r0QR59DMHPnwfxB8Mf+vJ?=
 =?us-ascii?Q?0PH09DxFzuyKvnT1kNurWVJ2u0ncW9prm6//kHwIWHbixkWs9EpdA/h4yh15?=
 =?us-ascii?Q?PR1JZ/cJr+3lIgxMpNiYoOEvgn+nuwrcuBSf8KeAfzYYEV4Xo3oJoKszMSzX?=
 =?us-ascii?Q?8r24y3WETpnsmLvjYPvMubBpGVapx/p66x2N5bR7a4FiTPb0CEqVswcdQuYx?=
 =?us-ascii?Q?yAnmiYavvw2dW36vALopCn3mIQD/s7QByX0616/DyBlyX+zUlncrOt/BS2mY?=
 =?us-ascii?Q?XTMsR8kA7MXyzPgIOOSQhbI1CLrVxD7AvDb28K9EiFQOQt16iD3mB89yRK9p?=
 =?us-ascii?Q?f++p3y47uoftQDKar/+NV8u0wNxmIcXpY4r6s5iVhiVuEQf1ktAlH9208w5f?=
 =?us-ascii?Q?U8ciDte7GN6vMoKEbtNs3CLc+yKUqLjGr7Ih1FJciWZAs/EMYYhUXByYG2my?=
 =?us-ascii?Q?qOUUGBlEpnngqUZ+0mGbZtJvbsjd3iA92cSUeaHgc6sTjF9YIoln+s+/282Q?=
 =?us-ascii?Q?zUu7ig8yJgKNokmcbGnkOJqtuKkesJJYarkPtundAHwe/ie/OhPq6jqhOvFx?=
 =?us-ascii?Q?2GVScC5n+G+X6Spa35WzO/iZsDD5F1Qn+4RM9iKIzbAkECTba4+bl9+bGwfU?=
 =?us-ascii?Q?T/INWH/efkKV3Whtvplue8hv6FTO0UG9PB+C?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 17:57:11.5234 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: df7a1307-3632-461b-0cd8-08dde59325fa
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8233
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Add dedicated inode structure (kvm_gmem_inode_info) and
 slab-allocated
 inode cache for guest memory backing, similar to how shmem handles inodes.
 This adds the necessary allocation/destruction functions and prepares for
 upcoming guest_memfd NUMA policy support changes. 
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
 [40.107.237.77 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1urKuC-0005h0-3c
Subject: [f2fs-dev] [PATCH kvm-next V11 5/7] KVM: guest_memfd: Add
 slab-allocated inode cache
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

Add dedicated inode structure (kvm_gmem_inode_info) and slab-allocated
inode cache for guest memory backing, similar to how shmem handles inodes.

This adds the necessary allocation/destruction functions and prepares
for upcoming guest_memfd NUMA policy support changes.

Signed-off-by: Shivank Garg <shivankg@amd.com>
---
 virt/kvm/guest_memfd.c | 70 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 68 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 6c66a0974055..356947d36a47 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -17,6 +17,15 @@ struct kvm_gmem {
 	struct list_head entry;
 };
 
+struct kvm_gmem_inode_info {
+	struct inode vfs_inode;
+};
+
+static inline struct kvm_gmem_inode_info *KVM_GMEM_I(struct inode *inode)
+{
+	return container_of(inode, struct kvm_gmem_inode_info, vfs_inode);
+}
+
 /**
  * folio_file_pfn - like folio_file_page, but return a pfn.
  * @folio: The folio which contains this index.
@@ -389,13 +398,46 @@ static struct file_operations kvm_gmem_fops = {
 	.fallocate	= kvm_gmem_fallocate,
 };
 
+static struct kmem_cache *kvm_gmem_inode_cachep;
+
+static struct inode *kvm_gmem_alloc_inode(struct super_block *sb)
+{
+	struct kvm_gmem_inode_info *info;
+
+	info = alloc_inode_sb(sb, kvm_gmem_inode_cachep, GFP_KERNEL);
+	if (!info)
+		return NULL;
+
+	return &info->vfs_inode;
+}
+
+static void kvm_gmem_destroy_inode(struct inode *inode)
+{
+}
+
+static void kvm_gmem_free_inode(struct inode *inode)
+{
+	kmem_cache_free(kvm_gmem_inode_cachep, KVM_GMEM_I(inode));
+}
+
+static const struct super_operations kvm_gmem_super_operations = {
+	.statfs		= simple_statfs,
+	.alloc_inode	= kvm_gmem_alloc_inode,
+	.destroy_inode	= kvm_gmem_destroy_inode,
+	.free_inode	= kvm_gmem_free_inode,
+};
+
 static int kvm_gmem_init_fs_context(struct fs_context *fc)
 {
+	struct pseudo_fs_context *ctx;
+
 	if (!init_pseudo(fc, GUEST_MEMFD_MAGIC))
 		return -ENOMEM;
 
 	fc->s_iflags |= SB_I_NOEXEC;
 	fc->s_iflags |= SB_I_NODEV;
+	ctx = fc->fs_private;
+	ctx->ops = &kvm_gmem_super_operations;
 
 	return 0;
 }
@@ -417,17 +459,41 @@ static int kvm_gmem_init_mount(void)
 	return 0;
 }
 
+static void kvm_gmem_init_inode(void *foo)
+{
+	struct kvm_gmem_inode_info *info = foo;
+
+	inode_init_once(&info->vfs_inode);
+}
+
 int kvm_gmem_init(struct module *module)
 {
-	kvm_gmem_fops.owner = module;
+	int ret;
+	struct kmem_cache_args args = {
+		.align = 0,
+		.ctor = kvm_gmem_init_inode,
+	};
 
-	return kvm_gmem_init_mount();
+	kvm_gmem_fops.owner = module;
+	kvm_gmem_inode_cachep = kmem_cache_create("kvm_gmem_inode_cache",
+						  sizeof(struct kvm_gmem_inode_info),
+						  &args, SLAB_ACCOUNT);
+	if (!kvm_gmem_inode_cachep)
+		return -ENOMEM;
+	ret = kvm_gmem_init_mount();
+	if (ret) {
+		kmem_cache_destroy(kvm_gmem_inode_cachep);
+		return ret;
+	}
+	return 0;
 }
 
 void kvm_gmem_exit(void)
 {
 	kern_unmount(kvm_gmem_mnt);
 	kvm_gmem_mnt = NULL;
+	rcu_barrier();
+	kmem_cache_destroy(kvm_gmem_inode_cachep);
 }
 
 static int kvm_gmem_migrate_folio(struct address_space *mapping,
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
