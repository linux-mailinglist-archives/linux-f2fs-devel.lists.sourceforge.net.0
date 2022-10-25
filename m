Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 67A9260C5E6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 09:56:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onEnn-0006Bt-KJ;
	Tue, 25 Oct 2022 07:56:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1onEnk-0006Bm-1s
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 07:56:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=piKQPwu+RdRGaBq/FepwcAEu/irtK7ZeUzcxyAT0eR0=; b=QAC2HxbHkE5XbEaLHt/+6OAewr
 T83Lt33MsWKdp/U/bCL+rZglGDAu6K85iy//mDNC49YCSmzozbv6255OauSLAS9+FxJ/UQDtRbzNs
 IZ7KNtH0V/AjK4s+UduBZJhzVV9hEmT+Mk0CSG0IrPaDhQcso88996NM8T+WO/8jSpm8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=piKQPwu+RdRGaBq/FepwcAEu/irtK7ZeUzcxyAT0eR0=; b=M
 ff18v70H+FnoGh9bYS9GMMlC0+pjhj3s5rdwoFgXST9kJqdZ+fTYx8LDMkSGTjOnazFKe09cABWUN
 yZrUcsPGTG9D0EnxafsGaXa5VGV/KG8i76PP6LZ5/corfxEhkzkw49pKr15lkj4YuHtES1PCJ70eJ
 fc2uz+mgr33/cpzw=;
Received: from mail-sgaapc01on2097.outbound.protection.outlook.com
 ([40.107.215.97] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onEni-0005ES-8x for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 07:56:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHYAMOINhaMnSb4bmpgROKoPYJ+66K3YrNFdAKd3Fs2VlSWKvlrN8OBunMgiwPvH2VVOu0SnKLzIZFHAJK+2cZXmCPs9Ms5FmKgww+POqH7FN/odaFYSYr355+kHbV2nDG4W45EGhdKX2JT99d1UUY+TH90UIbwJRyhfuLTxOGR4rtilx1YwY2OEfg1yHe4HrcSti4qJ8blOE83qbfs47N2dC0tloDxSg/iQZNXrP/KTa5EmYulM0JwVmJvqoBLmmu9cM89+yuC9NyRfG+wjFpSik4Jfso++EfnpfdHKkFMAnJB2kdOGmsVTFGTMZKbCd2iUkIYVx1eNRc7xbuCfRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=piKQPwu+RdRGaBq/FepwcAEu/irtK7ZeUzcxyAT0eR0=;
 b=UrYSuoRtErQJXdwzrFNmqsk3y4zXP9vvx4CEuol7Iav7+wLTPdg1BtGVkpyNYtH518ADAdkFRbLkdvOypdfXssl+DFVHs//0XnLNd8Okx8Ki9QqV48SeSkbLN4FmeFPezqfa3qNaO2y2fXLRoiBWK1HINUkx7I387lFhj/J73Qav/hWoinhcZIDIS2hkUQCZDIo/mDSXA37RtqofH/PH4WIr/Pa7CsS9xXot0oXsJ9MrJq7ALL8QRROrTo//DGu5Ba9Yzw9SvYpwRJK9EutMnglnWVYxkmVwaTBA1MJiajJprAdN9IPn98mOjGoKKGpmxIsG1I1cFmXqWblcbHqQZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=piKQPwu+RdRGaBq/FepwcAEu/irtK7ZeUzcxyAT0eR0=;
 b=Ofo19P3f4rp2WoNifGAUKi7Xh8blGF+4a11FBLX29OaQ+nRU4AWD+o5wxmid0viBdtHAU1L9vmd8rxcQTBEBaIhc2f+byWG6al1HMJaRN9HY3PWRp2R+S+nI4RyKoly907MSJ/BC7dSRE9BM4fdiiGMDjFAxZmXd61151VL7jlBt5MqMKQP6fMLvQENKFpZ16SbMcNgo1bySFVgmMgA2zGqjjVOqxDdgc0VsjZB3hE+OuFGEzMwlzKRzfuuhc+IjESLpnSsIlugfC+AHMNwUo5xIIeR15gKl99CgaEI0AAs2FjsGBZHsUV+nZLHL/60wD7JOzDoModqtVWIyzU/Afg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5284.apcprd06.prod.outlook.com (2603:1096:400:211::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Tue, 25 Oct
 2022 07:56:31 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd%3]) with mapi id 15.20.5746.023; Tue, 25 Oct 2022
 07:56:31 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 25 Oct 2022 15:56:23 +0800
