Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E5DEAAE3C2A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Jun 2025 12:23:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JHHs04cZFg2wSZiXTHKcPCspB4PilNjSBVdQthGNQxk=; b=ZN+gPfOCDxizcczC8OAwEXqgHm
	aLRV7JX+TYpc+vuoYG1xILJFZPs+qHnEmrjawuvoTiKt4Nh6Yr7YYiv14lJmNvJBfN3QLPwL0Mpky
	OnpZMxjDGUz9ulnfpEfQPaIuH3Ljg4NteCgMZVP0N+pvwlAgDfGeqM+8NBljR+UnkUpU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uTeL5-0001pr-3C;
	Mon, 23 Jun 2025 10:23:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shivankg@amd.com>) id 1uTeL0-0001pN-7b
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Jun 2025 10:23:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aai6tISOHJBDHPBKuHq7jDpuz1N4BLyKb2RTot3ncf0=; b=VA1IbVqL3z7ZDS0Vf/IjyFAs1w
 F/OtFI13rDaaO5clNvCyeQrWk6p9VVC8tdg7How65KuzgBe736bJGQAW4F1FURsPCVxtTPxt3wyOr
 WQjJh3+xmKDd9z/iLFbrqwfwm6R6ihx5+O4hu1qsL60Py1hNgmAYt4q/u7uUW8RDXWug=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=aai6tISOHJBDHPBKuHq7jDpuz1N4BLyKb2RTot3ncf0=; b=G
 k8g3tvR26dFiSYPvXW10lOmf+eU0Yfg8KG49EUrG4/EFCkN2aqQT5wbPILh5zWS0PfYs88nomGmCH
 7hzYqgDZtEPdtcP3U0zLc1+GPgrPmxkL0RrsD6Y9ehbH12T3fDt5+o9qj6D1+ya7QWlitQewRoEav
 yKyN6g5jNyUBP5SE=;
