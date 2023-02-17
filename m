Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ABA69A593
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Feb 2023 07:23:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pSu9O-0001RN-8J;
	Fri, 17 Feb 2023 06:23:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pSu9M-0001RG-Mp
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Feb 2023 06:23:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lhBkYvjPE5SbejNzYX0VsOsf2+DeA6gxONrd6bcrTnU=; b=jj0RXj/n0KWDhpTdHWDNai7+7G
 rOYdyPS+9LCLfL9begjSe+1MKiOH4JWi3dI0xAxpTfLGls0bNUO4DvwwCsppceBx1JKMzSll2Couy
 F2+V5W3CzMYDq10ZTF79tN+S1lDNykX+O85M6CKVFfbrnZ4bUQAj3vKvTlh42UMkp7OI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lhBkYvjPE5SbejNzYX0VsOsf2+DeA6gxONrd6bcrTnU=; b=f
 WGNo1pl12BQjcZc9teReNCzOhvbr/sSPKbmVvYYa0OU4ms2fRdfoStSt6EchaESlxdX0K3SOwej3m
 EVwy3olOO9aTF56wJIjdvhmmbAdNJIvNwUf+zD840cJ7I1sXDWaM51bv1KalH2NdsL6VbnTQsnebs
 0YCJA0TbbCc1dDZU=;
Received: from mail-sgaapc01on2131.outbound.protection.outlook.com
 ([40.107.215.131] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pSu9I-00737o-PK for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 17 Feb 2023 06:23:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YRAqP7KWKWHaiOoW5z1Ov1prrA8WRbyoHPzkiW2WwPn4zaOnh+NcuxkeYdzYyn6cejsD9qjW1ccOYG5YRs5a2CcVQyKSl5k7+zXxUwNErG9gtUBG9gbDSFLuMLF8h2lAp7rKQF60Y6oCX7UpaSqvpklncFTOWJILk3mNgd2nrVCejNhG3DoDn4L2tlJps99GHGzhMAMw0E9mDbb5jnCJr/ZRrY6tq5Nnd1a/0wwOAIf4UteE+Ee9uGblmG+KH8IbCQ/fG2me3fMS5ZaFSA0hue6PIi8RqStTvaApemVNUuSNGh/BzCQJ6Y953/JyjrWhcqhObVsE9+hOO4mrfAcBSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lhBkYvjPE5SbejNzYX0VsOsf2+DeA6gxONrd6bcrTnU=;
 b=gUoAD3uAfzGspL/QG1ogRwxRAIyz4Ry6Yqyf0FFIxTGq2Cg+EGZ9Dwe7ru/AhZmkbHg61ezsayVC7ztWPHyJ2pZo68P1XbMxvaq0sPZVlJOmEkQYhzWz5n2KWSL1sMj1SISpjCe94fduyZahvU80ilErTg+6/jslqn27awD79eWRoc/dKJiFCxJLdzUGF37zI9iHZyEoyH443j+BCKAX8IVw1DzH7swdXUts3COnLKJ/xd4pcs+BcGkFXxGDHBTZT1R/U0EkGnZ5Kg/PwEmFMblaHsxjnZa6yH7lJEj4TY8yEYvkWCx2d1VGXjJ7a5P5VFTvSRYlPHalypWXPd1yRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lhBkYvjPE5SbejNzYX0VsOsf2+DeA6gxONrd6bcrTnU=;
 b=loYvy1VLYsSSPlkcySWXgeaxNCOz9sN6K7gyoqxMQbw1hA3xQTHHG9EqQqdtQ0CWGMhVS6ZmDaVKS1P01n2KqDvDF0CQoHsSo/CHFbFkhrXUy30SL6hP/rPXxw7IVJ/eHiav7R33KJoWOkq5h5AQe3ms2vvHKXmLPlUE2usIAYGAExm4R6RhJhi6xnO5HV9qJmTLp8/ZVPOylR14XYHLPg5ejSc8V89/1j7eBs+9RqxHftLvzNMMs7K/aD0eQ/oCjudgLgMHwaKvzNKgipIpRBerUZ7PkFEZfp5qdzq6ZEz9/Kk58D95oG5gL/aZ/RLZnz2CPmI6JBl/5WkB78/oeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by TYZPR06MB4447.apcprd06.prod.outlook.com (2603:1096:400:83::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.6; Fri, 17 Feb
 2023 06:23:02 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::a2c6:4a08:7779:5190]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::a2c6:4a08:7779:5190%3]) with mapi id 15.20.6111.009; Fri, 17 Feb 2023
 06:23:02 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 17 Feb 2023 14:22:42 +0800
