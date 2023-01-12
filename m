Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3799F667ED1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Jan 2023 20:14:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pG321-000519-5w;
	Thu, 12 Jan 2023 19:14:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pG31x-00050s-4y
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jan 2023 19:14:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YSfuVr0ATpMuO4cP1MdBJD2VjwwBoUhd246okOdieSI=; b=VYQuppbgUI2pxv0QlAik6rU4Eh
 WZLdrJ6ZELbWzQmANWrOm8YYyIB4X36rMwc9N96O3uVECC2oUKokXfawBF4+CIDW0egzwGSisbEYm
 LCWvsP1DL3fiphmMTcwN/ULyk5QS6XyLf1UUOVgwlf7DA1ddcU46oD6qO0gFcf70cIcM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YSfuVr0ATpMuO4cP1MdBJD2VjwwBoUhd246okOdieSI=; b=Y
 DB3mq8bYFjCmWt+/McuiOgdl2RDCbkVByFaxaHSdOuIHFPv/zz7SMd+3sEClcvLRBRSlc37RInuCY
 3k6h7W+UPYVVbKTFW8BQHi7WgrJAp7TboyMpqQKXVUd1OcUC6fRZNmggqZu53Gc8P7sOOkhpme/R+
 QHjzWH1JsgGoAgMk=;
