Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 99FA0691D10
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Feb 2023 11:42:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pQQri-0006RV-Nf;
	Fri, 10 Feb 2023 10:42:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pQQrZ-0006RI-Qw
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Feb 2023 10:42:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VTvMonL3hR1Ixpx1Qz8hU4DjAzARZ3BX2vuwHWci4vk=; b=eRvZpSG+LGp5YFNpAX8FDkcgDe
 M67JV7P76QGYmavErcDFv/+nF2f6xcADCSoDK6liOqHH3ti17Acyl2iUFaLMxDqWVZqawWPe+wPSy
 sNaOMrNLWpOKAmpB92ajtvnKyqyxCdcb3dVBWAG53QHaxV9S/wnj1Jle4knXgGRqkBrs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VTvMonL3hR1Ixpx1Qz8hU4DjAzARZ3BX2vuwHWci4vk=; b=X
 XQqULCZF71u9vW8tul2+CiHk/Xl0l0PioElyfOYgyL6OdA/F0StilyHlGJk5DmdizDS0zUH7iej+h
 HxDb+pU6HFG8anvv6ryumM5mLWCPd67RXrXkovvHdOQFW9+6pOBvbTOAGUfuJ3oFjqLoOcux76oYV
 CGYwDxz4ZC554dIk=;
Received: from mail-tyzapc01on2114.outbound.protection.outlook.com
 ([40.107.117.114] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pQQrW-0006dy-Fp for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Feb 2023 10:42:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JfzvPRX0T6TeVHVqiumfLBHEvuIVQENq7SkICnnZQ07IsbXSbSf3WAF5VpXI5SXfkIogtE8Yla8avGHxxZEGzj8mOzgBlMUWUnu6oOADOeuyJOgcF+R1YcCh5QINKiiTmF1CjNdB0QkIwqAGLZAeagGNEMWqbUlNUvRHPABO7s2mnjnVxHHehneXxGyA1jzrh8iwQkGPSuy4Z12pTENiRRWZVqlCjqmq7tzCvpgRBWCkSJLVmyGHLszVmgglT8LCiNy8CIbBnUdh4AwcAthDZu0MXPqzHoILga2mHYngHZrGEGpXbHs9DQ7WBH46Or4sdTJw+3hQDGOHISNehAiRQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VTvMonL3hR1Ixpx1Qz8hU4DjAzARZ3BX2vuwHWci4vk=;
 b=YEVXf0+kvxprSm+LE75uJMMEdMg0Zrlpeg4FVSBy5Hhmf9R5y1ELOMJjOV8q+cmnsVtCQeeOu63DnSDca6sCBQRCH8yu0i2Lsq/FW4Qd5iyCqawMmUdUb34ZpL3zAIqUrECPtwbaGN4rOahem/2Ro26YGxof68SJTEdmBZdxiY5irEXoK4TuKoHlEuJeueBlk6wwxn1vAd0Lbx7+rWGXKOGZ9tt05rIHMt4YLqR/otMO2jxjJ+ej24ei9ASRnRRLnpbEzsvWZbE+iDM/ajhqzXta1KAaWMwXDKi3Im6XbxHcMS6v2IOEu7lP0gCN7Swe0BfMK5sg2deKGTkHzc5lkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VTvMonL3hR1Ixpx1Qz8hU4DjAzARZ3BX2vuwHWci4vk=;
 b=L+r13SgkWhUBCqQ23hStfoMtqOct9qrU5hMPOPK+PDYlFe2PXe9/GZUHU0UCBGe5Ciuumb3HtUBCED02vXdRb7dSaIEWoTxiR9UqetmYLn7Dvf2ey+clZkKQkDfmjra64gsC1eK/IgZgg2o1yqr3qXlsMQuptRxE/Y3GjcymaSbbBpACcUyoCaOIEgp5h//lGjlFuJ+S5yoxQMd/pGNmoT+7+3bvZkttix6MOIoPje9xLJRcrQ7miSUuXAfP1YFEpOQ5SbZLkluSHvbRaeRbd+PqxiGTQP4U+Xvm9FEeUFeiBiNuDRYv29o4+ssSJKb9eGM9m1iy7ltxCqyy/Fio7A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB5574.apcprd06.prod.outlook.com (2603:1096:101:cb::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.5; Fri, 10 Feb
 2023 10:42:27 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%7]) with mapi id 15.20.6111.005; Fri, 10 Feb 2023
 10:42:27 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 10 Feb 2023 18:42:15 +0800
