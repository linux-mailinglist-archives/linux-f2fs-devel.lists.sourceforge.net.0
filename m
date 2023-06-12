Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43FDA72B59B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jun 2023 05:02:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8Xp0-0005UV-5i;
	Mon, 12 Jun 2023 03:02:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1q8Xoo-0005UN-1T
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 03:02:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xKUnwyC/3gqOQ5IDTKfKbE911KLBhciRAlD1Y3QD7PA=; b=JPD+rdG6eJSSmZ2FmLBTyt884T
 G5ucm7hXfMjDFFSWTegd3wMBNnD80r588cNxW27Dtk2KHOJ3XL6rDLGQL5HlAP0v/T+pOocuAm16H
 A8RjyiW8hBe/Fb8UjOx51XqPdaYO51cL1rzEQvH5Plf3/A+XaYvAdD/jvzSmuE0hitLc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xKUnwyC/3gqOQ5IDTKfKbE911KLBhciRAlD1Y3QD7PA=; b=UiHo79SCQdCBJGtHuxOW2q1AnL
 agwG0lpXvl53V+BD9yie1m1f9kU2fntLlpxdweaU3ItKBkQzE/0i7QrpKSkFTqoxbt00Plop3Z6rO
 27nPyQXjhAOzGufuFwF95eiVns06wcDy42BkB4qj++tTViYNuuai0uCc5P9k7MZcM1bA=;
Received: from mail-tyzapc01on2054.outbound.protection.outlook.com
 ([40.107.117.54] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8Xof-000MRd-UP for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 03:02:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyPbewnLX1SqBcLlQJ3Q6AYoEq2WoyJPna2C9C6ioNoGdwwnnY+g1dt75BfqS7ldjBinBFUSWmkBYmGk7tInZSP3wybwlrojBVsj98f6VeYm5pmP/hkLzOYUTLWlRTwNZeRrLZ9MSrnl5RUhbmZexNis2R3Rmp68uecP+of5qtow18o3FCsn4XgTux6526xFbf4LIRsuSDvlw6/sKcNLyXHx6d0jINFBC2GjB2s0qfDloH8AViQU82AuavBim7f1FoL4uIIdk6/uVfToc51crNby4zpk39bIEGJf58ApNVyETyITW3Wd022i2meBd3XBbYJhUcdAhxA7x0atjtQRmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xKUnwyC/3gqOQ5IDTKfKbE911KLBhciRAlD1Y3QD7PA=;
 b=jO4ghU2YUxY/oZqXdNMb29qMNjE+ANPO866uAXT0tFzee8Hir2xueBlV0nfvA5ZgavVj4LLv0NJcYdSKiPFcPCwUcSkZbg8Xrq/Uwd/y2fjNxVKEnhdU5So+3ZvP4mRiNAo91ChujNhhWhTVZsovf/inbTaoypg1+TZ0VOi6zwpoWez36oAvl5F0+gIdSUHvtuUqu8hSrIXZOOjV81ANlQnDsmhbU8vwp+PZ1//LtANx0L1bUaFCZLgYzAA1PuCXd0SgXkpvNR/oQAsk8dYzGAEHOoZPA4ucWL+TAb7CIyaRzsZcu3UsHn/uRGLZchQCDQ76dWIPka/SkyTYV4zCog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xKUnwyC/3gqOQ5IDTKfKbE911KLBhciRAlD1Y3QD7PA=;
 b=lJe922hJ/B5rOoE139STwggd1N8o7LZHkUCMzEmOwXGWBtG5DwzqPTy732UuRUGGSsXiCpa4FYTuA2cgAfleXSQKkhC12p8vh0vFyAgoTY03pUBhrPQwZVUs6XyurPPOItqvUG4p0KgUU1MwvQn0SpAZkA9b/UP0Z2dRQk68BTI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6) by
 KL1PR02MB6259.apcprd02.prod.outlook.com (2603:1096:820:dc::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.21; Mon, 12 Jun 2023 03:01:45 +0000
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::6297:13a6:41f1:e471]) by SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::6297:13a6:41f1:e471%6]) with mapi id 15.20.6500.020; Mon, 12 Jun 2023
 03:01:45 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 12 Jun 2023 11:01:16 +0800
