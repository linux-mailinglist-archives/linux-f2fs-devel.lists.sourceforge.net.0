Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6905142BA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Apr 2022 08:55:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nkKX2-0000Ak-AC; Fri, 29 Apr 2022 06:55:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1nkKX0-0000Ad-Ax
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Apr 2022 06:55:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/EMEYztz+8Jz8fT70BpAxo1TbSy6dN8jfFFeg1xLRZM=; b=C3E1xsjj7y2ePQ4anzXdGoicOw
 lF0qy6RSgSwXsMpTsZNDGy3n34CmCQ3zPibkk2Xy0J4bKhfgxluWqJEW0Rk4A7B+r8J+wB+QXWK3g
 LTaQhAbn8OIX8yjBJJhiFkavBbLWuu41X094fm9hvW8Ag2pUcWvPoKYiWsSWwz+uO/LA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/EMEYztz+8Jz8fT70BpAxo1TbSy6dN8jfFFeg1xLRZM=; b=Gdg9NidT/vF04E/yTRrACMbttv
 ykVLW8dv4wNX/M2GfxtLT8B8XGup2zw3NZLAaxy9tWGrUvzNKti6VERLsNYN1DE1gCGaVFayiB/fh
 jJceSBjhVyMYsM7W3RL27XpGUAiNNHaQ4m1XaxS2BcXZC1OuW/0qmenhXUgFUsXu/eUc=;
Received: from mail-psaapc01on2092.outbound.protection.outlook.com
 ([40.107.255.92] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nkKWy-0001a9-2O
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Apr 2022 06:55:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fYNVf0Zk+Xw56Fk2SiksACCr7tVavu2gf+rnj4mGEtxyOuZBSCNfwSXW3FyT0iO63cp137rRAviD8zcIjwAth3LlsSAuwNyibecNaw+IwmBXWn7QHpe9CY8dZkHm6m/2PuLwz9e+yNViXDGCwF7xoP9Fl9yMoE24aARWBylRUVcURMHQQ0z3A09C4/tMEYRuBHSAUatuQNXaCQ0Bbdnq1OMJqVf456I/3bdlgDlh7BDilytgoweytc2FIq2dkEewG7q5OR0SkEzxHXiqPNCzXUx9FkDnkVBDhb/dcgiqwq/JqharbUkC6Qk75rzrpNum+9epKPKH/ZuYzC7PoQXLBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EMEYztz+8Jz8fT70BpAxo1TbSy6dN8jfFFeg1xLRZM=;
 b=OQ8gZ14uGiemHacv1qp0CJOfwNFI4q8/Wl0BAY1KmbfGOtC5M1aMyAMQlaUWegYR2VE+79b2eO+AW779o0dYR88tJ/IkdvfrauRxgbabLaEn9v3dOyoZIuz6Gx00NSQNEh0TTtpvmEdixaMwfaIyb3pfS/TQA9+4y9TxdzJoMm06Y/ra9ZCarbOtUrusWc0ZCvAf5AaD9ejeVk11fdcKQUNASZvSK6ljhOsOMGbKw5WgrcslQ+Lb1ZOZT2YIMc4ithyjF405F9bc7VdRgH2inHsO3XYRoHPTNgCtGYXV787e7IphW445dyCfcLwUjf/HXReIr9AFJlaTSODcN+a5QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EMEYztz+8Jz8fT70BpAxo1TbSy6dN8jfFFeg1xLRZM=;
 b=XFtWGwEF7nxJyKiS4e50zdZUIaQmi9caGe9syPWU7H3/YVSusM67CZkHD+m1yqanKYUqWOrT0PnXHy1wsjnWzGlPXLtxurzQ8nbGrHx437xojiFZ/Gpni3h/9qk7BE8rWtJsnZkD9xtvKoGKakoI/4/KzMHMiOuPvzd6eIf8ttw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by TYZPR06MB4176.apcprd06.prod.outlook.com (2603:1096:400:2c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 29 Apr
 2022 06:54:58 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fc26:a0b5:8bfd:7c02]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fc26:a0b5:8bfd:7c02%5]) with mapi id 15.20.5206.013; Fri, 29 Apr 2022
 06:54:58 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 29 Apr 2022 14:54:45 +0800
