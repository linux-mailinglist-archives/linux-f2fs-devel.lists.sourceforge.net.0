Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5708E6763EF
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 21 Jan 2023 06:12:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pJ6BB-0007yU-Eb;
	Sat, 21 Jan 2023 05:12:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pJ6B9-0007yN-ER
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 21 Jan 2023 05:12:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KbOLfp+C61OwahvHurX+eHEtuLLG7WtQ2vGbdLyITn0=; b=j8fgoqotzKcdV41Qwes+gwPAXO
 aOcfmFtpWf0Gvweu/e7QtkIJ6GzG/Y80cG3KKdIjmnZR74jm9N30X8nylAm4hcUWHiCsNveGyr9VC
 Y/C8zEnL9W6VmBMrc4ph9AP+kMDxGNln7hWNcSJmVFIhpHUrEpfCnZr+/2rqhGLmKsNA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KbOLfp+C61OwahvHurX+eHEtuLLG7WtQ2vGbdLyITn0=; b=Nam7bWXQMO4tEdToraxzP/fy9z
 v6J1xHHKDuVR8jwWzRRTWOZNbT60D0DIR0TiKAP/lT3QwfvZQg7NcBkpznS/zzjpDbRiVFO950txp
 YFWX0+EsBBCjXkf+xI2HvgObBq9akKeU2rNTLQIYGRomkdf2TMZG+YRlylcER6Z2cC3Y=;
