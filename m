Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 11E9464F7D0
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 17 Dec 2022 06:25:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p6PhH-0006zo-U7;
	Sat, 17 Dec 2022 05:25:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p6PhG-0006zh-P3
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 17 Dec 2022 05:25:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oQ9FUlfJqKUzL4l6233CxlevyZaBJZZfa8QSv9Ld8lE=; b=aJDvPQLgaRgsQWLfpKeXcHvaCG
 axz1BP4gF8qV5BD7urJmYlNZKmX5SY6ffDKThAWE278Dq5/n6XCtAJCt7Lpy9rHjKillJ1SaV7JGi
 +AhQ5Muo/g/eM/F9wLHGgMYQVHxal5ezbq3cTTvS/v/bQPp2pXaoBZ5JPMRBip5vIB/A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=oQ9FUlfJqKUzL4l6233CxlevyZaBJZZfa8QSv9Ld8lE=; b=C
 4LOdV+N3/MLIki5rg9Ow6iTyfDaoRaHY3z/hjNUIoGdQfbx/MFhezP8KeJV6HXSR14xFqE/BOm0ai
 LFYi/hNDSoz9nHbtdoKuj0q9WnU8PvVqIMAFAet0eDKY3rX4SIfDXnEXTFpF9xnBqNGDbZOKl2PS5
 WN3VgabbftdIXXws=;