Received: from mail-dm6nam04on2046.outbound.protection.outlook.com
 ([40.107.102.46] helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uTeKz-0001Sb-Dw for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Jun 2025 10:23:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iDFLk/XFVnW7mHLsYPl+wE5iwUp4bRd1z71Q39mQe74Oo7MfW6dzX5s54WqJJJ5ZprNroxHIlJxgwycxYW/FfdGC+77Z51kkV9wKP3INkMFE9qIOJ6j0HE6uIDNfrkj1ZnXK4roPGNGS+UeOLO8xRHLjnk37HaFN2o1Nvyf/4D6xnPurqtDkEQ/Ppq8GZZKaM69Ss2+dJv4Aa7kJvzJHtXAVNWeZ0mg9RySIYwt5rW0pw3XscaAfRD/SlqzChrGQj00EqtBmN/hhkWlM3ravWE9u6p84h+VEpaV+NSwFNFC00bGuFMIMivNnWRIoSPsvTt1tLKP8pEWlICN+2TcwjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aai6tISOHJBDHPBKuHq7jDpuz1N4BLyKb2RTot3ncf0=;
 b=KRnap/2LaEozHxmjbi3uGly171fpesKzaMDGHeQSUr1PIiXAG38iexz3UfKbLlWk+E67LymJNFxLL0fPys9AT5Br8kVrHqtK5QB4+2z1m005Izv7JVRBXrP6BH+xK5F1SAXCwDkiPYQzEgqGkhykuahYP4R9HDPupTnZg1cvmkc+qc9TNE1AbtMKjULeExYz/atM7P+dwKz1UhA5lgvZ9V7Y+jFdVJIBmbcL/wXNGNSF2m8QS7AYrVwRBJp51IxXOOTpYuJjlBZGD/smGGHRO+z7cK6i9cP8c6WGoEi0NYxzwd2QK9aoSDnr2CxOsRClb07jx1VbM332wSc5UXdLtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.dev smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aai6tISOHJBDHPBKuHq7jDpuz1N4BLyKb2RTot3ncf0=;
 b=I9CsgjfHeZt7/zJH0t987avoZWeEMJOYwTjXiBSRruS8OWb83Rx27MZ1natEbPJ6FwsZx7Wwi88iqZ6fPxFPTdDd7mVqOCpGkNN3SvxY+fvnhLgWTq75Kk80sJBft4/52aA6z+58uQCgN69nNgncWVuQdpNLK0hIXzp8feg8prg=
Received: from DM6PR08CA0059.namprd08.prod.outlook.com (2603:10b6:5:1e0::33)
 by SJ1PR12MB6194.namprd12.prod.outlook.com (2603:10b6:a03:458::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Mon, 23 Jun
 2025 09:50:54 +0000
Received: from DS1PEPF00017091.namprd03.prod.outlook.com
 (2603:10b6:5:1e0:cafe::e9) by DM6PR08CA0059.outlook.office365.com
 (2603:10b6:5:1e0::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8857.29 via Frontend Transport; Mon,
 23 Jun 2025 09:50:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DS1PEPF00017091.mail.protection.outlook.com (10.167.17.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8880.14 via Frontend Transport; Mon, 23 Jun 2025 09:50:53 +0000
Received: from kaveri.amd.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 23 Jun
 2025 04:50:46 -0500
To: <kent.overstreet@linux.dev>, <clm@fb.com>, <josef@toxicpanda.com>,
 <dsterba@suse.com>, <xiang@kernel.org>, <chao@kernel.org>,
 <jaegeuk@kernel.org>, <willy@infradead.org>, <akpm@linux-foundation.org>,
 <david@redhat.com>, <vbabka@suse.cz>
Date: Mon, 23 Jun 2025 09:39:41 +0000
Message-ID: <20250623093939.1323623-4-shivankg@amd.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Originating-IP: [10.180.168.240]
X-ClientProxiedBy: SATLEXMB04.amd.com (10.181.40.145) To SATLEXMB04.amd.com
 (10.181.40.145)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017091:EE_|SJ1PR12MB6194:EE_
X-MS-Office365-Filtering-Correlation-Id: 838974f4-c710-4b0b-073b-08ddb23b71ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|7416014|1800799024|36860700013|921020|13003099007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?anw+Z1BK4R2vbqiHmDUWFIwNPGJmfZmz5540NEzd6dPqQSn3i4ve0w4c8e9X?=
 =?us-ascii?Q?R4wbg/ZB3PL5m+lo8PVFiUrDrtgi3o5kSq57BimDqEjceLkO18q8btWlJLGg?=
 =?us-ascii?Q?oROzwo9AZ1IU6d8jqfHQt6Y6rgEkYKgnttbvSyErGNaEXraKHF94np7GeSKZ?=
 =?us-ascii?Q?1FFNtUvqn/fZ9FEsJNdIQgfrjQVDuF1pK+6jmEWL4AZj5S/x6G7wThFAwcSk?=
 =?us-ascii?Q?iXpkaNDryxhE4Ojui5PeW18U/AM3CflhBBUMhCv6VUfub9QJHk4owcAE1EgG?=
 =?us-ascii?Q?RZxs+oxFItfvWXBeCA6j56rJbqY7POWEFoCtlnMBPmQS8NqE8ZbDlL+sware?=
 =?us-ascii?Q?gZqvafPj69XBuHdiHxOEOk3ua1jbz73YnH1stY8Pem1UqSmwOkH/6ah77DSK?=
 =?us-ascii?Q?RKirrlt5bekdEoym/LMmZOGxU2tm2dUCWWvavmXAljNiKM8kl4u2OwBtFwZL?=
 =?us-ascii?Q?6DWQpqSGFUULP905kxyxi8zVZt8L9nMMzW7H9dfd+oOfgj2KVqOy7pDx3HWq?=
 =?us-ascii?Q?JtxmhKfY3wei5shi+GNLPrnMlGXt1++v5iEffcux+Pftzsoo0nNbhUewZB2v?=
 =?us-ascii?Q?qULAKXSRk6LKHsNg0zjqOSsNKKm8aOgfsJ2B9ponCLFKgeP8pQI8WjjXdXN/?=
 =?us-ascii?Q?oD6mrezTiZ8RFLBED6FB2K0pEWtyHWtznRpuIZNRHQ3JiowhFHqMCRAXqeiQ?=
 =?us-ascii?Q?USNffEE0DofFXmVd8VTfdQcT68BaBeL5BuKebiZZX34bFxUuxKQMR9ZpmsEx?=
 =?us-ascii?Q?8xgYGZEKZbMyhqeyiypOuuU+cJo1yQm2TNtNe1/DJl1RH+3eehx7PzhLUZDT?=
 =?us-ascii?Q?Gx8MgMUqPOwzzzfxRasDkG7j1Oy5xc6OxT1R4Qn+YYaah4mK+fAPbakAi76W?=
 =?us-ascii?Q?7366YCXNQUJ/yBNDKEQJlkx4/wn6xyLzRTAeAGa0gzj0p5SLhkoJusMS9Rra?=
 =?us-ascii?Q?zR5diTsQpByJYRRzjbRwhzO3vjGHYqaZ9iQeFus73h+yKNHIsUqNA9kF13xR?=
 =?us-ascii?Q?3NhXTZMkH7iCIhfVZl7RJJH+meCVxkxtF7XWfv/Ize74mQlJqOMBJw0UqyPr?=
 =?us-ascii?Q?uuCAmDXZ8A9vnY4Ya1QQSvh7oD4dIT5AqWMkDokdK9PVEhSDKIO3pkPy4nej?=
 =?us-ascii?Q?ics7WWz8WJtzp0RjOi3dPv1pfsmGp4yLjV2y8xMAAhxlJILqnIiJ7WNk6CN9?=
 =?us-ascii?Q?OIyxBqfkcgq2eHynTJDnOOOz2qzeewpnP6p7Qmx8ZWbyQDATcs1dCkaXt2nZ?=
 =?us-ascii?Q?MOcQUa+rFJrmmdtO7GaNk3kq8Tf56qOe9IMEleNJJXIg1NVoWGvJRjEJaSLy?=
 =?us-ascii?Q?W9w9s1QsLrtPdXNCfBxoUgQ0Sywhuwb/2PDVDNV3XUrSQDN3GCHTIvSK/aBy?=
 =?us-ascii?Q?v7uGnug6UnWbP20b/yA37FrizDXBisbmx52slyOJ4A9KvACLgW4Z2j9mtgyY?=
 =?us-ascii?Q?AUU1QJ9Dn1NeVHv0nSmLi2gDA340gZloKYcPZaQenl6rE/zm7ZQgUmxH9yS3?=
 =?us-ascii?Q?IFxletNtIcTMMaB6wWnIi2Kg4efHrJGoZjjL4asxjQIWYj+s7zAK7v9qcA?=
 =?us-ascii?Q?=3D=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(7416014)(1800799024)(36860700013)(921020)(13003099007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 09:50:53.9816 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 838974f4-c710-4b0b-073b-08ddb23b71ec
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017091.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6194
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: "Matthew Wilcox (Oracle)" <willy@infradead.org> Add
 a mempolicy parameter to filemap_alloc_folio() to enable NUMA-aware page cache
 allocations. This will be used by upcoming changes to support NUMA policies
 in guest-memfd, where guest_memory needs [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_SIGNED             Message has a ARC signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.102.46 listed in wl.mailspike.net]
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uTeKz-0001Sb-Dw
Subject: [f2fs-dev] [PATCH V2 1/2] mm/filemap: Add NUMA mempolicy support to
 filemap_alloc_folio()
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
Cc: Shivank Garg <shivankg@amd.com>, zbestahu@gmail.com, kvm@vger.kernel.org,
 dhavale@google.com, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mm@kvack.org, linux-bcachefs@vger.kernel.org, lihongbo22@huawei.com,
 jefflexu@linux.alibaba.com, pankaj.gupta@amd.com, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org, linux-coco@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Add a mempolicy parameter to filemap_alloc_folio() to enable NUMA-aware
page cache allocations. This will be used by upcoming changes to
support NUMA policies in guest-memfd, where guest_memory needs to be
allocated according to NUMA policy specified by the VMM.

All existing users pass NULL maintaining current behavior.

Reviewed-by: Pankaj Gupta <pankaj.gupta@amd.com>
Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Signed-off-by: Shivank Garg <shivankg@amd.com>
---
Changes in V2:
- fix checkpatch warnings.
- touch up commit description and fix code alignments to make it
  more readable.

V1: https://lore.kernel.org/all/20250620143502.3055777-1-willy@infradead.org

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
index 66bacdd49f78..392344232b16 100644
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
index 48d07939fee4..a0808c8f897f 100644
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
index fe8071844724..00e9160a0d24 100644
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
index b3c1df93a163..7ef937dd7624 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1942,7 +1942,7 @@ void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
 		return;
 	}
 
-	cfolio = filemap_alloc_folio(__GFP_NOWARN | __GFP_IO, 0);
+	cfolio = filemap_alloc_folio(__GFP_NOWARN | __GFP_IO, 0, NULL);
 	if (!cfolio)
 		return;
 
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index e63fbfbd5b0f..78ea357d2077 100644
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
index bada249b9fb7..a30cd4dd085a 100644
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
@@ -1977,7 +1982,7 @@ struct folio *__filemap_get_folio(struct address_space *mapping, pgoff_t index,
 			err = -ENOMEM;
 			if (order > min_order)
 				alloc_gfp |= __GFP_NORETRY | __GFP_NOWARN;
-			folio = filemap_alloc_folio(alloc_gfp, order);
+			folio = filemap_alloc_folio(alloc_gfp, order, NULL);
 			if (!folio)
 				continue;
 
@@ -2516,7 +2521,7 @@ static int filemap_create_folio(struct kiocb *iocb, struct folio_batch *fbatch)
 	if (iocb->ki_flags & (IOCB_NOWAIT | IOCB_WAITQ))
 		return -EAGAIN;
 
-	folio = filemap_alloc_folio(mapping_gfp_mask(mapping), min_order);
+	folio = filemap_alloc_folio(mapping_gfp_mask(mapping), min_order, NULL);
 	if (!folio)
 		return -ENOMEM;
 	if (iocb->ki_flags & IOCB_DONTCACHE)
@@ -3853,8 +3858,7 @@ static struct folio *do_read_cache_folio(struct address_space *mapping,
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
index 20d36d6b055e..0b2aec0231e6 100644
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
