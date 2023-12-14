Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA71812C33
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Dec 2023 10:52:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rDiO7-0001ot-V9;
	Thu, 14 Dec 2023 09:52:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1rDiO5-0001ok-41
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Dec 2023 09:52:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hXXEq0b0hHGm8ETBkCEq0IGtrx5DccBno4BOfZDaOoI=; b=ivyJPVCnDc6op3sKG1f+L/7f4U
 MvhinOdiUYfCcNPmDQ0uY0RWrMBHmHR7lyGiuok+8FSBh0EmAkbbx0qxVw3i58a77jEWogE2jO91a
 Uxjuvt+Q/PRg66TRM7jlh0643+i5v6OEl9vNBQcVttbPu8b3EbfMi54bBk7kHjViihuo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hXXEq0b0hHGm8ETBkCEq0IGtrx5DccBno4BOfZDaOoI=; b=K
 xcS6NM5OiH2Ej8wCH88co4QMNXAHkhYfMvFvXcmLUNUG5jwCOP/jHQdr0R+NHzAHBHNu0NA/roPEf
 I/sOsuJJqwpvbXKIE12TYJ0cZEoCwteLgSP3CmiJEcskfpPc2fBkk8hzU3nlLADhz/gYMsVfx8qGh
 06SF+QMNTU4m55C4=;
