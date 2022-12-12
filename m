Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B924764A140
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Dec 2022 14:37:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4izl-0006Wa-8J;
	Mon, 12 Dec 2022 13:37:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p4izV-0006WQ-Jd
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 13:37:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tdygyRDNpWtdt829Z9vESAE+w0POCjkjBloy7V8cJc0=; b=ctWfxNkfZ2G7zzG7pqTuXrB7pd
 L3KY5OTjrARRhFADZgMH4fZFXgQTLbLzJDfi5WyHRkI9t/OZ8DGRlATynhpYPTX2TszDeMildKWXl
 CusN+nsqwEUhBnrlgwpetC7arRO/6Ozw3dCoTF5/5zMCTki0Nf7WAIIZKLTK0jjFLnvU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tdygyRDNpWtdt829Z9vESAE+w0POCjkjBloy7V8cJc0=; b=B
 DDIkwa56EwH37zrKqjIU8X/nQ3yD/hdz114AKf38vAC/a1D6YQkGe2cmRwqztxMyt7FD+MNf2gRua
 4b6AQ+UjFFEpPD8u9I7xJCjOdbTJCzyUtqZJ2B625TuTpJZvw9VoI2MQTsuOeTna/KK/zFSLezoWB
 90rcBUGt6jyRBhQY=;
