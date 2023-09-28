Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9824F7B16E9
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Sep 2023 11:13:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qln5H-0004Mx-8Q;
	Thu, 28 Sep 2023 09:13:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1qln5F-0004Mq-UG
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Sep 2023 09:13:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VkCKC+ejYqKujK2oiuM5L2KSfEEyNbPXjYQaj3eBtws=; b=HE/dyR0vI/Xqy30AHP1wjf+hUv
 O2SCzY2bgwDTo5zgmYodQ1diV0hU3deQPK8sROyWxAg/hAlGn2ahJUk3wVa+gpBimntxdHEunWJju
 03CYhbUX+Hs3WepZCkY/jCplGmFUqtPIAAAf9pW1tkfNGLX3j7dOlbw+6Ivsrq1ePaz8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VkCKC+ejYqKujK2oiuM5L2KSfEEyNbPXjYQaj3eBtws=; b=jbO47tCsVPJTFCfhGcRlzIKprf
 rVPA6pEjLpHqmVWn7T2KaYgnh1UPU/wjM34uitIAoKiGeLKQayXrHL1GWZYc+/o01rPR1Q0tyU6eU
 uRbEr+mVIZfEA0XxuNn2FpecRAsOA/M14bxaxrdAEycWX/lgUQFNU9Mj1ryaIS8/ik2g=;
Received: from mail-tyzapc01on2110.outbound.protection.outlook.com
 ([40.107.117.110] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qln5C-0004yN-C6 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Sep 2023 09:13:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dnqFbD32Akw8LIHxjeO2yeloxGbCVL9syJOxy42HWVqF9P/CHI0VhsSEG4X3/0MAiyq8Is4H5FMwp541kVzozF+9s53CfFHrAHq0mT7SQKbp8Xli3d4z+Pu2HVYSEQsBRsRsH0R22H5n3XHEAM/27MHVt+xL+jAITpMq92XOv8azJFBOnl12lV+ZIb64lkuO9m8U77/c+9Gg6S2GX1eDM7JFWrTFWLw+2ihDjfDkIgYlh6G5w1JssCNzVa+Hai6l1JLxPrVbe9emmEkrEl+Dv1CngQM53ImenNlNqcI+VF2u4AXE1wKhStfGVojByet7Hpoz2uMwBS9W9ZkeN974HQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VkCKC+ejYqKujK2oiuM5L2KSfEEyNbPXjYQaj3eBtws=;
 b=mkaHWRO/9Ml7LAx8u9o1mhpPgJ2hKgiHk/vT1h9Og/dxfeXuRmyMkLKSm5r3dV524EDdnHP0Skoy3QCGFm0Pq/UfPvcNIRD+DC306/IXXDTc0mJfSZxEIWktRfsQg3kB3Lpg+v5HCmCzrG4y6QUVdllKAJXJhXGhrzfTdS2qpjDbnl/r4PZKylWhUG1Y84uqAUflyxiEq/DBw8Jy9vBbpfcKFRoNvSic3Dhl5oQeKwTljVL+nF7B20Klbme6R7GiEG62CkahHmv1YsHhH7YTZjZWFWILQsJyMRYPpKpMhnY/BZrZXkZ4RqG8aiHP6Tct0T4QuKZ9PpPhUTqR6moshQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VkCKC+ejYqKujK2oiuM5L2KSfEEyNbPXjYQaj3eBtws=;
 b=pu/Bja+Byi4IbRoq88Z4c0HrMagHNtfEIKTIaTreF8TUiV89qrXVCjMlIC4jFG9JSlt7nglZrPyUgIncas3cgsLjesLa7WawiD7wRxjmajyZOFmhKZUxQa5IO+zTtV6H+PIoNSIkM0RFx9v2G29oOt2WtEMWpr5NGr7B9aWKzJt0UhDnTTG799e6SS5XgzEiBWDXaskKHMT75WeNDLkOy/6aCQhqgWcfaHyyFY1jSIungwlT4wCizi5Fv2DXzgElXT+sipsFKSae/y+CjWiCHjThi8/HS+PKmVNwfMTjWJco9F30CiDUsU5M33U+toM3++kjujqGFZrqgDzML0Dp1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com (2603:1096:100:3a::16)
 by PSAPR06MB4470.apcprd06.prod.outlook.com (2603:1096:301:86::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6813.28; Thu, 28 Sep
 2023 09:13:14 +0000
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::e1e6:c2aa:6b5b:bc1c]) by SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::e1e6:c2aa:6b5b:bc1c%6]) with mapi id 15.20.6813.027; Thu, 28 Sep 2023
 09:13:14 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu, 28 Sep 2023 03:20:49 -0600