Message-Id: <20230210104215.64067-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR04CA0010.apcprd04.prod.outlook.com
 (2603:1096:4:197::11) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEZPR06MB5574:EE_
X-MS-Office365-Filtering-Correlation-Id: c737b6ab-db8d-4dc2-3205-08db0b5380ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X3qzZ/kZtIkmc0YiPRKP4sk06YvmRr03IFOD05l/aDfIatZ2wBPMzO+HWlfhC2vUsJ1yk5ixibW4A2foTm11HlNaMgZsHDIO7eTbQbTxcJoE05iK9zrAHekgoRAxtC8kh1yl+LcWQOq58c28gnBZha/9+HUYORxrYF4RNpt+vpNujFKK/j/+uWO/eubadqbC4btK5JebsfoiR4Pj8d4GihJbT7AbkB2tmfTCAN/iFQanQ4lbSREaGqao3nfmNYSWPkcBKWXgIh3gdjc4HBCCLvTo5pF4nu7ceFowClznuMxJoAe0CnpCiRh/sa3zYd3ZVMI1Jc+XYUFE7MWgPLprdM9pU9EMZm4smFhSH9xvlCcwsjlRLt/mhlLKTzYNv20Qt1SzRLSpft5zYgMMJwzxFlM8faUFEw7NlKKGbi5DaNWLXTo7ejmZ6LR+jcHx8vHYHsW+F8NEslpLgspF99KJIOrz1hq244zdBZpJgEef7iyh3IaA0pXET8IRaD+t2Ecdm5TLqrWIycmNce4IdbD26WAWqqO8L8JBAoDvIDZ6mlp810/dHXaV6zuDszYIH4erqfiOMOXGXIxCsIPQaHAqBfdyausJeMpkWDvV8cjp+UxISGoa4NQ4u1vKqOD5DoERmdfvOOSiZdyKdnR97wD1bxlpF5A4kTdG+0Aj2QVoqk5gtHc1FRNDqMmg6l8u0P6g38giaBGXuEt/68ecPanwBg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(451199018)(8936002)(2906002)(316002)(36756003)(41300700001)(5660300002)(66946007)(4326008)(8676002)(66476007)(66556008)(38350700002)(38100700002)(26005)(6512007)(6506007)(6666004)(86362001)(107886003)(52116002)(6486002)(478600001)(83380400001)(1076003)(2616005)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?UOewrkgNO+/PVBxUhEq8y6LQq2svZx82IfBwcLX96i+9dsXhx3a2id9W0kWO?=
 =?us-ascii?Q?Y3jAMqpf5lozXlNByVOaajUi5ThClPJCSCUj0a3McFF1j3B7ABly7R9gHUnm?=
 =?us-ascii?Q?0YJ2x/OX6BsbD9Ll+NtlpFUEOp9tiqmf0eIgHEm998Adsimm2nfRkoRQ5Fnr?=
 =?us-ascii?Q?DNBiMAfbk2oKH8S/GYyhIEl28bdWfNrcOhsytrDuFwMzKzlllPyBxQG6KftG?=
 =?us-ascii?Q?PpcFe6UYoeXjKAWlw7LUA91ZGRzcS8P1v0jWbGu5fUzIoOzYJ+3fEnkqcV2G?=
 =?us-ascii?Q?wTNniqFbLG7DbZPwq7qhznVb4nTRqve27IUMUhxjIvi+hMvSAiDTguax6QCb?=
 =?us-ascii?Q?n+oU+7jmEniX2Ar+pZFqpCmVhSdx3nmPxb9DipJ7nq/oeTesCF0ryI0rkgZV?=
 =?us-ascii?Q?H8gU1CUcFl0PZfxiOmpbxYcA4Xd9cXCc7K6rQQ8hjbIgxdBuRstHYUJQHXH6?=
 =?us-ascii?Q?IIHofJNZ3LGBWcvcquLKaIqhohCp14LucEAzGRpoTof7Hikgg3j/inq9k6xp?=
 =?us-ascii?Q?mr38w5QxjjwnjF4iJ5OCkMfrvfYW7TOp0EWdmyfDRs3QbNhWl98UHstJY29O?=
 =?us-ascii?Q?m/gTRx4Di4NG9d2yLQNJaDMK2TwpP3n9Xbi6+cYCyoSP3M2Z94dHzUOjOlCm?=
 =?us-ascii?Q?NRqy1A6hAxkX873HuqOMpx+vfyhpjp8y7+tdHEda6iKiFPR1R75VxPxxZRCF?=
 =?us-ascii?Q?TQlGg7EIf8MCU2gOEBPZwTVwnKPpB8srBXeJOv8mLsBJ3vLRvHtQZDTZVAsX?=
 =?us-ascii?Q?TivtMkNAOzMMH8bzYihIgaZgUZAh1gpJkgi6Dt7GYmyTMWtlIcjxIqeL3i8a?=
 =?us-ascii?Q?suQoxxL7Ay+xXUVeUKG+CyDkz3MEvJSTYrPRN3wNxI7z1the75M4mRNzT/QN?=
 =?us-ascii?Q?D8wKAC5rtInM/xHkjgHNSjWube+ihhoVPCBzRR+BMDBhyZet+t1NegWY3jZ7?=
 =?us-ascii?Q?xR65Ivtry0jvAMJjG5cw2ALrHoblOEdaHi1vEVhaNiSmd0yIqEazIAEruAPf?=
 =?us-ascii?Q?6BcOrcKQByrOsrPXm/riyPN5RX0eWORGFqtstlp3luA5xde/K+Q7xGap1EmE?=
 =?us-ascii?Q?1KNlIZRWWmtbf9juYZN1uN+brLAua+zFGGE2NhkZAmuxC9LAWakA0czQ+PYd?=
 =?us-ascii?Q?c2ZZN9QNGyUJDzfvvVqRPiqd0jbIGjXFdmXkU1wlimjsZXUNmkkjaw/mY8gs?=
 =?us-ascii?Q?QYqrvQf8iQTfAVCfPvbD1iRdTVpw63AG4k1gspIT9QIuT8yPDTQ6f++fOek7?=
 =?us-ascii?Q?m7PN2KHu9wlGoN2E9hw3PrqU48SQNIONqlJzrOwlKfWGNXqnaBoM59SNERDP?=
 =?us-ascii?Q?pmyl7J4VWku48lnhZX2M8/GDlQX+5GZMwOLRXteTES/41mlDvSIcyb9vW3/X?=
 =?us-ascii?Q?WOD1x0k7pCAnRmo2XK9trYgSPbHmKKL/Lxc5xDwnDYIepbMNQvfzvsXBHUB3?=
 =?us-ascii?Q?G3oSqBS2sZFT9jqShR/ER4PJ1boBYaabQpMSoAgn5Ic4Ktlc86hYg8YEJklI?=
 =?us-ascii?Q?/V4DEaCmv0gRJPcv09sXOIVgsLyTScWMcL2kXK7hRd1wajBdvgK6JRaHOEUP?=
 =?us-ascii?Q?AaWoU7X2QX444Mx9OeJ0EZzUfHaBMc4RV2vArydD?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c737b6ab-db8d-4dc2-3205-08db0b5380ab
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 10:42:27.3044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z1IJJ/gP35biTnFM3P7k+VlAkuu7MyTKueVDhqt7pdFCXi+7yg4eYbtrwuxIdSXn8PZraqOG7oHFmDVcw2iwCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5574
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
 Signed-off-by: Yangtao Li <frank.li@vivo.com> --- v2: -drop unsigned long
 conversion fs/f2fs/debug.c | 66 +++++++++++++++++++++++++++++++++
 fs/f2fs/segment.h | 1 + 2 files changed, 47 in [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.114 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.114 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pQQrW-0006dy-Fp
Subject: [f2fs-dev] [PATCH v2] f2fs: export ipu policy in debugfs
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
v2:
-drop unsigned long conversion
 fs/f2fs/debug.c   | 66 +++++++++++++++++++++++++++++++++--------------
 fs/f2fs/segment.h |  1 +
 2 files changed, 47 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 32af4f0c5735..c37ebd7a251e 100644
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
@@ -362,18 +373,20 @@ static int stat_show(struct seq_file *s, void *v)
 
 	raw_spin_lock_irqsave(&f2fs_stat_lock, flags);
 	list_for_each_entry(si, &f2fs_stat_list, stat_list) {
-		update_general_status(si->sbi);
+		struct f2fs_sb_info *sbi = si->sbi;
+
+		update_general_status(sbi);
 
 		seq_printf(s, "\n=====[ partition info(%pg). #%d, %s, CP: %s]=====\n",
-			si->sbi->sb->s_bdev, i++,
-			f2fs_readonly(si->sbi->sb) ? "RO" : "RW",
-			is_set_ckpt_flags(si->sbi, CP_DISABLED_FLAG) ?
-			"Disabled" : (f2fs_cp_error(si->sbi) ? "Error" : "Good"));
-		if (si->sbi->s_flag) {
+			sbi->sb->s_bdev, i++,
+			f2fs_readonly(sbi->sb) ? "RO" : "RW",
+			is_set_ckpt_flags(sbi, CP_DISABLED_FLAG) ?
+			"Disabled" : (f2fs_cp_error(sbi) ? "Error" : "Good"));
+		if (sbi->s_flag) {
 			seq_puts(s, "[SBI:");
-			for_each_set_bit(j, &si->sbi->s_flag, 32)
+			for_each_set_bit(j, &sbi->s_flag, 32)
 				seq_puts(s, s_flag[j]);
-			seq_puts(s, "]\n");
+			seq_puts(s, "]\n\n");
 		}
 		seq_printf(s, "[SB: 1] [CP: 2] [SIT: %d] [NAT: %d] ",
 			   si->sit_area_segs, si->nat_area_segs);
@@ -383,8 +396,21 @@ static int stat_show(struct seq_file *s, void *v)
 			   si->overp_segs, si->rsvd_segs);
 		seq_printf(s, "Current Time Sec: %llu / Mounted Time Sec: %llu\n\n",
 					ktime_get_boottime_seconds(),
-					SIT_I(si->sbi)->mounted_time);
-		if (test_opt(si->sbi, DISCARD))
+					SIT_I(sbi)->mounted_time);
+
+		seq_puts(s, "Policy:\n");
+		seq_puts(s, "  - IPU: [");
+		if (IS_F2FS_IPU_DISABLE(sbi)) {
+			seq_puts(s, " DISABLE\n");
+		} else {
+			unsigned long policy = SM_I(sbi)->ipu_policy;
+
+			for_each_set_bit(j, &policy, F2FS_IPU_MAX)
+				seq_printf(s, " %s", ipu_mode_names[j]);
+		}
+		seq_puts(s, " ]\n\n");
+
+		if (test_opt(sbi, DISCARD))
 			seq_printf(s, "Utilization: %u%% (%u valid blocks, %u discard blocks)\n",
 				si->utilization, si->valid_count, si->discard_blks);
 		else
