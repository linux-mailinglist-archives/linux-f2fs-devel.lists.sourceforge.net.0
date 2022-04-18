Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 99964504CAE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Apr 2022 08:33:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ngKxO-0003A8-L9; Mon, 18 Apr 2022 06:33:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1ngKxM-00039n-KJ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 Apr 2022 06:33:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lmPWqmtS7iPD3Gnh0idgaebWXHkUMfU5HptJ3FmgFUM=; b=DTG5DciEWXRz21K69hDbFjcwyQ
 ZLZxAfYajmXNovPq1xm0FiuaSetP+jU9wRX/SIvgL1aldRwj8UHNtMIna9ztHyeRg5zCjhnw+nJBt
 DNLhF31t7mBzwlscLeB0GyElmBilFQupeRUJG4KlUmL0sGNmx7q2q+A+RnYv6MYeBp8k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lmPWqmtS7iPD3Gnh0idgaebWXHkUMfU5HptJ3FmgFUM=; b=G3aiAl9hie6d5Ok8Vw+AaDgOSO
 OtZhkrZMXJGltbrUtohcl9qRMNJFB9g0zEzZmiRxzfVUX/crIuXyZHC5ndzBgMMAuqR3+RulJo4XT
 /pFUH5dZ5j0u5A3CaloXuQtvnYtb+y7LsWC+3Rt4l8DJHEXVFy6iQI8+P+T+1Jw4WgW0=;
Received: from mail-sgaapc01on2100.outbound.protection.outlook.com
 ([40.107.215.100] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ngKxK-0004Ri-Ro
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 Apr 2022 06:33:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cKO7Ce/RYFyB88bpO0GkMaarYlkRYqPNY1RbhUPADi+z3XNmy6n2EXO1HtyvN8Gx5EldscXLYJsfa69FqjHdU5Wp38Iic0A2S4X+bnNBhPbA0O6ZMdfuCt5OJRspyA0a6PT+e+7GkXB3sHOdYgbrWJj55mbn0ausVmezKm6GznhEoIGqF3HFVURmzAzokMvG+8wa6dsoE5rKPlf2Y4xrvvNCnn4s2FHgdrpwvjg6N0dqqJ8j9TNtZReiEW95I220vjdFO8ZEsCphfuAJqJCD1j5XSLKTkgpH4S7NfuNu+3iGEAF+F4WuJIwQVqc6bclqUeoo/zem+q8s7C0oTgLlLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmPWqmtS7iPD3Gnh0idgaebWXHkUMfU5HptJ3FmgFUM=;
 b=V9QaefoHQk2JumAu51SnFIBDoBY1d14+yaKmf+sTTlYDial2zLYLRgQW3d1YiClag7089/5K2PhO8cRH2gED1fJFWXLvYDsQpOEKGsqz3AvJbtmuU93BzEkf0d8MINYwosOU6XarLuM3kxLGxXHg08vPxOup1+Kqh7ShdhCZMU8IUBJT7UkplgnVrxMxMdJZ3qOYhc6k30r6OHRwyc+wXvb0WyGLtlN3xbMmOUILpry9zaELScqyYd+JLNIS+Y4YEB8orEHaeyk6TzLizEbCShmlLh3T3RjrtSK6mCDxwGNgE0P/AmRe08Gqgs8BJGY6qNpwfn/kTuaezPo9cipk2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmPWqmtS7iPD3Gnh0idgaebWXHkUMfU5HptJ3FmgFUM=;
 b=C/L3WjGfxZn2hFp5DKUtWSHJnyuciZNTM/Yi6nrZZH8o0qAfDf7TDPoiJJ/kKBy6q7KjH4dWzJ/wNlXcpd6o/lEsYRHziajoPI/ubdBgTk66mUxBkhAEL7UKb/f4l2wHRV/E2ZwRU61kkyQIvbJ6/Zjp0Lq3yJp6v+c3upRflbQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by SG2PR06MB3095.apcprd06.prod.outlook.com (2603:1096:4:75::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5164.20; Mon, 18 Apr
 2022 06:33:35 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::f0c7:9081:8b5a:7e7e]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::f0c7:9081:8b5a:7e7e%8]) with mapi id 15.20.5164.025; Mon, 18 Apr 2022
 06:33:35 +0000
To: jaegeuk@kernel.org, chao@kernel.org, tytso@mit.edu,
 adilger.kernel@dilger.ca, axboe@kernel.dk
Date: Mon, 18 Apr 2022 14:33:12 +0800
Message-Id: <20220418063312.63181-3-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220418063312.63181-1-changfengnan@vivo.com>
References: <20220418063312.63181-1-changfengnan@vivo.com>
X-ClientProxiedBy: TYAPR01CA0068.jpnprd01.prod.outlook.com
 (2603:1096:404:2b::32) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a4762591-fc7f-4d43-6dfc-08da21055d66
