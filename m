Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1573F6947D4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Feb 2023 15:19:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pRZfe-0003kx-1m;
	Mon, 13 Feb 2023 14:19:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pRZfX-0003kc-Ke
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Feb 2023 14:18:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eDFWDTXexUBb2oDNMvreaD10TViR+8VJmb02+gBmZ68=; b=UOvKQNOXzCc9CjLlfdEMZO1Rsi
 EpwwowxjkmVWLbwQ3Y+pJhPrgfdiaVvp+GyQXuaKWuTpoERZ0yKr38QmDtnO1xyVdqLmDbgMxTf92
 b2e8n+bBrvcj8K1tDzqwa00ig9k/WJLpZeQpF0fz8mZ79GeqYcDtUpoo1sUShfqizGHM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eDFWDTXexUBb2oDNMvreaD10TViR+8VJmb02+gBmZ68=; b=O
 Ftw8pTULRxCKUMo9isMDjrCWpZQbmZBK6ke0pGT2UjmLOJg+0YuXLl0ZVaO2CznvXmFXIaGxwyByi
 G0/O5GNy3S5U5wjiIBYq8bbnX6q8ziSPyjPtmBehFEX+O3xaHSDxc1kAWbCGo6Q4XTWtCljb+oyGr
 3bOan4Y5gI2Tbs2A=;
