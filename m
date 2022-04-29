Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2375142BB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Apr 2022 08:55:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nkKX2-0003lP-2Z; Fri, 29 Apr 2022 06:55:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1nkKX0-0003lF-MH
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Apr 2022 06:55:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u+C5Xman9Hx40xkGlV+PpJYizzABS+uEN+XAofWKuYU=; b=c2+uJpEvNLvAKjfw3EOd7nDrph
 hujCT42uYJOOFjbMQ2PvAMUiZOkIeIF3kGwiQ+D24W/a2eXcjDONoHC3OoM65O1pfr/5NIIAlkKd1
 snd9cBAXYYEwriQu0wooT1D0O65EyATUaoUl0ilYA0fsi2z+Gu9zzeyElwpipURu4Tq8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u+C5Xman9Hx40xkGlV+PpJYizzABS+uEN+XAofWKuYU=; b=IQhZWuMid1Fgpff4PiS37w43Mq
 7oNmMg3ieVONtuMKkB2cumVxXLdHAm01xMWw4nfqzM4Wram6qN5Guzr040bkl4yC4hd9AKVRquBsi
 UoBcRA7VdJaYQyLb7tPt+pP95kN0kZgg41MRILMMrAqf4M3HkYo3r9ZyKwTMNH1YqJDc=;
Received: from mail-psaapc01on2092.outbound.protection.outlook.com
 ([40.107.255.92] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nkKWz-0001a9-2R
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Apr 2022 06:55:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M5CKnQiRWh8xxKI+7Ovi7g0wNCEfY6N6lvf95G0j8rApb/Au4e1wT97enc8xEAdzd0Z0+PBXdWLMrM/RRXoY1P8Jaz3rQPti7Z5nTudw/9wlHhr+vRUa928yURKlxPb92tUsTZFZ+vtQkIfWrl+YmsybKekUflYWRVulbB8Up2ce4qLXBZXBVf0feIKhuKx9n6zX3iRAVLfL9xKDCP5r7OYVumK5mLk9KniAMy5FOQPn88q0sIpPsmEtQ0Mrl3Ar9E96P3Iu5P3RUvqvxLJq9dd2I214u8NLRFhqqg0KIwT8H7qQQtC26ZQ9riqZmO9p+iCxAKUNYQb12KAX5ATBSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+C5Xman9Hx40xkGlV+PpJYizzABS+uEN+XAofWKuYU=;
 b=oaSPRrU3VUSG6+tG/ew8hszpzskNVzFq+fgiS41khf1FLAYi/XthQ2U3QkxMvK2RQO2aXj/DMavaATPY7Fz1ekvhL06/FaOl0/YeiBcfU9Q7MQp6wr+Y4lU75tBJ6y5mGqRtit+Ej443IL3UUCiyJ/QidbzlJvg8y9c4+7HMpeYc28OAGA7Wyvz9FemLGzDZkppBi5aEZSSj5nOtrQZehj8EWwS/nPaM6D8ut/oZZV8pAv+VgEs4ntBNs6qesH2GDhgXa2VX0VGNBCrmVyJvamOR8mRdSVeLKk3b0tnyaYThVq0JnxIkSjLb1vxEnzO2L1bOHuaXHDgZShZkp755qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+C5Xman9Hx40xkGlV+PpJYizzABS+uEN+XAofWKuYU=;
 b=RO6MZhTHg56gVtZe/jVrb4vVnNIioT6oMsGZXMNTb3AQWhiZ2eEt+5sgSq7tLQKW9P/87uOL8DjxS78KnraQObPFtjnrqO7IUsvQsT8hew6LA5UR7KxTI2SKL4550iGu2boXimHukgGcBjaID4qNlanw0clgCfUuuJrpNls7vz4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by TYZPR06MB4176.apcprd06.prod.outlook.com (2603:1096:400:2c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 29 Apr
 2022 06:54:59 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fc26:a0b5:8bfd:7c02]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fc26:a0b5:8bfd:7c02%5]) with mapi id 15.20.5206.013; Fri, 29 Apr 2022
 06:54:59 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 29 Apr 2022 14:54:46 +0800
