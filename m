Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B317735B69
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jun 2023 17:45:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qBH3x-0006uE-RB;
	Mon, 19 Jun 2023 15:45:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <heyunlei@oppo.com>) id 1qBH3v-0006u8-Vr
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 15:45:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9tCzT5ec+lIWaVP//zwec/hbklere7Xyr24Gs0Yam6k=; b=BZ4j8WvLI5dblzA8gvuMff+Qyi
 hg5m05aFQDOBV2KBsizpkeOkYa49naObbQA2LR7AAjb1NjHLdHlSLzFK7wk9EEMf964hScTV9t7J1
 C/Na6eBJM6U0Co3O9uHClQLFsU8zjBKswmGuT77ag6u4fH1NY+tS0Yg1jyQZo8yXv2SI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9tCzT5ec+lIWaVP//zwec/hbklere7Xyr24Gs0Yam6k=; b=N
 J/i2tcd9JOIem01Dcw/PT224hOGc7RIhYa3rr9GjijkYgPcE6CqZ1DXLzMjk7TQkdIZahjPlpYdd/
 3tJ826Bl8OR7tCAvHA9J4Y3HA4mx5CqDu6queSkcMFpXTeQoHOHAjOpmR1YNuPHtbIb+zJmicgUkM
 E5lv4yf8AB5d/mvE=;
