Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 126A5B38994
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 Aug 2025 20:30:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GYtJBfEqRfSaqow5pwmt2iFDWA3FzKYtagB2oqJrxOA=; b=LnZKuXqOtx5/ru4pvkpeQA8hH2
	PwKJQ7HxadalOaoveoVnR6jpJB88F8wrnt2V8IxH/1k0rQNc0YZ6dbJGLgdHKPB08/dW4JKgHTZZH
	BNd+7QvM641a3upIBk0fg6dMoETDysn02mwSj+vDaHXiUxmRzzxPktnmeaICyOHGBXlw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1urKux-0002bK-UK;
	Wed, 27 Aug 2025 18:30:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shivankg@amd.com>) id 1urKuw-0002bE-QL
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Aug 2025 18:30:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/e6Jgz0C8lfh2En1qxZ9wpwHLCjCP0tDRkKtWJlUsEA=; b=MJnqHux5Lk2z2WJfnRzyJ5iuMo
 /RQrGupFHA7K4kZQdq5cpOSRD3jn7MS2nwduUDWB7KiCWL/RQiueuFPD0Widq56SWK7HfFlEG+v9P
 QuT4vuObfTQBRSDOOeW8KswkzfvwJ0uSfzvdfP07/4eG5avHE0aRCRl1DkT7FrkgfsME=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/e6Jgz0C8lfh2En1qxZ9wpwHLCjCP0tDRkKtWJlUsEA=; b=Bdp3s8St7JbXSRd0ObkQy1pC03
 KM6gXWM6fJYspmf2RSothHj+ZbFJ6/Eh6/1qWAHau4T4i8+zMGPak7rgAWFG8Zt8MN697ic0JRTYf
 1GdX358IXq5mLyBXmMTpz4cfyXmEJCiQBnI5rTG+tR11cNGY6RUAz1+Jk3FCLEyKZa3o=;
