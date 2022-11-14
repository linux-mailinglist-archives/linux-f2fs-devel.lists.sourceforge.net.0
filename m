Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1869B62822D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Nov 2022 15:17:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ouaHO-0005GC-Tm;
	Mon, 14 Nov 2022 14:17:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1ouaHM-0005Fq-BL
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Nov 2022 14:17:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KMtUk7It2klqsmuWyZzT0Aeu3Ovb7+PzNr2QGj0J8Iw=; b=bbOB68ddZ8BIlA3vCI0XjpteXB
 1ZQZphrYr0SZYI88tCKQco3h/Tp/NDZxtWmvHMzO78duY7wm+DpTbHxFd2zdV4h+JuA0idc+ymb8P
 3F+BzBwdDzvY/Uz06drW4t8qWVTbMlNPZvkmjzvT9KmEb3YJE5AxSSm8nUBunnZLeokQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KMtUk7It2klqsmuWyZzT0Aeu3Ovb7+PzNr2QGj0J8Iw=; b=mXgo/CaK7Qy1m5/kEddcnEI6Du
 JjlLHi6K+oQKM/1YzmPr+bZR0is5hHrqDaUdpcbAXxW1V8i9dVnN+JV1lyDvcRqbtd7GRplhdWZ0Y
 4c3dA2m0Zgz+G3Eh2Df4sepU0jXBK/VyMZjMezp8OFRyOf2+pJcU2+oESXbfqQ2f4bLg=;
Received: from mail-sgaapc01on2056.outbound.protection.outlook.com
 ([40.107.215.56] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ouaHF-007zdk-EY for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Nov 2022 14:17:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=crPWvk7Qb4AZlOzLUn/yRzNCE7F2msZf+Jk+TbbI7HcrYJHP7meu5IQ/PsXtyfNz66UNbIaoYLu6vlZNOmZYHA/zn0Z4EVZRUzBe1Pw+Ag7f9RjuB/T91JJKItU7utQfcnLEhFMK7tpB1N9kNJhjEQEdsgSR4BXTggN/vKqIjO30BDfh8M+73oARkV4Fkm5nTvcR9ofBntYNPZaCT1M8gOU4raT4vZIU9l/oyW5GR0vNewaEk0O5GL23rUXHW2jnhUdTtxVadVUSiZejHvT20wL3LcVV8Y1dGU9dZCESrtIbGjglHs4QZlbeVLiUSVxTitpaPvDOEYMPCuqDPHAlLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KMtUk7It2klqsmuWyZzT0Aeu3Ovb7+PzNr2QGj0J8Iw=;
 b=PBZG4eFjha74kD6uNrplGgSpfUWoiguPry24pJ4o+++eiJob++WzXjbzkGtV0eugj6lIyHtdHAexJwed2UloOTdHK02GG8w7dUY3LYmunCPNWZiSAHCfXoM0zsbAmAIWB2SuY0g/YfRrqvXjt0L/01BZsaDyRNRObWjLn6DKGDyezW33z+FNpSmrPNdirIUsLsEQYmjmOvMbCsofXRsTLr8lyaTE10tAaWYPgR5zwVcJJjDGAElnha0iG/4aZr3pByUWmi62NZXubKF1teNR4pvLTWDZCKjWB+6tXxPArCeBTuUn5XlDVaBIe5fva135qzY6m8jSlRQ552fUlTEkVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KMtUk7It2klqsmuWyZzT0Aeu3Ovb7+PzNr2QGj0J8Iw=;
 b=YLgl5AiRxEtzytGb31maKWEgAIeaUiYonqqhB+TFfXBe9/Fk4r7VKcrx24Wq4gMhrslJEVaah3yhq4gNFYVeUk0cspXDYWV3AFnJqyG7sVG1/Yp+0POqIAk8LPiONUrZROCecNGWaMNgnnYi//oUAHjBMn06XJAtY67k0my+/Bw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6) by
 SI2PR02MB5562.apcprd02.prod.outlook.com (2603:1096:4:1a6::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5813.16; Mon, 14 Nov 2022 14:17:24 +0000
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::2954:8e56:dcd1:452c]) by SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::2954:8e56:dcd1:452c%3]) with mapi id 15.20.5813.017; Mon, 14 Nov 2022
 14:17:24 +0000
