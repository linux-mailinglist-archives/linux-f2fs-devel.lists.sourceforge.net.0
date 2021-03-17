Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3332F33ECF6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Mar 2021 10:27:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eryspARlYa1e8dCC+kBW3AyaHpR4Al/Z7hzAihKmz0o=; b=HtuLKvJWWFR8N6HWbCIK3n90Ls
	4H9h0RICg358oGRvLLH69wSkHacZmg9lVqjmaCqwpnuF4BDExjU0CGxe8dOR5WrJ6a+L9p1RDZiY7
	33miQGodWkYGc9UO7sOjGKPT0r0tcgHmhxyfb0ACHLNH5BYNr55JGEY0hn9C/5hnK8BY=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lMST3-0000EO-ST; Wed, 17 Mar 2021 09:27:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <guoweichao@oppo.com>) id 1lMST3-0000ED-4J
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Mar 2021 09:27:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nWvustVOOmyCi3TRbkIc8YmDy4fBbxKmqGi5hJnYqpE=; b=jYtc6EebtWnQbz0dQ8QHup+jOW
 DaXAcVfN1i5I822sHlGV8aKDnZTkzWq0mFqxTWCC5awgGkcHsCA6fSl5d+j2JhHq4Ke0reCc9zGy7
 NMWU7xRXrd0Y9WofVbc242j03FU+n2HHpih9cWGb7SR+f8F/ycRFTucI0PsHxM+a8xHI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Message-Id:Date:Subject:Cc:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=nWvustVOOmyCi3TRbkIc8YmDy4fBbxKmqGi5hJnYqpE=; b=S
 AYiFsNY+wbl3qKTDDqoK6RvX/wcJOBPqavGAG5PzyJU0yrIkMHOjxmI0YHxZV/60P7sgHNgWN4wsb
 bOiemNqyV7K0iq/jLhdb2N7f5dh6B44r5XfeGXw63jUZAqufkRtVpBkI/XpTiueZNzUKU+S6/IP8V
 /3r6ckfLYbN9RZrs=;