Message-Id: <20230217062242.60998-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: OS3P286CA0042.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:1f5::9) To TYZPR06MB5275.apcprd06.prod.outlook.com
 (2603:1096:400:1f5::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5275:EE_|TYZPR06MB4447:EE_
X-MS-Office365-Filtering-Correlation-Id: ab29d2c2-bf48-4441-53af-08db10af6c31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: LxLTYlNNXmpljNKZYpmhG+h10AIEJxLT80iW2xJ2L6wpjt6gruBqW7NdPMlMro5RatUxfsVxO+bGH+WGh0rUUVTvdtrnOCJw6CUDJcOPX4AfKtk3DPHZx/T1PsV1S4RP1Puzoq2kOpoTICZrGFBeuBpqkEmWVVVOSE2UD8mhtlbpRsnZQqKYk7NQW/gOSMncdwmwDMKEf70nPKvpROOicR1V5gv/5AARXbC69psihoplULQc5CdAeU38/KELtt5UnXN1Ch8LSJ3+ChCVtr08F5jdvtcSM9Zm7zYtx4jZ/qSXONnfMu8OJwjMkVdpJHAUkW9qfCEYsi1O2PuKBSySLO/SkKmoesDwWhcYTi89AvQdQSFcPSSKZqczpaenqzK0uV2tA2nPpTM56KPTkOp+LEtnmn8N1gREpc/6sHIe5qcaMBYjIqxM9aKwlk95nxkzabkYTW0RwkLUqajASdsnGBWedokg3ZlhkTIecbn3N4mulBjwElZg2Mh/ZWsmdZWDAqnYZ8wu/i1AUIsmeCHTXxNXyLqeJ5VhZPDJZwo7bQNYP+di8AicVk7nr0nZCN3FhMwCgOnWwDaoWMdIsXpcrB/QhbNq4g0+ADvp+SF2LCjZhdGW2yaHmgmJUOVC2P9XQ8IcVUK7aDN1xnsM54ocdvAixIym8H8k5TzeWtij4GoLulXrxEZ6M3T2imq4hAXn05W1/y6QUns3hiBjisYNjA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB5275.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(39850400004)(396003)(376002)(136003)(346002)(451199018)(41300700001)(66476007)(66556008)(4326008)(8676002)(66946007)(316002)(86362001)(36756003)(8936002)(5660300002)(2906002)(6512007)(6506007)(6666004)(26005)(1076003)(186003)(107886003)(2616005)(6486002)(38350700002)(478600001)(38100700002)(83380400001)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CSCBpu+vqIqDt9XL7H0KDtGWD8hhnmsRk/KYyT0hmxRSU7sNtDQ9k+Tnchot?=
 =?us-ascii?Q?f7xIHeBlHaR7mKvh9DXKlzb1XSH+5z0rQji/BlIlXBOg/ehM5PDcuvHJMAlz?=
 =?us-ascii?Q?PBpEUNxNMquzx25K6QDet2bqFSW1BmL8ir1GssLlfDjY2UxqR4fxVYAD7AfI?=
 =?us-ascii?Q?mq69Vq1IYLJMy1JDPIsYwFqK3b8RaMnq4He+rOyo15YD0ZHnhTbQcFDFujPA?=
 =?us-ascii?Q?FNSHtIJRO8OTdPjGVjxL31hp3s29zrbyU8YyNruVTmRxvdwJVha1ctONdIy+?=
 =?us-ascii?Q?26i14MX+IFUchMabIhkgbp6PvupH/NwA94YuxDxxOJghcZM5Vb4zvoS6zBco?=
 =?us-ascii?Q?qTycPAjnV+nUCApIbxI7Bph1pNaTJuzJYm8nf5sDlKp4enGBWsf1bjmFsdhz?=
 =?us-ascii?Q?Jyjdbhxo6pjOMmUFsUYYGQaSBB67z6RwntzWpkNxuFPDPHCoVKejjvPWxyBO?=
 =?us-ascii?Q?g4xz+UaG1SMC3grPy399c9xZlfd/UAjPCfVnq6YWB1en0No+v0l1P4YuvdkK?=
 =?us-ascii?Q?nVAiGpvrL7insVLim2zj9zNG+gFYCn64+44VnFYS1ROAdn9v1/lAQi89b0LS?=
 =?us-ascii?Q?moq3PGxR3ojH6tRuKVYjYxmhPnJqfDxyHivmJi9LqEvyzqAAP40R95SkUQ6a?=
 =?us-ascii?Q?FovV05/oE/alTMnuKWED6fFbLRSxfCaDtm32zKJoIv/OUIEZYKBRWXAvIjLS?=
 =?us-ascii?Q?l/YC+imK6PRQumckxReQXpTqaLn9QrT7xa4HFnjJgg1JZRHBWc5FBWLe5tYb?=
 =?us-ascii?Q?8sjYjo0ZCoX/iDb4zaaPnVgBeFjjcrLbJHk7OAIpYyrN5TkW5sL7qS4jG4CF?=
 =?us-ascii?Q?unJy0EN+OuBwEQx798LsHIlQmkKTwYkbExZnsPm4ofygKq62LIOvpRRHjZJi?=
 =?us-ascii?Q?O+bM4cmJmXL0eNq1wDxw2FV9c+mLsyFxrAmsYbowJki+xmpJml3uRl4Mhdyf?=
 =?us-ascii?Q?bi7UWEkOLKkyx9/OlzWS2EFEsJIkB7Q7TtrqR5lhvAlxZL+h8d5qdjFduHm4?=
 =?us-ascii?Q?Lxh+XjvAYg/BVstRClpfFHO/MlhyMM93RXQymhvqaly6qUyf1eH7FFuVeIOM?=
 =?us-ascii?Q?GtCpMXmTELJ72zCA/gADID553ScM12Nzy6RZGtHDq/VsAtMz2k32sqiWZBWM?=
 =?us-ascii?Q?xpQwWwy2ZMnpCN6qGrD0WoUWSDbCs72r/+UU5lT3JjV8GVtIg3dBh9llLRHn?=
 =?us-ascii?Q?71yPAUDCwsRlNZJ9Fybkte3sFvD7005KRN2dTyCteHkGWXHSt//dPMwR70lm?=
 =?us-ascii?Q?wrycYi29R7MeAyJw+aBm8U4h2ZRJHEDzpDkfvRzZFmT3FEl7A0MFiGp5BLbe?=
 =?us-ascii?Q?onf3MwtwAnWQtIp3mNarzPKTn0i41F+YlMx16YYkGVQfrbRE3O6t7uP534tU?=
 =?us-ascii?Q?sBmllhmbTz+nBru/K+NcJh4VUkvaCpXrHrpIBvxZheE8rPlhxrH9Qk9bX46r?=
 =?us-ascii?Q?ZBps4LXytwhUzEIjG/mtpN9KhXbsC2SXGeZWfvp+n00BDx+qSgGc6XRTGG9U?=
 =?us-ascii?Q?wZr/LtnYNATD6Pd0srEgqXnJgDBkcPMRZODzK4e/5GBrTpUaELuDyIUyHqBl?=
 =?us-ascii?Q?Gf7dO6CuHKM9etktSXedvKyyNkk/62gBo6faGuow?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab29d2c2-bf48-4441-53af-08db10af6c31
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2023 06:23:02.4956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TqQ2PP2+PJJqA7hc3X58a+GUtfEpVOzakeI5zT9pYBnpha93dOvUeY8g/iKmPnLMwNlloywQpocZ2HnkgFzTgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4447
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Commit 3fde13f817e2 ("f2fs: compress: support compress
 level")
 forgot to do basic compress level check, let's add it. Signed-off-by: Yangtao
 Li <frank.li@vivo.com> --- fs/f2fs/inode.c | 94 +++++++++++++++++++++++++
 include/linux/zstd_lib.h | 3 ++ lib/zstd/compress/clevels.h | 4 -- 3 files
 changed, 67 inse [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.131 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.131 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pSu9I-00737o-PK
Subject: [f2fs-dev] [PATCH] f2fs: add sanity compress level check for
 compressed file
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
Cc: terrelln@fb.com, Yangtao Li <frank.li@vivo.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Commit 3fde13f817e2 ("f2fs: compress: support compress level")
forgot to do basic compress level check, let's add it.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/inode.c             | 94 +++++++++++++++++++++++++------------
 include/linux/zstd_lib.h    |  3 ++
 lib/zstd/compress/clevels.h |  4 --
 3 files changed, 67 insertions(+), 34 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 7d2e2c0dba65..3dc973aa40da 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -10,6 +10,8 @@
 #include <linux/buffer_head.h>
 #include <linux/writeback.h>
 #include <linux/sched/mm.h>
+#include <linux/lz4.h>
+#include <linux/zstd.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -202,6 +204,66 @@ void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct page *page)
 	ri->i_inode_checksum = cpu_to_le32(f2fs_inode_chksum(sbi, page));
 }
 
+static bool sanity_check_compress_inode(struct inode *inode,
+			struct f2fs_inode *ri)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	unsigned char compress_level;
+
+	if (ri->i_compress_algorithm >= COMPRESS_MAX) {
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		f2fs_warn(sbi,
+			"%s: inode (ino=%lx) has unsupported compress algorithm: %u, run fsck to fix",
+			__func__, inode->i_ino, ri->i_compress_algorithm);
+		return false;
+	}
+	if (le64_to_cpu(ri->i_compr_blocks) >
+			SECTOR_TO_BLOCK(inode->i_blocks)) {
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		f2fs_warn(sbi,
+			"%s: inode (ino=%lx) has inconsistent i_compr_blocks:%llu, i_blocks:%llu, run fsck to fix",
+			__func__, inode->i_ino, le64_to_cpu(ri->i_compr_blocks),
+			SECTOR_TO_BLOCK(inode->i_blocks));
+		return false;
+	}
+	if (ri->i_log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
+		ri->i_log_cluster_size > MAX_COMPRESS_LOG_SIZE) {
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		f2fs_warn(sbi,
+			"%s: inode (ino=%lx) has unsupported log cluster size: %u, run fsck to fix",
+			__func__, inode->i_ino, ri->i_log_cluster_size);
+		return false;
+	}
+
+	compress_level = le16_to_cpu(ri->i_compress_flag) >> COMPRESS_LEVEL_OFFSET;
+	switch (ri->i_compress_algorithm) {
+	case COMPRESS_LZO:
+	case COMPRESS_LZORLE:
+		if (compress_level)
+			goto err;
+		break;
+	case COMPRESS_LZ4:
+		if ((compress_level && compress_level < LZ4HC_MIN_CLEVEL) ||
+				compress_level > LZ4HC_MAX_CLEVEL)
+			goto err;
+		break;
+	case COMPRESS_ZSTD:
+		if (!compress_level || compress_level > ZSTD_MAX_CLEVEL)
+			goto err;
+		break;
+	default:
+		goto err;
+	}
+
+	return true;
+
+err:
+	set_sbi_flag(sbi, SBI_NEED_FSCK);
+	f2fs_warn(sbi, "%s: inode (ino=%lx) has unsupported compress level: %u, run fsck to fix",
+		  __func__, inode->i_ino, compress_level);
+	return false;
+}
+
 static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
@@ -285,36 +347,8 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 
 	if (f2fs_has_extra_attr(inode) && f2fs_sb_has_compression(sbi) &&
 			fi->i_flags & F2FS_COMPR_FL &&
-			F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
-						i_log_cluster_size)) {
-		if (ri->i_compress_algorithm >= COMPRESS_MAX) {
-			set_sbi_flag(sbi, SBI_NEED_FSCK);
-			f2fs_warn(sbi, "%s: inode (ino=%lx) has unsupported "
-				"compress algorithm: %u, run fsck to fix",
-				  __func__, inode->i_ino,
-				  ri->i_compress_algorithm);
-			return false;
-		}
-		if (le64_to_cpu(ri->i_compr_blocks) >
-				SECTOR_TO_BLOCK(inode->i_blocks)) {
-			set_sbi_flag(sbi, SBI_NEED_FSCK);
-			f2fs_warn(sbi, "%s: inode (ino=%lx) has inconsistent "
-				"i_compr_blocks:%llu, i_blocks:%llu, run fsck to fix",
-				  __func__, inode->i_ino,
-				  le64_to_cpu(ri->i_compr_blocks),
-				  SECTOR_TO_BLOCK(inode->i_blocks));
-			return false;
-		}
-		if (ri->i_log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
-			ri->i_log_cluster_size > MAX_COMPRESS_LOG_SIZE) {
-			set_sbi_flag(sbi, SBI_NEED_FSCK);
-			f2fs_warn(sbi, "%s: inode (ino=%lx) has unsupported "
-				"log cluster size: %u, run fsck to fix",
-				  __func__, inode->i_ino,
-				  ri->i_log_cluster_size);
-			return false;
-		}
-	}
+			F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_log_cluster_size))
+		sanity_check_compress_inode(inode, ri);
 
 	return true;
 }
