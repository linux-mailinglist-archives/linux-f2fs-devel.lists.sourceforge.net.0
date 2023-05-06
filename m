Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 544E66F91AD
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  6 May 2023 13:46:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pvGMT-00060v-T2;
	Sat, 06 May 2023 11:46:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pvGMT-00060k-AE
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 06 May 2023 11:46:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VHPxFq/y6r98ls3ZbcSubmnR7k0Xqe92iYu7z7UGGSs=; b=C3/viVaKmIFOACobGckfvmE3wU
 HnpSGeeP6XxWVmtK1AcI8JIEVOaxjqfgysgtToVaI8Fh/4FhbryRJndwaLmY40n6QKSr43+O5qiUI
 jT0aZ3fRaD13+kEsRrOlj5dQipYHRoTyLCxEsjSYfy25cgu69Wv5CePIoblfZY/SzCQE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VHPxFq/y6r98ls3ZbcSubmnR7k0Xqe92iYu7z7UGGSs=; b=cazyuU+Q8YQybQvbVWamknlVd6
 ZFJamoxhwWLaXoDLXmQBG8D28DOsBPjDYbE+osewZ7s4ewrWW2n9WM6ryuXvb3IgjYJiusTAY1FH+
 JWLpBP4uc4nZvGJfepxx8nyhAFMZ10XEDcYXq9ThdMSa92SDRHtsbRqktI3ZsYjHOVKc=;
Received: from mail-sgaapc01on2118.outbound.protection.outlook.com
 ([40.107.215.118] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pvGMR-0005hS-OS for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 06 May 2023 11:46:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oQS2wL0jTbgkcpThRu0KJFuZ+eX+yBfN4gBud3+MmVMZ82Q6zM17//0zhGbzAqvK8NiGOi7icYXoijax0EgagGnXqzneqMrBNLrKyEOxRtXyFkezb3DE4sYz7HhxlYUD/qyELzZre71HaavoPHhzBltu2XsidMbm5/NL/uqJ3Q21kLo79abgdoXLz/gTeyxeiitmaCu8JqAMHUTyxX9dokcXm3rP5Rj22nZkIG/z2ZFrVh7qWO1+eZe3/QDofLcSctOeFbjVOwfdYCAqIn+yx8wkMul763r+SLHUpJlMoAsjuZ/84+skO1IlwtrGY1ISmTaKrOYP7DaFsS7+lJuUPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VHPxFq/y6r98ls3ZbcSubmnR7k0Xqe92iYu7z7UGGSs=;
 b=hxI027xRYG5U7GDNPYDlTpg1WIp0A2OSYqvV5ozpqW9WT+b2KndZUus4Ri0tYpvUTMlcqbDBkb3JScW9obFC3qpiMSUdYptMXWdKyRbtSGPQLfwrtUN9ajK3iUJYyIXlKFIbgcGSlQaI5bvcTz7ae5q365IvOGxeXu3d/iZr3VbtlrQ10XSOtm0CtmXkr32Oq39wBVmFgjRTvbqgTQAvqHExmHF7Ciikk3a80lOH+UDRbZsM+lPd+YPhIyg4ai6SX+iuGEn/k3OREtBBzvu3UBo3QVFgxNB191QkNrWAq1h3hIyB3vZEj3NwH71aAiPao0maL+2Eo9tuNW16VUTaKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VHPxFq/y6r98ls3ZbcSubmnR7k0Xqe92iYu7z7UGGSs=;
 b=K4J+t+jGAIoyfxpPpLUeJ0OD/if0kanmA8vJYMZItvYUd7UohWnuNFh2Shk0LXGiNTbaMq5IL0qk8HlIDI2NNXTEddoQbZD1hlKNvHlp6M7RIcNyuH7DU7bST32Y5lquev2RdFDOaUIC2ak+Zrk8o4iLSNuChPiRWw3WLpC8KBliJMjjRjkFDMpMabYeqsqfnMVkQ8ue9ydBhgS2dS5Rkozjkn1zjBw3qR3bqxaI1bTHQ2m1v4/KbF3NrOqCYfzL+hBvUaTZ+1LJlvVrxdInrhreHusfoXls/vjdSaWuXVONHztRntJvXmxQZV0HtISQRPY2MVrqWS1/k3Kix4Stww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6010.apcprd06.prod.outlook.com (2603:1096:101:dc::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.28; Sat, 6 May
 2023 11:45:47 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%7]) with mapi id 15.20.6363.029; Sat, 6 May 2023
 11:45:47 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat,  6 May 2023 19:45:37 +0800
Message-Id: <20230506114537.49470-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230506114537.49470-1-frank.li@vivo.com>
References: <20230506114537.49470-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR02CA0046.apcprd02.prod.outlook.com
 (2603:1096:4:196::15) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB6010:EE_