Message-Id: <20221025075623.7958-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR06CA0233.apcprd06.prod.outlook.com
 (2603:1096:4:ac::17) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5284:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ae866d2-09e8-4ebe-b3b2-08dab65e6e03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tf2I19c9U1H/oT49INOaoDuL+TIqH9BOSoPoqx/occ0O14WhTbM6mFKaRR9Z3hZtqm7KL52n/SY2DiZ0TUcpW90OiSGLU16ajRR1tjAUSG7/dbiSFAmoOGUQnDTACR4aw118IcXCef3O4zAkI3xrybyR0hnST4wbQoNniFCCsoTBIKRrnoFyMvbfO6SwzNPb8nmQnhHTwrp94qCx9YjNz++5nvjdSQDztQ/6v0/tMlaBUijQeyvSSSnSLfd5f0OcueIRJ6H/1Ure0dOVXrs6Mwey3ies44GgUoP53gT9kinuqmr/2n/920jwB5r4xwo9iejSFBo/ok7laBW1VAYb5g7n6wDIC5032Sg6YIfBgAokIh84UZ11hUkaICVcazq3JmvfYv9PB3ITNySGcmBWe9LOzsFQzilV2/iZnUM6HjIhyGdZFEiDH2gDQOmWFhieTxA6xEZF96A0rZUI424Sd6K+ZuixWR4o6/HcRImiFTsSqCFN8qsPbv8Dc76Xcc8VrZZPtiu8QDrbGsipMa1H0+lixyIO/0d5T2/o+Vc2nJpDMtKtZ/ZyZEZrlgB1kbXPhAORJGAVrHKfG/eZXTLwWP1rPVda4ggc5UvE0ytRuqM+fWgnw1qIGP6odXHlBEAT5x92eyI7nanMNJQpmUutFoXpqlE90E5OSriDp5BIt2usLWnKzF3v5X0GbUF2y++r+4nX4wm6mOdhboeqg6vT32TmmRdeYtVvAc5fsgYkBt2J6qGjhht0BlRM6eOSeWV2FM/RUpmwFBx1XnC6QGvAGA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(346002)(376002)(136003)(39860400002)(396003)(451199015)(6486002)(478600001)(107886003)(6666004)(316002)(6506007)(2906002)(36756003)(66556008)(8676002)(4326008)(66946007)(66476007)(6512007)(186003)(26005)(41300700001)(38350700002)(86362001)(38100700002)(1076003)(52116002)(2616005)(83380400001)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kayqiZdHoYunMIJX08fPJD0B2XuAYA1laKn3ISNmJlE0vF8gKmQgwloF+IuX?=
 =?us-ascii?Q?A9NFl2IG60hfQdVTv0ZdPyxaFz/XbyXBBKRzxPilc+wmnNgKzsDV4yYuYDNW?=
 =?us-ascii?Q?fNqtSOcKFLfHIQumf3lRmVrH198RTcN7RN6yAokY7zRGszSCgNP05j+JGPv3?=
 =?us-ascii?Q?SSJSOqpistkk7Uoe9gN9DYmm/JTyvxL0LGGdLfQ1xUOHfbP2RlG733FHoP/d?=
 =?us-ascii?Q?QSA9JDcnRcHLNGeUE15MKplokhLeORqYbd7AKsUUBoQrPGabvGE6qNSCSGEr?=
 =?us-ascii?Q?Fm3/OoWywOj9ggy3maAWHgryXBWwBYphQw9oJfj3FCJm4alXdptquozNdm+D?=
 =?us-ascii?Q?DilDaedbVL+9j1wC8RsvzF2RrCRFD5bQ1vvR441NdAM/C929dv9dRMcTHK4d?=
 =?us-ascii?Q?AXD+9NanhQs7WyBHgAHrGqtJRhvBe39Ate9lnj4J9OGLUP8ZhKMpSdjMKLPP?=
 =?us-ascii?Q?+n/UVh6pf/qVmo2r5TbIHx/8QLFbMKWFU7wraxmn1TxPKlPOPceKegu7AKts?=
 =?us-ascii?Q?2mQx3Jt8QxWeMKxXKF5FlGtDA2RzMTsEb/7ee4ObqxW9RwoQLDktR9sRizEE?=
 =?us-ascii?Q?8lSbiRIk/rtLMxyYS2sH2vC0VNY8L5DNr1dHMffg41K488XYqzE4JCo8Ud5b?=
 =?us-ascii?Q?Oule6y2ZHASsSQXQHWGkm0hJ56fSptN6RO016tOo0BQ5oGPFs0hHxa0DGHU8?=
 =?us-ascii?Q?5K+wB8n51FNh63vp1sE74vPac/yaEKPF2EnXCbYaTnG0Gj4Ay3CyR5uCz4f3?=
 =?us-ascii?Q?NZGj7narZp4RdDANKgym6CarOccflyoyB3b06bla/gJxXqI3rhjpX+afHdCe?=
 =?us-ascii?Q?cRV7zXvpITCV7CnbgqUSF5XtJytHrQkME+4S7yltrZS7fcnRUHBCPLaXJ5+M?=
 =?us-ascii?Q?zKKb4PhiBfIRSuqR9dGKZCQok9AbG36uGeqprRg+EE+ND6+qerJ0Vw27QFtj?=
 =?us-ascii?Q?EQm8wcssjiKulM9VNDj+L5IB32GOjbWMfU0XzYa5yiJk8+LsLdD5nvRFF7QP?=
 =?us-ascii?Q?h+PY0hd1aC2Rlvq5up8nw4kZUTOdNon+9MeNNP1n8yVvZufYxXapCXpG05XB?=
 =?us-ascii?Q?/g/0utd2IMfsj6wViDXChWoXFj73n9QJ4ykam+vGMR1QacE/FsUATgIPidUC?=
 =?us-ascii?Q?yWr6Df+TnRc6y6GA2+E9mmdHiJTP943t/VelWw3MjxFImDPszwyd9ZPZGmyc?=
 =?us-ascii?Q?rqDsGp7enwQ1K4455E2l6fBXQPHHGaHzJ+IYzPgJp+75IfdTMp1xYS727ePC?=
 =?us-ascii?Q?UEmX+QIeqz6wgXs3Hxb3KVIW24bxkHXa0EQoRL27fvHB9AL6oks57AyCdAFP?=
 =?us-ascii?Q?fUISMmn1H+4VmpDKHyH21fR8gVoUg0Jj/Tv4rWPUgvC9A6o8943Pn5sEYE/o?=
 =?us-ascii?Q?/vMppKK0DUGMZ8vi5MMS2SiZpK6xu4WnRcRLC5HGEQCtJnl3P8Ei7Tl3DT3+?=
 =?us-ascii?Q?6kULUM5oErqiM75VgRuf27ZcgyFt9SScMjMrMaweNs5mWNc5GjvxOdWNtWDs?=
 =?us-ascii?Q?w5nfT3eNMdZQDLkJ+Qi2QIc3ErL1Sj5LK9TXIt0ZFZ28s2nONTCCsoDPiJMr?=
 =?us-ascii?Q?D/BJ0cnZYiMUpFs4zYu77TwA/4NU0p3R5SmPkQrb?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ae866d2-09e8-4ebe-b3b2-08dab65e6e03
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 07:56:31.7230 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3HFUeRK/LkCFnKhTeg8bIYrbzK3embcSEeWnrdVUpM4uRO7dvip8HmOqC/PMdLxDZhH7FTa1cK+89DuQE3WZDg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5284
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Remove the local 'err' variable for readable, no functional
 changes. Signed-off-by: Yangtao Li <frank.li@vivo.com> --- fs/f2fs/segment.c
 | 10 ++++------ 1 file changed, 4 insertions(+), 6 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.97 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.97 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1onEni-0005ES-8x
