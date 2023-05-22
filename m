Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 940C070BA3A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 May 2023 12:34:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q12s9-0006JT-4z;
	Mon, 22 May 2023 10:34:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1q12s7-0006JC-LQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 May 2023 10:34:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=frpOQv63qeRJ3VmmRW2MDCQNviiJL8KQMqaO5eUhu9E=; b=eKP5x9XndmFx1Je0W16ZRSKSvV
 rk+cWSF8/xfEXh+r/wOsPL1VM9NFXWv6TO7C0Jn1dKgURKLf7f0cc+PG05sWGvrGnbDXK/+FxE7qW
 M+xFcSy4I9xThpqHLtIVI7K8U1Bjd3euqOBlrUQQqPsA5hPjAgh4u0JR/OF7C2SEnMhk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=frpOQv63qeRJ3VmmRW2MDCQNviiJL8KQMqaO5eUhu9E=; b=M
 D03Dk31/el0H8UXUbIXzEv0wwXqsWLwyJpbPVXR7VnaJ4N+9CKJ2ECFE/PkUoW5q+CIsWgvgBdDTs
 pJQHM7adoXkEK7Uq3+8zISkl5EutTwJZvOBSvqDfhqrHitTza0wGda13Db9+UWWhuyElk43cW8+p0
 Im2dPYU4S1t0la6c=;
Received: from mail-sgaapc01on2109.outbound.protection.outlook.com
 ([40.107.215.109] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q12s1-0005FK-Tu for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 22 May 2023 10:34:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jdfH9RjBtXgHCM1X/zX/bLuJkM/6cAdLDcj2rEnIY1uCIZEth4mSwcC7sj2kb7e2YR3gPKE/4pFx0tGGRiRq8Eg5b4g+tF8xRzRCwizqH2r9oX6P0m5Pcyj1/Lf0IZ2yYgwTct1nK+30Ker+M9foFXt7AKTNH4gbmC4N54HcXRfzJ4M2iwP/ZllMFflD3wrABEYsLf1vK7Yjc/hKMTHZtfKXKfIw/I+GKmZ6hrACuXPDk1ol+LCVA6BJl5JNE7dFpd94AMoKmf4oe9d1jvt7ULaEOtYXd7KlYokgzQlIzYefMDSHXkqCIAURByFhBKsuUFOrBrtGzfsAYsLrNJmsbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=frpOQv63qeRJ3VmmRW2MDCQNviiJL8KQMqaO5eUhu9E=;
 b=cDOOr3MIdexLKO5Bt+HX24zn48/BSwJNB1HFiqC7/c6592aDy4sNuv7OLwUZbMYir7S2hz3aEZerMoOP9ATwr7lgoyJDZk3myHNG/2pzOo2hLXPGI0rbfbLxQ1bP9lNn+GFqCFXqFqWf2AoQpBWMvmmXppJXLLdmFD3PJ3HwftT+jSXJL5H6LHVE5QzOnEoYFO4YR5olJz2hQi4z0ryKZ3+EK8DloOzg7EifuXFqMypDI2eWwZGi5VrbPsHib//y2+fgEfWm22cHVIegMbX38r03qvZRh70NJ6EmKJH5OkgFaJXus0pEdDha5vy+zKCR5KZzQYsx+8ZPDYvZylLoOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=frpOQv63qeRJ3VmmRW2MDCQNviiJL8KQMqaO5eUhu9E=;
 b=SIKyz6AQgIWH8LWgdmHPutF2Cy5JbyjN8+zzp5kwOql4je6NO4fN1Z5e/mNh/o0nD9Cqh3MuSvVkWAFBv1AfZ7EUdkezBmu3qbfOo3jQY067KWV8eBhndejaoJ7L3th6lEl1Ee4/qOBZpyi5i3fb4EmXyV5AfXFMHG7VZ06U67VdIFNYm7POmFdvocy3xFhWaaPbHZlcdFWc/ci9HCREmhSilny5Nkncrf1Sfb5jHMmGEh67T5IEfliHAkCTFXurPr+gfjqxvSF2Uug4ZbQTYdg3a2k27jkDnJLLJyAbyWaX9dfWhwR1TRuHbWYIKzFxMMZtZLkqVE3eYvfdxEpCvQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com (2603:1096:404:fb::23)
 by TYZPR06MB6073.apcprd06.prod.outlook.com (2603:1096:400:333::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.27; Mon, 22 May
 2023 10:34:21 +0000
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::a567:9fc1:447f:c912]) by TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::a567:9fc1:447f:c912%5]) with mapi id 15.20.6411.027; Mon, 22 May 2023
 10:34:21 +0000