Received: from mail-eopbgr1300059.outbound.protection.outlook.com
 ([40.107.130.59] helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lMSSy-00041n-Hv
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Mar 2021 09:27:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LMGH005lPOqBkWhTjyUPAsgLZuw8Oz5bAzGKHHT8mttLoxGdURihHri7vAE+FY4+vEGwHzKmfvYH9XEmOVKmRWmTY59wVT4635mMBup2HP4guZY2coWjibWEz1YCxnc02v05Q7Kk4lovFtLQx4IIgL9ZjSZOQawgOHdXWboPmHqNiI60Vh0y26Mwt1VzEzrgF/VVjBPs8qY1x5Xu5wlRm4YlLuNppb/r/KE/iduyRNQVg1WzMJONW84vAzW/O5bms5ij7zgUDN4kATKfhbz7pe3hXgxSVjECh2poq151JdAlWdzWx4j9UpRfMXnCbYMr0+KJo9F0KOML76mTg8sZDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWvustVOOmyCi3TRbkIc8YmDy4fBbxKmqGi5hJnYqpE=;
 b=DV5vds2Sb6fj8+mOOH2zlLEOJcuArDQubLxsht/3awGEADzxbsXuDGPoMAE2agA9FybAJvwkCrSSvVNto9U4XeBNAimjJAl6ZhfvFh5Q6RVcl9w3eEex9TSVjHHySvKnklSC04s0HclUONbWsBk0egGeWUXkMsLZAMX6/VFAZYvYFE9Qw2+wjJgo9lRjujvLAt/4o3ienloBHqnz5ELiA71Zd+msKvUhlysvPofljy/gtLeEO3g9x169scfs6nwT5N2to/Ds47B+ZK8E56nEV9BJhfMf9pxbHmLthC3qFQTNXQZIlUutgxXcCFcSCqRB8LtITonb43d3KtVE3dKmpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nWvustVOOmyCi3TRbkIc8YmDy4fBbxKmqGi5hJnYqpE=;
 b=CrfjwQ9xOOP6A9kAPdlRaCXSX71F2M3vWhrWLIr0uwLKre61jI+t1o2fAeOWmMs2ng9j7CJaXgDoRe+Dwz4hSR6aNQgl7K+mHBqTFOG5c6DZPTvXNe+tcco1nwQZO2ziKoK6Ujrb6sLNgPPgYn3GR1p5FrrSNyq8QvfaHbniWu0=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oppo.com;
Received: from HK0PR02MB2690.apcprd02.prod.outlook.com (2603:1096:203:6e::12)
 by HK2PR0201MB2147.apcprd02.prod.outlook.com (2603:1096:202:10::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Wed, 17 Mar
 2021 09:27:38 +0000
Received: from HK0PR02MB2690.apcprd02.prod.outlook.com
 ([fe80::9cfd:51dc:bd7:62d2]) by HK0PR02MB2690.apcprd02.prod.outlook.com
 ([fe80::9cfd:51dc:bd7:62d2%2]) with mapi id 15.20.3933.032; Wed, 17 Mar 2021
 09:27:38 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 17 Mar 2021 17:27:23 +0800
Message-Id: <1615973243-31157-1-git-send-email-guoweichao@oppo.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [58.252.5.72]
X-ClientProxiedBy: HK2PR02CA0168.apcprd02.prod.outlook.com
 (2603:1096:201:1f::28) To HK0PR02MB2690.apcprd02.prod.outlook.com
 (2603:1096:203:6e::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from N80263842.adc.com (58.252.5.72) by
 HK2PR02CA0168.apcprd02.prod.outlook.com (2603:1096:201:1f::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3955.18 via Frontend Transport; Wed, 17 Mar 2021 09:27:37 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 40b5c8d2-3ad0-4114-97ca-08d8e926e81a
X-MS-TrafficTypeDiagnostic: HK2PR0201MB2147:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HK2PR0201MB2147FCA01C48805D4C80552AB66A9@HK2PR0201MB2147.apcprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WjewlmO8BjEyUA6ANxTAm1ke/0Yk87eKdIDSFoBdycRJdpd1VkH6u+0OigQ2laqIF7ms5DYFdnILxYmgH95DTcfYmd5SFYTkPC171hooQzme0+CbX4awNJVsNTvNUlmdaTSAXrVFj5n1tY7WT/Oj//7tS/UzsTAEQzO8VcIMFb6tyBnHrq3J69Pvdra79BL+UGxjUVdf3wt7GQnp1ZLG9AZZ9V9i0jRXxFGDyo2yPeFF2ZfjB37mD53CBu8M0bouvcMkC3LTvHz8LGxm69B7O+YfxC76NG/dbwacFC6JKPOuwduj+slNHXGHRH9oCX61MpxKu4p+jVmurAOB08cuoJYg+i3YZuiyiCGNyEGggiWXp075FPAd7fHaTYon9+O7KdVxcWcjdNWakeq3r5DTmleo/BnjM+hJYdW5miv2QEPB4zSn+i+xaacUBD0F64x/e2/3qsd3RXhKI6q7ejy0nAqmwZXuSZkloF5Klx7pDlnIWdGYkOkkzfvZ5WStf2NMF2yCv1eBcj2K+6XA5+GaoeQm1938ZlCZnbrxiLL6IUSPtlqHdKYRrKLKYvfeSIQcY9asKCGbiSgkyh0TFHAm7nNXI3/UC49lLaMevuu0HXk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR02MB2690.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(136003)(346002)(366004)(396003)(376002)(83380400001)(2616005)(26005)(8936002)(5660300002)(36756003)(2906002)(107886003)(54906003)(8676002)(6486002)(6512007)(66476007)(6506007)(86362001)(16526019)(4326008)(186003)(66556008)(478600001)(6666004)(66946007)(956004)(52116002)(316002)(11606007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?US/3afbUdT53XqY6Yc+D217ZnwiWfB4CPsPOImNyRKEg+tWqTpYY8eR1dlfX?=
 =?us-ascii?Q?SYmRDy62EGX7Ybv7saAa4uOYJ4gbrkeiKBzTHNMpxxDHCDJLOdmRVRXHLqln?=
 =?us-ascii?Q?28i8usmXEnjxoyc/GtiJhf2w3Y/fW2hOkhUqRhRypW5gtagueSK4wYzXvaxE?=
 =?us-ascii?Q?HMCa2YW1FhAp+VdfyR0Grdri5Bt8JqoRJhJ8lyj1YIWm7eU+9bhKx7paFrXg?=
 =?us-ascii?Q?zzU81WGJBSQQF5YwpLe6pTvgXh0R+mT1Mj44xOdHf82WmuHTfNLZalaVDorL?=
 =?us-ascii?Q?U+8161qGAc5ln+aOH+Nk8Xh9NtMSuyCRt9tj5FFC772vnx1yvnOEbEj1pbXX?=
 =?us-ascii?Q?JwCAfcIqEXailXlqt176VToPKD/xeX/RgH+7/I3J30Z5jt1343ljCheQH5qK?=
 =?us-ascii?Q?LFjEtYJxYTPGzeEdlj3xhrM4xu1DVqedS9NU4Isu1bsAsHh6eyhJLtgC4ISL?=
 =?us-ascii?Q?F92Ro3/BAQsGNKu7RCJeztHJcmr7q9CGJ2WZkkikwu02PRfCyXe9AX85uMvS?=
 =?us-ascii?Q?EGPO29/1x3cDiACD1g88dH2CPYFC3umpCpaKpiYfYWfKg4ikCRj+VGH7SBJh?=
 =?us-ascii?Q?3ckRxa0zQl4rcnT+uXz6j/26Sgw6qL87OfeCh62LNNYltEtYSFPn0+QmgbaX?=
 =?us-ascii?Q?KIuwpjcO+qYcMUchDkFUNhGudqEqc3UW5wL4io876uQoewT1an+LJbnFSjUu?=
 =?us-ascii?Q?UimZfnsmts7l+hBvTPgemsVtRLjY8KDpJ97b8yTbyF3eAHuYJJNotlBXHZy9?=
 =?us-ascii?Q?iu2u6fKlI6aRITmh4QtFbTSbKJ0UbEMUPTSHqt/gQYRQsO3TFZE5FBBxaxKx?=
 =?us-ascii?Q?pns+N3Mk3bf9JAqh/S9tedfsgx6WDQtuSO/PYTtPJ3B0DFiwSHkyg4u3FDkI?=
 =?us-ascii?Q?BQtZSX8ThCOaiqj31dkA2YK8HWmECe/+tnraeIGrKwGRppLWlpZFBFOMxEKr?=
 =?us-ascii?Q?hNG/GsEjeygaaHYAbOqmTdA4+mfx1j5oMT+dOLm/P0AxHnfUxLG4OiIdahnf?=
 =?us-ascii?Q?OK1vkpbZNnc5MofXSpyjDTwmuBaJn8pHx1v0Ykt78VnAp50OCQaPPuL5wd7U?=
 =?us-ascii?Q?pLd3csIsJuX56zNEQbs4m2XDKXKniMtCJykRS5vTw54jkd2w+G3Mv2kUpcfS?=
 =?us-ascii?Q?U8l5IjmIYzMGGOmAfUPk7S+BtLxJf3NpYFR2UsrV9y8+CMazfdaasgHIMW1+?=
 =?us-ascii?Q?q8CLwGVuyy0rmdWD3vMQqwTWqpiyrtde6Inxz6EMvtGEox6yoofUED30XSI1?=
 =?us-ascii?Q?G0Uh+4O6bUESfH309Pf9QqCI5TcuZ4bzFntlmpHxevMfijcKIJTF2WFU3qKr?=
 =?us-ascii?Q?LajJiFSd41cukXjQPNU9iOe+?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b5c8d2-3ad0-4114-97ca-08d8e926e81a
X-MS-Exchange-CrossTenant-AuthSource: HK0PR02MB2690.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2021 09:27:38.7189 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NJEXosWDC/o7iSp9AMvVS5KS1u3rXckUGIj9FvC/XJwz0dofgnCCUZXch3NvvP/QPeBqr/a+4RMjoYvtZgEU7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR0201MB2147
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.130.59 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1lMSSy-00041n-Hv
Subject: [f2fs-dev] [PATCH v2] f2fs: do not use AT_SSR mode in FG_GC & high
 urgent BG_GC
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
From: Weichao Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Weichao Guo <guoweichao@oppo.com>
Cc: fh@oppo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

AT_SSR mode is introduced by age threshold based GC for better
hot/cold data seperation and avoiding free segment cost. However,
LFS write mode is preferred in the scenario of foreground or high
urgent GC, which should be finished ASAP. Let's only use AT_SSR
in background GC and not high urgent GC modes.

Signed-off-by: Weichao Guo <guoweichao@oppo.com>
Signed-off-by: Huang Jianan <huangjianan@oppo.com>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/gc.c      | 3 ++-
 fs/f2fs/segment.c | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 86ba8ed..d96acc6 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1120,7 +1120,8 @@ static int move_data_block(struct inode *inode, block_t bidx,
 	block_t newaddr;
 	int err = 0;
 	bool lfs_mode = f2fs_lfs_mode(fio.sbi);
-	int type = fio.sbi->am.atgc_enabled ?
+	int type = fio.sbi->am.atgc_enabled && (gc_type == BG_GC) &&
+				(fio.sbi->gc_mode != GC_URGENT_HIGH) ?
 				CURSEG_ALL_DATA_ATGC : CURSEG_COLD_DATA;
 
 	/* do not read out */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 32b915e..6e1a5f5 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3264,7 +3264,9 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
 		struct inode *inode = fio->page->mapping->host;
 
 		if (is_cold_data(fio->page)) {
-			if (fio->sbi->am.atgc_enabled)
+			if (fio->sbi->am.atgc_enabled &&
+				(fio->io_type == FS_DATA_IO) &&
+				(fio->sbi->gc_mode != GC_URGENT_HIGH))
 				return CURSEG_ALL_DATA_ATGC;
 			else
 				return CURSEG_COLD_DATA;
-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