Message-Id: <20220429065446.208019-4-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220429065446.208019-1-changfengnan@vivo.com>
References: <20220429065446.208019-1-changfengnan@vivo.com>
X-ClientProxiedBy: SI2P153CA0005.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::11) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abd6825c-9cbb-43dd-6f11-08da29ad2c01
X-MS-TrafficTypeDiagnostic: TYZPR06MB4176:EE_
X-Microsoft-Antispam-PRVS: <TYZPR06MB4176910851C829A2BC6C6DCDBBFC9@TYZPR06MB4176.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kAkTzCzYJzsstK+H8tdiHx5wvNJxv7IdhazpUHlkJrN+ssZFaOJ5dF3272kMf1Rk+HEkJ0BgapNwaBKSmbsYDXATeNOY2pb31LIWyX35a/J+xSAWIGWCkNilDCG9inD5X/6l7Yp9X/76L5TSMSdD20qVK/lWjKD8rQdrNFal2xxJ0goNZ1ImVZ/AFzSp3+CgHEODrCDu/WSf8xgWj1yETGCZO3ICZUYkPdwzyj5jXrjkbpoFAFDVe641swdV0UYol16soRZosGPPcofa30Jtt+11DDF/LRCsmkf8SE5tMLFx+SbfCKdcyWvoPW7fnasDb0r9X+iAVZREE7XHNt5M1AzVukGZeJ5PAK1B2ZlGGJiXUfmU/3VvWDzrKJHy2tFtJ73fpH+VVuFJry+mCDu1Q8FrMtDqdnF0Uqaah8ZvtmChkqAAhtgOdIbBL4dcV5zqKasjrFVrAwo4sF0YWtDojWxRnST3nmRaz9Zju36LgwJkIGS/YjQGKfmxV/LNXtxyQmscUsStiPDwGKS0m/1soS9svqUgVaLQxEi6yLmXN+hq1IUdwUMJvORiwh3TtAeMnv7CyyS5f/3/re0kcofJARYQYdzRtgm5Sl2d7FxoDujjiEggXpprtrtgNl1QjRS5TJk5kITOrAOp/5IuQvOCPfvySZF1FMy8Uc2BfW83XL/jQp4KTjmcg472grXoXCqY8DhE7+YyFsV055gyVX0Vpg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(66556008)(186003)(66476007)(36756003)(2616005)(6666004)(83380400001)(8676002)(4326008)(6512007)(86362001)(52116002)(26005)(6506007)(508600001)(107886003)(15650500001)(66946007)(2906002)(5660300002)(6486002)(1076003)(8936002)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rVL8AAaVK+MRk0OSnImd76vJ+80pL2RKzKeO4lyoM5rZItYOwz8nKiyHPla7?=
 =?us-ascii?Q?Lf3WA37n/pt7LSx7WnwOGr0uvAsoShoOqO3zIGtrlsrCH3ovFBKWkpXsm3Jl?=
 =?us-ascii?Q?S+6JcSG9EVW9CJDXb00HfhxqOG+GquWXB/bVY+6GYxeVKL2/PhwCEojhheRv?=
 =?us-ascii?Q?ieSVv6Fvklg9qgzdHrOMbKui3Hogypf113DlHgBmEBpL7+HAEbEdylwAyppw?=
 =?us-ascii?Q?EIUSf5JS/Q/4tmWmsDkhNEG1kKjZfmOGJ2NFTbxXMaBOT+ilhO4Z3qPbHq3+?=
 =?us-ascii?Q?o8r9iNpBb5l28MgW56m1rtjv6L681xTGz5LWp/QMQw8elNLdJOmRXhhj640h?=
 =?us-ascii?Q?f/EvIDXf32+LxgvsOQZ/hLjje5pOEKPKXwVFRCLAkMezYycVhgRWFNFiQQRX?=
 =?us-ascii?Q?0j5OsMH9KwCdgfdvj+PbjiNWOwo4Ely8mnf3KHNvdLJgoy1Z6c5ayO5ut3X+?=
 =?us-ascii?Q?bZhihpE3oDcdmvtMvoAMlnrTsCXPKoaBPfjVmvdOMAvf8GFupvWbX+gQz0iz?=
 =?us-ascii?Q?I8iUfa+d1n9XdzMgnIheppIi8mKjt/diEX2OVsDz2FBI5+KXAW+OCozRFX1X?=
 =?us-ascii?Q?dLVEqFm6Dow8Jfg8k0VvMPZmym6rYg5yUJj2EAXrLYHism1H1p4cwgJYRSVQ?=
 =?us-ascii?Q?V8kB7GiL1s0ifMTcucLzpX/gqhaKAGUMg5GneLhEdTTsZhAKGoOSGd9DtdW7?=
 =?us-ascii?Q?+qe1DUgNacyzPktNbLFooeT+5k8ajbxXeIrdVoy5dw87uKnr6eSodgKNStoI?=
 =?us-ascii?Q?gVa8/Ny8lX3MmJ8B7icmhxb0JPA3VHpbxwHtDnXWjfdzOUNQv7gb75OkYfco?=
 =?us-ascii?Q?RMzdhdndyiUcNxNHYrrHB9xavyXPc4i1Tqi6UKutJ+Onsipg0cR/tWAIJXiU?=
 =?us-ascii?Q?e2bKfvYPvn3AQrVQOyZO5xKXZGPv/brBeYdbWDXqvbf7+WcKYkcQiZzShheD?=
 =?us-ascii?Q?bownTolShEqrWoGxiDMXbnYlbSxgu9Xh0oc2WIBhl+HjsberXDpuJMly7c2w?=
 =?us-ascii?Q?7iHJnRT26CzqPpR3WhtA12Ci8WEZLFhED4jqbgopNExzQFbOS0qNcSy2sn8l?=
 =?us-ascii?Q?mqwkaiM9fEp9PgYrpPXGBScvCKyi558dMj02TmQL3QjhwoIQKx4rKXjWWdKy?=
 =?us-ascii?Q?YuES90QZUg7QuzcAWSC3J9j2xgRc9UhRLPMVvV5/kYtO1AXZSNZY01Z9l0C0?=
 =?us-ascii?Q?k0fB8QZgp/90KlJAO2LtwxPkBpGM1MQY7PkZPUYaNufYWm8tur9BCstAnbwg?=
 =?us-ascii?Q?x3ejdZ8sYRaK/CD3yuZ+fXeKWYEU//U1eaXfjsaT5jNjx6ZofUAcNrMyWTui?=
 =?us-ascii?Q?IOU/bUbehZ2AKQUihhtUlbta+HpGCu4LTPmBsuyAENDZWh3770qW7G9vkJIC?=
 =?us-ascii?Q?aTwX0bMnWtO4O2VlGvyGOYFiURPPmVvvf14jY9hrlWXSZ5vkkHd3Pk1CDOh9?=
 =?us-ascii?Q?X8EBGVms2pWKcbkZOdoyf8t9NQ9h8+tx5yMadlg89h1CcUQCOcUBdamBBcCb?=
 =?us-ascii?Q?Y+aABEvpm10NiEQMdMCu07CEmKVDoN7avnL1WbPFSVDBiduRaoLaunlv/tAx?=
 =?us-ascii?Q?sGbgauJBQHwB7tMYgWmP2x+V0jk/XFZy64Kdoem4fTK0znQJDYoC48HP3IMh?=
 =?us-ascii?Q?lvTd3AMb9Nwa0YYvhVZ1IAVaRXBfXFMMBNZev4x6vxLNhE40sI62UV2JZUf9?=
 =?us-ascii?Q?b2scVdiFlSlq6y8iTbqH2FFCZBaLK0z6NaBJoSCXt8ld2DBLvd6YHhyVpWnZ?=
 =?us-ascii?Q?WdA4vFPikg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abd6825c-9cbb-43dd-6f11-08da29ad2c01
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 06:54:57.2593 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDOBPKLVIIJ4kBOrt+S4xSWe08n5V1MXoIRh7TYaEaXcmnJnjkK6Ot34EQDMm/EG+Gi76W2vH3VEpNezr3JC8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4176
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Try to support compressed file write amplifiction accounting.
 Signed-off-by: Fengnan Chang <changfengnan@vivo.com> --- fs/f2fs/data.c |
 14 ++++++++++---- fs/f2fs/debug.c | 5 +++-- fs/f2fs/f2fs.h | 17
 +++++++++++++++++
 3 files changed, 30 insertions(+), 6 deletio [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.92 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.92 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1nkKWz-0001a9-2R
Subject: [f2fs-dev] [PATCH 3/3] f2fs: support compressed file write
 amplifiction accounting
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

Try to support compressed file write amplifiction accounting.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/data.c  | 14 ++++++++++----
 fs/f2fs/debug.c |  5 +++--
 fs/f2fs/f2fs.h  | 17 +++++++++++++++++
 3 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index dd9a97f6900c..fe64f2328c97 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2900,11 +2900,11 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 	int range_whole = 0;
 	xa_mark_t tag;
 	int nwritten = 0;
-	int submitted = 0;
+	int submitted = 0, raw_dirty_pages = 0;
 	int i;

-	if (get_dirty_pages(mapping->host) <=
-				SM_I(F2FS_M_SB(mapping))->min_hot_blocks)
+	raw_dirty_pages = get_dirty_pages(mapping->host);
+	if (raw_dirty_pages <= SM_I(F2FS_M_SB(mapping))->min_hot_blocks)
 		set_inode_flag(mapping->host, FI_HOT_DATA);
 	else
 		clear_inode_flag(mapping->host, FI_HOT_DATA);
@@ -3039,7 +3039,6 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 #endif
 			nwritten += submitted;
 			wbc->nr_to_write -= submitted;
-
 			if (unlikely(ret)) {
 				/*
 				 * keep nr_to_write, since vfs uses this to
@@ -3105,6 +3104,12 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 	if (bio)
 		f2fs_submit_merged_ipu_write(sbi, &bio, NULL);
 
+	if (f2fs_compressed_file(inode)) {
+		if (nwritten > raw_dirty_pages)
+			f2fs_i_compr_wa_blocks_update(inode, nwritten - raw_dirty_pages, true);
+		else
+			f2fs_i_compr_wa_blocks_update(inode, raw_dirty_pages - nwritten, false);
+	}
 	return ret;
 }
 
@@ -3369,6 +3374,7 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 			err = ret;
 			goto fail;
 		} else if (ret) {
+			f2fs_i_compr_wa_blocks_update(inode, ret - 1, true);
 			return 0;
 		}
 	}
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index fcdf253cd211..d5e1ab7abedb 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -139,6 +139,7 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 	si->inline_dir = atomic_read(&sbi->inline_dir);
 	si->compr_inode = atomic_read(&sbi->compr_inode);
 	si->compr_blocks = atomic64_read(&sbi->compr_blocks);
+	si->compr_wa_blocks = atomic64_read(&sbi->compr_wa_blocks);
 	si->append = sbi->im[APPEND_INO].ino_num;
 	si->update = sbi->im[UPDATE_INO].ino_num;
 	si->orphans = sbi->im[ORPHAN_INO].ino_num;
@@ -389,8 +390,8 @@ static int stat_show(struct seq_file *s, void *v)
 			   si->inline_inode);
 		seq_printf(s, "  - Inline_dentry Inode: %u\n",
 			   si->inline_dir);
-		seq_printf(s, "  - Compressed Inode: %u, Blocks: %llu\n",
-			   si->compr_inode, si->compr_blocks);
+		seq_printf(s, "  - Compressed Inode: %u, Blocks: %llu, WA Blocks: %lld\n",
+			   si->compr_inode, si->compr_blocks, si->compr_wa_blocks);
 		seq_printf(s, "  - Orphan/Append/Update Inode: %u, %u, %u\n",
 			   si->orphans, si->append, si->update);
 		seq_printf(s, "\nMain area: %d segs, %d secs %d zones\n",
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 4b005d7f326a..42030a8cef45 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1750,6 +1750,7 @@ struct f2fs_sb_info {
 	atomic_t inline_dir;			/* # of inline_dentry inodes */
 	atomic_t compr_inode;			/* # of compressed inodes */
 	atomic64_t compr_blocks;		/* # of compressed blocks */
+	atomic64_t compr_wa_blocks;		/* # of compressed WA blocks */
 	atomic_t vw_cnt;			/* # of volatile writes */
 	atomic_t max_aw_cnt;			/* max # of atomic writes */
 	atomic_t max_vw_cnt;			/* max # of volatile writes */
@@ -3828,6 +3829,7 @@ struct f2fs_stat_info {
 	int inline_xattr, inline_inode, inline_dir, append, update, orphans;
 	int compr_inode;
 	unsigned long long compr_blocks;
+	long long compr_wa_blocks;
 	int aw_cnt, max_aw_cnt, vw_cnt, max_vw_cnt;
 	unsigned int valid_count, valid_node_count, valid_inode_count, discard_blks;
 	unsigned int bimodal, avg_vblocks;
@@ -3916,6 +3918,10 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
 		(atomic64_add(blocks, &F2FS_I_SB(inode)->compr_blocks))
 #define stat_sub_compr_blocks(inode, blocks)				\
 		(atomic64_sub(blocks, &F2FS_I_SB(inode)->compr_blocks))
+#define stat_add_compr_wa_blocks(inode, blocks)				\
+	(atomic64_add(blocks, &F2FS_I_SB(inode)->compr_wa_blocks))
+#define stat_sub_compr_wa_blocks(inode, blocks)				\
+	(atomic64_sub(blocks, &F2FS_I_SB(inode)->compr_wa_blocks))
 #define stat_inc_meta_count(sbi, blkaddr)				\
 	do {								\
 		if (blkaddr < SIT_I(sbi)->sit_base_addr)		\
@@ -4011,6 +4017,8 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi);
 #define stat_dec_compr_inode(inode)			do { } while (0)
 #define stat_add_compr_blocks(inode, blocks)		do { } while (0)
 #define stat_sub_compr_blocks(inode, blocks)		do { } while (0)
+#define stat_add_compr_wa_blocks(inode, blocks)	do { } while (0)
+#define stat_sub_compr_wa_blocks(inode, blocks)	do { } while (0)
 #define stat_update_max_atomic_write(inode)		do { } while (0)
 #define stat_inc_volatile_write(inode)			do { } while (0)
 #define stat_dec_volatile_write(inode)			do { } while (0)
@@ -4445,6 +4453,15 @@ static inline void f2fs_i_compr_blocks_update(struct inode *inode,
 	f2fs_mark_inode_dirty_sync(inode, true);
 }
 
+static inline void f2fs_i_compr_wa_blocks_update(struct inode *inode,
+						u64 blocks, bool add)
+{
+	if (add)
+		stat_add_compr_wa_blocks(inode, blocks);
+	else
+		stat_sub_compr_wa_blocks(inode, blocks);
+}
+
 static inline int block_unaligned_IO(struct inode *inode,
 				struct kiocb *iocb, struct iov_iter *iter)
 {
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
