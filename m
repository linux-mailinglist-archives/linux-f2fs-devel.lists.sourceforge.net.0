Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2EEE642AC4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Dec 2022 15:56:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p2CtR-0002j6-R6;
	Mon, 05 Dec 2022 14:56:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p2CtQ-0002iv-N2
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Dec 2022 14:56:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qwZPEk0/yDwOeWJJRjEiTYic+YzaSVaIcjeYboXWcow=; b=V9Jc6wvXpSIKqdGH29iqZXli1N
 mzXq0J8rwhACCmEQIPcoWjmLR6I8B7oNOz/r9KPuJQh+9FCRdyAjaHWk8vR6new0KVAJeql+QoRPj
 5G0JT+/xbJFutJInrnGBLDnRGE16f8voZJJhzZE4S5YSmpVxd5LBQ6hXA8hDZo4kCHZQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=qwZPEk0/yDwOeWJJRjEiTYic+YzaSVaIcjeYboXWcow=; b=W
 Nd03AAitTR5KeXzvrLvQhBLbVRpcGXSiEI98lKRXgvW9qAkyxHX5FHixGKR80Ef/BPHwpxhOxmHA7
 ifZRZ+9eHBE235ORuTDY58XRe/AR/QLKixXwVyWiYX8p2Cc7UgU7dkudJCG9VaWk9qIDPv9lYiteq
 uSUBEVXcx84zA5KE=;
Received: from mail-psaapc01on2126.outbound.protection.outlook.com
 ([40.107.255.126] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p2CtJ-006tSB-Fh for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Dec 2022 14:56:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HbRTuZPb9Oxh9wMNZlX2MFdygJSgt/H/mAMzvgjAKKVzMUSutGNUhc7gzlsfgO///JAZFuNuF231F7ESaIzZubMw5z3jM+sYoJwMzf1BdKjIrR/kZcXAGo/T7gBEM4cahK8lChZXIcbmoDC4EhaQ+T6UnBkpMriyLTq0ck3F1Nk5102kZygeJQc/rJwjqlVOrOYEEcO8kj4EzNTcpwNGlSoMUpiCa50tnsAARCeZd8ZO8btrlvHTPTi0ZuVf76X2VEn/95QbHPmE5lVRQH+JwqnacZh+J+jKSIjaf92PrNwhdAdsni4hu2o8YloWeK5HJR96hyX7hrd/zUz6iSzgcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qwZPEk0/yDwOeWJJRjEiTYic+YzaSVaIcjeYboXWcow=;
 b=J9Bis7fg3Iq5zs0NdMoW/T/eGgMJvsfPEZNpGxAwv1/NJMh+jwlxIeGpOC/eJXwvtPZ8z1OXHgQkE+xWalsSH1isMGFHtG6RRcrUV4fuExIVKPfH+IwAumEVtdIjLHVLq5vfs41XY6cyzzSfg4swg8p4OsXxBA6Fw9PQ7H7yhf6KtHjlTGjZEJKKTV2P4DKlNnyYPgkExnTrwCaHzTgRZiM2eJJ8pW+wcZYTql7EO/gKuoFZ94wJWYEZfSlCG6LcjSvAjnS8DHByV7xvlA6WmLXoTunrm5xLRn7X3NBYJN+cyK7ZYHn6JmeEvNGlrm/xNroAkS3IJW3iUf5rYozByA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qwZPEk0/yDwOeWJJRjEiTYic+YzaSVaIcjeYboXWcow=;
 b=bcaWHSyGxz22YR0Djujrq8MK24gY4KsAtvxrxFS+941pF+oWpqzOYHVoqZhPfk8obJEN1RKgcNrTo3ndzjvho5mvtJsVE2RDu8J4pCNFyqkm4j0rTZqTSk4c+M0TLivXJHsEAQZtpFZTnJkB3rV9ORtnoM+AsBFKRYFSJCruVRgPVR7GTQsufvnFx0lGUk0fvRVKzA46c9hDa+A0xBHtacf44Bo/dc2yLTmdoUAnp2ruIGDcpuaigmzXYMY0MZhfvsaXDzbuEBvTe5t+f1WuyiBO4NZ2tcS15Sqm87pmKjq4H38/VyAZwOHMAgQovUhC4mgYINfzrKZL7L47c8BlSw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by TYZPR06MB4015.apcprd06.prod.outlook.com (2603:1096:400:28::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Mon, 5 Dec
 2022 14:56:13 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::1a6b:98db:3289:3369]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::1a6b:98db:3289:3369%8]) with mapi id 15.20.5880.013; Mon, 5 Dec 2022
 14:56:13 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon,  5 Dec 2022 22:56:03 +0800