Received: from mail-tyzapc01on2076.outbound.protection.outlook.com
 ([40.107.117.76] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qBH3t-0001AJ-CE for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jun 2023 15:45:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dl1CgY+MR3bFoi91sEzLHvymaybMxM/o0khIDuO4xIYJ52tINo2smmbjTY/sYr0TWWGoQaN9If1D+NDHYaC05OL6vhmOgU0FJOeOmSh2G2DGqRMSj9bqYJgX3t9LZiFt8nw49mqUGgkAlr5WtLcr7cG7S0mFT1xOAoerSjCLtVmL1wiLFuYspMHmdPW9MBdAXeydpcAwgVa0Zd4Hq/acvlJDoDP/427t2GvjnaORzgtc5tGGlB0xoCQpQ906YxnZuD6xdBtpRotmpyoNGgAKpSMY8MkXJIL+MfQ3p/UkNcVSKw6dFsmK1N30LrTYkcfjNLZSw3q/DAmTDFFMRcZtqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9tCzT5ec+lIWaVP//zwec/hbklere7Xyr24Gs0Yam6k=;
 b=ZK0ebGfedRAqDGBxx6ORTFtzKm14j5OHLycj7+GKkzzCdwcwTeXMJoIDsiQxxe7jhyhkW4U4Q9PQzalAa8Lp1NIVrfHvtolvP3+eBBq/632/4Cuj85pANsQFxSUe4JLJWKgiLBh1dNXYUNC5VjK9WP+w17mziLud6k3scuxOtDRNshVhV26XEFAaYzD4kfugYaMKDgepp5v4SULpHxOJOJK5yP6rKzOUodCxyunVY+5wJsQ7EovZo0X+i8D5vjdr8O/0nyOpVppvBd/HV8BzWAtYPvQnBcr/SzNW/fh4gBTh+73IQFstYs83BfWQYQ2XEmKQXf9985cZ2z+hCmpcsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9tCzT5ec+lIWaVP//zwec/hbklere7Xyr24Gs0Yam6k=;
 b=o5M0VP4RNvUkq+Ec9QlUM6I8CCTiK0vvnRM6wUDuNxNT85k/JIaIc6XePzmA5kwUo10vNSKhLu1bXwB3/ciHysV7YfBxnwM5AeRLa9DKb3HNYsLFULjxjkWo7M9jno8xIf0igt2R+iOUyQcD6CAQFtNj4Yz4bZSSvRSssCCQUrc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from TY2PR02MB4479.apcprd02.prod.outlook.com (2603:1096:404:800e::7)
 by SI2PR02MB5684.apcprd02.prod.outlook.com (2603:1096:4:1af::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.21; Mon, 19 Jun
 2023 15:44:51 +0000
Received: from TY2PR02MB4479.apcprd02.prod.outlook.com
 ([fe80::bc4a:4d7a:4c73:76eb]) by TY2PR02MB4479.apcprd02.prod.outlook.com
 ([fe80::bc4a:4d7a:4c73:76eb%4]) with mapi id 15.20.6521.020; Mon, 19 Jun 2023
 15:44:50 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 19 Jun 2023 23:44:32 +0800
Message-Id: <20230619154432.2205654-1-heyunlei@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: SI1PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::16) To TY2PR02MB4479.apcprd02.prod.outlook.com
 (2603:1096:404:800e::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR02MB4479:EE_|SI2PR02MB5684:EE_
X-MS-Office365-Filtering-Correlation-Id: 456806a2-8035-4ac6-2cae-08db70dc1de0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z9ZACDLrGA/Ny6mQjRLNEG0W/F2BKV1LUa4KGg35r2ENnKMNZJVoyOcahdZ3z4tB6uIjLo2OhWSwdOQIhWyuVlAJDA0ZgP6hRGHWLQQKSmFateLiUj4lV18YD6qp8cNKJGEoj1t38Lv4NAH/yxutNC/OK/zlcOl5jCms/0ti4qhmDRg5mhYmMu9CNWyIingNBTLdkf0WekfMIb13hpykopC0tGqzArNRgOY7UxHSGsLx3nT5ZiUAHeUgDwqXt9W/DhYQXvLWqk9Qnz9mh+bRvzczErPqiVW8R+5BrVA7sAwKpc5m+0q8XPF1hss/qbYqe8RcAWzn3mHg3XNcbrdZ8w+xFrSRjb9EOaPQ6q3izkjndRWF2ztzJcwMLuKRNVnfJ/qpSL06ozcdMWOJyoxGVByjTHzctUVSZu6mTsscfL5RgnE1sFPIPb5sucl1u12wWabWZCvAx3P9p2G2E4a7uIt9zrjMqhRCkccyCsFL142QlfEqS2H79zZ8TxHlhMHUnPRNsjd5ArnvuDVYcrtkUIRDi4wrr/FLIoxgbey1618dSX0T/tAbPR2aWz5NIhHizkJlxUkCmAd4YV2QY1DHb0tQjicEy5V8IDG61p/XgGtiSgmj+jj9ruF1jmu/mYLZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR02MB4479.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(39860400002)(376002)(346002)(396003)(451199021)(4744005)(2906002)(5660300002)(41300700001)(8936002)(8676002)(86362001)(36756003)(6512007)(26005)(1076003)(6506007)(478600001)(107886003)(186003)(6486002)(52116002)(6666004)(66946007)(4326008)(66556008)(66476007)(316002)(38100700002)(38350700002)(2616005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0RvtKxkgglXnwDerk4t659lElg6J1bA667gd85BTkmGoryEYu2aClrjAPLn+?=
 =?us-ascii?Q?rSAGuf6tpnhb1+Ijl9IidJGtqBTjwm4xSOsx+WrW/0UxikXJYX1KLaCSP3lF?=
 =?us-ascii?Q?owRRo0LhV+p3Vgwwn6ydZh72kU+2ZFl0vtQvo1m/mz4VQHIp5I8krBvfU1y/?=
 =?us-ascii?Q?wmxfoozHaLa+g52y9cg5Pm/L3dd4vH2Y+5lO5XtT4b3qZC6k2O5Yz9kaLApy?=
 =?us-ascii?Q?21xe4q/QBbkmb89rKYKM9N1wkD6FCdwSIPYJdex+ygbDtL9xVimmA1Nxcfxn?=
 =?us-ascii?Q?P1t99SACZ1U4vsex2aKC1xoYkJ6TjOxLkerUZ+R75u/CqtUEKUdfHtSv7iac?=
 =?us-ascii?Q?3LeBp0MFjzzN2i/ISDtKw0IoEjX+o9uYF5pUdiScnLFgo6y6108ECI0NqZGP?=
 =?us-ascii?Q?qiP8PQuaILrZtLEYt4Exkq/G3d8Ro5bdJOL8+HoWUtp30dmFL4GMgKwf7CHJ?=
 =?us-ascii?Q?vwJtJBD40bUFgCPxnWvNn2untDr58zLwX5mLtjJQleqe5nZPhiRAQfD5O/G/?=
 =?us-ascii?Q?ocuULfuKf0wV60I/Cs3SCf/hrBrDvh5VaydWtN4ie91NeFHXLP8zyxmmnf2L?=
 =?us-ascii?Q?5SW710RgkFyha6y1DQPAc4fE6GTbbiIKd+ziWtnUc/SqUE2B68bZxKjxl1LV?=
 =?us-ascii?Q?DTDVhMRTpAlojAW6kDXN5SzQZgoIW5x53p5jhFMto/DtCVXPd/5JlHMz9mSH?=
 =?us-ascii?Q?GduPXOB09PMyB7u9TJjDYIA+m0TN/V9Mheidv1EVtZNofeEYQLZ+VNmqEt34?=
 =?us-ascii?Q?+S0RiL6uHN07Td9lY58F8xN1OaxOat+Enqw3oUeV01+d7WNgPsjpkZRfTE+N?=
 =?us-ascii?Q?NZUPVWSVXvkHHXXEmmf2575uph9aW6PhIhvxy1N4QC7zF3s9gweAL1C/51pZ?=
 =?us-ascii?Q?Js58jwZxom4Ll7FhUc5Co2NJtFwS3TlxV670f7qVKF8e/JGOdZEqK+iJYqRD?=
 =?us-ascii?Q?lSyoHSpl4K/XWrWtUNE9AMwajtt4XJ/GsrbTojQQbytB/mmotzUIO2FPsfis?=
 =?us-ascii?Q?g1C3nnYCWARrNj8hXxXi/gg5w+3ljFarMo4fawN/hYx9gOqKY3UUAB32bBNJ?=
 =?us-ascii?Q?UbQ6Tugws1pnG//OWy6UlchWmmMprVlydu9WaojCffolsmJJDfVCbn4fNXRs?=
 =?us-ascii?Q?LSfaThdKwbs7nojwikESCWwiOXF6h/IvPVK/NwvsdxOhf0jrVw+0MaKeUMed?=
 =?us-ascii?Q?aS4s/aFxBOrfchmeqcoTGYQb0e2qSkGZIKP3QJjdZRjC50fhkRQUT9NZwBVH?=
 =?us-ascii?Q?GmjBh+Ivl1xNDsgCe2TTC/YByfBVemrqfepRiUyUlMY38hHEXafx6DKLm1cA?=
 =?us-ascii?Q?nACH//5kcCZMZpS7koR19DtjVGTJJDCFFXwmItJMnYZf70PDs9o8JCNLWWqo?=
 =?us-ascii?Q?/tqgUxbFQBW4jdHnHy8W3+zFBguIQ5nVN3Cl2Iqh7Hdyq7t97jOh7bYdOtQX?=
 =?us-ascii?Q?d5mnh6l6cYwpm0LIsGLyyBjDtSlTAuA4VfxrXuooBAEExquwosIKYx5Dphl6?=
 =?us-ascii?Q?ZhYqolHp+uITKjbxpf5cVH3TfbXGyGt7B8OlZrMzdYtmFcwOuLs0kncuHmg2?=
 =?us-ascii?Q?Hcvn1z62OUNq5abylcoUCeKbD+Ainxzjcr8xa89T?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 456806a2-8035-4ac6-2cae-08db70dc1de0
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB4479.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jun 2023 15:44:50.1887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SgRVG6REoPJa+9TnfpDqBeDHyjZJk9WU/nKhIxblxjVROdSTqmYe8A7SPiRu5n237ewvCJF5XyTkRQxy6KFWKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR02MB5684
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch count mmap write io more accurately.
 Signed-off-by:
 Yunlei He <heyunlei@oppo.com> --- fs/f2fs/file.c | 10 ++++++---- 1 file
 changed, 
 6 insertions(+), 4 deletions(-) diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
 index f05209a62370..cb42d8464ad9 100644 --- a/fs/f2fs/file.c +++
 b/fs/f2fs/file.c
 @@ -150,11 +150,13 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fa
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.76 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.76 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qBH3t-0001AJ-CE
Subject: [f2fs-dev] [PATCH v2] f2fs: count mmap write io more accurately
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
From: Yunlei He via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yunlei He <heyunlei@oppo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch count mmap write io more accurately.

Signed-off-by: Yunlei He <heyunlei@oppo.com>
---
 fs/f2fs/file.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index f05209a62370..cb42d8464ad9 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -150,11 +150,13 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	}
 	set_page_dirty(page);
 
-	f2fs_update_iostat(sbi, inode, APP_MAPPED_IO, F2FS_BLKSIZE);
-	f2fs_update_time(sbi, REQ_TIME);
-
-	trace_f2fs_vm_page_mkwrite(page, DATA);
 out_sem:
+	if (!err) {
+		f2fs_update_iostat(sbi, inode, APP_MAPPED_IO, F2FS_BLKSIZE);
+		f2fs_update_time(sbi, REQ_TIME);
+
+		trace_f2fs_vm_page_mkwrite(page, DATA);
+	}
 	filemap_invalidate_unlock_shared(inode->i_mapping);
 
 	sb_end_pagefault(inode->i_sb);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