Received: from mail-sgaapc01on2138.outbound.protection.outlook.com
 ([40.107.215.138] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p4izU-00EmeU-F1 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 13:37:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JlXb+ddUcFwI6xPTmMPo5bgY3Jbh4oKCaqe7vBolyQQKxtNu9R66jYt+toO9rk4Uk9z/e3+JA1Kr7dZM2HqvqyHWEUByoUnAMG1VDs13i3TBNfKp/6/r4HrbvxyWze0nwKNeOv+ppRF+tGoMDIQRi0CmMylnIU+xPYiNg4ytz19URBwC42BIDdr59HlpCeFLckJD08fmSwE5WvhFrJWsQU9m52qeJX80sWC+9XOGTmgCHpqO+/+ZNzEFGaUMzpV2eW1krvhGtpDLRbtiyRJqCqCtLbmY0Vfcr27wlcYnX3b6ZW2UpFMckL2G6BKhZgLh4ZP8OPomL8SZ+8zhW47NDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tdygyRDNpWtdt829Z9vESAE+w0POCjkjBloy7V8cJc0=;
 b=a7j5WqZdbCMgGgBF+UL3J+a4pv02B5eiWU3yPFsKMiPYCec4XjLngv+3beNHfR6rC71oEw5tsdkqGfDv/KQXUEuVAAcUWWjOXtz9GejV/zsbpQi9Uj99DbPmR9m6F7Yn9bOO/b4ZG3/ygfre2OkgjpuloyaTAHwRabSt9vQHLK3PXVEwOxUoqpeheZBYzAFRVoNzWdas3znpMq0zj+bYAVis1eLPFhDamuLOOcauQ1EJ+AE3akd2xuy+KO2yce59h+e14PPPlkSOWWdB8N0kC/ItvLlV2E3p30iimaqd+bw9NpFn1Hs/XYt6E9TrRC2naf6K/Qa6fP9FxCDg9+crxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tdygyRDNpWtdt829Z9vESAE+w0POCjkjBloy7V8cJc0=;
 b=qKME3PYwKUw2jCNaBnXXT2X+mNS5eK1Wc5It2WIbk0vr5Kip9JzboNpMe2XtoR31IEPmb5U76ZhMhARl2ajFo0JFzn3Uh5jePSxfLRRetI/A0b8Par5j7mzDlUNQWAPZJ0NjqVKys3QsVjJ+P2v+lk5QfqS0C+f9bm4Y/UPdecDaM9+A/U8Vd6p/K2t5REPgUo4YmeuA/E1A+vqpimVZrVt4Z1xLLXDuQKAJQfs2nno7I/sLfyqOI3O6OS9qd04aRTB5o5Onkp1wvrflRUjEzSipzQ68+HCQdM3iKwDrfRCCZ6U6UDkNSzgl7YPsXpC2qenSJrLLZhHel1AGH04SRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB6086.apcprd06.prod.outlook.com (2603:1096:101:ee::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 13:36:56 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 13:36:56 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 12 Dec 2022 21:36:44 +0800
Message-Id: <20221212133644.1503-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI1PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::14) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEZPR06MB6086:EE_
X-MS-Office365-Filtering-Correlation-Id: ee8260c0-d56a-4eba-1ace-08dadc45eff6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s9yx+QED7bm6gNpzKdc2BgRkLe1+GHeNDBhQCE6XmrNIv+mQwIEgXfID4FniM3+KED4Xt3enjkGtX5PHQTMCPwdo4s2PHeeXmHz2befX8oJlFxbMhiM4NyK+8sp1QkTc4XmBWsNNBOVDpalmlZUv1kPecSducPsvS3xeSDNDKoWSg4siZvURmNT3u0jBMdPdo9/aO9+owhwfNEooTYc77Uy3BpAoSNDFr0F+MGQh/79VNPBpYY1k6i0PyDLI4d+kNNDbjb2ElzXe77mt+YlCdaoEvzVfkGHKkN0XbloDKZjWG+xJ1f1xGSNCdqP+3xHvEP37S/fjhvf0DyVJI86Xr/E+qoqZ/lQboGPhWKuVXmDI+dfSqC0N3T0MaJCkwK5Sc4CyArQ+9qU6PcepifMiLADuzcku/F1Sxklh1scYqgdO0Y2TS6YEbMAqzdV1ye4tH77Lw49keNK5ROzjK3BO1z6GpmmkyQuJ2K9OaNCJBe1BubvEtfAlYvYLgQkDFQJUZTgFEay/4Rff66RT4dSZttR4bCcKD/dxbWd0YkugXlSzs74lmhqVBijVBGLpQjw6FDJh+rGzmxJNEOXY9Jcd+FJmR3oSCHKA8yc7srt3E0amZ7eb6zitjUUpZ1g64TR2GkSP+C3uc3EU2Y/BmkGRJjvHH6c5YfIFH49Q6AaUAVwRHG9OLRVWXbVClhQWraue
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(396003)(366004)(39860400002)(136003)(346002)(451199015)(2616005)(478600001)(1076003)(6512007)(186003)(26005)(107886003)(52116002)(6666004)(6486002)(38100700002)(38350700002)(6506007)(5660300002)(66476007)(66556008)(66946007)(4326008)(316002)(2906002)(41300700001)(8676002)(83380400001)(8936002)(86362001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KVRKCi6qVEZTLdV4/8oGtc5xw1eM+caDEU8KOXfZ7qdrJzaDHfM8s3EDgc/I?=
 =?us-ascii?Q?nlTzxDC5i7ZBCd/XTYoMxASvDCcz6LRVMLX2Ag4UGVA/KeIjikVd5CcYJLVi?=
 =?us-ascii?Q?IK+R8FigjBIuDA4ThRqrKbvU4NFQ2ppX8TGc1D0xZwDJQV4W+47gziZy4bVs?=
 =?us-ascii?Q?s+YmVGfw2k1o8ahabudHEvXTn2vGH8mgrKTfcHjJEBHw8f/52ucV7JS6tBJT?=
 =?us-ascii?Q?/KzK1z++Xu+Bzkib+fDWA4CvXbZawe7p2kdnrr49TMQPv35MTVEn70x/4FM5?=
 =?us-ascii?Q?wSvvqDBEgAXxsYPIFqozphoglq3LxLaD3xppr0RY4x8O6IuXTeYxxuqz+z0I?=
 =?us-ascii?Q?looVMK7mXbXxX8Awg2OK/NMJ3qhLbz6pKiZ914t4A8MEn156r6ThfkHkGRgA?=
 =?us-ascii?Q?UI5BmEEZE0WpWN5wPl7PJanwvW03etY/pC0VUl2OWIS+XB4Xt/fl0SlodC9t?=
 =?us-ascii?Q?DB1DMtxC0dvC2YQ8F5uon2XM+jyMNX/jszSp4qrH1CQMkeEC1O63H/Mpgk2F?=
 =?us-ascii?Q?bnC5CiLziltbBC5022gf9I0eIKeQitt2EvR1GKr5kC8h1QTARbkcZAFBHh9f?=
 =?us-ascii?Q?6ToKhGTXitBNgmO7PjkvONsYFErjZR0Y624XuxUIMMnnmI++2Ay86VfiK52G?=
 =?us-ascii?Q?1NGbSsbTy0m/WHFeYMLrdZ5c5sqD28/00WNq9CGvLGYVYBw64Ti+vez6FFMC?=
 =?us-ascii?Q?Dy+FmI4t9IxEizQQRPPfCGeuKAGJZBBJwdaM5wG55spIUDk1mExVzJQopzwH?=
 =?us-ascii?Q?F/AYN2bTvHurXmELlxF+9RBj78hCKD9sD4iAAbdyUkQPIT5FQGgw4wo1xDSQ?=
 =?us-ascii?Q?5lyp0mhqM/+rMSXTpjPSNmqow/79voedqWRssXXi7O7Br0DHzI0AyzJ+A5+j?=
 =?us-ascii?Q?awb2EnrSgj/ESCtH+SOpyEjPVU5Bf72ZYsdNgNmc/TFPIXAcXwpKQU5kToAR?=
 =?us-ascii?Q?F3ZL2gfJW+ZcfVEDPOQcQKEjywFzP7Y+rB60W6FAyF+aG8SLZ3Uizf0Fx0WM?=
 =?us-ascii?Q?MH1yvOSc8Byr32dao6itKbFBy/H3v6sUbSIjwv1HffM0cEyB3vcd4XtvYkTO?=
 =?us-ascii?Q?E0gkz5lJfQDF+v4fhq2SzvyfCLp/bHiMJ3+kAqLBVrDA8EaVU62Jko14K/z2?=
 =?us-ascii?Q?6GxBPuh4QQ0Kr2pVm92MefSQiGOp5/iquepoZV+lzqTBkE7rIV1slXcLLTiT?=
 =?us-ascii?Q?RELFMP/DZzPuRv4sHmU+bsYMw/b+SGHQZ0xgBhwJABrrtigEF3fZrBvy3iFu?=
 =?us-ascii?Q?OTMZFgFwBARBCv10CjqVjB+Z0q0lLc8AoExPbavGOi7CthiYqJBypLmBbf0q?=
 =?us-ascii?Q?AYDhzYA8jNdBSF9keFIVOxuLb1IOZrBqKOBPu+eYXG1z3Wz8rbMG0lfc7gu5?=
 =?us-ascii?Q?pyLDrtp2ju4jAJUWOVgrl9qIqLbAP0K281juyXm4gnjW7TLJIZZ4oM6UMLXU?=
 =?us-ascii?Q?i0I5tHZCWrsQA3as1+Pma5uSuO3MXtL41Li0kMClLIgXus+dH+TMhevN7L/E?=
 =?us-ascii?Q?pAG6AsSRyjq/1pILRD/PSb3HN6nTIALSz6dT3UCNFDAPeJevI6Cmx6c4dSLj?=
 =?us-ascii?Q?nuMe81IRr7G4EvNq1B3YPWdfcF53QfriSEx7rBOV?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee8260c0-d56a-4eba-1ace-08dadc45eff6
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 13:36:56.5596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PnBUwryc8CZS6et9II5C2aS5hfaHYhOUvzEMlIoYyNUxBCKsWBG1VBIrGrAzrYeFAZb285zaf2jM7ujHjijNpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6086
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  discard_wake and gc_wake have only two values, 0 or 1. So
 there is no need to use int type to store them. BTW, move discard_wake to
 the end of the discard_cmd_control structure. Before: 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.138 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.138 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1p4izU-00EmeU-F1
Subject: [f2fs-dev] [PATCH] f2fs: convert discard_wake and gc_wake to bool
 type
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

discard_wake and gc_wake have only two values, 0 or 1.
So there is no need to use int type to store them.

BTW, move discard_wake to the end of the
discard_cmd_control structure.

Before:

  - sizeof(struct discard_cmd_control): 8392

After move:

  - sizeof(struct discard_cmd_control): 8384

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/f2fs.h    | 2 +-
 fs/f2fs/gc.c      | 4 ++--
 fs/f2fs/gc.h      | 2 +-
 fs/f2fs/segment.c | 2 +-
 fs/f2fs/segment.h | 2 +-
 fs/f2fs/sysfs.c   | 4 ++--
 6 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e8953c3dc81a..764041d7b217 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -402,7 +402,6 @@ struct discard_cmd_control {
 	struct list_head wait_list;		/* store on-flushing entries */
 	struct list_head fstrim_list;		/* in-flight discard from fstrim */
 	wait_queue_head_t discard_wait_queue;	/* waiting queue for wake-up */
-	unsigned int discard_wake;		/* to wake up discard thread */
 	struct mutex cmd_lock;
 	unsigned int nr_discards;		/* # of discards in the list */
 	unsigned int max_discards;		/* max. discards to be issued */
@@ -420,6 +419,7 @@ struct discard_cmd_control {
 	atomic_t discard_cmd_cnt;		/* # of cached cmd count */
 	struct rb_root_cached root;		/* root of discard rb-tree */
 	bool rbtree_check;			/* config for consistence check */
+	bool discard_wake;			/* to wake up discard thread */
 };
 
 /* for the list of fsync inodes, used only during recovery */
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index f0c6506d8975..678726e6a6e8 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -57,7 +57,7 @@ static int gc_thread_func(void *data)
 
 		/* give it a try one time */
 		if (gc_th->gc_wake)
-			gc_th->gc_wake = 0;
+			gc_th->gc_wake = false;
 
 		if (try_to_freeze()) {
 			stat_other_skip_bggc_count(sbi);
@@ -181,7 +181,7 @@ int f2fs_start_gc_thread(struct f2fs_sb_info *sbi)
 	gc_th->max_sleep_time = DEF_GC_THREAD_MAX_SLEEP_TIME;
 	gc_th->no_gc_sleep_time = DEF_GC_THREAD_NOGC_SLEEP_TIME;
 
-	gc_th->gc_wake = 0;
+	gc_th->gc_wake = false;
 
 	sbi->gc_thread = gc_th;
 	init_waitqueue_head(&sbi->gc_thread->gc_wait_queue_head);
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 19b956c2d697..15bd1d680f67 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -41,7 +41,7 @@ struct f2fs_gc_kthread {
 	unsigned int no_gc_sleep_time;
 
 	/* for changing gc mode */
-	unsigned int gc_wake;
+	bool gc_wake;
 
 	/* for GC_MERGE mount option */
 	wait_queue_head_t fggc_wq;		/*
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a9099a754dd2..a85d438e76ea 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1701,7 +1701,7 @@ static int issue_discard_thread(void *data)
 						dcc->discard_granularity);
 
 		if (dcc->discard_wake)
-			dcc->discard_wake = 0;
+			dcc->discard_wake = false;
 
 		/* clean up pending candidates before going to sleep */
 		if (atomic_read(&dcc->queued_discard))
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 3ad1b7b6fa94..22fac8baf4a4 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -924,6 +924,6 @@ static inline void wake_up_discard_thread(struct f2fs_sb_info *sbi, bool force)
 	if (!wakeup || !is_idle(sbi, DISCARD_TIME))
 		return;
 wake_up:
-	dcc->discard_wake = 1;
+	dcc->discard_wake = true;
 	wake_up_interruptible_all(&dcc->discard_wait_queue);
 }
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 83a366f3ee80..805b632a3af0 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -511,7 +511,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		} else if (t == 1) {
 			sbi->gc_mode = GC_URGENT_HIGH;
 			if (sbi->gc_thread) {
-				sbi->gc_thread->gc_wake = 1;
+				sbi->gc_thread->gc_wake = true;
 				wake_up_interruptible_all(
 					&sbi->gc_thread->gc_wait_queue_head);
 				wake_up_discard_thread(sbi, true);
@@ -521,7 +521,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		} else if (t == 3) {
 			sbi->gc_mode = GC_URGENT_MID;
 			if (sbi->gc_thread) {
-				sbi->gc_thread->gc_wake = 1;
+				sbi->gc_thread->gc_wake = true;
 				wake_up_interruptible_all(
 					&sbi->gc_thread->gc_wait_queue_head);
 			}
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
