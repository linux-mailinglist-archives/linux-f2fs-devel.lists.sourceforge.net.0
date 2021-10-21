Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C0430435896
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Oct 2021 04:22:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mdNii-00043G-9y; Thu, 21 Oct 2021 02:22:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <changfengnan@vivo.com>) id 1mdNig-000435-3f
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Oct 2021 02:22:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9bVd0yEcezI212noYpzRSb5c5nng2UGBXu+PSwtYODY=; b=Rq3tkV15ODZP05Srz1ByGr0srm
 aCgGyUzsn/BEJ4gfRThQLVzy6btpn24G15/xrX3TlOF7LHiEp2c6PXZDwNgeODKCwLq9CvqGCpQWi
 nq5vbivJKJzgYDxCz5Tb7pVQPdNw34Tvoh7VrSwyP/BbTvow4TF0pqiPPKqLROFDnIYU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9bVd0yEcezI212noYpzRSb5c5nng2UGBXu+PSwtYODY=; b=LPxsssa60Rz6j90mNpQtOJLIqY
 9Ta9lYuytp7mJ1Apm2t6piIS6K9RN7V8Vw9xS+IwM13XjWPYs/HcbJJdZnp0pfJTkrRlmQmbK6+L6
 BsfNC7oykXlvGKQQ6lX1Zy1PcOuLsfLW80wSyDudsC1LRPyRFkKkCS9DG4WW9SkmunZA=;
Received: from mail-eopbgr1310111.outbound.protection.outlook.com
 ([40.107.131.111] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mdNic-009Zay-13
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 21 Oct 2021 02:22:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c30q7j1AnSoF5npJ2HMHpSwvYoTe4xIWIIqrq9PqKNM0189qenhndf9z6PDQeSLVU1gUJSY5TRL9zxzPK6nluQOeUkSOnL4fEw9GiSMMCO4rjwavlnn5KOAsbLZeaKJMqMr24Hf5QUur0KsfiAuDJZZtfPODz2a840g2WC5HD5hGFtUh2QyipcSk/KJuoXwUx4qVyqAcF6mneRrZUpe350ABqNZXfP0g3OExZm9ZKgCZfzs/ikdSQb0994RL0SnYp/7p+HL96/Q6zceL+SyxnizcHQbD8PK2zwxEd/2LLcfjCjdEI0Ef/jTTDH+HhvxALrB7lAnhs6muJK5bbun+ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9bVd0yEcezI212noYpzRSb5c5nng2UGBXu+PSwtYODY=;
 b=DRKLNxSdGRFAey8pGJSm7RzeppRFS/FLxF9Alpf25fHwCW2/E/X7cIepB6KovfB7T8gmqhTQKHGX6ITjHXQn4VBFOd6L8AoVWv4kJaXhIXIqFDJBdxyFGMF13ziMAlbmZDVkdcsLCZBzQ1mLVRHNyvkQtLxG41Gzah0/T7+RiAf9LYouqmC6UuJF73sIYQicSLETMs0T9y3B2vcdUHOTudTvAsp1nETxa5+DL30P6NyNTxwRm2hRgYPM0SDInOQsLn272vY1wx+LdG87AzWFpZtlbrqEnCfgBPMkGE2rw8/wmZsykh0p6EA3Vl5QBixBPXsalv9JXlBLBNq0syN1+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9bVd0yEcezI212noYpzRSb5c5nng2UGBXu+PSwtYODY=;
 b=OWUOtb3O2uN20tWRrNSUKVlRbR6N7dDopNHlRIr66HGXkSTPI19BygPJLhy6wejvfnC7WVE0Ioq3eLEYvDm2ls6aNsFXxdlEUQ7NpfdeCCOKGF8we8vl3dJ3+zXViArUfp7yN/nvwrnWSH3aUejWGCj7yQqJtfL6yTPDzYaUwbU=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB1912.apcprd06.prod.outlook.com (2603:1096:802:7::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.17; Thu, 21 Oct
 2021 02:21:49 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a%7]) with mapi id 15.20.4628.018; Thu, 21 Oct 2021
 02:21:49 +0000
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 21 Oct 2021 10:21:41 +0800
Message-Id: <20211021022141.246051-2-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211021022141.246051-1-changfengnan@vivo.com>
References: <20211021022141.246051-1-changfengnan@vivo.com>
X-ClientProxiedBy: HK0PR03CA0115.apcprd03.prod.outlook.com
 (2603:1096:203:b0::31) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
Received: from comdg01144017.vivo.xyz (203.90.234.88) by
 HK0PR03CA0115.apcprd03.prod.outlook.com (2603:1096:203:b0::31) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4608.18 via Frontend Transport; Thu, 21 Oct 2021 02:21:49 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6b7fb1d8-f543-40f9-c0ba-08d9943989d0
