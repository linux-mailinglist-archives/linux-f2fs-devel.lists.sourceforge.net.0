Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D8B573687C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jun 2023 11:56:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qBY5s-0007U0-3G;
	Tue, 20 Jun 2023 09:56:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1qBY5p-0007Ts-Hc
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jun 2023 09:56:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hKg+8M7pawnqQaYZJKPH6cP1gXnNb0G9L1GTB/NIvWY=; b=ZFKlKANA+y17ixdipnVb2SMkNN
 InAxl9ZkE4ZQTHWjYyg7VD7TI3PLXbR3ivKNfY2xWhDrpV4WirWo01nnLLfsHKBfubldazUAtY2IR
 xE3MTg8e3MbZELOS2Fj/rQ4EoCwO4mnqXgipQ1J8yY/oJnvGKqJZqX7Sr5NyJZEvzWts=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hKg+8M7pawnqQaYZJKPH6cP1gXnNb0G9L1GTB/NIvWY=; b=V
 3GyrsO/jzYHAPQVlrR8kgt4cHkJhZp9WfST23CJbW2CAeU9z7WQAQFn/d1e4FSNdySZTv3NL7RL3M
 G8n+hcLkIL7NwAbSoN2udieWkNprNUoz+l/uHnJ7ibdkhItckXe6ddFFFikKhxKRUcfsFipqUp4df
 JOiKRU0DbfTssNSM=;
Received: from mail-tyzapc01on2131.outbound.protection.outlook.com
 ([40.107.117.131] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qBY5k-000703-La for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jun 2023 09:56:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IF07+5hZI1v6S0JtX3VtqA47jwkOtaQAvUH9dMwNcdWvHtHS6P+8RSIZtvDzkcHR172hqklJjqd265CjPRb1bV4XOiuAu7BIGsX41sGQGNLJ4z86ckrQ5q/P1POiGAi0dhjFO9Y5BxhyYRgJBrCFrQ6k7D+XB/YmPuRGOnXPKyarCRPzYwbQvZwKdNNiJMiCf0XX2CO359logNYvtmRc1E8YM+7KUQmz8xcNEdj2Ml+ZN6auwi7iBW8tQzg7tE2YSLgTeIBfP58WLLlmhGGS7vNRBtH7TH2649RYONtAu9iIOVIDxZWthOA7s6varrypDTeszmU0oXTe3sDE+75p3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKg+8M7pawnqQaYZJKPH6cP1gXnNb0G9L1GTB/NIvWY=;
 b=ahrpl9yFHzxvB/3t63uFZJVIe7MF3xJlxUVBuGYWvidnRkFd4xTbpH3swfSqy65EJA+zJFBTuqaiLFalicxcqQz02fcEdIsYCsCfLnL4zX5BfNmfeRlAN5vxV/K3HlPsYeYFLT/tJGEnrpbK4qUz3lE9BmIpevNpZzneC7fxwWU/9+SgFwX9T2B2udx+pg8boOF0DnT0YzmiC1GU2ZGCqrX/IZPRDmbZ2rUs6DdQlCwR/RrpFG6NRRjCU1T7yDGN5EwJxbCuRYPBmBm7w/VLBVSaLuCphRyeTgcDtF9n5SFQRMWHawrMosSnSav0nmGcPn48oYqOTMo19W/oOwD4RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKg+8M7pawnqQaYZJKPH6cP1gXnNb0G9L1GTB/NIvWY=;
 b=gxZHQrVjmM+GTk5xjGykJSfxMRiUfjcdSqAOVgUIsEWhTqE7pFuDbQDbUv4X75SMcc01c2NgF1VtGdwmkc3gIT5xwl6GRdoLYHdM8MRJACvvbw5ye5Abe9xCaPa5tFBNsgvyxZJfaOz/B/zq/MeczvmSSA2bIUslj1pJNzQMffZF/kml7IlZZ3GL/ezrMmmMAJscZep/Ej0IUPX6UtOM6ZhijgjzHhOhoBsuG1xeaZrh2B5Px+crSjrQoWM9RJSDtcQ0IPUJJoju9Hol0HP9FaIf16YIseA0PcpfPJQV8e4UebdMJkovHOFL9CIZI5FdrIW1Rngq1hb1UVzdtkJQ0A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6249.apcprd06.prod.outlook.com (2603:1096:101:de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Tue, 20 Jun
 2023 09:55:52 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%4]) with mapi id 15.20.6500.036; Tue, 20 Jun 2023
 09:55:52 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 20 Jun 2023 17:55:39 +0800