X-MS-Office365-Filtering-Correlation-Id: 820d83dd-629f-4023-c730-08db4e276f07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Y9bfTRP9705OH81o0YxL++spE8mmKEDV4EFl0+t4V38FMGLWLm5Nay7BOqEaIwj3MkcNUgF4aG2vgREvkJeNJRtE7qtLAYkWxqaxyoXPTbKXS6e5wJ7bfBzdXFlBINWMj0u8zBOP43/qYtAOcr2sOOrqqgyOTxEF1cYh26eNx6OJ2Vwo5EL/zXNBvsbc9mSsybU0UxPPQVJYfFgzLdmQS9ftIyDw4S6snPW/bo8+HaOYw+QtgME15f2neWhCoMnK/BxSMSuEQTwpfILoyXghI5p+LR3PwTZDgkVWEWFHpV8Ml5whPEbzzQl42kUdvM8DHsR+5WFcr/QS8HUJlIc+cc9fFKmTiBvdeNBOeRjZDHCpFjmKSIyhjCQhmrpMDZ7LnfMrXtCVOxIwNMDf+8DWmFKy1USm4pvWVMunAPCtWG+LpbedNz3McA7XkgOTokQhFWaNzGm8vDyM5f0UfdLwrOHtc8iGKbPA2RC5hDUmxRHEjybuqmQRiXATQ7VAGnMhMKZaLpmpuOsAIspA2HL+Q+mpEwW2J5bZFvvK6h1+GL76r2sNo2GaPesiit5m0iyAQMwG+bxdNlBCNu6OuXDFCKM1W0rWStAZ8vl9vnfGi9LVPxWZ/SCA9uGnpnOExbft
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(396003)(136003)(376002)(39860400002)(451199021)(36756003)(38350700002)(38100700002)(2906002)(8676002)(8936002)(5660300002)(316002)(86362001)(66556008)(66476007)(66946007)(4326008)(41300700001)(83380400001)(186003)(6512007)(6506007)(1076003)(26005)(52116002)(6486002)(6666004)(478600001)(107886003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?owTdQtN5CN2YoGYPGS2DOw5cdwqjsgNr9wf3dq8G5AFl3vfqKWik6bXK/mJv?=
 =?us-ascii?Q?VuEAv7WSqtuL+kRmJie+f+fL1f6eEPbNl7Rw1cAKleyzCC5/VgTpnZ7CGrlz?=
 =?us-ascii?Q?tM6DSlV3rLUNNAXKJ6QB2px7T4wdM7ItSOip2Ml6TAZjOBTjivtsk2PAVNf3?=
 =?us-ascii?Q?+6Wvw3TbEVPpl0V4V9wSookq/Iw/ucSDOc7VMCcnGPr6N3kagZVvh3pYMUS7?=
 =?us-ascii?Q?bS4DWdAkpq5x5kqBERZZvLXwFvoZ8cJKp/PGh+tr+pmxF+KS2IM7+5XB2c7f?=
 =?us-ascii?Q?LhIPb05ghb9SL8Kdpa+0XjDXGYYBrKTsNLmGO0ZN3yX9BeMAyAJFuBakfyDH?=
 =?us-ascii?Q?pIdi5aaCnqEHneKZ7ZpLouBuCBZLEZSsZecrOEgqNi2AwPBrfA3uiavtNHDa?=
 =?us-ascii?Q?9gHSK27Noco4HAEWEcjeSexXFlkvudoxIt1cGOt4rHQZun6EmyUpdo3Y6fpz?=
 =?us-ascii?Q?SS+i2g7kwltsMaX6xYzPKUOZsq0ienF2BV0iJT/YeReXzTD9DMfrxfZRayFy?=
 =?us-ascii?Q?LBChT2ZVHrxVxIWpDODeXTTr3pvsn6SgeY4Yd38qsOEv+R49CqQxFKYjTeDM?=
 =?us-ascii?Q?Qnbv2P2r47YIAA5CQfKh6DGuWuNIcV1t++VtU/3MKjV2Pd1/AKuNFWxg0WDj?=
 =?us-ascii?Q?ZhKbBKQpcZODwAhIW3dpxJ2pLNvYDuKjG33PHklaHA3oMZ9EFyOW9hnP3ddN?=
 =?us-ascii?Q?loJkYCcsin5f1ZcPmIKnVQ6kG1ApEx7BwtFqH9vW0pwgSRAfgE69RtHiVmuU?=
 =?us-ascii?Q?lj9sYXeuZowJXHhkzEhMHmhDVO8IBPMWWOXz7EkSo5ZR1dyyNr4W30hX8GuB?=
 =?us-ascii?Q?TzyevKIjZ7e6FerWvHD3V+U509+aGYAW/mbV8YnfZV3fSvsYndtH+Me0NTKU?=
 =?us-ascii?Q?epIkB9METJiWETazPNk49HQNQd1a3FAhoaUiijLp6OTQRItHODgyMpUuPcGv?=
 =?us-ascii?Q?odviyMjRCB2MpvGo5pYnxDrsE8ffRzjqXpqitSyWbtGsN5LryZGdmYubW4Q3?=
 =?us-ascii?Q?qF9iDxMAvhA7QEi74sb6QMvubNLPVj1fNF7TJoCOh9yT5dWLN1fk7nNc7lQA?=
 =?us-ascii?Q?yjeR6UcDzB1nZ8TsFuO0xRDs0OH0WJMsRgcViY/Ddtw+8oEfWxBgsRDgVEIX?=
 =?us-ascii?Q?0vEVCb3Mr8nrnOH49HMGGLZ51ura6SuQ7OfEHx4DPFCWpyIfp3SFjT0uhw/K?=
 =?us-ascii?Q?wGxquHwby4H6gk6vJButX1W85cGdzEP8x1HQecGYrKyyk00LpK+NwWn+eLb7?=
 =?us-ascii?Q?/z9f2DHbvsboDbVUYCFQZpWzA7A1MOcn+V5QRAzbzDPCBgQiwGQigoxh5TdM?=
 =?us-ascii?Q?jK16c3H3zxj1CgEoAHh9Cm26BeiKZEeQjPFet/QfXatpioRrCZ9TvLmIJAvZ?=
 =?us-ascii?Q?/mXu3/Qy8zvaJF3dEEMmxjQCufakf3Pzd3eVcWdSMi9RtTOJQSacpDxQX7EN?=
 =?us-ascii?Q?SxOqz7fo0mdsFQTQYewumEY6Pxq0mSf3NNCYxLP1xHUv4JGzQWizorJaA/Aq?=
 =?us-ascii?Q?LVHzIN+SLlD0opHoE0fwViAeLnfZeKD+RQOqBD+TmeUOidX9FpT7va8HpciO?=
 =?us-ascii?Q?lLkp0gznCU+jV9qIx36VS4dJ85ga5X0DMFnfwZfg?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 820d83dd-629f-4023-c730-08db4e276f07
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 May 2023 11:45:47.8045 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4dGmEP3MmcFW3AxAZy1Jmac9N7oEHo5IKcSCy0PR47ZlwWMIm3eU/cBUJ0IpR2dIM268nFiRAo0rTqJzc3yC9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6010
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Expend fallocate command to support more flags.
 Signed-off-by:
 Yangtao Li <frank.li@vivo.com> --- tools/f2fs_io/f2fs_io.c | 37
 ++++++++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.118 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.118 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pvGMR-0005hS-OS
Subject: [f2fs-dev] [PATCH] f2fs_io: expend fallocate command
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
Cc: Yangtao Li <frank.li@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Expend fallocate command to support more flags.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 tools/f2fs_io/f2fs_io.c | 37 ++++++++++++++++++++++++++++++++-----
 1 file changed, 32 insertions(+), 5 deletions(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 126e1f9..1be8c9e 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -416,6 +416,10 @@ static void do_pinfile(int argc, char **argv, const struct cmd_desc *cmd)
 "f2fs_io fallocate [keep_size] [offset] [length] [file]\n\n"	\
 "fallocate given the file\n"					\
 " [keep_size] : 1 or 0\n"					\
+" -p : punch hole\n"						\
+" -c : collapse range\n"					\
+" -z : zero range\n"						\
+" -i : insert range\n"						\
 
 static void do_fallocate(int argc, char **argv, const struct cmd_desc *cmd)
 {
@@ -423,20 +427,43 @@ static void do_fallocate(int argc, char **argv, const struct cmd_desc *cmd)
 	off_t offset, length;
 	struct stat sb;
 	int mode = 0;
+	int c;
 
-	if (argc != 5) {
+	while ((c = getopt(argc, argv, "cipz")) != -1) {
+		switch (c) {
+		case 'c':
+			mode |= FALLOC_FL_COLLAPSE_RANGE;
+			break;
+		case 'i':
+			mode |= FALLOC_FL_INSERT_RANGE;
+			break;
+		case 'p':
+			mode |= FALLOC_FL_PUNCH_HOLE;
+			break;
+		case 'z':
+			mode |= FALLOC_FL_ZERO_RANGE;
+			break;
+		default:
+			fputs(cmd->cmd_help, stderr);
+			exit(2);
+		}
+	}
+	argc -= optind;
+	argv += optind;
+
+	if (argc != 4) {
 		fputs("Excess arguments\n\n", stderr);
 		fputs(cmd->cmd_help, stderr);
 		exit(1);
 	}
 
-	if (!strcmp(argv[1], "1"))
+	if (!strcmp(argv[0], "1"))
 		mode |= FALLOC_FL_KEEP_SIZE;
 
-	offset = atoi(argv[2]);
-	length = atoll(argv[3]);
+	offset = atoi(argv[1]);
+	length = atoll(argv[2]);
 
-	fd = xopen(argv[4], O_RDWR, 0);
+	fd = xopen(argv[3], O_RDWR, 0);
 
 	if (fallocate(fd, mode, offset, length) != 0)
 		die_errno("fallocate failed");
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