Message-Id: <20220429065446.208019-3-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220429065446.208019-1-changfengnan@vivo.com>
References: <20220429065446.208019-1-changfengnan@vivo.com>
X-ClientProxiedBy: SI2P153CA0005.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::11) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0ee9e794-f10e-4e46-ba6b-08da29ad2b9a
X-MS-TrafficTypeDiagnostic: TYZPR06MB4176:EE_
X-Microsoft-Antispam-PRVS: <TYZPR06MB4176B559F725880DE43000AFBBFC9@TYZPR06MB4176.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: d8HDXTzmXwr/gg+cgjvfSV7+LTkjci8st2yRpylVsyS9qrmIviJ1OvobLxh7Wk1fF3WFamcgkCzC5JL3aCQoDAlCzsJq+ETDIT5hImNcVTOwnc67j8FK0NkrS2lZmYtyWW6bLalLzkQIaa7HBlB5rstLDGUldHnx2gZEDyBEZHz1kEW1TtLUMAlglxnuVcgIJgTxs4YmqH2odP2fEGblz1Y9pQouEFWX5ytO7wETJkLfcardxQn2iXrCF0oOUHMojXL9AOpM+xt20E50jkGhU2RepzTdG3kqkff07fUFZsSLZ6Yl/zoIxAK1KNTO0UfvDpib4rV9wfG/FkWdUSiF1mMr3JDJ6TbGCrkbbEsmsqVUlySANf+lJ09Vt3367ML+ogYVG9hFOKZLeeywdriXQ+9b9ihIJ+gcpQ/Nja2XqYAVjhwktdEEToyg8ZHYYaFCjcb2GCZXjwFKpvHrUoUj8b+WRSOU2ltUoAqSo3RaNfu6znjR8E/WYTuPpurhFFk2oBm3SBX7NQe5okk3lDd1xEi0NXL921JNiZDBfffZIFmt7hPrtRCLT1MvVZkjml4JzISNS6zZ7UT4DwJnN6dksR9bVRWrAN7Zg9EMjmiydcTM9ost4etmLz2lHSEyiQqaeFqORXZcyYgbaO/nzeAdopJApWZfR+l37iKAUB2xMeUkzbDVWWupgl3Sb6nRxP+i
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(66556008)(186003)(66476007)(36756003)(2616005)(6666004)(83380400001)(8676002)(4326008)(6512007)(86362001)(52116002)(26005)(6506007)(508600001)(107886003)(66946007)(2906002)(5660300002)(6486002)(1076003)(8936002)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AkQh6H4/RI5ih8gcfsbqrMsin472/N4LMvoNHxMToITvMROi/Tns7laGLhCz?=
 =?us-ascii?Q?4bhnLmBdiPoHEzYEjOtzOme5QBFy+Xm8wT6a5bnlgSbIUdLRDjsQrXtJuT7d?=
 =?us-ascii?Q?OQl/2VVRnJFlF7o3/KHjnudUo6K+jkERA2Cke34wErCcdl08on8ZUlLAjK7h?=
 =?us-ascii?Q?SfrcT9zSvsM3/pUa0z5RxpdeskSmuKBBdimiV/5dcDk5VTqw2wU2OQKnYwkZ?=
 =?us-ascii?Q?db/ZrOPIY37pmEI4NPVF/p4jPLdJADSgLwMZWVkQ0ZKQHj7BhjCSOf9N88M/?=
 =?us-ascii?Q?kwGCRdhVJxeqb9S/bJ2SZlIs+mczt1n3MtGn7VkhvHQev1QTgrDVuddvxS2p?=
 =?us-ascii?Q?zvgU0f3T5AS1F7LYK3uoIKmAHhEvRjoqACaadcMW01eEDwZLoZOpenSPgHyd?=
 =?us-ascii?Q?BjNKsB037EV4zBpC0i+ekzNhaD/InC0ubcjpAshH4tEX74gkkkhwm5DTS+nj?=
 =?us-ascii?Q?rYlG9OjBefaTnG72FGQj+ru0RB7PBz/U1Z+7rsenuoh470fkSwbBftnzBthy?=
 =?us-ascii?Q?o1uCIsNkA5EmZ1fZTUlWghomzGuBBcCT5CHzDM26Kc2E2TwTs+uSTEWvNHV8?=
 =?us-ascii?Q?HFyMZabfDES3135p/OCp7KDVNUNyweej4uzwdTf0bCWMELjxzesCvsd6IElF?=
 =?us-ascii?Q?FxUauFyc8OwwOu0zR8vkpaP7bt9XL04zFoZezx0zmInP/TOSnyFTXsWcIUm8?=
 =?us-ascii?Q?RvsVjLs49Z3Uorqen2CdvhbL1VP5dAEyew6yVqQqcn6493JcY//JfH2OOm4b?=
 =?us-ascii?Q?0Cac/GzY58crxbX/qQNnK5dFBNtb7bd3jMYxbYah4WQRa8EA/UWjheag+WXz?=
 =?us-ascii?Q?Yp9oVSlb436CA6zuWR8essnX9Fd1BEp5jPmLa+LGG8IK+vc9YOuOJkICjmQ+?=
 =?us-ascii?Q?HC6jGPrQHHseyFaX2uK6QQnL2nwHViBRkvfZ9y+jEfIylL8LHvh9P48x/AVu?=
 =?us-ascii?Q?G13vrpg7SlWwwLYgnDZ8jPoBUIc2hdFvqh5Bsr8A5m8nSjB3nzgr3sVNQWLo?=
 =?us-ascii?Q?/BQkuX67eAwjJAoSOJhFpIUWrN5jZ8SR9DEklg8uRKjk/wl81dmnwfvdV8OA?=
 =?us-ascii?Q?Ywjo6joAjcOXt5DsHXjW0KzqpNNutDbAX9zxt+O7HEFLDElJbxcWB9F1LiTq?=
 =?us-ascii?Q?YVzqIdxsR0jul6Q7Z79c1ozeAXS2Jyrrn3LMm2S0QtZMHQSC12Q4ngvor9pp?=
 =?us-ascii?Q?dWBCIo+VkqegJQmL1uP5VSOqALjnsY0qljJucDrlVioVgmPkRwP1N2nAfuSy?=
 =?us-ascii?Q?NRY4p7sJfJI0PKImqil3MQXhePHSLz2ImLgBKm1eyKzFc7UtszeveCdlxsof?=
 =?us-ascii?Q?yxqtP1nSoIpqFVwRQrsRO1s1hO41E3BxwRfm+tNx/BVmIBproPwKWNtRWdir?=
 =?us-ascii?Q?yLbxmT2spr7dND7Y0KpYKL1VWk7148+y1O6/QqIycF1Kks4kGlc+mfwtD76F?=
 =?us-ascii?Q?nLw3a7/bQzfawfosrkKQgD0E4RXKhtr07wdHzrovgWROXL2LOuxCTyYngPOl?=
 =?us-ascii?Q?rhuhaX88ENMQ1cQZvI5029+PHY5EP3xEqHP3K9oCJ5u6xm8NmC9/VEQNnmL2?=
 =?us-ascii?Q?GgFmT69JGJg8MnGiQaviUlzyibCTIaQPUrRUdTqyHaFOxspOxRPQmZcNK1n+?=
 =?us-ascii?Q?4GTW5fKG6OmtVgU6hV/AtWxp3rl+5j0RLACj1lYicQ1dpNO+1armGJi63lu8?=
 =?us-ascii?Q?TLP/5NIf9gFjEAHJmdMGkePdTLd4D3BSRy444u+91xMYXLqEsTqpGa4YZYYf?=
 =?us-ascii?Q?iff4PNg+fg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ee9e794-f10e-4e46-ba6b-08da29ad2b9a
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 06:54:56.5862 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0YzAdQMzuP2Yq5+p+dVsiIxfmKH5oCsfrEcEJu/l0rdLh5Llo0oaQBQ+aV7GSJgb9IIpHZ4fVXZwzqvqftK53Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4176
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Since pvec have 15 pages, it not a multiple of 4, when write
 compressed pages, write in 64K as a unit, it will call pagevec_lookup_range_tag
 agagin, sometimes this will take a lot of time. Use onstack [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.92 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.92 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1nkKWy-0001a9-2O
Subject: [f2fs-dev] [PATCH 2/3] f2fs: use onstack pages instead of pvec
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
From: Fengnan Chang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Fengnan Chang <changfengnan@vivo.com>
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Since pvec have 15 pages, it not a multiple of 4, when write compressed
pages, write in 64K as a unit, it will call pagevec_lookup_range_tag
agagin, sometimes this will take a lot of time.
Use onstack pages instead of pvec to mitigate this problem.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/compress.c | 14 +++++++-------
 fs/f2fs/data.c     | 16 +++++++---------
 fs/f2fs/f2fs.h     |  5 +++--
 3 files changed, 17 insertions(+), 18 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 11499fd3dd6b..bebaae51863a 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -871,13 +871,13 @@ bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index)
 	return is_page_in_cluster(cc, index);
 }
 