Subject: [f2fs-dev] [PATCH v2] f2fs: cleanup in
 f2fs_create_flush_cmd_control()
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

Remove the local 'err' variable for readable,
no functional changes.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/segment.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index acf3d3fa4363..ed247195a20c 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -620,12 +620,11 @@ int f2fs_create_flush_cmd_control(struct f2fs_sb_info *sbi)
 {
 	dev_t dev = sbi->sb->s_bdev->bd_dev;
 	struct flush_cmd_control *fcc;
-	int err = 0;
 
 	if (SM_I(sbi)->fcc_info) {
 		fcc = SM_I(sbi)->fcc_info;
 		if (fcc->f2fs_issue_flush)
-			return err;
+			return 0;
 		goto init_thread;
 	}
 
@@ -638,19 +637,18 @@ int f2fs_create_flush_cmd_control(struct f2fs_sb_info *sbi)
 	init_llist_head(&fcc->issue_list);
 	SM_I(sbi)->fcc_info = fcc;
 	if (!test_opt(sbi, FLUSH_MERGE))
-		return err;
+		return 0;
 
 init_thread:
 	fcc->f2fs_issue_flush = kthread_run(issue_flush_thread, sbi,
 				"f2fs_flush-%u:%u", MAJOR(dev), MINOR(dev));
 	if (IS_ERR(fcc->f2fs_issue_flush)) {
-		err = PTR_ERR(fcc->f2fs_issue_flush);
 		kfree(fcc);
 		SM_I(sbi)->fcc_info = NULL;
-		return err;
+		return PTR_ERR(fcc->f2fs_issue_flush);
 	}
 
-	return err;
+	return 0;
 }
 
 void f2fs_destroy_flush_cmd_control(struct f2fs_sb_info *sbi, bool free)
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
