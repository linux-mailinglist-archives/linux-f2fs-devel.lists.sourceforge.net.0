Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CEF44675608
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Jan 2023 14:41:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pIrdp-00045H-HH;
	Fri, 20 Jan 2023 13:41:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pIrdm-00045A-Rb
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Jan 2023 13:41:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vU1ycY7GCmUeqhh20nXHtH1ShX3OQjcr+pnw1xwkW1s=; b=FreiLtrop2bjR+42zpLy4AZBMd
 czWa8/nq7U39JYvXnkwX+vaG+kfi+05NQXwF/RpNxuLCC62AS9prodLiw4rWswZUNpmwvvzyupXFX
 oFHhNMuxUIz+0wcP8WdeIZZ8CSJ/pKMk9sgoGMbG7VJC2PWbTOXP8iHBEAfPft6/nFyI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vU1ycY7GCmUeqhh20nXHtH1ShX3OQjcr+pnw1xwkW1s=; b=a
 PYEi+RiEOxH1sPFU00vnXdRgv5zEciAw+KVuphpB6uV+aOIzCmkkYtqqHslZk115sm+NnJss5kxJo
 twYui1naWQHB3DHjZoglDJGXYF+BxF++gwGK0Kh+DF+cP75VXr69U1FN05wAt5MtbVN2jbG3MQF3n
 cIrlgqq32Phsgd7o=;