Received: from mail-tyzapc01on2109.outbound.protection.outlook.com
 ([40.107.117.109] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pJ6B3-0004FR-Pg for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 21 Jan 2023 05:12:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=f0Tw9QmIkcQIVBOf/zOfo1d13SVoWegd9DHQSqrTknBh47QitSlEzEByvIC7/JRdFqFFaoHMKmT62j2hLzLzV14sPeuNHgQsZSMiYKOR4M9KGg0RoBde5qZPjCwIUXmrVb9UlBnMpfnwLFjrUsFRoAFl2pz38X8IZRtgMY8nE5lFqvwtDSPr3fz8UvLvtGfNs0F1CnyIvHjfWvKcIBht0JxLYzJvjWWkWK4Rf/Sf9BKzRIW/n66U9EvhFVpTBk0Vv+5jY+hrCZePAtj4P6XTB2ZpR4kxYWn3RZS+xdFg3EpDLzbCMifcCdrnLf8V6a/irB0C655ZGomIkbHyRHgzBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KbOLfp+C61OwahvHurX+eHEtuLLG7WtQ2vGbdLyITn0=;
 b=ZEXxmvQdzK/Xirh42gDS0eMLFKGlOXxM96JPONE8LQm/ILAXk1/4hW05ZlIMwnLYCDuLi/VjanDwfDOZom4MJBSxpiyRn7MCj7VqHsCmzXPdV7TAUOqnD1wNI3WY6E2mg9dYo6ZlzXohiD9y/10cSgXbF8356XxNrYCrZOz9N0BCDLrqZQP6YStXzJzpOlhIUptTtqjS8kXMt/+2rpHBR0ddFkdSjGzGczNEp7/I3AM1aPtGxcCC9gH4DwLWbXQTTdXMs0SnhS861Ey6AN5tVg695jeMVI4DZ0Ak+u1WxvcFC/gyyQMC7GPtEbhXRVI3S6GqHfGvVdaeePwSollglA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KbOLfp+C61OwahvHurX+eHEtuLLG7WtQ2vGbdLyITn0=;
 b=FXgC26/V8tZShp3IXmaXv8CsjA48kNb2FRj+g8RJALa83Ynrs5bAmRtSJXbv27rIu7GJ8rcEkqSeHiYxNg9ALrNXsmu34fBXCQECy1xq3dbQvkVv9nlmhA2Zs1qIPSBL02l7x4UnYOoo6WJUWgIg2xpUceJ1C2SwjOlxJs0RBM07JMdggvTfM/66j6iEtlfjMGx/Eyfdq40JVumAgEqW8yafsTfdxt61k1QSk5j2DWyATgwCBNeSoZfAeatTJJzKxUIck6Af8cmhvY2NeGo6rcx2fV6OyfZkvIgFMqi1Y+6D0vUi0bvSANQhOdaDU1pxfor7yG+uHsuBLiDncb52oQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB3885.apcprd06.prod.outlook.com (2603:1096:400:6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.9; Sat, 21 Jan
 2023 05:12:20 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6002.012; Sat, 21 Jan 2023
 05:12:20 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat, 21 Jan 2023 13:12:01 +0800
Message-Id: <20230121051204.81251-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230121051204.81251-1-frank.li@vivo.com>
References: <20230121051204.81251-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR01CA0008.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::10) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB3885:EE_
X-MS-Office365-Filtering-Correlation-Id: 155d1182-325f-4214-7c95-08dafb6e12c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X6z5n/mXLGz/xdmqk2ndjrfNJmG0ZReENk0YfttpA55KtR/43yZlf4C87qJmkPt7VQ2z41p56ILJECT6VI0pJH20hfr+HWsZ6osZvrb7a7fXGbJs4k6uZxKZ8lxqWmv1f9c0/SOBmSusGyrJa/usS/HaLovwzwW3PIfEVXLRCSsdtx1IR008q7xVnqSXoZa6WUxb6hTwwx8yV4TjqXsZ2U+KHnYR3NIsj8oEaO37w6GUGsf6dAfxItEGOBk1+ULcO3wjANe1TyerUBOd1cjhl44PrYCzwO8+Muhv+S1iwTVn2oIE3xZkqYPWGuSrgaWhG3n+TOGA5WbFTOrFk0uROEyi4HkvVVlCEWZNas6r0jucUnSs1RnWSAVWeKZA6nraBGlRR6nncDP3SPsGQSkrnh+UkfuVAjUoXWc4GIc5SSnxlMeK1Jqu0W7UGGdFhpy/6WCylvZIstoS0Ah041f3aTtY2cOYazMME3CIZ8L9KnuvBfsYDyV6zmLKBqs7L3PZ5a/lrhUdyrBwCDglNIiwrhW2xEf2Hth41zBkuN+fsiudIm0e+6oDG/JLlMrflxOAcC6cJM23BS0AwofxA1761PWUGSNfaezbwMYdn7fL4aKO6p5Qn/30ILB6rddXxYcGeRTzlhvUmyGvJh3ggkiPKwZFcpZ9PiMB6ccb1qncEmkKLlYiMte7tSe8QOitHkFiVaP3ljtio487Nemxkvzwbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39850400004)(136003)(346002)(376002)(366004)(451199015)(38350700002)(38100700002)(86362001)(6666004)(5660300002)(8936002)(2906002)(66556008)(66476007)(8676002)(4326008)(66946007)(41300700001)(1076003)(2616005)(6506007)(6512007)(186003)(26005)(83380400001)(316002)(107886003)(52116002)(478600001)(6486002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?VowNYdePBquFFFJ9Pcb7v+Buq6D9ZVbBeFU2F9SkDzfflR3nfUNxs6uTOBhQ?=
 =?us-ascii?Q?WeobkH4ZdMzF2V09GN+6Yphsu6quCvYrv2OUJam+PD53zWmV6dPjmeoYJmGl?=
 =?us-ascii?Q?C74qHoekhqV5bIAY6WVnb3QGBcnybKZJRPxidZxv5IKMCGDZwaFcpMScU3+Q?=
 =?us-ascii?Q?YOS4C4J2egEr2leUS2Rd20aEM/0OXAdCveKsUqdqLQVdFtVFPPnjDMHDgdP/?=
 =?us-ascii?Q?TxxdMZ3bR7/aXZyeBfn/pwPqZ6eB5FsThtMEqS/y0QPX+bT4Z9CmEljX23u3?=
 =?us-ascii?Q?EsmXZ2c5MklLohV7DcEouMdZPnpBTSCzvO19ojKcVhmcdju4q+0on+HtVdSA?=
 =?us-ascii?Q?A9q6RmDgRRebd+ww9aEaXJV3k7PRoSZjLDYu0Xaubd9eDkg8f82nIbHslFR8?=
 =?us-ascii?Q?OLPWRtqKVzPJgBrwE/n17tX250DCHXX+QNdZbLD+/JziM7eQfDe7HLMwQnb1?=
 =?us-ascii?Q?MF4At/ifiHsyMP+9OPR4s/IEhiiOpK8Z7VREVLXHEFS3fjF5VRaQuUtqC+Vo?=
 =?us-ascii?Q?pbXOsvw611f59qYjUALVhB/ckRc3E4m0WQ+Ff8GVKGs4tYIKT9/TMrOlACZZ?=
 =?us-ascii?Q?3sEboVrE/jyja/XlGqiqrlkfdvOUErpNIo1xi3wcASiVkGTsnDPUmjU3q2k6?=
 =?us-ascii?Q?qTunuCUsaTaEX+fylMVa0zsBXrHpK+IdSmWanSwD4KEGjfoOAMXY0NUF5zzK?=
 =?us-ascii?Q?Kbm15+a9jgwPyFhy7+imqw/hBJRQnffgJ2hA9oCA8g/CQaayPwSJGVd0TcHO?=
 =?us-ascii?Q?JLQITtaassgD52bAPkzolB/w2p4bUtcWIQVR60Ta2wLCtnQqJWgXswo4vqX0?=
 =?us-ascii?Q?H3VfJGqKG+RD1gpQMnQ90qKhtuvrQsJ7qbwHj0UPlWYcyPLejplolVZv/TAK?=
 =?us-ascii?Q?whdF7FoIHkrh0EXoVUytlhBZLY8YhDrHWS1QhWMyzCOZjeDhM3xHqv/vUXTi?=
 =?us-ascii?Q?DhMKfipagX4P8Ki/YObFgd4Ldi7Yw8j4Q/eMP2Pz2nT6sm46B/o2VTm4kV4Q?=
 =?us-ascii?Q?+l7Td0t8cEf9ddvwxHQNwsnR/w1KEc2Iqy6xrUPurrHfX72QCme92Bdsd5/R?=
 =?us-ascii?Q?ueaWVtIjtwYweLpfxwLnqDjpy2rNIVvAlxL4WD9u5DR+ftmavRTotFRxlZj3?=
 =?us-ascii?Q?NPpJbRXPWEfl1zCs8pOHWG2WpWCiYXbfoVVn+HOHLqJFSmXt9in/gr8Ke6Ya?=
 =?us-ascii?Q?863cBRvdJJJlcTlFsthwVnCGuf4Bz/Uot/YQan4AbNgl7ajEARq8NUd6IGxL?=
 =?us-ascii?Q?+PCYjsWUmH9StHFyyhQOhqXV1wTZpZmjVNYEbZlOK6Zq/xBYzdZuGklpOy3V?=
 =?us-ascii?Q?TIINsl2HK5FjUgP737LI9YWkuXD9CDFty4nX1R/LpZUvhaDkgiO/Ogq8GrRS?=
 =?us-ascii?Q?kZNprArxgf4pf0NAW64CkGolXpsXXXI9R19wJnNXF9HFmqx8yTsxwKNZpNBf?=
 =?us-ascii?Q?bcB7nc6R60oVyRNuSD9XSgnGmTgTwO9uykcTLsF1W38sXEOsSAazQ4kL7xhV?=
 =?us-ascii?Q?mmx7wP42etJkxaqPByPWbUBp9xB6djTY4g80wST1Pea9mwwcKRYCCQ8VillY?=
 =?us-ascii?Q?35iW8/hyLrhC6pdO3Uyl3cnkFdrr5nWU8d8VySlV?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 155d1182-325f-4214-7c95-08dafb6e12c5
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2023 05:12:20.8127 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zjGOgd53t3Td65pvlkGmWKrAPXnd28E2zODZtI0DpHMbIfjAUf5OV/E8A5DtwI7y2aJH3oqM2U01cJ142pQvPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB3885
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  For LFS mode, it should update outplace and no need inplace
 update. When using LFS mode for small-volume devices, IPU will not be used,
 and the OPU writing method is actually used, but F2FS_IPU_FORCE [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.109 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.109 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pJ6B3-0004FR-Pg
Subject: [f2fs-dev] [PATCH v2 2/5] f2fs: fix to set ipu policy
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

For LFS mode, it should update outplace and no need inplace update.
When using LFS mode for small-volume devices, IPU will not be used,
and the OPU writing method is actually used, but F2FS_IPU_FORCE can
be read from the ipu_policy node, which is different from the actual
situation. And after remount, ipu should be disabled when convert to
lfs mode, let's fix it.

Fixes: 84b89e5d943d ("f2fs: add auto tuning for small devices")
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v2:
-restore old_ipu_policy for fail case in remount
 fs/f2fs/segment.h | 2 ++
 fs/f2fs/super.c   | 9 ++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index ad6a9c19f46a..704d27ad682d 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -670,6 +670,8 @@ static inline int utilization(struct f2fs_sb_info *sbi)
 
 #define SMALL_VOLUME_SEGMENTS	(16 * 512)	/* 16GB */
 
+#define F2FS_IPU_DISABLE 0
+
 enum {
 	F2FS_IPU_FORCE,
 	F2FS_IPU_SSR,
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 0cedb693db58..1d2796863f8c 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2156,6 +2156,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
 	struct f2fs_mount_info org_mount_opt;
 	unsigned long old_sb_flags;
+	unsigned int old_ipu_policy;
 	int err;
 	bool need_restart_gc = false, need_stop_gc = false;
 	bool need_restart_ckpt = false, need_stop_ckpt = false;
@@ -2179,6 +2180,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	 */
 	org_mount_opt = sbi->mount_opt;
 	old_sb_flags = sb->s_flags;
+	old_ipu_policy = SM_I(sbi)->ipu_policy;
 
 #ifdef CONFIG_QUOTA
 	org_mount_opt.s_jquota_fmt = F2FS_OPTION(sbi).s_jquota_fmt;
@@ -2212,6 +2214,9 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	if (err)
 		goto restore_opts;
 
+	if (F2FS_OPTION(sbi).fs_mode == FS_MODE_LFS)
+		SM_I(sbi)->ipu_policy = F2FS_IPU_DISABLE;
+
 	/*
 	 * Previous and new state of filesystem is RO,
 	 * so skip checking GC and FLUSH_MERGE conditions.
@@ -2417,6 +2422,7 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 		F2FS_OPTION(sbi).s_qf_names[i] = org_mount_opt.s_qf_names[i];
 	}
 #endif
+	SM_I(sbi)->ipu_policy = old_ipu_policy;
 	sbi->mount_opt = org_mount_opt;
 	sb->s_flags = old_sb_flags;
 	return err;
@@ -3944,7 +3950,8 @@ static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi)
 	if (MAIN_SEGS(sbi) <= SMALL_VOLUME_SEGMENTS) {
 		if (f2fs_block_unit_discard(sbi))
 			SM_I(sbi)->dcc_info->discard_granularity = MIN_DISCARD_GRANULARITY;
-		SM_I(sbi)->ipu_policy = BIT(F2FS_IPU_FORCE) | BIT(F2FS_IPU_HONOR_OPU_WRITE);
+		if (F2FS_OPTION(sbi).fs_mode != FS_MODE_LFS)
+			SM_I(sbi)->ipu_policy = BIT(F2FS_IPU_FORCE) | BIT(F2FS_IPU_HONOR_OPU_WRITE);
 	}
 
 	sbi->readdir_ra = true;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
