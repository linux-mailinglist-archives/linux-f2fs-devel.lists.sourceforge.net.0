Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E37547235E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Dec 2021 09:59:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mwhAy-0004Cz-JH; Mon, 13 Dec 2021 08:59:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1mwhAx-0004Ct-2m
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Dec 2021 08:59:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u+8qiHbXld9BMVq9fp3yesmpTkz/5sKJR15uPnEcf1s=; b=SuF1o64+6LgwInUHrEWc54z0Bm
 JZLzk5sskJec5lwG7yD5n98aW54tyiEOrsPeyRWqmYmZHNld1ZZNdjfiOFmzCblVA/7yf7n5yYhV2
 9w+ZdvdbhRz3w9PaGpr0mYq1HnRKWsRYGHWCw+kf+1YdZcS/GNJ3Pq0oMY3e42lIqQ/Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=u+8qiHbXld9BMVq9fp3yesmpTkz/5sKJR15uPnEcf1s=; b=e
 y9Z51OnAAC0+l6DuCRf4g9KlOzKGOuCTgTlzI338YgFFmPcecqdUSV54r8EmeV3UbbzhrFzi8YW9L
 PJ78qEGh4UDFIwVKyZE/lJEE1e1pwdBbJKrzA6eN76cqfO/yR4CJUbyGNM1Ea8YWUDOa2XxMj+N86
 kWUxgtISgg13po3Y=;
Received: from mail-eopbgr1300108.outbound.protection.outlook.com
 ([40.107.130.108] helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mwhAv-0001IN-A1
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 13 Dec 2021 08:59:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hkKkPA95jHFPxTQTTt+OcvO2PEgfJf4X2+vQFGuauu/piUCZRj47rfvS9Hq1V6psBiT4Vptvk/ns5p/n3gAdjUEdTKVPbxcp8EcQHMSOMv5cRn+kwlzKM9ocCq86tZikgyh4bSSROQ+HNQKkdKDbOsM8bWJwjyPqyIpEUXQ5CcMzsUeZr0zSawr//3cb2BStsoM3+L6INbQ+xNreX3iajNj4+/phLbmCE+7nIZ0G6TwFdX81G1d+BzFbo1GEhStijTNyG0ulVPWubKqLDRu5RT9nS4KYpSS6pJU47lKFYEvJJxEXmx2E9QMNjxkp+EYL7qtUY0lJmmxXqFPZv6EXew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u+8qiHbXld9BMVq9fp3yesmpTkz/5sKJR15uPnEcf1s=;
 b=KE7aRZLTFOO0mVKkV2OF5UG9Kg9lFTiiD8W1FOFsEbmwEl/5Q+xs/vUNb3qivP8WHt0FWvdOSvM/VPNSluVHQHln+ZgPvtfXJBCh10QgFmzyWZuN5wawAAKUxdOWf3Rcpr1YbI3A8O0VY3KVvqx0X2fnognf7DAMtv7C2AwkxUHSnbY8x5Ydw3zlF75eBggVIGOBU2Hdz9hJr4iIulP+xmewDUuWDXQmVnfLRfeGL5KaBY/16CMZLBlcvN7n5jVkGlUPRXXgq6q2AxY+jN+OHnOJDHFeYzcemgcJlz4Lkx2j7U5unrzZE9JA3XDoOh2WFJvhrMU+odneC+5HSmGIMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u+8qiHbXld9BMVq9fp3yesmpTkz/5sKJR15uPnEcf1s=;
 b=GzAnSPHZlsXiNUyMiR/3ySzuXrsVWJ6Znx2Nmj4f5wKcb3NuWV0X3gSDTusWaCG8boZu6SrDYTkYtoEWGBNGLXXzk0w8r6x4Efb4L94e71V1i35wDWpdMtISWuTndenu03zkDHmfrMu+Jm6jKZS8NcNRGQWYAODv6uyrnt2nXIA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB3672.apcprd06.prod.outlook.com (2603:1096:820:7::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Mon, 13 Dec
 2021 08:59:04 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a%5]) with mapi id 15.20.4778.017; Mon, 13 Dec 2021
 08:59:04 +0000
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 13 Dec 2021 16:58:57 +0800
Message-Id: <20211213085857.8554-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: HK2PR02CA0166.apcprd02.prod.outlook.com
 (2603:1096:201:1f::26) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 19bfbd90-6dfb-4cae-eeb0-08d9be16d053
