Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 631D647FB67
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Dec 2021 10:41:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n1mVK-0008OD-G6; Mon, 27 Dec 2021 09:41:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1n1mVI-0008O7-Sj
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Dec 2021 09:41:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q4Y7vUCw/DbJyAfD9aRJT/3SNO3eLQh4AOqd9C/GVTg=; b=T9kd0hGJxQxW4lcJifwPJeluAo
 M2MMGikA54+O9PSBsLZC9tdULG+Gg2u2FBTZE7XmDTeoyl+KnXiC4HvOtVFSclTTPncHVf+0SE2CG
 LNbEbNM0rbmq86uhkM75p9PkCqcewvV9aMepMrP4RxAbR9iv0Z3wWMA65cKkibtFZBBI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=q4Y7vUCw/DbJyAfD9aRJT/3SNO3eLQh4AOqd9C/GVTg=; b=D
 s6pqPOdOHsiiuEVnBB1bMlQIZsZzrdJVgfucIJOCV+iUSYdCVlO7dnpb8x4MSDJE+jEJOB77AwJFq
 ITW3Tbqzsle2vLSIKowMylN1ky5Ym9Y+UZpfkjenU01jy7+O6gVMVJdq+4bIjkJkFejsKC+ndjAUd
 6dJBkPHXAQBUdqsY=;