Received: from mail-mw2nam12on2049.outbound.protection.outlook.com
 ([40.107.244.49] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1urKuv-0005lM-QE for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 Aug 2025 18:30:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ACFNB5RSGOfvrx5XCERj/UKTDQmMNmf7ZAG7AhhncsSdLGD9mhzRpUiYeRJY5HahZ9ag7OARtI58cUSahV6MNFJV8q5H5x2wlxU4weEZRpNKuwp+of8oq+0YMQm2mMxX57i078rtn/oziv+BFpn9JUPeom8fRRWCmQKYdg7gyDCusEaRjuA1s5APwsdO9bfnpjbOr61pj5fLrZMOmi1/dshltVcL1tMSGaBkKDjCBWS7sdKpEDpmaZtv6h0b0AFYbUGUlMdIUk6ZCKO8Cp5eyBpXxLRGUavtaM6ie5A6r9wC0CECPi2TgRCTQr1cx8cB7Xchz1Fy+8CZi6nrpdFEKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/e6Jgz0C8lfh2En1qxZ9wpwHLCjCP0tDRkKtWJlUsEA=;
 b=otBJtoa8figBxgh+uTnA8P8JKFX1wUHhc4X2t2JVO7/BgFgVE+FZq9t5v5YFFIJIFrZo/RRDUU3YnbYb3D8oh0TuIRQUhJLpB5seaACEcwZ6PlDccy/qM75LfTPKYtN2S58/nrOo1PV4lrWl80dfyxsqp98rY7jES2wEmtDPZrGy3SGsAWn6qqIDyU0rYveRltTALmfqLX5oezwaRixQc2lpfTodXmwKW3de5UozduYT88NcW5aTUNaTIGdt13XdMSEyVPp9gk/6xxkilnzNQl9OwBLZy8ZPnlL2FhD3nkmKBpkp3KY/jnuQTD6LNeg286WByOGTZpq6AwFaUlwyug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=infradead.org smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/e6Jgz0C8lfh2En1qxZ9wpwHLCjCP0tDRkKtWJlUsEA=;
 b=odbfqC4tNb3bflofiow0K1Y0KNqaR6G3XTRSEMsJh4fev+TNwFyPpnZDWYYg2FHhcNTXyHsADeZvyA0tS3PWcAZEyzc+6XmQUGZrUmzfSOs9+OxO+WxHbwRWpYnNjapNbJnq0Uf9nu4na46aGqNAeIHXZNGXFufFnQS5mGMhP+o=
Received: from SJ0PR13CA0136.namprd13.prod.outlook.com (2603:10b6:a03:2c6::21)
 by PH7PR12MB7380.namprd12.prod.outlook.com (2603:10b6:510:20f::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.19; Wed, 27 Aug
 2025 17:57:28 +0000
Received: from SJ1PEPF000023CD.namprd02.prod.outlook.com
 (2603:10b6:a03:2c6:cafe::2a) by SJ0PR13CA0136.outlook.office365.com
 (2603:10b6:a03:2c6::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9073.12 via Frontend Transport; Wed,
 27 Aug 2025 17:57:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 SJ1PEPF000023CD.mail.protection.outlook.com (10.167.244.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.9052.8 via Frontend Transport; Wed, 27 Aug 2025 17:57:28 +0000
Received: from kaveri.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Wed, 27 Aug
 2025 12:57:09 -0500
To: <willy@infradead.org>, <akpm@linux-foundation.org>, <david@redhat.com>,
 <pbonzini@redhat.com>, <shuah@kernel.org>, <seanjc@google.com>,
 <vbabka@suse.cz>
Date: Wed, 27 Aug 2025 17:52:48 +0000
Message-ID: <20250827175247.83322-9-shivankg@amd.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250827175247.83322-2-shivankg@amd.com>
References: <20250827175247.83322-2-shivankg@amd.com>
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB03.amd.com (10.181.40.144) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023CD:EE_|PH7PR12MB7380:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ee1adec-18e9-4e9c-d928-08dde5933005
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|7416014|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gUuuW1xuXx20eFsRLZhY4eCN9NIrVoHKS0TjVRIf5vRWOcVR54vMgu3EU2l8?=
 =?us-ascii?Q?P27gbJL5Ai8SwFb2dL+x3FnROYR7nmni5SDmaC8kzQhyty+s10MxAHJCQuGr?=
 =?us-ascii?Q?ftuBkl/V9sA3T1M6a7TpjkLWQGGUQPi3HBOlO+ZKd3YnDBQE/83vm2FShadT?=
 =?us-ascii?Q?BVN4SGK7smE7wbDRUNE4LPavm1Ku9Zq0j7AexNTaiwvpo7QC+/EPZI/+6s/i?=
 =?us-ascii?Q?hDdvDpTq3lYOazVea8KEaKU0Zye8m+RtBIZtSf6x1Wl23A3ze/im0Ug7nkD3?=
 =?us-ascii?Q?oIRw3SfdWO2V1rq0eAOU+7IJcAL9xngAYqP/73vaSpQrMwjES/dmD+1gms1T?=
 =?us-ascii?Q?SVCGZ87MN9jxk5DWSAp3QQw5mwZzmj8mPMdIWxzcLDNTsQm43nL2jPmrLw76?=
 =?us-ascii?Q?5/vp4/pQ3X6E26BpSJ2PekJzunEPY/p1+BtAqTlGGI9Mo0ffrNJHzJvsVYpa?=
 =?us-ascii?Q?CCFef1L0I+9VLm6grjt0R6n2tQ8ra9U9v9YxRgq1+pPlt1llaskRP+F+GW18?=
 =?us-ascii?Q?hxl3Oqt9J0Za9UWAzKtHZem9Su1EOetgRyB/XzrmIz0uFlI1parNK2eW3S4y?=
 =?us-ascii?Q?zzhrjmvEUoqtXgJKfghz8KQrV2hXv015y/CSlN9IVOVU9BipZ5oak/gplWv+?=
 =?us-ascii?Q?InmS/M2LUItil9kSIibxO7a1E4eVKttEaUzZsxCWy/J9fTvnGRXoAjujNVKG?=
 =?us-ascii?Q?2Uke6KBytes6FoiqHQtdY/L2qdYisOSzL1lnIPU9/XjjRY/lElNacM1V4SHE?=
 =?us-ascii?Q?+zDQD/kYv6eMDShgH1c+N+6t+5fyyCqZ5nFCjlwkLC6Pa61oQI2piZ96T0EQ?=
 =?us-ascii?Q?KHWS9XtgPc9THIt9QSNBkLx2CKjwnw6zj8QDQOXW7GDRjzDKS16hGFYlNaUe?=
 =?us-ascii?Q?EK5oR5fXUBbIT8RArRTX0kjlDp/4RgmvZnhjGSgWY+XYe2YB00HP/ptZ7vax?=
 =?us-ascii?Q?HuzGRoF5bTVgzizsVLvoFsT0g6J5PcGjPSJX8/YaTAtbiSZ4NRI+u5AEx0Cp?=
 =?us-ascii?Q?46Vft4vCfYwI9VfX+to5YpSpV+nTFIS/egqzY5lV0dLdSejwwp/4nlAh2oJI?=
 =?us-ascii?Q?4Vfn81p5xIrT86ggXYo1Xa2s6/GhAe2k3EOigi9QoyexpPuPom9DdsqlEPgy?=
 =?us-ascii?Q?AWN3TU4gk9UPXct+6cLEioA9pHjpJn8SNSyrP3XVuXGxhEwtQdyw8nuaDOmA?=
 =?us-ascii?Q?Z4urg3Mb7lz2dkU3RMkm0T9XGpIrRxY/Qdw1yjCoagU+BFILf5olQM0nAR7s?=
 =?us-ascii?Q?+/7FzZovQggSCv+deuFEhxibfZ7GnY2jwun4LkeHZYd0ONzINxHle/JR0FEs?=
 =?us-ascii?Q?wc7sUP8OguILHLuRBB+Z/M/lgFUKfHspwPf/b0sqTa8qv32q4m/p/tpyIKU6?=
 =?us-ascii?Q?B05lFxGoXdaC8iJK2ZhqFt/1CDoxB9cQSYm+KlLuyH81QG3tyNy6FQQ7073y?=
 =?us-ascii?Q?V5wb+dwEMv1VRyqzha6ik7MPZm9OFClc+YIuezmzbor/LBw3krOjX66gLyUb?=
 =?us-ascii?Q?zn/Z3o9SRD3UR7EpO7LZMpgz/Xzd9bwNuHwC?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(7416014)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 17:57:28.3774 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ee1adec-18e9-4e9c-d928-08dde5933005
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF000023CD.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7380
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Previously, guest-memfd allocations followed local NUMA node
 id in absence of process mempolicy, resulting in arbitrary memory allocation.
 Moreover, mbind() couldn't be used by the VMM as guest memory [...] 
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
 [40.107.244.49 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1urKuv-0005lM-QE
Subject: [f2fs-dev] [PATCH kvm-next V11 6/7] KVM: guest_memfd: Enforce NUMA
 mempolicy using shared policy
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

Previously, guest-memfd allocations followed local NUMA node id in absence
of process mempolicy, resulting in arbitrary memory allocation.
Moreover, mbind() couldn't be used  by the VMM as guest memory wasn't
mapped into userspace when allocation occurred.

Enable NUMA policy support by implementing vm_ops for guest-memfd mmap
operation. This allows the VMM to map the memory and use mbind() to set the
desired NUMA policy. The policy is stored in the inode structure via
kvm_gmem_inode_info, as memory policy is a property of the memory (struct
inode) itself. The policy is then retrieved via mpol_shared_policy_lookup()
and passed to filemap_grab_folio_mpol() to ensure that allocations follow
the specified memory policy.

This enables the VMM to control guest memory NUMA placement by calling
mbind() on the mapped memory regions, providing fine-grained control over
guest memory allocation across NUMA nodes.

The policy change only affect future allocations and does not migrate
existing memory. This matches mbind(2)'s default behavior which affects
only new allocations unless overridden with MPOL_MF_MOVE/MPOL_MF_MOVE_ALL
flags, which are not supported for guest_memfd as it is unmovable.

Suggested-by: David Hildenbrand <david@redhat.com>
Acked-by: David Hildenbrand <david@redhat.com>
Acked-by: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: Shivank Garg <shivankg@amd.com>
---
 virt/kvm/guest_memfd.c | 67 ++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 65 insertions(+), 2 deletions(-)

diff --git a/virt/kvm/guest_memfd.c b/virt/kvm/guest_memfd.c
index 356947d36a47..85edc597bb9f 100644
--- a/virt/kvm/guest_memfd.c
+++ b/virt/kvm/guest_memfd.c
@@ -4,6 +4,7 @@
 #include <linux/falloc.h>
 #include <linux/fs.h>
 #include <linux/kvm_host.h>
+#include <linux/mempolicy.h>
 #include <linux/pseudo_fs.h>
 #include <linux/pagemap.h>
 
@@ -18,6 +19,7 @@ struct kvm_gmem {
 };
 
 struct kvm_gmem_inode_info {
+	struct shared_policy policy;
 	struct inode vfs_inode;
 };
 
@@ -26,6 +28,9 @@ static inline struct kvm_gmem_inode_info *KVM_GMEM_I(struct inode *inode)
 	return container_of(inode, struct kvm_gmem_inode_info, vfs_inode);
 }
 
+static struct mempolicy *kvm_gmem_get_pgoff_policy(struct kvm_gmem_inode_info *info,
+						   pgoff_t index);
+
 /**
  * folio_file_pfn - like folio_file_page, but return a pfn.
  * @folio: The folio which contains this index.
@@ -112,7 +117,25 @@ static int kvm_gmem_prepare_folio(struct kvm *kvm, struct kvm_memory_slot *slot,
 static struct folio *kvm_gmem_get_folio(struct inode *inode, pgoff_t index)
 {
 	/* TODO: Support huge pages. */
-	return filemap_grab_folio(inode->i_mapping, index);
+	struct mempolicy *policy;
+	struct folio *folio;
+
+	/*
+	 * Fast-path: See if folio is already present in mapping to avoid
+	 * policy_lookup.
+	 */
+	folio = __filemap_get_folio(inode->i_mapping, index,
+				    FGP_LOCK | FGP_ACCESSED, 0);
+	if (!IS_ERR(folio))
+		return folio;
+
+	policy = kvm_gmem_get_pgoff_policy(KVM_GMEM_I(inode), index);
+	folio = __filemap_get_folio_mpol(inode->i_mapping, index,
+					 FGP_LOCK | FGP_ACCESSED | FGP_CREAT,
+					 mapping_gfp_mask(inode->i_mapping), policy);
+	mpol_cond_put(policy);
+
+	return folio;
 }
 
 static void kvm_gmem_invalidate_begin(struct kvm_gmem *gmem, pgoff_t start,
@@ -372,8 +395,45 @@ static vm_fault_t kvm_gmem_fault_user_mapping(struct vm_fault *vmf)
 	return ret;
 }
 
+#ifdef CONFIG_NUMA
+static int kvm_gmem_set_policy(struct vm_area_struct *vma, struct mempolicy *mpol)
+{
+	struct inode *inode = file_inode(vma->vm_file);
+
+	return mpol_set_shared_policy(&KVM_GMEM_I(inode)->policy, vma, mpol);
+}
+
+static struct mempolicy *kvm_gmem_get_policy(struct vm_area_struct *vma,
+					     unsigned long addr, pgoff_t *pgoff)
+{
+	struct inode *inode = file_inode(vma->vm_file);
+
+	*pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
+	return mpol_shared_policy_lookup(&KVM_GMEM_I(inode)->policy, *pgoff);
+}
+
+static struct mempolicy *kvm_gmem_get_pgoff_policy(struct kvm_gmem_inode_info *info,
+						   pgoff_t index)
+{
+	struct mempolicy *mpol;
+
+	mpol = mpol_shared_policy_lookup(&info->policy, index);
+	return mpol ? mpol : get_task_policy(current);
+}
+#else
+static struct mempolicy *kvm_gmem_get_pgoff_policy(struct kvm_gmem_inode_info *info,
+						   pgoff_t index)
+{
+	return NULL;
+}
+#endif /* CONFIG_NUMA */
+
 static const struct vm_operations_struct kvm_gmem_vm_ops = {
-	.fault = kvm_gmem_fault_user_mapping,
+	.fault		= kvm_gmem_fault_user_mapping,
+#ifdef CONFIG_NUMA
+	.get_policy	= kvm_gmem_get_policy,
+	.set_policy	= kvm_gmem_set_policy,
+#endif
 };
 
 static int kvm_gmem_mmap(struct file *file, struct vm_area_struct *vma)
@@ -408,11 +468,14 @@ static struct inode *kvm_gmem_alloc_inode(struct super_block *sb)
 	if (!info)
 		return NULL;
 
+	mpol_shared_policy_init(&info->policy, NULL);
+
 	return &info->vfs_inode;
 }
 
 static void kvm_gmem_destroy_inode(struct inode *inode)
 {
+	mpol_free_shared_policy(&KVM_GMEM_I(inode)->policy);
 }
 
 static void kvm_gmem_free_inode(struct inode *inode)
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
