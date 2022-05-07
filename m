Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 327ED51E586
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  7 May 2022 10:17:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nnFdD-0004md-IG; Sat, 07 May 2022 08:17:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1nnFdC-0004mB-8L
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 May 2022 08:17:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0i1kXHCjpeYynm50OaEH6ejTmVu3smY/oQRBE4MveiU=; b=giawOLoGUJhHHIf3FijnYXV5dK
 FcH8ZIe/HamwZamA/tlTNyZqLFmCfWvWJ+IasaPPcoL7KpJiws3XBNjUOSi/pIZCqaIXljDumMN6j
 wPW2q6LabqV+xgMSYHKwzLtCSmft6vyjGLtJxeRpYlP16nbkBGxH4ppM1IXK8psmEaKE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0i1kXHCjpeYynm50OaEH6ejTmVu3smY/oQRBE4MveiU=; b=M1nc9XWU3JYADpYgpAoRDziMZR
 h5/qrFiU/hnZn2i5u5fddF7C5a9zJ4Nm8lXRJ/JfuDG7Jz22Uq7msMWvxFP5z0EpaSc/t/fSDwpsm
 N76OaIFmpHTEyhS3NwCL4Jh0ZVZncFKGIAxE8+bgpu2DYBx8LZxJ5FG2nJyEc+UqoN74=;
Received: from mail-psaapc01on2131.outbound.protection.outlook.com
 ([40.107.255.131] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nnFdA-0003r9-VC
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 07 May 2022 08:17:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxd67/Mp+r7cU5rWpi+K4VUEHr8sJvTpjqvdnN8aylxGgwirWM9sBshwBxoJrTGoN2EarxrUGU+HmVhfvuTLZfnv2Da5BbpOzYAJSCpQbwARRriXtFRT8dPmBiqWMym395Y2V4EhdFbTsKZkEIcXIwLkY+h4afzFkHAV35XPC1nR9TSg0JlB7ppRVdBvKGzQ0eH1m9eHZh7qvzvG/9Ofn3UpCc2UlCn9SlAuFKIIjfUlU9C4gdg5j2Htjq1uPU0Y2zVnK0SEJwqN/0YeQPUZN78ticLbklmlfGu1XnSscEOPxC1g1Wd9PdiTfdmSUQmC3ZbOcaXVCfdJex0fINbaZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0i1kXHCjpeYynm50OaEH6ejTmVu3smY/oQRBE4MveiU=;
 b=Nd2NWgFS5U3Ke70BET4jCMMZDPWA4ueGnr8JNCLTvf7/bZ9wLbyya4uWh2hC9tU7Ski5M/e/26p4eVhOUkEm7oF7mF2s2Lxfd0f3IGRR5mlCJYhfWv9OxOd9RriwpjCW6CkF18n9u7qHFZWwvOZzMJq747X0wuoEvmo0fw2rDUFT7w5e+id1TWK1tASI+aLjFwBD53ox9AjspGni1dfNM7sbnW5zxbrz4wMJwvUoeBIcOuSIcBoJxwBa7GfH7/CIf69dzJKlXOgLiS9heyX6p+c7znWQ0p/RE0hy+hoB7lmsZBXeqS/pCkKcFCOqnCC1fJBsDZBDEAOpzKcn1czCwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0i1kXHCjpeYynm50OaEH6ejTmVu3smY/oQRBE4MveiU=;
 b=TfLsnxC3ZybndSZwGdiyeXzJPkN2rnOBwSIp+T/fK4onWk5MWqu9LkmxKzL8TesTu8xSlEZZ9r9jC004x2fJiKBDdr+FSY69a54KUhl+Nxu3/BxQT/CLF8fK7hdNPW5xqdhxYLnBCo55S3YByho+WcBZlF6TxthXNH4CbHRAwBg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by PS2PR06MB2917.apcprd06.prod.outlook.com (2603:1096:300:52::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.20; Sat, 7 May
 2022 08:17:24 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fc26:a0b5:8bfd:7c02]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fc26:a0b5:8bfd:7c02%7]) with mapi id 15.20.5227.021; Sat, 7 May 2022
 08:17:24 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat,  7 May 2022 16:17:10 +0800