Received: from mail-psaapc01on2121.outbound.protection.outlook.com
 ([40.107.255.121] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pRZfP-002ooS-Ul for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Feb 2023 14:18:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E5OH0fRHM2eV6OsluyHiDvBCicztRoc11MQ/YTN7AsBpIO8SxwfPF7xMskuag7YUcPkg3kJtKG50X3A/G4wiG5jICc+eb75L/pzd2bWCjtlrCkrRTfmB0blNhtztJksGtO70Mw81Dj4aNq0c3WkEqwOlTF/cHnzAbFgoWWSDZAN7DGHNw0bV2HngFPv8/hY5QnNtEZyz5PxfunC19+tNX9gCygmSKJcIJQ0XZzy43bPhLUboxeokv3uNP4OytfBfzcPFqFtNS6eCXNSSpM94PMgSPFxdIWNPO71BhGdZULgEYp0xP45R75frVRiRcEVST+Qgj3+HH22RVOeNg27yCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eDFWDTXexUBb2oDNMvreaD10TViR+8VJmb02+gBmZ68=;
 b=bBHVmIFJdOxEXBcXvdDs1yJtZB+VlnUfSYC1JzylV37F8/+f+/9EGPZl3/9dEsyzqc+kb950egsQRjQLteIcFY7dHDGA0A4iOIZqtXHZeNoPW+8Ko87t+PDfpKPN/hWTmgvI+diYbaYIo4lKSiw2mUnYU2qXDO2hrBdfxnyOk3sMkbFrkzyfnU5ehfT2AM5wRh2pRgAHKg28I80tOx3Jr911DTHSDWDnfl6eImZevXTeF7Bkp51LKsE4PLA9dqsWPnwcns6/WlTGq2lbgGFHbbuS3NL0YOfPS4wq9fuzUaKLvMfUsG2jPXvyIKR5tdVFvbgV/TK6ea2DzGEKxFHiBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eDFWDTXexUBb2oDNMvreaD10TViR+8VJmb02+gBmZ68=;
 b=qLrbt1BNRdUmzqjnTL8tKmffoh964WjUKLINzC6DVlAwR4GPyhjmWLnTfVs6H/SokbNxPG84zjAVAZH6b+2M5xeFz6cwJylLD2SSHB4/1XbhflTfi2A3LCSRisLoQ8F4fy6LGgYd+BOhjHtv+p4MwE/JJJR0Ye2Zol/iX5Rgd3JAgLEOB0h4//QE1zHIrToFlZfbTF+oKPTDXjPxqTrdoV8SS7o2Zd21g62jveE/SIClNLZtNa+lUAMGbzPKkRhaCOjqvUV1PvW7TdARiAmEEvG54/sxTtDZqUPR/CrSarNkqfU6aUK2e5HvSuojoI2ZbSmZe+4aZBLKBbTOlR1zPA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB4083.apcprd06.prod.outlook.com (2603:1096:820:25::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.10; Mon, 13 Feb
 2023 14:18:38 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6111.010; Mon, 13 Feb 2023
 14:18:38 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 13 Feb 2023 22:18:24 +0800
Message-Id: <20230213141825.22858-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR01CA0112.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::16) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB4083:EE_
X-MS-Office365-Filtering-Correlation-Id: 955b7598-b560-4735-4adf-08db0dcd32f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cKqD2054K+iBG76s/W9cASTnPGoR8THEtzpdcO/04LEopie4vtZSm8kXqI9QTllRcgSHCYIWxBrgemdZhvMa7WVtSvVgCNTgqtxw/Bv2Su+z9TMbC7SwWkX32L89A1FKD3nLm1CyCuNhMaGQV/uPJafNB1FoqdXAmaEJWhq+bmwinWVBy71EFakg07aAULnEd2zsJ+/ku8qamFJKwmMem3Kiewn4r9+/cXcPk/DoQwHJh+SjBSs3LvCfnjCUg4Q5FmAZl8MDirreck9spsKllssNhYrgzl+nkKmsfPHADRo45vaB1jw7HH9a2/OGjQS1jqfYRtwlmZypilB3uMSXbL3OcuGMnGU9q2LGZi1B/i5ai+PGX6n2VD4oITXgXGP3etAGfXRukEMKI3CNzlfLZQX/U8jAi3P713PcHZanig2Qd/oezQwQ8ftONeu+akHGnSxEPmwZcjr9OQhzbeHNoQwXIBxbvHxN1kuTBdMl3JfPJCsy+2k3KxSix09TG1hIqh1aNAiuK9ok6zqiC99I6/e6uLIWdzAk8g++ayyvgYetkaJ/YoXP5h84dP47bHddPItm3Dak2IZ3+2Hnl0RgFz3gdhR6q2Fe+jsVP5bz/KiTcZT2FF0+7aP1t3Xj+wib7xDfeZePqtVtOjYSI7ukF0YWBZpeg6P1ajX2p4BmV7tNxrjgbxjK9NRPRYj9h4f8zH+jIyAimHnTOvygNZOYZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(346002)(376002)(39860400002)(396003)(451199018)(38350700002)(38100700002)(316002)(86362001)(41300700001)(8936002)(66476007)(4326008)(83380400001)(5660300002)(26005)(186003)(1076003)(6506007)(6512007)(107886003)(478600001)(6666004)(66946007)(8676002)(66556008)(2906002)(36756003)(52116002)(2616005)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+g9p9zvpeWBmhLwMwHrgIj1uXTQ5cMp1o9Qqkz8a8mcJ/V8d/yk9zekfIBHD?=
 =?us-ascii?Q?xGwyHnewlpLmuszR0CpbcQWMeZcmmLoUPvQlv2uf1Q4XGRymCEofSMh2VhhT?=
 =?us-ascii?Q?CtpI9C5K2H56uy722XAIH49qUyNrEBlIlEY0HlLvwVLDqEUOdk7WtqKClKco?=
 =?us-ascii?Q?j2aHSXwbxAUbVQJcEpAMqtm3rmchkyfZZhGUIiTj8MLz/9n+jgoPHgnEK/nx?=
 =?us-ascii?Q?NVK835XvlMb8vXnyo6V6g1AXwk2HcJuvLIu1jqNailXcZI3JYNZUXp7EfRK+?=
 =?us-ascii?Q?ndQlm84dhX1x/2mnlQaVVZR/EMwmGm2NFed2BGK9UUja0tGmfnWXeb0XuSRc?=
 =?us-ascii?Q?cMPJmU9/KcuDY0GETJ1x2TXfCM1ATAbvzBCP12ijtjYbyCa6ip+s8ojnt8WO?=
 =?us-ascii?Q?+UjgRo7+ELyJWEhyPw0nhbWR7g9DUoFctTxPIIDv+U2/WfpwUtVXcfUxqy4d?=
 =?us-ascii?Q?/UzK9fYCWwtHJXGtIGeWpkthmaQVerE8X6xpTHpIEL4c1jSu0OWXQe4nw8DN?=
 =?us-ascii?Q?1Tmec1cI4tierFyjX3dqsRrhrQza1opJKcy3Lb/9SQHWTDZ79fwnkiUuLzvg?=
 =?us-ascii?Q?8O0SasN/RIP/p7B/fv59zhhCUZ/O8d+jI9s9wC8/prLvy9o/KwXTJshzLcYd?=
 =?us-ascii?Q?HN7GDKCb1ioadaDQRqS3lRQ806Jh/mogFDu/hDWJi1XHRdcES/cexyjgdvcG?=
 =?us-ascii?Q?y28w0l/K8ZScn8EySkzB4DEPl3SpwDgWEfvgbLGbvShYvAyJdilLWTICCq65?=
 =?us-ascii?Q?qtxeTKFWN/rqqEJNGm4a+ns6m1X2kmJ+XwfS8FNX1KXjLiQtwbftoF2YnOkr?=
 =?us-ascii?Q?S+LyY3OMAf6+tzsbh1t55J80kmQ9ZZzLw2CgPlopsp29CjDDINJyas1NkedE?=
 =?us-ascii?Q?6+DGh6dojx8fKB2Z3wWQor3KToIPItLLdDoZsWu38Yr22cl55arq8ISSxvSI?=
 =?us-ascii?Q?0fDrWCdr7DiiKITbFuAGceQYDQX3LL9zv5OdMnv1xPRd2Ljx927jIBudwJJ4?=
 =?us-ascii?Q?MCV5xEPQyVSopNiuj5NfLjhRp0pt3guWaBzSs+XBh+3xr2M2qFPJVV/GWWIc?=
 =?us-ascii?Q?zpH1vpK1ye9XmbG8RuMlTkx3hB9o1cq4vIDWws+8BycRX1U4Ww+SDTx0cMZE?=
 =?us-ascii?Q?apJJyGfrYxTHRK49YQSTkD7kzvSznZkGF8JTzrmmL1Uo5rOn9Vqq5dTjUTJL?=
 =?us-ascii?Q?/UaIKZp5mQAvnr+4Sviiub2naOKQ2GzqilV+yfA+AhnfVtsY16zklIn4CeHA?=
 =?us-ascii?Q?Sh+QlH1nMNL4TU7vsto1BlIQYuY+d844fHwRAGEpkodPrjLIth4ZPh0P14Kr?=
 =?us-ascii?Q?R1zlX7nV0n2xCFJ9pxxlPsPf+TZlHOLUH9TneqGzrYuXn7pIp1jnU8ArXOHE?=
 =?us-ascii?Q?/B0YMrAlvP/WYFvyDnej70E4hE9NpogeF/Vu9cQ1vpg0+zlzqmDIFeTVLgRh?=
 =?us-ascii?Q?Gx0Cr9CVgHEFdd0Ti17uet3wUwPC5kMKsA/9bo2Ci4UOykZDcqsvz4E9Y3sN?=
 =?us-ascii?Q?R7xKYC50rt/hATGADiSGCelYqTnmEt4L+CwlB5kpXc+oFDhmQPfkydPIPLvb?=
 =?us-ascii?Q?ptq+CQmGVGDVMkwrRXmtsx1zCJnuYeEXcKvkg6nN?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 955b7598-b560-4735-4adf-08db0dcd32f0
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Feb 2023 14:18:37.8840 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N0Z15d8MAwiDS/kiZnY6HHuCBhHktoabqRpH8THryKoS7k0To59UvN0QeuWaHt+wLYcfCeuqAMk8HhavQNnu4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4083
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Export ipu_policy as a string in debugfs for better
 readability
 and it can help us better understand some strategies of the file system.
 Signed-off-by: Yangtao Li <frank.li@vivo.com> --- v3: - remove unnecessary
 '\n' fs/f2fs/debug.c | 24 ++++++++++++++++++++++++ fs/f2fs/segment.h | 1
 + 2 files changed, 25 insertions(+) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.121 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.121 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pRZfP-002ooS-Ul