X-MS-TrafficTypeDiagnostic: KL1PR0601MB1912:
X-Microsoft-Antispam-PRVS: <KL1PR0601MB19127068B794F07A48F63CA0BBBF9@KL1PR0601MB1912.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:612;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mLkK9J66svoGP2HqShJInOlkPfUyQ2i5Z5H3T34Fr2VNuya+wsIMuEm1zngxd7iISFz3O3TemXpMkkEYS8BKq5cT4Kdbs1jXJ+PPq+nMRSpUmaoVAScrcp7+U7ocaYPhHWR9G1AzYSBzTeAC3Xiwa2TRBvKUC/5r3P20wpHHmDUw3WGqKrNOb5oyecM+2fX1w7CtlSCInwSFFLZfV81dWg4mBTVHD4MZIuSFC20ZBdypP9ZHcLAYe1nSnyMVWbzXr0R6Oeu1skhLwIascz/2V7ARm8z/U0CSebT/Sb+4zujxU4r9oBEjrYd9tCFL66QpoJri1NNZEdOpInyDOzHthfkSk0YgyhdbT8PWaQaVXtM9t28rCvAtiOrbvVtQCTc9DgykwHbOHx6WgklYyNerROcXn2i/hgAIrKey6L8JYIgVbiO7rqtwZIBWWblBEURo7E0tbqfNkQQdRG7isXbktrogi1VSjA18lDURj9TBqqgolLEwuC/LEWfWewr01rVrFzIYvSU5eAg7OAtRAGjp+6eIi0WP5011yN/F7GknN5QnKXiTDYqT+YU9N9ydUKZn0wk8irG/ezn5+UqtNrNA/nHcExib6Zbuio1NpPz/XgNnpo8W4tRdqIpRbNCZkfr4c3b8IvPtZhPzRGIenPgprswOPf+UuywLMJl255ZXcB5lKuBIdJN7xLf7TfxCc6TR/cqdNIlkmut9H5qWuaX2+hDfF2jo/yQL30XGLEWU744=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(66476007)(66556008)(2616005)(956004)(4326008)(83380400001)(6486002)(66946007)(38100700002)(38350700002)(26005)(86362001)(316002)(107886003)(1076003)(8676002)(6512007)(186003)(5660300002)(6666004)(508600001)(6506007)(52116002)(8936002)(36756003)(4730100017);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LSTVkvb1kP7b6ept8wwe2pDGIyl2FtBOOlX5YHjRmMBxp98QGS34mDWcCAhk?=
 =?us-ascii?Q?D52KIB4MbqJKfHRHZk5DLnZNaNnBHpbce/9vZdSegNEfUIaP0KLl8/yvcWSr?=
 =?us-ascii?Q?PBOx8QmPznDEhvzPlGtPCVEFxewkKU5f1HuNXDcGwJrRyJdkO7wKtEDcIExD?=
 =?us-ascii?Q?QoCiRU0CKTHRZsaAa7Qw2fhSbSAEx/hJE7G4uhQKA66YaUOfgZp6K+p/zLE7?=
 =?us-ascii?Q?52AjOrvoc7jb9hzlSX/P3G1pSDE4toxk+7PjF2MAecpFpnSfoclX1uig+eg/?=
 =?us-ascii?Q?CdyZAz+ELuUVBwMC1o5CfpfLwoFZs8Ogr7PecctduBV60+gT/VoXt3xq1lF3?=
 =?us-ascii?Q?E0J9vRnKMMtB+GMLf7jl88K8vUojmWcpyitmGRgytZ1EkY7fAUq8pr8hxFdn?=
 =?us-ascii?Q?DEjTZuQ/HKwwaTrYESkTZn/io7Hm0CiGip0TEUYn6epz3fcbTDZAMWoOhx+g?=
 =?us-ascii?Q?RcFfB0168FX9f0ZIrExAxsUk+/Qk7o8oBnQ464Ci2/bFyMVPxfTpAmeLd2HC?=
 =?us-ascii?Q?bQctv08oHP8PzLjUMABFaCWeVgteu6oiir+xkZjjZFVXOECwkgSBPy0PHjjZ?=
 =?us-ascii?Q?vsVWt90j+TJif3HjtxVPtBvY9ykvpaMBo0fWoRKDllXAmINyfnNmPg2mF87K?=
 =?us-ascii?Q?hECXbRJhltAjauGmZ+Hk2lWpNkbemqKGSIRj5wQsgUJRcfwQ1mmy1dkYUMFI?=
 =?us-ascii?Q?Z61ih3FF61PubcsoAw2de+3im+HiXnIVDV03b3ojckA/OSdCzq7P9nkMVqj4?=
 =?us-ascii?Q?DOXGnxlxAJcCeHK5DgMLqBk+b1XeOWn6PGC1GHHDNqyN3OZDVjirL0mpDc0t?=
 =?us-ascii?Q?2cJSTujEbjxw+dieBLc13ioViIaMOJiUT0/Ap4z7rrqtrZ239G7JkzF5cGNw?=
 =?us-ascii?Q?BHptL0fv2xvse8D+x2Rh/w+/mJWpG9CHk47d+2o1svi/xyCx7awNKSLfAWn0?=
 =?us-ascii?Q?V6RtPNSJIG8IW50JEZ8j4KCbEP0aKpU+99vdTPIc3QDCNVqFk1ijuo0HpF7e?=
 =?us-ascii?Q?v+pxgngF4dU9UVAonIYEeJpX0MMNB9z27GxiuCWOLtKD4tydokuB/aA5B4iF?=
 =?us-ascii?Q?7O4a5loMCS7MkWSC/JBbTpZU7SSiPvM1VVlhcguKCN571BdpZSw80je2sSLj?=
 =?us-ascii?Q?UHwd4rkw2As85qibELD4r456vjrSB1/sXKR8bQDqduV4sXpbgyEJI8c8XBUY?=
 =?us-ascii?Q?ec8AVN5Cx5B7Et36AAMdbksZUbKGRHPqvLXDMmEALqDmGBgBipEyfzKoSRWE?=
 =?us-ascii?Q?Uucd67YBG36lOUCBOiQ9vAlCiXE9U+Ykp0Zw7RP4F6IHJzMavcala71JXcCh?=
 =?us-ascii?Q?ScKzFdZ1O9q812doY6/afgAG?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b7fb1d8-f543-40f9-c0ba-08d9943989d0
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2021 02:21:49.7524 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11126892@vivo.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB1912
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  For now, overwrite file with direct io use inplace policy,
 but not counted, fix it. And use stat_add_inplace_blocks(sbi, 1, ) instead
 of stat_inc_inplace_blocks(sb,
 ). Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
 --- fs/f2fs/data.c | 4 +++- fs/f2fs/f2fs.h | 8 ++++---- fs/f2fs/segment.c
 | 2 +- 3 files changed, 8 insertions(+), 6 deletions(-) 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.131.111 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.131.111 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1mdNic-009Zay-13