X-MS-TrafficTypeDiagnostic: KL1PR0601MB3672:EE_
X-Microsoft-Antispam-PRVS: <KL1PR0601MB3672A1EA6012F240D437EB70BB749@KL1PR0601MB3672.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:651;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qQ32PkGJiXPaCw9MG/7SmO4FXMSAyvziCHTLwz7bQaj1c78ERJEO1TNzn2iEAj2xYCL5R7flLMNXq+wVCf6aEhLm4NWw8vMwS1+gp1Dc2Ur3fqv4ffr6ACe8V8arZMXD9dhNIzdoE5IjOe8U981x07a6Z3NCuP+VIpT1md0VgMOsV7oIuIjz9JG6Tb6g0MtZCfStV43dJEs6tR81+bFe7IfQHSjX3OeiADPif06XDpUtay8pC3m+7PHTexZ50zRU980JeosS52dgIkTL/0TBPBcgcZG07JH77G+en10XuCKo8zZVPU8cyVdoVTwsb0R+YIdShZqiW3K8GW2TSPCDb2elICzD2O8jVMGHKXheXFXi9lCvAZgHprWEx8moPA1h30hb32LeD0wn13oN+Wm83mWlhHvJ8cFCIL2G1DLlB3zskDnxFuZANgK8PBhhbhbZFInMYUeyu6JcyuMQhVY4J3eP+OeRrXHj8489HiJL+Q0nieUFodiFGzbi+SnjtH3xg55PkRHCxcbzaWraNeymWS6PpBldAAabW3s0hzq23XWmxXODifJrfkQuF8HtDVE1xqqhcZD1ibB4l3DkcZI65ojbxAe72pHyenR/mpHgBTdyfIDqF9QWAGXcGiXzzThE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(52116002)(8676002)(38100700002)(6666004)(186003)(1076003)(5660300002)(4326008)(107886003)(38350700002)(36756003)(2616005)(66476007)(66556008)(6486002)(2906002)(66946007)(83380400001)(6512007)(4744005)(508600001)(6506007)(8936002)(86362001)(316002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: fWYj0M3/FDsUGd/OMByA0vHeOKQcjsIpmWf5JC5onFzre22fZc0u3bz26BjrHI5sIgZW4eAj6V5h+alU7fxXyc8lo/1IaewX6I/GlKkX3REeULhuM0P+D5NQCyfDHRLNHaD+mGy9U6hMGgirJ7OzxhO1t2v3muB8VkmvTd6g3QXFBx6FPGuLvriYCmW61M0L7hdEJdtLuzh77+JISfYPVXJOITzcaATOnb7WTqqjE+Gq/Uc76depYgWSSyH949/c+P/o1+J6PiXq67JvMYhcbTMEkm5gRCD0clqXbDlmxQFK5pcipW4nz7EQhZ9c51+72IvWw9lScx3VHDaSASGbWDUXpskgCZSVB42PyD3E3fl8jdRp/vcKPeAWhfbM2fT/f2e4K591A1XZWdDX9INRu7Xudoc/ERXOGQ83Kiou5KWR6hBsfsxVyA34H6j6Ck8U
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19bfbd90-6dfb-4cae-eeb0-08d9be16d053
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2021 08:59:04.5585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DLOnJsgAcSGLx2F/EIgjszQVJacGdLHcuL2R+qTKqMasqSZYP0Lw4RiaimKte/6nhKXVFO93q4Fkpmeqh/DxVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3672
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Compress page will invalidate in truncate block process too, 
 so remove redunant invalidate compress pages in f2fs_evict_inode.
 Signed-off-by:
 Fengnan Chang <changfengnan@vivo.com> --- fs/f2fs/inode.c | 3 --- 1 file
 changed, 3 deletions(-) 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.130.108 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.130.108 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1mwhAv-0001IN-A1
Subject: [f2fs-dev] [PATCH] f2fs: remove redunant invalidate compress pages
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

Compress page will invalidate in truncate block process too, so remove
redunant invalidate compress pages in f2fs_evict_inode.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/inode.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 935016e56010..595270646d69 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -751,9 +751,6 @@ void f2fs_evict_inode(struct inode *inode)
 	trace_f2fs_evict_inode(inode);
 	truncate_inode_pages_final(&inode->i_data);
 
-	if (test_opt(sbi, COMPRESS_CACHE) && f2fs_compressed_file(inode))
-		f2fs_invalidate_compress_pages(sbi, inode->i_ino);
-
 	if (inode->i_ino == F2FS_NODE_INO(sbi) ||
 			inode->i_ino == F2FS_META_INO(sbi) ||
 			inode->i_ino == F2FS_COMPRESS_INO(sbi))
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
