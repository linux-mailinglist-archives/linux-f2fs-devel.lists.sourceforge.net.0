Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31EE160F4E6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Oct 2022 12:25:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oo05E-0001TN-0D;
	Thu, 27 Oct 2022 10:25:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1oo04e-0001P0-60
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Oct 2022 10:25:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kdKeIXNmrKcwNnQfF5gbRzjTfd/rQahJMwoyEt0vack=; b=N4pcE2es6mM4MFX4JrmlcS93Tv
 KEz8W0VIhfCCVkSDbhEI046HCKkN0ORpF43f3f/O5O7q6W9AXWCJ/mVESgCBA1FmAV8Rp2sao4E3X
 QTHXDQ2T4SIZxNx1QBwltRLZhxTUINjHmAEqPKaI4eqGof2Iacbq4OaYfnGiN4IcSf20=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kdKeIXNmrKcwNnQfF5gbRzjTfd/rQahJMwoyEt0vack=; b=T
 NvsPyYChhHqyrNBmQuVFaeq1vixVzaPjtmlbe1gGnGz5MtGdButjr+BNWUh/cz7kMcOa4nn4CDrEN
 UeQ8YtgkcZOL+3Ut2zu84NbDGAggbAv9MTKJsshTTwajNirSInqS1N1YdYQu0llPaKV5QqwPHDxxt
 ljuLs2Eb87TJWGF4=;
Received: from mail-tyzapc01on2096.outbound.protection.outlook.com
 ([40.107.117.96] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oo04Z-0001ji-R1 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Oct 2022 10:25:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Idavwb98DqAHJkxLV+P5o/deKUAFALq4eZB4HnnoqckfrHbtsRBzxpmjgGwTpOshFYksFUnUkifGlE65csJ+52aVdXcOuKc9hVbDMB65uk3p0xa//b4Wb9u5N/fNqephqTRsS/fsLDe7zTmd6AXsANhiFKMxWsZ+r4HgEQ6bvO288krNSJ1l2jsyuNttcJmrMkjGSIit9CLtsp/edGWVAKqcfdw51XDz0s7NRprvmh6wB6JMvXTEfpk70A53vsSu8FnCiQqlR/uK7ye/gO0FotwChz5NvhXLqg6dEYuvAYHcUqbSfwEhrxVi/IyUX4SRLJr60L4yiha1j/ilfXFiDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kdKeIXNmrKcwNnQfF5gbRzjTfd/rQahJMwoyEt0vack=;
 b=EneD5tlkW0C80CfLtQ9BPB1EzqR/EdJl45SyGqAhQzw70iD8UHy0eOEGAW6Rdb/aY6zs9imcBWMXL4WMQN9m5Ph5JIvPIgmw/77oDiThJJWv9wkZBGBDEgA222mtMoNk+niwoTfSUuDqYiFKhnwq9LSBrfbMRT5RouNKVJoAEr9U47KaBg75bab7cKaP9fWpwySPLla29T0xGqPuYbDwl+BmKXJyfE97VLvbSzQ5oSSiqw+rkGz8IVmHg2QmnTX38dhhrrsIG1k+M4ekLSRqkRM58MDucbCMj4bu96v0UnVxESnfiaBgrEQVimOFD34nwx17ko6qilR8/9il+/GD+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kdKeIXNmrKcwNnQfF5gbRzjTfd/rQahJMwoyEt0vack=;
 b=XytWW3OF2lXk3xiFfVGEK1+M92RJfm5Z/NMJYPVTX7UnoMO5KlyqtTzQm1wdFv6L1AdUGVJadmLhv6O0frHD1rLQogs1TSzhjknTAkb2uIMwGRdD4bM+2nDHmUWxwIkWLQN7bTqJiaM5nNbb5ut0aHtjCIE2vbGSZWcpyMuxWUJoRn7noF/el8L8P6RbdoOE2d+7F//6e+UimkooSDZvLwDTiCzB3ZdmqGaTdYTfbasVB170J+kx52jbBikAfP+LLacDlCj+gl3KseVNVG9ifW5Lz5wnZlyUI5lM59fubI2X1V6ph5dH5nkE6b8tGBy2kXmSLtBvZWIwgWPvhs9jXA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5123.apcprd06.prod.outlook.com (2603:1096:400:1c1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Thu, 27 Oct
 2022 10:25:04 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd%3]) with mapi id 15.20.5746.023; Thu, 27 Oct 2022
 10:25:04 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 27 Oct 2022 18:24:46 +0800