Received: from mail-eopbgr1300105.outbound.protection.outlook.com
 ([40.107.130.105] helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n1mVD-0000aE-5P
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Dec 2021 09:41:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BErK026zOxysfxGrVX9etwW+9FljFqJY8cNAUSHcN/WK5xL7iMT0+SMjcibebN5Et3wjAJ9WAO360a2ryCfwDEas/Myt3T3rOnKsPN7Sjc+/9mHOSHflMfJiyFb21wfucP27WSkFa9u2q6IefNV056googb47wQwp+vhMY3e8QYO01J8c7SabSds3bZzBLjKD2TivVW8VSh1Jr5tx/k07opMOuTUuL49SFOeDWfnh+4KEmkB9H5vX8LH1raX1s/tuL0RfSm1zMbEl1tmbgw+ONPHKKG0oJM7G+psHktmZJ9Uyj1TpDuAuYS5Hn+51T0Bn6QDiHVsFOK1YLxzIUFSjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q4Y7vUCw/DbJyAfD9aRJT/3SNO3eLQh4AOqd9C/GVTg=;
 b=IYB6nuw832ZOGB5cb3P/hOdKDyQvT8pDX8j+Z1twg9/xLtIdOmQ/FNEbd5ULCaXDFC9YLDMMdSt+bN95Sdu3/REsJK69GmlNo26M1qAPoGK742pUJrTmghoAeTwyCYmAk9n8KvsImrb+lOuQt5rhgfHxBx/eEuQd404ugJ+6pp4up293xMFkuMXoFLgJbEQRslPFsYV/Q/A270UFNkPXPA3BYiElZCKUoXoa4oQWQAOXHsOqXaYhT7PM9YKFh6rQm/j38Pxt3srUp6UalBklxyNxva6mLXkNlbdlCY0ljg8/15xyiUBVMsBupxJV5V2G0K4lZsA3U3w0FVMBfNoj/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q4Y7vUCw/DbJyAfD9aRJT/3SNO3eLQh4AOqd9C/GVTg=;
 b=XuKgORAPWLj1EREtuzsUuanSBTdnSITfT8cFCNCqxWOJVb7zeGLneUNG0haxs9Eo3FCHEq1icRTRfRITnX2YFX8TIf1c1fol78AJd9/cnXn9PyI3FYRir9gR2F21yfS7f8/2PO190LAV59EI4oH/h7rUAcy61g+GodxfS0S1hvU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB4337.apcprd06.prod.outlook.com (2603:1096:820:76::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4823.18; Mon, 27 Dec
 2021 09:40:59 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::3422:d7b:74de:51a7]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::3422:d7b:74de:51a7%9]) with mapi id 15.20.4823.022; Mon, 27 Dec 2021
 09:40:59 +0000
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 27 Dec 2021 17:40:51 +0800
Message-Id: <20211227094051.108938-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: HK0PR01CA0050.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::14) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 421e8786-0211-447f-dcf4-08d9c91cfd29
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4337:EE_
X-Microsoft-Antispam-PRVS: <KL1PR0601MB4337D7AB7F068F0567329C46BB429@KL1PR0601MB4337.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:651;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +EmdGXlVxWO/3hAy83KPP6s3maFe8XA4ShC+rZ6gNsdeakx8xgGkNoV8BR6/6TXrfcbQuDFw4vBSGug4gP/Rvcn4VValxzcE8xVehoOgilzvGE5602FPqCuhodaWcKRpj2eXU2R+RyXmFd76MRGY5Syp7DDOqxv5B1sTpqZBtkR+B7aK+tEBpf6m0Sl/TIf/9FECJdn6cTP3c3ZUGAHLQo85XXU4V8TIEnjyd4v2zACNWyNtVy+Jc12BGx4aEs5DLyWZb4fmIyb5qX3QLpRo47FGCjAgqAtOBh/FFysTmyv/iYW0NqwnmsWQWuxUv11H8LWfHTWAJgMcafI/Bg7zCPPHjIKDa71itltXvBP/lQ8kQGZdx++P7GVPm8nmbxM+DyN97lhYg1ws81iItMVB+y3E0OM5C1LXtknmpowiVGXaQrGGdMgQ+ZnswYn4Pn/uiOgRwZgfptD3JBU4nF0tAZ5kPJClS1QaXu1p17VkJbKgAJ75YcDEHwUbdzkifyLGSR5WAHEuqMwvIH8ZJ/Ats+XSbrbjWLO8/J6EFXFHZW/ou+5hjDtKjcHHey8aK3mjWH8MZqBWKs6iLMbcMsLmWLaAIFf4piG/z4Rj7wyAU2Okv5+NZY5HKXLc2ksNPeZUJ4jC78beC1uZymB3Nt+pcp/o6dg9zZfIAcH7OLP7zE/UYe6Qn3JW6z9TwdhDhGOd0jwdj+aV+6xYvqLPfQSTfw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(26005)(83380400001)(6666004)(66946007)(2906002)(6506007)(86362001)(6512007)(4326008)(107886003)(36756003)(1076003)(316002)(38100700002)(6486002)(2616005)(5660300002)(4744005)(508600001)(186003)(38350700002)(8676002)(66476007)(8936002)(66556008)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w5WRT/L8w3HUakoor/v309jrjNT7pdHc7WlX52D8usezsh0vG04pgTmnM22a?=
 =?us-ascii?Q?nh8ePYu72jSKq90cHx+yApIjkruLIzdrZInYAqAHIFU7zTM6+JLcuFXbM6fT?=
 =?us-ascii?Q?Qqkhc6Mul6HMUW+BlcNDfEw0oeiOsUS4bJZRERbqK/9T7KXgLhDQ+7/eGr2V?=
 =?us-ascii?Q?ThRfJANVys9FlIVv+w+C/YzOOfKph+uu2TpQiMHa6acDLX27qyyPGu1ZI1Rk?=
 =?us-ascii?Q?qp6jwJ0tsw7z/eu8oiraFG3bw3yITNVKN+aPpy1/dbXjtCyNbUDjmZW1eJfq?=
 =?us-ascii?Q?Cbm+j6Wv9SzauXR4bcaN5L5mZKHApFiHtlzuQ1prs3zIO2acN8GYWvplqtcU?=
 =?us-ascii?Q?HAChALdDfeLd2E+47sl0QesXXb+J4v+gDwA8Mlv/wXwjMwXhJIoESzq23PJO?=
 =?us-ascii?Q?mbv5RlLU3Wz6+qIiVWP7x84tPZf1/jacSzqxGpsn/K6nxARbWiXW/9uBh7hW?=
 =?us-ascii?Q?cJ3db3WudSCvMn+w1zrTG0zbttVHNSptUg3MWEPfoLpBE+0/AVBNKDxr5le0?=
 =?us-ascii?Q?6G1nc9/r4Dar+aI5XubJugOY3BwaxGfq/Mg/A8Kzq63Qlk3ie3FJNKAFvSkj?=
 =?us-ascii?Q?WLabauGIDjgnPpCFG/3oxFjNvjzpUS6bSxwY//2NbATx3m39eJ6UJn24DS9l?=
 =?us-ascii?Q?kgbSJL2aUz/ircVsXb6XWlmEEb7xwsas5Ztyilpv5j91gvFJQMZAfb5CQZ4T?=
 =?us-ascii?Q?ZDbmGvfxB0ljG6dOeoApW3Q1lqVV+BLsTo7DJADS5UXL61+Uh/Q4KZhFXiQa?=
 =?us-ascii?Q?REd9ozfijp+4cbes56CWyelyERRMF8iOh76OHSzdRY533/F8YLQqt3TteWBl?=
 =?us-ascii?Q?Q9F3bfVW0m1MqKqw1N1gWMMxJ1fDpZ/w1QBTv1ie2q8o+T5PrH1grNL35zPq?=
 =?us-ascii?Q?bJBIUb6A3CjrOKKinpNLGqVAL+Pjb9tNuf3nOQjRPRy4DWt//8WIA3ixCr5A?=
 =?us-ascii?Q?e902lf4HRYzvcciS3s8pPkoNT1dppObet8QT1N+Y4tl68tZHjwRdrnK2QRDo?=
 =?us-ascii?Q?/2VJcOq4M47IA0rdBQr+Bj2H2tKlTmV0y53s6m/JoLc+onKtcnwoSRid0kIH?=
 =?us-ascii?Q?iIOO1YLVeNScywLVa9KkghvdtH2wLOPbY0TT8RB//iuVJg1Z+25KLTs3dwK/?=
 =?us-ascii?Q?W3FdP12WOwOqfUfKYGSjsRkVvlH9aq6jwV2uAdJJYkWSlebnYKfwe8U23eAh?=
 =?us-ascii?Q?nMYGla2m5x8ZIRV+PqFgbRu+FHm5vLLTSv4+lszMn7IDeL33uqgxJPytehFl?=
 =?us-ascii?Q?NU/Qz4cEcxr0qUbzpSCs3eXi5l/ux+OSg/G077edpYHeAEu9H7z0NuoBkutp?=
 =?us-ascii?Q?ghrVqSyE3gRtePhnMiGTVOPq+iDC10ysj3Uud85LAtMxX24cUA+KDsnYYucn?=
 =?us-ascii?Q?8YxNfp+yVxcyzysaGU9gEFfPd0iTFAGCQlX9RReoEzACljjGba0lu1HwNVXc?=
 =?us-ascii?Q?06YL9geRwazd9dDqBJuDbpsXmub1Fc/Ob5bboq9fANWfh0svJdvLMzbHeJC4?=
 =?us-ascii?Q?S9Jy7uxi1jSPEw4AQAXdgU5dcOb1qe5hqBI0Hz3zyDUGZ6bjoibCh+X4lKSV?=
 =?us-ascii?Q?fbyVPoaEMVMMbS+s5/4M7ndETh206U4Mj86TULvBCYizkTPENTD+x53sOhoH?=
 =?us-ascii?Q?R+4GY0ow5vtK8IjX5rvo0Qk=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 421e8786-0211-447f-dcf4-08d9c91cfd29
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Dec 2021 09:40:59.5469 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B78qZqvrME7o3pOm3CxZJyp0rvJ9LJUxzPG9zqpp3VfYi9kACrSpfv3rq5BQcF4QhvgDdWzvtdUzxXaVKQ2n4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4337
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Compress page will invalidate in truncate block process too, 
 so remove redunant invalidate compress pages in f2fs_evict_inode. In normal
 case, f2fs_evict_inode only called when i_nlink become 0, so un [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.130.105 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.130.105 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1n1mVD-0000aE-5P
Subject: [f2fs-dev] [PATCH v2] f2fs: remove redunant invalidate compress
 pages
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
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Compress page will invalidate in truncate block process too, so remove
redunant invalidate compress pages in f2fs_evict_inode.
In normal case, f2fs_evict_inode only called when i_nlink become 0, so
unlikely.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/inode.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 2ab3b424735a..ef30f3698a97 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -751,7 +751,8 @@ void f2fs_evict_inode(struct inode *inode)
 	trace_f2fs_evict_inode(inode);
 	truncate_inode_pages_final(&inode->i_data);
 
-	if (test_opt(sbi, COMPRESS_CACHE) && f2fs_compressed_file(inode))
+	if (unlikely(inode->i_nlink) && test_opt(sbi, COMPRESS_CACHE) &&
+				f2fs_compressed_file(inode))
 		f2fs_invalidate_compress_pages(sbi, inode->i_ino);
 
 	if (inode->i_ino == F2FS_NODE_INO(sbi) ||
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
