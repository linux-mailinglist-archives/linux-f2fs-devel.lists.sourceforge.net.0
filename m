Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A191A676DF5
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 22 Jan 2023 16:01:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pJbqm-0005m6-3E;
	Sun, 22 Jan 2023 15:01:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pJbqj-0005lW-Ek
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 22 Jan 2023 15:01:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vjboX6QgYsfKFXhb2nWNGNMMZICzPrmFqiP5V0JxMAY=; b=jYbkl9snNVv+PVsSoAbeNk/YSa
 3ADQi0iMKXp1MuMngxYsp/v50/d5k8UDMf7RMtCoMqX/rKVILcN637aoZkwPcKZef8ajBhZj2GcTw
 A5a/HaUqlTQBaaxZZdhznNXnF7IOjQwdLys26LILnG0t/dKOl3VOFn6oWhmYB5Ynj1o0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vjboX6QgYsfKFXhb2nWNGNMMZICzPrmFqiP5V0JxMAY=; b=n
 IAOqnwmlqyIRP9/phGfTuAP4Oe0l2rfh5l27nvhMU8LT0cvwzB229/zer7EQYGnxY5WE0dZaQpRhG
 c2aspg7tvyyqcou2yp8N21Ay65ILSjbBwhTS8IVYmx+yG7yOSUhOOzLAx9EOMRcoe3hwsFBZtnh4c
 Ou5SRCFPUKZsFNko=;
