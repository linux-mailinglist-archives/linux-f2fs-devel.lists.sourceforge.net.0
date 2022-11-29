Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDE063C00D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Nov 2022 13:30:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ozzkR-00054F-0e;
	Tue, 29 Nov 2022 12:30:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1ozzkP-000544-95
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Nov 2022 12:30:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/xSPZnF3yE4m22lxPRK+tWqeBNDELmXx2wPfAo1agLg=; b=mOu+iiF0SZuXXbwTKSbLH8WjYH
 ImYMfAp2HCA8OqAsIqN9gaQXbIkNftMDyUjoTBmf7TPT56wb7ArCAqy8xndIfMTEbEXVJPt8+Wjpl
 A7e7jqSn8MMwZGuQLFbBniFBeHy45olEquBvGqql0NJldsGsE1r9DWoPU7zDY1BUJuE8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/xSPZnF3yE4m22lxPRK+tWqeBNDELmXx2wPfAo1agLg=; b=A
 Q+Njh9a2dVSkY+LiyW+qgtbzsxq+nyKdb2UgW2yHnsWxKFfpdJNJiG2HV4fhwTqVyEw8dXOI8XIe8
 qPjNU4Rk31hmGtAHjFmyxfMN3wNMGhyW+QP3iW8Z9YSOurKIsbHAalFPN4rcBpP/O0PJ/LMHQT4gP
 c/yeTD57YQ0SDk+Q=;