Message-Id: <20221027102447.75708-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR01CA0192.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::21) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB5123:EE_
X-MS-Office365-Filtering-Correlation-Id: 562a7ef8-a81b-4f92-6f5d-08dab80582d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IeXmZDxYvTlH5TNYOFOVP8jAnkAejiILXVmhiBbn8A46f2zP/h3ttuhAjeO8AR6pARJo1DScfFJLFMnf+PgT8i5ow+gf1U7TbewGCCNpBqJGxL3xoANZfaOsMYAn93LNHGQygXnyYjNdLiD5hy8AbM8LHpP5OkyqRDitcxtMShy7IzTHr+eG8nUMDy3lozS/eR3ldJAA/CYXBzMQeqaYGrxOW9WQ0T1yYDAuLkpFjeXzgMLY/2+O3cjqYcwZeP0B/hIFPo+3ZjM1zQLxFdF81HILf3+PQb7t1I+JZLeAK6U5MAjPTYeoQ9JcwnAa/W9uoSlw0raUzJNFgsqLN0IAUQu/EC1hIDsgDGuBvFAAEmQZ1tXjaHiH5snAM6xs2qP9UGxN4j8NXBRUVWMFKl4BcmPJcRbWDDrbnT4BM2MRnzTg2BStz6Pm/KKdxmOalefJcjWjEwkPdUiZoa6TrZWsI6JTCwwcqgmfQ40qdUwnVJGNKfpZgTctxB68uC1CJVU/TE7JTZHmDkohjj3JLMCK2CCOs7x3STNgZ2o/nClc1ZSDM21Ru22NWHon59QyBmjmedJh2lrO/wi86CKh2JUWeczJl/88j+l2ME3NGve6AoGjAgRbUxiDwqc0UuS4J79rU8tpXdocK2PMEBTJ/l5QSgVbBan2I4yxWg3VBMF3VbrTbSsm09SMrIBGb5FrZpalLZCVc17ERLmIzFpce3aIcR/9Xk4aPNdV2MNsKB7XY32D+RWZmkr3DMRaeFUlxEeIjoRWR0WOIoa4eC4kewpT1A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(396003)(346002)(136003)(366004)(451199015)(478600001)(6486002)(8936002)(5660300002)(83380400001)(38100700002)(66476007)(41300700001)(66556008)(4326008)(36756003)(316002)(66946007)(8676002)(2906002)(2616005)(6512007)(1076003)(186003)(107886003)(38350700002)(86362001)(6666004)(26005)(6506007)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FqHN4OdCFhrO9kYF7wPOMLHPa3eyZCPbGe8MgxGWmzTCVweYxJ++lqSynY2Z?=
 =?us-ascii?Q?P7Smd2cfSdfuu0f0Qe07lgArSZGr+lHO+GlEQ2Ef2H3KH0bMG6/jnc73JDyi?=
 =?us-ascii?Q?VPG01JH9VyXoabmKLcUNXy2zJNc/dSTU5aOSRRedERGEe+nE3QhYud2Q6ymr?=
 =?us-ascii?Q?8J8EZPZ82ppeE9nSTpTs4j5pJdGYDRkPhA3tSKgo0hwHwP98MkB2z3YG6dDQ?=
 =?us-ascii?Q?u2nl6XssWZD6mhFzINWwbqZsxCmwMa1qApjzpBjlGEWzukRomWd/YTz9Wp2n?=
 =?us-ascii?Q?+VHqs5A7FalvfA/RL7zQv6H2DCcw/RQ+HBE1xrvbORa3EtL5EE6XIvvbibyC?=
 =?us-ascii?Q?dmJOV4FHUgWuJNfdKt/UPAFxiIvltaaFvcdXMZETkOog/Vjr59w0sN7TTb6/?=
 =?us-ascii?Q?rKGhicEQ8C8/rFHv/S0IPGOR+1qzIEZAYWGtgFIf/DgiFti5hMG3s8Zq8dWH?=
 =?us-ascii?Q?jq//h4l+/aOvZolq1PlIbVFT5/HKmwNp3GC02cUjaN7Q55BT2RFl8oN7+wwP?=
 =?us-ascii?Q?OHHfa52YUieo1uGATTDjMPCjJ7Fkx3T9lLP+DG60MzFYOqUeHDp1ZTC9h4LU?=
 =?us-ascii?Q?Lc39s2NvwiaOKaW7k94PLrN2SFgw7XpRwrMvVmDFZJHxCkk7EbuKbY3KWnET?=
 =?us-ascii?Q?zy1VOf5C7e33vEoJPDnxs00vh5JUHf3ha38lYsW2OhEemADnzGZe4xoAyHxl?=
 =?us-ascii?Q?W+H30QjqNrLzM1O7gArHAdP7ftlF5ZWqyxho0qNHwSSOGUmEOGy8DDAGjNMW?=
 =?us-ascii?Q?Jo4HFPyb7S5XLn+szPfX+4GXHo9SVZU0NcGTwc0pglmlXGjgXiyV0AylIb5c?=
 =?us-ascii?Q?Su9iRTR6thDqbiW8doKgDn7Up6eobgm+igXp5dHtjv+CQN1ZXOqdlbRPWv6Q?=
 =?us-ascii?Q?DBvUwT2bvOqb4X0gZdeaxk7f/NojusZVyZtKDIbqApp/KREYcko5E4LaWpY2?=
 =?us-ascii?Q?9Vc8sQlAzYbGozQGVSXT6Gcf5kDvHzCd/VkzDHu9zVWvq2fyZEfKL82HYGOr?=
 =?us-ascii?Q?8vvAEqGB5wYht2KJ/tp+DJnabGjTMYhkl7L3rR+UJMuyZukMUe8QE4YvOmer?=
 =?us-ascii?Q?29RgDrc8tQKuAcqSEgQ8cgzYObqRJW703cQ7YLNEc8zhdXITAAEC4l73Yvqw?=
 =?us-ascii?Q?DwLauseDIieME1WzcLw1UoX9lcjBu991Pq49bpDt/4St8WcQPF4mCNKJKMY7?=
 =?us-ascii?Q?KLaV0gCjrOaNjME2Nrz/ITcjziEDmqTbCECaxOj0emvU7JsmWBfAhVdGovw4?=
 =?us-ascii?Q?XPGT1jpGFry9TFtuXCHVpjGa4MwUxb57C6dq0ZJR9UKJBQMDJtMyWu7ju88g?=
 =?us-ascii?Q?srPHlRWB8m3e+N580kIk0AiFeknmfB/x+53+V48M+V3NGpUZ91JAxJORrTfd?=
 =?us-ascii?Q?aGGieBTqOV6hfzrQ6VyA5gyyNZoX2JHodXfIEU4+v7f3UoiJVmaAaZ2p7Pnz?=
 =?us-ascii?Q?jJ9V7qXDcFTVBhR75iQ49gavGoA20rNa6SWrO/+BuhyVvIJqEqaVFT2y7Fl6?=
 =?us-ascii?Q?4JpU7bmjFd5gqAcNo00UUPjiJ+OVy9IDFK3ELTSCI8ctNBLfpzi1PYTmHHRr?=
 =?us-ascii?Q?DvUcg45ukfv5k0aPOAzVhSiafEDXC5mZIHrvyCsl?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 562a7ef8-a81b-4f92-6f5d-08dab80582d2
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 10:25:03.7710 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HcczFp8YSZQ4Y+RxPA4Z73i+bJHvtr5nfIuAFRBn2bI8D4qclUPYSQVj28G6B612wil5lyxwK/XqKL1nu8gBFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5123
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Just cleanup for readable,
 no functional changes. Signed-off-by:
 Yangtao Li <frank.li@vivo.com> --- fs/f2fs/gc.c | 14 ++++++--------
 fs/f2fs/segment.c
 | 3 +-- 2 files changed, 7 insertions(+), 10 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.96 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.96 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1oo04Z-0001ji-R1