Received: from mail-psaapc01on2133.outbound.protection.outlook.com
 ([40.107.255.133] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rDiO2-0001ln-98 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 Dec 2023 09:52:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XktykoVseuQZRCEQp4XfuQb390YYKzTD+vJadbiX9it9McfYH/YG87m1Sn/tj8mSdZIxEEvcYEUXZT8JUPlA32Z4K8q0AXfmfsPLkTlqd02hlhgAJPdeeUv6MoSMrkntz5hah37TJMBsqmXaRtQnaqc235HKzIIMtei7/nJQR2bZq12xbo+f7oXERCTlCOqb3aN3tU1d12OMTeh/RBpED20UGDigHmQ3xG+Dn7ceeTpV9BUX3zyMmCOFX+Wq2K1ZCG+F8Folw7t/nS+trWA6U8wxk1jbTXKpKECBwv9QPnOCkm3gtg+PhkDi0NMHKZfo1CPJU6okYT4k3DfbCDVsBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXXEq0b0hHGm8ETBkCEq0IGtrx5DccBno4BOfZDaOoI=;
 b=B2V0HZ/J1VOc6HVl33pCWqzUt0fdbdv24T6byM+fWRBjIDRx/sa5kIhnSKtC29fE3FtSUA9DnLL9DBHi0O8tG2VYuGqevp2bhIkdiVqbgY0GKTjxYbdk5G9uOset/8XQHowXYSPF380wUcXkdPrOoXBe9bAXmcufgRhF3GigBMs1It/STan4hx7lSlLiIIcrYwIgKbQHrE0i2l2xqyc5Am6LqITmux6wpbtNz/zdkE2VURHo2IBoJH/1hcSbVAF3WXY0UuuN0yt5Bh0ms9ocOBJNM/O0lj5hMAcL321K95Q3BFJynrt2Q9oisWiuY0x+X/7cqa387T/qdyRBuHPx6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXXEq0b0hHGm8ETBkCEq0IGtrx5DccBno4BOfZDaOoI=;
 b=k5JRmgAr89uXNL3Vo5QgpBaENCNJykjnP/D5PW5OLp0VEIZrwkmQ5ys8WatM87NMhBkZijoWv9i/mmlTYssHLnx0DK/LKA8IINYzadRu6wTM7yJ1OegyTDAVrVrATU/OKw/xCqvSVx70QGV4QzLhBciXi9L22CUyHu7fPMaqJ5CdhpqsXDh2bLqt2paQFQ2rY9VhyuEF8XVdD4R8EJdq6UvIAzs1pty+2anTT1pE9I1+kAh9UjGaYNb0ZfD4KaF+qHwK1dFHwe4BtU4XkMrBiifz8b395nuV4BymrvkMp9uWfpmGFr6IjNWkWMriw7VFYS8A68Y/1dyTPZQmn0f/kw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY2PR06MB3520.apcprd06.prod.outlook.com (2603:1096:404:100::22)
 by TYZPR06MB4381.apcprd06.prod.outlook.com (2603:1096:400:66::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7091.28; Thu, 14 Dec
 2023 09:51:58 +0000
Received: from TY2PR06MB3520.apcprd06.prod.outlook.com
 ([fe80::e5e:d180:d199:47af]) by TY2PR06MB3520.apcprd06.prod.outlook.com
 ([fe80::e5e:d180:d199:47af%6]) with mapi id 15.20.7091.028; Thu, 14 Dec 2023
 09:51:58 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu, 14 Dec 2023 03:01:48 -0700
Message-Id: <20231214100148.3422585-1-bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SG2PR01CA0192.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::21) To TY2PR06MB3520.apcprd06.prod.outlook.com
 (2603:1096:404:100::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR06MB3520:EE_|TYZPR06MB4381:EE_
X-MS-Office365-Filtering-Correlation-Id: df8a96e1-307d-4ac4-83bb-08dbfc8a4fd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eAVAr+cFsxlAfJt5hybX5XurAHZg3RhpFglIGQp1wfx8tHmg/P3a5LEyZqeWv79mBfZRIo9hBdV+fGfcc8PF1vzfFdTqXSRbtS12cyvQ/2UDHbktVa52813UNrwAt7HjyEDJBit088attzdTeIDf0cPk4CuCO6knYhS1tYm/mjFr8PwQ7bHfqO14eaz6QjHe2K6QThqD5kl38bhcyBlFHVAubbI8iPAgbNTm0qu7Y0r1w4kTD/gx2BLpiDFSv77WdmmVPN5EwbTis5eI4NOqqcgmFOx2gjGjEh2uLLTt1mQuNDFTJOXBKNtlxkZAyRiviyFfyJ649LrM2dny+72zXGM+tBiS2zMFts3u4KaYbGhD+UoRA0pJqRl4nE6ayf/8k2/augjt+FDIj/mGwF5XlY3krcFGnwnKIjHk7qgGOZCkSIfZOs5BxDs4/dUBb7TXn4RfOOoo/izxphYIGkENIZ0rc+jDs2X9PA2eKvuQAfNnDFrfIxl58bGY56FFZYFnys6hsmXWRciElcL0TV61bM0Waw7VgO/db3wgsDiBDyVPTNYz1S8mpdwJdMpvYWUIp5ygtwhgNJAruPzNBcQ3R53jcBU//Mp7e0KBzpJVlQKc7MEZKJ0Nz8UaOFYX6R4h
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3520.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39850400004)(346002)(136003)(376002)(396003)(366004)(230922051799003)(1800799012)(451199024)(64100799003)(186009)(8676002)(4326008)(8936002)(4744005)(2906002)(5660300002)(6506007)(6486002)(6666004)(6512007)(478600001)(52116002)(66556008)(54906003)(66946007)(66476007)(316002)(110136005)(41300700001)(38100700002)(86362001)(36756003)(38350700005)(83380400001)(2616005)(1076003)(26005)(107886003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Lk0L0dBeKJB/t/VAbZlptk8PQfnyzUaiav+ZU6HDGEmnFTXiPzvTaq/Wvnhi?=
 =?us-ascii?Q?1t/fsvBWAKQjwEfMxoVdUywx3mfUO5ZqFQ/axquMuPdRdWEYLF71DtRj8n6m?=
 =?us-ascii?Q?HNFQepW2gFEy3JA8+Pi5kGWQsHfIoetEvPsBLgQ6W0MNj85MntF+GOSnI6XI?=
 =?us-ascii?Q?YBjzcwvHmHpQ8hWNywdTALkHpHcKkNqDS0pGElnC9YO45nwt20mQEnqMJZQx?=
 =?us-ascii?Q?JltP51kP2jb/iGpBZ/JGcr6Nn3lST5KBU3M1M6OHdGEOBhBBuLJOiiJznkD8?=
 =?us-ascii?Q?pf+Ax2Z21zGuwCnfDBJDQiVatReqlbP9bwl+BBEgbVOm1+XCX0hq6dAmC08P?=
 =?us-ascii?Q?ROTQXIaNP9spwFBXgK4cgdAVh5i5eshlK675WH9OuLe6ye8gMv5HaGLaymQO?=
 =?us-ascii?Q?oLNFZdJ7bXVVZbJYsA2y91qrxi8X/aXW3epyHeNfjCoUG3hi9fzkQRm0xzg1?=
 =?us-ascii?Q?cdWnhgZoZZ/ZR16mseLHak5yZw1L78v/1k+eyKV4JZzn3zMNYxLXiMLLPvxe?=
 =?us-ascii?Q?x7Dt+QyKcCaNjpRPiWUku4vS979yLAmWxn1gDgaV9YtM/9EbnNWf+IeF+Amd?=
 =?us-ascii?Q?KbWCbGMJ+aFN2uFl4dir4CajrnYdNX2GrjcQ+bTS5ZZd8oVBGUpDsJskzPUk?=
 =?us-ascii?Q?SwxJo5+wlREp1qGZLzWcJ4cuBpfF5q/xr7S90ezF+7NxVKUhz4TDm1tkgsSR?=
 =?us-ascii?Q?Hd05QOuM5taxd38Pbmk3t0icflDte2tHDhDm6kDVLyrw2iGzyuju9xRhsVNM?=
 =?us-ascii?Q?E5zx2z3F8wR4/SRCqJUzcoUrX4GoH/XMWa/TWHcIJVyaQt+NpytH7Z1u16MN?=
 =?us-ascii?Q?aY8NxecLd+1xQbI8J44fJeG3YvLCa7ckpQQYJI1xQ4kGyTuTikTWHQZwGzJ1?=
 =?us-ascii?Q?IciI4FVr3im5+xQ1G9YrhSyWcpFiMUKCzB5t5QyU60FpRqQ/zBL5KCmBPBnG?=
 =?us-ascii?Q?GFxShXX4riAo2r4bHENRem280B37VmmFaGImt2GY1c1LzAPiUDCumRzofpWs?=
 =?us-ascii?Q?t/oIkyc7KTceFTNlB2AtpBPkUXIO3ZBz9JAjbJtM1tuKZ3yMhIp05q8eoPgp?=
 =?us-ascii?Q?/ZfOnheCgVkegmy3Zz1QrFLiNxFjQDSByibVxc0B6uDCrytpUKC7nlEU4n4O?=
 =?us-ascii?Q?4+O2ivIaBM1oIxSAnIOjTRh0DMAhVSifWd8pKnpcx0WtnEO+lp8xJ8BXhSZL?=
 =?us-ascii?Q?wc/LlhTWynzT0EdXRajY7FyK15yLwcPLuQ9L+lYKZEwBdFfx1A4R6XNKwjxX?=
 =?us-ascii?Q?V+FBUA/a8XdxpKH4JyJKut8Lx+sQg80A1o4L00p3Cs9rnXaFq29TmHoruqnH?=
 =?us-ascii?Q?rAY4CZnpj7yzPKhcBO7F+kvYa7UYQvhnVjZAUgA8N4gsxNmPZa8QtMEfYJa8?=
 =?us-ascii?Q?eQ7nINziivuT+f0nX2h+a+Df5pa5LO3t/Y+NXENYCodDXb0sLQKkzNxLTdt1?=
 =?us-ascii?Q?6GWI6eTBD3obM21joGOjmXh/+flcb/+r/oca1stypIuYbivd6+VU2Gt1vf0o?=
 =?us-ascii?Q?8u3vrbLSY0fxeNhBZOc4Rf8GIJpLiOD3f/HnsJgUoSn05isnk41tfWVjLvAl?=
 =?us-ascii?Q?Vh2p/PyyNObmPJHpOuP+r0jPXBB7+EqHpd5uFj8O?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df8a96e1-307d-4ac4-83bb-08dbfc8a4fd3
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3520.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2023 09:51:58.4928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vu7DnOaXZIn16W49Rb3ZbNQLjlZ/ybzApa54FvtNP5RMN8+b25SiXUdGqVsmgT6qfTumJdiVGYIKgtdmAplXdg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4381
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Call path: fsck_chk_orphan_node fsck_chk_node_blk
 fsck_chk_inode_blk
 'F2FS_FT_ORPHAN' will pass to fsck_chk_inode_blk(). If the orphan inode is
 a DIR, it will be wrongly fixed. Fixes: 8fd836f ("fsck: clear unexpected
 casefold flags") Signed-off-by: Wu Bo <bo.wu@vivo.com> --- fsck/fsck.c | 2
 +- 1 file changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.133 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.133 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rDiO2-0001ln-98
Subject: [f2fs-dev] [PATCH] fsck.f2fs: fix orphan inode check fail
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: Wu Bo <wubo.oduw@gmail.com>, linux-kernel@vger.kernel.org,
 Wu Bo <bo.wu@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Call path:
fsck_chk_orphan_node
  fsck_chk_node_blk
    fsck_chk_inode_blk

'F2FS_FT_ORPHAN' will pass to fsck_chk_inode_blk(). If the orphan inode
is a DIR, it will be wrongly fixed.

Fixes: 8fd836f ("fsck: clear unexpected casefold flags")
Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fsck/fsck.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index e93db82..3461a52 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -1052,7 +1052,7 @@ check_next:
 	ofs = get_extra_isize(node_blk);
 
 	if ((node_blk->i.i_flags & cpu_to_le32(F2FS_CASEFOLD_FL)) &&
-	    (ftype != F2FS_FT_DIR ||
+	    (!S_ISDIR(le16_to_cpu(node_blk->i.i_mode)) ||
 	     !(c.feature & F2FS_FEATURE_CASEFOLD))) {
 		ASSERT_MSG("[0x%x] unexpected casefold flag", nid);
 		if (c.fix_on) {
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