Received: from mail-psaapc01on2096.outbound.protection.outlook.com
 ([40.107.255.96] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ozzkG-000HyZ-2g for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Nov 2022 12:30:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cV2eonGG64kz+Qf9ZFn3mi9rzcFNHTphEMlhnGA3o5O3FnngIYyY8e4J8NDnyJEpl25xA9JK4JuOnnhh5xMj8YXBOuaWLJbRuu/JOjhtaliE8rwmarV6ZZMaYKAVf7IbM6JvfmYEN5JNuhOn2L8Z3H4pbQIpQjttYiY24MGKXgeZX2O7sx5I81ls+H6sf3k49E2W3BpnXlZFGl2EG/pTCw98D7PiIXFFJIDiDmDDKmISE3Bif1HbTkF1k3LoePfIM4kgBf/Yzq52fnks7JukGALU7CbQSWX1u9Fw7LBRQcXL5u9aJILZuKm29pHslA42uwMuWqqbSSSuovBc6T8ZDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/xSPZnF3yE4m22lxPRK+tWqeBNDELmXx2wPfAo1agLg=;
 b=jGaxI9PZTLtKQ+/zH8C5WqJ0T866ji/oHnwigWIyqKBVVQI4zJTMDqemNGlz9fjUcOV3LcBM1RTNQsW0ueEQFhLXBLA+R+ZhmrTtvfAACtWzJHkHRByyHMRJsQRt1PigLJOR441OeIQHmstgkinWHu6CoAw5zQQODEunKAsb5F8jzp8Cnr+OVtFl932Lxs/kPt1FZ8aoVEhLWA4V9w8XMNCYWr1JnSduwKvA4dJsjkCSDjjG+5hd66cfe8dOoPVqpIVQWeRHq3/IGwfpMLYoiJxvPW9GRBT5ihTAMMGVK606t/MgIL/4v7S2b0d1HYmcgEPXyfH8TrAZ7z2nCNf18A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/xSPZnF3yE4m22lxPRK+tWqeBNDELmXx2wPfAo1agLg=;
 b=KreVcyFDxzTGTJ+wd7szG5qR+067EOV21Y+NwMwISV7NXNLYW3SCkVcTMjfLHDUSG5n7i0VW+6/RYI87oPNpa5uhjU76JJEaLPRNKrNlYSNZsWuO0uo4E9KLvh4YKfXYFfO+A/iolXVqT2Og7V20WG0byv8ptEyx+Xnvsnauwxf9DsbdQTtHLjadsWPwXx9b55EmmwrCLn1zOrvdvZOg+WS50g1391MuLsnR8M/Al0TARVOxThs3iHl/QR9W3dxjLuvY/XrowYjuAxy4R4QlVcdzyaU3dqM5Zv2i5+/2Bwq6wJiPk85f5O5R6k7QJF+F71krOT2a3Fzk7ToCoVRiFA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB3907.apcprd06.prod.outlook.com (2603:1096:820:2e::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 12:29:40 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 12:29:40 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 29 Nov 2022 20:29:28 +0800
Message-Id: <20221129122928.23730-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR01CA0170.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::26) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB3907:EE_
X-MS-Office365-Filtering-Correlation-Id: fd576a91-8dcf-4c7b-f604-08dad205629e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l4oMLmM0x5MxDXNGjBKjlAyspJfhUqcHx7luoEwHinc/Dfnbg73rtth+g6Ppr/YhpG0AFyemV4tyw07H0ZQVzSuQNeQ0sG3APfqtyMiGdeNYtNn2sF5Zd3/MKc2akF5VIWYb0GDq27hqBspjPnetY6/nFFNSpcIEDaFMjk4o9r/2uI5KO0AWuyN5lPkpe5DeTVs2IYgHUknKBl4Ffnz+q7qmQ1dPNo4oWzXuPzqrn7LJyFydBSoW/YsWalfnFU0q7HHXa3YAwm7kQjRRiaAIPXRwHnOLeB2kQztqJqW+18Ff5ih+ePq6tMJqGk2HaDKzJfEYKLefs0DxLEvVhxRYOYwlKNlQLPf1EE71NPkFWCGVJy1z1oa420cyXdGymBZmXPZx06CsxvMagkczuFzIvw1xGp/yuSM3U99n3EeWSvgEPppHW8A+A8tuJp80JiyMPsquhivCZALO2wVWxBA8d+1gOxhsjigW9jOTI2ITrzIlxOnPacIWg4dJmJP/ik4srzCKY57X1r50FyVbrWXiAV3SoKG8IIHMhc3JVwmCiVlYgmEoabvaAkURAYiyCRcnKzt7cL56PgXEH6Emm5zpvmUmfjRc9i1rd9yl48RfAJKAr/Smc5P1l6GMS0JTaqKnPIy6Vn37naPcbELsBF/hjsFwvoTUOOrE+CC00g1Jv6rrlOBXLOXFwsPMCO93w2Ii
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(376002)(346002)(39860400002)(136003)(451199015)(6486002)(107886003)(6506007)(83380400001)(86362001)(52116002)(478600001)(6666004)(316002)(26005)(6512007)(41300700001)(2616005)(5660300002)(38350700002)(38100700002)(2906002)(8936002)(1076003)(4326008)(66476007)(36756003)(66946007)(186003)(66556008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?1JWPWQGBW5Yraj/rOFk5ak0ifwtgcTCJxbnvvNpv/dM0EQiPQSJN4mk3a64n?=
 =?us-ascii?Q?t3L6ecMDCqNDbxR8FTx87VoEZLnsUFDQC+A/WlNG6PMm3wFewI6VuKJC/PkG?=
 =?us-ascii?Q?Gv+84CpFE/XS0sGkICAVUrBy7hmpYazDsyWtsvsSvlQ5tK1dFWU2RF5ncqIj?=
 =?us-ascii?Q?VgiPugLh2faeEBNLEfIpmKt/IzBtW7W5tLv59W9EtNoUhHe3WPWSkPf4F7AQ?=
 =?us-ascii?Q?kttIOUSp9rHNWAOAywrPJGD2Zrjrq7TcFUGL73UFOI2cwcWg/LYSNAbB+5l8?=
 =?us-ascii?Q?tfZ6AB9Fgc9x+ffDNMwoE1kkOvD7sO6mH73wU+tZ3I0hNKm5AT7xHzVdnCx1?=
 =?us-ascii?Q?CtM7LJvktB72p/lJrqgvmCNDTKeO3KHv5IvQlCaxkaDEa3SQhKcyBMXtQGON?=
 =?us-ascii?Q?aBkYhoPab5ZZtMWZYp4PcPhSXhu4HBE5jQNbSUdoSAkix1KihxUffjolDFmu?=
 =?us-ascii?Q?p/+3w5jsROMuVsJNEKglpEKh5DVlWfJ7C6KL/gaZSx2xyvCmULB2vmhLFmSd?=
 =?us-ascii?Q?SgW56p4OI0Z7SG1IgwcupR1mZQEPCqhOCl55NAuzaHc87xLTwV9/0ej5gbYK?=
 =?us-ascii?Q?vejXHyMT1ZiezLrAtcO9y3uVVkQKn6/T60HjN0OWsXtW+yEpoH3sdr01KinQ?=
 =?us-ascii?Q?+dIW4ur1fuyLZeHdxEf26XcsTVkOK50c50/ApcexOJJMkYV3jl6Bh7VrRtyu?=
 =?us-ascii?Q?Xwp/OUzNYljh5EOV5tJjGd+igDsS75jeY/u8xJl74fgi+1DO8z5WWF86Trz2?=
 =?us-ascii?Q?35hMvKToAPZi52PV3ekdcgTZbbm8vy/F2BDszXq/6wC0BOt7E4fNGFmfr68k?=
 =?us-ascii?Q?55xsrVaWd10xzX2dzBTGEdCVYjlDQYwvrBzyAGSfnvT4OdUBypE4lF4Bf9Sc?=
 =?us-ascii?Q?jnFq+NPyO3lH3DKDW3+fpN/uCz8P7OyDGtUIxYdiu0zP4thH53rhcZ86rEEg?=
 =?us-ascii?Q?whmsCueNMmntb1TlQIpjzvg3sEPM8ohxZQ9rWrpfhdSXjmKkCeqkcaNWcTRf?=
 =?us-ascii?Q?DPdIfP7NUGm3toTj5VGJiprOPN/3S3rNxnJ/LcxRej4nEHA+GzwzFkoHRf/k?=
 =?us-ascii?Q?+49SxQBLAp4/SkO7CG/kezuog44BubuSi6nULPixs+Z3pKB8yjS4p10ekaoz?=
 =?us-ascii?Q?xrf6BIKP9FLG38YO0bntkJfFjvG9uA+ZgMWzJL7q7t0hUQglw7IbDFnYbQ5g?=
 =?us-ascii?Q?V5+T9QUCWVIv0cy9FJRWxp1XSIVlfFIbl+nwH38SSZuRukzbrnrV3wgivR38?=
 =?us-ascii?Q?EttFE806EhGI7gBmGxKPqsHGVCUSW1MLVtsykl59GtD2DZ3XYDuC/9SYrPS6?=
 =?us-ascii?Q?mUWO/pY0dKTTWkoLcCMfcyYrhtvLG4oohYy+dkJPeF1epc2BlGP1/PCDG7I0?=
 =?us-ascii?Q?5t3YYvIya51UcQVpkauUz/YZP6XO27mxeulZzHiaGaEf+3e67unvvDG7jIu9?=
 =?us-ascii?Q?RT3+c7TWW7YomdHGKV+6o75giA5jSTcCFQLW6yLKGthjTr/MYewMsm0gXfvO?=
 =?us-ascii?Q?OLO8Lgd1s75iS1DYOSoCRABhULn0a069tbpOzBERGh4blQLbJ89wlp3y4KQm?=
 =?us-ascii?Q?jHnBUJiNVUGUq+UrJWQokBbAl+nmqPAHBRl9859p?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd576a91-8dcf-4c7b-f604-08dad205629e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 12:29:39.8850 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/i6Gf8+euPycAUlyr+S9UKMVb32gWpI35H9w7FA3GN4iHX4FQOJ/Zw5QjqHESuQI7VS8+ZNpmG5GWn/NmQ35g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3907
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The current logic, regardless of whether CONFIG_BLK_DEV_ZONED
 is enabled or not, will judge whether discard_unit is SECTION,
 when f2fs_sb_has_blkzoned.
 In fact, when CONFIG_BLK_DEV_ZONED is not enabled, this judgment is a path
 that will never be accessed. At this time, -EINVAL will be returned in the
 parse_options function, accompanied by the message [...] 
 Content analysis details:   (0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.96 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.96 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1ozzkG-000HyZ-2g
Subject: [f2fs-dev] [PATCH] f2fs: judge whether discard_unit is section only
 when have CONFIG_BLK_DEV_ZONED
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

The current logic, regardless of whether CONFIG_BLK_DEV_ZONED
is enabled or not, will judge whether discard_unit is SECTION,
when f2fs_sb_has_blkzoned.

In fact, when CONFIG_BLK_DEV_ZONED is not enabled, this judgment
is a path that will never be accessed. At this time, -EINVAL will
be returned in the parse_options function, accompanied by the
message "Zoned block device support is not enabled".

Let's wrap this discard_unit judgment with CONFIG_BLK_DEV_ZONED.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/super.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 79bf1faf4161..753c97be7d39 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1289,19 +1289,18 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 	 * zone alignment optimization. This is optional for host-aware
 	 * devices, but mandatory for host-managed zoned block devices.
 	 */
-#ifndef CONFIG_BLK_DEV_ZONED
-	if (f2fs_sb_has_blkzoned(sbi)) {
-		f2fs_err(sbi, "Zoned block device support is not enabled");
-		return -EINVAL;
-	}
-#endif
 	if (f2fs_sb_has_blkzoned(sbi)) {
+#ifdef CONFIG_BLK_DEV_ZONED
 		if (F2FS_OPTION(sbi).discard_unit !=
 						DISCARD_UNIT_SECTION) {
 			f2fs_info(sbi, "Zoned block device doesn't need small discard, set discard_unit=section by default");
 			F2FS_OPTION(sbi).discard_unit =
 					DISCARD_UNIT_SECTION;
 		}
+#else
+		f2fs_err(sbi, "Zoned block device support is not enabled");
+		return -EINVAL;
+#endif
 	}
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
