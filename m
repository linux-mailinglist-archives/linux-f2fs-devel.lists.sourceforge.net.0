Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C973699666
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Feb 2023 14:54:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pSei3-0008DO-5W;
	Thu, 16 Feb 2023 13:54:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pSehy-0008D2-0u
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Feb 2023 13:53:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=V94TgpZL5DGBpJzuMNrBd+XPKq6hMNFbxr/kxUJI0iU=; b=lh3jhqq/dQ2egB5Rv2XacP69fy
 tY6OtsNG/ue3X8u3yqAg6s7joRpL03hrbZmqDlORbZ/L6vYC3Z5c8KeCAgWxHIVoFtQ5s3hwHiDyW
 R/J/zjgugYezxXWa5GLtMfF4emqxrLDkqNwH5ceregimWhDr2uANCTvV4/t8I6XsmtNE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=V94TgpZL5DGBpJzuMNrBd+XPKq6hMNFbxr/kxUJI0iU=; b=L
 WB6TewoJrXD+sTVGQAcGfl9KZXIZHQcSYZyc5QNZkYlzZqP12et6HVVM0p/jukXv9dS7SoJpacyRe
 5KFuS7CKP1n2J1KmeyhnU/t5FdpYsWsIufypURNPiipgnSgpqM4Ad8KWKPGBZKmaOUYlYFU/YAIZE
 FwHSgM516AAVwEyo=;
Received: from mail-sgaapc01on2132.outbound.protection.outlook.com
 ([40.107.215.132] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pSehm-0000E8-KO for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Feb 2023 13:53:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GNWORg8zY7mWkd4VX2DA1u5tbVJ/0lobP/tjxvKkwoebTjaYeC42/VbK8Dc+AJeHkjHM66GYy3GCemy9m6S4QGqxtW/BJ9bKGnbsMLJIiYFTmNT3aMBdm2lokosIVNnMWiXWDTzY7h9GL92/WdlrKveX1Fz8iKOjeB3OtFggdRY5yLiIm/cdbHTvv84gxIZ/J4k0Xpv21AogSjnYcyzXomzoGlDahKD17Hn0jKJWwHU1s3KZkXFZsxX48DUjn8NQvI2YLypKsHyGbPI8FIiw0fBZ4xRBiZrWfGpdTnLDGwDrbpEpRyrztJ4SJVN3oeG+9uhkDfPTdHENcHkM8fnlfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V94TgpZL5DGBpJzuMNrBd+XPKq6hMNFbxr/kxUJI0iU=;
 b=BSo5ZfS2ZABms23WA2CMQ2ZxII6LtV/W44i11Zy6UWBzUEbcRDyEarh89normTwG8jGHlh8VifbB/3HPiXEQyYTO6cURu7sBdwCQthF+xtW9cV++e19Sjpu1YGrL4UAIHFvM++HZ6zbbJ9IOsF0wV9eGiNDs//0kgRnyJ16k2i7HjWIs6x3taP/fji+SqXIo/gynSr9pI++CYsU8zsCT1uNQsE7SZN7ltvbCiFS9hgiQHnDJUG3JC5BANxOu4o7Jizj1fmKEqiYmTio1x0fyIssdKZ4omsWJnibaNUx2811sscYys7s0Oqqfz9fqROzUJrRrSDHJXsEi+hoplzb+Rg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V94TgpZL5DGBpJzuMNrBd+XPKq6hMNFbxr/kxUJI0iU=;
 b=fR2McXr/jzLlh2A+WEsPzREmEtkEk38HAeKQf8d1yib0lYyhjuRxHRRiJnruOu//k3JKXShvoLBpaQDGlujvH2A7ZyR+x3l2GQw0uTngjFW4nXrKfybRF1VcNZqI07cSn2V491giTluN7fLv6n1fEgCrFfllodHVkyU99Q6/VQvT5A1FP/bDme3oOC2B9vQOdvXQo60i/RZKqxu9inQfM5p61cdlhUbq8N71BkFTlG6iikR7nyxeOi2wpsh5v99OHm6y2im/hHdjr66Xut8qOZVnhfcIcD3tBkGRGAwLxWGZiC80+1Is6pstvnw2sUvklDy4/spqAzPTy1SNhWQ2PQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by PSAPR06MB4102.apcprd06.prod.outlook.com (2603:1096:301:3b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12; Thu, 16 Feb
 2023 13:53:34 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::a2c6:4a08:7779:5190]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::a2c6:4a08:7779:5190%3]) with mapi id 15.20.6111.009; Thu, 16 Feb 2023
 13:53:33 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 16 Feb 2023 21:53:24 +0800
