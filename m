Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A97672B59C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jun 2023 05:02:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8Xp3-0005de-NU;
	Mon, 12 Jun 2023 03:02:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1q8Xou-0005dX-3b
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 03:02:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oG92vvId03jcIqR+clv2OcovvvNDrykZIFGmMQSR81A=; b=YYYyNgYpq4sB9YVG/HtfF4MRlp
 xVi+5F2eKGdGjSkTnoELd9bY/IMdop/zEaHPf+JsA7uXP3HZD2GmOK7G0P5gZERo7FNZB8pGkmYoa
 8FTb+ZFRQK2SHpH3mWXjByuKfAAH0bqfJcPCAGEj2CN3hHNC1fNIEGJYD8XMqKIXNKS4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oG92vvId03jcIqR+clv2OcovvvNDrykZIFGmMQSR81A=; b=StmMWsTBr7WfFWypxLryYBdzcB
 cJzbBylh/vgBbUiImaMlexdnVLB9TrSDEqTz+1JSA63EG+vDBVjQ9x3E0THK46dIZ0c25ckZ3aLct
 lXgFInuFkMTon3Gt0XVkriSccHJlE1yL4CuTHkNmG+uNpUuQklko+npHKv6mSv9vHzzw=;
Received: from mail-tyzapc01on2054.outbound.protection.outlook.com
 ([40.107.117.54] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8Xos-000MRd-Qk for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 03:02:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Hi8ouJTf2MQiqXpofTRTTLVLVXGl5wPQfflWzYzIRha8o9e6xTT3D4fiq/KezJZYVXYA7yXUt3TZBTP+PF2ma+oaUQ4IMe+LndnJa/pRI2Etk6aR0vnl0keeglGejvYDxMLzKQ/V0Egt6N8hTvYe3kjOmgGqnBmR/KJo+x8fGQti0Gp8RpyX/ZWFX7g+D7S+9t+iK3hkOEhOQNYCpvRTWgsmwl3nyZYW0sIkTWYulzrGRhaKEM2+wMKkDkxBK1NIk7gGRLtwlFbKCdnuVB/BwLFEhYaj2WLNLbuvaaPHPOAY6MjtqrRFyi78kZpdhqiv3I9otQrvZc3lGY/xdlc12Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oG92vvId03jcIqR+clv2OcovvvNDrykZIFGmMQSR81A=;
 b=TOX9WPIE6RsL/kiJJV6Y8kqrmQ7mqepThM+3IfaTmOfrZsmDfqUA1o2gqQYIzeXUQS38sjYX3Rl6fxEgoO8o1U3ZfngrH49WyREmmA0XU/FHV4t5OHYZTiB63+iTXG3PSQZCyNo6+2SkN+xfUVQuYnKD1JFRKcY/RMJ8sOQogEzu+BO03gC2RbCEVQFApY7EGmPfDIZ9ZsTxAbZppStifl9YyuAEYvj9wmJZQzsiSiaUVQNW6Vz/soPwtjjG560o0gwVaYJna9oz6OTH/ATXlvywvOqMqcfubnrZONCZRYbkQsplDc42Lo6VaLt0X+vcwQJv8fz7K71q+JQDBvkX0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oG92vvId03jcIqR+clv2OcovvvNDrykZIFGmMQSR81A=;
 b=BVe3vZ4VN3WYpIMIpoupjVwHcyWuye7e6lYu5JxaboFWs6sKcJs0IwM57oPncXYdclQzQ9vXN7tNz/blVB05ZDR2YIekwqZmG785oAyGTg3VVGAbgxu2ayNFoBV3WMtnu1YRQbo9dv87GOl9WLwc1/bdiERAAO1L40GLVuleeIA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6) by
 KL1PR02MB6259.apcprd02.prod.outlook.com (2603:1096:820:dc::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.21; Mon, 12 Jun 2023 03:01:47 +0000
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::6297:13a6:41f1:e471]) by SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::6297:13a6:41f1:e471%6]) with mapi id 15.20.6500.020; Mon, 12 Jun 2023
 03:01:47 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 12 Jun 2023 11:01:19 +0800