Subject: [f2fs-dev] [PATCH v6 2/2] f2fs: fix missing inplace count in
 overwrite with direct io
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
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

For now, overwrite file with direct io use inplace policy, but
not counted, fix it. And use stat_add_inplace_blocks(sbi, 1, )
instead of stat_inc_inplace_blocks(sb, ).

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/data.c    | 4 +++-
 fs/f2fs/f2fs.h    | 8 ++++----
 fs/f2fs/segment.c | 2 +-
 3 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c1490b9a1345..7798f7236376 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1553,7 +1553,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 				goto sync_out;
 			blkaddr = dn.data_blkaddr;
 			set_inode_flag(inode, FI_APPEND_WRITE);
-		}
+		} else if (!f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_PRE_DIO &&
+				map->m_may_create && create)
+			stat_add_inplace_blocks(sbi, 1, true);
 	} else {
 		if (create) {
 			if (unlikely(f2fs_cp_error(sbi))) {
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 09d871c00dd2..579ace97bc47 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3789,12 +3789,12 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
 		else								\
 			((sbi)->block_count[1][(curseg)->alloc_type]++);	\
 	} while (0)
-#define stat_inc_inplace_blocks(sbi, direct_io)					\
+#define stat_add_inplace_blocks(sbi, count, direct_io)			\
 	do {								\
 		if (direct_io)						\
-			(atomic_inc(&(sbi)->inplace_count[0]));		\
+			(atomic_add(count, &(sbi)->inplace_count[0]));  \
 		else								\
-			(atomic_inc(&(sbi)->inplace_count[1]));		\
+			(atomic_add(count, &(sbi)->inplace_count[1]));	\
 	} while (0)
 #define stat_update_max_atomic_write(inode)				\
 	do {								\
@@ -3881,7 +3881,7 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi);
 #define stat_inc_meta_count(sbi, blkaddr)		do { } while (0)
 #define stat_inc_seg_type(sbi, curseg)			do { } while (0)
 #define stat_inc_block_count(sbi, curseg, direct_io)	do { } while (0)
-#define stat_inc_inplace_blocks(sbi, direct_io)		do { } while (0)
+#define stat_add_inplace_blocks(sbi, count, direct_io)	do { } while (0)
 #define stat_inc_seg_count(sbi, type, gc_type)		do { } while (0)
 #define stat_inc_tot_blk_count(si, blks)		do { } while (0)
 #define stat_inc_data_blk_count(sbi, blks, gc_type)	do { } while (0)
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 139db3c709e3..b8240750df6b 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3630,7 +3630,7 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 		goto drop_bio;
 	}
 
-	stat_inc_inplace_blocks(fio->sbi, false);
+	stat_add_inplace_blocks(sbi, 1, false);
 
 	if (fio->bio && !(SM_I(sbi)->ipu_policy & (1 << F2FS_IPU_NOCACHE)))
 		err = f2fs_merge_page_bio(fio);
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
