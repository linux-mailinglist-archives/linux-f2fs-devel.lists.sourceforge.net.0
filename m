Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BFEF50CEFB
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 24 Apr 2022 05:32:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1niSzN-0000sI-HK; Sun, 24 Apr 2022 03:32:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1niSzL-0000sB-Ng
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 24 Apr 2022 03:32:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FJxxpLg3aQGNCLFQFfswAk6fKWXb2j1iieA3tX8MgQ8=; b=cm6colxZPbfl/jTMsZ/Jc3Up8u
 lBosWaLQL4tWA9HOG3T8Sw73o4VQDReqdr5rgMzY1W+RArZgbPGqfCYjB07yw0NBVKSlEqIQ/H1bX
 XXowrROc/L0EGvSTo15+QEgBOHU2Pz4b2I6DzanwbR06LkdIDBEXAVPV9SunrENS03yc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FJxxpLg3aQGNCLFQFfswAk6fKWXb2j1iieA3tX8MgQ8=; b=c
 sqSs5oqNaAu2i+qzcZ1rd0P4HSpYIwmPAwYrS+BkW1pyl3OgDtReGLTuMd65Zq2KLy9PoqS0UeQwJ
 9y2yYLGhk+26k6ff8YvZP90I7XUl7drNPw/vnKejHzg4L/YhFu/kgC0AIq1GsuHejnJV9RmUp6B1D
 3haZbbiHZ7V/CIcU=;
Received: from mail-sgaapc01on2113.outbound.protection.outlook.com
 ([40.107.215.113] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1niSzI-0000I2-Dp
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 24 Apr 2022 03:32:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iA5WNazzmR4QthAlHrwtrKUzaREfY3qtttXIqq8T4YiqsFDyEe+JMV9dyDoNPXLBe0gTfcUcQWXdV/kmFVh5A74AJrVSHHrBix+K8evdl6z7chpSLYSrPbst/K+TvcH2yUfWyn0SV2zbYrc0AxFlLahkQKZsp7HS6tdGqyetN8uo3oM2KdJx+amufTBowbM2bszIVdlSrdXGIH8i/VaMQovaEXbiMsOgoGfiwO03is3oqH6XX250QfcyxMijwtoC3wZEqfd0uR9UQcyMTpsMAj+8cEQjDrqfPX8wVwRsIMcdc7PO6xotPywfszDQbWNiiDmgR1atbXoI7pfldYRnRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FJxxpLg3aQGNCLFQFfswAk6fKWXb2j1iieA3tX8MgQ8=;
 b=Smit8maiu/AUtRlEl7dfUq0AEpYJsB6DC22WSsm10V9jhIIM5WY41NYFY2Bw/mNPAqc/rpf0uU53VdOaEWX08FHDMHAKwd/eNfLGdc5u38PG9FGEAAfvKb58e1dcscT5C20XV6zvAm/KNKOJO8nsI8tzkIaGRljzG9fv+gEGis4GSoOStzKfo+4AHWa+d6zK9PegtEGj6/gdLpbLMhGtOm2TNU/wb6psXpxjb/eCQiiw7289cZ2zgGUKDjxhI+jt4pe7OjuucoETw9lxsnly0w4SJreIXCb/b//3gdFmhkaHBLh/60wDKIACmdSBYGqSZX5ZH3k0s6Z0Zp+hXD44Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FJxxpLg3aQGNCLFQFfswAk6fKWXb2j1iieA3tX8MgQ8=;
 b=VB36+eta++9b7toiUxfwH8zQ43actaqpcUOOWUMV0/H25/CTQwLZFIMV477bI/Fiv8SHYUhTxCvRZYWebSO5WcoJLhvRM8eyeYPpfXVkFOZ8dnFHnNW7pga/fy3XOrYNB5svx8q7OimkNGDhyZ/Xb9kzVtVTFIEw10Ws3msQBEI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by HK0PR06MB2516.apcprd06.prod.outlook.com (2603:1096:203:6f::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Sun, 24 Apr
 2022 03:32:30 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::f0c7:9081:8b5a:7e7e]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::f0c7:9081:8b5a:7e7e%9]) with mapi id 15.20.5186.020; Sun, 24 Apr 2022
 03:32:30 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sun, 24 Apr 2022 11:32:18 +0800
Message-Id: <20220424033218.439505-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: TYCPR01CA0112.jpnprd01.prod.outlook.com
 (2603:1096:405:4::28) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c08b4a46-64b6-4147-3f40-08da25a31003
