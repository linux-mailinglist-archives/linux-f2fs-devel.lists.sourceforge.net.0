Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2EB6DFBD4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Apr 2023 18:51:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmdgq-0008M7-67;
	Wed, 12 Apr 2023 16:51:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pmdgl-0008Lu-Tt
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Apr 2023 16:51:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FL+LbCGGjp8MMmdGe9YyZXu7AuucvY9NlfJmsFbLo0w=; b=DCXPsiI2ag0LrHw7sCz1pZui+g
 FJwVqyTrX4z8/jEdQZiYun4WlAtH0V6B+3nbrzq6XNNorgFAf7sKzF0ahC1Wr2O1K4iXT/PfOPmYY
 Aar0JjWpPAmITki8/AHWwX++In+1yXS8FIfKZUgwgeXe45/5eAdFM+S0kKXSITf0tirU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FL+LbCGGjp8MMmdGe9YyZXu7AuucvY9NlfJmsFbLo0w=; b=m
 Fx6F3uhnULqaT/6g9UsJGWqhzxTevNXb55uscZx6jV44F62qyMrxZ3eF/XjR4BlwoCgpo9JlFxBGP
 /ExDxCzfztLd9MIyHRQkZ1qnkOqvjFUTNww10SdM4IxHd2wS2LrcgHkgs5yFoxK2F9xL513EyfBR/
 AUm31Hl3r4jxtCFQ=;
Received: from mail-psaapc01on2103.outbound.protection.outlook.com
 ([40.107.255.103] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pmdgi-0001N8-GL for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Apr 2023 16:51:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cF57v1l4pL5Xjdj7KIKaRby+sz+RZuu4382pAISh6pF20CGy4j7/vg0jO1wCBz2cXxqtyHB0+pXUl5MvNAPNq6vBqV5b+wDLEFtaUXEXJySVgy6b8MGzg7QcvQXUKUHvYs4ZBURcc9rzsSHF6UZZOdpsy7qqgm94CzQyh/zoeZ0XLs/nDNUmUqt7Iq8Cpte4zve5Gn5lBN9U6VlOKa+rafKQIDFZ7bsavL6cSa9MIrJv3w4fR2sNEmSPI9bI93xMYn/n8EzCuWa9YBWmzXCExi32wA8gix3Q+VDEJtRNaJ+aLaNP4LWcjEHMsVhTwTj8T773QjSrbYlitmiJVZPAyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FL+LbCGGjp8MMmdGe9YyZXu7AuucvY9NlfJmsFbLo0w=;
 b=QEhRkODbxOOYf4HtD481uJr3u2dtUOeAgNeNR42jFXKHVYUetDlEP3FMT7o83WhU/d8LPmnYtzrSk++gkVP8JO+TxmBWRjHorEZLLHzpT/JEvKk4g0uOlSkyYE2K5m3pRczgpU1ITrc1C0VDNP7LbwO+ZRSY5g75EYt/XhLH6F3a5eN+QXp1F7ah/tSeym1+zDwdLUkucrfUZAGy/n1MLvrn3VuFLFsEBONW0hGV2VuJSxrmdmYfJuPiHDn7rNA9nUcz53Njle6Aw1gWSgcWgbc1X7hchk4WDJ0lFJztMP1k/cTPwHCCeiHzBAo2mIe0+oc0zpz4HdH3qU7xZtE3HQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FL+LbCGGjp8MMmdGe9YyZXu7AuucvY9NlfJmsFbLo0w=;
 b=AB2nUx6NHgk/fv1LuIaMYekDkjCZpMy8/fXVE2wTQsmlgHaUfbsunXPcCp063fzOWSfS9z30Nsxo3+1N3qCFLjqUP8rnGdqeGWY7Q6UxLJzZxDlaK3nTB88g13oBMxnHN+DTPZYDwB23eErJO7/paCW/pC2f2cjCTi5q9JTOLCS88tC+RvHJyCRbY9tSdjg2LiBoKGzkjtP8ovpFYOaTH++VCWk+uuls9XhCO8asoCjnXwg6C4klK7VsWBmGX9CNY6ise+kBAf30Z9OXmbZp9II4CwgJPfSd6lktn+sJ4eClXUOgCeCYGQWn4ZTMLyEZMKH0H6iLLu4PUzD7rw5nlw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PUZPR06MB5771.apcprd06.prod.outlook.com (2603:1096:301:f1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.38; Wed, 12 Apr
 2023 16:51:06 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c%6]) with mapi id 15.20.6277.038; Wed, 12 Apr 2023
 16:51:06 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu, 13 Apr 2023 00:50:54 +0800