Message-Id: <20221205145603.70779-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR02CA0130.apcprd02.prod.outlook.com
 (2603:1096:4:188::8) To TYZPR06MB5275.apcprd06.prod.outlook.com
 (2603:1096:400:1f5::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5275:EE_|TYZPR06MB4015:EE_
X-MS-Office365-Filtering-Correlation-Id: c2d6fd88-fe49-4986-b863-08dad6d0da4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: udJCzo3SZOhmgMv/AbCMJcnBRQLdCJ96RMnIxbodlq41jVK8qKo8iknZVetSOaW4B/rbbXMLMl3coxNga2jIs4MN2LRd+d9yu5gMzg0jjVJMCKfjj5Yc/eLzimPVyM3fFVJVGG3f7wbZA6JTGWSj6KCQTdUSQ977BI0FuxnS46Mz2UactKzxR3Kjqv9fi5hLuTxsasN7IvhnCMGwyopJez0PE9/WZmKABYtDkuk/KfzXBbPHzYMzI6o65V6KgIu5H+UuZT6wKil/Auo6jLyh5FedtEV3DU606e8006mvOneKnwtwM7G7WYGzhZP07V7HTY8/QsNZ4GSjHLlUbcGhOB/BbBtaZKawjauM/DN/k21BmDUL7rRO8GJCmZoYPOSCQZf8HoD50/HGa39hKSKg5vLhSob38be5Iakf64Nv0KeStd1HWiPubeQDyq7qf8MLai05NzqygJf58QpHkRYAmhiquyM8JoDO+UOypGlrEabi/L6VyWAFhg4hneOyh8XTzeQXhMa7sCLwYzvX0h5JBo0uLFKAPxd5bWgA3/u4JxcxPYP0E40ceF9jSlTv1ljrcmkAJ4n9yNE5x6yThGVNuYjKvsa8IBatsPyKVoHZUfmMWeKF6I3GfFa5gVBozPJ7nQ3PWdAu+n/01+boWursY8d1HF2BbM+f+2rhZOmEmjOYBLGePBdOhUKsmlAwimQ8
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB5275.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(396003)(346002)(136003)(39860400002)(451199015)(83380400001)(38350700002)(38100700002)(4744005)(5660300002)(41300700001)(2906002)(8936002)(4326008)(86362001)(8676002)(52116002)(6506007)(6512007)(186003)(26005)(107886003)(6666004)(1076003)(316002)(2616005)(66946007)(66476007)(66556008)(478600001)(6486002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tp/JBY5jBjydYP4qTci3r2+E8ZQkIunJLvnn3fy60cKKIw9rfKP74RnYIBbN?=
 =?us-ascii?Q?PeLUdk5rCo9WBy7HWf170T8EpS9b7ACXpn/kDTBRXRQMXQhort4moiy1cxfI?=
 =?us-ascii?Q?WqkA8lXMMcS997GSEr2gWfETAL3U+ETz1+yWFCfMKML9E09p+N9NLR3wSXzk?=
 =?us-ascii?Q?rlmbsdmrFOc3Mkq0tz7gbuv0Sw8IajeKMi+Lxsb1Ngo60ubxDtpCMx42WFai?=
 =?us-ascii?Q?o1w5tPiL/aiFM9i2WFXm30nL0poRnY1VXXOO3fXjhh89k5QtQ9S0tTe8+X7i?=
 =?us-ascii?Q?kLZszm+kkojJ4wci6dvmfMt558ej2C8WEyrYDSUZVJSeL4mjznDa/AzlD2ZV?=
 =?us-ascii?Q?VSuNeCExkkkGYVBhTK9X47WaT5MxF5J/2L+FVKqlUmY1uUOZfvSXTMBqemZ6?=
 =?us-ascii?Q?0Ypi995OC3M2yYtS7kC9Tg31Vm/fvVIXcYuKR5MoIscYJ10BC9Isxh9172T4?=
 =?us-ascii?Q?jSNfSFN7E/EM+BREcpgfTnplkkdOPrsK3URH+BiME0L+bf5iZPCvYDNMJZfJ?=
 =?us-ascii?Q?1KkGne4rGtjNqKV/fI2iSL5yH1rpcTqxf7AbjFSSjOf2cV48vN2nhj7DsfbY?=
 =?us-ascii?Q?/bYpCD2c8kUkrLHKKK223W3qMJhNKuvVntcUat1a7+1s9lIOStOZZSacQQ0b?=
 =?us-ascii?Q?1Ml5hCJm4fz+eJ63Rh8KGLbFwJ9qZTBpC+5RDCMUraOqrkAqnpXyXvRl1Rlo?=
 =?us-ascii?Q?GpCs5EwztHCGLe4+SzKs77bS/qk6wfhH8h+gikqyLl3Y2tPYngZR7isVl/Zq?=
 =?us-ascii?Q?3lpb7B6De2j+lrzRroL83u5F+xSRmDaTGmo7qRv8FwUK4mTqEoJG8qVzqtsI?=
 =?us-ascii?Q?Q4DQcXTDyUhhnmeB8xNl+k/0JB05HU2fbCByhv/ALqt8pv9SDdkEctDUX74N?=
 =?us-ascii?Q?zhEu56PQd4UvW8Qy3qLYCn1t8aED4Q+hRIFrnGZKA9FjjeJFlrqtJO+DRhLC?=
 =?us-ascii?Q?Ev9V790GR31frBa0TLWqXOS/JJIEIb/QXmckz/8q1zBs5FL07tMgfxgRDufn?=
 =?us-ascii?Q?+XKA3zDYDkvD+yVSkfGOqLErQllmj5YqsMHH2LD/JHVe5VDPM6ouBsWmzQkz?=
 =?us-ascii?Q?+w5AJFd8g+nC1C+qeUq3HOeO8c+aNn10rgUorxMCQY14VwFg2OcBhEzllwQP?=
 =?us-ascii?Q?hFbJNbcyFTauwm3yybVeh65JqtsTcmE4ZH/UTDzg4ba9ZWNl3gLy4jt8yYwP?=
 =?us-ascii?Q?mdL9xaF1qlzgu0KqpSBiT11FM6E9KdBdLsd2cspRSJde7eJATZ/OqgIUYrS7?=
 =?us-ascii?Q?WTVmH0sSeBCDlQ996SXpTN65imAcNFywt+OntO3zqtMkpt51aSYjDpwqOOFn?=
 =?us-ascii?Q?l72NAFplOQih40rHwZ6fag18LPYfeDSpq6D8cHPh/mHTp/J/w8Kk9WPRkm5F?=
 =?us-ascii?Q?TjQ/zjTR7J97OVLYzPhlRHELXka+WqmEWsm+kgOkNCh6m9LrT84ylmlLPm9g?=
 =?us-ascii?Q?tVqTbaV00e7U2bDSFbvzTTTcXMvDYMo+KetEA5sCy5BvhL/HqkFZkYUIT9VG?=
 =?us-ascii?Q?G0/JgtAD19+yfY9hFzd3A0WJ+29IlqtqrBmcy27UTLPbFMerlKYN6gujlX7K?=
 =?us-ascii?Q?Zh67CBogTJ3W8k2wHIyv0lWMahp7BkkzLtSV3Rjn?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c2d6fd88-fe49-4986-b863-08dad6d0da4b
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2022 14:56:13.3564 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HA9u29/Hl9OvHXg5TKnDDwDc4JnsTpt+2kocUGEfp4pkbBFvTKPG2ijvoK1sQyiLEH33BHnAhRRgwnEOC2k/MQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4015
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Just like other data we count uses the number of bytes as
 the basic unit, but discard uses the number of cmds as the statistical unit.
 In fact the discard command contains the number of blocks, so let [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.126 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.126 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1p2CtJ-006tSB-Fh
Subject: [f2fs-dev] [PATCH] f2fs: fix iostat parameter for discard
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
From: Yangtao Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yangtao Li <frank.li@vivo.com>
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Just like other data we count uses the number of bytes as the basic unit,
but discard uses the number of cmds as the statistical unit. In fact the
discard command contains the number of blocks, so let's change to the
number of bytes as the base unit.

Fixes: b0af6d491a6b ("f2fs: add app/fs io stat")

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 9486ca49ecb1..bc262e17b279 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1181,7 +1181,7 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 
 		atomic_inc(&dcc->issued_discard);
 
-		f2fs_update_iostat(sbi, NULL, FS_DISCARD, 1);
+		f2fs_update_iostat(sbi, NULL, FS_DISCARD, len * F2FS_BLKSIZE);
 
 		lstart += len;
 		start += len;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