Message-Id: <20230612030121.2393541-2-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612030121.2393541-1-shengyong@oppo.com>
References: <20230612030121.2393541-1-shengyong@oppo.com>
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To SI2PR02MB5148.apcprd02.prod.outlook.com
 (2603:1096:4:153::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5148:EE_|KL1PR02MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: 974a3f92-7b30-4a0c-3107-08db6af15ae0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kJRww8yGYpFgXVhFu5kRZyIIVvgSO4tQpjU+11vfzcuZCsAW/z7fWRh2l3UyFjzk1hibJG4Up2kX2ailmQpSb0IgsVDRi01Fw27ZrQdOVa6ZZIAvPbDp81ts95jX4d5MsQs8Y2R/ZUuga/MSSlEKGQDnRelttm5Yr6vpjLArNVyROjPrR3hRy/CGksY7ayBVjfwpai8LNew5D+WPvBjoXNHckoUtFfXTtcTKs2EEDpPP4HIc2MjzGJz4mToNXzRj+d4j11O5HR7am2OW+2ORMOiMJwYc2KgVdeyl91EruUmRuFC2JAOBKw/N2G/dGvDsW16/PW5gwLHoTuyRHNL3qYRGahjsMvYaqltTuOkfNkkAW39A78W+pZMh4StM/0nTvXdGindKFL++8nrsByxrDUCCTsYx6irnMzo7r7ajuRcRxdFkLrB+YK7OouyufoQFWMPn/x9endIid3MHl4+bzbPxby9Luzztfblgcnw9SFRqrRyFelqI+CWL7ycd8nYlCEo0iryETp80X4m3WAuluGL7AE+XMFn/XpiI7R53wAw02W4Dqf3NlVHDCAwHOq2YWORIh4ap2nsSwWIVayxUxhpsQqaVeYnV/gILuDmyX/9hBDiyKEcllMcDx8v+6lF9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5148.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(451199021)(66476007)(66556008)(8936002)(5660300002)(8676002)(36756003)(66946007)(4326008)(478600001)(6666004)(41300700001)(52116002)(6486002)(316002)(38100700002)(38350700002)(6512007)(6506007)(1076003)(26005)(186003)(2906002)(107886003)(2616005)(86362001)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SEC8H9JRq5/89BmcTRPqKuolxfgIyDYtc9GaWeDy0Yh/Z+ZnVOVJ9VSu9WjE?=
 =?us-ascii?Q?CxQcmy/Xp0QlFMJ0bPMkiQN8L3xxjnaZU738tC18Mke4Q/pd2iBNXMCm4PJ6?=
 =?us-ascii?Q?Gm4ZcRjYrM8xAnGLCkAkbwQuQFpxPt9wcw+HzS/NQqvblKqvPWXhi0W2Q82H?=
 =?us-ascii?Q?kR/sPaCL3ryScDppNlKJRmy6/Ct2/ig2RgCCUGa7U/vX9rzU9TLnRUBfNqpg?=
 =?us-ascii?Q?6tL20btWBBtJ9C25lD3TLHwRanCWcnzqCiCZrz2jOD9/xpv6reRMXXJ3gbXi?=
 =?us-ascii?Q?fXrdwRPe9HiUa6K/7674EY95VgKrscHfOEaAbHFOoYPV5T5XoLuH6hMoqvd7?=
 =?us-ascii?Q?JxQX+Y/1OS3eO3z9y9u6G9miot82LHks3OaWzu7dFNJxf0QBO/wpsYvScZuI?=
 =?us-ascii?Q?T5GaqE93j13F5JEuMb+EsPE9o1pD0IBag6OfpCSxtJqVIXRCrI388vqqjKty?=
 =?us-ascii?Q?r52UEBvITrpIV7nDwQHBfJOtAW4D3+K81rOBzBDuXsEkvhCqLWEeFbvct/kx?=
 =?us-ascii?Q?WsZfatyRZmJHz+4ZmxsIfxKDKE1P4n+/eyUPfjCL2/g7M9jlbr8bQwnEnyjN?=
 =?us-ascii?Q?kqNXa/s1rqo2kCWLSx+qb9h81c2Gwx7eTTNWt6ffyoQbfbhTEMb1TGdjSJ08?=
 =?us-ascii?Q?mMdwc8zzqV/c3q7CIaqkPieLWF7xdHeMjb7hUyxB1Et6IeEO1Lc0KHIxo9+D?=
 =?us-ascii?Q?p8so1AP5z9heaeFXAczQKpk6e05vB/LKHZvwqVfCB6yBpyf94daPYWeGiRF3?=
 =?us-ascii?Q?OWz4rmzPBDoD/qy/nhR4wyAbKtcfAvcB9IPbDv9iELfuf6Y1sN4IPzw0HCv1?=
 =?us-ascii?Q?9ReMzhy4fnC5COEUX/ixmMMAk6T6Aq6pOiiIc1iScKPulWidwMyzCrfg0ml6?=
 =?us-ascii?Q?tUaHabj/SwymgzlryM5I9QsRYVSOWCSkzySkXjIu8fV4zLKtG9WyeiALYDq0?=
 =?us-ascii?Q?h5Qz6mW824krrLhQ7eRAZFtVycDcmX7ouLIpoKHPJWt2SlKjceRxmAFJG4KO?=
 =?us-ascii?Q?bBsUGk2pODrRrQvTZfN6QRB/xvtm3Ss0OUVlOQGiSHRnd0eXD7CWgTaqSVZY?=
 =?us-ascii?Q?2k7u3Vi0AGSosOxsEHiTVe0M6o6qzHHHJIS5ayXxAjg/tT+/FKCScdfwv7Br?=
 =?us-ascii?Q?JtTRerg58I46HnTyVAGTJdF8b6SlO54sWMpubbzjjEdDiqpbLjgYbRg94OTU?=
 =?us-ascii?Q?uc3fp2s2E93OOccfEm/Yhj2flmG5lYWbN1afinskI0VbH/hNHu2uH6KQhqEV?=
 =?us-ascii?Q?NRxti5Aqn0u6RuOS5YOfK6D2keNnNanujX3rxFoyOoQO52WdcMHu+vKoz2sl?=
 =?us-ascii?Q?tEYDSBcHReYx/DtkNveR89+6sdPzJ45jzgbf5+hDiodG+zm3nXCzaCLcufMv?=
 =?us-ascii?Q?TUkCc/PEAp6TcVbR1lvLwIVZMI+H6VOGmQnvJW7MpD/CpxLl8oQLAwI2YUzL?=
 =?us-ascii?Q?ObI9sCQSjWyFw+Je9SEEgNzDCTI8DFBsYVea4TflMyxdizKc91DUGBJjdPhS?=
 =?us-ascii?Q?lJebkzqNX/I72XDPwg/BuZGMcOxkC7oQ4Uw97NxqiZ3WHaK0lnv/jV2jSx/K?=
 =?us-ascii?Q?ZWJpvlGt1U54DAVdNoWyV4/fuIVMoAwKax1BjokF?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 974a3f92-7b30-4a0c-3107-08db6af15ae0
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5148.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 03:01:44.8760 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IDUJGWFcQWIbiauI+Ynd+9XGcpaT3uQaOY/JM+1s8oXZUKyNZ3CfJLFX68+HTq+EcD0UjbPeq8c0pvReG4O4VA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB6259
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch adds a helper function to check if compression
 level is valid. Signed-off-by: Sheng Yong <shengyong@oppo.com> ---
 fs/f2fs/compress.c
 | 31 +++++++++++++++++++++++++++++++ fs/f2fs/f2fs.h | 2 ++ fs/f2fs/super.c
 | 4 ++-- 3 files changed, 35 insertions(+), 2 deletions [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.54 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.54 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q8Xof-000MRd-UP
Subject: [f2fs-dev] [PATCH v4 1/6] f2fs: add helper to check compression
 level
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
Cc: ebiggers@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch adds a helper function to check if compression level is
valid.

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fs/f2fs/compress.c | 31 +++++++++++++++++++++++++++++++
 fs/f2fs/f2fs.h     |  2 ++
 fs/f2fs/super.c    |  4 ++--
 3 files changed, 35 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 1132d3cd8f337..63a496137ebe7 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -55,6 +55,7 @@ struct f2fs_compress_ops {
 	int (*init_decompress_ctx)(struct decompress_io_ctx *dic);
 	void (*destroy_decompress_ctx)(struct decompress_io_ctx *dic);
 	int (*decompress_pages)(struct decompress_io_ctx *dic);
+	bool (*is_level_valid)(int level);
 };
 
 static unsigned int offset_in_cluster(struct compress_ctx *cc, pgoff_t index)
@@ -308,11 +309,23 @@ static int lz4_decompress_pages(struct decompress_io_ctx *dic)
 	return 0;
 }
 
+static bool lz4_is_level_valid(int lvl)
+{
+	if (lvl == 0)
+		return true;
+#ifdef CONFIG_F2FS_FS_LZ4HC
+	if (lvl >= LZ4HC_MIN_CLEVEL && lvl <= LZ4HC_MAX_CLEVEL)
+		return true;
+#endif
+	return false;
+}
+
 static const struct f2fs_compress_ops f2fs_lz4_ops = {
 	.init_compress_ctx	= lz4_init_compress_ctx,
 	.destroy_compress_ctx	= lz4_destroy_compress_ctx,
 	.compress_pages		= lz4_compress_pages,
 	.decompress_pages	= lz4_decompress_pages,
+	.is_level_valid		= lz4_is_level_valid,
 };
 #endif
 
@@ -477,6 +490,13 @@ static int zstd_decompress_pages(struct decompress_io_ctx *dic)
 	return 0;
 }
 
