Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D543460E171
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Oct 2022 15:05:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ong65-0003jI-T9;
	Wed, 26 Oct 2022 13:05:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1ong64-0003j4-3n
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Oct 2022 13:05:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZQj9zU6J9stVG65pDW/dUnRSzWKyXsTSHVv1kwMaw/M=; b=mRZSKlEcPD7ijC0+2hXT7+gLsF
 TykYHZNvgA5j6qU5nGov/WOuv+HzWa9da+0H2taDBTnMrsmdjvl3wFDeug51HdDM/6acHPCRv4T5G
 GTMOXncFBWRiTTUumb2cicLJlQfL3ng3oYGmjvKCNspFA5oTUPOplvP3JQRZmnIHLf98=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZQj9zU6J9stVG65pDW/dUnRSzWKyXsTSHVv1kwMaw/M=; b=F
 EfvRJ7ziPPxbBQ04xTPKuZh/5GmTj274poM7kdyFDawnB/hBXGw525Xq4KqV/kVKoGt22PoGaZsJm
 LysuRrEOq48tG/0fSM6Bu95VwibNknJMkDRmAkUGMOY0pwO73B6sl0hO3uSAA/sbVq4AVdPYdmZ8M
 nbKU20YwgI2BZbFM=;
Received: from mail-sgaapc01on2124.outbound.protection.outlook.com
 ([40.107.215.124] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ong5y-000W9L-2i for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Oct 2022 13:05:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+hlB3fMs2GP0dcqm9qkDQqszSu1GXkor9edLeEriV02MmtIyBx2wRqzj8s5MOsaw2TMkmjlmSlrikYhqT6hEXh37stSMqWiqBQjBsDqAiuojbV2e9auv7Fp5sWTfNazbCGkmTpbEiIlERo7oqcXRPdKBS9y4JG9n7MWveL9S36fmP8kqLwvPuaDDCYbZOp0GRnoGN837VgeRBMwQ7qSIL+8kQtNJzxSNVJzStOhls5e4QxVnf1b7aANVAeuIxu1k4ITk6FXp60lHWnnQNFddnvwTlw7oJEnIItR1VcrtrzFcdHDv3Bfur8KxA4AwR9QxhRU6wc35NTYgPf0twpcwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQj9zU6J9stVG65pDW/dUnRSzWKyXsTSHVv1kwMaw/M=;
 b=OJS7R5rI1cNKkHpmwuHz32ECfp2lwc9r92h0BrZ+8xQ6kpfNOossizZC0XBk/xdCdHfO3uhWiS/KROkKYWPceFcSGcLYsO9Pb9G+KtBRMs/kszt8wwWMMCbGm+O1br1Q4b5tnFPWO1x7lE3ZKxfqntrgyCFuxMruu8zkSIUxzjZBDRExTv961SHdNFioqwN5KuQVSYm+lDE+wE8dYEYoVnktXz6oo0HaVJHi9X8eHXoEUlxZUqAzR9dc9FEOj3/dvC3O50+6iHDLM7mvDawIx6t3nJPlx6Et5AruSELEX/r65IjFOeDJrlyzZhfQlgMVIu78L1cURaYpS8IuC8Qatg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQj9zU6J9stVG65pDW/dUnRSzWKyXsTSHVv1kwMaw/M=;
 b=MRPiPJU6MlEL6+1OHXfXE+fEURz3FmP2MZgNjVbICi88Ueae/trx3OmE71WRHMl5512BOSWrgRRHXkwI6sVE2eC8B2iJo27eK4cndtQVSTtIGpESsYfUAh9qe90Jb6n8HgGOIf08zjxq51pUeCZ/Fx5qw6PifoECNYi/5+Qr07nos8IKBYJPioUvfjK3VTswzzjs19L/ny9l7KuoW94DJNIvp3wMKvjTg1tNznUt37u+kVlQY2gvViHPsPonsfdFJHqjwIIHWVoz6iUFX3X3EFsLtNtT4C6pSuvE4MESKgCtJti2iO8eHqr3cY6HavXcr59a5s78aF+fLeY+YglsYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB4035.apcprd06.prod.outlook.com (2603:1096:820:25::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Wed, 26 Oct
 2022 13:05:14 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd%3]) with mapi id 15.20.5746.023; Wed, 26 Oct 2022
 13:05:13 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 26 Oct 2022 21:05:04 +0800
