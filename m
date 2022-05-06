Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B109A51DE8C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 May 2022 20:01:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nn2Gu-0006WF-02; Fri, 06 May 2022 18:01:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <guoweichao@msn.com>) id 1nn2Gs-0006W8-Ki
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 May 2022 18:01:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UL4AQM7y6mAn3sr7+DNVo2gp3MHi0iV8fvuu7i9ntmU=; b=aUFZTHoqsarl0H8GdcXJZcRcwy
 SAyQhi9RR+e+UHdUw5bapMGwXVrqI8hHlxCEsIgShQqUzMG9KCJhU0yg/FZjg1YIrLIYCwW8xMlS6
 tT8Q43ygQEC61xK0ab2hzc3piVB/fSGLdtWsQXOL+S2/fCQ4OmDRlwx5wPztHw0r5Voc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Message-ID:Date:Subject:Cc:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UL4AQM7y6mAn3sr7+DNVo2gp3MHi0iV8fvuu7i9ntmU=; b=N
 vsdlzz9PEdf1qDYjgDoXYDc5u741MpVbMvSeZJtbOGB3P7i2O5PSXxJj8ebfwsIuHRWQlKZrmnSRY
 pqPySdpxFSHCx2OhDalFgZbELRwKGRz9/4b7VPtFJIRQI5C1I9lF2QThnEao7rT8cIDQaUS5ivYLg
 sJ/Yw+Zfyib6V1z8=;
