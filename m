Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D23AB6498AD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Dec 2022 06:47:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4bfE-0007Et-CC;
	Mon, 12 Dec 2022 05:47:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p4bf5-0007Eg-GX
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 05:47:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8NtMptIuuwoPL0r3LeWz617Ept3oNagQXfDI2KNYP3M=; b=d3lGQiKbnazRL9CDOdh7nvQywk
 VAZC7+IBPA1XyaaRrRcMSNV8Fn/Lyo1bjRc6YPKaoc9NfZfUHlL9ZlrL/kI/5XPVJ4T1HpsgtnnB1
 Vz3RrLtsC4KzcD5CzVvGm3GZysCjTZ7QkHjF1KpuBWNJ8J+x31MqoETTjoAtzuvPNdbo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8NtMptIuuwoPL0r3LeWz617Ept3oNagQXfDI2KNYP3M=; b=c
 vJsKWcT0bWAU2QySH/96o2cyDRk2c+3LoRcAMLey1yfNsUiLWFtrCV2qit16+zsPo/sxQZbONPuv5
 tQ/mwaH9GV2/sJwuv3axTvtexw9wxFGNbRzDR41nsFqq13wAroNasIcFUTs8ySVNaTMuEOYUDYnyf
 8Lxu9eoioAlVg7cQ=;