Message-Id: <c6c4f47e6048164218b18dd2e299faf9c9b0a3d7.1695890686.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1695890686.git.bo.wu@vivo.com>
References: <cover.1695890686.git.bo.wu@vivo.com>
X-ClientProxiedBy: SG3P274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::32)
 To SL2PR06MB3017.apcprd06.prod.outlook.com
 (2603:1096:100:3a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2PR06MB3017:EE_|PSAPR06MB4470:EE_
X-MS-Office365-Filtering-Correlation-Id: 878027eb-88df-493f-21ad-08dbc003252b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: In5XNHOT4hs9aB2IEXcRa8G3d5Bd2yhOOGdVN3h6vI3nrAKq2KWl7XjpVEGJy1UpsREdXsbll8f+iOiHihB7ARSbmqqtOPll3yv52CB7xovqCDzeiFDdc9eM73KakcUzXUoN8UYdaOS7E391U8AjCX1XY9/vNZcGSJYGuZmS2rjQLRuxGmlDCFAHtaMXr+F1HT9gP3r0BvWDtXzkDBwgP59pOhGBD0JQf5Axro6UUVTY/AkoSuX8INmIFU1UxTHePtWEjUnGQVT6LEb42P0jodfmVs+x10/R3jkJmL038haLcKUUgYHMiHITYluFX9klEAD572kNA7GuK/4/6fZxxAva832romRe6oa4hEGMh46hdppw90b4+N9/i2AXhEKlE/D0GRkTljZJKnqyfdKKkmJq9p2zPCTvM6hfmjpSGDYBZG1knipQWwT44fuhQZ84paJ5bo1dpr7V3J3UIoVBLxkW0u3CTUbx1me6oThjXsVJe2NtB5CxkvMDGQZJQJkCRvi6dBNlr2u44Y2g8A0iYM65EFxivqr+dfeplZR9JkIc+KFWrXBajHfyjNjWSoKapB4uSNYPG4PRw2JRnAJstGliAAHC7eaBcXP4OfL54R0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3017.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39850400004)(346002)(396003)(376002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799009)(41300700001)(316002)(4744005)(83380400001)(8676002)(36756003)(8936002)(66946007)(2616005)(4326008)(5660300002)(52116002)(6486002)(110136005)(6512007)(86362001)(6506007)(66556008)(54906003)(6666004)(66476007)(107886003)(26005)(38100700002)(38350700002)(2906002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lbhm9NXGmf3COj7UjL9wfbULG93JJIFqLyYmg9jyDRHUSIqEJv2zSvYO93EW?=
 =?us-ascii?Q?Xe5pr9uVr5pHBN0kw3B9NEN0GHA0ujIcrHNxUS16N7nqJZ/hn3M8PAnjXhXp?=
 =?us-ascii?Q?D6oBUbPpJ+mJuCk3IK91oc/+026HOXmaywGmTn671kLmz3qW2J6LhxrQgQY2?=
 =?us-ascii?Q?DM+u0HvQOPHhfUKXwStwLtst7mQyF90sz3Aihhq8LgceQ01tXxBqa1x7STf7?=
 =?us-ascii?Q?9rZr91EWpp+9E16VlZ5kCFh05nxDafDvX4/Bcayt8QSR5ojiqKWeG7m1MC6r?=
 =?us-ascii?Q?6UF+y/4eP5g2nKDf0kMsLi5AgRjWpl9RXX/NfZuc2J+WE85Id2DC47hDseeX?=
 =?us-ascii?Q?NJuuwgbJMiHUzijZwfYWvgeg5T+vnJ+nEpyB55PXkUbfW2TVth6Fd9NscOxS?=
 =?us-ascii?Q?HPpl4F3uxkM3UQ9FTOXtzxUA5NCrtYY5hQkazyls1m7yyl/UMC6XLuGE1L0q?=
 =?us-ascii?Q?ZRYOXL2KlqIFdTR09uU+o4RPiegClAwpRdZtGcyTVYexfT3bWtNU3iBzZhyw?=
 =?us-ascii?Q?eMB2I7GkgeUNBYDRQQwnd1lK7tJRBm5eMX+MgHhtJAGtx9Zsa42c6Ik9xdNy?=
 =?us-ascii?Q?5T+J9f+z0oEgDAJD9ZfSadnf+CVG9AkneuUMFpdymwLbN7tMSLAitmh6/D9Z?=
 =?us-ascii?Q?KJb4b87JRP7wlx+hio8eKI75R7QzXLv4MIDXhEmynrcRBeD4JIBWC4nJIZ4t?=
 =?us-ascii?Q?rQE2gNdBVzJhlVsZmQjjeBaKVWOHQbRJ9R6QcC0WUBVMwT2CJexjEKRe3/FO?=
 =?us-ascii?Q?Jd7UbxhJyOjGTDbVigYgSC27zmh/Ci9Kvgr/Om6aQMZPi5816cqy97IlGemV?=
 =?us-ascii?Q?ca+nkEjeUIRjcN3e8aLvBPib3E0wiOCtkHGeelYFM9iNZlVRQ5fhmI1RSOE2?=
 =?us-ascii?Q?XxhA3YalZHqAI1HYv52zcSNi2IBXYfRaY1WAVpveJzKT47r+dPHEga44hpYc?=
 =?us-ascii?Q?6K4zrIXjG1mDNueiR8KecUE5kH4RAMlQ6Y/lH70Pc8FNWo2ilEnzz2N0sasz?=
 =?us-ascii?Q?CSxYQ2W0neC8YMQxCsa08G8aG7b+UJsqOda25XkyX3k9l+SSifPIpPkWYAj0?=
 =?us-ascii?Q?0/JSNx+OZB3lMmGw0Kf8mQ0wICQCeSIEizoYdPnQk1i72caLReNN4Pmo+sWw?=
 =?us-ascii?Q?E98Ve55dkMMSktbObuyMsHCzCuWjAw1nXdeMlhNB/Abvsnm1bnpUMkpJ89bl?=
 =?us-ascii?Q?3c9DgvzBYN/F/e3PlMtkgTKrXsCXABLqsDYnscWG8b/iqLsrlJcx7PvIinro?=
 =?us-ascii?Q?T0S4c9stCyH/219Qz33COzJQnZ5hEqiK63xYD3HqXJBO41CpE3pJB+amcWM0?=
 =?us-ascii?Q?eEuqpxF0G0JedN4OIT9MrVx+FYQVeef0PYXUWAeb5tby3ImHDHZo47jGhLF0?=
 =?us-ascii?Q?UEBCSkzrW5HWhxrS74hojh3h64EMPju862TBOC+KHTiyOMpRqRh3drO5vE1i?=
 =?us-ascii?Q?zY8OSicNWRRF5ZnxhBOxBy+gpYs3q13pNhxlkZaYWVUVVKhpQLsc3JumwA9B?=
 =?us-ascii?Q?naKY4DJrGm6KrmFOPWbbg49u1hN3h96D1VUnBadNlp1PXKt8NJVC+UNAtevv?=
 =?us-ascii?Q?LWAFZMNYiJ4F5HHbBZRYpv8xWOxf4nbu4UYMTfQ+?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 878027eb-88df-493f-21ad-08dbc003252b
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3017.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Sep 2023 09:13:14.6636 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lfjFy1i+xCef9pxvJx/U22F7DnMQ3xNau3xtTQnaSN0uHG/q10JoYczJziOFbqXorNm1ISjHt7nrD8hgOWk8hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4470
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Use IS_CUR_SEGNO() here can make code more concise and
 readable.
 --- fsck/mount.c | 10 +--------- 1 file changed, 1 insertion(+), 9 deletions(-)
 diff --git a/fsck/mount.c b/fsck/mount.c index df0314d..e4372cf 100644 ---
 a/fsck/mount.c +++ b/fsck/mount.c @@ -2532, 16 +2532,
 8 @@ void build_sit_area_bitmap(struct
 f2fs_sb_info *sbi) ptr += SIT_VBLO [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.110 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.110 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1qln5C-0004yN-C6
Subject: [f2fs-dev] [PATCH v2 1/3] f2fs-tools: use 'IS_CUR_SEGNO()' to check
 if it is current segment
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: Wu Bo <wubo.oduw@gmail.com>, Wu Bo <bo.wu@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use IS_CUR_SEGNO() here can make code more concise and readable.
---
 fsck/mount.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index df0314d..e4372cf 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -2532,16 +2532,8 @@ void build_sit_area_bitmap(struct f2fs_sb_info *sbi)
 		ptr += SIT_VBLOCK_MAP_SIZE;
 
 		if (se->valid_blocks == 0x0 && is_usable_seg(sbi, segno)) {
-			if (le32_to_cpu(sbi->ckpt->cur_node_segno[0]) == segno ||
-				le32_to_cpu(sbi->ckpt->cur_data_segno[0]) == segno ||
-				le32_to_cpu(sbi->ckpt->cur_node_segno[1]) == segno ||
-				le32_to_cpu(sbi->ckpt->cur_data_segno[1]) == segno ||
-				le32_to_cpu(sbi->ckpt->cur_node_segno[2]) == segno ||
-				le32_to_cpu(sbi->ckpt->cur_data_segno[2]) == segno) {
-				continue;
-			} else {
+			if (!IS_CUR_SEGNO(sbi, segno))
 				free_segs++;
-			}
 		} else {
 			sum_vblocks += se->valid_blocks;
 		}
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
