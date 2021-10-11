Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE4C9428C81
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Oct 2021 14:04:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2MPd4aUAQ/snvZXw6YiyoCRfYsYYCJ5LHXP+QOuzIrw=; b=mi8i1pnoEoDCWAJo4aaCDuvueM
	4cThFBQK6e070h2zGETOsWv7xqau23mWTzRTr+zxa0aVfuC0cT8mWYJN6L0dygeLD9YC0w+jvl3v8
	jfHIkUdMrLDqkHoRlUbL467Z5Mt39BsVWbQZjKAe42LAH4bkj2oQmKjfSTocefo+SIxU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mZu2W-0000XY-FJ; Mon, 11 Oct 2021 12:04:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <changfengnan@vivo.com>) id 1mZu2S-0000XO-UC
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Oct 2021 12:04:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=udChvRHIsPxlZ9rTsWeK1vtbz0Jf1SOWu2pVF3x2Z0U=; b=asolspwcSPNsFS9Aoy44zeevxD
 FjTNdSrg4aSPjdHQmcKJlJoiscpAUq7XszSATB8PAo/DpiqhY+uUnhblrHlJL5TYlPAFjWLR6wHJ9
 kBXCiGLHfxRhpBz5gmpf13Nwd7L+6HXszy8WAWyihq9qPGzUvlA3wB8SFbiugCrQdPuo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=udChvRHIsPxlZ9rTsWeK1vtbz0Jf1SOWu2pVF3x2Z0U=; b=Y
 0/+M+BjTrqWHaakOSO7/lWoLyomfy4nSxR961v6cvAadp66DTys145Cy5oZdVyTeiQSuIIDsUe8MJ
 3kfllqSX8fiyEFMo6VyirxifuJDmHpd7nfW7dGHIFBkv8OL0JAabRQ81f5qArzPHTnfDwmIKNWVC8
 8+GOM/n6uoK+WDyw=;
Received: from mail-eopbgr1300107.outbound.protection.outlook.com
 ([40.107.130.107] helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mZu2P-0003is-Id
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Oct 2021 12:04:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DZABZaZ+tIxLRVQi1PvK8Fst/rdSf2aABBpDbn9mN3C5INFpwnHNuJgDdQAYCtDF4v1mVohSYOplO3NdASVq2yp4mwS2VSH5wBd1YZ4AXNFxJLNDXBTwQm28nnhjG8VWlVORGUGy8MKS+BAzX78ehpTqYd262IlGNj7hmNPeyefEUakGUw+tdpW/ZzqsFBuYxCUda10L+2sEo87Xm6SeoJKcnW0Ph8AuvPpHn6NcUCRhs7LYKLe0TLunPHuBZXDR8j+ABfppY06n+UtP7+N1vwsA+z3GP5eiSH8knL9NojmePxCZGRkejaJAG3ynJXGdeD3iAK0X1mxvzJHd7O13eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=udChvRHIsPxlZ9rTsWeK1vtbz0Jf1SOWu2pVF3x2Z0U=;
 b=ShgF6KjeImmDcemEnepcR9oA3ogDt7JRKX4nWrbieJseRrs5EH9LDBzSUx9w5yjKhz6HzOR5osWtuniKxeHrUI502zk1AhHjelnkj01cbj2LHs5Kf1LSprYCCqxXKobkg15b02E0lrZ51op3RpFt4vh5wzKGW5sxgnjLMLPIvuHTIbp+s2jG068alI+WIpz/ytJThiqOWlGqmP1hpgFSS2CLcs59ukPfHYnuxgiqPRahzM9UXJsG35dok2s9bzempMnLAd7XxDBq2c+tB4j1w8bcjbJQD3IXpPBio2yIU2Ag7MgrIQdQlWzYu2NTQpnUwKA1iA2W3mkwQj5Qzy9y+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=udChvRHIsPxlZ9rTsWeK1vtbz0Jf1SOWu2pVF3x2Z0U=;
 b=gCfG+Vvw/mmfKHnJdfsbY5wSL6WDIhnMrmECeIOmAgGTxvrZJIeyju6XQRnIAQpa1idIgPLuiJw28E2mgF8qKRnPBa8EYQ/5G80vxPH7DZEbi2nbnF4lRttM9bRR1n86V7lJhmsf8d6vRo5cC5FRKVs7ftQ6xbiCieGC2UBzeI4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB4532.apcprd06.prod.outlook.com (2603:1096:820:77::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Mon, 11 Oct
 2021 12:04:05 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::f448:2382:12d4:b8f3]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::f448:2382:12d4:b8f3%5]) with mapi id 15.20.4587.026; Mon, 11 Oct 2021
 12:04:05 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 11 Oct 2021 20:03:56 +0800