Message-Id: <20230612030121.2393541-5-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612030121.2393541-1-shengyong@oppo.com>
References: <20230612030121.2393541-1-shengyong@oppo.com>
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To SI2PR02MB5148.apcprd02.prod.outlook.com
 (2603:1096:4:153::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5148:EE_|KL1PR02MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: ad0beee5-9e97-4c5c-f3ce-08db6af15c9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u1FR4hsGilKeqS8eUBauInsZCQyAPOUBukCX/sbthAhl3783utJaPBV7B7g7Yxs0VxkkXMaL5C0GhCegy3ZsD4LNv7zD6gTAA6DjlrqN9Cd4q/euUG2ALq5XBqIGenC/PGT57zCYSBcAx3SMmNP9D4V0sUTZTHp2SCzHeoXUiKBrEQw6UFj//LcwWcNHAjrG49zS1j0ptsVmw1BLWg9AZzV9eabbkKBTyQmoKM0hvNGxdN7qEgWQ/K9P+dNWoJNg7m2ZqqOAnJQ7EQojdM9sww+mrSy9/Izte+WPQWl5rsM/8kcPDawZALPgYdS0xNfCIMVMSRPR7nfLMBZd4XP9GdM833cH8n4cbKi8JoLCu5PjzDRTISfgAqpb/B/pwWuMKuUeUeY5A1F7HEfPY5dSr96nuZeAGGRYg+OWS2zVl1f3AZzVas4VVvcXtAi/LD40bIqNdWf1YD1BmnOeRvcXBiQejS9sbiSmpjnIYhm3D16pzsK4+LzUGce5t928+N5I6wMEBVey3Pnl7l1CGo/fPUolYH+CWaGKK0mQt3yX4cwdexG+XB/AFBu7ED4GL5jyrK70TPVs3MwB8SME8R2J7pFeVT9e08HfpzJU39IcYgkzqdV3FM9dVGZi+SwFFBSC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5148.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(451199021)(66476007)(66556008)(8936002)(5660300002)(8676002)(36756003)(66946007)(4326008)(478600001)(6666004)(41300700001)(52116002)(6486002)(316002)(38100700002)(38350700002)(6512007)(6506007)(1076003)(26005)(186003)(2906002)(107886003)(2616005)(86362001)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iGaSLtmoQwSpPOwmZZIAp2yQGBQcbybmbdbb1x30Z10K6RgEokG/ngB/r60c?=
 =?us-ascii?Q?2orGuBQjQAPWZGl3/9FM2wSnxq2676x+k2meMnvAgEaMbR/v3KkvyDOE3llm?=
 =?us-ascii?Q?AMrYbZvADcID9rvcUVZDGCishDtlm/1SNNFvvuLNQNtUIhowRXXzgZgtmPMu?=
 =?us-ascii?Q?QzjBsHeSBu7PP/t3e6XNQ2NPwHwwYepsCS9OJrj7qoEgxT2Xyw7ud89N0a3O?=
 =?us-ascii?Q?2I9frcYPXrw928kX+gjkn+YrTxjWmP7LWFpX4gtDKjy2Z7S8Af2+219USGaS?=
 =?us-ascii?Q?JSQ5FYoGlPOHz7pUL8812VlcKJgnJ6uENEutUrXuZCAaJdCluZRGI3QnzyrL?=
 =?us-ascii?Q?UcXbKiktqGnwoss5ZlWS+D56vWxkB4SnE7ml7+e/36qSJsNtcHL1TL8oUVuE?=
 =?us-ascii?Q?5CewzPyjpS6ArNbjppLXyLLEh1DKhdK2dzpuXhLh2TRfg7RGctXMUNqiUGy3?=
 =?us-ascii?Q?XARHKAPIk5XTg5zMuPI0WrGFSO9wIrCZN3bSDSc/GehvSEppSWZCpkPr+mDR?=
 =?us-ascii?Q?9IYQsQT9TlZYSi37Pc3n5DnJ0xtAN9K71loQKOG+NkynFT6MAT2eX83EiYnJ?=
 =?us-ascii?Q?+NQEkz9qv5fmgvGnFCfHuyre3GywhuUO7JDdQyWOHCk/r2LL7FE05toT7crS?=
 =?us-ascii?Q?abjURmBaP+RXlaJigbrSn8x7Z4fhlqHTErMgFwcl1g+EUrgfFsP+H/iQw8SZ?=
 =?us-ascii?Q?hPBOXgoS/vtfoDFLEJWFPXZ34gH+yQ6h7RErNzEApXX7h+lJOeiiDODqXNAc?=
 =?us-ascii?Q?zfhzzav0/z0tMCTc9QDYGNwE8mMwNEeTuKrGCCfbS3nl7lLAoTJuvbL+vGI4?=
 =?us-ascii?Q?WPkMT9m5tUKgXm3nXN3PfFdVUbzkgWsf/I6g4pD1RqCKz3mxHDkNMnQSrtU3?=
 =?us-ascii?Q?/9RSI1NlixKU777Idjtl0yAIDFosrEy1afJmAIeA4lSDRp1ZL8d2t8k7TT1u?=
 =?us-ascii?Q?E2NVv+VnDyq9Ll4Y0YKJ2tVzxgppnIeSvZaNUOR6sJ5813eDb5GFX4qxvVUc?=
 =?us-ascii?Q?2cp2paqq8+jbeX7OYiQ3hYtZ3SLV5ir9eh8pBZOTuROIuJrers5ZQHAcsOAT?=
 =?us-ascii?Q?aAYPygBgiDj3aox45g9SvRSgRqSaYDSjTGEycsgNdmYpHXL5ady4Qb+nG8uH?=
 =?us-ascii?Q?Q//sS7dRcrRiUfkL8nSBN9bcvs4lsu5toeudzBGL1JMSaX/1wRcqM0F4V9Dj?=
 =?us-ascii?Q?0bjRxG9w8fsiQYZ36zZp3B4Tqf3wbhiAW8P0K7XBfdux3BTvAbA+5I/mk4GT?=
 =?us-ascii?Q?qM/gPb7BGGPav+4aQQD0hbRgbgEVYXJmvbAWCEldR2/9KxwK3E7tDx+Zr1i6?=
 =?us-ascii?Q?if1/C+lSmgVsx8dB24obEXsNFp60Oz7CCsv8/ftfmR+tFtDwrrDjGz74lcy6?=
 =?us-ascii?Q?OTDJHOPlk5OOjY3hDH3NQVlKCUYdscwVrF0ZZjjPRzz3+sqnKypLsUBSOhbx?=
 =?us-ascii?Q?2TiStN1r9WZGryvcq0axKDOL8zWm+9ZynhCHDIX55t+yIk+1ivdEZ7vpO8uV?=
 =?us-ascii?Q?qE06wnTrGTiOmqB+MySr8w9cMyTYg9SfWeqWB6q/4kkQBoto+QNKoOIHdkEh?=
 =?us-ascii?Q?anltCA1O2OrV/25S7oQyT4w/x9O7kucb3FGCTOAn?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ad0beee5-9e97-4c5c-f3ce-08db6af15c9d
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5148.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 03:01:47.7954 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: c3Ta3GdLTDfWVSK7YexMSkibW90bqrc4XfgUJPKI1gpMltrhVMxjl1M7zld3gPkkL2MGG+3rfS0B28+5LytBSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB6259
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch adds f2fs_ioc_get_compress_blocks() to provide
 a common f2fs_get_compress_blocks(). Signed-off-by: Sheng Yong
 <shengyong@oppo.com>
 --- fs/f2fs/file.c | 23 +++++++++++++++++------ 1 file changed,
 17 insertions(+), 6 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.54 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.54 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q8Xos-000MRd-Qk
Subject: [f2fs-dev] [PATCH v4 4/6] f2fs: add f2fs_ioc_get_compress_blocks
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

This patch adds f2fs_ioc_get_compress_blocks() to provide a common
f2fs_get_compress_blocks().

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fs/f2fs/file.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 23c68ee946e58..f8aa842b5d233 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3376,18 +3376,29 @@ static int f2fs_ioc_setfslabel(struct file *filp, unsigned long arg)
 	return err;
 }
 
