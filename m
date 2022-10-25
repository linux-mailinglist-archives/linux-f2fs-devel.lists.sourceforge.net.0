Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A42AA60CD64
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 15:27:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onJxV-0004RW-OE;
	Tue, 25 Oct 2022 13:27:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1onJxU-0004RP-L3
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 13:27:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v5iQUOl0qSFHB5FESAdrtz1h0GCJFKrchifWQ9aB7Do=; b=B7dhdaMf7VWQiYJ1QXLrY3QgFq
 FwbL0WfrjyXG90Zv/BbxLPhzQPHB9eoQ9z5y4uZ9Aa1v21yjttPl/lDTvfJNi1BzWkvYCfZvFNymE
 rVcmF44Fxh7DhcuMGU1uE8Ifx7QgrnnZ543Y5Yt8glYPB2DQfOuU+fdVat+mMzsNRgSQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=v5iQUOl0qSFHB5FESAdrtz1h0GCJFKrchifWQ9aB7Do=; b=C
 jjH6910PzyqO2nRmTkydZYLk22BiZKTB57vs6vzZqf5BWKSoiHDn1mvTiKtuCk4b8RPv8saf/0qbW
 b4Gv2tIsFO+ND3CTVjiy0qY/J4QUeHgvhu8ssfjmJTDdhCNBtUJQoisMKjbr+mLFi7fZZKUoJOjjm
 t++43LhIibreWA0g=;
Received: from mail-sgaapc01on2100.outbound.protection.outlook.com
 ([40.107.215.100] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onJxL-00058v-Gs for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 13:27:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X4A+sggHdBpa6iapmofbGl8GUwm1Sy24OFz14po6pSHuGKzopMQO4HVrnbh0u3qyceCj4FGg2CRdVncicoUwQFzhaqDtidAtCKm/r/OnPXQLZ9mXTRK3jkZe8vKtyhnJM8GHrhwbWsmoYgd0Iun1VmkE0Lgwm2ldHg0MEBYe8KZ+LQNHPwNNQZZrGG2zk+Ss6xRKo+VV4UagxiYFoJtGtXhcOjVVr/mxvZn48lM1H6PHzAtMFH5/2yFyyZoBusJ8ICwrtTIyZIUbVmn1jsJZbvIpbrqGSlFUUumqeszik9mpFqlWr8dcAxwcD2pubFMJXoHzYJgJ9l17w3YCjk2PcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=v5iQUOl0qSFHB5FESAdrtz1h0GCJFKrchifWQ9aB7Do=;
 b=Qryv3JEXukwolVU0ashQuubuGh63a0TCgmwJ87XRkRmEmyG2Rkg+sWKvg/n3oxaawIyFMS/7ziJlm+SimTAth3QAsNjH7f9xVf2wA2s1gRl7sSvoi21srR9jYG2pleLYcGIieSp0jfMCSJAHya/f6v4xSxj2I1L/7C63JxYHsc0/suMb5Nt95fWSFQQvrRlTrOAxh3tVc23iwv0yjrUu50cyTlP4YrGjSb3lKej/iBO6ymfAqUj39biWBpsn/x/FGbfiAUYAS/q8Iz5/2Q1BNve6Iux3HF3ki/dYi+uNT4fWYtNqD4Jah9tklqY4/X18PkEDt68mtUECgN44pFH8qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v5iQUOl0qSFHB5FESAdrtz1h0GCJFKrchifWQ9aB7Do=;
 b=qUurqRPoJ2V6ljvOI82kOfNmhXyut1iXB4slzj/MzTDXfGm6StB4K7b/X/XtLysP2zDqW0Ek/BzcUSW15G3NRV7+iLeE0I/HnVmmasSlHhqRSpUM0yUvFIAQkGjgEY5tRJ+AM1CKg3QMMxR7pR805W/J/00GDsMfPMUnAUK87ZWkgwOvRDgi7pC9emMPxJLyK3bMn5YGd7Jz+t7ga2RLt631+TKpF9tz1w8G/aVUsCtikGBeSisALbZH4BfCAiNarecb+J79Z+N8IroZwz6P+tfF8S+jmG00O+Gszl+262koFutnIdoo0NQc6+rCd3x2Dunb3y7B3S4i9no12mhczA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PSAPR06MB4168.apcprd06.prod.outlook.com (2603:1096:301:35::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 13:26:50 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd%3]) with mapi id 15.20.5746.023; Tue, 25 Oct 2022
 13:26:50 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 25 Oct 2022 21:26:38 +0800