Message-Id: <20211011120356.300261-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: HKAPR03CA0022.apcprd03.prod.outlook.com
 (2603:1096:203:c9::9) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
Received: from comdg01144017.vivo.xyz (203.90.234.88) by
 HKAPR03CA0022.apcprd03.prod.outlook.com (2603:1096:203:c9::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4608.4 via Frontend Transport; Mon, 11 Oct 2021 12:04:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 910e0ff0-4f44-4caa-9575-08d98caf38f5
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4532:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <KL1PR0601MB45327FDD65B13F211AC1D671BBB59@KL1PR0601MB4532.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:873;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tyhYoZMBZhfxOZaOopYe9818sqv8NufyUOa3ZcJMFghfQequAINTWwPGf/OZFetOQFY68ujC7b4xIvTxHm4CraEHkbCqf6HdncZKmeSmXOK3YTq0JfPjnA3EQBK091zeC36te2KAUMU7RyF5udivJC7kfnv2EtpgCNRDt4X3VrrP0O1YEU69UoUXjx+2zT+4hmOfBCF4JfJuufw37n8zp54opRyrDLVw9a2MlmhhNJgvamKXmyezRWKQo7kBawx6H8SygxrBKiWulvR/c0oqcoE91sGd4Ht/eOgVZD+8kpd3YAb5tIETbKbe5JUXygG8N+iPGtMNEj7TT9Uz945ostq1XydFxsVb8uErq7rRzWjK6DgCTcnMi1p5Z+UI2TE4CZfrXBZ2qn0qhbPfdIky2IsA1UdZhqDBCg+3D4MfP+g8LlYy+dCRx4q3mXPPsHWgr5hIxEFG47M+PTHe7289RqMM34fCOlt0AtPl3VreQKqBgUArDCL3QyjxMFVv0TWY0x8Lb+TeEj3iL1Wa4inLgu3jiD0GNdzv9LAuVjQATYbaTIJ/dWAdxnAfso9vpwkXz8mWYUwVYzA/a7h32Cz1Qpr+f55Z7FgZqmMrZnGOvwIhKE6Bx3ppWYRnIYFv2neR3Wb15ehuZluKbhBohhSNPlC1BnWXIuIJT5z+xmCayADhxSCIGJJa8uC+XeyaFHSfk0Gvv6ALi5FRWKng+VTOXqAk5Y021UcRrYgTYMOnhvQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(36756003)(38350700002)(38100700002)(8936002)(8676002)(52116002)(316002)(107886003)(6666004)(186003)(956004)(2616005)(4326008)(1076003)(6506007)(26005)(2906002)(83380400001)(508600001)(66946007)(6486002)(66476007)(66556008)(5660300002)(6512007)(86362001)(4730100016);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C6XURJhZqAi1oDIzBFgcM+mqX82VmLF36N9Xssk3VA9t50qWg+yZLvEBR1am?=
 =?us-ascii?Q?KMf0iuWVBMbTyJE8KcaREIz1iDhj4B2zUXC38RLJ6oxM8Jb7n8Cuw3+OD0Ul?=
 =?us-ascii?Q?C+RdQUuse/u9HaOznpvcDPWG5sb0+uqPFDE8C3Wjy47Bs9Hz4DmOfTyVSy7H?=
 =?us-ascii?Q?G7XkOP+oOOupc2DB+aeRgbN+f1HKcKc6DDTDBs6WChwxxEboNT0H41xgwj5d?=
 =?us-ascii?Q?Tus6cQzaPiWtOf263YnQ1g313V+0gk04I/ejg0Su6I75pyOglPbNzyM5IuCH?=
 =?us-ascii?Q?lA+y5s1uzFGEg5pQmxrCgY6/vFGPqSwavCEqb7Mc8Lcf+bDnfkaGVfBuszlL?=
 =?us-ascii?Q?cmanfrkvAhTemQKZMrnAjda6XF0RyQ0OE1la6S4mbluZqSLLFPoHeSh2W14r?=
 =?us-ascii?Q?FN1DDIfsJ5Yznpu2r9HY19VfMpx1lD7FZbS9qhfzr5zN2XjbnoCyW2N4xTJA?=
 =?us-ascii?Q?G1MdZ59epcZnuU1jzPm67PZhP8XuAdnldJg32ytASwWmi6OZKOCpl7ufI8GQ?=
 =?us-ascii?Q?y34Q9D/VY/0PYdzNmSdCcvyArOJQGWUpqcJY6jXHy4Sp+nsvqwb4tn08Vc7t?=
 =?us-ascii?Q?zKSIV6dy2SQF50wsnVhKsVpc7ENawp/982T4HzSksXmiKx5JzpXvZ4q0vAXt?=
 =?us-ascii?Q?fsQRx1jDfoOoxKyhQi3bDYQTxzunL6H2rBBCG8bQeGLzqNKfEunStelbJ3DD?=
 =?us-ascii?Q?OSOS2vVqMffW0vVxenHpcGPY7P18Yn9qZd/MrzViga834ZTjojQqjCZJsQhs?=
 =?us-ascii?Q?KDZuMiJ21d2VJmFU924cBXlXzE5Fz057QCwxPT76PwJCcRPe3ksMgKcxLHbZ?=
 =?us-ascii?Q?uWtXhTWrrlU7qEEIIo5eR1zMUFD6bADmYvHCkEVNeo03GlhXJdBvtzc+39H6?=
 =?us-ascii?Q?reGNXu7Bq/nrL7JhWu/BtLQ8ofSZJmr4e5uhxMiq98KTMI6LPdvo20bhZ2rf?=
 =?us-ascii?Q?W8h/74UEl6eCO4K721X+JQ4AkOfkwEC6IKHmzdpibzx723WM2BVARrRUcNts?=
 =?us-ascii?Q?iUQL6mzQmTLCbFJeAiPUMI/cliezw3FDkNgOyk7scn1XUtX/Mm/MxRQ925AJ?=
 =?us-ascii?Q?MkKcU3HM7jKMQV/dCizzjqfTTxYWUhQyQLoWuQ8OtFFR0QcpZ6uitoAJ0fXF?=
 =?us-ascii?Q?ZcigVC5Z3oVblYAdZI9Oy5Xi1vB14ufj3th9l2V1R9DAkUVKwnfqxKAfvxQN?=
 =?us-ascii?Q?X4VpKXnAo/kkAQ/n7uslwS/wRKX0r3kLbKXsmD6TNu4RmJ34sJnlCFnAJoVf?=
 =?us-ascii?Q?6wEOZWRoP+sDbSNudYSCeABVRGRgL2KiexJL6PShdmC/0sp2vFgeYRgqmHgX?=
 =?us-ascii?Q?kJMFGZkRxrsdds78OB6wu3tI?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 910e0ff0-4f44-4caa-9575-08d98caf38f5
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Oct 2021 12:04:05.4401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZJSpHDg7IdVY967YusHNwlHmxX4PquCwA/HXzpG+upNVxcZcTkKQwX6m/RUHC9QDFnpaGsQUh/YA3qIF/XeEcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4532
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  when overwrite only first block of cluster, since cluster
 is not full, it will call f2fs_write_raw_pages when f2fs_write_multi_pages,
 and cause the whole cluster become uncompressed eventhough data ca [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.130.107 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.130.107 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1mZu2P-0003is-Id
Subject: [f2fs-dev] [PATCH] f2fs: compress: fix overwrite may reduce
 compress ratio unproperly
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
From: Fengnan Chang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Fengnan Chang <changfengnan@vivo.com>
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

when overwrite only first block of cluster, since cluster is not full, it
will call f2fs_write_raw_pages when f2fs_write_multi_pages, and cause the
whole cluster become uncompressed eventhough data can be compressed.
this may will make random write bench score reduce a lot.

root# dd if=/dev/zero of=./fio-test bs=1M count=1

root# sync

root# echo 3 > /proc/sys/vm/drop_caches

root# f2fs_io get_cblocks ./fio-test

root# dd if=/dev/zero of=./fio-test bs=4K count=1 oflag=direct conv=notrunc

w/o patch:
root# f2fs_io get_cblocks ./fio-test
189

w/ patch:
root# f2fs_io get_cblocks ./fio-test
192

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/data.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f4fd6c246c9a..267db5d3993e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3025,6 +3025,9 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 								1)) {
 						retry = 1;
 						break;
+					} else if (ret2 && nr_pages - i < cc.cluster_size) {
+						retry = 1;
+						break;
 					}
 				} else {
 					goto lock_page;
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