Subject: [f2fs-dev] [PATCH 1/2] f2fs: cleanup in
 f2fs_create_flush_cmd_control() and f2fs_start_gc_thread()
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

Just cleanup for readable, no functional changes.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/gc.c      | 14 ++++++--------
 fs/f2fs/segment.c |  3 +--
 2 files changed, 7 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 674a905063db..85d16f4106de 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -171,13 +171,10 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_gc_kthread *gc_th;
 	dev_t dev = sbi->sb->s_bdev->bd_dev;
-	int err = 0;
 
 	gc_th = f2fs_kmalloc(sbi, sizeof(struct f2fs_gc_kthread), GFP_KERNEL);
-	if (!gc_th) {
-		err = -ENOMEM;
-		goto out;
-	}
+	if (!gc_th)
+		return -ENOMEM;
 
 	gc_th->urgent_sleep_time = DEF_GC_THREAD_URGENT_SLEEP_TIME;
 	gc_th->min_sleep_time = DEF_GC_THREAD_MIN_SLEEP_TIME;
@@ -192,12 +189,13 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 	sbi->gc_thread->f2fs_gc_task = kthread_run(gc_thread_func, sbi,
 			"f2fs_gc-%u:%u", MAJOR(dev), MINOR(dev));
 	if (IS_ERR(gc_th->f2fs_gc_task)) {
-		err = PTR_ERR(gc_th->f2fs_gc_task);
+		int err = PTR_ERR(gc_th->f2fs_gc_task);
 		kfree(gc_th);
 		sbi->gc_thread = NULL;
+		return err;
 	}
-out:
-	return err;
+
+	return 0;
 }
 
 void f2fs_stop_gc_thread(struct f2fs_sb_info *sbi)
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 282616e6852a..becceee8e337 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -638,7 +638,6 @@ int f2fs_create_flush_cmd_control(struct f2fs_sb_info *sbi)
 {
 	dev_t dev = sbi->sb->s_bdev->bd_dev;
 	struct flush_cmd_control *fcc;
-	int err;
 
 	if (SM_I(sbi)->fcc_info) {
 		fcc = SM_I(sbi)->fcc_info;
@@ -662,7 +661,7 @@ int f2fs_create_flush_cmd_control(struct f2fs_sb_info *sbi)
 	fcc->f2fs_issue_flush = kthread_run(issue_flush_thread, sbi,
 				"f2fs_flush-%u:%u", MAJOR(dev), MINOR(dev));
 	if (IS_ERR(fcc->f2fs_issue_flush)) {
-		err = PTR_ERR(fcc->f2fs_issue_flush);
+		int err = PTR_ERR(fcc->f2fs_issue_flush);
 		kfree(fcc);
 		SM_I(sbi)->fcc_info = NULL;
 		return err;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