-bool f2fs_all_cluster_page_uptodate(struct compress_ctx *cc, struct pagevec *pvec,
+bool f2fs_all_cluster_page_uptodate(struct compress_ctx *cc, struct page **pages,
 				int index, int nr_pages)
 {
 	unsigned long pgidx;
 	int i;
 
-	pgidx = pvec->pages[index]->index;
+	pgidx = pages[index]->index;
 	if (pgidx % cc->cluster_size)
 		return false;
 
@@ -885,15 +885,15 @@ bool f2fs_all_cluster_page_uptodate(struct compress_ctx *cc, struct pagevec *pve
 		return false;
 
 	for (i = 0; i < cc->cluster_size; i++) {
-		if (pvec->pages[index + i]->index != pgidx + i)
+		if (pages[index + i]->index != pgidx + i)
 			return false;
-		if (!PageUptodate(pvec->pages[index + i]))
+		if (!PageUptodate(pages[index + i]))
 			return false;
 	}
 
 	return true;
 }
-bool f2fs_all_cluster_page_loaded(struct compress_ctx *cc, struct pagevec *pvec,
+bool f2fs_all_cluster_page_loaded(struct compress_ctx *cc, struct page **pages,
 				int index, int nr_pages)
 {
 	unsigned long pgidx;
@@ -902,9 +902,9 @@ bool f2fs_all_cluster_page_loaded(struct compress_ctx *cc, struct pagevec *pvec,
 	if (nr_pages - index < cc->cluster_size)
 		return false;
 
-	pgidx = pvec->pages[index]->index;
+	pgidx = pages[index]->index;
 	for (i = 1; i < cc->cluster_size; i++) {
-		if (pvec->pages[index + i]->index != pgidx + i)
+		if (pages[index + i]->index != pgidx + i)
 			return false;
 	}
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b8204d91fed4..dd9a97f6900c 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2872,7 +2872,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 {
 	int ret = 0;
 	int done = 0, retry = 0;
-	struct pagevec pvec;
+	struct page *pages[F2FS_ONSTACK_PAGES];
 	struct f2fs_sb_info *sbi = F2FS_M_SB(mapping);
 	struct bio *bio = NULL;
 	sector_t last_block;
@@ -2903,8 +2903,6 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 	int submitted = 0;
 	int i;
 
-	pagevec_init(&pvec);
-
 	if (get_dirty_pages(mapping->host) <=
 				SM_I(F2FS_M_SB(mapping))->min_hot_blocks)
 		set_inode_flag(mapping->host, FI_HOT_DATA);
@@ -2930,13 +2928,13 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 		tag_pages_for_writeback(mapping, index, end);
 	done_index = index;
 	while (!done && !retry && (index <= end)) {
-		nr_pages = pagevec_lookup_range_tag(&pvec, mapping, &index, end,
-				tag);
+		nr_pages = find_get_pages_range_tag(mapping, &index, end,
+				tag, F2FS_ONSTACK_PAGES, pages);
 		if (nr_pages == 0)
 			break;
 
 		for (i = 0; i < nr_pages; i++) {
-			struct page *page = pvec.pages[i];
+			struct page *page = pages[i];
 			bool need_readd;
 readd:
 			need_readd = false;
@@ -2968,7 +2966,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 					goto lock_page;
 
 				if (f2fs_all_cluster_page_uptodate(&cc,
-					&pvec, i, nr_pages)) {
+					pages, i, nr_pages)) {
 					goto lock_page;
 				}
 
@@ -2983,7 +2981,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 					(!f2fs_compress_write_end(inode,
 						fsdata, page->index, 1) ||
 					 !f2fs_all_cluster_page_loaded(&cc,
-						&pvec, i, nr_pages))) {
+						pages, i, nr_pages))) {
 					retry = 1;
 					break;
 				}
@@ -3073,7 +3071,7 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 			if (need_readd)
 				goto readd;
 		}
-		pagevec_release(&pvec);
+		release_pages(pages, nr_pages);
 		cond_resched();
 	}
 #ifdef CONFIG_F2FS_FS_COMPRESSION
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b4bed1e983bb..4b005d7f326a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -597,6 +597,7 @@ enum {
 #define RECOVERY_MAX_RA_BLOCKS		BIO_MAX_VECS
 #define RECOVERY_MIN_RA_BLOCKS		1
 
+#define F2FS_ONSTACK_PAGES	16	/* nr of onstack pages */
 struct rb_entry {
 	struct rb_node rb_node;		/* rb node located in rb-tree */
 	union {
@@ -4177,10 +4178,10 @@ void f2fs_end_read_compressed_page(struct page *page, bool failed,
 							block_t blkaddr);
 bool f2fs_cluster_is_empty(struct compress_ctx *cc);
 bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index);
-bool f2fs_all_cluster_page_loaded(struct compress_ctx *cc, struct pagevec *pvec,
+bool f2fs_all_cluster_page_loaded(struct compress_ctx *cc, struct page **pages,
 				int index, int nr_pages);
 bool f2fs_sanity_check_cluster(struct dnode_of_data *dn);
-bool f2fs_all_cluster_page_uptodate(struct compress_ctx *cc, struct pagevec *pvec,
+bool f2fs_all_cluster_page_uptodate(struct compress_ctx *cc, struct page **pages,
 				int index, int nr_pages);
 void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page);
 int f2fs_write_multi_pages(struct compress_ctx *cc,
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