Received: from mail-dm6nam12olkn2090.outbound.protection.outlook.com
 ([40.92.22.90] helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nn2Gk-00017D-Jy
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 May 2022 18:01:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=odcIf0/EOUDbZdEDvDT/R9eDCtzJ2mt7/BOa1zbaLo4cK21VZ2ctG3xyjW9oJl6roBoXifxd4dyOkFV237d6dFUiZwMgAJrT+j6dTcV9DKWqIoyTD78Mwz9bvlo63/am/59mZrZ3WEITYet+5D/GfVpso6iZhP9G4PfeQIZM7CiGqPDf+ZHWi1uSOvi77+B9/MRTzqRLlLJ2C09L01b12fBpG7T35LbvUogxzU/ZE7ZlTvS9tX3SnLI97kOGsxMhT9eFYUmOrSxJXuZQ7T2Wo5Cif5Wtb2Ex1iqK6enTt64vIpHSOXVNawjLOx7ETy08kROO4NEUvG9wXP21fCG5ZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UL4AQM7y6mAn3sr7+DNVo2gp3MHi0iV8fvuu7i9ntmU=;
 b=SWJU+/ddHhPmV0Pecxv2GtOGbqrCe0Qh7F6KWpm/g0R0oBhgLgGp+JNiDR5aI9YEoehIYcJ37JV6WniDpBuQQcY4PtYg2pgwCe5tzwSglpxT4bDufLeQpNIUJEEZ9GYamOa0TdGnIIJKq4Sy+L9RFIYMVmvNBePLjjC+QUQ0BDWFYLI2xPXNCn5s7mTD6O2/bUr7DMSPkD+Cn995ii0M1BEr+N3qm7x54Q/B30a2bMVb6d5WDGUvxjb0CBNftzCH7dS7FrehtXvbCy1ug658vGE7B3mnZ9YNpba1gezBeIBAZ1afELyo8X8wPPpKQLDQTvk+6GIcLVsxkVqRITTf+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=msn.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UL4AQM7y6mAn3sr7+DNVo2gp3MHi0iV8fvuu7i9ntmU=;
 b=YgdRldKyOhMdPPcTSXTYrwCsfVohqopaFi8orAKqo+rdp0uRKSBRs9wg62Yi+fu0U3rKSOJX90MN9XBoPoa8mAgX46fDOiZLkE/yi2wIiLpAKoC9qY5yydWGX+D0NJzczP9on4YL5QPDby9tDDcyAWLmbYy8VVc+nc+eb8YHs8JtRcwBKrKMcmP/FgPNAXNMGDxPtmvCb5AGFBJx8sMxmAv9REWJzGdAwAiZ4Q92NwkQSRNpn8vT7DBnLooRylBeq/PuEqbGsQfVcXF+9I8izxJnTBvjYtuORp7MJj3Ypk3m5/KyfjycLAl4z6HWYq0uJZzfghgUFu1FbVMmHMbvkA==
Received: from DM5PR17MB0953.namprd17.prod.outlook.com (2603:10b6:3:2a::20) by
 SA1PR17MB4674.namprd17.prod.outlook.com (2603:10b6:806:195::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Fri, 6 May
 2022 16:28:25 +0000
Received: from DM5PR17MB0953.namprd17.prod.outlook.com
 ([fe80::c9f0:e210:56e4:a81c]) by DM5PR17MB0953.namprd17.prod.outlook.com
 ([fe80::c9f0:e210:56e4:a81c%6]) with mapi id 15.20.5206.025; Fri, 6 May 2022
 16:28:25 +0000
From: Weichao Guo <guoweichao@msn.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat,  7 May 2022 00:28:14 +0800
Message-ID: <DM5PR17MB0953D6D7C81E3F4B54DF1006C6C59@DM5PR17MB0953.namprd17.prod.outlook.com>
X-Mailer: git-send-email 1.9.1
X-TMN: [3vqHdmVUHIPmOEwhDOlOpxsYJ4c3VWCW]
X-ClientProxiedBy: TY2PR0101CA0021.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::33) To DM5PR17MB0953.namprd17.prod.outlook.com
 (2603:10b6:3:2a::20)
X-Microsoft-Original-Message-ID: <1651854494-5233-1-git-send-email-guoweichao@msn.com>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 96f4f053-7ba4-4e29-43d7-08da2f7d7173
X-MS-TrafficTypeDiagnostic: SA1PR17MB4674:EE_
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CEjCDbxlPYnpBiMOq1KvPTQUITlMofxXecGGowl0WckMjonTXtMLc6rLNm3Sy0gXXDq63Nub2xVmZPEx+tflGgYOwY91ej+jIK1pFrhh26MrYuO70paSLhyoNR5AiPJa/wrmu9bhP6Ksm8q4A5UKj/RpH9OvIWVcqS1IT7zUfeZJDxrENDJZCKHumZ/FzD8Mjb2SV6vcInRd6ToUptZMHi+VmMQzkcIHV8JdSi7RbJwVaNVJJcXZs7vOmfbM37Cz8hvqTujzNNPJecn6moquFj78aSS02W5oK9UEQKYoVZCS4o1sZ0vaEzzzDG1OZY7QQqIAY9I8aPf78KA5JoPsm5Hnn9WmoJC2AxPUWb6KDCHuYWFxDiralav55hVpZ+ly5wIO8fmntgQIAZWr3xVxhVRuP4s6WRXhKK5rN/NOviA455vIwLcRp16ZTxPg6os20wTDqVsiKTsjqnp8/rSVXQuYJ1BqBuzo6dw9GcArTaRNNSH30IGKYxtPnQ9iVM1iQYc7jZ6FSuLGeapxabdFA4urY5bKjhhFqK4i+OBsrK5PkVC8UZJkR4xldNTH74Sq2nvXl9peupXdZELLIgfMExXbSHNSsUuMqoxDRBTHmbn1OB7IcZrEm3uWYMgaWio0y+lj10aoqPCHUecF7X7jLA==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UQAqjuC/t1UNNAzQ9otIBLh5M+fY+Bjh+KHv7B+fiOOCgcpCbHqRrR3pWE7O?=
 =?us-ascii?Q?Nhg/WpOKEy8O2Ftq17x9vvANytqXjCpL2bVbKQI5Ddhyw4+mh093sY3r/O5u?=
 =?us-ascii?Q?0w0LD17MBtsAg37yuWPmHTynQyKj5HAFbm4RDM67oCwoPg2IGbyFm3e98ePb?=
 =?us-ascii?Q?tBGSyVkSGuN/ml4FMNz2xhdJhrHx7eaW2FOcdOBdfrmVbbTTtvH0wX25xgQg?=
 =?us-ascii?Q?IIW2g1YqWH84D5ryNw2Kc9cp0hrp57IkzyP/x11SL18TyMKjkl0VVyruHPIH?=
 =?us-ascii?Q?ld0w78X/SrjvC9fmRAK0Bk22Dvh3lu3TF0Z12oJ8x7P0xfnU3ysuz9mhtTwr?=
 =?us-ascii?Q?gkUIQIvPGMXEk+kgMH0ZAAcMEeL+mDstN4WW8pJsg/7I4VtlzvwPEdVvsojy?=
 =?us-ascii?Q?qETUHXwL7hCNJDKEXd/lm88W0hZADQd5kS3BDiPB/HvYgcyQu84K2uBeEBkR?=
 =?us-ascii?Q?Gf5k76f6/BWAQec1rHdupHSgWuh5drMi1Lt0V8vrq8ebYiyYuS1lF1YCrHP/?=
 =?us-ascii?Q?3vtn0lFVZmEqv5Kt+Q+NpinLsxNSQlkGRa78lm/1hce9MRFV/8qU4lOn+YKL?=
 =?us-ascii?Q?XmfVD2vWjeJ2iDqFr4YvDeHtCs9UyuKghH/489ykzngepKUlVcfyYTCQVGo6?=
 =?us-ascii?Q?vGMy7NPc2mZJH5fan2K/QdU4kQIiY3EEmxBgGVKHo5559HfWGwsyS9Ig8bD7?=
 =?us-ascii?Q?ALRSB2GKOenIni8mQZ2kBHoUscU7tP2HizwGoxNEkUpU3nP8hi3mSw34bCZL?=
 =?us-ascii?Q?UKl2eWoQJa5TUTuF9Zzb1M0gt1deUFVzsLRGUcD2EkHHefo1SHgmYeELSD9h?=
 =?us-ascii?Q?IjQZ/du/jAalOhdU+n8TOas4M3Z5zRPRu8Bf5XmF4z9OWim8mxf4mja1tvrD?=
 =?us-ascii?Q?nTxWS8kJMyH/F+Uh5WkXR7MeQbxqxONRkXH8/e7KA00epTEbrNjwCsSVa6V3?=
 =?us-ascii?Q?LzfAHFo5PqHH5qSf8ByZWHORjtPM0p9PAolGuSMXijHrMzXMF8nftTSlfSwq?=
 =?us-ascii?Q?EaSresKrfVfPmHhxAJv0Mcx6I4kciY2V5lcL7if+I56sFUUqM3bv8nNbpRPv?=
 =?us-ascii?Q?1XCojIPWtgFHMnm0cUL377L1Zz1+fojIWzFWzZjiJcJldaSaFQjb+vV1bXJy?=
 =?us-ascii?Q?WV3p9MNRMVNVc/EiNH31jL+CYKmB3rgkwSHh9RHzgtzXoxrzdCPAEG3uVt/U?=
 =?us-ascii?Q?8WgmI6FtQciXxOdlPKo4pc5ew064B7eftLc+opz3RAF/J7MEzZPNG6Scsg+X?=
 =?us-ascii?Q?SzNH2ai8ojN5RcKx2dQfk0k8Xt69ybdg5SBdtJoC4ptZdXZg6+gwC7Qs31/v?=
 =?us-ascii?Q?uwvac14YiBoZD1YNGedH8XxDWjSys/HsmoUZTxuFlWzUJRyWCsUJP/UuRv7s?=
 =?us-ascii?Q?2ysXcsZiGHA94Rj1T2OjuUEkuD033tx25hHSPUCne4xxzLHIB42bJmmIoHq4?=
 =?us-ascii?Q?F/HrcZ0BoyE=3D?=
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-c704e.templateTenant
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f4f053-7ba4-4e29-43d7-08da2f7d7173
X-MS-Exchange-CrossTenant-AuthSource: DM5PR17MB0953.namprd17.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2022 16:28:25.2143 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR17MB4674
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Weichao Guo If the number of unusable blocks is not
 larger than unusable capacity,
 we can skip GC when checkpoint disabling. Signed-off-by:
 Weichao Guo Signed-off-by: Chao Yu --- fs/f2fs/super.c | 6 ++++++ 1 file
 changed, 6 insertions(+) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.92.22.90 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [guoweichao[at]msn.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1nn2Gk-00017D-Jy
Subject: [f2fs-dev] [PATCH] f2fs: skip GC if possible when checkpoint
 disabling
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
Cc: zhangshiming@oppo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Weichao Guo <guoweichao@oppo.com>

If the number of unusable blocks is not larger than
unusable capacity, we can skip GC when checkpoint
disabling.

Signed-off-by: Weichao Guo <guoweichao@oppo.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index d06a577..7edb018 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2069,6 +2069,11 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 	}
 	sbi->sb->s_flags |= SB_ACTIVE;
 
+	/* check if we need more GC first */
+	unusable = f2fs_get_unusable_blocks(sbi);
+	if (!f2fs_disable_cp_again(sbi, unusable))
+		goto skip_gc;
+
 	f2fs_update_time(sbi, DISABLE_TIME);
 
 	gc_mode = sbi->gc_mode;
@@ -2097,6 +2102,7 @@ static int f2fs_disable_checkpoint(struct f2fs_sb_info *sbi)
 		goto restore_flag;
 	}
 
+skip_gc:
 	f2fs_down_write(&sbi->gc_lock);
 	cpc.reason = CP_PAUSE;
 	set_sbi_flag(sbi, SBI_CP_DISABLED);
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