Received: from mail-psaapc01on2094.outbound.protection.outlook.com
 ([40.107.255.94] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p4bex-00ERzf-T0 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 05:47:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=myv2vwiWmm6jNKEtU8Un2BYAKOudQJ00vEdw151HKddTc7gqZhmXXaUDOEtROvgp4L4CWPa0ywcFMET+dRE4/4MewDeZuYbY7ekir+1IB3nrXlaIe+QYxH1lScx0InODeevdnQuy2jdKAcgRiwlAk7wNJeRShMPMDXfbJg7ddtERZE83Z8xanycAA50R2NMnmOrHfgPPZ2WJUUEg53wsI0tyjC/X2UgbwDWOORD5mr1JisHkxhLtPBW6jR8J8sCE7gVT+pCxjBr5jjF9wvprdAItFw0EfaF/cKWDQr9RHNRUKQQVbcLDbJa75ngVxUu7S2y070XQxzcdM9dfZkoX+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8NtMptIuuwoPL0r3LeWz617Ept3oNagQXfDI2KNYP3M=;
 b=IzinWBFSjZne9JM3X6VPWar/UXDCvQMcbm0lMEYCHUIGeCkPE+bjWgcZDvkj5njS9K2oYMy3/AFCa9gAn9qQTVK/TKw6NmpO+YBGsfz6/uXP08dDS3uBoKxOz8+BbzpE8dPDg1Q6QamESL2BRCQQ803RDpoYGoVj2bQaVrXX/XcysC3YxCXssb+zgLgojvVsEanGcH/5HO7pAod5jCaeUtt5MwCRLqEGOmTxtTnJU0xAnUCj1uumIKiyByHrwmeyMe17OYO5QoJ8U7cEQIQ5pcIZazdqte1rtShMbBC5di19XP8tYecHiYEvpZ1CDUkOMHDqoS3LhP1S6dBjIjgyfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8NtMptIuuwoPL0r3LeWz617Ept3oNagQXfDI2KNYP3M=;
 b=WpDfjk0/h6qxjqnpZy301B7i+JyEqbqqBnGNjP0vfBVyoJXU9QU29NkIn6w9W8ao2qyj9pxpkLH2f7Pw1ljXsQDewaXU97A3Wvv36lTe48vCKnlDvCCzx4LIQ6GoK0ozl4GTx13nPcP7UrQMd6n+w9UXShcbw6RFrQvW4v7bDi7mQ6ygNUgXKYCLpUniE0GyPNFRNM6o5GpGk3BmyaeAQ2efV76rbbQJTt5iGw7g12MiCcp+/alAf90XXp1En1RP8mKuSeCquY1dxKAevx2cVvZmEnBDnpRcu8a0DWuByAyX5EuilkdbK5JoM5oq00ZT7mdnG39l5vOafzzpPYu6jQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6035.apcprd06.prod.outlook.com (2603:1096:101:d9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 05:47:15 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 05:47:15 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 12 Dec 2022 13:47:06 +0800
Message-Id: <20221212054706.65579-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI1PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::14) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: e2e46bfe-64b5-4bab-b57f-08dadc0452cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +C61zJVR9HKOXdlprZwxFDvHYXpg0hN4YAm5JYtAdOoTXUSdXymuUhwDsCkk6oV2uhhoH+yleJDyjx2pPZ53F2RZk/4akE7jYyPhLi6p7bNX6j7BW3Ok5+o7gbJxYma/GbXcB2N+S+dzLb0VpTr9WNtlET27YrV2IlNf3/zE9TOifLL7iNbZobawPY23Qx6sVaSi2vFOyt916/j9OH8UMwDGfmsI+Di/rOFBdzIW17cEf17uquxYJqMLKOq/NqQ/BvVgilKFB6T8+dlTxMeLXFLFH/TLbk7zs7tQNhAeDTZl0fosQEyb/A49dem9R0LWSwLEwZ1Td350t6iq5L3vkt26T1T+T+aAsJUVTL890kVFOJnU6SNUE2y/i/xamLMQJ18lwyK+I5O2pundZMhLEiTlvBKqprX7dzcADihpBjaAiKfGnlEG9oTYJVxhxkUiJOMQNccvoxSFV2lEV813atEIl5OSNFuqZR4DHv6rAaBedF6Z4DsYrFabC/RgUuKTY7Il2A2xqe7cFkASFj9wza1ggwch6bbjjNNk/jsn8n5bPbZbzUfa+imgzM8vQuHlWHRiTqaYgEJ00VOF9KMoIkWqLWqhWf0N17sHrT7QD3izQ96NqMY1xwRDT/3A3Xu3fxh59FaezVXoqLeZFUM8pwHIUeBE70ruHRPdCsol0B4TL5fcTWgcfavVIHU8YDIb
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(376002)(366004)(346002)(396003)(451199015)(38350700002)(83380400001)(38100700002)(66556008)(5660300002)(86362001)(66476007)(8936002)(66946007)(316002)(2906002)(8676002)(4326008)(107886003)(52116002)(6666004)(26005)(6506007)(6512007)(186003)(1076003)(478600001)(41300700001)(2616005)(6486002)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ABCAZ/IuwHmmHS5FRtSDf7NqWtCC81B90mNusdxdaCbr47UZ/Zt2Uzx43+7o?=
 =?us-ascii?Q?LV2YmDxJxEBYNN3Dv/59i68VnSrQdirb0YVolm+SrCTQ7bq6xTW5gCgfjxPw?=
 =?us-ascii?Q?HUZ1adx0L1Q0cpprarvwYOgp2xgWQ2xF1Cy82zdzlGy3/oZc5aLJpA3QDqwi?=
 =?us-ascii?Q?pRqADTLU7r1GcrZMYOSn6YvcKS2mq0OX9jQAS01/2nyogw7aPstJpPFQ9rt9?=
 =?us-ascii?Q?l3vtILLpr1CZM5A39n2yZb2eDnfqaAVkLVZJSxCTKyp+JHlywXQl0wQdzePj?=
 =?us-ascii?Q?nl6w99ut0PY7qEXeKSqkTep28rsBeNLumqOQ00Pfm2ubZ0YZRzOk3fa6aaKA?=
 =?us-ascii?Q?J/I4/SzvppSiSlBP/GCu0p2woGNrJgOE26OToYHr/hcZy14CN54UJdW619IV?=
 =?us-ascii?Q?evkW9IFQEtvzgnRCbm060QPkVGv7DKI9TwqL0u8i1mjXP7tZzwZiiVS7bARv?=
 =?us-ascii?Q?jmQJfMDB56ZLj66yw+v42Wek+q4EJtKfPWKQ+TD8qZAEOH0Ckq5OsTnrIVAf?=
 =?us-ascii?Q?AA41cv0BuAI0THWMW4G9YRI8121kk/pRj7YCwjuZ36ew2EpvYyjUnMNT/5lN?=
 =?us-ascii?Q?wlM629k5u2S770MEvR2sWnBdMSwC7Dcq2g3UF0l98P5cQgU4TQUqa459CJZD?=
 =?us-ascii?Q?WtCoCPBDcmQQZL7i0KNr231HL5CIFGp3ksyM41iY5ZsT5DEJI9pFuFTzMQGh?=
 =?us-ascii?Q?tqxmiMbqaiFPL9uzPZILSBkPEL8c/3JXS1eOqLfxMcZiGFiio+uZC2Y6UI7f?=
 =?us-ascii?Q?+83BeaGWf6HaLFj+lk56j1qH/fQBmARmeSfjYK5l/ZR08RETljkkUJM+6VsE?=
 =?us-ascii?Q?FamIedVEzz/gy3xMQDgYYWB6y/Gv1pyZSWFwVNPlxtfVgCYrVUKrNITUpeHj?=
 =?us-ascii?Q?Gm0Km9ibE4AN4qDga07iJ3udGx0AIOILlzbXof0paKkH9SwMZ6A+F6fsge4y?=
 =?us-ascii?Q?Y84DM1ww3nWCvvTEv2Cch7hWb/VjZpVqUddKsg8IqawufEff4vhGvpFtQH8v?=
 =?us-ascii?Q?TmXLev0V4yOwC6/VpJ2oJ8EclhEtILIebHoDx8VP3JutRd1dkKxFOXINO/42?=
 =?us-ascii?Q?rs3bn+bKcEf5/Tn8+HmVH+/QP0RYr3lxekuniS+UGqnAwIPlTyAE8X/n7OZ+?=
 =?us-ascii?Q?zVAAw9lqquAADdMWj2pbgJ1bVOxlFtsLvUkAZuoDNDLSTWo7sIT1jENH/Nki?=
 =?us-ascii?Q?K7AU2po2ePJkJYLzNndH0rVdBuLgn6t1u2n/ZnWyTLzGzUh+JsZZsq8pjJ3A?=
 =?us-ascii?Q?Yy78Bq9gD5HVkiYWx8kHP6ACzUc09havQEtQoz34HaShINErDik9TjCKVBYg?=
 =?us-ascii?Q?BmkcSBnA4gG4WAieQcU0YQp1c2K33HYeCMCj1ksHN55T5cap3M22MXuwxl0J?=
 =?us-ascii?Q?gDb0ywVdVZzxffhY7ejEczuAiq/TGN2LVI6bDtrUH7IGR4JrngRmGtRUNbs4?=
 =?us-ascii?Q?SGQRPoagkaXWZ6eX9aj7gtaahye5UGio3643bDbzVnMpfpvlNAcIhuDD2qAn?=
 =?us-ascii?Q?OE1yjNlw+Wcj8jaXMGk/nzXgxCxuO5jfh25RX6U2qarCbihR+IBgvYVdiMYo?=
 =?us-ascii?Q?OKMyK/tTwPAtG7j1rVjd1M9JljZHYbbetwHRBYGe?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2e46bfe-64b5-4bab-b57f-08dadc0452cd
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 05:47:15.5426 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fmmL1A+EiInz4+Pr2yOD5aq18dcXWn54+iznve1ARZwlPbSfqejs/343XW6mV9STKeKKEEJA6aHApo0/LMp1Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6035
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Just like other data we count uses the number of bytes as
 the basic unit, but discard uses the number of cmds as the statistical unit.
 In fact, the discard command contains the number of blocks. In or [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.94 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.94 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1p4bex-00ERzf-T0
Subject: [f2fs-dev] [PATCH] f2fs: add iostat support for FS_DISCARD_IO
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

Just like other data we count uses the number of bytes as the basic
unit, but discard uses the number of cmds as the statistical unit. In
fact, the discard command contains the number of blocks. In order to
avoid breaking its usage of application, let's keeping FS_DISCARD
as it is, and add FS_DISCARD_IO to account discard bytes.

Suggested-by: Chao Yu <chao@kernel.org>
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/f2fs.h    | 1 +
 fs/f2fs/iostat.c  | 5 +++++
 fs/f2fs/segment.c | 2 +-
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e8953c3dc81a..ef0043003bf8 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1193,6 +1193,7 @@ enum iostat_type {
 	FS_META_READ_IO,		/* meta read IOs */
 
 	/* other */
+	FS_DISCARD_IO,		/* discard IOs */
 	FS_DISCARD,			/* discard */
 	NR_IO_TYPE,
 };
diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
index 3166a8939ed4..3d2f0b69cdda 100644
--- a/fs/f2fs/iostat.c
+++ b/fs/f2fs/iostat.c
@@ -89,6 +89,8 @@ int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
 
 	/* print other IOs */
 	seq_puts(seq, "[OTHER]\n");
+	seq_printf(seq, "fs discard bytes:	%-16llu\n",
+				sbi->rw_iostat[FS_DISCARD_IO]);
 	seq_printf(seq, "fs discard:		%-16llu\n",
 				sbi->rw_iostat[FS_DISCARD]);
 
@@ -180,6 +182,9 @@ void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
 	spin_lock_irqsave(&sbi->iostat_lock, flags);
 	sbi->rw_iostat[type] += io_bytes;
 
+	if (type == FS_DISCARD_IO)
+		sbi->rw_iostat[FS_DISCARD]++;
+
 	if (type == APP_BUFFERED_IO || type == APP_DIRECT_IO)
 		sbi->rw_iostat[APP_WRITE_IO] += io_bytes;
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index dee712f7225f..bd02631f9681 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1187,7 +1187,7 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
 
 		atomic_inc(&dcc->issued_discard);
 
-		f2fs_update_iostat(sbi, NULL, FS_DISCARD, 1);
+		f2fs_update_iostat(sbi, NULL, FS_DISCARD_IO, len * F2FS_BLKSIZE);
 
 		lstart += len;
 		start += len;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