diff --git a/include/linux/zstd_lib.h b/include/linux/zstd_lib.h
index 79d55465d5c1..ff55f41c73d3 100644
--- a/include/linux/zstd_lib.h
+++ b/include/linux/zstd_lib.h
@@ -88,6 +88,9 @@ ZSTDLIB_API const char* ZSTD_versionString(void);
 #  define ZSTD_CLEVEL_DEFAULT 3
 #endif
 
+/*-=====  Pre-defined compression levels  =====-*/
+#define ZSTD_MAX_CLEVEL     22
+
 /* *************************************
  *  Constants
  ***************************************/
diff --git a/lib/zstd/compress/clevels.h b/lib/zstd/compress/clevels.h
index d9a76112ec3a..b040d9d29089 100644
--- a/lib/zstd/compress/clevels.h
+++ b/lib/zstd/compress/clevels.h
@@ -14,10 +14,6 @@
 #define ZSTD_STATIC_LINKING_ONLY  /* ZSTD_compressionParameters  */
 #include <linux/zstd.h>
 
-/*-=====  Pre-defined compression levels  =====-*/
-
-#define ZSTD_MAX_CLEVEL     22
-
 __attribute__((__unused__))
 
 static const ZSTD_compressionParameters ZSTD_defaultCParameters[4][ZSTD_MAX_CLEVEL+1] = {
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
