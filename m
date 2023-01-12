Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BEB0668382
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Jan 2023 21:11:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pG3ue-0001Zr-HK;
	Thu, 12 Jan 2023 20:10:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pG3uc-0001Zi-A6
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jan 2023 20:10:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SMwX2Z63BOrhnn9hWOajr6p4tGVhNEA9HWgcQDrsSxw=; b=LOrtDAI30JFRSnM3vpMHNZBC5G
 omngtUm4GF1mrTS/QJCbfVcv05eFiO8ZQqgUWoNkmawph0j5FazsCwZOmjZbhuRmHIP0NpE9++A/5
 /0mdWxuSczWC98ZoqaUzbD6ciRP37Mo5WmzxT1zHG8TTkntiGtVESMvkt15Hbrfmo4p8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=SMwX2Z63BOrhnn9hWOajr6p4tGVhNEA9HWgcQDrsSxw=; b=D
 cc4fPxDkufkGhdUX4wwjPvECic7wiDcVQPFL+dy3s8d4rLguFw/JIoPN8bQKHQYI6QvW159v5sakT
 2FN/+lkRRxcBhgBS1TAQjkYGV0gqWajQYWLmFGxPvNTa/MkDuImSeAr3w76OM/bXC+tZzjXYRCLZC
 RBFqVrFaL9UWM6ks=;