-static int f2fs_get_compress_blocks(struct file *filp, unsigned long arg)
+static int f2fs_get_compress_blocks(struct inode *inode, __u64 *blocks)
 {
-	struct inode *inode = file_inode(filp);
-	__u64 blocks;
-
 	if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
 		return -EOPNOTSUPP;
 
 	if (!f2fs_compressed_file(inode))
 		return -EINVAL;
 
-	blocks = atomic_read(&F2FS_I(inode)->i_compr_blocks);
+	*blocks = atomic_read(&F2FS_I(inode)->i_compr_blocks);
+
+	return 0;
+}
+
+static int f2fs_ioc_get_compress_blocks(struct file *filp, unsigned long arg)
+{
+	struct inode *inode = file_inode(filp);
+	__u64 blocks;
+	int ret;
+
+	ret = f2fs_get_compress_blocks(inode, &blocks);
+	if (ret < 0)
+		return ret;
+
 	return put_user(blocks, (u64 __user *)arg);
 }
 
@@ -4239,7 +4250,7 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	case FS_IOC_SETFSLABEL:
 		return f2fs_ioc_setfslabel(filp, arg);
 	case F2FS_IOC_GET_COMPRESS_BLOCKS:
-		return f2fs_get_compress_blocks(filp, arg);
+		return f2fs_ioc_get_compress_blocks(filp, arg);
 	case F2FS_IOC_RELEASE_COMPRESS_BLOCKS:
 		return f2fs_release_compress_blocks(filp, arg);
 	case F2FS_IOC_RESERVE_COMPRESS_BLOCKS:
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