To: chao@kernel.org
Date: Mon, 14 Nov 2022 22:17:00 +0800
Message-Id: <20221114141700.435589-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <12baae96-c00f-a127-3db5-49160cdc46e3@kernel.org>
References: <12baae96-c00f-a127-3db5-49160cdc46e3@kernel.org>
X-ClientProxiedBy: SG2PR02CA0067.apcprd02.prod.outlook.com
 (2603:1096:4:54::31) To SI2PR02MB5148.apcprd02.prod.outlook.com
 (2603:1096:4:153::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5148:EE_|SI2PR02MB5562:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e43efb6-3bb6-4cbd-bdd2-08dac64af372
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WprZ+ZVdjDo8spNAwviecfjDpc3vTnc98i68lkayF2MHxISNwJWbCZXvOoyqAajl9nioxZTJ1E1iaK82tY4WLVCDDj7oxhHcgFOELIYaY2W1vrt9/nelJie1anbF9C5SsorvJiaMuwiFHjDPMcV07tdP63kGjpJV6umWKlbdw8TWm9zjff8KL9ughdEWR3o8uzE7g2LSRF212EqV9MV2Fp4qR3MdR480h2TvuhiSAQTVZFgILq4hNPp13OHmHv+4MfZpqPGqX7RX5B9JbpShPlFJXf0C0KMzG6Bx1iK8+8SoRjkcNxorNElvLUF0L4J/rM+anERHfUGhJcvh0ZwSSy8tj4aY9DakDeChqYvmg2SrbXVeQqL0kI2l6PKDorJp7PrvUU3ZzAb8tkjE7MusE0rNyYvQrYiYfuyBbc8C6rYZx3YWo4v7BX2R7zn+R8aQSxEDOmbJtTsop4bDdg9qkx9FAUl7QYNTGELhWHwhSNa3z+eJ/Y9dGwe6G+BLtVoVOzK6VpivTtIXWrcXktMeRisw40tqGiMq2QJjzBwWLrxmjxlr+U9syq45poRCtUd/8/VGuT6t/yZoS0MZ+BRhEPiw8ih3N306OZ41K24OIWL0r/gSH059Uc/F3gKNGRIkBw4hp+Gjgw4guW1byvnZA8RicfJK5I00hKDSY4i5BdmT4b5fASeRAFt6WRtmlXUUI2OA/pZ6jIXMYcgQ4Cw+G5OAB+3UQvICu0BqxiZM1Wkds496YUMCRyRIYz9mycTn
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5148.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(39860400002)(366004)(136003)(396003)(451199015)(8676002)(8936002)(36756003)(478600001)(5660300002)(66476007)(4326008)(66946007)(41300700001)(86362001)(52116002)(1076003)(6666004)(6506007)(107886003)(83380400001)(66556008)(6512007)(2616005)(186003)(316002)(6486002)(38100700002)(26005)(6916009)(38350700002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xKDm89EpEH+JAsL3I4dAkgpMedxPxVu2V/GwerXtJ49d89VzELAyPIQViZ+k?=
 =?us-ascii?Q?JdvrG3OCE5CF1q+EyoEPPOuVocnZIr/KBGOx5ZjQjwTLv260XEdEjo4R8To3?=
 =?us-ascii?Q?C6w6ugs5Ys83h4My5U1RWCRABKvob1SDDPPuu82DQYBDcnJmbObvOnp0EHzK?=
 =?us-ascii?Q?U8UggGoX+lu+0ckimWeJLq76iadP94rggTSuAPjYsejDpYTshVVOWnpGDcGn?=
 =?us-ascii?Q?g2DClI9CCi0BiLUsXoYZolpl6mpz2J/Gzpbe533SBZTCGWyV8KNwgKZ+DGxE?=
 =?us-ascii?Q?u4tNGRvA1qXh3x4YlgLFC4BEHDN5lB4mt/t0Rs3KAWkIjy72NHtkTYlUj1gQ?=
 =?us-ascii?Q?Nd3piUwDFQ2CgTugjBG57OuC7RbEHRYrA09vHNKISpJzKa1cVphGfsGwzOQy?=
 =?us-ascii?Q?eTZC6fb/6bmTEwbgBbwO4Tfg8kR06keLJT9dGx0LWHi+abHZ3dU887c7dVI5?=
 =?us-ascii?Q?KKtfiBptpg8Vs5CkrOf6vcH1gfwuUOhxU/WmO/A9WjEOSibfMtK7QlWsiyOu?=
 =?us-ascii?Q?lbM5f0AMkxAgtjxZw7QyMzQbjuIFWjWWIFYusekyVZnjiM4B/IJwjgsoiOVQ?=
 =?us-ascii?Q?9mzG+HQECQIosL/JbnTPk3FA4e6LUcRa5HBqpIqBB6T+jjEfyMN8TanIto++?=
 =?us-ascii?Q?CWlZrDSJmD1++sJwewYauo6VwfpNTUMyLqtFwykXAfd+6AOSHvST3JnVf3o2?=
 =?us-ascii?Q?ZASgWRhA+HLf/eD8e/mEKz8mwG9m0TVI0cPSDiobrJNqUay/vkgXpw1k3X3r?=
 =?us-ascii?Q?9+78fbTMXIqsmIboFejxy1mmzjXFq9DoPne89TEVNiwRkIfKMcdNqvUkO2I7?=
 =?us-ascii?Q?xChaYoWMsrrA32Ocr4gCG+Yop63oTGeWUF05A/yiukMQlk97uLQKVAfFXBfr?=
 =?us-ascii?Q?v9xu72chiM+/f0US4a0ww7Q+uijHlYi/aKXAiWVgWLWjNT3we7nCdpFbAjrT?=
 =?us-ascii?Q?sUvBybvUMB+/FUNTQMarCDmwTboNPCdv/OJs3h89qqwA83yYY+JtHB3aJW6/?=
 =?us-ascii?Q?C0/2xx0fMx8ykV2i9CgfAhX7zqQ/AiuCsvCHXISbMTPqG4wZgB8F2r+PLEOs?=
 =?us-ascii?Q?UrgOLzyzU5sQfhTTYnV6lvw9J1TdEPTJ3W28MAttHjDltc2VM3f9ddxRE8Ke?=
 =?us-ascii?Q?wYzcBt7ucqOzVtZpbhRujg4ayFeyWwpdD3plR9/x2Ow3oF23LqGfSPC+0vP1?=
 =?us-ascii?Q?prAcV4w4uPkiZm4cRuC7PfRbFBmnLlQlZNroUwuSmAkKdlwbV/pj+Qqy54C2?=
 =?us-ascii?Q?bfCnCPAyYV4Y7kSE7J4FPbetvUBsIseCfNxIj2a2JKcQB5Edalf2r9cMUKdc?=
 =?us-ascii?Q?1/qq0o/SBtlXaVkFW4in/IB5stybJrzJR37D2CW6jXdxwqs2oytw69PY8Woe?=
 =?us-ascii?Q?LmSazOX9zyw8LjyoyTM8xjY6enZ7cv0+3PuFt86OKqxV5fj8oS7yuSMaaHEz?=
 =?us-ascii?Q?uVapgYigS5M4sGajCfUBTxSN0S/C6jJvmI7CgY1fsZCfZZRZQaiSy3IkfZA+?=
 =?us-ascii?Q?PDFrF8ReSDKQ2CVREPbq9PvWuVJGWnSbEf3YMBRtbwpqOtlknl0E009MCNXU?=
 =?us-ascii?Q?UliKRgblaXNv0v/4swew1GU/z6wNOj6Z4OJf57n2?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e43efb6-3bb6-4cbd-bdd2-08dac64af372
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5148.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2022 14:17:24.2171 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XIFhCET//pX3PmUW05t6MJGPZibcleNiCCvOEdFfExwZuPhUCWMr2UoYwP42Sq0SaMmUE2qTM4hRbfibHJas+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR02MB5562
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: There is no need to recalculate ADDRS_PER_INODE and
 ADDRS_PER_BLOCK, 
 especially in a for loop. Signed-off-by: Sheng Yong <shengyong@oppo.com>
 --- fsck/fsck.c | 19 +++++++++ 1 file changed, 9 insertions(+), 10 deletions(-)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.56 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.56 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1ouaHF-007zdk-EY
Subject: [f2fs-dev] [PATCH v2] fsck.f2fs: avoid uncessary recalculation
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
From: Sheng Yong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sheng Yong <shengyong@oppo.com>
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There is no need to recalculate ADDRS_PER_INODE and ADDRS_PER_BLOCK,
especially in a for loop.

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/fsck.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index ebc60ad..df91c82 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -706,7 +706,7 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 	int ofs;
 	char *en;
 	u32 namelen;
-	unsigned int idx = 0;
+	unsigned int addrs, idx = 0;
 	unsigned short i_gc_failures;
 	int need_fix = 0;
 	int ret;
@@ -932,17 +932,16 @@ check_next:
 	}
 
 	/* check data blocks in inode */
+	addrs = ADDRS_PER_INODE(&node_blk->i);
 	if (cur_qtype != -1) {
+		u64 addrs_per_blk = (u64)ADDRS_PER_BLOCK(&node_blk->i);
 		qf_szchk_type[cur_qtype] = QF_SZCHK_REGFILE;
-		qf_maxsize[cur_qtype] = (ADDRS_PER_INODE(&node_blk->i) +
-				2 * ADDRS_PER_BLOCK(&node_blk->i) +
-				2 * ADDRS_PER_BLOCK(&node_blk->i) *
-				NIDS_PER_BLOCK +
-				(u64) ADDRS_PER_BLOCK(&node_blk->i) *
-				NIDS_PER_BLOCK * NIDS_PER_BLOCK) * F2FS_BLKSIZE;
-	}
-	for (idx = 0; idx < ADDRS_PER_INODE(&node_blk->i);
-						idx++, child.pgofs++) {
+		qf_maxsize[cur_qtype] = (u64)(addrs + 2 * addrs_per_blk +
+				2 * addrs_per_blk * NIDS_PER_BLOCK +
+				addrs_per_blk * NIDS_PER_BLOCK *
+				NIDS_PER_BLOCK) * F2FS_BLKSIZE;
+	}
+	for (idx = 0; idx < addrs; idx++, child.pgofs++) {
 		block_t blkaddr = le32_to_cpu(node_blk->i.i_addr[ofs + idx]);
 
 		/* check extent info */
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