Received: from mail-sgaapc01on2118.outbound.protection.outlook.com
 ([40.107.215.118] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pJbqZ-0002FD-Bm for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 22 Jan 2023 15:01:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cp7Vic0QNe48/iWFka0Y6SvPzs8KP9cPaSwOrxJLeo7al93AdBKo+HsYeXNZxw4v9sM4f+gGQJ96nXrIyxvd8DACB6TtEVY7542LCwwtmeon7d8ELG7kciSThofCT1E53GdhUBkWXnKooaQ1rHsHDhaml8knO/O+2D0UyF6EWMz4K5cmEdWPZDkLCESN2RDocms3Xy3dEIdSNzat8X2pk3IL9U72dNliZSvFlBdUXiwUQ7jvUb6Zti1QsjHiFdo/0Ey0+23V7HOtni/ol07OYUyQsIsE0+Kt8du/HgX8NGBDnOyWBr/qO9SyLEJZ4+tudxCpWuSKst3H2rlseLGPGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vjboX6QgYsfKFXhb2nWNGNMMZICzPrmFqiP5V0JxMAY=;
 b=B7Tr6racEmsd5F355vNWLQrm84zGpPbr8ogO8BOLEcaygKX2muI8wsnJN8LFzqBeOM5cQYC1OmB+NHe3UCVNE/EY4yIfVQ+8gXOWCPspVpat06oWMwj18pAaCcDZp3Ss9XlUoCskfO/bL4kiASDhGrG6EC+m0NnjWwXdi/go8XsJUspnCvn3nhHmoXu9D9aeDR+VfJs2U5OVHpyiu9WEWP1MQCgJjkGgkjrmVwnMARyb3Y9NFHqkjtZNXyzqnlySbJ9gTTw53d5rjY5j7vs+SJBg2s2cTGfd5O3aU2/KuUCjJtVguvUirTIiA4aQTKkZfbahlPXQX3TH6nRQ6YIa/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vjboX6QgYsfKFXhb2nWNGNMMZICzPrmFqiP5V0JxMAY=;
 b=ZvQswOU4m+rlz7bBaIhlzyeVjDJ3W5VOaBFDkq1E18+sJY3l3gdqbu2gL0UdvC+kDGzKjo5Xtuendkcp+5RL31monLgOzhgTN+DYhrBk85hLTlZQ/tqD98dTpPCOGqXa6pgarBYGvdwf6Sf9H8eOCbiSkULjdCBEy0PyXV7TnXKO8q7dpMqZRaqMw0h/98R4FYKPfJ6hOXceKi/xM0+X4ZLpeWPmibg1f1rF+VufocL6ouZJ/3TCd9VkUjI1JRF1+n3Tt/G8Nx7BtY7ztwuxGU4dBSJq5cfmhAsrXi9fhpQdYDjGEFWF+pvRkV+m0orpvMjiTdYpACMUWwF+Rf4ebQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5493.apcprd06.prod.outlook.com (2603:1096:400:264::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.14; Sun, 22 Jan
 2023 15:01:02 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6043.009; Sun, 22 Jan 2023
 15:01:02 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sun, 22 Jan 2023 23:00:48 +0800
Message-Id: <20230122150049.66607-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR03CA0089.apcprd03.prod.outlook.com
 (2603:1096:4:7c::17) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5493:EE_
X-MS-Office365-Filtering-Correlation-Id: 0613060a-3ac3-4a0c-c735-08dafc897a18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9ES19Rd+QsT9nxSEowerTCnQrVm+WcFMowohlLxu7RyQm0XuR/H6rnHFht23L0HEOlCZHMvR1goRC8p5uPM1+byzfbZcC3YqLm3Ay+WoDc97QjBCb+nWNC1638yDH57b+UQ0doxLb+EZoBwuJ0jYNj8cz5kQGk3Xh2eCbOZjnY0ZLbz+nbR9APiT9lAK76jleIJze7R3EHZudCSnKLph6gtWmAVnR8qaZYRMO5O/3S2ecucmxTW8+V+vUMVE3MUdM0ajUv29o8FBXr+WUqvKNZEOd95XlB5q3amjOPi5DqZs2eeYK1YCaeWqoj+08LeVoWQKQMJRaO445WHrC+8h/nrJA6PQObQAKXAJ9HnXH89hKwGYMjTeXPTejbseOeiWigThrYm/1QFq6LiuuIZU0W7IKKXE21KUUKh/WJ2QzHGXr7W6+pjMj0PAgahVGp/wd9uOKgf7Pi0kLRifwcBsfMVUYYTwBvgN6q2SlP3csHH5f4TNwjDElnGJr170D9JvwDMiSdDejmty6fJj8rEIhih862STJiw8rAArb4YEeegpHPEiZbc3IIUHFWFKvgCq2JgSWj1E5xfsszyiH7kxiENfFovdFVQr2P3JuUDt76tysPggbTks/Zl4w/Y3n6OOAChV5JZ1wGo6o7XfOyk6zWuDry1/MqC9cSe8tqQdoU4qKpYvxFKbkv5HrkTXRgwSpYtOjTB/l5oMyuUeATHvKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39850400004)(396003)(376002)(366004)(346002)(451199015)(83380400001)(38350700002)(38100700002)(86362001)(41300700001)(2906002)(5660300002)(8936002)(4326008)(8676002)(6512007)(6506007)(186003)(26005)(6666004)(1076003)(107886003)(2616005)(316002)(66946007)(66556008)(66476007)(478600001)(52116002)(6486002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CSjTIR3gmhqzzvEvbDSHHehtzEiQ3RqfVs59TYIzj1wJQnjfubqtDGSVO44/?=
 =?us-ascii?Q?kWhXsmLYn/ajCrlpSFER6pvGIa6U/F2Iicu9Gp+LKcBU2seArrIAoFChBchz?=
 =?us-ascii?Q?3P/INHZnUoJ9fNMOritkpo/f6Ucc1NVuwXxtcdNnHTaHSjpC2xdvJk8z5Xbi?=
 =?us-ascii?Q?oAegyRJe877f3td4V5FcftUZQqwlfOPvcE9OuMiYxpkI4vJCZp3SBNW2DGJG?=
 =?us-ascii?Q?o4/o38oh/LRKKBnD2kXVh+7SJE0h1VbQSYwYjCr6+IeQCwvRbAPhSvr/1g/s?=
 =?us-ascii?Q?rKHsUHTNf/2aqvyLVLY9IzmNOIhUZ0ANj/DNrTOXdWTGOLeatpnkkq6HKzl0?=
 =?us-ascii?Q?RtL/SqaAPHpLdqwjba6JIpcwE94O0T2FI/3yPwiS+KeslWXejnQ/lJ3AJ3ob?=
 =?us-ascii?Q?Rs+7H48Y4dY2D3bFaUIveDYVS6YgV+4sQpktywivlXcSfYWMo0D2xt+T1u1o?=
 =?us-ascii?Q?7IjIPXYhn9lmqPhfFGIUw+nwFpGAUJS1zxiupVaZtMsQ4LcHdqww0V6Z/y6j?=
 =?us-ascii?Q?S0cBFbxhlI+tYlRuyQ3lPip7YGFU5xHma7AkJ41Z0gfhZDldWPuTmIKZIwcf?=
 =?us-ascii?Q?shItFaGxPf3xDTS9Iv0Imx2W3u+luM/WONb2kaJZsOsdenS9TXX8PUs82gzN?=
 =?us-ascii?Q?xQcdnd9zw/NOsot9u6Df45hlKzZj0GRJ8eodrsemaJXh0lQ0xgVpJzXNcG6S?=
 =?us-ascii?Q?aCRMx1ddZdsbinq6Q94qJtGfrY36THUSO8/Mx++KWASBwdUZ4LbANyKn2Q/J?=
 =?us-ascii?Q?/suuON57RvFLNQmdn4QJzefi1XTgh8DnluyuvqzZBdrcVm6ndF6AAwDDPD2L?=
 =?us-ascii?Q?ba2xmFDlej1RF3nLm0ZV2Ys1LunjL0Ok7J4TrTlgWZwpOxs4P+WZxVUALIJ1?=
 =?us-ascii?Q?+O4/izSOyMtcCICNz4Xddz8JVwqw5Q1Ip2KtfYAa/KOnUe4WJuks/kqmNGiK?=
 =?us-ascii?Q?bRV1RXgA8k83siu1b/XJbE2OXEPvytFag2sVTNqFxO1t7ii2po8CGpmnlTAM?=
 =?us-ascii?Q?KKsjCaz8ifR4I7YEUQOM2/hQBYsXnb69cOGJFA7eR8y6JQO1iXGSnBToZ1Qi?=
 =?us-ascii?Q?XDsIzNJp/JinMOJ8v6wQgONbTsgCXTS0Q1QwvAYti0GuYDqtSeGRLzBWvojc?=
 =?us-ascii?Q?+mrM58gHTsCdhuXgpoi4/vdP/U9Ffi9c/elyhACl1Gf3MJntJAIS3rMLo0IX?=
 =?us-ascii?Q?kljKlsVTVCAsvkhx6k80E3SQ73lTMU53rzoP/ObWQRl6f/hwYCS9CaJIkqvy?=
 =?us-ascii?Q?RnynFlg6UuvuAUEBeVrNKqdRWIoQxbRul+0SBvZhO0CBWLK+6yt8TvRB1iNC?=
 =?us-ascii?Q?k8apaqlxLQFT7FZRzt2Zvvj3GXEDBZICySg4kAPQCNLK+pcWVLdU2j3jgH+n?=
 =?us-ascii?Q?Nnl+Bw7SoP27dsxHDlY6NTozW8e2nrHwA0K2xy21RpC7BBxY8ImdRJauKflT?=
 =?us-ascii?Q?vPa7jec+ePSoTxKxv/LykUkbqls2I6d7NDXNaRwuHhn1K0rtKbOiH6z9Pr5G?=
 =?us-ascii?Q?5+4rDsMan5X5R9ds9X7SqAtMmNiiZYrzWJLP3//S5tqxCquGgX9Hem/haCBI?=
 =?us-ascii?Q?UKHF6c3hrVikzIiY5MjlwNhvjlaf06Wh2s45kWi+?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0613060a-3ac3-4a0c-c735-08dafc897a18
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2023 15:01:01.7072 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PesNE31rn9zp1Y1pBrt6IM9jyea39nyy/+6Eys1UVnoaKQyY/wyGqTgwa48xMcdYZBk0pCo1VN/xKz2hinVVYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5493
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Added a new F2FS_IOC_SET_COMPRESS_OPTION_V2 ioctl to change
 file compression option of a file. struct f2fs_comp_option_v2 { union { struct
 { __u8 algorithm; __u8 log_cluster_size; __u16 compress_flag; };
 struct f2fs_comp_option option; }; }; 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.118 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.118 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pJbqZ-0002FD-Bm
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: add F2FS_IOC_SET_COMPRESS_OPTION_V2
 ioctl
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

Added a new F2FS_IOC_SET_COMPRESS_OPTION_V2 ioctl to change file
compression option of a file.

struct f2fs_comp_option_v2 {
	union {
		struct {
			__u8 algorithm;
			__u8 log_cluster_size;
			__u16 compress_flag;
		};
		struct f2fs_comp_option option;
	};
};

struct f2fs_comp_option_v2 option;

option.algorithm = 2;
option.log_cluster_size = 2;
option.compress_flag = (5 << COMPRESS_LEVEL_OFFSET) | BIT(COMPRESS_CHKSUM);

ioctl(fd, F2FS_IOC_SET_COMPRESS_OPTION_V2, &option);

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v2:
-export ZSTD_MAX_CLEVEL to avoid compile error
-handle COMPRESS_LZO and COMPRESS_LZORLE in f2fs_ioc_set_compress_option
-handle F2FS_IOC_SET_COMPRESS_OPTION_V2 in f2fs_compat_ioctl
 fs/f2fs/f2fs.h              |  8 +------
 fs/f2fs/file.c              | 47 +++++++++++++++++++++++++++++++------
 include/linux/zstd_lib.h    |  3 +++
 include/uapi/linux/f2fs.h   | 21 +++++++++++++++++
 lib/zstd/compress/clevels.h |  4 ----
 5 files changed, 65 insertions(+), 18 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9edad9ccc2cd..fa409eca293f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -25,6 +25,7 @@
 #include <linux/quotaops.h>
 #include <linux/part_stat.h>
 #include <crypto/hash.h>
+#include <uapi/linux/f2fs.h>
 
 #include <linux/fscrypt.h>
 #include <linux/fsverity.h>
@@ -1502,11 +1503,6 @@ enum compress_algorithm_type {
 	COMPRESS_MAX,
 };
 
-enum compress_flag {
-	COMPRESS_CHKSUM,
-	COMPRESS_MAX_FLAG,
-};
-
 #define	COMPRESS_WATERMARK			20
 #define	COMPRESS_PERCENT			20
 
@@ -1522,8 +1518,6 @@ struct compress_data {
 
 #define F2FS_COMPRESSED_PAGE_MAGIC	0xF5F2C000
 
-#define	COMPRESS_LEVEL_OFFSET	8
-
 /* compress context */
 struct compress_ctx {
 	struct inode *inode;		/* inode the context belong to */
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 5e4b8c6daa1f..78b97c1fa6af 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -25,6 +25,8 @@
 #include <linux/fileattr.h>
 #include <linux/fadvise.h>
 #include <linux/iomap.h>
+#include <linux/zstd.h>
+#include <linux/lz4.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -3924,12 +3926,13 @@ static int f2fs_ioc_get_compress_option(struct file *filp, unsigned long arg)
 	return 0;
 }
 
-static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
+static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg,
+						unsigned int cmd)
 {
 	struct inode *inode = file_inode(filp);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	struct f2fs_comp_option option;
-	int ret = 0;
+	struct f2fs_comp_option_v2 option;
+	int ret = 0, len;
 
 	if (!f2fs_sb_has_compression(sbi))
 		return -EOPNOTSUPP;
@@ -3937,8 +3940,12 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
 	if (!(filp->f_mode & FMODE_WRITE))
 		return -EBADF;
 
-	if (copy_from_user(&option, (struct f2fs_comp_option __user *)arg,
-				sizeof(option)))
+	if (cmd == F2FS_IOC_SET_COMPRESS_OPTION_V2)
+		len = sizeof(struct f2fs_comp_option_v2);
+	else
+		len = sizeof(struct f2fs_comp_option);
+
+	if (copy_from_user(&option, (void __user *)arg, len))
 		return -EFAULT;
 
 	if (!f2fs_compressed_file(inode) ||
@@ -3947,6 +3954,26 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
 			option.algorithm >= COMPRESS_MAX)
 		return -EINVAL;
 
+	if (cmd == F2FS_IOC_SET_COMPRESS_OPTION_V2) {
+		unsigned int level = GET_COMPRESS_LEVEL(option.compress_flag);
+
+		switch (option.algorithm) {
+		case COMPRESS_LZO:
+		case COMPRESS_LZORLE:
+			if (level)
+				return -EINVAL;
+			break;
+		case COMPRESS_LZ4:
+			if (level < LZ4HC_MIN_CLEVEL || level > LZ4HC_MAX_CLEVEL)
+				return -EINVAL;
+			break;
+		case COMPRESS_ZSTD:
+			if (!level || level > ZSTD_MAX_CLEVEL)
+				return -EINVAL;
+			break;
+		}
+	}
+
 	file_start_write(filp);
 	inode_lock(inode);
 
@@ -3962,7 +3989,10 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
 
 	F2FS_I(inode)->i_compress_algorithm = option.algorithm;
 	F2FS_I(inode)->i_log_cluster_size = option.log_cluster_size;
-	F2FS_I(inode)->i_cluster_size = 1 << option.log_cluster_size;
+	F2FS_I(inode)->i_cluster_size = BIT(option.log_cluster_size);
+
+	if (cmd == F2FS_IOC_SET_COMPRESS_OPTION_V2)
+		F2FS_I(inode)->i_compress_flag = option.compress_flag & COMPRESS_OPTION_MASK;
 	f2fs_mark_inode_dirty_sync(inode, true);
 
 	if (!f2fs_is_compress_backend_ready(inode))
@@ -4235,7 +4265,9 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_GET_COMPRESS_OPTION:
 		return f2fs_ioc_get_compress_option(filp, arg);
 	case F2FS_IOC_SET_COMPRESS_OPTION:
-		return f2fs_ioc_set_compress_option(filp, arg);
+		return f2fs_ioc_set_compress_option(filp, arg, F2FS_IOC_SET_COMPRESS_OPTION);
+	case F2FS_IOC_SET_COMPRESS_OPTION_V2:
+		return f2fs_ioc_set_compress_option(filp, arg, F2FS_IOC_SET_COMPRESS_OPTION_V2);
 	case F2FS_IOC_DECOMPRESS_FILE:
 		return f2fs_ioc_decompress_file(filp, arg);
 	case F2FS_IOC_COMPRESS_FILE:
@@ -4871,6 +4903,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_SEC_TRIM_FILE:
 	case F2FS_IOC_GET_COMPRESS_OPTION:
 	case F2FS_IOC_SET_COMPRESS_OPTION:
+	case F2FS_IOC_SET_COMPRESS_OPTION_V2:
 	case F2FS_IOC_DECOMPRESS_FILE:
 	case F2FS_IOC_COMPRESS_FILE:
 		break;
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
diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
index 955d440be104..640569444200 100644
--- a/include/uapi/linux/f2fs.h
+++ b/include/uapi/linux/f2fs.h
@@ -43,6 +43,8 @@
 #define F2FS_IOC_DECOMPRESS_FILE	_IO(F2FS_IOCTL_MAGIC, 23)
 #define F2FS_IOC_COMPRESS_FILE		_IO(F2FS_IOCTL_MAGIC, 24)
 #define F2FS_IOC_START_ATOMIC_REPLACE	_IO(F2FS_IOCTL_MAGIC, 25)
+#define F2FS_IOC_SET_COMPRESS_OPTION_V2	_IOW(F2FS_IOCTL_MAGIC, 26,	\
+						struct f2fs_comp_option_v2)
 
 /*
  * should be same as XFS_IOC_GOINGDOWN.
@@ -62,6 +64,15 @@
 #define F2FS_TRIM_FILE_ZEROOUT		0x2	/* zero out */
 #define F2FS_TRIM_FILE_MASK		0x3
 
+/*
+ * Flags used by F2FS_IOC_SET_COMPRESS_OPTION_V2
+ */
+#define COMPRESS_CHKSUM		0x0 /* enable chksum for compress file */
+#define COMPRESS_LEVEL_OFFSET		8
+#define COMPRESS_LEVEL_MASK		GENMASK(15, COMPRESS_LEVEL_OFFSET)
+#define COMPRESS_OPTION_MASK		(COMPRESS_LEVEL_MASK | BIT(COMPRESS_CHKSUM))
+#define GET_COMPRESS_LEVEL(x)		(((x) & COMPRESS_LEVEL_MASK) >> COMPRESS_LEVEL_OFFSET)
+
 struct f2fs_gc_range {
 	__u32 sync;
 	__u64 start;
@@ -96,4 +107,14 @@ struct f2fs_comp_option {
 	__u8 log_cluster_size;
 };
 
+struct f2fs_comp_option_v2 {
+	union {
+		struct {
+			__u8 algorithm;
+			__u8 log_cluster_size;
+			__u16 compress_flag;
+		};
+		struct f2fs_comp_option option;
+	};
+};
 #endif /* _UAPI_LINUX_F2FS_H */
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