Received: from mail-psaapc01on2129.outbound.protection.outlook.com
 ([40.107.255.129] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pIrdh-00AF7t-Je for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 20 Jan 2023 13:41:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZO2P5MaRaElfGvxtu6946t3E2PFisdEn5ym408QngP9qKXxQHdk1IWXqD2N7KWtnorsXqzmXuThWVIPsB9eeBu7OS0s/f+jPhxsX3VbZqMGymyt2Vmm3bl8meoybg9/KaqCsna2pNIFIt5h4wWZL6+pd2Szi2f9RUun9WQqJ7B683t6oIOPlmQYtJUbWD3qu9kLgW0eNJcIQpOYhXOZNqVgFHREUhLTYgqb6My8nrlUiuIT9+xGd9YoSZNkvz7sUYP4mTs4uO1xyU+b6DszXd+srifafSM4juokX1YvnorrSBfRZXR9LZiqzf8I4XayxdFzD2YQu6PkmCi8b3rq3vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vU1ycY7GCmUeqhh20nXHtH1ShX3OQjcr+pnw1xwkW1s=;
 b=bcLpem5r29M58MEsfZ3cwTmk2vZ8VKN7o0GveGEZJa6jkaiMMV7KNp/E/GaaikLydAt+uLk/Qglk/iGiI4ZJiIJ0+TdyGqOtZuQumjnzXxjFXs6IzKoIHUCo8QVUBC5jtIQoEULEy1Nfqk6sEPZXKpyaKXzMa7i5kHzyf8TsvcqZckWReGpz+4UR90CPZCKPwsBE5Y2wUxyNWkX07X35P3p6JsKJczRH89xU+aMJXAI84KfLYlfWEhnG4WyAl98WnBBZdY+TH1qrQD2fD6HxT/7DyvgiktJJRPwJJRSRg6u5XlWRiTer79ika67bRhGJRuDqeqv8/0Wtmn0rlHHXYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vU1ycY7GCmUeqhh20nXHtH1ShX3OQjcr+pnw1xwkW1s=;
 b=b27vdpUFuztfGG43Fb25p1LuZi+peu6h69Uz+nmsAGUPpjgI4eJtG3yifu4hf7HscR1o3u6CJz9IBWltry8UAMfMNwzQUgKhNKyjwKa+Ci54TANGF8sDGS1hi3s6BRnGjQemklzhRONF5AMvjJW9OYG65/xHyhXI0T8YjuW+tI/e4ieCEiq8c8A0KG5fCEAtrES2mW1gNdZtYNbJwxuWFARBQeEK1PImzX6pmq5R4qdR0vHuPIOFUCq3O7qeyAFcKfJVQV2p88Ek6Rh8vGABM6dJB1OBt0VB3PpDV9+pcIVIzZVkWHJ3oQbKgP+oIPzaqaLPRapyzJ3ktbb2yTyrgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5127.apcprd06.prod.outlook.com (2603:1096:400:1b2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.5; Fri, 20 Jan
 2023 13:40:50 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6002.012; Fri, 20 Jan 2023
 13:40:49 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 20 Jan 2023 21:40:26 +0800
Message-Id: <20230120134029.69200-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR06CA0234.apcprd06.prod.outlook.com
 (2603:1096:4:ac::18) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5127:EE_
X-MS-Office365-Filtering-Correlation-Id: cbfd678e-4f62-4000-a676-08dafaebf0ef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NEPvmUuDh777qxZNYL34+3UhLk6j4CCWydtZhmrmQoDHt7xDY8mK2JNOs3KJnCs53G1waUq/1xX+4w/IevkVi7CSc1V469XVube58PBrG3EzRkCT+SL0oZAgYl4SMr8wPaBbNASQ5eeL926iQX8ILfbAK23FOxIVME0xeJmMRmU8VZ1yoXPA49aWVIvYAK/ReGJ3dHfufap/c7RXcMay1mKXBbiX6EqqxS4Zbm+0qSfRzAcHcJQHIrUsYpwAiqiR7qv/9a9G/hWk1hlwA8i+Jxzt7N8Eapg65yBbIzwiXlKg+7t11qFNeaA6n3EP5v9/yYtJyE9arrA+4zbVZAIzMySx9MKNF1Lz//V1T9rwh35Q7kr8DP80Bj2gw8BkXi2HrwI0aYHrxf6eQkkVo2vdlBnpTteu6x06qyKda4AJluBzp8Kz3yIq10xYqm1tPuGmktf8UDHu93S8rmRFMgzlcyG69FY0KixoiMxoi/xMOlh9NtPvkwHWKL+CRpebV+oxhNoSxKkL2ed5s6gshoCczf2sjNJiLh2C+y6SWuJL2Dn8P8GX7wl6EfHTVuQGYL2CIxGnv+oYHTMtepilDJLWNIFW4AastTt7Oflci3luKjUWqls0suWGxGf7aIcWGgP48Hxi96dLwnbpIQKJiqvf1mtfTlI55x974/722QJvr1kP3x9UY7z3Gt6d8Yt8CrgeoaqhHxI5PZHTLdX1o+8TWA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199015)(316002)(38350700002)(6506007)(38100700002)(66556008)(66476007)(66946007)(6666004)(107886003)(2906002)(1076003)(2616005)(4326008)(26005)(52116002)(478600001)(8676002)(8936002)(186003)(6512007)(5660300002)(83380400001)(36756003)(41300700001)(86362001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JuuHN6IpVIvKaQ8SynbOuWqztiKXEDlA6UIHK0sJGCVwfeODxr4arARB4V6Z?=
 =?us-ascii?Q?1nM4Vu9e1VVX9TTXIgdfSeyBrnp7wn2Lvl4nEV3ORkTDguOKgDLB44AjHTKX?=
 =?us-ascii?Q?tRP3To3oHTKkJDertiBRf6cVn+LLPzQc5+RKFfsX9hKyk1hkpXJK3IqbnzQw?=
 =?us-ascii?Q?BDHpr733Ses7/dwEiaAS43PVFLK/mHQlssQFNCMw4AvHjkzNi1Mt8dj4/6TZ?=
 =?us-ascii?Q?IWoX+YaKKlkV2l2JwZYLOn8LlFcvgQjhqWL+WWBBlSpdtIRHV4rN25ZfG6pY?=
 =?us-ascii?Q?Q5pCvhQb7G5UdN4SSSpGBGRgHkQfALclz6I8avIffXdrcB0BYFWtHfN+EHOU?=
 =?us-ascii?Q?LdpR4MBaMx5l+cJ9HqY2ofZ2MYwZECW443tsxo3S0XLSoKduQdxUdrizi646?=
 =?us-ascii?Q?zCuqUFpjArcUdwyKqtlcY98GZ0fphjyotKCFd0+ZX2Fv23ZVfhIfwNue0tVL?=
 =?us-ascii?Q?+vxbcFHJ6CimrkQfHy5+VsEtvaNzVqxcYcRcVxcukVjGD1FYLRcAKaMWzTI+?=
 =?us-ascii?Q?9vspyOAoQTGyZ9YfmmAKPl5OTfXf6lI6bt1JrkVn0eDXSpJjNJe5+O0AnlpX?=
 =?us-ascii?Q?VH6QDwQXWpNcZkjJ1xrbogHASglL2ucpEwifPbswu5yUfVcFkTjU1zaQGWov?=
 =?us-ascii?Q?JADeXIPVjX9r+nA8fnKIqvJyEirEMIpsk3xN/j8ZAAUmsumO+K7eXltmNQhi?=
 =?us-ascii?Q?N3gnih9dpi8tcNjuv749h/YmxiTR1Six8KtUI/+/wN5fO9sji9jy5ll1niaX?=
 =?us-ascii?Q?eDs3LrJtRHP0enCEnnzfLlT9nLNIIwkCnZvpSA9yk72zNVqSJ4PpU0zJDnzS?=
 =?us-ascii?Q?NS9ODyqe0QyB6xsBvzTWXqZXBwyaDNEmKxXn1EYjl1Iu/7oOmkWfk69fFO4E?=
 =?us-ascii?Q?MKT1En+A4qIAkRlEBs2dZ1F8Ux7o405cYqJAYCLs6kFvaReb3fFWwfASRP3F?=
 =?us-ascii?Q?v9asSjxtOctcSXsVHW5y5BCllifTxUcQarIPf8ylCwVkMp8849RZ7T5z9jvW?=
 =?us-ascii?Q?joZ8VXMRBqviE9e0s5j9CnBgHk5yEnrQRI7QSYLBMNXpKjEifLk5ofo6Ht9U?=
 =?us-ascii?Q?0LAC2vj/OI7YLiV46LdbPqnNWpoFyupmkSDak4OAKI42t6uT4QQaTMl2KAWr?=
 =?us-ascii?Q?osCINj2jk54kPjqxnpUgBfNk6V2Up6875245bu/yb3p7/b0uetX0o8h6haaX?=
 =?us-ascii?Q?rgryGm8dM/ax7Spei39ndGAbT5Tijc4lCq6D+tLaJsXvbyn1sQJr8GxQHv+W?=
 =?us-ascii?Q?3yeIdh9jlPJzr8ta3KVa+wRRbrI9hPSX7OuUAHatcg4orpIAiI5quvqWWUwa?=
 =?us-ascii?Q?+AeHBoICSwHjeb02aPPnx3N2XqSPcCTuyZXecYMZgEtEWn2Df4U7BFjQ4tDf?=
 =?us-ascii?Q?zzTIhGpFqkb9v5cv1OB4HfIniNhXGK3bgsgxtOSnQ9XucCBtrLCjrInapUK4?=
 =?us-ascii?Q?w4lACZG92J6GvFdf6id+BQbYxdR9vtg5/sb6Pe6IY/96hWPaNFfpbcT0O/M8?=
 =?us-ascii?Q?PiW/009soLrpG3OeJ5HrxjyMvLOgHUzTSmdSurmwnBfLQJ2z22HQHgI2hRCt?=
 =?us-ascii?Q?5V2mh8DRx6ptWS/JS9ypv2L1E+lRFYTBO9u8Yunm?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbfd678e-4f62-4000-a676-08dafaebf0ef
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2023 13:40:49.4729 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EmAQt5s2l/zxaNKLCip/goliOWp3dyOpbVMc58XMMT+NjO1dYBgWke/Mc/XPwip+2BFXUpUs/xLxtN9k7CTyBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5127
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
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
 [40.107.255.129 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.129 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pIrdh-00AF7t-Je
Subject: [f2fs-dev] [PATCH 1/4] f2fs: fix to set ipu policy
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

commit bdc48fa11e46 ("checkpatch/coding-style: deprecate 80-column
warning") increased the limit to 100 columns. BTW modify some unnecessary
newlines.

Fixes: 84b89e5d943d ("f2fs: add auto tuning for small devices")
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/segment.h |  2 ++
 fs/f2fs/super.c   | 20 +++++++++-----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index ad6a9c19f46a..0b0eb8f03cba 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -670,6 +670,8 @@ static inline int utilization(struct f2fs_sb_info *sbi)
 
 #define SMALL_VOLUME_SEGMENTS	(16 * 512)	/* 16GB */
 
+#define F2FS_IPU_DISABLE	0
+
 enum {
 	F2FS_IPU_FORCE,
 	F2FS_IPU_SSR,
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index d8a65645ee48..ebc76683f05d 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2272,6 +2272,9 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	if (err)
 		goto restore_opts;
 
+	if (F2FS_OPTION(sbi).fs_mode == FS_MODE_LFS)
+		SM_I(sbi)->ipu_policy = F2FS_IPU_DISABLE;
+
 	/*
 	 * Previous and new state of filesystem is RO,
 	 * so skip checking GC and FLUSH_MERGE conditions.
@@ -4080,10 +4083,9 @@ static void f2fs_tuning_parameters(struct f2fs_sb_info *sbi)
 	/* adjust parameters according to the volume size */
 	if (MAIN_SEGS(sbi) <= SMALL_VOLUME_SEGMENTS) {
 		if (f2fs_block_unit_discard(sbi))
-			SM_I(sbi)->dcc_info->discard_granularity =
-						MIN_DISCARD_GRANULARITY;
-		SM_I(sbi)->ipu_policy = BIT(F2FS_IPU_FORCE) |
-					BIT(F2FS_IPU_HONOR_OPU_WRITE);
+			SM_I(sbi)->dcc_info->discard_granularity = MIN_DISCARD_GRANULARITY;
+		if (F2FS_OPTION(sbi).fs_mode != FS_MODE_LFS)
+			SM_I(sbi)->ipu_policy = BIT(F2FS_IPU_FORCE) | BIT(F2FS_IPU_HONOR_OPU_WRITE);
 	}
 
 	sbi->readdir_ra = true;
@@ -4310,9 +4312,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 			test_opt(sbi, MERGE_CHECKPOINT)) {
 		err = f2fs_start_ckpt_thread(sbi);
 		if (err) {
-			f2fs_err(sbi,
-			    "Failed to start F2FS issue_checkpoint_thread (%d)",
-			    err);
+			f2fs_err(sbi, "Failed to start F2FS issue_checkpoint_thread (%d)", err);
 			goto stop_ckpt_thread;
 		}
 	}
@@ -4320,14 +4320,12 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	/* setup f2fs internal modules */
 	err = f2fs_build_segment_manager(sbi);
 	if (err) {
-		f2fs_err(sbi, "Failed to initialize F2FS segment manager (%d)",
-			 err);
+		f2fs_err(sbi, "Failed to initialize F2FS segment manager (%d)", err);
 		goto free_sm;
 	}
 	err = f2fs_build_node_manager(sbi);
 	if (err) {
-		f2fs_err(sbi, "Failed to initialize F2FS node manager (%d)",
-			 err);
+		f2fs_err(sbi, "Failed to initialize F2FS node manager (%d)", err);
 		goto free_nm;
 	}
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