X-MS-TrafficTypeDiagnostic: HK0PR06MB2516:EE_
X-Microsoft-Antispam-PRVS: <HK0PR06MB25161CF6BF32E2C18E36FF1CBBF99@HK0PR06MB2516.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JlM+KvMZqGfUxiwSsxY9YUPz/2ruhblTkXn/ybpiXp9jjQConi9eE/wOSpXOlAnXXR8e6o1Ost9rv7YjDs0DeNbSF02bVu998rYPDg47U1eK+OEct+sVzdNsaBSJPPtJByrLP5BpsbEn7UtjUiVHiysEf/ogkFzG3UCWFKEvmzwsNv7O8Oc4cBd/Fzz5GrojuiC/JsgeKo7+hSCsN1LFdnghVmfIYokKxgliCPQWOjWjarJnF6+s1q3TUUFk7dwMCENVGXPsYgBFfIPQ6JeV2YbakP4pFRflIFn8SuL7LQQX0h3tYbLpYDgye4CKtMRmtDFlsqVMjXv18NY5OuE6nmq9jKvQ1JtYWjbcpz0ExHABwfBUiBLpEeeq7EAFyenCR0bgslQN4Jf4ploP8WWCVZOYORYjHVsMPaMiblqOmNYUjCcX0R39QJ1TISg8G/IMLrUB8ECMtJyKU9D3ihAKdzyiH2+Ft9QlsAe2E8WuLlLI4/9vILISPN2USgY/amcTpy2VzcAqssRALwF8bT7YgyfQrz4fOkWDJNg7JxIL+TAJ9IAAAvpSmaisedWlZM14tZgOW5h6w9EB4RRHYaCM2+dzOI9+OB9L6XZkeyPawVTqzWHKtFf6owsCAtZUX51E20ZzKdiRsUKkOYhxYORiYgS7EIHauxoQQP80Kb5DQiJtHOGXTp2lrgXs8N6Bxu7SlGbf7RlndFwk1jQ/Y/92NQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(5660300002)(8936002)(36756003)(52116002)(508600001)(6512007)(26005)(6666004)(6506007)(4326008)(316002)(83380400001)(66476007)(6486002)(66556008)(66946007)(186003)(1076003)(2616005)(8676002)(107886003)(86362001)(38350700002)(2906002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sbQHfOoAfBn2zM6ZDnm8FUiXlXvl3gUSnG6bXaXiUBkiQUfPVBzYV//50Kz8?=
 =?us-ascii?Q?25V3F33T5ZD5qxqmHMwsv3/Y5LI0TNS5VJSqv19ozTtcNJrcwBMClOR8EjS4?=
 =?us-ascii?Q?IMe4fyB2hNfe1QC+ucpSnhgcBdJKe61A1YKizZFFKrfjSnRt6/tebERkDSGG?=
 =?us-ascii?Q?zFR9RJN+UNW24gVSa3haBgYDsfHHarChixqz2SY6yjofIWgueMqAmJzfQI35?=
 =?us-ascii?Q?d1/SZB5OaReQp/MP7xZTazrIf535KMYgqxCI8ZS9huQhN7rau9YTh0pSHf3j?=
 =?us-ascii?Q?OkDQwdlJvWSA0JblkYpZD7V52bQUH/T9R4fd+pcMkqviVXt/60Sm+1Ar6vpw?=
 =?us-ascii?Q?Nvgc5IPehzprXsxqlrP8ZcvgqlyT4nq9CSOd7Hu8Z/UkzGNQQ0IYH/z5/gQY?=
 =?us-ascii?Q?NYsoJJ8NjSq3p6Wyn9In6Eojteag6nncJXlr/uYk8vs9nspJ1U58XUKY8lZ7?=
 =?us-ascii?Q?/hxxbaBaUPgI5XKQcct19ZXog3ikbxJsMBo8ahvIIyc6gwPbv4FIZ/jJJACz?=
 =?us-ascii?Q?B1+FkM/eLSh7zxgN43Is0wVNKdHcgdhOHUMhy/El159j3busij3IPbia1K98?=
 =?us-ascii?Q?es4XWp6qPCOAy+SPfrbC+FSU4IyFCG01j56Yq8hv64AnYMxgwE6c4OXjB7w5?=
 =?us-ascii?Q?XjckoDfn91gjscuG7Jgl0bNyKouaTCTIQGW5X1iJhNAFbhjdrQfF4WeoEPtw?=
 =?us-ascii?Q?oGTaRiW7WKpr5W5/f3Qs/bo+zdBB6iyplAPaqMPPA6koXGWBzAUVWlHKdA5q?=
 =?us-ascii?Q?VQ1pZyf6bbLOHOvccL1WYTw6WlhjKSwFUd35HuX/tAPZYJrMWgHYa5uHVG+C?=
 =?us-ascii?Q?P7WBSd+jXb5+XpXRg2ZLlp6U8jQiJnouqgT7+JfL7cOUTaZV/6jfOBUlzPOh?=
 =?us-ascii?Q?H6T+zPv1yHJX4A4cFHsX9C1wNXf+5BnOFz/E4eyH9CYxg3KbrMYvnCpJrnQO?=
 =?us-ascii?Q?5Y2GF6zpQO9AydzVg2s0XekZFYQVhjVYNJ1eL1xXkRUqwkozCobWH9qHQRMT?=
 =?us-ascii?Q?6EAzk5KZLA1O+LA7tmpW0eh7Jm9nVOpd1xOAVd4az1NuHfZKd0Hj9mfyEU7N?=
 =?us-ascii?Q?R/zEYnSbhzZn0CqqnpNNtAN6C4uEoMNu9naCAJ8Y4IfC37Gh5YCwe9qfzCUL?=
 =?us-ascii?Q?gj5e6AZHr3GHPqB8fsrvpHO08PDRJMMne2Wrdw0KHi+SGGgVWIPgWz5wtn/B?=
 =?us-ascii?Q?Vuj7gSkHUvOMSwBRlr0fxSERnMeuz8CuNL4dNAABQ/RmrYY/aMBHWcTMIC+6?=
 =?us-ascii?Q?378enacZqwJGCcA0FQmL+BjpippmuIo2q+tGOnlQw8NTuJ7hESb1JrpYHQ4/?=
 =?us-ascii?Q?JZnlkwqCliRzb1wRzui0DwX1oXh0kW86jseXjXk9+GDZ3ROox42GNQszkBvC?=
 =?us-ascii?Q?SS1YzVl7xutbNSSkRSE0bl294q5I7DI8cGyIVflPhPrJt613pG6bQniuXkQG?=
 =?us-ascii?Q?F2vS+tM5oXeL5VOwsgt/+RgYxKRwDEnNNROZ0AlSDPlLFfuHuNsVkWwr1QR8?=
 =?us-ascii?Q?2o/YTErIkUbJyMunzhKiqZ/Phi5CHwzLGN3RRgrugUDtLHDM/UxZF3YXHrvQ?=
 =?us-ascii?Q?vEGIE8XkKom5qHwskpFaGreg++3n86aGiHOgdObLbcLFsEvn7qUIxubyqHcO?=
 =?us-ascii?Q?iveSSTzpoa8plEZjYGKN94VfK3SFTj4q1guT6QfLUTgCHm/bLaZwGJbc9O+y?=
 =?us-ascii?Q?bGNkGPKHQBMHrslc6UfnBMxcI4+99f/KoRkwb9u/H4yYYmgVWBzmo2cOAt34?=
 =?us-ascii?Q?ZgYZoqzc+Q=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c08b4a46-64b6-4147-3f40-08da25a31003
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2022 03:32:30.6936 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fOTCyaVhekHstTKlgA55NYYGOpWVtNITIrsqT/j/ADd7i1b9UGWgV7JihmlZkHISaBBioH/AezWSeyghPAvr0w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2516
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Try support forword recovery for compressed files, this is
 a rough version, need more test to improve it. Signed-off-by: Fengnan Chang
 <changfengnan@vivo.com> --- fs/f2fs/node.c | 7 +++++++ fs/f2fs/recovery.c
 | 9 +++++++++ 2 files changed, 16 insertions(+) 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.113 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.113 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1niSzI-0000I2-Dp
Subject: [f2fs-dev] [RFC PATCH] f2fs: support forword recovery for
 compressed files
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

Try support forword recovery for compressed files, this is a rough version,
need more test to improve it.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/node.c     | 7 +++++++
 fs/f2fs/recovery.c | 9 +++++++++
 2 files changed, 16 insertions(+)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index c280f482c741..1c5335757d7b 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2803,6 +2803,13 @@ int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct page *page)
 			dst->i_crtime = src->i_crtime;
 			dst->i_crtime_nsec = src->i_crtime_nsec;
 		}