Received: from mail-sgaapc01on2100.outbound.protection.outlook.com
 ([40.107.215.100] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pG3uY-001SyT-9K for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Jan 2023 20:10:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AKUyM4uGUbUNU5JA77FOx93snlDO8XbrJD3x+Hx5HVNH9c0KCyJgWKjP8FKGVFlMZtd2Iwf++sBZ3RI56FMXR8YATxGw22R/XafFuIZ+1eRK4wcbfE9UJSexm6iJMwqzQnBPW5Q9kq8F4Orl+9OSa1UENLUqlGBgAAikfUlC5V939JEECSieRjzMBdBr5BEINodFXPHqUbc9KaF4FbxVF5Ut/2I9ZEqVKPdpFb5chFGx/B+LQk17WeIZ4hK5yKbsUgoeN02Sww94AXxgmLGn53i7Xu0TNwK/OcQpCuu4+SYN4CqpIWJBvuMVifmi2xmcgSb5F1t0pfPXHVqgZdrYfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMwX2Z63BOrhnn9hWOajr6p4tGVhNEA9HWgcQDrsSxw=;
 b=iBY9b7IyzCSD2W3Omb+vc5Md+450cJQclxoGlblAU3DFLaFXykinqzxoT6fkBHCrnl74l0e4SHGuM+6KVzv/qRt/dDowLU0ws3HOB9Y3aeO3ejNFke6nsfypNGIX6onsaNz8INkbBMz0IImuAr/ov9MlN2/DDr/swn+fB1iwQA2BJRrSxBdn9M7tZTJTYfsQa/NFmRH4hIs8dNaUrvGu7H8xJhPU+EtPNx/pwoOVtR+UJRrntLCTix6gv8RTf+GpckfDgva+h9Si53H29ymTKuDgNHgoE4OXmWgZ1ciE0OT1z2fWFvIf/SmQ130GdfNMlS32s700A7jS54BxCxPyaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMwX2Z63BOrhnn9hWOajr6p4tGVhNEA9HWgcQDrsSxw=;
 b=YN5EjMplE9PS0zvtWufDnxhYI48L+yUJVtZWl5G4kl50MWrgyAuOttvbpwTrJngFYGFiBK/PGYMkGSyqApu2DlwO/rd5KRXnIylVkzRz3s+VMmw1r2Fwg0WXwiUoQkUv7G0ywfCF1WUXh5TNsWNDoSUqgatrrQ01YM4VNQc+DzFHOCaSXuU/O0o4i0O3dBVAe5MnIUAhlHPv30pHUHEsaYnA2+0nqT4JXnCwW3z7VV8JC/2SFXIIJh6J2mY+dt4nouXT8MkP7F6m6UvcqeDIMBLS++zN4gwcI1lUeD4uDBL570Ojvb5qcTWF8Iv2A20c1kj/YCfI+xwMq9mixwZYow==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR06MB6111.apcprd06.prod.outlook.com (2603:1096:820:d9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.11; Thu, 12 Jan
 2023 20:10:41 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6002.012; Thu, 12 Jan 2023
 20:10:41 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 13 Jan 2023 04:10:32 +0800
Message-Id: <20230112201032.66300-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR06CA0201.apcprd06.prod.outlook.com (2603:1096:4:1::33)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR06MB6111:EE_
X-MS-Office365-Filtering-Correlation-Id: cc1d4b29-0143-4783-ed78-08daf4d91454
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ++nmkos1PFNSeF9msvaR1ANiqdMU9pAw3fHUL7F+h3l5EB8/GN+0NodkGxXV8tqH16udEqxK0mxMxj30dAs7OCW0lLD+tHfSWI/n10505e1pDsZ9Fpxn4W8ZIaZ9rP+vU4QASX5z7GYmXBEbLDGrr3hnrPWa+SGtandYhfPl/kWiCo0ZkxlDWvJkubXAhxxha96h8pxCnkApLfxnwH5ZyRaekIjhGiOy+vOcxXxmdCGjkrgDmIvAP54uago4QTftZO9VgdzjBnOqpnLFUQbdkJSBDo+A8hHc5iZmPDfaA9ArUqxzz4doBh++ATgARDrRFqEZ6HIlDv4070pp7Ro4xeaDiC/vVqfU4O0tKejmq/51zctP1+dNK+Y5um6ORLV5Fsvpm5Wvi6qbEZ0motZXnptGWi5iO4RgQdEiDBrbaf1lm8q2iJUR6feaqfBgzU9ERoCWTPa8SK/rmdVZBfos5QRh0/mtDQbJBXJ6N4QpMFQP4Wrgp1XM2QUrSaoJbNKSzD12GHJ9Lns04YU7et4MQF/HMW3+gZcgoIKD+JMLeyWr3G7uvtMyP/pxnILXfbw4G8cJ/Dl1AxLA7hnq3XUsBSrm4eFuI2P4BE9iPsR4OhZMNpTGObNyMRMUsH8lXcNrKOo9Sdg30iYv1YkqSOxT6ChiZczroXuPU1pKW9OGq408g9A8cegDWmxLKMz+ATdceihc/qsapor6a1zrSl+6GQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(346002)(396003)(376002)(366004)(136003)(451199015)(1076003)(38100700002)(8676002)(38350700002)(83380400001)(86362001)(66946007)(4326008)(66556008)(8936002)(478600001)(66476007)(5660300002)(2906002)(41300700001)(107886003)(2616005)(186003)(6666004)(6506007)(6512007)(316002)(52116002)(6486002)(26005)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lDRJQSDJZ2U+aqQJJUjGtol8b34LOgnYUzuq6S4Fn78CfWkdv6H+JJG06vln?=
 =?us-ascii?Q?p60usgipFr/bTttYqdYbAvseH7ggWrS3zGhBZIBUgy4dEHY2h+oZFqt9DOD3?=
 =?us-ascii?Q?AOjGT3cwdXCtBXFesMH2Tual7k3yqjIbNbxMoG+Cp2zjHsMrDrceCWLzdPS/?=
 =?us-ascii?Q?Dx1CPNkERHcGTmNX5zgNb8AmEprENqqeK69R6uKagHTdF9x2nGtLwNFrFZGM?=
 =?us-ascii?Q?aerqoZAmHbslJVeryn8KX/SNhGTIrc82jd4am17eDVs93cEZK/w3XCOy6xtn?=
 =?us-ascii?Q?FPtY9nP5pS7jlR2fTPRZS+7jJaPTAJBkynHRPVLct+jFyOSAnjKU3KebvYyz?=
 =?us-ascii?Q?LnHjo95YXpTDMkdlOadk3lcD7lxLD2kcXQwLs4MKqxUSl2pp7k/Vho5R7j7A?=
 =?us-ascii?Q?OFNBcnOmhEPmTw/DW5aZRxSzHbArWyakaeiKwlsqe7B/rQFexWzCCBrgmfxC?=
 =?us-ascii?Q?Rj5ACxrTHyMevwcVihTZ9hjG8CtpGCmzH8d5b7e6jJXkrG2iooJlALhh7k2A?=
 =?us-ascii?Q?531Pfz5+OQ1nloUqVXB+yiMdH5U5nHOvVSsX6vsgsz1MShnCEvR9RmwX2Trd?=
 =?us-ascii?Q?t2wp1cMfLj1yNeHIGXyCXKGfMGgih2KCmLXfovyahKjXCqtxN+GKQgkyY7V0?=
 =?us-ascii?Q?Ho/WNW6/D5t1KALjv2GpUVNYvxLvnqAzjdmBCJHnXg7KE4kuAmKTDtf/tuAJ?=
 =?us-ascii?Q?uM/GCQYaOlxsUadZKAMQTkrbtgpcr8hguWH/61T8/Ii0Q0eSudlgrmmaqpt2?=
 =?us-ascii?Q?V0BnpuZHjmdDD9gvWi+E8vhdkwScLG4DJ7ngwhlxLk55poSMhHipQFPmk5ez?=
 =?us-ascii?Q?D2tuko+R3+WQExdelcfeZN3ArpFheUX7wZlF35jG89jCsQqVcECbELprEcFb?=
 =?us-ascii?Q?I4qNwZ89VOJM3cON2EjUI0SaYbnyhCmdNkUoDO9H06rVDSpB/AbAlda9z6FU?=
 =?us-ascii?Q?5Ll+vgmvqz5OaBzullpzkvngR4oRj0Ut/uMaHXFdPXm8RBKm8tYOd3Aass3i?=
 =?us-ascii?Q?/Dp/8YJcGVXhb/dDoKK/m79w30GwVTtppnQaTzEddf0B2TvmTkBKihumnT2d?=
 =?us-ascii?Q?xrL2IpRjuA/8vrHkyjHVaudkJc3o1TZ4UMRzbfUzy2pdQ40bdxNCmGpHaogp?=
 =?us-ascii?Q?MgXztPEGS4e7OJwGJ/U7unXV0SdGSOMN0h+DyFJ40GZSKTd4zs6TG0ihQ3ti?=
 =?us-ascii?Q?QpCuHb95M92l8LcWpoIyo+cYxNH+N36OLXsPjAp6h+8Xo5bqcRLpISFDeGuM?=
 =?us-ascii?Q?0DnfplxU3ML+HE1Y35fmz2lkddVpgupPlzcJzy6ZVXwSYd+VpHuHbUp4fg9W?=
 =?us-ascii?Q?GwiaS5I4cXYLV3kwonKJsl0X2SiLWNo5uNvoETClKU84Ls8jhpQkrZkepZlK?=
 =?us-ascii?Q?5qiF6leCb/X8JprZ/sKXOs8TGUf84Ejwl1usC38WQrFWvnJn1ysIvi/mFSxL?=
 =?us-ascii?Q?l1m9asaSGicte5bR3tzm+nNlDGWxMozYyFaaFDzB9eVP4ID/v54DWEM1FCbC?=
 =?us-ascii?Q?vv8v4wUzxjbyDS6yGDn7G4spBRi7jlGBEBQfIPj8Iiao63sVuX+kwAjihBXL?=
 =?us-ascii?Q?Ecn65n1BKY9+B65IPhfTf4ZB3ETwY8zTuTSEKCAK?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc1d4b29-0143-4783-ed78-08daf4d91454
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 20:10:41.4099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Vdoyqmbu69W/yjCp01RKv+GcDvXOont/E4/5FYLP3Vg/rsNaXru2ssDS8gMOjcXbhMq1GaNlquHTgmc2jxFC5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6111
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Opt_compress_chksum, Opt_compress_mode and Opt_compress_cache
 lack the necessary check to see if the image supports compression, let's
 add it. Signed-off-by: Yangtao Li <frank.li@vivo.com> --- fs/f2fs/super.c
 | 55 +++++++++++++++++++++++++ 1 file changed, 28 insertions(+),
 27 deletions(-)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.100 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.100 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
 information
X-Headers-End: 1pG3uY-001SyT-9K
Subject: [f2fs-dev] [PATCH] f2fs: add compression feature check for all
 compress mount opt
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

Opt_compress_chksum, Opt_compress_mode and Opt_compress_cache
lack the necessary check to see if the image supports compression,
let's add it.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/super.c | 55 +++++++++++++++++++++++++------------------------
 1 file changed, 28 insertions(+), 27 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 5fc83771042d..8ef1449272b3 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -89,7 +89,7 @@ static struct shrinker f2fs_shrinker_info = {
 	.seeks = DEFAULT_SEEKS,
 };
 
-enum {
+enum f2fs_mount_opt {
 	Opt_gc_background,
 	Opt_disable_roll_forward,
 	Opt_norecovery,
@@ -655,6 +655,30 @@ static int f2fs_set_zstd_level(struct f2fs_sb_info *sbi, const char *str)
 #endif
 #endif
 
+static bool f2fs_mount_opt_need_skip(struct f2fs_sb_info *sbi, enum f2fs_mount_opt opt)
+{
+	switch (opt) {
+	case Opt_compress_algorithm:
+	case Opt_compress_log_size:
+	case Opt_compress_extension:
+	case Opt_nocompress_extension:
+	case Opt_compress_chksum:
+	case Opt_compress_mode:
+	case Opt_compress_cache:
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+		if (f2fs_sb_has_compression(sbi))
+			return false;
+
+		f2fs_info(sbi, "Image doesn't support compression");
+#else
+		f2fs_info(sbi, "compression options not supported");
+#endif
+		return true;
+	default:
+		return false;
+	}
+}
+
 static int parse_options(struct super_block *sb, char *options, bool is_remount)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
@@ -685,6 +709,9 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		args[0].to = args[0].from = NULL;
 		token = match_token(p, f2fs_tokens, args);
 
+		if (f2fs_mount_opt_need_skip(sbi, token))
+			continue;
+
 		switch (token) {
 		case Opt_gc_background:
 			name = match_strdup(&args[0]);
@@ -1068,10 +1095,6 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			break;
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 		case Opt_compress_algorithm:
-			if (!f2fs_sb_has_compression(sbi)) {
-				f2fs_info(sbi, "Image doesn't support compression");
-				break;
-			}
 			name = match_strdup(&args[0]);
 			if (!name)
 				return -ENOMEM;
@@ -1122,10 +1145,6 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			kfree(name);
 			break;
 		case Opt_compress_log_size:
-			if (!f2fs_sb_has_compression(sbi)) {
-				f2fs_info(sbi, "Image doesn't support compression");
-				break;
-			}
 			if (args->from && match_int(args, &arg))
 				return -EINVAL;
 			if (arg < MIN_COMPRESS_LOG_SIZE ||
@@ -1137,10 +1156,6 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			F2FS_OPTION(sbi).compress_log_size = arg;
 			break;
 		case Opt_compress_extension:
-			if (!f2fs_sb_has_compression(sbi)) {
-				f2fs_info(sbi, "Image doesn't support compression");
-				break;
-			}
 			name = match_strdup(&args[0]);
 			if (!name)
 				return -ENOMEM;
@@ -1161,10 +1176,6 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			kfree(name);
 			break;
 		case Opt_nocompress_extension:
-			if (!f2fs_sb_has_compression(sbi)) {
-				f2fs_info(sbi, "Image doesn't support compression");
-				break;
-			}
 			name = match_strdup(&args[0]);
 			if (!name)
 				return -ENOMEM;
@@ -1204,16 +1215,6 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		case Opt_compress_cache:
 			set_opt(sbi, COMPRESS_CACHE);
 			break;
-#else
-		case Opt_compress_algorithm:
-		case Opt_compress_log_size:
-		case Opt_compress_extension:
-		case Opt_nocompress_extension:
-		case Opt_compress_chksum:
-		case Opt_compress_mode:
-		case Opt_compress_cache:
-			f2fs_info(sbi, "compression options not supported");
-			break;
 #endif
 		case Opt_atgc:
 			set_opt(sbi, ATGC);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