Message-Id: <20221026130504.26312-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: OS3P286CA0077.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:201::20) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB4035:EE_
X-MS-Office365-Filtering-Correlation-Id: 9fc83f7d-ce77-4818-f0f8-08dab752b869
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kQSpToXVzblXwPVBjR81cTvwVlVl6FJKuR+s+CfFro6d/cKdAUt1c1AWuaI99zFaMHoxKJNvOPf3HmPE+U0qNdYMADGIcLfKjMQdm40BHE4koAU1/vsMgjrFx6I11HVKwnBNelASlaWbnufNTMeggOuz3glxIoj2I/b0nVyezCpu/WMrd5V+kltgkby3j51Md5MnR6mqu6vQJ3xCrDEelISA6iM7Clb39f8s+iMWU1XOAjOmdOpuKbVeJMEEi1ourvgj7bV6maVWaXo2NlD662kcIR5fEuts8oqGY0mbpTK1uhgpaEb++KT0zW4zuQvtcqjWMKsX8iYvHfG7c9vMGsy4JVB0WNUPDyuqApN01P/FBKmc/V9Esq4oz9YQgVaAfDOmlkf8h4eFn9JCBZ3WMxW9j/Igbc/q/R3FLrDTi0YDN9xfM3GEzDlzqu3fk14pG6ZMrm22biIDnfkqXOfg2eIWpuHYNZF+2bEC1bDftupLAOZ/WPXic0KeAMm8PYgXhCGkodrqh6/u165HaMp4hOska5UTDfEIFO9HFz7btnm8gxgMBZZ+jChTOdOCiUOloRX5lGv0fMYAAvOsrMAgxoRZ8zxCkhML/xVuH3lwtiZHaPcg2x2C2Qi+RWQaA3fCukZupDXjy48bGFeiGYeC85eYb1QWPx3fnSy3s/45ueeegDJdZ8D08mCWo7vexjyzPWFlD4WfxLQ9xGZShAY5nOXckEbXTcFm5ix1q9LNWYv88OTvo8pmWItUK8EzwLisW2zC5wUE690zyCJQUWngaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(39860400002)(396003)(136003)(346002)(451199015)(1076003)(186003)(2616005)(107886003)(86362001)(6506007)(41300700001)(66556008)(4326008)(66946007)(66476007)(8676002)(2906002)(36756003)(6666004)(26005)(6512007)(52116002)(38100700002)(83380400001)(38350700002)(316002)(5660300002)(6486002)(8936002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9qz+MoOjhOcRsfcFf/lFMcYB+Mplkc6c95hCZ7kRKlIfG01lgUpqvT8lvWCT?=
 =?us-ascii?Q?pI+yM8a7GkmB354HvU4CWQ3fza0GGjQWHSBHbe5PQ6G4GHwNfR8VjyIeA/XX?=
 =?us-ascii?Q?HeUWdkvIFD2MFj4ojvrxsNshHRuRBF5CtCmEcENFWb+Dixu6BGSbTF51dMq0?=
 =?us-ascii?Q?FQDa5PPS007t5ksPP971CWhMhQg1c5c01NN4VsOjFujY3iUfp9OVViqK8qhO?=
 =?us-ascii?Q?euOk8u6D5CwCJhlaS335MKfy6cpLQz8VFf0NhI58FpiFT3QFHQAq9NnNG6iw?=
 =?us-ascii?Q?Ix/zjOswqse/57ukjJkQbKPGZoGQb9Xtmsu4v3THmyuxuCp+25xQI4R2z5L2?=
 =?us-ascii?Q?wCar3A8Rbwc9ZhlH8SJfn2PTzz3HGiMNQVyyItPWwI12j1Y6yBJs6cX8LV4R?=
 =?us-ascii?Q?BlpTObq3yeD5tyG5mAhHTpu2XBXLSJsp8SIE0ZVlZFDKIDwNl7Z4JVR04nxr?=
 =?us-ascii?Q?fI5d4Wz5RzPNokdlFid+a0q1elnEyw+vVhW1doJJiWigmWUvGFv3YyXMn49I?=
 =?us-ascii?Q?ooQ6VAWi56g1HH33z9T66NyeT4IFCaCsdv/3wKXDmB85WQFQW+F3ae9f+Vy7?=
 =?us-ascii?Q?COTn6SdS8ufh+fZeo7M5cX8pG1P08+y2hezfgGBuS1QHh0AGvDJM08ZXD7zb?=
 =?us-ascii?Q?PaJXM3caM01n/o5lPE9PT2NqDGO68oaib9vKTNecCsepZrJI0jz8LS3504M3?=
 =?us-ascii?Q?GqwAKy5+qlSNzgtS38mBKLR9d+iscWM8ANe1ztHSAc2oFi0dAn1tOuMaALlf?=
 =?us-ascii?Q?5aD8JlPdRjV9S8V42Js/rTuhlcAJfO2gU03wRddg934fu5sfnobBbp4gP4u+?=
 =?us-ascii?Q?B0ohLOxD9QpcPtXtyaCJwtdSFbb3lgpvP8u0+o6PHVH2ekGPPzvy6/no33Pu?=
 =?us-ascii?Q?JlyY23CPFfvqPA0Nx8SKCAwGOR6zOVf/7YmWwW90Fu8Ic2j6kREZcI5kJvLR?=
 =?us-ascii?Q?Zm26AWTtzAgTPo9/F2uJnOQvuJUaVOZA3E2oSYiTcHwPy65cyvPMnPn/l66Z?=
 =?us-ascii?Q?COcGrzGE8scbizMEg3B1qEYzw3HQLTfY7QetC3sND2fNRH1m7chyuL0DoWku?=
 =?us-ascii?Q?4gzxBPGKJpMXAAuRK5bt7NeNjy+SRzwKVnYs62pFlgkfY6mBFppumUFoNd90?=
 =?us-ascii?Q?KKAQt/NaWlbDDNkRMoRH2afHoTAjzN2Y0S60bAtro1+Unemk6rrzBhEng/XG?=
 =?us-ascii?Q?Sv+F5IXYSdiTA6S6v7DHU06IAvFIsyMR9knym5Um9ydUMOL9IUvLo4WU42jg?=
 =?us-ascii?Q?lFsICooiwhwQDRuoNa12uB0ub3e8HloQIS01+NvMXhsrLm64SOI6VdjsqvDn?=
 =?us-ascii?Q?SAKkZAP0P8YZnDilR1is8jW9fKlaF+vfEiLxxsdVtiDCHPbjTlY9HmiqMU4M?=
 =?us-ascii?Q?gN2Rx0izA8J120UZjMT/8Y3t3V4PP65Y8y3L91YCH6xH6bTp3eeK4cPDW3je?=
 =?us-ascii?Q?Bw2Izd5k5bbsPD3b3qOcZ2y+TgsbeJN+3cev8S2vn6g+JovXimJbzmFSSrZc?=
 =?us-ascii?Q?cTCg0dTbOU6IC0GOsT5tY8xzNMW7Zt6oQ6MlbCTI+3OhNHqpdgbOvF+Qq2l4?=
 =?us-ascii?Q?9439epXozYSv1yL2dJzo99PuzUSKFH3u3NsgPFUo?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fc83f7d-ce77-4818-f0f8-08dab752b869
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 13:05:13.7529 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BroLWJ5lh+YZZPH8uOLMEi3qoPJurYIlsRH6Ezkro+ABcTEy6G1oMTCkR5aBfN3V4NKF1ky/KYLmPucR7htXGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4035
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Some minor modifications to flush_merge and related
 parameters:
 1.The FLUSH_MERGE opt is set by default only in non-ro mode. 2.When ro and
 merge are set at the same time, an error is reported. 3.Display noflush_merge
 mount opt. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.124 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.124 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ong5y-000W9L-2i
Subject: [f2fs-dev] [PATCH] f2fs: fix to set flush_merge opt and show
 noflush_merge
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

Some minor modifications to flush_merge and related parameters:

  1.The FLUSH_MERGE opt is set by default only in non-ro mode.
  2.When ro and merge are set at the same time, an error is reported.
  3.Display noflush_merge mount opt.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/super.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 3834ead04620..475fa10c6007 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1347,6 +1347,12 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		return -EINVAL;
 	}
 