+static bool zstd_is_level_valid(int lvl)
+{
+	if (lvl < zstd_min_clevel() || lvl > zstd_max_clevel())
+		return false;
+	return true;
+}
+
 static const struct f2fs_compress_ops f2fs_zstd_ops = {
 	.init_compress_ctx	= zstd_init_compress_ctx,
 	.destroy_compress_ctx	= zstd_destroy_compress_ctx,
@@ -484,6 +504,7 @@ static const struct f2fs_compress_ops f2fs_zstd_ops = {
 	.init_decompress_ctx	= zstd_init_decompress_ctx,
 	.destroy_decompress_ctx	= zstd_destroy_decompress_ctx,
 	.decompress_pages	= zstd_decompress_pages,
+	.is_level_valid		= zstd_is_level_valid,
 };
 #endif
 
@@ -542,6 +563,16 @@ bool f2fs_is_compress_backend_ready(struct inode *inode)
 	return f2fs_cops[F2FS_I(inode)->i_compress_algorithm];
 }
 
+bool f2fs_is_compress_level_valid(int alg, int lvl)
+{
+	const struct f2fs_compress_ops *cops = f2fs_cops[alg];
+
+	if (cops->is_level_valid)
+		return cops->is_level_valid(lvl);
+
+	return lvl == 0;
+}
+
 static mempool_t *compress_page_pool;
 static int num_compress_pages = 512;
 module_param(num_compress_pages, uint, 0444);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 80c783215b5a3..1b17bbe7e8656 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4236,6 +4236,7 @@ bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
 int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock);
 void f2fs_compress_write_end_io(struct bio *bio, struct page *page);
 bool f2fs_is_compress_backend_ready(struct inode *inode);