Received: from mail-psaapc01on2100.outbound.protection.outlook.com
 ([40.107.255.100] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p6Ph9-0026RO-2i for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 17 Dec 2022 05:25:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fZEZLChhrd/gdmRyD2qHG41rDxx0V2qFibNRCy/UDSnMaFczw72gBhokl27O9ONbm1shO/8ztufy9sJIgHzpofuJG2bJCUU5Dbu59QeFrWpLgVZIxKLlDXaw/QTyqUtQj7eT4cDzXj9PSCnONEVYDauIwJ+PjjRp/XVh+q83JQj7TcVX7TwqJh/MX6LXxjdTjnZEz6kgeYh5duGHVBFNvE/VN5CNHAWqfIP4hGoCXR1UDR/hWRsUv+ocbArp8CFt9HNevVhdjDtxBgQ37XaDRsYReC9OidTYhYw/1/EE95TiBbEQBpQurC4nW0QElo1e/TQ+3TjPMXE8JASaOgN6Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oQ9FUlfJqKUzL4l6233CxlevyZaBJZZfa8QSv9Ld8lE=;
 b=EUYvuF38MNYVdor98jSfl10GbvX9nKtUuYrZlpixXJHmCeAlEKm4E9eZZVQcEQSVrDLBOQ/Ak5ZhRVVXei2XCo3Mg4aDYGoug/cgYuKFm9hTjh2iVDYg4+x7o+po1FNLn6rCtULanGC+vTYJTfK8cBAAQbhbjuwKXCgumPcIG/EdYRBIFdLi4IJybBS3QgQvmhqktR/CCGGIzfVbXbPOPFBw3O0HE5r2w4bkIsY8uBfMi2QSB9ssr9acUMBfNvix4XHc+JY6O+9qb9y3Luk7QVEJM1oeE1tGkuqlEIB/TXGnQROmzZVUmqAuDxC5TRfBEDstysVrL5PCDqnkcnPm7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oQ9FUlfJqKUzL4l6233CxlevyZaBJZZfa8QSv9Ld8lE=;
 b=JXwsNQsCf/YgFED3vFSK/SG9wbf4UXAlcAnHajA8uvt7CPmW2Yf9o9jn+6thXE1LOXZ5ATsDS79Ty9UZjecz7JdIuxSyl8haIcRHB1IGBqrD+ss7Ips9O5yzAaO+Ti95DrxyljCjMU5wQzPjVf61NMKQlOdcKnBvnRc2lsssGkvMgmKaZTEDmAdNRv0rxoxvIDf+T6Cnio6mTPFMvrDe3whe+J3Ovu5z8ZsHaiLEHQbsrA4LIKdJKe3kpQE9fb5ndNprml4AKqclugmI+pav/MvKrCnQUqbvCTeDxGKTO04MqKb5sj/4sXc+znTDo7GJT5uPSlEea84TWgTn7hkVCw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYUPR06MB6195.apcprd06.prod.outlook.com (2603:1096:400:352::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Sat, 17 Dec
 2022 05:24:59 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5924.016; Sat, 17 Dec 2022
 05:24:59 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat, 17 Dec 2022 13:24:48 +0800
Message-Id: <20221217052448.60656-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR01CA0029.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::8) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYUPR06MB6195:EE_
X-MS-Office365-Filtering-Correlation-Id: c78f4f27-c803-42f5-08fb-08dadfef0a5b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qha+tbxLYQ7UyKmJuY47nPY8wfjLP9F2OzBUTa9xIvuSbtu0LxsRxxx3SDorb5YeiU97TjkgfCrzoiSlgW22pn4olYcdIb7Op4i2feXg6ctP/TxhxyK1c6nqxo8JuUa16nV7q6y8N9r6zn2Oy/RjAGhuPLI2UMn6hP9X4Y1pVP2IiTXNagl4REw+wwdcajiSPr1vhE1oGSrOM8wrQ9ExUcIivL/gmO7KolA1JSSmFKMIK1OM7Lb/wsmWEXhnnHR6S1M2BfNHc4fZ1xKIlqOHDBccdm78GegFpG+HmlXiGRwrCXX7Pl6eKeCb61J6jf5lH+ec2zS2iov8NIr82YZdHfxYwQclm1/I0+wUdxJ2xYsYW+n0jvp2+EqW6dOgr8ImdDeyg8Tdvs3nybm1Lwhc6T24shuutJw9Vkt3lle3DGU2Y24GK5nQV4rld2trEPsfikvj6bcme+5/YEE7DykG/FJUQK5BYQYSNOXywynpzzsId+FVIs0i2jcazGOTZfzGiSxpbITYcalC11BQMaRDLj77a68X/Kk5pAex6RsEeWiU59V7m8nGEbteAGs7C9BMnfKH5EHY26WJf6h4EXEcP6rj4FtaOusqFbSKrcDai9xSvTGLqKUfkOHArXsi78Pl/m1WbAPPBt2c9mbYh29q+03mILmwGudaCVYofggZNQ2aX268VQFlwGaA/7Ngcv5NZNNXlCLoYZ7MFuZvOcbSIQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(366004)(396003)(136003)(39860400002)(451199015)(26005)(6506007)(86362001)(6666004)(52116002)(6512007)(6486002)(186003)(478600001)(36756003)(107886003)(38100700002)(38350700002)(2616005)(1076003)(83380400001)(5660300002)(8936002)(2906002)(8676002)(4326008)(66946007)(66556008)(66476007)(41300700001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+Y/zkNWB78PROaO2MGMqzXrVdQy/fqZVJZkbeVZcVfhPFcr5wINm9Rl002+w?=
 =?us-ascii?Q?Yxyk0H+yOTsioeSp3smp07g/NVcNuLSEKfFlHTMsDyNSu0rpOYRyW1/sPIJs?=
 =?us-ascii?Q?LRAHVUjYA6mkNxfYqR4rNMkU+tKO2ROIha8LXJnAyrfoE/i/o/yHsUvFK1FB?=
 =?us-ascii?Q?QqVc1kDgB/6jym+FYuKoS8i7ybuDQTOdc2gvTtwx83lL4NOKbcK4pAt9sfkD?=
 =?us-ascii?Q?CQZQ+sBmmTFkM0xgL5/Xhtl2RgdokyIQPAfHwkbqGtI2y097j/gH0fi3dmW0?=
 =?us-ascii?Q?E77Mo8TJrE0enhMiMmD1zLAxoHog0Jr+2z9vPeTUMrjb9m9RwsWu0qOKatO3?=
 =?us-ascii?Q?vTfe3e3lN78gmDTW2RigziUL3sd8+76Q9rjDwKvFI2pmCWRnm0RyEwErTHze?=
 =?us-ascii?Q?Z81kcZIWPsY1EmvWfbmbU9Aub1M29PD/5I0FjMMMOXt6fipM/o77s4XBBCRP?=
 =?us-ascii?Q?inNRkKrZN+BP0zYSPDPVMm3Buu0FQhq6E3XZ0jTAKVWZWTRSwKdHeF6kOaMG?=
 =?us-ascii?Q?lMEvqrsYwOqyhn8cSqck3208ppOG7TfgKBFqhxiWtSTP6x/kSydQYa+LImMS?=
 =?us-ascii?Q?fhPEXFwW+yVPGVGVP9ij7Wc3oY7YKQwX0lTXcJeFBvv5/0lmnsv9pM/f24Tu?=
 =?us-ascii?Q?KImSW0aZe+FXuHcbaTKc2APzmGHomYhhjbyUM9jOfHvkpFPwTRixoRMJhlnt?=
 =?us-ascii?Q?BgiTW1e4gwFr7W+vRu1YsW9zw2DvxTTiiwSoyuOefta4Fw7ZX2SG4ODK30m6?=
 =?us-ascii?Q?JRh7W6Inz7F0SPtwfmoTciAo9Md6iNDZzcmfbPZunyAqnLccPVrPa8qx7Lp4?=
 =?us-ascii?Q?rReSzhARm8mzHHj7spE9siMJI1fRXsW/00NtASoTllOaYlp0svd8wXWeMlyr?=
 =?us-ascii?Q?B95eB6otUfUokuBGwtV5FlCKfZgtjxHrRtNEV4xYOa/iK1hovSmSY9feQl3v?=
 =?us-ascii?Q?CPu/no24v61cmq1uVg5a29RYoloJkgAms3VKiABtpRqgvLu2DIE1oQCq4OuC?=
 =?us-ascii?Q?Ih8ETw3sncBe0mSUKsaPFTQJME2L0/RjrzWK51NSIov8V598RdNakS39kMXm?=
 =?us-ascii?Q?qsv+EZKUtPbTHxNsoySpvVZYf4WFxycA1XuuWANWww0YMjyTRrbIXdHvYRaa?=
 =?us-ascii?Q?6ixYLEp5F3i0BXqgoZMrP/WlKBO0eU61sf683n7iiMW9MBBz1QX8hWpIqts7?=
 =?us-ascii?Q?dEA3zs3PsS1WThQDDTWn5ZBFnuqd1Dw71SQ0pqWmOVoZTGKo1AQlfMarc4vb?=
 =?us-ascii?Q?biTAMoBZzLuXtPM/OvQXfzfgnxui2LD5x2WjhMlGxbHdh7fqqD5MRk9HmT88?=
 =?us-ascii?Q?b7zNDaQtKJ+8Ae+OM5ASZOQiYFbgUdVCs3/C5PvrjuGobwGg80K9STMYuTvd?=
 =?us-ascii?Q?gW5gBtcrT4Kj3gwShnixN+CyG1wY/KQNeJwm8gFc/N5sSeQXURe/NhteR8jm?=
 =?us-ascii?Q?GcVcUC3nF3YLtaRBhm/0+0vcESo2Sqg3j+lC87u3gdEgAEzHrMKAEPuqO7k4?=
 =?us-ascii?Q?we57Yvr4s+q+tfp06slY+Msh7zaeNSv9uhAjiIbnu5LPXObbC7pefPXPwDfN?=
 =?us-ascii?Q?HOAL/3j7XAUueW2/EGCNTMAenldR9qoMi/zIZfwj?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c78f4f27-c803-42f5-08fb-08dadfef0a5b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2022 05:24:59.1356 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NpFgpb+DuNC1uVBmPKKBspQ9Ul6CUWgpQ7E249UcqOoacTl4QD1hcwhZgumcOxrUpUDMKHTlbkBwVR+agpOYpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6195
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Commit 1cd2e6d54435 ("f2fs: define MIN_DISCARD_GRANULARITY
 macro") introduce it, let's convert to use MIN_DISCARD_GRANULARITY macro.
 Signed-off-by: Yangtao Li <frank.li@vivo.com> --- fs/f2fs/segment.c | 7
 ++++--- 1 file changed, 4 insertions(+), 3 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.100 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.100 listed in list.dnswl.org]
X-Headers-End: 1p6Ph9-0026RO-2i
Subject: [f2fs-dev] [PATCH] f2fs: convert to use MIN_DISCARD_GRANULARITY
 macro
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

Commit 1cd2e6d54435 ("f2fs: define MIN_DISCARD_GRANULARITY macro")
introduce it, let's convert to use MIN_DISCARD_GRANULARITY macro.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/segment.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 25ddea478fc1..c95a9683f950 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1610,9 +1610,9 @@ static unsigned int __wait_all_discard_cmd(struct f2fs_sb_info *sbi,
 		return __wait_discard_cmd_range(sbi, dpolicy, 0, UINT_MAX);
 
 	/* wait all */
-	__init_discard_policy(sbi, &dp, DPOLICY_FSTRIM, 1);
+	__init_discard_policy(sbi, &dp, DPOLICY_FSTRIM, MIN_DISCARD_GRANULARITY);
 	discard_blks = __wait_discard_cmd_range(sbi, &dp, 0, UINT_MAX);
-	__init_discard_policy(sbi, &dp, DPOLICY_UMOUNT, 1);
+	__init_discard_policy(sbi, &dp, DPOLICY_UMOUNT, MIN_DISCARD_GRANULARITY);
 	discard_blks += __wait_discard_cmd_range(sbi, &dp, 0, UINT_MAX);
 
 	return discard_blks;
@@ -1695,7 +1695,8 @@ static int issue_discard_thread(void *data)
 
 		if (sbi->gc_mode == GC_URGENT_HIGH ||
 			!f2fs_available_free_memory(sbi, DISCARD_CACHE))
-			__init_discard_policy(sbi, &dpolicy, DPOLICY_FORCE, 1);
+			__init_discard_policy(sbi, &dpolicy, DPOLICY_FORCE,
+						MIN_DISCARD_GRANULARITY);
 		else
 			__init_discard_policy(sbi, &dpolicy, DPOLICY_BG,
 						dcc->discard_granularity);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