Message-Id: <20230620095540.64109-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SGXP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::26)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB6249:EE_
X-MS-Office365-Filtering-Correlation-Id: dabb48b6-75a1-41a5-cf5a-08db71748831
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tbgb6JHUwkNruxoJwxC52Xzx+AcDsdRWAW9G1qm/aGKNR7vIIfApdJe0HxIh9If7dqYeRFcKkDFZjIxfanLtmYPQEXk8fu9VJUo7BXvWxCrHrCdcL/veACK84KclTy752/AfvnhxJshLwcNrh1lF+Uv5ze10cmVf0TqkgWv2oqNwI7NkMKl5jMA1JEyQsedwSazzA5eiyphtlwRPtlVDV+lKontYsebK5d6NVSBz5tFiFfciu9+QbjIdPwMujXmU77/rqE/2L9W/AcoewgVLxE91dgcjCjMTDMrFqqab3Ljr0xWeUQK3LIVCgGofw6VFL0P4elqwxh7QJmHt1Rkqgmr3SpcRLflYuz7zqp2gMIwqWn8ytA7s4z+9/vytvKOPQhMuw997r2+H0Q4jrJZrLVZVqHVijQ9+Gdl9EUCxVHo47/5YluVgBmS/nebovul270+n3UBrkx116EF6L/ewnly2F6nWr2J6OTiMhHNTNF4BV05hxFLwBnXfid5mHa877hqPn4mwWmhDImZOQJgkOOKxSEa77Gwl4VP7u9frAKpyEpVwfGV7MQ/arx2MuWYluufh7rpHPRgrf58hOrYxQVUyKwXjUh0NSAS+XpEUZQmpgng7vOBBzXYsZYI8+hmZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(136003)(376002)(366004)(346002)(451199021)(83380400001)(6486002)(54906003)(6666004)(38100700002)(316002)(38350700002)(52116002)(66476007)(8676002)(8936002)(2616005)(36756003)(6506007)(1076003)(86362001)(26005)(4326008)(6512007)(186003)(40140700001)(41300700001)(5660300002)(66946007)(110136005)(66556008)(478600001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?31gKd5CCxz2aEixEaP/h7PP/HC7cQNOR9wDg1BbTBytARdWjgEHjqFkJgvP5?=
 =?us-ascii?Q?MZmHGhQkDwDYla0Az84GYbvCo7wJmd7IBqf/xG1shaNiuv51Rxmc+Qh+31y4?=
 =?us-ascii?Q?GkXq6IskLX0vWolzY7Zgbvar7aZjNKS5eT7z503n0z+ujtRK4if+P9vrE0vs?=
 =?us-ascii?Q?hPUcRHK9lyJmkLsb1evnNHWFuHkDEypY/GAnZy1tQ1Zd5Tv9gAXjaM/OYuyQ?=
 =?us-ascii?Q?xjkvHAFqsu/ATqH+vwu2YuL0KvienlSRdeptz6ohiR9EEKNbMoPAqprPVuFx?=
 =?us-ascii?Q?HmjZNKRtBRjtxbfwZZNensL7RV1yX8DEzBHnoLJe2Nwr/xfUap43PdnSCET5?=
 =?us-ascii?Q?bw7LOVdrzMsUul1KptWcdFPvOqmmDgXef6SGL5F4jfPfpxhjKoHmLbdBbjnL?=
 =?us-ascii?Q?iIqoqjjEnXW/4RU+09U8yf7/KBsIuHcHQl837v3Appg8VTvCCOy2W37bFkWZ?=
 =?us-ascii?Q?G0EO/h9FUCPqA8KrWUngxlHgQcCVEyuTCuAp/vBGEdMiPmKDw5PCpcu2zTId?=
 =?us-ascii?Q?oKxz7Gwz4yItmbkXoZjZ2LAkkgRoGysOt7i2bqLzGeT9dYywPDrmVbO2XDRe?=
 =?us-ascii?Q?DcbzzjK7eImwWRQYV6ayI7VtCYWhKZY/AM0gsxfVR+I5PW9ChCCs1TEBPZoa?=
 =?us-ascii?Q?hb5ntVUSyrSZ4BTOO38wbw9KBZdbm9iYlMsaeKVplXj+tZrODFNuZHfZolar?=
 =?us-ascii?Q?bAawWKLhX8fsOELFZzvKe7hNm70thOYLSgrcQOfpgiQzxZx0dT/ZRblTbGlX?=
 =?us-ascii?Q?+lI46UseN29yFD9lMjh9kVX529D40FDzTm5FUqc9DVs6TsYlaoFUAOPeRsAT?=
 =?us-ascii?Q?TwRuDpbo18skNnjaucO/waIajSHF5AAhMePws8DoI4+EQdw7W01JeIB88k3V?=
 =?us-ascii?Q?OrzzixVEtljClEgDF/DrMnsThBKpGt9xqLk4nrkVZun1NAquzV5KDz0g+Zp3?=
 =?us-ascii?Q?Wzt00FvisVTDSQtDxDY07WHGGywAIoo9E9OuaH1DSiyUWAgbxPX8ypxRMHOQ?=
 =?us-ascii?Q?2BIT/MhcpOLtxUm19PgfP1Ys6svGAd3GSfjzq1YYEFMykKCmkCDlMhotFbHo?=
 =?us-ascii?Q?B4PHxu/D9Tzrz2u86lzL5goFi0xg49GuUh11Z/YUDEF5bwBiFmTkiKm2TGlK?=
 =?us-ascii?Q?7PLcFdoMdjRJgM1eo9pM1M9BDD6b/n5X2Sff3NoOcIIsNa4gfCbMBeiDKwmA?=
 =?us-ascii?Q?2NDE4voYizvrgMpQrhiv6UuJ8tgXdpnsCUZewoZ22/dj7W2fyS+zJIzuuAYv?=
 =?us-ascii?Q?9Epcu+ib/Xd86zHgOGwwZWE+1BAgaFjLaxqTKYd/5QHYdJE+5BTYAARoij0p?=
 =?us-ascii?Q?GdqEqGo2r3IIisQvKllUcWcE9Q/81bPecLtVzjDhaqPlykKiW2iJh8LBRM2r?=
 =?us-ascii?Q?frWcz8XJ40/7aYGRvjKTz3g93vaXwYW35RlZbFNriqjcd4RKspRO+zV2zlEJ?=
 =?us-ascii?Q?VtyNAAMfhb5S9QxLM6/dBPCrj98dcPIekN1F8xHympus/Ag9ubXBj+XY4tGF?=
 =?us-ascii?Q?MG+//olpGOi2wdZEnDGNMO03E1VbTB+EIJDXVr/uu+gx9JSXL/XyCAU3Umlh?=
 =?us-ascii?Q?WIFK4Mv4hdel6lbkrSv3Cwto2MFpIwJVZMr8CeKE?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dabb48b6-75a1-41a5-cf5a-08db71748831
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 09:55:51.9832 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BDuTPtBeH1UZLBCzfOCv3DAK0+rP/ZQwh1lRXj5jfxojLL2zx6Iu6C+PVUpdwmzewUGlIDannqpabx8meP5fgg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6249
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: It is observed that when in user compression mode
 (compress_extension=*), 
 even though the file is not compressed, the file is still forced to use buffer
 io, which makes the AndroBench sequential read [...] 
 Content analysis details:   (1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.131 listed in list.dnswl.org]
 1.3 RCVD_IN_VALIDITY_RPBL  RBL: Relay in Validity RPBL,
 https://senderscore.org/blocklistlookup/
 [40.107.117.131 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.131 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qBY5k-000703-La
Subject: [f2fs-dev] [PATCH v2] f2fs: compress: don't force buffered io when
 in COMPR_MODE_USER mode
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
Cc: linux-f2fs-devel@lists.sourceforge.net, Qi Han <hanqi@vivo.com>,
 linux-kernel@vger.kernel.org, Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

It is observed that when in user compression mode (compress_extension=*),
even though the file is not compressed, the file is still forced to use
buffer io, which makes the AndroBench sequential read and write drop
significantly. In fact, when the file is not compressed, we don't need
to force it to buffer io.

                 | w/o patch | w/ patch |
seq read  (MB/s) | 1320.068  | 3696.154 |
seq write (MB/s) | 617.996   | 2978.478 |

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Signed-off-by: Qi Han <hanqi@vivo.com>
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/f2fs.h | 14 ++++++++++++++
 fs/f2fs/file.c |  5 ++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 3f5b161dd743..9e960f1a1117 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3170,6 +3170,20 @@ static inline int f2fs_compressed_file(struct inode *inode)
 		is_inode_flag_set(inode, FI_COMPRESSED_FILE);
 }
 
+static inline bool f2fs_is_compressed_file(struct inode *inode)
+{
+	int compress_mode = F2FS_OPTION(F2FS_I_SB(inode)).compress_mode;
+
+	if (compress_mode == COMPR_MODE_FS)
+		return f2fs_compressed_file(inode);
+	else if (atomic_read(&F2FS_I(inode)->i_compr_blocks) ||
+		is_inode_flag_set(inode, FI_COMPRESS_RELEASED) ||
+		is_inode_flag_set(inode, FI_ENABLE_COMPRESS))
+		return true;
+
+	return false;
+}
+
 static inline bool f2fs_need_compress_data(struct inode *inode)
 {
 	int compress_mode = F2FS_OPTION(F2FS_I_SB(inode)).compress_mode;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index f45d05c13ae5..75c9c3327bbd 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -822,7 +822,7 @@ static bool f2fs_force_buffered_io(struct inode *inode, int rw)
 		return true;
 	if (fsverity_active(inode))
 		return true;
-	if (f2fs_compressed_file(inode))
+	if (f2fs_is_compressed_file(inode))
 		return true;
 
 	/* disallow direct IO if any of devices has unaligned blksize */
@@ -4146,6 +4146,9 @@ static int f2fs_ioc_compress_file(struct file *filp)
 		goto out;
 	}
 
+	/* avoid race case between aio and ioc_compress_file */
+	inode_dio_wait(inode);
+
 	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
 	if (ret)
 		goto out;
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