+		if (f2fs_sb_has_compression(sbi) && src->i_flags & F2FS_COMPR_FL
+			&& F2FS_FITS_IN_INODE(src, src->i_extra_isize, i_log_cluster_size)) {
+			dst->i_blocks = src->i_blocks;
+			dst->i_compress_algorithm = src->i_compress_algorithm;
+			dst->i_compr_blocks = src->i_compr_blocks;
+			dst->i_log_cluster_size = src->i_log_cluster_size;
+		}
 	}
 
 	new_ni = old_ni;
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 3cb7f8a43b4d..4198fed4ae6f 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -669,6 +669,11 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 		 * and then reserve one new block in dnode page.
 		 */
 		if (dest == NEW_ADDR) {
+			if (f2fs_compressed_file(inode)) {
+				recovered++;
+				f2fs_update_data_blkaddr(&dn, dest);
+				continue;
+			}
 			f2fs_truncate_data_blocks_range(&dn, 1);
 			f2fs_reserve_new_block(&dn);
 			continue;
@@ -702,6 +707,10 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 			f2fs_replace_block(sbi, &dn, src, dest,
 						ni.version, false, false);
 			recovered++;
+		} else if (f2fs_compressed_file(inode) &&
+				(dest == COMPRESS_ADDR)) {
+			recovered++;
+			f2fs_update_data_blkaddr(&dn, dest);
 		}
 	}
 
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