Message-Id: <20230216135324.18406-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR06CA0014.apcprd06.prod.outlook.com
 (2603:1096:4:186::11) To TYZPR06MB5275.apcprd06.prod.outlook.com
 (2603:1096:400:1f5::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5275:EE_|PSAPR06MB4102:EE_
X-MS-Office365-Filtering-Correlation-Id: 8094fec7-272c-4a8d-cedc-08db102531b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ljQlXtqjPjRTtLAp7PaBQzQmT4izjUt5YOcG1ngCvmr6D9WOkHad9zJdMWLlB1+Ta7MvUS+hkVjk+u/Dp+0/yWISxSsmKr7WVDjiqrGBCx0uGkPNHwIRiVzlt/vHZ6sAS0Xxy5oW4I3ouPDXrCvYJuisNmiJx1aPjqYgl9+jAXZnH0Csd0xcJ9dkPdsOy+q+jYzcabbqG5jNXyp+/Ppldo5CPHL+EsUE6wmdGr8fh8Eso/dyDJo5rnQZdlo1gUQBbPRolQeOZnw5iWqyH+JPFm7gi2IDSO04ET0+7/XwyboYaxtgnAHS5576ttksP14CL72cwDqUazYXYZ1ruLISA89x5WS4ejDtio5pKmS23qWUGErdXA3zZKyHRa2QzN+Mw1aH/QTHukgATc/E+uVIhkxzsiBVH4fkeXw74WHp0cESyMLnkdhzRHKJUgrLtwIk+I3e/cKC1AcM/GWwSKiiBaOpUrOhndMRMZUZ9LR0yZWvneBNUyqyfDda6z/FkBL6GxVijsmXm4/2kG0rReuB9fxVMo7Q8xDxTHeYozNgzNV+QxNMjbN/2VGyOfwlGoRY32+y0mat6ovIS80KpYKeDXdppB/DjxB7/TZc7tnhpyRpBS6GupXPO3nFndA1sMkF1HhYNVPtEaG3BrP539MSGVH/FQUwQE7DcklqWg6GrtJQVzAGmVpGcFu0v/6hT0AtjFVxYKClKBYFxhV6mY1IVw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB5275.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(396003)(366004)(346002)(39860400002)(451199018)(86362001)(36756003)(2616005)(186003)(6512007)(6506007)(52116002)(26005)(83380400001)(2906002)(66946007)(1076003)(8676002)(6486002)(66476007)(4326008)(41300700001)(66556008)(5660300002)(478600001)(107886003)(6666004)(8936002)(30864003)(38100700002)(38350700002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hA4T35q5MZdkN3RzlWbFwvGh/WkEqLQh8/jskfEbCqGSSHqrOoWNg2jISwg/?=
 =?us-ascii?Q?E+9KxJcAlFz5fUI5EO89YNClztH4vtIiXme9wpREfL1w1CFyH1M8WLzWxtBo?=
 =?us-ascii?Q?qDAvJXg1ODEz2dGvOT45QqaPFVj2N14odIItX1mA+g+vmX60ED1GxG/N32l2?=
 =?us-ascii?Q?FxIcnIPt8Hv9d6PkmmvQ0lfyi6ve0lk113VkF4OElG4O2kwPK0NSVq/nJJQg?=
 =?us-ascii?Q?AK8eLBQb+zEsRS47nZ9+chD1NF4bDrMCVcqzXn1GTUdxVlB7Hyh+sbvfz3YP?=
 =?us-ascii?Q?xBUJuFVm/q0B8NkOmmMQxUHdSXmVxtVz9BUT0K4n+LYDbmU5sRs+gvYdHBYJ?=
 =?us-ascii?Q?cQLsxBu+UCdwIS0MQzBWjBHlDsiXivQSnX8bVwLJj1zDng7B3cUJ+xXGhfxz?=
 =?us-ascii?Q?uoixjR5RhJHZeaGTIw9jhq61dMUz4JTRnT3zCxCzaXAlmwHnins8E1ET1/Hl?=
 =?us-ascii?Q?RF5nd2SlZ3PJJmies+1QJez4pPDlfI8xjVUrmTigqZKG7WGHLJ1619RNjAde?=
 =?us-ascii?Q?wzutfK2SCbvW4UcDwMwL8mm4gp50KpotnXrBsefTJNmrxNLO/ydsWT6Pmj27?=
 =?us-ascii?Q?YSoJorg2QZdi+d1mRZoC2IxLdxmPwOsYnTIRxiDbdX7PAE8G+UPYNNdmV/Te?=
 =?us-ascii?Q?mPKuJJXM6xJtto6faWH7RiIIIuRsf1cvCaHfIETOcWOXpI1qzpxKWtjF6vQc?=
 =?us-ascii?Q?QkNWxe/lwksBthd/4NEOYPYX3dXWtNdUECfm3MtGWyNl/ziCcz9rIxWCHmzL?=
 =?us-ascii?Q?OIpLZHFznVl0vxrpguzPTThD3pVd1Wq/eKLGD6JeJAUtiRfDiZGSk5w5y3Nm?=
 =?us-ascii?Q?a6+/FPJb+hM2/qhnKicAU2eTVVVzVtkCGlEwyjdFd5FnRr2MOajhhFMaKrYa?=
 =?us-ascii?Q?wrflbwK2qO1wvZ2pchdB0liEhb0Isi8iCx4pa5fJ1z8r2TnabQecuWYC+pCo?=
 =?us-ascii?Q?DAXPcpmlE8LQqrO5Zk6zIi8UJEt0il3pif3Frw5W5H+RQBHBdJuT/HyXDjvt?=
 =?us-ascii?Q?BRjEXTTJV/BFjTpPh8pvVwpItyghBpVbNhbpq3EGzc0MM1i1wXIjLmTat2Zr?=
 =?us-ascii?Q?j6e5Yy9LiC8aaO82Bs69/IfJygvXvzMIc/3Za1PB7GpKACVaJ0Ohf5hzsMEF?=
 =?us-ascii?Q?XySwssRkk4SHAs/xoJ9U38LODE68tTtLrDTaAT2HbFMAr4yJCsdriJ83it7i?=
 =?us-ascii?Q?HWCaBMk4+ZSwRc7+vLNlPB1exfE8K5S4pssH6Qw3c5GP2w7EwEYyrxuZzpFZ?=
 =?us-ascii?Q?jtoMMHhywiXvlR/qB58O4fKDqAnW+8Uve54f2mC3pRk8RpPxfqQ9LiK2HI7v?=
 =?us-ascii?Q?UI9axJ46KecWYx2cENNyFgiToOvOs3jfNIH/jTjBbK3EhnVY5VdKmEZPPcUP?=
 =?us-ascii?Q?MsgP8MH5v4T6018E6t/l51s3qigPOkdUhtKejTR9qTYuwFETPF9xyQeBudet?=
 =?us-ascii?Q?Vi3tM91OEG0+RpDh1z2Su08iL1BGLt8i8KwOSxzO7tGK4fdr+LHvei33IjMX?=
 =?us-ascii?Q?1JkofofhT5MWSrVMkpDnwjRZ54oP1KeuJeTRZm/t533zUJU5JBhry3ntnyG2?=
 =?us-ascii?Q?+H3SAFyTN5pM2Z0rKgurI/BUE3co+b+DRoodpl1L?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8094fec7-272c-4a8d-cedc-08db102531b1
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 13:53:33.8658 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B4EQ2uyKgfjmS9Sz3KbO9jhw3rWMY9P+QaKp1+IQBiBcBc1hzsHv7P6Zu+6gXPbqAgMmYmy6JZhcX2l/higPUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4102
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's use BIT() and GENMASK() instead of open it.
 Signed-off-by:
 Yangtao Li <frank.li@vivo.com> --- fs/f2fs/checkpoint.c | 2 +-
 fs/f2fs/compress.c
 | 4 ++-- fs/f2fs/data.c | 12 ++++++------ fs/f2fs/dir.c | 2 +- fs/f2fs/f2fs.h
 | 26 +++++++++++++------- [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.132 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.132 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pSehm-0000E8-KO
Subject: [f2fs-dev] [PATCH] f2fs: convert to use bitmap API
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

Let's use BIT() and GENMASK() instead of open it.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/checkpoint.c    |  2 +-
 fs/f2fs/compress.c      |  4 ++--
 fs/f2fs/data.c          | 12 ++++++------
 fs/f2fs/dir.c           |  2 +-
 fs/f2fs/f2fs.h          | 26 +++++++++++++-------------
 fs/f2fs/file.c          |  2 +-
 fs/f2fs/inode.c         |  4 ++--
 fs/f2fs/node.h          | 20 +++++++++-----------
 fs/f2fs/super.c         | 16 ++++++++--------
 fs/f2fs/sysfs.c         |  2 +-
 fs/f2fs/verity.c        |  2 +-
 include/linux/f2fs_fs.h |  9 ++++-----
 12 files changed, 49 insertions(+), 52 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 1369ec892a2c..faabdb31fbe4 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -979,7 +979,7 @@ int f2fs_get_valid_checkpoint(struct f2fs_sb_info *sbi)
 
 	cp_blk_no = le32_to_cpu(fsb->cp_blkaddr);
 	if (cur_page == cp2)
-		cp_blk_no += 1 << le32_to_cpu(fsb->log_blocks_per_seg);
+		cp_blk_no += BIT(le32_to_cpu(fsb->log_blocks_per_seg));
 
 	for (i = 1; i < cp_blks; i++) {
 		void *sit_bitmap_ptr;
diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index b40dec3d7f79..93fec1d37899 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -670,7 +670,7 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 
 	cc->cbuf->clen = cpu_to_le32(cc->clen);
 
-	if (fi->i_compress_flag & 1 << COMPRESS_CHKSUM)
+	if (fi->i_compress_flag & BIT(COMPRESS_CHKSUM))
 		chksum = f2fs_crc32(F2FS_I_SB(cc->inode),
 					cc->cbuf->cdata, cc->clen);
 	cc->cbuf->chksum = cpu_to_le32(chksum);
@@ -761,7 +761,7 @@ void f2fs_decompress_cluster(struct decompress_io_ctx *dic, bool in_task)
 
 	ret = cops->decompress_pages(dic);
 
-	if (!ret && (fi->i_compress_flag & 1 << COMPRESS_CHKSUM)) {
+	if (!ret && (fi->i_compress_flag & BIT(COMPRESS_CHKSUM))) {
 		u32 provided = le32_to_cpu(dic->cbuf->chksum);
 		u32 calculated = f2fs_crc32(sbi, dic->cbuf->cdata, dic->clen);
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 28e09682b056..61beae459a9c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -93,17 +93,17 @@ static enum count_type __read_io_type(struct page *page)
 /* postprocessing steps for read bios */
 enum bio_post_read_step {
 #ifdef CONFIG_FS_ENCRYPTION
-	STEP_DECRYPT	= 1 << 0,
+	STEP_DECRYPT	= BIT(0),
 #else
 	STEP_DECRYPT	= 0,	/* compile out the decryption-related code */
 #endif
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-	STEP_DECOMPRESS	= 1 << 1,
+	STEP_DECOMPRESS	= BIT(1),
 #else
 	STEP_DECOMPRESS	= 0,	/* compile out the decompression-related code */
 #endif
 #ifdef CONFIG_FS_VERITY
-	STEP_VERITY	= 1 << 2,
+	STEP_VERITY	= BIT(2),
 #else
 	STEP_VERITY	= 0,	/* compile out the verity-related code */
 #endif
@@ -420,7 +420,7 @@ int f2fs_target_device_index(struct f2fs_sb_info *sbi, block_t blkaddr)
 
 static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
 {
-	unsigned int temp_mask = (1 << NR_TEMP_TYPE) - 1;
+	unsigned int temp_mask = GENMASK(NR_TEMP_TYPE - 1, 0);
 	unsigned int fua_flag, meta_flag, io_flag;
 	blk_opf_t op_flags = 0;
 
@@ -442,9 +442,9 @@ static blk_opf_t f2fs_io_flags(struct f2fs_io_info *fio)
 	 *    5 |    4 |   3 |    2 |    1 |   0 |
 	 * Cold | Warm | Hot | Cold | Warm | Hot |
 	 */
-	if ((1 << fio->temp) & meta_flag)
+	if (BIT(fio->temp) & meta_flag)
 		op_flags |= REQ_META;
-	if ((1 << fio->temp) & fua_flag)
+	if (BIT(fio->temp) & fua_flag)
 		op_flags |= REQ_FUA;
 	return op_flags;
 }
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index 9ccdbe120425..73c338db5808 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -29,7 +29,7 @@ static unsigned long dir_blocks(struct inode *inode)
 static unsigned int dir_buckets(unsigned int level, int dir_level)
 {
 	if (level + dir_level < MAX_DIR_HASH_DEPTH / 2)
-		return 1 << (level + dir_level);
+		return BIT(level + dir_level);
 	else
 		return MAX_DIR_BUCKETS;
 }
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 21596e0266ba..dc5b25a6ac7a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -65,7 +65,7 @@ enum {
 };
 
 #ifdef CONFIG_F2FS_FAULT_INJECTION
-#define F2FS_ALL_FAULT_TYPE		((1 << FAULT_MAX) - 1)
+#define F2FS_ALL_FAULT_TYPE		(GENMASK(FAULT_MAX - 1, 0))
 
 struct f2fs_fault_info {
 	atomic_t inject_ops;
@@ -74,7 +74,7 @@ struct f2fs_fault_info {
 };
 
 extern const char *f2fs_fault_name[FAULT_MAX];
-#define IS_FAULT_SET(fi, type) ((fi)->inject_type & (1 << (type)))
+#define IS_FAULT_SET(fi, type) ((fi)->inject_type & BIT(type))
 #endif
 
 /*
@@ -1436,7 +1436,7 @@ static inline void set_page_private_##name(struct page *page) \
 static inline void clear_page_private_##name(struct page *page) \
 { \
 	clear_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
-	if (page_private(page) == 1 << PAGE_PRIVATE_NOT_POINTER) { \
+	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER)) { \
 		set_page_private(page, 0); \
 		if (PagePrivate(page)) { \
 			ClearPagePrivate(page); \
@@ -1482,8 +1482,8 @@ static inline void set_page_private_data(struct page *page, unsigned long data)
 
 static inline void clear_page_private_data(struct page *page)
 {
-	page_private(page) &= (1 << PAGE_PRIVATE_MAX) - 1;
-	if (page_private(page) == 1 << PAGE_PRIVATE_NOT_POINTER) {
+	page_private(page) &= GENMASK(PAGE_PRIVATE_MAX - 1, 0);
+	if (page_private(page) == BIT(PAGE_PRIVATE_NOT_POINTER)) {
 		set_page_private(page, 0);
 		if (PagePrivate(page)) {
 			ClearPagePrivate(page);
@@ -2892,7 +2892,7 @@ static inline int f2fs_test_bit(unsigned int nr, char *addr)
 	int mask;
 
 	addr += (nr >> 3);
-	mask = 1 << (7 - (nr & 0x07));
+	mask = BIT(7 - (nr & 0x07));
 	return mask & *addr;
 }
 
@@ -2901,7 +2901,7 @@ static inline void f2fs_set_bit(unsigned int nr, char *addr)
 	int mask;
 
 	addr += (nr >> 3);
-	mask = 1 << (7 - (nr & 0x07));
+	mask = BIT(7 - (nr & 0x07));
 	*addr |= mask;
 }
 
@@ -2910,7 +2910,7 @@ static inline void f2fs_clear_bit(unsigned int nr, char *addr)
 	int mask;
 
 	addr += (nr >> 3);
-	mask = 1 << (7 - (nr & 0x07));
+	mask = BIT(7 - (nr & 0x07));
 	*addr &= ~mask;
 }
 
@@ -2920,7 +2920,7 @@ static inline int f2fs_test_and_set_bit(unsigned int nr, char *addr)
 	int ret;
 
 	addr += (nr >> 3);
-	mask = 1 << (7 - (nr & 0x07));
+	mask = BIT(7 - (nr & 0x07));
 	ret = mask & *addr;
 	*addr |= mask;
 	return ret;
@@ -2932,7 +2932,7 @@ static inline int f2fs_test_and_clear_bit(unsigned int nr, char *addr)
 	int ret;
 
 	addr += (nr >> 3);
-	mask = 1 << (7 - (nr & 0x07));
+	mask = BIT(7 - (nr & 0x07));
 	ret = mask & *addr;
 	*addr &= ~mask;
 	return ret;
@@ -2943,7 +2943,7 @@ static inline void f2fs_change_bit(unsigned int nr, char *addr)
 	int mask;
 
 	addr += (nr >> 3);
-	mask = 1 << (7 - (nr & 0x07));
+	mask = BIT(7 - (nr & 0x07));
 	*addr ^= mask;
 }
 
@@ -4354,9 +4354,9 @@ static inline int set_compress_context(struct inode *inode)
 			F2FS_OPTION(sbi).compress_log_size;
 	F2FS_I(inode)->i_compress_flag =
 			F2FS_OPTION(sbi).compress_chksum ?
-				1 << COMPRESS_CHKSUM : 0;
+				BIT(COMPRESS_CHKSUM) : 0;
 	F2FS_I(inode)->i_cluster_size =
-			1 << F2FS_I(inode)->i_log_cluster_size;
+			BIT(F2FS_I(inode)->i_log_cluster_size);
 	if ((F2FS_I(inode)->i_compress_algorithm == COMPRESS_LZ4 ||
 		F2FS_I(inode)->i_compress_algorithm == COMPRESS_ZSTD) &&
 			F2FS_OPTION(sbi).compress_level)
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ca1720fc1187..c50a69c0b964 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3964,7 +3964,7 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
 
 	F2FS_I(inode)->i_compress_algorithm = option.algorithm;
 	F2FS_I(inode)->i_log_cluster_size = option.log_cluster_size;
-	F2FS_I(inode)->i_cluster_size = 1 << option.log_cluster_size;
+	F2FS_I(inode)->i_cluster_size = BIT(option.log_cluster_size);
 	f2fs_mark_inode_dirty_sync(inode, true);
 
 	if (!f2fs_is_compress_backend_ready(inode))
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 7d2e2c0dba65..bb5b365a195d 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -454,8 +454,8 @@ static int do_read_inode(struct inode *inode)
 			fi->i_compress_level = compress_flag >>
 						COMPRESS_LEVEL_OFFSET;
 			fi->i_compress_flag = compress_flag &
-					(BIT(COMPRESS_LEVEL_OFFSET) - 1);
-			fi->i_cluster_size = 1 << fi->i_log_cluster_size;
+					GENMASK(COMPRESS_LEVEL_OFFSET - 1, 0);
+			fi->i_cluster_size = BIT(fi->i_log_cluster_size);
 			set_inode_flag(inode, FI_COMPRESSED_FILE);
 		}
 	}
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 99454d46a939..906fb67a99da 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -93,17 +93,15 @@ static inline void copy_node_info(struct node_info *dst,
 static inline void set_nat_flag(struct nat_entry *ne,
 				unsigned int type, bool set)
 {
-	unsigned char mask = 0x01 << type;
 	if (set)
-		ne->ni.flag |= mask;
+		ne->ni.flag |= BIT(type);
 	else
-		ne->ni.flag &= ~mask;
+		ne->ni.flag &= ~BIT(type);
 }
 
 static inline bool get_nat_flag(struct nat_entry *ne, unsigned int type)
 {
-	unsigned char mask = 0x01 << type;
-	return ne->ni.flag & mask;
+	return ne->ni.flag & BIT(type);
 }
 
 static inline void nat_reset_flag(struct nat_entry *ne)
@@ -225,7 +223,7 @@ static inline pgoff_t next_nat_addr(struct f2fs_sb_info *sbi,
 	struct f2fs_nm_info *nm_i = NM_I(sbi);
 
 	block_addr -= nm_i->nat_blkaddr;
-	block_addr ^= 1 << sbi->log_blocks_per_seg;
+	block_addr ^= BIT(sbi->log_blocks_per_seg);
 	return block_addr + nm_i->nat_blkaddr;
 }
 
@@ -395,7 +393,7 @@ static inline nid_t get_nid(struct page *p, int off, bool i)
 static inline int is_node(struct page *page, int type)
 {
 	struct f2fs_node *rn = F2FS_NODE(page);
-	return le32_to_cpu(rn->footer.flag) & (1 << type);
+	return le32_to_cpu(rn->footer.flag) & BIT(type);
 }
 
 #define is_cold_node(page)	is_node(page, COLD_BIT_SHIFT)
@@ -408,9 +406,9 @@ static inline void set_cold_node(struct page *page, bool is_dir)
 	unsigned int flag = le32_to_cpu(rn->footer.flag);
 
 	if (is_dir)
-		flag &= ~(0x1 << COLD_BIT_SHIFT);
+		flag &= ~BIT(COLD_BIT_SHIFT);
 	else
-		flag |= (0x1 << COLD_BIT_SHIFT);
+		flag |= BIT(COLD_BIT_SHIFT);
 	rn->footer.flag = cpu_to_le32(flag);
 }
 
@@ -419,9 +417,9 @@ static inline void set_mark(struct page *page, int mark, int type)
 	struct f2fs_node *rn = F2FS_NODE(page);
 	unsigned int flag = le32_to_cpu(rn->footer.flag);
 	if (mark)
-		flag |= (0x1 << type);
+		flag |= BIT(type);
 	else
-		flag &= ~(0x1 << type);
+		flag &= ~BIT(type);
 	rn->footer.flag = cpu_to_le32(flag);
 
 #ifdef CONFIG_F2FS_CHECK_FS
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index aa55dc12aff2..6fabd6330b03 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -886,8 +886,8 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			if (args->from && match_int(args, &arg))
 				return -EINVAL;
 			if (arg <= 0 || arg > __ilog2_u32(BIO_MAX_VECS)) {
-				f2fs_warn(sbi, "Not support %d, larger than %d",
-					  1 << arg, BIO_MAX_VECS);
+				f2fs_warn(sbi, "Not support %ld, larger than %d",
+					BIT(arg), BIO_MAX_VECS);
 				return -EINVAL;
 			}
 			F2FS_OPTION(sbi).write_io_size_bits = arg;
@@ -1316,7 +1316,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 #endif
 
 	if (F2FS_IO_SIZE_BITS(sbi) && !f2fs_lfs_mode(sbi)) {
-		f2fs_err(sbi, "Should set mode=lfs with %uKB-sized IO",
+		f2fs_err(sbi, "Should set mode=lfs with %luKB-sized IO",
 			 F2FS_IO_SIZE_KB(sbi));
 		return -EINVAL;
 	}
@@ -3354,7 +3354,7 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 	total_sections = le32_to_cpu(raw_super->section_count);
 
 	/* blocks_per_seg should be 512, given the above check */
-	blocks_per_seg = 1 << le32_to_cpu(raw_super->log_blocks_per_seg);
+	blocks_per_seg = BIT(le32_to_cpu(raw_super->log_blocks_per_seg));
 
 	if (segment_count > F2FS_MAX_SEGMENT ||
 				segment_count < F2FS_MIN_SEGMENTS) {
@@ -3623,9 +3623,9 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	sbi->log_sectors_per_block =
 		le32_to_cpu(raw_super->log_sectors_per_block);
 	sbi->log_blocksize = le32_to_cpu(raw_super->log_blocksize);
-	sbi->blocksize = 1 << sbi->log_blocksize;
+	sbi->blocksize = BIT(sbi->log_blocksize);
 	sbi->log_blocks_per_seg = le32_to_cpu(raw_super->log_blocks_per_seg);
-	sbi->blocks_per_seg = 1 << sbi->log_blocks_per_seg;
+	sbi->blocks_per_seg = BIT(sbi->log_blocks_per_seg);
 	sbi->segs_per_sec = le32_to_cpu(raw_super->segs_per_sec);
 	sbi->secs_per_zone = le32_to_cpu(raw_super->secs_per_zone);
 	sbi->total_sections = le32_to_cpu(raw_super->section_count);
@@ -3881,7 +3881,7 @@ void f2fs_handle_stop(struct f2fs_sb_info *sbi, unsigned char reason)
 
 	f2fs_down_write(&sbi->sb_lock);
 
-	if (raw_super->s_stop_reason[reason] < ((1 << BITS_PER_BYTE) - 1))
+	if (raw_super->s_stop_reason[reason] < GENMASK(BITS_PER_BYTE - 1, 0))
 		raw_super->s_stop_reason[reason]++;
 
 	err = f2fs_commit_super(sbi, false);
@@ -4031,7 +4031,7 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 			  FDEV(i).start_blk, FDEV(i).end_blk);
 	}
 	f2fs_info(sbi,
-		  "IO Block Size: %8d KB", F2FS_IO_SIZE_KB(sbi));
+		  "IO Block Size: %8ld KB", F2FS_IO_SIZE_KB(sbi));
 	return 0;
 }
 
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 0b19163c90d4..e715207e990e 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -452,7 +452,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 	if (ret < 0)
 		return ret;
 #ifdef CONFIG_F2FS_FAULT_INJECTION
-	if (a->struct_type == FAULT_INFO_TYPE && t >= (1 << FAULT_MAX))
+	if (a->struct_type == FAULT_INFO_TYPE && t >= BIT(FAULT_MAX))
 		return -EINVAL;
 	if (a->struct_type == FAULT_INFO_RATE && t >= UINT_MAX)
 		return -EINVAL;
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index 3f4f3295f1c6..9e005f15fafe 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -280,7 +280,7 @@ static int f2fs_write_merkle_tree_block(struct inode *inode, const void *buf,
 {
 	loff_t pos = f2fs_verity_metadata_pos(inode) + (index << log_blocksize);
 
-	return pagecache_write(inode, buf, 1 << log_blocksize, pos);
+	return pagecache_write(inode, buf, BIT(log_blocksize), pos);
 }
 
 const struct fsverity_operations f2fs_verityops = {
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index 1701f25117ea..881eb9321967 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -40,9 +40,8 @@
 
 #define F2FS_ENC_UTF8_12_1	1
 
-#define F2FS_IO_SIZE(sbi)	(1 << F2FS_OPTION(sbi).write_io_size_bits) /* Blocks */
-#define F2FS_IO_SIZE_KB(sbi)	(1 << (F2FS_OPTION(sbi).write_io_size_bits + 2)) /* KB */
-#define F2FS_IO_SIZE_BYTES(sbi)	(1 << (F2FS_OPTION(sbi).write_io_size_bits + 12)) /* B */
+#define F2FS_IO_SIZE(sbi)	BIT(F2FS_OPTION(sbi).write_io_size_bits) /* Blocks */
+#define F2FS_IO_SIZE_KB(sbi)	BIT(F2FS_OPTION(sbi).write_io_size_bits + 2) /* KB */
 #define F2FS_IO_SIZE_BITS(sbi)	(F2FS_OPTION(sbi).write_io_size_bits) /* power of 2 */
 #define F2FS_IO_SIZE_MASK(sbi)	(F2FS_IO_SIZE(sbi) - 1)
 #define F2FS_IO_ALIGNED(sbi)	(F2FS_IO_SIZE(sbi) > 1)
@@ -340,7 +339,7 @@ enum {
 	OFFSET_BIT_SHIFT
 };
 
-#define OFFSET_BIT_MASK		(0x07)	/* (0x01 << OFFSET_BIT_SHIFT) - 1 */
+#define OFFSET_BIT_MASK		GENMASK(OFFSET_BIT_SHIFT - 1, 0)
 
 struct node_footer {
 	__le32 nid;		/* node id */
@@ -545,7 +544,7 @@ typedef __le32	f2fs_hash_t;
 #define MAX_DIR_HASH_DEPTH	63
 
 /* MAX buckets in one level of dir */
-#define MAX_DIR_BUCKETS		(1 << ((MAX_DIR_HASH_DEPTH / 2) - 1))
+#define MAX_DIR_BUCKETS		BIT((MAX_DIR_HASH_DEPTH / 2) - 1)
 
 /*
  * space utilization of regular dentry and inline dentry (w/o extra reservation)
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
