Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB2D71230F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 May 2023 11:09:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q2TS6-00045s-2y;
	Fri, 26 May 2023 09:09:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1q2TS5-00045l-6v
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 May 2023 09:09:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=22vNun2m7vqIi2mVP/jaXLcfyT5231aRW0PyocdrXa4=; b=c/LdiqL8GNqEJoNP+Agw0WLZ9U
 BA1AZ8CyS/OwvNuLgSTLqyf/GIc0JNEToERZtMUK9RSPHsCcNDCC0wVzR1CpRJVMbaw663R209Eus
 q0cm4yk6qQzKaOB9l1fvyv1D0awhu4/Xgb6dgjLGnSGh8+jr2boRyHnr/0dpK0OAfBqg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=22vNun2m7vqIi2mVP/jaXLcfyT5231aRW0PyocdrXa4=; b=R
 XfjEGFuwXqQQvNQIVZW8/yzE5s0zB34t3C063hFzVDBy5BwxR5VySqr4ccf0/x12P9CQJ0WQ3SJoN
 lOhdIr7H8CmtkphsECtBu/d3PMLhNtD8BnYKO4cYSf9QSgZN5/rUWB9vFfgWecCdCLIDMZA5GPrGW
 oMYW863e0noFmyWw=;
Received: from mail-tyzapc01on2118.outbound.protection.outlook.com
 ([40.107.117.118] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q2TS4-0002gk-Ap for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 May 2023 09:09:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQzwpB241pY7RrXcYXVrqilJHrUuz7hNj+204p8+Sr7UR6n0/gx3jnctxXEljK4bFwR7lGi1Woq1bcoaN6RxpR0q90BlyThxYuVA7OGsoddlq5qL+Pqfk20vQvHYLCO2Kna5JsxhPRk6HMoDRMfKZ27DtiJqmrO07+kJKG/o1bl4aWj34NBnr097YDn669u1YttMDTSnBHsoW+SpKCDZp1lm/3R8Jy1Qf6uRNhga7cD+gTkV8uRaJEOcEjvjAHlj4delqi1tb7yCaDoCRLnKSRu7ewVOnhdjw10ZC+g/BDDcQBc8HKKpTdT3iJPr7cikX1WqK5doNrLXzFUINrQ8jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=22vNun2m7vqIi2mVP/jaXLcfyT5231aRW0PyocdrXa4=;
 b=eyoqZFF2lu4wcFkEB7WOhgXNJ+JhGqpJisKKDkQDH8QH76tq6AKHl+deHeDCCyNhUY3PTpJ4RqDsB9nosRT2GW9UPOn8XqFqZmdLJ0oZe1XIj28GvUjT+iQJmhi2HyKztC5IRL7nXu+VqZM+CKV7ewfc0/JRopV8aXl1H+e/5LAvJ6Bc3whDRzpOsHWyw3tCOUv8gOrUIA41Ej7UdJC9ggvA1kUBGIh18HsUe0zrObghZQCY8+BCuA3Etm+s6bzScF2F6wQHZ7C0VH/wyCUkAPKj0N6zkfF6StvuAU6E2j5iSqjpt1jDovPhlH77r2QvKKRwvXZl/MXq69AJJwPgjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=22vNun2m7vqIi2mVP/jaXLcfyT5231aRW0PyocdrXa4=;
 b=QSM6LCFWCHqHQVfsEuoSvWDXech0gPnjkuQklYor0wctp0QnMI0iWqQo8sQwOYzBUE+CxQh8plLd4xNcLs08TMCawX7nPVXoZ7Noxy+SStcXiug+6+/CU6EPQwZEv56rVmn6CFgRdSPtvPcK26X7VP+IILEg115ObnkYlrsJ7EtCAeUWYmF0VfMAnUeK/f4fem5VQ6HEjNVBSDyP2z5Jtjy/vcNTo+u4/aCkplqEBVdxqUvfQokvpiG0meJ0ro94erT38MYNoBrf0OT9mYSQxAauhvowFJubcCq+pM8T9k4FVSl6D4qA+ATHmR1SxjaKNE004/820whPAN75VXjXlg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SG2PR06MB3338.apcprd06.prod.outlook.com (2603:1096:4:97::23) by
 TYZPR06MB6468.apcprd06.prod.outlook.com (2603:1096:400:459::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.28; Fri, 26 May 2023 09:09:28 +0000
Received: from SG2PR06MB3338.apcprd06.prod.outlook.com
 ([fe80::a05b:2f8b:fba5:50fb]) by SG2PR06MB3338.apcprd06.prod.outlook.com
 ([fe80::a05b:2f8b:fba5:50fb%7]) with mapi id 15.20.6433.018; Fri, 26 May 2023
 09:09:28 +0000
To: chao@kernel.org
Date: Fri, 26 May 2023 17:08:20 +0800
Message-Id: <20230526090820.64114-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SGXP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::16)
 To SG2PR06MB3338.apcprd06.prod.outlook.com
 (2603:1096:4:97::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SG2PR06MB3338:EE_|TYZPR06MB6468:EE_
X-MS-Office365-Filtering-Correlation-Id: 053cd657-ca00-4c67-d471-08db5dc8e781
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TdOYA1c2XG6b6Mn7Yh9OqDojj9SnzeDtLuZssI/EsSBlyDvIGW11PXfFGUL1+ojyeFENdbuYSsl7beiEU/CyokeiJqAOHGVJwXF1y/j//gBhoOnH1isVUumzoIPCsFe7XtK6BDaXntWR3CTtGKqFOvvBzDXMRZcDsX7mO8vm2rI1Xi0VanSjzakJlzhcTyjl7iwSzF/DjgsOl/O1xRq8gkG+bCr94g5N8uyCdFY77W0a0Nb4eiUJdxlN0cjdYBytjg0y8+dPDUQ0sXKHLbJClPDb+6gSVMZR2lMShIOXh5ml5XeXWNdZbSQaAKsviLE1dMuyuB/LnasselVCxeBfyrLWXuWlj/uLRyLOmczJSD+Q5/2V4JrWpIdjETw34Bvn3wrKbHYhKzpurv90oWGnjCOrF8dF+RaR3JnARvv2i4EHEwpwTlkjrx4ZPD2fTvG1ntBD3wpO2Rh+wEcKA7TjwAdwhZoytQH6z7wTEJvg3HJTVG/gxDWYK9fpyHXuXX13lga1/rJoyjKwOBKiN9GqfSeT+gEsnYM9xXKEAHdWFROSYhcDQ7qALR1Elx1rQ0ep2LzKdn9gS9t8DKmbV0pRMDThpKQcBiL+MuaVZwP4aMhXYxQIZlbsT63OVEGETXOt
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SG2PR06MB3338.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39850400004)(346002)(396003)(136003)(376002)(366004)(451199021)(2906002)(2616005)(86362001)(83380400001)(186003)(38350700002)(38100700002)(5660300002)(8676002)(8936002)(36756003)(316002)(52116002)(6666004)(6512007)(1076003)(26005)(107886003)(6486002)(478600001)(66476007)(66556008)(6916009)(41300700001)(66946007)(4326008)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?By0KPFyaRZTNBHZjicLsgqtfcmdvRoOCPi9BB+XA1ZTdCdu7u/efa+fLU2wZ?=
 =?us-ascii?Q?FcV4yTPrCXsOKNGpRK28bYjzp0Sa9aFHmcAzRtv1gjMYU8GRvWEydLRIbnTa?=
 =?us-ascii?Q?WUXKBNoLCaHT4pi7tkE4v2Jez8q9gAAKhe6g0dEPGOahAcklPE0nLvT9CHSA?=
 =?us-ascii?Q?6PzfH9JWL5cUuWQYZZewcumMwrAl7W3BlUriDdFWHh4Ti2eutJ6XXiNzEvwl?=
 =?us-ascii?Q?2T6fddykfq4AlPq+gGpHM0CCEuk6Tw9PgI4qzpEDDqV+BUuBuwjlVLCu6YTF?=
 =?us-ascii?Q?ObQGxWI0h/rfrUXfpTFBc2w384WLRUoByefzyas5FRAsBpztIyq8/M1xUKkM?=
 =?us-ascii?Q?d8gg/t3YZ1RV3y9R5gJicL3WXgmJkGvwwEBqzPQA4tmLBVmcPHC29K96117j?=
 =?us-ascii?Q?v2h5QDXtygm2s7B0CoahNmmvQNA3SXZz8caXhlknSaKTt6B12yjAMguNw/VV?=
 =?us-ascii?Q?GkBhKKGGwKNXiNMI2Yb1Qr3qWClhQ5nHhXmVnNEGWc2LAnT61tWx/OjBXcLO?=
 =?us-ascii?Q?6Cgxp1NUBdYYoVx+RyB15TEisOCZYKgLIRSJgh88lBjzkWpm3AsrPuGL48Ji?=
 =?us-ascii?Q?l+JUCmoNzb8YlhpsECB/OyBgmuXjDv2Rxq1lRPYDwAsuI4DxTqWoIPt1loEQ?=
 =?us-ascii?Q?mdxxzJgWOLba33ghKnSOQqg+3U9YWRwjg0EHqAJNMUYlbLLeysA2+2YF9ixJ?=
 =?us-ascii?Q?1EMh2aitx13VzGi44/gzw5rctFj8AsTZvoCZEG1WyC1vc1tCrraOyKa87NB4?=
 =?us-ascii?Q?CRkQe7HAz/39H/wiFzhEiyEc2NDvJv4FNHAulGxUQvzRHwdbSPJTgcDf3P6V?=
 =?us-ascii?Q?2nkmC04cYUhBEu7Nebv2u588+dbnPIiHpHzucaHSAc+gLi77pOKxeW8HQuq/?=
 =?us-ascii?Q?y8I24PNgT3GMbSp69LTYEJSAGB1V2kwfhGsv4bGMSV2NhFvDsI1zraz5u5nS?=
 =?us-ascii?Q?TSNZdibWIllv+LURTM9kff6JRhhGWQKMLXrNwfOcGCnRMGfs5o1Aazz84Grv?=
 =?us-ascii?Q?Iyg82dmQYEB0oo0KGZxhNUp1M7RdTvmmoCuOm1cMFBN2kJa6fsTSmI0E2gIb?=
 =?us-ascii?Q?vesdJ8OeW/y4GgquU0vBnsTDinJJlzD5fYitBdLTGeni1yXxsfRbRIRzQnUF?=
 =?us-ascii?Q?8oI4KHtp5bsQiiRXFbchIA6U6oZ6Mampw2BNC8NTdqPn1/L+ys36iUeg1Ghb?=
 =?us-ascii?Q?zN204kbEpi18I/rKQjU/cL9GdzdfKUzjvpTbBBEowz71M1wt7mPAXpVL+tE0?=
 =?us-ascii?Q?TXav3U5baJITAxH3tT38rIMnLX1ZcKUpwEDOYmtsvmY5pZZ4kMjdkGnwHuWb?=
 =?us-ascii?Q?3AC+O/X41Fuu7KvBYu14n9GM3RK5rpSmObpgzNQ3e+39IpqN+9pKXrQow+fi?=
 =?us-ascii?Q?oG235edwLwPKeszSxLL5O53VxWcHV8GC+ywwdtoI8S0YnSrhkwFXTokq1X4g?=
 =?us-ascii?Q?ryVzXbw/vr6cl8A/nPYH4NwwV7ef7Sj7L45EbDznhckTp4O4m4QAmdV31AT6?=
 =?us-ascii?Q?Iy2gpcBIte1XVOPQ/sNBHLA9ey+rVRYTCJ/JSt/xlEwkcyAn4sYv9+C5laEz?=
 =?us-ascii?Q?aKxP0ppZ8l5lXFKtMtgzrR5xOjYkpSOH6YT1iWWE?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 053cd657-ca00-4c67-d471-08db5dc8e781
X-MS-Exchange-CrossTenant-AuthSource: SG2PR06MB3338.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 May 2023 09:09:27.6491 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qLHJRgHHhDv5Th+IDrprE76tKsNjY4BtoAiXbeUZH5AXrHzpcNdWo4uVGJVQUHl8T6irdOoZbo2SjTzHVP8CVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6468
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: find_fsync_dnodes() detect the looped node chain by comparing
 the loop counter with free blocks. While it may take tens of seconds to quit
 when the free blocks are large enough. We can use Floyd's cyc [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.118 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.118 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q2TS4-0002gk-Ap
Subject: [f2fs-dev] [PATCH v2] f2fs: Detect looped node chain efficiently
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
From: Chunhai Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chunhai Guo <guochunhai@vivo.com>
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Chunhai Guo <guochunhai@vivo.com>, frank.li@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

find_fsync_dnodes() detect the looped node chain by comparing the loop
counter with free blocks. While it may take tens of seconds to quit when
the free blocks are large enough. We can use Floyd's cycle detection
algorithm to make the detection more efficient.

Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
---
v1 -> v2 : Bail out if a looped is found in a chain and do repair in fsck.
---
 fs/f2fs/recovery.c | 78 ++++++++++++++++++++++++++++++++++------------
 1 file changed, 58 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 58c1a0096f7d..c1dceda54a4f 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -360,21 +360,54 @@ static unsigned int adjust_por_ra_blocks(struct f2fs_sb_info *sbi,
 	return ra_blocks;
 }
 
+static int find_node_blk_fast(struct f2fs_sb_info *sbi, block_t *blkaddr_fast,
+		bool *is_detecting)
+{
+	unsigned int ra_blocks = RECOVERY_MAX_RA_BLOCKS;
+	struct page *page = NULL;
+	int i;
+
+	for (i = 0; i < 2; i++) {
+		if (!f2fs_is_valid_blkaddr(sbi, *blkaddr_fast, META_POR)) {
+			*is_detecting = false;
+			return 0;
+		}
+
+		page = f2fs_get_tmp_page(sbi, *blkaddr_fast);
+		if (IS_ERR(page))
+			return PTR_ERR(page);
+
+		if (!is_recoverable_dnode(page)) {
+			f2fs_put_page(page, 1);
+			*is_detecting = false;
+			return 0;
+		}
+
+		ra_blocks = adjust_por_ra_blocks(sbi, ra_blocks, *blkaddr_fast,
+						next_blkaddr_of_node(page));
+
+		*blkaddr_fast = next_blkaddr_of_node(page);
+		f2fs_put_page(page, 1);
+
+		f2fs_ra_meta_pages_cond(sbi, *blkaddr_fast, ra_blocks);
+	}
+
+	return 0;
+}
+
 static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 				bool check_only)
 {
 	struct curseg_info *curseg;
 	struct page *page = NULL;
-	block_t blkaddr;
-	unsigned int loop_cnt = 0;
-	unsigned int ra_blocks = RECOVERY_MAX_RA_BLOCKS;
-	unsigned int free_blocks = MAIN_SEGS(sbi) * sbi->blocks_per_seg -
-						valid_user_blocks(sbi);
+	block_t blkaddr, blkaddr_fast;
+	bool is_detecting = true;
 	int err = 0;
 
 	/* get node pages in the current segment */
 	curseg = CURSEG_I(sbi, CURSEG_WARM_NODE);
 	blkaddr = NEXT_FREE_BLKADDR(sbi, curseg);
+	blkaddr_fast = blkaddr;
 
 	while (1) {
 		struct fsync_inode_entry *entry;
@@ -431,25 +464,30 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 		if (IS_INODE(page) && is_dent_dnode(page))
 			entry->last_dentry = blkaddr;
 next:
-		/* sanity check in order to detect looped node chain */
-		if (++loop_cnt >= free_blocks ||
-			blkaddr == next_blkaddr_of_node(page)) {
-			f2fs_notice(sbi, "%s: detect looped node chain, blkaddr:%u, next:%u",
-				    __func__, blkaddr,
-				    next_blkaddr_of_node(page));
-			f2fs_put_page(page, 1);
-			err = -EINVAL;
-			break;
-		}
-
-		ra_blocks = adjust_por_ra_blocks(sbi, ra_blocks, blkaddr,
-						next_blkaddr_of_node(page));
-
 		/* check next segment */
 		blkaddr = next_blkaddr_of_node(page);
 		f2fs_put_page(page, 1);
 
-		f2fs_ra_meta_pages_cond(sbi, blkaddr, ra_blocks);
+		/* Below we will detect looped node chain with Floyd's cycle
+		 * detection algorithm.
+		 */
+		if (!is_detecting)
+			continue;
+
+		err = find_node_blk_fast(sbi, &blkaddr_fast, &is_detecting);
+		if (err)
+			break;
+
+		if (!is_detecting)
+			continue;
+
+		if (blkaddr_fast == blkaddr) {
+			f2fs_notice(sbi, "%s: Detect looped node chain on "
+					"blkaddr:%u. Run fsck to fix it.",
+					__func__, blkaddr);
+			err = -EINVAL;
+			break;
+		}
 	}
 	return err;
 }
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
