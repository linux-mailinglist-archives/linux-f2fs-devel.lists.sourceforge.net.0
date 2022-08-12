Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E7FB590B29
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Aug 2022 06:31:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oMMKo-0001yH-FL;
	Fri, 12 Aug 2022 04:31:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guoweichao@oppo.com>) id 1oMMKm-0001yA-Jv
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Aug 2022 04:31:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4QHklZZLnLd7aWPugQT/Y1Ps43uMN1HGxxclv0Ie7qU=; b=KvYqhVT1p+UuPEquWfLubnlaoo
 Zhgxp70I7L2np7NMJ4UxE3d5+YWGqxju6wjPcqCvNJcolpFA7XXtQZNjN/hPvuoMK6Zw6am9IjlwA
 J1y98MAiY+OSG71qsOUcT4Zlm+TmU4Q6433pEbDbeITdTC8xOdPc6k9J5lTJAiIqCnWI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Message-Id:Date:Subject:Cc:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4QHklZZLnLd7aWPugQT/Y1Ps43uMN1HGxxclv0Ie7qU=; b=e
 9SA+NGULjIJwEsiQjM8CkxgFbg+lDxU2jbzlMkfd3+2/9fmIXCK9wFtUpHkFYKXTXuEptyh6W/UrM
 I51QpfeaHoKP4Z1UM/OqIdNPHN1F1k/Ba2dk0MKAr5xqLIbcdNKvDVNs8Qi9g898Q7GiILUdymWhM
 97FXnqSd2YWEdKfY=;