Message-Id: <20230412165055.38461-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SGAP274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::27)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PUZPR06MB5771:EE_
X-MS-Office365-Filtering-Correlation-Id: de13047f-3710-4151-afea-08db3b761baf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u2oRYqEYEsrKCZtc36el7IH9vHA8WXfYkad1W5H13R4Xc4XwwPr5Mt4sD3yr+ZCtBzERSVYJPP7BsRknxPl2MmFnG2RvRN2Fo4hwKHg+8LVmK+eFiVr+2l2USQWlcfVB0rXRxq7vRr0hCJJDLD7JdosRwCs765aUc8kSc7Tn0iEwVN3FlPvZ+pD7fYmv2P4gSh8jLVzhuzlczIZvB5HCSWziZskqWa1hoGp7Acwyija/tq4JEvCm5NETxIEig/9llYW5atYRZXW2MFeiP4A4lyee1oap/qKy5fiKcEofVqGN/NcyvB08/CjfzBcck0gwWXE6JATOG56HGddaRudKkPWS1rDsAHJZY1Ac8FKUw4u0d6aMLXaLr/aqMLjzeXYLrBagnEA+0dLrQWNr0FIVbujlMIFGwQtDEbwHQsVpfIjhdrDCt3WQwYCPJ6Hq8cZwtmy6wzdygJ9CSguY0/mgDwCXczFy4Iq0Pcu1sze4xjkNldRP3HmqvlFem2UHX/JyHh15b28wNUPJc/Z0IrXRaFBqM98N5g+c07g5ps3a/tQzszoP3vNjDanzrYDVlb4e0RGaPgrj4J3d031VCSPTVmcUHXj0NI6BiiKLmkNATkertb9zpwQs6Q8zafyWPkNM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(346002)(376002)(136003)(396003)(451199021)(8936002)(38100700002)(8676002)(38350700002)(19627235002)(66556008)(41300700001)(66476007)(66946007)(4326008)(83380400001)(2616005)(6666004)(52116002)(1076003)(86362001)(6512007)(26005)(36756003)(6506007)(2906002)(6486002)(110136005)(186003)(316002)(478600001)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+BEea2HrJCkHMccSgIVA2NX3Ifz8Iq+dHC8eKCBFDqN7hupRjfWHNq1/TrHp?=
 =?us-ascii?Q?Md5VvGlLSrZ1gfy8uu0ujGmyH8u6+8LQqwAhNJTApRKHTc+yJSD+YUz+Xx9y?=
 =?us-ascii?Q?9wXEjE1BPw7yYRgZi0UAZEePUM8w6daLbp2aNbV8dxjSccBoFKY2J5I3rdXI?=
 =?us-ascii?Q?O2XSKifgX5LVOZe6CbAONg1Mxar4wk/DwDBTAoFBCV5Gqd6RkjrsNFkXosJD?=
 =?us-ascii?Q?68DOPfJhaHbfKeptKteO/HjN3gl4+lfCfNzN/M1uBm3FUv5lOeUHdteaKD2v?=
 =?us-ascii?Q?NWh/MvtUE0LjdEF1yS62/tDkJCLF4tTRY7h7V1WLx+3ZarEscxCyxYgVeEth?=
 =?us-ascii?Q?lqYUfW5Qid9mIr4M0LnSEIQfIsPIRrNzrtTWPOszogL2a5VmdCvTYlnUmqZH?=
 =?us-ascii?Q?WFbmusTfS6neOK6v8+4HXFnyjGoerdkRyPF6A7u3sAdvYJ0yzuvwT9ccF5Am?=
 =?us-ascii?Q?1Q8uPGau4dUU5qK5mnU0VD1YtMpph/CMhETCxPH2WW00WdDq44kEEkJEWzR/?=
 =?us-ascii?Q?O+Pt3AAKoCgNjZd3PtfUbSYlhyP2TC8IXdr9t1yGq/8+yZ3p9W376lBTuRu3?=
 =?us-ascii?Q?iRQYF42EM+qOAmCBEj2ZqkhI6ERX6p4W9056sBTbVCacblM7vv7BVd43aowo?=
 =?us-ascii?Q?yKl5C1U8E0dccSOHtjKBplZY73e1L9ZLKo2W3eGXHAMGdU4DBB/uLLsv7mX8?=
 =?us-ascii?Q?9z9m7pVWiv8MVELrnOaL87PAB7u1X/wl6QeMsAi/VljMui+iuDcseb36zOBd?=
 =?us-ascii?Q?xtEJ9GCErXxxu/8DjO1P5WtzmQteiWcWXkvICNvZhIOM5fUQ/I4nJil0+9CK?=
 =?us-ascii?Q?o3q1vrdjiyxqeNgEV8bdvQ41zjf3ah0ep5zGV877bUEdZ6n1ef7cqedaYlZI?=
 =?us-ascii?Q?2TssuvYN/Grqs/0H4PN6CB6KNg3rY4H0/mfMtoJe6XKoAlYVTWjwk9gYfAfV?=
 =?us-ascii?Q?biu5UkJqbY/J2JXzbjgh6an2PV2SmhfwBkoSo7AmYY9BbVy4H6qtC7CvYFgm?=
 =?us-ascii?Q?VpbPOE9VerQtQ7lhF4//AsJ6uwLgfT70PXbfLnB+H/z7X2h4h9p3/QOTT+Ha?=
 =?us-ascii?Q?mz05kKL5yUSnVfhp3ecrE073usxAlzwYA4hVUoG1DK6Aem7pthNuoV6L7aIc?=
 =?us-ascii?Q?HpHdNVbOBOjL6mj5E0f4wh/ZAy6jQBc1rVr51YXb0aObpig1Gtd4IM+yDIun?=
 =?us-ascii?Q?B1FVqubcM9oYab5N66ABwuEa8FJgdficZlEneGvetIRHDpLBBGuZtxYixNrA?=
 =?us-ascii?Q?eDBah1qfRUL159X57fjadrEZeFWDC+13k+4UvZNhPVj4r8X8eOXfegdxx9LZ?=
 =?us-ascii?Q?lx7WoBVBlN2xmFoSVB/vYnkjYoRdHxW+vN3kGxcGhk+NEZuIs8jtIMYIgH21?=
 =?us-ascii?Q?c4iE81XxxVQMFAl45aelaxoMbRK8P2/IV6WRR/rUP1t1mE1bYZMm5rjh0KK3?=
 =?us-ascii?Q?gMdW/RY7+LGPMH4bK6IlZ9AvqJiz565t84je6dbg7D3AvNiWqGJoEehtxyfl?=
 =?us-ascii?Q?nCcFA600bJHT4jQOuzuV4mL0YrvuwxIq4IwJIdsP1gsW9a743uqeSvcY3OwF?=
 =?us-ascii?Q?H+69UhwWZT1OAy0cRm/X3RVOXm9eywSibiGWM+Kr?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de13047f-3710-4151-afea-08db3b761baf
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Apr 2023 16:51:06.1464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GLJzbDSOYjedOE2vgLgiIWRC6W0o5j9bK9xLfg9a1vlsgG0fZk9GK8englKvnVyP1JjZ3GYX/oaxoedngzxiEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5771
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch exports gc_mode to debugfs. Since gc_urgent and
 gc_idle nodes can get gc mode, so remove gc_mode node. Signed-off-by: Yangtao
 Li <frank.li@vivo.com> --- Documentation/ABI/testing/sysfs-fs-f2fs | 6 ------
 fs/f2fs/debug.c | 13 ++++++++++++- fs/f2fs/sysfs.c | 18 3 files changed,
 12 inse [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.103 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.103 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pmdgi-0001N8-GL
Subject: [f2fs-dev] [PATCH] f2fs: export gc_mode in debugfs
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch exports gc_mode to debugfs. Since gc_urgent and gc_idle
nodes can get gc mode, so remove gc_mode node.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  6 ------
 fs/f2fs/debug.c                         | 13 ++++++++++++-
 fs/f2fs/sysfs.c                         | 18 ------------------
 3 files changed, 12 insertions(+), 25 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 8140fc98f5ae..3b78b8324263 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -643,12 +643,6 @@ Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	Show the accumulated total revoked atomic write block count after boot.
 		If you write "0" here, you can initialize to "0".
 
-What:		/sys/fs/f2fs/<disk>/gc_mode
-Date:		October 2022
-Contact:	"Yangtao Li" <frank.li@vivo.com>
-Description:	Show the current gc_mode as a string.
-		This is a read-only entry.
-
 What:		/sys/fs/f2fs/<disk>/discard_urgent_util
 Date:		November 2022
 Contact:	"Yangtao Li" <frank.li@vivo.com>
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 61c35b59126e..5172b2417c08 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -366,6 +366,16 @@ static const char *ipu_mode_names[F2FS_IPU_MAX] = {
 	[F2FS_IPU_HONOR_OPU_WRITE]	= "HONOR_OPU_WRITE",
 };
 
+static const char *gc_mode_names[MAX_GC_MODE] = {
+	[GC_NORMAL]		= "GC_NORMAL",
+	[GC_IDLE_CB]		= "GC_IDLE_CB",
+	[GC_IDLE_GREEDY]	= "GC_IDLE_GREEDY",
+	[GC_IDLE_AT]		= "GC_IDLE_AT",
+	[GC_URGENT_HIGH]	= "GC_URGENT_HIGH",
+	[GC_URGENT_LOW]		= "GC_URGENT_LOW",
+	[GC_URGENT_MID]		= "GC_URGENT_MID",
+};
+
 static int stat_show(struct seq_file *s, void *v)
 {
 	struct f2fs_stat_info *si;
@@ -409,7 +419,8 @@ static int stat_show(struct seq_file *s, void *v)
 			for_each_set_bit(j, &policy, F2FS_IPU_MAX)
 				seq_printf(s, " %s", ipu_mode_names[j]);
 		}
-		seq_puts(s, " ]\n\n");
+		seq_puts(s, " ]\n");
+		seq_printf(s, "  - GC: [ %s ]\n\n", gc_mode_names[sbi->gc_mode]);
 
 		if (test_opt(sbi, DISCARD))
 			seq_printf(s, "Utilization: %u%% (%u valid blocks, %u discard blocks)\n",
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 4d6263e556fa..c2873a94f7b2 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -41,16 +41,6 @@ enum {
 	ATGC_INFO,	/* struct atgc_management */
 };
 
-static const char *gc_mode_names[MAX_GC_MODE] = {
-	"GC_NORMAL",
-	"GC_IDLE_CB",
-	"GC_IDLE_GREEDY",
-	"GC_IDLE_AT",
-	"GC_URGENT_HIGH",
-	"GC_URGENT_LOW",
-	"GC_URGENT_MID"
-};
-
 struct f2fs_attr {
 	struct attribute attr;
 	ssize_t (*show)(struct f2fs_attr *a, struct f2fs_sb_info *sbi, char *buf);
@@ -143,12 +133,6 @@ static ssize_t pending_discard_show(struct f2fs_attr *a,
 				&SM_I(sbi)->dcc_info->discard_cmd_cnt));
 }
 
-static ssize_t gc_mode_show(struct f2fs_attr *a,
-		struct f2fs_sb_info *sbi, char *buf)
-{
-	return sysfs_emit(buf, "%s\n", gc_mode_names[sbi->gc_mode]);
-}
-
 static ssize_t features_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
@@ -916,7 +900,6 @@ F2FS_GENERAL_RO_ATTR(encoding);
 F2FS_GENERAL_RO_ATTR(mounted_time_sec);
 F2FS_GENERAL_RO_ATTR(main_blkaddr);
 F2FS_GENERAL_RO_ATTR(pending_discard);
-F2FS_GENERAL_RO_ATTR(gc_mode);
 #ifdef CONFIG_F2FS_STAT_FS
 F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_foreground_calls, cp_count);
 F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_background_calls, bg_cp_count);
@@ -1008,7 +991,6 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(discard_granularity),
 	ATTR_LIST(max_ordered_discard),
 	ATTR_LIST(pending_discard),
-	ATTR_LIST(gc_mode),
 	ATTR_LIST(ipu_policy),
 	ATTR_LIST(min_ipu_util),
 	ATTR_LIST(min_fsync_blocks),
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