Subject: [f2fs-dev] [PATCH v3 1/2] f2fs: export ipu policy in debugfs
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

Export ipu_policy as a string in debugfs for better readability and
it can help us better understand some strategies of the file system.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v3:
- remove unnecessary '\n'
 fs/f2fs/debug.c   | 24 ++++++++++++++++++++++++
 fs/f2fs/segment.h |  1 +
 2 files changed, 25 insertions(+)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 32af4f0c5735..ff5995cb9560 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -354,6 +354,17 @@ static char *s_flag[] = {
 	[SBI_IS_FREEZING]	= " freezefs",
 };
 
+static const char *ipu_mode_names[F2FS_IPU_MAX] = {
+	[F2FS_IPU_FORCE]	= "FORCE",
+	[F2FS_IPU_SSR]		= "SSR",
+	[F2FS_IPU_UTIL]		= "UTIL",
+	[F2FS_IPU_SSR_UTIL]	= "SSR_UTIL",
+	[F2FS_IPU_FSYNC]	= "FSYNC",
+	[F2FS_IPU_ASYNC]	= "ASYNC",
+	[F2FS_IPU_NOCACHE]	= "NOCACHE",
+	[F2FS_IPU_HONOR_OPU_WRITE]	= "HONOR_OPU_WRITE",
+};
+
 static int stat_show(struct seq_file *s, void *v)
 {
 	struct f2fs_stat_info *si;
@@ -384,6 +395,19 @@ static int stat_show(struct seq_file *s, void *v)
 		seq_printf(s, "Current Time Sec: %llu / Mounted Time Sec: %llu\n\n",
 					ktime_get_boottime_seconds(),
 					SIT_I(si->sbi)->mounted_time);
+
+		seq_puts(s, "Policy:\n");
+		seq_puts(s, "  - IPU: [");
+		if (IS_F2FS_IPU_DISABLE(si->sbi)) {
+			seq_puts(s, " DISABLE");
+		} else {
+			unsigned long policy = SM_I(si->sbi)->ipu_policy;
+
+			for_each_set_bit(j, &policy, F2FS_IPU_MAX)
+				seq_printf(s, " %s", ipu_mode_names[j]);
+		}
+		seq_puts(s, " ]\n\n");
+
 		if (test_opt(si->sbi, DISCARD))
 			seq_printf(s, "Utilization: %u%% (%u valid blocks, %u discard blocks)\n",
 				si->utilization, si->valid_count, si->discard_blks);
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 6003fbaf4b7d..7230d0c6c138 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -672,6 +672,7 @@ static inline int utilization(struct f2fs_sb_info *sbi)
 
 #define F2FS_IPU_DISABLE	0
 
+/* Modification on enum should be synchronized with ipu_mode_names array */
 enum {
 	F2FS_IPU_FORCE,
 	F2FS_IPU_SSR,
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