To: chao@kernel.org
Date: Mon, 22 May 2023 18:34:11 +0800
Message-Id: <20230522103411.20413-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SI1PR02CA0037.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::13) To TY2PR06MB3342.apcprd06.prod.outlook.com
 (2603:1096:404:fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR06MB3342:EE_|TYZPR06MB6073:EE_
X-MS-Office365-Filtering-Correlation-Id: a41ed261-d4b8-4c18-2098-08db5ab01a9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 86MEX3adW4o2ovhSgz0AqC5p4FU6D0+L8+j7sF2TgWYdnYTwQzbT9YyspWgf362j5vyMymblN7UeY9evCvbws+xrF9I3fVFZPq1wChlnow2C8KaKNIvBitfKuArSRFPbNO5aOHBZ5TnqZ/NG1/rkjmGfQCB+70ZCOoKC9HQeiHNFFhSrkaS+4HlRKs1XBVOY4DTCCgXrOB8TLx74dfTFiGI4V7o9komRI+YmTQ0wgEyqpi3monMwwJJr/a6NZy9BUK7sXP/+ltGg0PCs+5bJK6N2MH7W1u7dR3VEt+xrpBQv16PIDiTGVtITHqa2X+ArhxRvT7GtM4kSFsxCSk8wCP3qNOTGNrm2y1K+eX22j6478Wm2UmJ+zRPGgbnJb3m58p3fpJIz+IyNY/sdHFJjwBA5SwhL07x/9e+I6U34IzfbMv/kFSG7M7RoDJyQ4U4Jkx5h7Y44Qy4ctftp+AbJYiUNu9TvIvwq15iLyzUzPNE+aQwCm/wOPxwLVIds92Cx4lyhyYx0EZrTCVlMFjkXcEyKIETIs1pQUJnUxm+wrrQlen+2m2bO5qa6hpUl15IF6gTrz3xsrh/5m8tTJCVizgJyoUpBRvrTw3zYNmu2RXV49EM3+doMHI5NSYfTQ6C7
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3342.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(396003)(346002)(39850400004)(366004)(451199021)(2616005)(186003)(83380400001)(2906002)(41300700001)(4326008)(6916009)(66556008)(66946007)(316002)(6486002)(66476007)(6666004)(478600001)(26005)(5660300002)(6506007)(107886003)(1076003)(6512007)(52116002)(8676002)(8936002)(38100700002)(38350700002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JVwP5bdW2W5ZZ4/ZP4jm9hgpYsOAxb6OcZMOlkg8/FzgPX9UMNwPVsQOnVkE?=
 =?us-ascii?Q?LJ5HqQbv6FGOwHRaJpigCAk98/yE3+T/1LVxBWOrfKENJNXuDmJ0j837G9mE?=
 =?us-ascii?Q?QynsoXJi0ENFV+mDGj6q90B7RSCFIdeH/Mr61IGUqXdKc5/kT9QmlX1UPmNC?=
 =?us-ascii?Q?iwpF/Z0DQMK8m2ThNOZXgf0acFnPPc0uk0Ocyf8AIT6axlZKENeu0z3q2U1z?=
 =?us-ascii?Q?MPg/VFY1pyBg3vCHJAK8vv2zurNJiHgbzQHuLphuZBZ/sYs0EhyCCHKrroKd?=
 =?us-ascii?Q?tkpf+2ciC8WqKrHY9tbiyWonoicU3VXhzwHOCsUyQb156lFc9cFnXw58Oknz?=
 =?us-ascii?Q?mG2dxSVYFhER5/M+nm86yXCbWzfEWtZ2mB2nF+waeIKCB+l0rBy/8htfaDoM?=
 =?us-ascii?Q?QJE56gz8V7t9SJyNC5LA26+4aU95UhSvn5TZGJDE8ngx4doWdenFW6Y2xOxK?=
 =?us-ascii?Q?8tAQ5Rra90qvN95aZye5BZmgU9+d6jXJEfgzV2q0TeBJ+xLSAR/FQP1a0iyP?=
 =?us-ascii?Q?MzEoAVejZSSGQLXIzOOhzH4DsqSHHiKu7SAvG3vAKH3eLSqdXggYCxRo6jpm?=
 =?us-ascii?Q?uG6+/0D7MezHpWUj99Y92pg5LiV7QUGmoPKZ/9ubQOW0lkgKt7imcIM7dSXk?=
 =?us-ascii?Q?1w/UsO4mg2nQBH+jq5Lio7Nxo+ZI5WK0pT9VesVG6p/ruG5GpxuRxITx5l21?=
 =?us-ascii?Q?wBVjqLha8Q+4nSeuGzeYOs0wf+NKJZ0wjQfTRjAZq2e0fmnupOgrcbaO7I0E?=
 =?us-ascii?Q?Gx77vhGj84KQ8UgHg738ACao5fM/nhibcyJsibZeXE66ii6G/+SAXHGzlawb?=
 =?us-ascii?Q?V6m3YvCgi1PBOgnUpmykbtW2V0pCEN6+PN1ZiEah5Z609TW97f4c5IvXT6JU?=
 =?us-ascii?Q?Yl7D37yZh3rxTaeXAMsPSQXAtCZfD+K/3ktVJvv03drRhBhFSI45ACCBTWOB?=
 =?us-ascii?Q?pRSCzGAF2cb9VuoF1dpFilyKnviS+UD5OVd9uJy26zAePu6e9QNRDehiMsYN?=
 =?us-ascii?Q?+ccUjiqKgbNEmilmzZHsQ8LvoIPavscHmciSP6+3W9tG2eMsxWIF93nV7PYt?=
 =?us-ascii?Q?CuAJIJwiHaLCFF9Uwdelx1pkyErCLkNEcXgXkls6FSDD/DHhmDMgNvuLJqMC?=
 =?us-ascii?Q?l1hHY7UXp7BTx3B4PnxgD4YZ+vo8ub6BfsRQNkMQvcP3uGilrPE57+l0LGu6?=
 =?us-ascii?Q?YJU36ksjidBxN8+lFmhwY/I40OB+zrlL1pnWsccshfIfLBrtpa14/4TbG3GC?=
 =?us-ascii?Q?YaIwLeOR1aYMjpfMmqIqxy/Bji0PeniVzz2pclZBcJDCo/p2dJlNIQfHC2x/?=
 =?us-ascii?Q?euczbi98+Y5l/KgbBtxY6c4eLzEHfqV/fvarp6oOUN65eLiSADY8OUyTQqPc?=
 =?us-ascii?Q?0O/ps6t1/Ym/r1loku9D6KM8xXkKmMcH3638b8u+G+MV2rLbtkygfxHu8FDq?=
 =?us-ascii?Q?GYKerSCwTo6xI/+JFUfT8sfXjxMhRf+maAmSV2/CnnUqoz3NQrYlFPnUUzSX?=
 =?us-ascii?Q?kUjMafLTrfNKoIabgEnALyvxJHk+dxmSp1Kk4CbX5gpsHQy4Rllv5XFnbFIR?=
 =?us-ascii?Q?Gv2Q1eialJcI3n+99hqsp8A/aQzTaDdJYxw8rAmt?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a41ed261-d4b8-4c18-2098-08db5ab01a9c
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3342.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2023 10:34:21.1884 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AGnf6EjKzy9teHkrHK/K6p9qK25n/DmysTjkm/D6HBUFjMW7tedfwYLRcOv3xgQg58ODRIlXXZ/JOg8El/k4bA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB6073
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: find_fsync_inode() detect the looped node chain by comparing
 the loop counter with free blocks. While it may take tens of seconds to quit
 when the free blocks are large enough. We can use Floyd's cycl [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.109 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.109 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q12s1-0005FK-Tu
Subject: [f2fs-dev] [PATCH v6] fsck.f2fs: Detect and fix looped node chain
 efficiently
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

find_fsync_inode() detect the looped node chain by comparing the loop
counter with free blocks. While it may take tens of seconds to quit when
the free blocks are large enough. We can use Floyd's cycle detection
algorithm to make the detection more efficient, and fix the issue by
filling a NULL address in the last node of the chain.

Below is the log we encounter on a 256GB UFS storage and it takes about 25
seconds to detect looped node chain. After changing the algorithm, it takes
about 20ms to finish the same job.

    [   10.822904] fsck.f2fs: Info: version timestamp cur: 17, prev: 430
    [   10.822949] fsck.f2fs: [update_superblock: 762] Info: Done to update
superblock
    [   10.822953] fsck.f2fs: Info: superblock features = 1499 :  encrypt
verity extra_attr project_quota quota_ino casefold
    [   10.822956] fsck.f2fs: Info: superblock encrypt level = 0, salt =
00000000000000000000000000000000
    [   10.822960] fsck.f2fs: Info: total FS sectors = 59249811 (231444 MB)
    [   35.852827] fsck.f2fs:	detect looped node chain, blkaddr:1114802,
next:1114803
    [   35.852842] fsck.f2fs: [f2fs_do_mount:3846] record_fsync_data failed
    [   35.856106] fsck.f2fs: fsck.f2fs terminated by exit(255)

Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
---
v5 -> v6 : Simplify the code by removing unnecessary retry logic.
v4 -> v5 : Use IS_INODE() to make the code more clear.
v3 -> v4 : Set c.bug_on with ASSERT_MSG() when issue is detected and fix
	it only if c.fix_on is 1.
v2 -> v3 : Write inode with write_inode() to avoid chksum being broken.
v1 -> v2 : Fix looped node chain directly after it is detected.
---
 fsck/mount.c | 129 ++++++++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 111 insertions(+), 18 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index 4c7488840c7c..2b5937cdba7f 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -3518,22 +3518,90 @@ static void destroy_fsync_dnodes(struct list_head *head)
 		del_fsync_inode(entry);
 }
 
+static int find_node_blk_fast(struct f2fs_sb_info *sbi, block_t *blkaddr_fast,
+		struct f2fs_node *node_blk_fast, bool *is_detecting)
+{
+	int i, err;
+
+	for (i = 0; i < 2; i++) {
+		if (!f2fs_is_valid_blkaddr(sbi, *blkaddr_fast, META_POR)) {
+			*is_detecting = false;
+			return 0;
+		}
+
+		err = dev_read_block(node_blk_fast, *blkaddr_fast);
+		if (err)
+			return err;
+
+		if (!is_recoverable_dnode(sbi, node_blk_fast)) {
+			*is_detecting = false;
+			return 0;
+		}
+
+		*blkaddr_fast = next_blkaddr_of_node(node_blk_fast);
+	}
+
+	return 0;
+}
+
+static int loop_node_chain_fix(struct f2fs_sb_info *sbi,
+		block_t blkaddr_fast, struct f2fs_node *node_blk_fast,
+		block_t blkaddr, struct f2fs_node *node_blk)
+{
+	block_t blkaddr_entry, blkaddr_tmp;
+	int err;
+
+	/* find the entry point of the looped node chain */
+	while (blkaddr_fast != blkaddr) {
+		err = dev_read_block(node_blk_fast, blkaddr_fast);
+		if (err)
+			return err;
+		blkaddr_fast = next_blkaddr_of_node(node_blk_fast);
+
+		err = dev_read_block(node_blk, blkaddr);
+		if (err)
+			return err;
+		blkaddr = next_blkaddr_of_node(node_blk);
+	}
+	blkaddr_entry = blkaddr;
+
+	/* find the last node of the chain */
+	do {
+		blkaddr_tmp = blkaddr;
+		err = dev_read_block(node_blk, blkaddr);
+		if (err)
+			return err;
+		blkaddr = next_blkaddr_of_node(node_blk);
+	} while (blkaddr != blkaddr_entry);
+
+	/* fix the blkaddr of last node with NULL_ADDR. */
+	node_blk->footer.next_blkaddr = NULL_ADDR;
+	if (IS_INODE(node_blk))
+		err = write_inode(node_blk, blkaddr_tmp);
+	else
+		err = dev_write_block(node_blk, blkaddr_tmp);
+	if (!err)
+		FIX_MSG("Fix looped node chain on blkaddr %u\n",
+				blkaddr_tmp);
+	return err;
+}
+
 static int find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
 {
 	struct curseg_info *curseg;
-	struct f2fs_node *node_blk;
-	block_t blkaddr;
-	unsigned int loop_cnt = 0;
-	unsigned int free_blocks = MAIN_SEGS(sbi) * sbi->blocks_per_seg -
-						sbi->total_valid_block_count;
+	struct f2fs_node *node_blk, *node_blk_fast;
+	block_t blkaddr, blkaddr_fast;
+	bool is_detecting = true;
 	int err = 0;
 
+	node_blk = calloc(F2FS_BLKSIZE, 1);
+	node_blk_fast = calloc(F2FS_BLKSIZE, 1);
+	ASSERT(node_blk && node_blk_fast);
+
 	/* get node pages in the current segment */
 	curseg = CURSEG_I(sbi, CURSEG_WARM_NODE);
 	blkaddr = NEXT_FREE_BLKADDR(sbi, curseg);
-
-	node_blk = calloc(F2FS_BLKSIZE, 1);
-	ASSERT(node_blk);
+	blkaddr_fast = blkaddr;
 
 	while (1) {
 		struct fsync_inode_entry *entry;
@@ -3564,19 +3632,44 @@ static int find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
 		if (IS_INODE(node_blk) && is_dent_dnode(node_blk))
 			entry->last_dentry = blkaddr;
 next:
-		/* sanity check in order to detect looped node chain */
-		if (++loop_cnt >= free_blocks ||
-			blkaddr == next_blkaddr_of_node(node_blk)) {
-			MSG(0, "\tdetect looped node chain, blkaddr:%u, next:%u\n",
-				    blkaddr,
-				    next_blkaddr_of_node(node_blk));
-			err = -1;
-			break;
-		}
-
 		blkaddr = next_blkaddr_of_node(node_blk);
+
+		/* sanity check to detect looped node chain with Floyd's cycle
+		 * detection algorithm
+		 */
+		if (is_detecting) {
+			err = find_node_blk_fast(sbi, &blkaddr_fast,
+					node_blk_fast, &is_detecting);
+			if (err)
+				break;
+
+			if (blkaddr_fast != blkaddr)
+				continue;
+
+			ASSERT_MSG("\tdetect looped node chain, blkaddr:%u\n",
+					blkaddr);
+
+			if (!c.fix_on) {
+				err = -1;
+				break;
+			}
+
+			err = loop_node_chain_fix(sbi,
+					NEXT_FREE_BLKADDR(sbi, curseg),
+					node_blk_fast, blkaddr, node_blk);
+			if (err)
+				break;
+
+			/* Since we call get_fsync_inode() to ensure there are
+			 * no duplicate inodes in the inode_list even if there
+			 * are duplicate blkaddr, we can continue running from
+			 * here after fixing the looped node chain.
+			 */
+			is_detecting = false;
+		}
 	}
 
+	free(node_blk_fast);
 	free(node_blk);
 	return err;
 }
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