Received: from mail-psaapc01on2127.outbound.protection.outlook.com
 ([40.107.255.127] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pG31s-001QOI-46 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jan 2023 19:14:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RjM7eIJhowpMghuJq/6r6ChFLJwG6vifGP6zSIrtbNrdgVpa/6bWeBx3V66AeEYrTYjjzq+ukSRNp5rOnDh0KTRokj1E3wtYoQJGTfeIrbWmb7L04ZVb4GyeaPe5Mm4RS11YSwpXWI1DX0Np33cmePQSHvBCVYfQkOVl4QyGsYravIu5/R6YgRMqS/n9WFMcQRy5cwClGJs6p2zsXzPgGbC7GKeqWAXN7IvNy8QPdraQ8Fjtl5tLPwpzFsEMjBpQvacugF83DkcD0NosocFB1cShBaDiQi9r+fXTYy9rt7L79+bAggYYmVhBJS9V90W9Dsv+kdd6ZCS6lVAVrDto2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YSfuVr0ATpMuO4cP1MdBJD2VjwwBoUhd246okOdieSI=;
 b=hXux5u6DoJIYr+Pb3QZVJ3nrBAijmUWtRT8rW4xCOxG25jdlzzwpKFOtaTMplffgaCa3GOSSDHattwQlarQ4ctBAuG4lwBodNO3nHzFCfIYG75ZUzECI50Gcl5U0keFHa/PVhcM7nkqllwc95b1GBQSBVrJJLuPlBDDVOZUmKznKQycqs3gDyspqYlGpj4AZAWYntfvdb3bd3HY0+uAHWadaxXCQGL2v59RYJ+K2O2094PtSbjU1vcRn44WZ+0hNiPeQs/lOs7546dBQAptkwTmFSnE8r9PB92326d1TMyoSqpfRJwiX2M5kPFyv+KnPhnO6OI7z3/1aPvMNBt9V9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YSfuVr0ATpMuO4cP1MdBJD2VjwwBoUhd246okOdieSI=;
 b=kotXwY996bnMFZsDZ3lWRSVtnHEbI1e1jowPIWHQihv0psZbc/0L2wm+fgTIA83kFg2SppZVI5zy75ilTSxeEUn0EMuLK2LfuTUvzo0C1jQZggUuLfMZXj5QBxMvVYumaX/SZxjhv+Bl1//8pePzyHUhNUKWVpQT72jWOyn+poL4mYCea8QshJdaNMU3gyMZptla4T/O9L0RPlc3wS0ojWLJGNjyyZ0DzX8u8OKfSuWf5Hm/RK+kt22GUXTc74kzGD/kUYNL9ke3OtM9BkUOvqo6dCZc/DPN7Ppc4RK8VxYMoF7E/m1bNKKZWrBqdgudxJ4YS7RFMDA2zxOfhIwcAA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4202.apcprd06.prod.outlook.com (2603:1096:4:eb::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.12; Thu, 12 Jan 2023 19:14:14 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 19:14:14 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 13 Jan 2023 03:14:04 +0800
Message-Id: <20230112191404.59020-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR02CA0033.apcprd02.prod.outlook.com
 (2603:1096:3:18::21) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4202:EE_
X-MS-Office365-Filtering-Correlation-Id: f12d6343-34da-44d4-0cac-08daf4d13158
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kq5wRH44IIdzETuHe7oOsbve5haX5090U+yVjxjaOedzpx0pQ4ACmhV+vUVi2aOAmMiAGh7ukikBhHhej5Qlm9oj1jA/oy3xEFxCQTQSEAntiSoKw9b21P6K0lCSuV2yAqvLgNqkNPAoid6U/LPkOOnHobvL06b0zM9Po7rw/xZaWg78N8AK2bCKK5KCsEVZ3talvRDqwGtGamyoVI9TZOC35xVPgbgdCelaLHrovZsekYcBOn8U1gP976+TcynU6O8lyG3PaPnSoZ7HCZDWrNmiuhSmsmvfm/R1j6ggpwhKZPfv4FNduX/yXEftYH3G/6rraPIHYp6UNUUhIC2fF3HEHHhBWPNwwTgWG/vw7px585htBaaWEjMvr/Z42gLLYZdhDNbsBQdRRIXu9e8n5vmNByQkKkOslu4mo7CPoK6SvKrDyBrK5tI+Pnr03TKp310z88vj8s8w6V4l5lPaklNT+FDwVIPhGz3THsMSv/huuZFocnA1AxEioSL2mVRmTLmamCKppJu/HPLZEP/FyirMDHX+GAStLOT8YZ4Aq40CL3OtAb8siwr6pP3MzWquAeMmeA59tpDeSaeHosJqh5oTYtrWfUacDXWB1AO7OAdoZUY+hjp2Pv13DFwckzlwh0efi8m6Mt4w4mLHdEs4gHrXcmijjmrPScqhDNJubssM6wGMI1FUmy/JuV9fZj+KtzEQpTVyEOWPRMco+kNSQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(366004)(136003)(376002)(39860400002)(451199015)(2906002)(5660300002)(8936002)(26005)(36756003)(41300700001)(186003)(6512007)(66476007)(66946007)(66556008)(86362001)(4326008)(8676002)(38350700002)(38100700002)(52116002)(107886003)(2616005)(478600001)(6666004)(1076003)(83380400001)(6486002)(6506007)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SbPrbFZmN5c+soJLWk3JlIIBMnmTy7gGYW3reFUwmAA+6jWJ0i025i0dbLpO?=
 =?us-ascii?Q?Hp/6WiSV7ZQ81IMAY+1lTaHOhf0uaxjz5tVvh6gZ3aKDRZfvUTMqf4+meyzh?=
 =?us-ascii?Q?irauRllj/fj1wb8r98dDJW7oBOBV75TcXOgnDQGzJ2QDM1nZXOhRrEfVs/eF?=
 =?us-ascii?Q?85BFsQj8XZ47r65GP8X2/w/ZTfRxOk8f8/nwzfFB7OWlZfCSd69a0RSa06zV?=
 =?us-ascii?Q?wdUadZoxMnnqTn68tTfANxSEJlZOrmvTBvJRfoGqr5rfQ9NfRtIlUYJTxt7F?=
 =?us-ascii?Q?R8yW+Nkw0RjTRQuSYPg1paeOg6/WEzO3843uXBhwPo0pgRZ4tyf++/EfjsuH?=
 =?us-ascii?Q?n0L3sW9w7adXlT6DrP2fX8g5UubL2d4BsS2U/Zy8U2uBpM27/rVkNysdXNGQ?=
 =?us-ascii?Q?uvtQWBOa15n7e700g521fYOMTvrxh/EQZG7xT4IxPhTz3sJlOGGf2GxyUD+H?=
 =?us-ascii?Q?TbujKAmPDUrS1tD1G6c2IOsfBqiHaAXKB9i8eWWSxvAkecdKThllYy4ESHs0?=
 =?us-ascii?Q?AicYj66fCR86VdGZu1n7z1Oot3r6p7LT1jjHoZIulPxkX/aHOwbGRHokJC+I?=
 =?us-ascii?Q?HUagCaIZnTNh+rhp3l4v6QVejrXegFqL23wxmNjb1z/PMf7XlRr/hBRsWhA3?=
 =?us-ascii?Q?jAGQMkeH5G4imovdXg1MDQG7/xsrVSo0z/ILp8RlfG+/iNa9RpR7tgRa26sM?=
 =?us-ascii?Q?2k9kvg35A/T09EW/4wkFi2E8ciLWJIAZLDit0hcP+ZVEAX8qLtQVUzOedXgI?=
 =?us-ascii?Q?GxQRFFkJtUM6ySQqq4V3l/73xJO/7AtwqICexBriz9Nislccrv2OnK9h80aX?=
 =?us-ascii?Q?LABgnDfcPCql5j7EFl6aiIjOcfWiBd3ABUB58YEeGn6Uy7mheXEk4Ia32nKn?=
 =?us-ascii?Q?p+KytTWG+yGiO5peA9S6u/mOj7ccMwUE6cie3RTZXfSmU+/ffJxq5BjoHlIz?=
 =?us-ascii?Q?p92rWm821/Kl5tM+uyDxNBVrguL3lcmHmw84BF3DCP2aFisEiKOWRsgnpVpw?=
 =?us-ascii?Q?AhOWY3/kQu5TGLl5xLtCQXpS7Q2tVQjQCzuHUwfjwXVnvSYNwmwmVMGGdnae?=
 =?us-ascii?Q?yMbFKzSfaX/j0YjQvpnDOCMbXuw4HAhzFytZidXHKjlBaPiwPBzmVkYO3sda?=
 =?us-ascii?Q?ald7NNprXO1Oo8CWES8T1gfSLnjf/WYv/bquHyLCyNX403+HP9hlDEimPMDS?=
 =?us-ascii?Q?bLhYFvscWhszqg25kGYs4z5Y4HyGYh7yR/1EXvsR4rxRJgJM8ZWwtat5eter?=
 =?us-ascii?Q?0T+caQ5e7d9242pmqFUF3D6y+hH8t64RZ6c2iiFgUBY5YIB78V3gygStur6A?=
 =?us-ascii?Q?hK5KaIDSvGgeaNXRsyB+o6glUDTXLo6y3POSpIVvaWP153xNrkmA39WIN1Nj?=
 =?us-ascii?Q?EHYtiOJ67FvHklB5996BFoieX2+t5z5ZHPYN3iDIY32HQFfV7w3EsXauIEQD?=
 =?us-ascii?Q?Ggqm2SeYQmS35hbwFBBKMTOAnnN4eanzFeZjvhyBGx+jheoch4VwqlS0rzP1?=
 =?us-ascii?Q?uGQDk5DbPkeBSeXBTN7WOFUofs19xGZkU1vpFcvmbleMsN1I5D3NZu4VFtUd?=
 =?us-ascii?Q?RGVU+HTDrlFGplAKM4YIzVGX3uEZGIwwF9k0nCQm?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f12d6343-34da-44d4-0cac-08daf4d13158
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 19:14:14.1730 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qqqh7vDs723Wc5VcLuRB2VT6BFgGcgoKYDAtVY44EypBlDDIWyZZpl15CuYpSVtZUNbVE9cldKwi6NlxgS4h5A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4202
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  f2fs_issue_discard_timeout() returns whether discard cmds
 are dropped, which does not match the meaning of the function. Let's change
 it to return whether all discard cmd are issued. After commit 4d67490498ac
 ("f2fs: Don't create discard thread when device doesn't support realtime
 discard"), f2fs_issue_discard_timeout() is alse called by f2fs_remount().
 Since the comments of f2fs_ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.127 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.127 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1pG31s-001QOI-46
Subject: [f2fs-dev] [PATCH] f2fs: return true if all cmd were issued or no
 cmd need to be issued for f2fs_issue_discard_timeout()
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

f2fs_issue_discard_timeout() returns whether discard cmds are dropped,
which does not match the meaning of the function. Let's change it to
return whether all discard cmd are issued.

After commit 4d67490498ac ("f2fs: Don't create discard thread when
device doesn't support realtime discard"), f2fs_issue_discard_timeout()
is alse called by f2fs_remount(). Since the comments of
f2fs_issue_discard_timeout() doesn't make much sense, let's update it.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/segment.c | 13 ++++++++++---
 fs/f2fs/super.c   |  7 +++----
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index bd1cd98fa6eb..9346209b7c94 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1650,7 +1650,14 @@ void f2fs_stop_discard_thread(struct f2fs_sb_info *sbi)
 	}
 }
 
-/* This comes from f2fs_put_super */
+/**
+ * f2fs_issue_discard_timeout() - Issue all discard cmd within UMOUNT_DISCARD_TIMEOUT
+ * @sbi: the f2fs_sb_info data for discard cmd to issue
+ *
+ * When UMOUNT_DISCARD_TIMEOUT is exceeded, all remaining discard commands will be dropped
+ *
+ * Return true if issued all discard cmd or no discard cmd need issue, otherwise return false.
+ */
 bool f2fs_issue_discard_timeout(struct f2fs_sb_info *sbi)
 {
 	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
@@ -1658,7 +1665,7 @@ bool f2fs_issue_discard_timeout(struct f2fs_sb_info *sbi)
 	bool dropped;
 
 	if (!atomic_read(&dcc->discard_cmd_cnt))
-		return false;
+		return true;
 
 	__init_discard_policy(sbi, &dpolicy, DPOLICY_UMOUNT,
 					dcc->discard_granularity);
@@ -1669,7 +1676,7 @@ bool f2fs_issue_discard_timeout(struct f2fs_sb_info *sbi)
 	__wait_all_discard_cmd(sbi, NULL);
 
 	f2fs_bug_on(sbi, atomic_read(&dcc->discard_cmd_cnt));
-	return dropped;
+	return !dropped;
 }
 
 static int issue_discard_thread(void *data)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 5fc83771042d..8f13798058f4 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1546,7 +1546,7 @@ static void f2fs_put_super(struct super_block *sb)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
 	int i;
-	bool dropped;
+	bool done;
 
 	/* unregister procfs/sysfs entries in advance to avoid race case */
 	f2fs_unregister_sysfs(sbi);
@@ -1576,9 +1576,8 @@ static void f2fs_put_super(struct super_block *sb)
 	}
 
 	/* be sure to wait for any on-going discard commands */
-	dropped = f2fs_issue_discard_timeout(sbi);
-
-	if (f2fs_realtime_discard_enable(sbi) && !sbi->discard_blks && !dropped) {
+	done = f2fs_issue_discard_timeout(sbi);
+	if (f2fs_realtime_discard_enable(sbi) && !sbi->discard_blks && done) {
 		struct cp_control cpc = {
 			.reason = CP_UMOUNT | CP_TRIMMED,
 		};
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