@@ -491,15 +517,15 @@ static int stat_show(struct seq_file *s, void *v)
 		seq_printf(s, "  - node segments : %d (%d)\n",
 				si->node_segs, si->bg_node_segs);
 		seq_puts(s, "  - Reclaimed segs :\n");
-		seq_printf(s, "    - Normal : %d\n", si->sbi->gc_reclaimed_segs[GC_NORMAL]);
-		seq_printf(s, "    - Idle CB : %d\n", si->sbi->gc_reclaimed_segs[GC_IDLE_CB]);
+		seq_printf(s, "    - Normal : %d\n", sbi->gc_reclaimed_segs[GC_NORMAL]);
+		seq_printf(s, "    - Idle CB : %d\n", sbi->gc_reclaimed_segs[GC_IDLE_CB]);
 		seq_printf(s, "    - Idle Greedy : %d\n",
-				si->sbi->gc_reclaimed_segs[GC_IDLE_GREEDY]);
-		seq_printf(s, "    - Idle AT : %d\n", si->sbi->gc_reclaimed_segs[GC_IDLE_AT]);
+				sbi->gc_reclaimed_segs[GC_IDLE_GREEDY]);
+		seq_printf(s, "    - Idle AT : %d\n", sbi->gc_reclaimed_segs[GC_IDLE_AT]);
 		seq_printf(s, "    - Urgent High : %d\n",
-				si->sbi->gc_reclaimed_segs[GC_URGENT_HIGH]);
-		seq_printf(s, "    - Urgent Mid : %d\n", si->sbi->gc_reclaimed_segs[GC_URGENT_MID]);
-		seq_printf(s, "    - Urgent Low : %d\n", si->sbi->gc_reclaimed_segs[GC_URGENT_LOW]);
+				sbi->gc_reclaimed_segs[GC_URGENT_HIGH]);
+		seq_printf(s, "    - Urgent Mid : %d\n", sbi->gc_reclaimed_segs[GC_URGENT_MID]);
+		seq_printf(s, "    - Urgent Low : %d\n", sbi->gc_reclaimed_segs[GC_URGENT_LOW]);
 		seq_printf(s, "Try to move %d blocks (BG: %d)\n", si->tot_blks,
 				si->bg_data_blks + si->bg_node_blks);
 		seq_printf(s, "  - data blocks : %d (%d)\n", si->data_blks,
@@ -565,7 +591,7 @@ static int stat_show(struct seq_file *s, void *v)
 			   si->ndirty_imeta);
 		seq_printf(s, "  - fsync mark: %4lld\n",
 			   percpu_counter_sum_positive(
-					&si->sbi->rf_node_block_count));
+					&sbi->rf_node_block_count));
 		seq_printf(s, "  - NATs: %9d/%9d\n  - SITs: %9d/%9d\n",
 			   si->dirty_nats, si->nats, si->dirty_sits, si->sits);
 		seq_printf(s, "  - free_nids: %9d/%9d\n  - alloc_nids: %9d\n",
@@ -592,12 +618,12 @@ static int stat_show(struct seq_file *s, void *v)
 			   si->block_count[LFS], si->segment_count[LFS]);
 
 		/* segment usage info */
-		f2fs_update_sit_info(si->sbi);
+		f2fs_update_sit_info(sbi);
 		seq_printf(s, "\nBDF: %u, avg. vblocks: %u\n",
 			   si->bimodal, si->avg_vblocks);
 
 		/* memory footprint */
-		update_mem_info(si->sbi);
+		update_mem_info(sbi);
 		seq_printf(s, "\nMemory: %llu KB\n",
 			(si->base_mem + si->cache_mem + si->page_mem) >> 10);
 		seq_printf(s, "  - static: %llu KB\n",
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 8ee5e5db9287..92c8be00d396 100644
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