Message-Id: <20221025132638.38260-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2P153CA0013.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::12) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PSAPR06MB4168:EE_
X-MS-Office365-Filtering-Correlation-Id: 46a6b698-fbab-4d62-caf3-08dab68c9279
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ziG+Ye9rqfI4o4xUXVoGGxfs53wU72cdppwrlV+XDtXPBV4jT2owUWUtugQTwfmmfFcXFCQ4t8JkJ1HMW3pBQAEO7+4hssWYTu7xDk4xMBjSUdE5fLtaL/eW7lz4aegxRtNTxZqrkUjw1jxRppkAoWVV9ejsa6ER5Qjrtbb8X8EFmqw5eMxFArFn7bJ5pwxU7nED/lfqmySeqseb6pqCX+BelD0KHIelteAJ6hZyjHtvd7CvH8LhmkrUW1ZuAQKEIS92CWhW0WbvXJCT6az0JvwTThxRZtUrTjB5w84KVxAxHEqOCg5wgTRtnLE/4xEWKqRUCcmIgHT+IFGHp16J+0e23KEx7YboP12qYSeEPG8AAJD8SdAtGD8fBaSvNMgm71FOqu8hhGZCyfzrgxwc7lgqWYNWoQszJiIeVK3sbWV9RK381K7n7k5CS5/P4nd27K64febxeaEGpQ10+YCX0ufOhBkXIXQvxCO5eAMxcD3HizxbJuPBGyFQab8bcQlHm7jSDM5zBbie6LIPFDxR61dP1CAFI2CTiuZsz/++H/xl2RR1trB7z9mLlLhrK5Jw8ZE+2lChqvJSFwh7YXov7+hNfXXZpg6FVt2cTGh8NS89MyTI7OL9I3tgXo+igS8XdrhIPuI2yLk0BLpJ4AvL4VSxd+0eaKtnyw/PSIY/ZZQTw9O9hP6y54cyaWNfWWEeptloIa7zFKe5nhlyqHBRwK79o+Wmb1deMIh4yLx/e5YPuAavm+wr68z7f0np2uc1pDtS+p96Ek8GkKiXp4ACuw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(376002)(396003)(366004)(346002)(451199015)(107886003)(6666004)(1076003)(8936002)(66946007)(2906002)(2616005)(5660300002)(6506007)(36756003)(26005)(66556008)(66476007)(4326008)(86362001)(8676002)(41300700001)(38350700002)(186003)(52116002)(83380400001)(316002)(6512007)(38100700002)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5eWQuif1G/vGa8SW4QmiuhdK/loxms8ef6XD/dXqkMsFLvxafMQa+aRBcczS?=
 =?us-ascii?Q?uZMOt2sGLrH8M//bQCBwgcG7X4Q15RTESzYKcxgpZSoTHajKFfxEMMqOLY3L?=
 =?us-ascii?Q?wH/VD7CaDbtpJX5gmJ/QvZiYx/9r6H2vLUfHnU6xN/haSAw+8GV7uMKRbZZr?=
 =?us-ascii?Q?HF62RQq5bulummQnYvqe/NoJy9YnjX8tP7OZLzL0WokvaduZ4TxUoYv8mDi/?=
 =?us-ascii?Q?eA2omffxHnls7MqZDBqWRNYOvCWdhHrHFcT1X45RFcl/tw8ylbWUn4luLKh5?=
 =?us-ascii?Q?fsNCNcwyIo5TpZgaUhIGdIWyNenhE1csJCy0V7EoDQ5kwGi+EBPA0sRyd3uJ?=
 =?us-ascii?Q?coh8yDQFactrq8vuJGpxsXzNL9Y8kfE1BhSdPz58zKG0jrz7BulK4PO0y6ux?=
 =?us-ascii?Q?AZakhCFtaQ2MMnWD+uwJL3fHsuQA0YZw2nIXp660bZnHpe2iSfeC5LA+eBI5?=
 =?us-ascii?Q?P2EZEinQcrRSzTHzudQYzcAunOMsDIgHwquRKX8e4VOniHqBcOjoYi8/xIZd?=
 =?us-ascii?Q?oTc10MFJz91i9wM1FUgR3urJXGVJNOyoVN+sZLuLQ/EMwdwbm83Bu76x7cRl?=
 =?us-ascii?Q?fuGvKmVx33IzAU+cb8mu3dWgiOshxx1UtHKummP8yCRoqFnCylJNKhKEoy+K?=
 =?us-ascii?Q?ZNVq2j3t/IoZF/woKqVVN6qcQloLFHW1fQkEE53VFizF7o3eV67kSkoFNaUp?=
 =?us-ascii?Q?gGF/vBHP8Sw/zigqcqVkUQoqHyR9kyS3TTmH1ooIc4o4V8OrISlfngWws4yo?=
 =?us-ascii?Q?bqJZW9RU9sdTsTBNzOrvfKmTdJaiDQOMOiVVWQsTe2NTbPFAKpYHF9843mSt?=
 =?us-ascii?Q?oRWcBqmoNSn9MicI88dNYgL3NyT44XtBFaBu7KLrRPdJb5jNgRew78WC5Moh?=
 =?us-ascii?Q?LRNc5PWMVPB75Cm0PgP+43y/6vd0lnWN8eIJjncD433Nqxpytq6l4YQinKX7?=
 =?us-ascii?Q?RqeItAv4w7BFA35GqAA6HsxNabwsuuJUVCcETNL3qfoRAaD7ZZize5ZC//Os?=
 =?us-ascii?Q?TTi852bNHjIFFvxRoBP/p3b0cp+q8oBglX90us5tUZDafr94g42w9zFsX6zK?=
 =?us-ascii?Q?Says2H/0lIaKAcP7UTbrpYYCjga0K1Vn6Uwr+gggFLUBHEc/vCsw5uwcBNnM?=
 =?us-ascii?Q?qGgcibOYmVjjZdkzpuiwvmD3t7kWIqkLeZd68WMOumjgzQZ/7CcvLGxbRHM4?=
 =?us-ascii?Q?VVxIP6gceiJ3TlpSwE4p/Ek2fRzfL5E39KKCrKDTErIx2lBHBYRpoXh2d2yv?=
 =?us-ascii?Q?IvC8YsQ4psIN/fVSFRlygOfAuTOQA/Z01Nh27ZplAVBf2tsSoeo6C6YYT0lG?=
 =?us-ascii?Q?J6TuBEA7b9yzIwPXNGV/PsWyOYTXIgS7T40VtCqQ+C5j5IdA18yZUTi5F7yz?=
 =?us-ascii?Q?nokESWspcfhCPgKxr/XPFfsXZ140buuH0qmd2e7RN6kh9ft6EbYT3UrIeG5L?=
 =?us-ascii?Q?IdSLemneq31sZZaIO4mLY0BUdOqNOhcxy1OwVk2DmRzf5+s++Jn+VG0MEEyj?=
 =?us-ascii?Q?6zSDKwsKTZANmY/QXo9UuW211nbWNF57Fe5IZ8uuwcRmZVHTIs0lTUKDzzGl?=
 =?us-ascii?Q?q5rsPn+NPY2H+5R/G3nhYuMqtmaDtrdDZKQVccBn?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46a6b698-fbab-4d62-caf3-08dab68c9279
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 13:26:49.7040 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yon9TeoF7CPUGxwwrRR6e68grFYjdhitlN8SyJi75zcT6nbc1fEXFcOcChsyGCmQBjR14y3ie4w8vuaSXKTyzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4168
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch adds a new proc entry to show discard_plist
 information
 in more detail, which is very helpful to know the discard pend list count
 clearly. Such as: Discard pend list(Show diacrd_cmd count on each entry,
 .:not exist): 0 390 156 85 67 46 37 26 14 8 17 12 9 9 6 12 11 10 16 5 9 2
 4 8 3 4 1 24 3 2 2 5 2 4 5 4 32 3 3 2 3 . 3 3 1 40 . 4 1 3 2 1 2 1 48 1 [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.100 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.100 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1onJxL-00058v-Gs
Subject: [f2fs-dev] [PATCH v2] f2fs: add proc entry to show discard_plist
 info
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

This patch adds a new proc entry to show discard_plist
information in more detail, which is very helpful to
know the discard pend list count clearly.

Such as:

Discard pend list(Show diacrd_cmd count on each entry, .:not exist):
  0       390     156      85      67      46      37      26      14
  8        17      12       9       9       6      12      11      10
  16        5       9       2       4       8       3       4       1
  24        3       2       2       5       2       4       5       4
  32        3       3       2       3       .       3       3       1
  40        .       4       1       3       2       1       2       1
  48        1       .       1       1       .       1       1       .
  56        .       1       1       1       .       2       .       1
  64        1       2       .       .       .       .       .       .
  72        .       1       .       .       .       .       .       .
  80        3       1       .       .       1       1       .       .
  88        1       .       .       .       1       .       .       1
......

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v2:
-move to procfs entry
 fs/f2fs/sysfs.c | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index df27afd71ef4..0fc17375e042 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1243,6 +1243,44 @@ static int __maybe_unused victim_bits_seq_show(struct seq_file *seq,
 	return 0;
 }
 
+static int __maybe_unused discard_plist_seq_show(struct seq_file *seq,
+						void *offset)
+{
+	struct super_block *sb = seq->private;
+	struct f2fs_sb_info *sbi = F2FS_SB(sb);
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+	int i, count;
+
+	seq_puts(seq, "Discard pend list(Show diacrd_cmd count on each entry, .:not exist):\n");
+	if (!f2fs_realtime_discard_enable(sbi))
+		return 0;
+
+	if (dcc) {
+		mutex_lock(&dcc->cmd_lock);
+		for (i = 0; i < MAX_PLIST_NUM; i++) {
+			struct list_head *pend_list;
+			struct discard_cmd *dc, *tmp;
+
+			if (i % 8 == 0)
+				seq_printf(seq, "  %-3d", i);
+			count = 0;
+			pend_list = &dcc->pend_list[i];
+			list_for_each_entry_safe(dc, tmp, pend_list, list)
+				count++;
+			if (count)
+				seq_printf(seq, " %7d", count);
+			else
+				seq_puts(seq, "       .");
+			if (i % 8 == 7)
+				seq_putc(seq, '\n');
+		}
+		seq_putc(seq, '\n');
+		mutex_unlock(&dcc->cmd_lock);
+	}
+
+	return 0;
+}
+
 int __init f2fs_init_sysfs(void)
 {
 	int ret;
@@ -1313,6 +1351,8 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
 #endif
 		proc_create_single_data("victim_bits", 0444, sbi->s_proc,
 				victim_bits_seq_show, sb);
+		proc_create_single_data("discard_plist_info", 0444, sbi->s_proc,
+				discard_plist_seq_show, sb);
 	}
 	return 0;
 put_feature_list_kobj:
@@ -1336,6 +1376,7 @@ void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi)
 		remove_proc_entry("segment_info", sbi->s_proc);
 		remove_proc_entry("segment_bits", sbi->s_proc);
 		remove_proc_entry("victim_bits", sbi->s_proc);
+		remove_proc_entry("discard_plist_info", sbi->s_proc);
 		remove_proc_entry(sbi->sb->s_id, f2fs_proc_root);
 	}
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