Message-Id: <20220507081710.117162-4-changfengnan@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220507081710.117162-1-changfengnan@vivo.com>
References: <20220507081710.117162-1-changfengnan@vivo.com>
X-ClientProxiedBy: SI2PR02CA0021.apcprd02.prod.outlook.com
 (2603:1096:4:195::10) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 140fc475-b9a4-49e7-79f0-08da300203be
X-MS-TrafficTypeDiagnostic: PS2PR06MB2917:EE_
X-Microsoft-Antispam-PRVS: <PS2PR06MB2917B012D8F48A8FD7F7504BBBC49@PS2PR06MB2917.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eJqRLvCxue1tvY38i/0D+igIDnlHtd7z6NWqBjo3QTVwF9kl6Fb5+NPUBsgCqIe3plnuyMH0kjkDBpzt3ds1/m9t+DJaLHT/1tqWi1yNI0PoyOs11trxoVSmF0Br+SAVjNvDxLEmQ9aDbsTzUnmAEqk8nnZuavfNXwUlCupMHpW8Ggs9CPH51DdjoaWCv9Y5ByUYNOtCvJRCRXrvxfkHEKg6RG7bCZjAr3/s9vIfaEDuJtCgyar3PluawR1yoN63W//IAwq4Htq8XHJsa15MW5pkqSLnBA3+nru5HMEFSNUBfLCTmT+lyeQf34ptcc8H9Xwu7Pbf9+/o1TAIuNtOWy+XaWy1K4u7aImyLrKxRUtdlL1CJ1g1XUV/0nCLCnuz2KdFPbJIBc+7xfKlqjDu2dJR/Ok/PdVjY7hsdMdYhN5Lg489ZNC2eEfejFFZivS3n5tmX7fTRr3vgW1O3MN53dmsBzYasndHHd+gEDH4/Nie7SqnPMMw32Hx7SSUuA+hVEIgtfOQew02CAC/IVS8cY1MmSnenzfzSeV9jeEwqvflbm+NG23dHVUyEJ/WpuWArTy5sPsi7SYJWWdEbLpTIPcGY0malvAwfU2WnFBeXHu3M1V8NddBo7D2lJvw5UhCDsWiclz+9jwku6IqkfH5bMw9XtgaK90drCfEUyuCIADZcPFGzJHx/1n9b90PdEIUEFvhNbCCoanbyFajJYSrgg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(52116002)(6486002)(107886003)(83380400001)(66946007)(1076003)(8676002)(66556008)(508600001)(4326008)(8936002)(66476007)(6506007)(186003)(316002)(36756003)(38100700002)(38350700002)(2616005)(6666004)(5660300002)(2906002)(26005)(6512007)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LsKg0NPJ9elFW3bJQZ3GtCmvAHZiSTh0QrS9tmg2oWH3OA5BdjNkV5OuzZ5E?=
 =?us-ascii?Q?R3vJqp8ucGUqJ/w82IKm4l9Lyp9MLc+XTAqyktYxmftQ4B6z8Ff9aMOKmJ/6?=
 =?us-ascii?Q?42ZeyNUBvHNOxOsGqgqhggpCXCcvqJED4w634jZhN8lIAv/zQdeW4N/I/FUe?=
 =?us-ascii?Q?zAJPkSgi0WsXFmXA6VHuNFT0h0YjPzR9IibSg/q2yyjNl0cvlB+w62+TfxIg?=
 =?us-ascii?Q?dRbq+P0ZwBMlbEWLIAnp5Qms9MDTB8qkXVZ4xPk2BMdXi1FQS0lvWqKwUq/X?=
 =?us-ascii?Q?NOhHrV0OZg6HRlToj3PnNFmA0T+euVg6c+ML5nYvBMGDR88jtXwpLhNn5Ply?=
 =?us-ascii?Q?VSH/rptVIAsMMaXgH8Z0Sw0S6q0Kne+vNUfa5XdFy14hS/oQFcC2+kEzKr8L?=
 =?us-ascii?Q?pz+fyDD/Wc5PtjpNekrHkeQgl3seVpFcHYUEzvbjXGNKfYH+2P6yezhrp4Ig?=
 =?us-ascii?Q?6zGFVT9x9XNg/5FjIQAzVld8+4Ab/kq8hkL3GCF0mvwa4ILyPv/1VE3OZeIi?=
 =?us-ascii?Q?AF40h1Gb3Df48GKWCr2Trr8D73siLnco0oNA0gsBnphxt1uo+RRHELn/wbBr?=
 =?us-ascii?Q?zlKD/sBGPiFnPaGTVSlxZ/aBeafGmUKDs3sDJG8bvbSGJ3A/OBwywgjI6ReR?=
 =?us-ascii?Q?+W3ysPG93kNsaRI66FHmO+I44JJvB2fu+OYgzFwj4JJ1b+wvrSCE1yd6Ump1?=
 =?us-ascii?Q?6J6gmQg6zHx3lNhgo89nITx/f/vP9xsfSVWPHUPmgSPQQkyImJzb7LRDrqUE?=
 =?us-ascii?Q?b1GDh0ZbWl1PZfcMHoUhs1Xip//dgEo72vnP18Soy4XavQO7+XEs7l1Fl3xu?=
 =?us-ascii?Q?+ag6I3/onv1Iplxahr5yof+Ptz115joRYf718MWW7DIr8HEeM9ow/6G3aRL3?=
 =?us-ascii?Q?HuXLzpgbIdb3LdWjc9PxLa8OiHF3+fq7Nv/JQeN9o6Bvc9vNXc9x+OGFFOqQ?=
 =?us-ascii?Q?a3oAll1L/KHTc9bM7ZI1C9BpCO+cfgMsuj3o4xySh0S2aK0D71WEwoqYikJe?=
 =?us-ascii?Q?GSzmztacUSNgbrLQMxNt7GeyyyBPRZ9oCJ6ceqiPs9QD24ZtN2N6r71JjAnv?=
 =?us-ascii?Q?wggvpi2U+2w3WicdjmlT2MiQSBjqXihik9DMAkDcHqjFrnvMmoSHfasfDNuV?=
 =?us-ascii?Q?aOBIGbNeyvHtrAiqjIvjbK8+8guBEQlG5RUDdZK0gmn7OUjX4RcPbDGtLY3a?=
 =?us-ascii?Q?VT08W/K5JQwARfyZvw4eI5nLeMew2pGhv5KAFIBAypHSckXd3H431m3rPVjc?=
 =?us-ascii?Q?3aI0wY1UhS5nQPgMN0luXo798UiUlLwXfklU9IdKnJYA4LjATrpyWByMv3dy?=
 =?us-ascii?Q?GGqCfG9jIIeOoaCPNjvN0069zuyt5W4FF//o7sFGxIsuPDO1xk5OmQUS2aeZ?=
 =?us-ascii?Q?rEhqFW4d54NOXZiOax1qhCgBg04wgclFpgcHZYggCh2UQ7alJayBzdjE/TIP?=
 =?us-ascii?Q?3CFWvy+79cYgqLMhx/VatN7XDHjcGRYZzSOxQM7qIllrAsyv82lB4eDXphq2?=
 =?us-ascii?Q?bQuO9Qk+lq8By8wBYP72HSi9YyjcXHMCV1J659gnFSBt09Yal5UEh5qbBia2?=
 =?us-ascii?Q?VGbm73aOaC+2KG5nFk6f76rvjtpZ/dJu1OH9iS97yG8+il0/4AW4zodyEdqH?=
 =?us-ascii?Q?a2Ub5FePQ47dMzUgzQ9rkUuZ6HQsOpXcRyuW4FJHgILyfdPG0yUUsQYjGK8h?=
 =?us-ascii?Q?o1Z17jyMhoRpg+uEBD6XTzBOZelEDazl+KSiD9O6BqXP0mOzJ4OB/JPyyuYn?=
 =?us-ascii?Q?VkPiCS1sXw=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 140fc475-b9a4-49e7-79f0-08da300203be
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 May 2022 08:17:23.8791 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r7if4xQtL5tDh+wccpyqfV07cCzHcB90JvZz0NeXdcgKWRx5pIyuyfid5Ye0SN6qgjnq4TVWzJjuRQrYnb+yKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PS2PR06MB2917
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Try to support compressed file write and amplifiction
 accounting.
 Signed-off-by: Fengnan Chang <changfengnan@vivo.com> --- fs/f2fs/data.c |
 19 +++++++++++++++---- fs/f2fs/debug.c | 7 +++++-- fs/f2fs/f2fs.h | 34
 ++++++++++++++++++++++++++++++++++ 3 files changed, 54 [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.131 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.131 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nnFdA-0003r9-VC
Subject: [f2fs-dev] [PATCH v2 3/3] f2fs: support compressed file write/read
 amplifiction
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

Try to support compressed file write and amplifiction accounting.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/data.c  | 19 +++++++++++++++----
 fs/f2fs/debug.c |  7 +++++--
 fs/f2fs/f2fs.h  | 34 ++++++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 0ae7819b085d..98c3d05cae1d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2234,6 +2234,11 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		*last_block_in_bio = blkaddr;
 	}
 