Received: from mail-sgaapc01on2049.outbound.protection.outlook.com
 ([40.107.215.49] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oMMKf-00Chie-K1
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Aug 2022 04:31:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mx9m2Fq+WxZnArPd+1c7815FVK3tm9meZPfaEQMmTWJPhf5J4UtULW0ad929YRPsNuBiG52y3lSwjSkHmAdft90cEnUjxRwTaFMzm4tFYBljANrPxhUM3HhkIaQi66paZ7Nj3H8pKDQB8qZNdoYGo2pF8ehQqs+81fosmH/o9CWSVI1JOYkzoNSs8glUs6y15yGFOAwvvNUluBY3EsTneTAVAZHqRGpvjSGK0jEFsaiEBWtzN9ec45qLDr0fS0plDOmdbLoa2feFKUdTgQNYVEbuNao6TtHbMs5hVjJIUQdUViOqA87jLLI0JVpuTDuqu1Mu1IljNzariC8um418YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QHklZZLnLd7aWPugQT/Y1Ps43uMN1HGxxclv0Ie7qU=;
 b=ogTVAhCMFdepx97tWeU24IPVfytbeuI/vFfDRTkvBn/oWYLKdS9XuD4Fy12063+cpST4E8uKm619EPbDdnctscAy1MYG6MUa/MU9dzBwr4I1tnbTxBlUBdafy9RAankeJpF5bfCwaT3c6Kc+FxVgmp8OEshc61Hi0Ld2GMJstoil5lMDJsYSQF0HfviwC//eCCaQswVIvvmQaOpWSbhHRTeZlFREI+au/fcV/Ek/gN2BN/+a9mWfZOAV5ouPOyR2SNjEuLnlrckQYbKvG1gMh6026xRq0uZBPc/xCcDz5G7EDAy9JECV6UrDeadE6sy9pMMRmkhZVNcPfNZICerr3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QHklZZLnLd7aWPugQT/Y1Ps43uMN1HGxxclv0Ie7qU=;
 b=Fy/T8iEj4lhzL+MjKE3+LH+p5F4ikJFgrhnzZBRvS/QESVVF98YyTi1gnLNy8v2a9GywUzcvAA4efr4rIiRvHEAIwaJz/FKF+/nWCADtmHDW2cOkzqbr6bYfsI0WJOlKvu3hFns+NPOeyvUjug4LwD97E8xsE42NpW2bOgfFkJ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB6118.apcprd02.prod.outlook.com (2603:1096:4:1f8::10)
 by KL1PR02MB4820.apcprd02.prod.outlook.com (2603:1096:820:5d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.11; Fri, 12 Aug
 2022 03:57:24 +0000
Received: from SI2PR02MB6118.apcprd02.prod.outlook.com
 ([fe80::2948:e45:ee81:63f]) by SI2PR02MB6118.apcprd02.prod.outlook.com
 ([fe80::2948:e45:ee81:63f%7]) with mapi id 15.20.5525.011; Fri, 12 Aug 2022
 03:57:24 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 12 Aug 2022 11:56:48 +0800
Message-Id: <1660276608-751-1-git-send-email-guoweichao@oppo.com>
X-Mailer: git-send-email 2.7.4
X-ClientProxiedBy: SI2PR01CA0011.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::6) To SI2PR02MB6118.apcprd02.prod.outlook.com
 (2603:1096:4:1f8::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 553d1979-7d12-4f9e-e34e-08da7c16c3cd
X-MS-TrafficTypeDiagnostic: KL1PR02MB4820:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hZw75SgsTB8Jdm/hVh1vcAONsT5qEkQWJW4yTe7+ksG1vKiEJpc5GPWKqsUHM9bJjoADtyBafadLfbEZTbEzAI0129PNZqkFJLRQ7AqxISR/nMkEL1w3DUqJX7Sd72GclOQsazUQduJC9/syrZoHXwJsxXwkBtBz0q+yXSpXDy+NkZTWQecJ2NPyAZhJMaNbtOtMANV3s1n0krJQwIL98NxLA3BmQxgcT1UwPoZnOOCq+qyu8Vdmhi6W6c8+F3JzAVIz6H43wzc53gyHwpIuHpLDxHZYr+U6LTVqO4/MEgw9wbvxLRN0Za1cF9mMZTJ/+I0O8bYwmHmevKsLFw2ANUujIx96hhAjLPu+cjPaoPXnRCRvCtiwAN3eMf60Kjs6EWZhbaA5Ut5UTF7/aEo02T010X93nBcNVVeHNO3AbjR2b2r9mjH4dQau+5Rs+yilA0W0qIybNMOuSM45wA3q+YRtTzrvUc7WY1u/mQDRed1TXst6WvWsyOS+fKfLe6Va5+fTc0IT0D8p+xdBrTQe2KbjRb8Rdu+ejYR6CWNr2gxB0meP8TimsmMP0QErsLNHiIEbC0yDohu2M/SQ1q045F5s2DR71C3OY1mkLmLnXKCgpXmUVJ3Le/VeTcaJfyu8jZU2Ey7SYvJ2N/DfVKaMUc468SWG8m29YmVqSeQsOd6lnj32pktZXgXL+XfWblg07R8GKVrQ8AQ/a0kJ7iRp1x3BDUsFFdkhW6srx8cJL3rlI1ZKchUP4K00PjhI7kEFxHwqW2nhF7R9A2b/5XeZBmFm3Ecm4l4tK2MCIzMok+Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB6118.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(39860400002)(346002)(376002)(396003)(136003)(26005)(66476007)(6512007)(38350700002)(38100700002)(6486002)(52116002)(8936002)(86362001)(478600001)(6506007)(5660300002)(83380400001)(6666004)(41300700001)(4326008)(8676002)(2906002)(66946007)(66556008)(36756003)(2616005)(186003)(107886003)(316002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GEqGfrTuuWSfcuk4r4umy66zdUSK4KSyt9PAMRmHj+12jQ6xByAC1Mq2iZDL?=
 =?us-ascii?Q?/SGi1kdUcjkxoUb48nd+LBqAtHyug2VuSTi0qb3Yvuktw0jRTh8ijk64UDCF?=
 =?us-ascii?Q?SRcahnI6ygAwNPdeiuLboN16AgmsMCLBstBg4ftG67vz+ySpzZgnFywaoqEg?=
 =?us-ascii?Q?03BZDRzwCbCGbC1ng+PatrJTOHVJsC+uzrqfOdOtwfHtxgIIxOFJ5WwJC+hB?=
 =?us-ascii?Q?M3XXLC5WhTiw1sy5++F9GYGVn6WTrH3Z3aknRM8CngWfXDVh9REbL/1r501x?=
 =?us-ascii?Q?OqBHod5F9K/i8knGgXAELTPbIHHDytKqtPI/qX+ItmlyfX63Hxp5O8YIDdrg?=
 =?us-ascii?Q?QXwnAOz3XXyfKhJ3XCuDi4QLpOtv1tVXTbPu8eBxm4FVG2yXdLfASJlW1ESx?=
 =?us-ascii?Q?MWqHHuq1DiQqiHArkTBOAlv+gfV6DAYBe1/8xeZr8freGrETyDinP3ql6rO9?=
 =?us-ascii?Q?QTe2wYsLCghNPNd6xXUMMIL0FbLaGBsBircj653gXBCo8hj+hK56mKjfHtP7?=
 =?us-ascii?Q?ihu5d7AsB337T/beWKpE0RyXpOyl/wbIkZFancVMVjWn3IzUM0VnHnPfSRhU?=
 =?us-ascii?Q?rRrp1HWNCOmvyzPgiCdNm3zvjbl0DhaYIKJ0s4S09Bad0f0Z5ZI0ntckmExu?=
 =?us-ascii?Q?YC0nbfpE7WNLS/WQDewrnVp4ScY/OKi7RhamIaCn507bdylnbB9elndDWDCZ?=
 =?us-ascii?Q?W5ygxYchGjcxMjRE9ky572CjSi8PSWb3Zxi6ttB9YBJ+a0sj0lsebQlT2gIr?=
 =?us-ascii?Q?DtISgQrILnjZ8SP0eKuyZhR9eqhsDPSS4/zvS2BotYJoXDoWevNC9yVWRoYI?=
 =?us-ascii?Q?E9mT6PXW+0X/L+AdUnOqLcwgOks+QxVMSQanQEP13DHUyjqNFiV7l8GkkLbE?=
 =?us-ascii?Q?XLCYdudZCe2Iuj4lhBRKA9XhDINjTWttXzqlQQH87fiRMga3JYjuaTyu+xHx?=
 =?us-ascii?Q?o8S0qQH8t8W52xl5HmMIj1fZSTmWja5TCyqPLU/6QRlK4IPwRohQIihdS2XE?=
 =?us-ascii?Q?YaBOjOMAR/ySitXTA3CuojF3UHwNRKZS7MeHYd0YsywVoRud7xtes3OfK3KT?=
 =?us-ascii?Q?JxN/X63ZK6pmtjhZjstQP7Hy53QqhRx0BdhlH93vzIMFFTdndMhI1YpbkkUz?=
 =?us-ascii?Q?GKE9PM0UCVxrCXaCIKmN+sKQte272meXaH3SnCZ+HPIvR80qRmcEWKRCFAzf?=
 =?us-ascii?Q?haZOiGi9P5qghXav1p5d8xUWrNkB3cyWD1euD107dj85Ows87+4bnKujA1D3?=
 =?us-ascii?Q?TBO7gEM7OQ7fnmXldDs82FX5hu6R2dOw1xgDmIAxUC0TrEMzT4h8p7UEXB8G?=
 =?us-ascii?Q?d5OpRMAGzO9moROZ9DO+M+SRt0aI4qrSmsstrXHVHPS2UzcGA+bO+FINiQBG?=
 =?us-ascii?Q?BSCMVUmQZ8fKnPoNlOBkEkmOG2mzW4qe7YLAaCKo6/0ZZN5/uvuo15WM7iQZ?=
 =?us-ascii?Q?A0ZMAcmktkaaMcvNK8JLwFS9wxKYMUPPP8v9mWUNuNh5iDWjGVNSTvGZAQfN?=
 =?us-ascii?Q?9a6M9lVbB6oOcSzQRBonoLpEYNDuFhHE76YgQ2m7bPGXdGLoJixr2AiGdUkP?=
 =?us-ascii?Q?V87dOynO1vVFHMFjYObRBteO8ZHZINmO34AiJ44iK2tp3SmJ7naHJkBotsf9?=
 =?us-ascii?Q?cQ=3D=3D?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 553d1979-7d12-4f9e-e34e-08da7c16c3cd
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB6118.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2022 03:57:24.4396 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 64C2QU1FPk5C/8v+XgNcDpRHsqhIsKFNUY8X334bbtatljyB7CspviP1BFlPxE6I/1C692xwb5NF0EnXChmBdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB4820
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When we try to defrag a file, its data blocks may mess with
 others if there are lots of concurrent writes. This causes the file is still
 fragmented after defrag. So It's better to isolate defrag write [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.49 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.49 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oMMKf-00Chie-K1
Subject: [f2fs-dev] [PATCH] f2fs: allocate consective blkaddrs for defragment
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
Cc: zhangshiming@oppo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When we try to defrag a file, its data blocks may mess with others if there
are lots of concurrent writes. This causes the file is still fragmented
after defrag. So It's better to isolate defrag writes from others.

Signed-off-by: Weichao Guo <guoweichao@oppo.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/debug.c   | 4 ++++
 fs/f2fs/f2fs.h    | 2 ++
 fs/f2fs/file.c    | 5 +++++
 fs/f2fs/segment.c | 7 +++++++
 fs/f2fs/segment.h | 5 ++++-
 5 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index c014715..d85dc17 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -442,6 +442,10 @@ static int stat_show(struct seq_file *s, void *v)
 			   si->curseg[CURSEG_ALL_DATA_ATGC],
 			   si->cursec[CURSEG_ALL_DATA_ATGC],
 			   si->curzone[CURSEG_ALL_DATA_ATGC]);
+		seq_printf(s, "  - DEFRAG   data: %8d %8d %8d\n",
+			   si->curseg[CURSEG_COLD_DATA_DEFRAG],
+			   si->cursec[CURSEG_COLD_DATA_DEFRAG],
+			   si->curzone[CURSEG_COLD_DATA_DEFRAG]);
 		seq_printf(s, "\n  - Valid: %d\n  - Dirty: %d\n",
 			   si->main_area_segs - si->dirty_count -
 			   si->prefree_count - si->free_segs,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 3c7cdb7..5f9a185 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -760,6 +760,7 @@ enum {
 	FI_COMPRESS_RELEASED,	/* compressed blocks were released */
 	FI_ALIGNED_WRITE,	/* enable aligned write */
 	FI_COW_FILE,		/* indicate COW file */
+	FI_DEFRAG_WRITE,	/* indicate defragment writes need consective blkaddrs*/
 	FI_MAX,			/* max flag, never be used */
 };
 
@@ -1017,6 +1018,7 @@ enum {
 	CURSEG_COLD_DATA_PINNED = NR_PERSISTENT_LOG,
 				/* pinned file that needs consecutive block address */
 	CURSEG_ALL_DATA_ATGC,	/* SSR alloctor in hot/warm/cold data area */
+	CURSEG_COLD_DATA_DEFRAG,/* used for defragment which needs consective blkaddrs */
 	NO_CHECK_TYPE,		/* number of persistent & inmem log */
 };
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ce4905a0..f104e2e 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2626,7 +2626,12 @@ static int f2fs_defragment_range(struct f2fs_sb_info *sbi,
 
 		clear_inode_flag(inode, FI_SKIP_WRITES);
 
+		set_inode_flag(inode, FI_DEFRAG_WRITE);
+		f2fs_lock_op(sbi);
+		f2fs_allocate_new_section(sbi, CURSEG_COLD_DATA_DEFRAG, false);
+		f2fs_unlock_op(sbi);
 		err = filemap_fdatawrite(inode->i_mapping);
+		clear_inode_flag(inode, FI_DEFRAG_WRITE);
 		if (err)
 			goto out;
 	}
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 0de21f8..17e7d14 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2749,6 +2749,7 @@ static void __f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi, int type)
 void f2fs_save_inmem_curseg(struct f2fs_sb_info *sbi)
 {
 	__f2fs_save_inmem_curseg(sbi, CURSEG_COLD_DATA_PINNED);
+	__f2fs_save_inmem_curseg(sbi, CURSEG_COLD_DATA_DEFRAG);
 
 	if (sbi->am.atgc_enabled)
 		__f2fs_save_inmem_curseg(sbi, CURSEG_ALL_DATA_ATGC);
@@ -2774,6 +2775,7 @@ static void __f2fs_restore_inmem_curseg(struct f2fs_sb_info *sbi, int type)
 void f2fs_restore_inmem_curseg(struct f2fs_sb_info *sbi)
 {
 	__f2fs_restore_inmem_curseg(sbi, CURSEG_COLD_DATA_PINNED);
+	__f2fs_restore_inmem_curseg(sbi, CURSEG_COLD_DATA_DEFRAG);
 
 	if (sbi->am.atgc_enabled)
 		__f2fs_restore_inmem_curseg(sbi, CURSEG_ALL_DATA_ATGC);
@@ -3161,6 +3163,9 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
 		if (is_inode_flag_set(inode, FI_ALIGNED_WRITE))
 			return CURSEG_COLD_DATA_PINNED;
 
+		if (is_inode_flag_set(inode, FI_DEFRAG_WRITE))
+			return CURSEG_COLD_DATA_DEFRAG;
+
 		if (page_private_gcing(fio->page)) {
 			if (fio->sbi->am.atgc_enabled &&
 				(fio->io_type == FS_DATA_IO) &&
@@ -4332,6 +4337,8 @@ static int build_curseg(struct f2fs_sb_info *sbi)
 			array[i].seg_type = CURSEG_COLD_DATA;
 		else if (i == CURSEG_ALL_DATA_ATGC)
 			array[i].seg_type = CURSEG_COLD_DATA;
+		else if (i == CURSEG_COLD_DATA_DEFRAG)
+			array[i].seg_type = CURSEG_COLD_DATA;
 		array[i].segno = NULL_SEGNO;
 		array[i].next_blkoff = 0;
 		array[i].inited = false;
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index d1d6376..75e2aa8 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -44,7 +44,8 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
 	 ((seg) == CURSEG_I(sbi, CURSEG_WARM_NODE)->segno) ||	\
 	 ((seg) == CURSEG_I(sbi, CURSEG_COLD_NODE)->segno) ||	\
 	 ((seg) == CURSEG_I(sbi, CURSEG_COLD_DATA_PINNED)->segno) ||	\
-	 ((seg) == CURSEG_I(sbi, CURSEG_ALL_DATA_ATGC)->segno))
+	 ((seg) == CURSEG_I(sbi, CURSEG_ALL_DATA_ATGC)->segno) ||	\
+	 ((seg) == CURSEG_I(sbi, CURSEG_COLD_DATA_DEFRAG)->segno))
 
 #define IS_CURSEC(sbi, secno)						\
 	(((secno) == CURSEG_I(sbi, CURSEG_HOT_DATA)->segno /		\
@@ -62,6 +63,8 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
 	 ((secno) == CURSEG_I(sbi, CURSEG_COLD_DATA_PINNED)->segno /	\
 	  (sbi)->segs_per_sec) ||	\
 	 ((secno) == CURSEG_I(sbi, CURSEG_ALL_DATA_ATGC)->segno /	\
+	  (sbi)->segs_per_sec) ||	\
+	 ((secno) == CURSEG_I(sbi, CURSEG_COLD_DATA_DEFRAG)->segno /	\
 	  (sbi)->segs_per_sec))
 
 #define MAIN_BLKADDR(sbi)						\
-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