+	if ((f2fs_sb_has_readonly(sbi) || f2fs_readonly(sbi->sb))
+		 && test_opt(sbi, FLUSH_MERGE)) {
+		f2fs_err(sbi, "FLUSH_MERGE not compatible with readonly mode");
+		return -EINVAL;
+	}
+
 	if (f2fs_sb_has_readonly(sbi) && !f2fs_readonly(sbi->sb)) {
 		f2fs_err(sbi, "Allow to mount readonly mode only");
 		return -EROFS;
@@ -1935,8 +1941,10 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 		seq_puts(seq, ",inline_dentry");
 	else
 		seq_puts(seq, ",noinline_dentry");
-	if (!f2fs_readonly(sbi->sb) && test_opt(sbi, FLUSH_MERGE))
+	if (test_opt(sbi, FLUSH_MERGE))
 		seq_puts(seq, ",flush_merge");
+	else
+		seq_puts(seq, ",noflush_merge");
 	if (test_opt(sbi, NOBARRIER))
 		seq_puts(seq, ",nobarrier");
 	if (test_opt(sbi, FASTBOOT))
@@ -2065,7 +2073,8 @@ static void default_options(struct f2fs_sb_info *sbi)
 	set_opt(sbi, MERGE_CHECKPOINT);
 	F2FS_OPTION(sbi).unusable_cap = 0;
 	sbi->sb->s_flags |= SB_LAZYTIME;
-	set_opt(sbi, FLUSH_MERGE);
+	if (!(f2fs_sb_has_readonly(sbi) || f2fs_readonly(sbi->sb)))
+		set_opt(sbi, FLUSH_MERGE);
 	if (f2fs_hw_support_discard(sbi) || f2fs_hw_should_discard(sbi))
 		set_opt(sbi, DISCARD);
 	if (f2fs_sb_has_blkzoned(sbi)) {
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