+	if (cc->nr_cpages > cc->nr_rpages)
+		f2fs_i_compr_ra_blocks_update(inode, cc->nr_cpages - cc->nr_rpages, true);
+	else
+		f2fs_i_compr_ra_blocks_update(inode, cc->nr_rpages - cc->nr_cpages, false);
+
 	if (from_dnode)
 		f2fs_put_dnode(&dn);
 
@@ -2900,11 +2905,11 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 	int range_whole = 0;
 	xa_mark_t tag;
 	int nwritten = 0;
-	int submitted = 0;
+	int submitted = 0, raw_dirty_pages = 0;
 	int i;
 
-	if (get_dirty_pages(mapping->host) <=
-				SM_I(F2FS_M_SB(mapping))->min_hot_blocks)
+	raw_dirty_pages = get_dirty_pages(mapping->host);
+	if (raw_dirty_pages <= SM_I(F2FS_M_SB(mapping))->min_hot_blocks)
 		set_inode_flag(mapping->host, FI_HOT_DATA);
 	else
 		clear_inode_flag(mapping->host, FI_HOT_DATA);
@@ -3039,7 +3044,6 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 #endif
 			nwritten += submitted;
 			wbc->nr_to_write -= submitted;
-
 			if (unlikely(ret)) {
 				/*
 				 * keep nr_to_write, since vfs uses this to
@@ -3105,6 +3109,12 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 	if (bio)
 		f2fs_submit_merged_ipu_write(sbi, &bio, NULL);
 
+	if (f2fs_compressed_file(inode)) {
+		if (nwritten > raw_dirty_pages)
+			f2fs_i_compr_wa_blocks_update(inode, nwritten - raw_dirty_pages, true);
+		else
+			f2fs_i_compr_wa_blocks_update(inode, raw_dirty_pages - nwritten, false);
+	}
 	return ret;
 }
 
@@ -3369,6 +3379,7 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 			err = ret;
 			goto fail;
 		} else if (ret) {
+			f2fs_i_compr_wa_blocks_update(inode, ret - 1, true);
 			return 0;
 		}
 	}
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index fcdf253cd211..32d06990b1a6 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -139,6 +139,8 @@ static void update_general_status(struct f2fs_sb_info *sbi)
 	si->inline_dir = atomic_read(&sbi->inline_dir);
 	si->compr_inode = atomic_read(&sbi->compr_inode);
 	si->compr_blocks = atomic64_read(&sbi->compr_blocks);
+	si->compr_wa_blocks = atomic64_read(&sbi->compr_wa_blocks);
+	si->compr_ra_blocks = atomic64_read(&sbi->compr_ra_blocks);
 	si->append = sbi->im[APPEND_INO].ino_num;
 	si->update = sbi->im[UPDATE_INO].ino_num;
 	si->orphans = sbi->im[ORPHAN_INO].ino_num;
@@ -389,8 +391,9 @@ static int stat_show(struct seq_file *s, void *v)
 			   si->inline_inode);
 		seq_printf(s, "  - Inline_dentry Inode: %u\n",
 			   si->inline_dir);
-		seq_printf(s, "  - Compressed Inode: %u, Blocks: %llu\n",
-			   si->compr_inode, si->compr_blocks);
+		seq_printf(s, "  - Compressed Inode: %u, Blocks: %llu, WA Blocks: %lld, RA Blocks %lld\n",
+			   si->compr_inode, si->compr_blocks,
+			   si->compr_wa_blocks, si->compr_ra_blocks);
 		seq_printf(s, "  - Orphan/Append/Update Inode: %u, %u, %u\n",
 			   si->orphans, si->append, si->update);
 		seq_printf(s, "\nMain area: %d segs, %d secs %d zones\n",
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d9c2795dd34d..ab09281c28bb 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1751,6 +1751,8 @@ struct f2fs_sb_info {
 	atomic_t inline_dir;			/* # of inline_dentry inodes */
 	atomic_t compr_inode;			/* # of compressed inodes */
 	atomic64_t compr_blocks;		/* # of compressed blocks */
+	atomic64_t compr_wa_blocks;		/* # of compressed WA blocks */
+	atomic64_t compr_ra_blocks;		/* # of compressed RA blocks */
 	atomic_t vw_cnt;			/* # of volatile writes */
 	atomic_t max_aw_cnt;			/* max # of atomic writes */
 	atomic_t max_vw_cnt;			/* max # of volatile writes */
@@ -3829,6 +3831,8 @@ struct f2fs_stat_info {
 	int inline_xattr, inline_inode, inline_dir, append, update, orphans;
 	int compr_inode;
 	unsigned long long compr_blocks;
+	long long compr_wa_blocks;
+	long long compr_ra_blocks;
 	int aw_cnt, max_aw_cnt, vw_cnt, max_vw_cnt;
 	unsigned int valid_count, valid_node_count, valid_inode_count, discard_blks;
 	unsigned int bimodal, avg_vblocks;
@@ -3917,6 +3921,14 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
 		(atomic64_add(blocks, &F2FS_I_SB(inode)->compr_blocks))
 #define stat_sub_compr_blocks(inode, blocks)				\
 		(atomic64_sub(blocks, &F2FS_I_SB(inode)->compr_blocks))
+#define stat_add_compr_wa_blocks(inode, blocks)				\
+	(atomic64_add(blocks, &F2FS_I_SB(inode)->compr_wa_blocks))
+#define stat_sub_compr_wa_blocks(inode, blocks)				\
+	(atomic64_sub(blocks, &F2FS_I_SB(inode)->compr_wa_blocks))
+#define stat_add_compr_ra_blocks(inode, blocks)				\
+	(atomic64_add(blocks, &F2FS_I_SB(inode)->compr_ra_blocks))
+#define stat_sub_compr_ra_blocks(inode, blocks)				\
+	(atomic64_sub(blocks, &F2FS_I_SB(inode)->compr_ra_blocks))
 #define stat_inc_meta_count(sbi, blkaddr)				\
 	do {								\
 		if (blkaddr < SIT_I(sbi)->sit_base_addr)		\
@@ -4012,6 +4024,10 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi);
 #define stat_dec_compr_inode(inode)			do { } while (0)
 #define stat_add_compr_blocks(inode, blocks)		do { } while (0)
 #define stat_sub_compr_blocks(inode, blocks)		do { } while (0)
+#define stat_add_compr_wa_blocks(inode, blocks)	do { } while (0)
+#define stat_sub_compr_wa_blocks(inode, blocks)	do { } while (0)
+#define stat_add_compr_ra_blocks(inode, blocks)	do { } while (0)
+#define stat_sub_compr_ra_blocks(inode, blocks)	do { } while (0)
 #define stat_update_max_atomic_write(inode)		do { } while (0)
 #define stat_inc_volatile_write(inode)			do { } while (0)
 #define stat_dec_volatile_write(inode)			do { } while (0)
@@ -4444,6 +4460,24 @@ static inline void f2fs_i_compr_blocks_update(struct inode *inode,
 	f2fs_mark_inode_dirty_sync(inode, true);
 }
 
+static inline void f2fs_i_compr_wa_blocks_update(struct inode *inode,
+						u64 blocks, bool add)
+{
+	if (add)
+		stat_add_compr_wa_blocks(inode, blocks);
+	else
+		stat_sub_compr_wa_blocks(inode, blocks);
+}
+
+static inline void f2fs_i_compr_ra_blocks_update(struct inode *inode,
+						u64 blocks, bool add)
+{
+	if (add)
+		stat_add_compr_ra_blocks(inode, blocks);
+	else
+		stat_sub_compr_ra_blocks(inode, blocks);
+}
+
 static inline int block_unaligned_IO(struct inode *inode,
 				struct kiocb *iocb, struct iov_iter *iter)
 {
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