+bool f2fs_is_compress_level_valid(int alg, int lvl);
 int __init f2fs_init_compress_mempool(void);
 void f2fs_destroy_compress_mempool(void);
 void f2fs_decompress_cluster(struct decompress_io_ctx *dic, bool in_task);
@@ -4300,6 +4301,7 @@ static inline bool f2fs_is_compress_backend_ready(struct inode *inode)
 	/* not support compression */
 	return false;
 }
+static inline bool f2fs_is_compress_level_valid(int alg, int lvl) { return false; }
 static inline struct page *f2fs_compress_control_page(struct page *page)
 {
 	WARN_ON_ONCE(1);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 8fd23caa1ed99..023981824d240 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -606,7 +606,7 @@ static int f2fs_set_lz4hc_level(struct f2fs_sb_info *sbi, const char *str)
 	if (kstrtouint(str + 1, 10, &level))
 		return -EINVAL;
 
-	if (level < LZ4HC_MIN_CLEVEL || level > LZ4HC_MAX_CLEVEL) {
+	if (!f2fs_is_compress_level_valid(COMPRESS_LZ4, level)) {
 		f2fs_info(sbi, "invalid lz4hc compress level: %d", level);
 		return -EINVAL;
 	}
@@ -640,7 +640,7 @@ static int f2fs_set_zstd_level(struct f2fs_sb_info *sbi, const char *str)
 	if (kstrtouint(str + 1, 10, &level))
 		return -EINVAL;
 
-	if (!level || level > zstd_max_clevel()) {
+	if (!f2fs_is_compress_level_valid(COMPRESS_ZSTD, level)) {
 		f2fs_info(sbi, "invalid zstd compress level: %d", level);
 		return -EINVAL;
 	}
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