X-MS-TrafficTypeDiagnostic: SG2PR06MB3095:EE_
X-Microsoft-Antispam-PRVS: <SG2PR06MB3095EE50EA3F4D13F789B000BBF39@SG2PR06MB3095.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sseW0M3Kk4hb3ypYTyW6FPA1nW5r4IyDTKKDa/H3YtlwXl+/DgIsJuo93+nBSumPbNip8pb01Ma4XdfoO5FWlYoGDN7tikcpfYJCP9IYfI0EiqxPTBG/opa4VZUHXAZMsXmUYmMUKypit5Wk32nJTm7WJeEisW/CbOz5P8+/Dimnt+2DKBIAntCjtx4f+mcoXVojLuM4iQGilHx76Yp7YLNTJr8o1YPkdeEaE273drt9RDJnQ6VzUBU9Kvqr4WuddSwx2iL8p45TIQMfSKQWshtFB5K5cPuMeWyVpW8hDkCg1rTaEv19klk+raR9lAjvQ03Pm6yLUJcE6Qc1iJ0Wt6bZgAKl3VfwqiEx06uSZkT99CPmGuUnEaznirn2d70PlBK3XYWzeA2KnJmpwRK73Fo86hRgwrVRnbi1VXwfQQK9QvBBkqT8CTCoGz6lz0rZ/BbAzjOFU6+hP3PjFLgc6cuR/3bEITRcsaHxO3bQHX6fraT76417xBySDGGMQR+USskx7Sm+7GzW6qiHamwrv/H6rhReMOT1EVMI1mu78BxPpYh67NjdMFBdfX8ReKwK166XVIIFovfAMGUMndQ0XFkFm8EMp5n3Xy9nB+dM1RYnAd7m2Mc+9/scFCXTmcw3
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8676002)(4326008)(66946007)(2906002)(6506007)(52116002)(66556008)(6666004)(66476007)(2616005)(508600001)(5660300002)(107886003)(86362001)(1076003)(8936002)(6486002)(186003)(6512007)(26005)(36756003)(316002)(83380400001)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: MXgTOAXw+GKgHjF8rbzXwyBdLuCfQjIdKEpnkbNFzB7BcqpdlZOuAur937EQVZDgCzZHAnYLcDYqR8qk2ZIMcPD5V+WNo7EznpAnBJ+oA0rjatP938pTc6SuArKhF8W4/igT/f/1pB4F/xpe4xikAlKdjMx/sU08XdghnrwnWWdjYpQo51X5IrBhHM4MWuPrfMrxw4FW4s/msHG+4jrxKSbWTp7AHR4VKT0wkSIgaaPiZbStdgin/SEXhCzA5+yX+W6b0GAfiKAP1bmTEvoHMjfLFmXPRvEd4WIVFhXoa1dL5JNVP/00G0T3RWUzxw3HQGIG/OaiVO4dW2I2G/acRoHBYUQId+22Vo2j5fgPsWz6DJZcHyK65an3GOR6JuVd/3lmX2GI5FNcWB9qcXeruSMyFx2ggxcPii0C6WH2asA=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4762591-fc7f-4d43-6dfc-08da21055d66
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2022 06:33:35.4549 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UIrz7dDR7YMVwf7FqZ7P7Px9QO/ul1bzASoJ2B3EAeftllGgHaNV5//V5pxrwL6MT0lWNgoD/1hf04y70L+Tag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB3095
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Notify when mount filesystem with -o inlinecrypt option, but
 the device not support inlinecrypt. Signed-off-by: Fengnan Chang
 <changfengnan@vivo.com>
 --- fs/ext4/super.c | 12 ++++++++++++ 1 file changed, 12 insertions(+) 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.100 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.100 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1ngKxK-0004Ri-Ro
Subject: [f2fs-dev] [PATCH 3/3] ext4: notify when device not supprt
 inlinecrypt
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
From: Fengnan Chang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Fengnan Chang <changfengnan@vivo.com>
Cc: linux-block@vger.kernel.org, linux-ext4@vger.kernel.org,
 Fengnan Chang <changfengnan@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Notify when mount filesystem with -o inlinecrypt option, but the device
not support inlinecrypt.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/ext4/super.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/fs/ext4/super.c b/fs/ext4/super.c
index 81749eaddf4c..f91454d3a877 100644
--- a/fs/ext4/super.c
+++ b/fs/ext4/super.c
@@ -48,6 +48,7 @@
 #include <linux/fsnotify.h>
 #include <linux/fs_context.h>
 #include <linux/fs_parser.h>
+#include <linux/blk-crypto.h>
 
 #include "ext4.h"
 #include "ext4_extents.h"	/* Needed for trace points definition */
@@ -5466,6 +5467,17 @@ static int __ext4_fill_super(struct fs_context *fc, struct super_block *sb)
 				 "the device does not support discard");
 	}
 
+#ifdef CONFIG_FS_ENCRYPTION_INLINE_CRYPT
+	if (sb->s_flags & SB_INLINECRYPT) {
+		struct request_queue *q = bdev_get_queue(sb->s_bdev);
+
+		if (!blk_crypto_supported(q)) {
+			ext4_msg(sb, KERN_WARNING,
+			 "mounting with \"inlinecrypt\" option, but the device does not support inlinecrypt");
+			sb->s_flags &= ~SB_INLINECRYPT;
+		}
+	}
+#endif
+
 	if (es->s_error_count)
 		mod_timer(&sbi->s_err_report, jiffies + 300*HZ); /* 5 minutes */
 
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
