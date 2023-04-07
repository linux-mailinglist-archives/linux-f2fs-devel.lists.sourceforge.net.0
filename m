Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E20636DB200
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Apr 2023 19:46:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pkqAb-0001mY-VI;
	Fri, 07 Apr 2023 17:46:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pkqAZ-0001mR-PB
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Apr 2023 17:46:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YmfXcCsXN4o/FIs6g/+CLsFE+z5Gk+zVqU5lRRDjHWg=; b=gHZFvAdK6wjwBHupQFFTFguR5r
 tuEGLr7ptnbw+fvY04QRjMF6wLyLD288XTu7/aa/5tAGEGRGbO36vUqdYLazsjtdllFeeCnOMax5w
 G2/EBN3TQOfg1rkv4jFh42O00bEPRXSxhWKd8KNgxAEwa9wFtvKKrfknCzL80xU0zHUw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YmfXcCsXN4o/FIs6g/+CLsFE+z5Gk+zVqU5lRRDjHWg=; b=m
 BA723yyiDI6oueVUD3Wu3b/3uJmWJt6h60y78Uhy7vC9RGHyxQra7Wc3AEqqzAsRxIu12ItP3Vz1/
 WHzlEJCiWlxkzTcKFd8wYrDCyK8ZUNeIKBcHGEjctcMKx1MpzeveG8l6aQ2zSuUuouEjNGQEBKO77
 CdIeeowk7nptBetg=;
Received: from mail-tyzapc01on2122.outbound.protection.outlook.com
 ([40.107.117.122] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pkqAP-000LV9-QL for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Apr 2023 17:46:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bGnRJCujd/g3mMCMIuoxO5qM0YWeqr5B8rCq6scSg5IMyBJZ4MZr3DzAcQ8gUrD00sk/Dj0P94UduQvYW0WWSDrtl8Sj6355h0u33v0BhMv29+Q2XzccFu6G9r3lNfzHrS/8o9aT0q0gy9hX3BvOnSnXaYGOUsRlm2dgjMjiQdOs7311IYIGr+GKibswRC7vlt8/mQ4mNIllxKShgBaI7aW+R7RGGsjJnlKPhZNHNCwCNk5NmKfUL6mFMiR2bJmXJcHjEZiU/w40SIf6BGMARy4g+W5t215u/7TNrFxHPd1+tAJsUJa8At7w9CAOObH5ZCW96cqxZ3f1gt9F+utO2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YmfXcCsXN4o/FIs6g/+CLsFE+z5Gk+zVqU5lRRDjHWg=;
 b=CuYgENGAZQjzZ7/DRECJQX15n0c60W+mXz2ZJqUivfnCwB5SSCE8nH7yNbETYpCVNuzSrRVH6EHHVmUO3GAfv3dIoZteUUJSpSIJbzylCzTCDXQZPGGOS+mKoEmoPkIR8mjAGugIu0O7/apCAOMWRup0bp05RmLJmwxtYzkmGAFuyads0VcPyyuP6fGKWWPEKvXFH3BbZoOjis/IH7MUWl7Wlny+3i/PkeA6W9srPBa0FcYf+zfvAVjQtPcWcgRSoF5gcwy42w0ie+JDQez3jv2nuNgN25ir8wUArcBXEBWsNMzdbULq6HCtFplVDWYpJl9ufeuIxDhni5Kd7pGgkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YmfXcCsXN4o/FIs6g/+CLsFE+z5Gk+zVqU5lRRDjHWg=;
 b=ISGIk1cV5PUsvhlnaesV3TqYm6z7oDWLHbbQYXqEsgkLg0a0MfKu2zC5D/n8HA4WyGNXZxw44E/oDbOzj9cZ2UN7yKz3M0vwtYz1lFXri0T+zp/6HIQOPq+q6OM+5mrteC+yJBhVmDMoyKh2egfX3CxHwAcy5Kspu/ls2VKGdhiIgVcOyA81kvnPVzhP5t9MiPNFkvBHwahE2WF80cFwvm2iQnOBrHVtKTTcijBtKZi8AvIGM8qxCA+GTh5RW3QzIw8d04dg40jtZSfZr5MB3uNlHBRy0hvSzMTwu0NQR0R3cBmLmeP0JfVzQG6p3pf4f2QWyXPJUyvU5/nwbn6Syw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5907.apcprd06.prod.outlook.com (2603:1096:400:339::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.34; Fri, 7 Apr
 2023 17:46:20 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c%6]) with mapi id 15.20.6277.031; Fri, 7 Apr 2023
 17:46:20 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>
Date: Sat,  8 Apr 2023 01:46:07 +0800
Message-Id: <20230407174609.4939-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR02CA0127.apcprd02.prod.outlook.com
 (2603:1096:4:188::7) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB5907:EE_
X-MS-Office365-Filtering-Correlation-Id: 459fd702-c2d6-455b-5d8a-08db378ffeec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5L2STOmviU+Uv7IrYdfq63X6/pGmGFWxRvZzSdVK8XDw8WYdXBIvrIGuLLMWHzmcX3RVERnFaJP7CLrjqPgWDLWgvvqyx37XgyfA4DIZpmLMuDyqdUG8JZ6Rn9+CQgUPG6ClGWNRLa9A+cKWO0Ao0RSSr9L4oADh8svONoPLkd5duN23BZpRLrt5UHngMSx6++zn7jlxAOs0jAzMuNcfEvxqHt3i/wEJKaQjcGyE1ev3Q0tbDw8n2lm4a7WRlwGZvLP3+o55CAsGU+fAnY8Sv7VCqO90d0OsfqMHAYW3Ax8DR5VgnU7cUwIWyKWnP+eST6jfnvQiwkqsYU1wjBs5New0kgo8KGFYBhR1MB5/7gbykaAxWaDhlbxpREjEe5iArsIWQqIxeJSlqodn3C8N5PFudbX3Pum+W1tP1XGHl7YgrPqWfWIelysJGABcatbymTwLDx7GAJL5AYxVCrp3UuC8lQF1+412vzLvP4ICrZMTrGPDd7t9DP4gar68TjG1gudCfLR8E6Wicw8Y6pc5I2UUJM3c+/SR+50s9i5TKUzGQrUZjLIzZzRGFm0CXwvqNFokY5mkVKp3BU6P8pSlF1/kn7AVJPFjT4Q6xZyLA2d2wHR58fWn46bVFWQYumGg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199021)(38100700002)(38350700002)(36756003)(6506007)(110136005)(8676002)(26005)(186003)(5660300002)(6512007)(1076003)(8936002)(2906002)(4326008)(66476007)(66946007)(316002)(52116002)(66556008)(6486002)(478600001)(30864003)(6666004)(86362001)(41300700001)(83380400001)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZX2Fa1KrSpm6cxzMX78hr5/s/P78d479YF/uMGAsb4QiX5JIB2P7RHRAgxpC?=
 =?us-ascii?Q?JvCQk7AN6dBDJR5pqPzzXsxWZRjZi53BIFJDWl2w5U/0gBknpM34rTDbk2UH?=
 =?us-ascii?Q?J8HTPpJHsEnx1wwHSFiXTII3e9EfGPR0fhhBJJbflEz1PRbh0ohLr28ZL3/l?=
 =?us-ascii?Q?ga/0g7VWk7xJCrNdnz6vUCsCYeCshRUy2V5wyAyBVBFyJekPjHWgYsBDf9HZ?=
 =?us-ascii?Q?7NVQpfxmCYt7NfTDDefjteJIE2GWiHngGq55KTHXUWoB7ZVYog6bjmULRYoF?=
 =?us-ascii?Q?fGpYIaUoGAzsyN24YhyC9i4P3MxJsF7v1hdhQqxmG5gN2U77fEmL9+8r1wNE?=
 =?us-ascii?Q?QnxdfDjex/7ctGkJG7EVYNit2RkILEOlfVruTwFGF6/LBE3mdfmJfPXut/H0?=
 =?us-ascii?Q?Mo0zEtfOto2KBfbuoschn28JDl/kHb9DzOHw+FljhYP8eRZ9crQvdxurz5gi?=
 =?us-ascii?Q?yOB9bsHtnRS+YM/iLMEifOjAI2XOyKw9SK0JFpXQ254+dZ+AQ1l4hRx5y2y+?=
 =?us-ascii?Q?Py0bDe+rJExEGJD2QXAUQyW36169RLmKdg5WcT8Ba7ceHe2xzc0fiN1sHh6u?=
 =?us-ascii?Q?Jx1H5iXrubo1x6yk3wxsP5YpKKLACrgFfWPaqT7EdpQSZlrnbSR4reZ3K7WA?=
 =?us-ascii?Q?Zff5ZnhD/T72MMs7eZyBnJ0nfqra5KcTwmgMXyLJml1d8wG1QbUaT4Vs/Pb4?=
 =?us-ascii?Q?7K4SJwcQ5dFZmlkhXTJODeJQAPBVZ7WbCtMELpyBE4G9uEWrp8T7g1AZdyDs?=
 =?us-ascii?Q?n++EFtWb2QX5LXEI0/FL0fAeUy+Q2tYQ4qKtusDADfLLFE8KkLPPD9+WD5nG?=
 =?us-ascii?Q?mDOBrzVXCuNTIooJDOhBlJza2TrAwz/qSpq7EM8MFoVozfk/zQyUqWGTmFA2?=
 =?us-ascii?Q?VyXCP7+Z3Lx/Z4w4GZPhHI0UOYbbWSRjEvLt02fqNzDIV5KrLX3CsMVJ7ynY?=
 =?us-ascii?Q?YMPY3XtsxLFIOlZ2+ef6ZuUDFVbidizUUp/JJbao495h2mhNZhDhfQVGrHUf?=
 =?us-ascii?Q?xH8Qeyyhuch8rHYclXE1LLPIeVP97/TcJ5op15k/7GS//AHPi7EHfphwjLyy?=
 =?us-ascii?Q?ywa1afSiaUSbGrbR4pDacMA9tPb2+NWVZzxGBT+euK+x2kZTvb0FvF3sdEny?=
 =?us-ascii?Q?u9kselfPgCRZ9AuGvByleROw+O0p76DxwSiqBDxhc+BdDi52oMJ8ge5Mc6dw?=
 =?us-ascii?Q?RAC5DXFiEmKZ0u2geOx7y4SXLsm4YLMBornFBar+BRyl/s3Q1BbTN6WTQfEh?=
 =?us-ascii?Q?Hev4zFDNRb4ZXWyWoVllbBsEoIiw5t9QurcepLi0Sm7d28C5MocC5zZxIqHt?=
 =?us-ascii?Q?LcrxlU2+BzyLIIXArNPw5an8u9XlNRo4hM/GNgPo6JcmI4vg6sDHE3hpAGqf?=
 =?us-ascii?Q?JlQsJe+WIND6oCjh7ahU+U8TpxkFRNqGHIHMpvK3hIfbAVH12PPR85RZY7oC?=
 =?us-ascii?Q?vTB5yDTar9C52/LkUL7NupM7w4PGFqsJz1634xRS2jzRgrgHQKSBU/31r2kl?=
 =?us-ascii?Q?UlY/hKNrfWzmPpiCk+tlP9xQQu1toAjpUkNuc/OkIPk+qG6MlFe/+rvzrUDu?=
 =?us-ascii?Q?M1b7fysVWf3djCIH+3AJ+iVQi+m1bzChxgUgFf8K?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 459fd702-c2d6-455b-5d8a-08db378ffeec
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Apr 2023 17:46:20.1806 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zSDNUC2t9h8AxYVbZFjk4jVPtL8y7WHH8JDGrynz2QaGE12cTPArgapKZd3txja7dspt63LgSteCWkkjFWLLVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5907
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The current code uses a mixture of MAX_IO_TYPE and
 NR_PAGE_TYPE
 to form lat_type, and uses a two-dimensional array to store data. NR_PAGE_TYPE
 is 3, which is unreasonable for a discard with a PAGE_TYP [...] 
 Content analysis details:   (0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.122 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.122 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.1 DKIM_INVALID           DKIM or DK signature exists, but is not valid
X-Headers-End: 1pkqAP-000LV9-QL
Subject: [f2fs-dev] [PATCH v4 1/2] f2fs: refactor struct iostat_lat_info
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
 linux-trace-kernel@vger.kernel.org, Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The current code uses a mixture of MAX_IO_TYPE and NR_PAGE_TYPE
to form lat_type, and uses a two-dimensional array to store data.
NR_PAGE_TYPE is 3, which is unreasonable for a discard with a
PAGE_TYPE of 1. So this patch changes the array to a 1D array and
does some cleanup.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/data.c              |  2 +-
 fs/f2fs/iostat.c            | 79 +++++++++++++++++++++----------------
 fs/f2fs/iostat.h            | 49 +++++++++++------------
 include/trace/events/f2fs.h | 56 +++++++++++++-------------
 4 files changed, 97 insertions(+), 89 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index e975f9c702ab..38cab984496f 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2311,7 +2311,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 		if (bio_add_page(bio, page, blocksize, 0) < blocksize)
 			goto submit_and_realloc;
 
-		ctx = get_post_read_ctx(bio);
+		ctx = iostat_get_bio_private(bio);
 		ctx->enabled_steps |= STEP_DECOMPRESS;
 		refcount_inc(&dic->refcnt);
 
diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
index 3d5bfb1ad585..5d496d5b70d3 100644
--- a/fs/f2fs/iostat.c
+++ b/fs/f2fs/iostat.c
@@ -86,23 +86,21 @@ int __maybe_unused iostat_info_seq_show(struct seq_file *seq, void *offset)
 
 static inline void __record_iostat_latency(struct f2fs_sb_info *sbi)
 {
-	int io, idx;
-	struct f2fs_iostat_latency iostat_lat[MAX_IO_TYPE][NR_PAGE_TYPE];
+	struct f2fs_iostat_latency iostat_lat[MAX_LAT_TYPE];
 	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
+	unsigned int lat_type;
 	unsigned long flags;
 
 	spin_lock_irqsave(&sbi->iostat_lat_lock, flags);
-	for (idx = 0; idx < MAX_IO_TYPE; idx++) {
-		for (io = 0; io < NR_PAGE_TYPE; io++) {
-			iostat_lat[idx][io].peak_lat =
-			   jiffies_to_msecs(io_lat->peak_lat[idx][io]);
-			iostat_lat[idx][io].cnt = io_lat->bio_cnt[idx][io];
-			iostat_lat[idx][io].avg_lat = iostat_lat[idx][io].cnt ?
-			   jiffies_to_msecs(io_lat->sum_lat[idx][io]) / iostat_lat[idx][io].cnt : 0;
-			io_lat->sum_lat[idx][io] = 0;
-			io_lat->peak_lat[idx][io] = 0;
-			io_lat->bio_cnt[idx][io] = 0;
-		}
+	for (lat_type = 0; lat_type < MAX_LAT_TYPE; lat_type++) {
+		iostat_lat[lat_type].peak_lat =
+		   jiffies_to_msecs(io_lat->peak_lat[lat_type]);
+		iostat_lat[lat_type].cnt = io_lat->bio_cnt[lat_type];
+		iostat_lat[lat_type].avg_lat = iostat_lat[lat_type].cnt ?
+		   jiffies_to_msecs(io_lat->sum_lat[lat_type]) / iostat_lat[lat_type].cnt : 0;
+		io_lat->sum_lat[lat_type] = 0;
+		io_lat->peak_lat[lat_type] = 0;
+		io_lat->bio_cnt[lat_type] = 0;
 	}
 	spin_unlock_irqrestore(&sbi->iostat_lat_lock, flags);
 
@@ -208,62 +206,73 @@ void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
 	f2fs_record_iostat(sbi);
 }
 
-static inline void __update_iostat_latency(struct bio_iostat_ctx *iostat_ctx,
-				enum iostat_lat_type lat_type)
+static inline void __update_iostat_latency(struct bio_iostat_ctx *iostat_ctx)
 {
-	unsigned long ts_diff;
-	unsigned int page_type = iostat_ctx->type;
 	struct f2fs_sb_info *sbi = iostat_ctx->sbi;
 	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
+	unsigned int lat_type = iostat_ctx->lat_type;
+	unsigned long ts_diff;
 	unsigned long flags;
 
 	if (!sbi->iostat_enable)
 		return;
 
-	ts_diff = jiffies - iostat_ctx->submit_ts;
-	if (page_type == META_FLUSH) {
-		page_type = META;
-	} else if (page_type >= NR_PAGE_TYPE) {
-		f2fs_warn(sbi, "%s: %d over NR_PAGE_TYPE", __func__, page_type);
+	if (lat_type >= MAX_LAT_TYPE) {
+		f2fs_warn(sbi, "%s: %d over MAX_LAT_TYPE", __func__, lat_type);
 		return;
 	}
+	ts_diff = jiffies - iostat_ctx->submit_ts;
 
 	spin_lock_irqsave(&sbi->iostat_lat_lock, flags);
-	io_lat->sum_lat[lat_type][page_type] += ts_diff;
-	io_lat->bio_cnt[lat_type][page_type]++;
-	if (ts_diff > io_lat->peak_lat[lat_type][page_type])
-		io_lat->peak_lat[lat_type][page_type] = ts_diff;
+	io_lat->sum_lat[lat_type] += ts_diff;
+	io_lat->bio_cnt[lat_type]++;
+	if (ts_diff > io_lat->peak_lat[lat_type])
+		io_lat->peak_lat[lat_type] = ts_diff;
 	spin_unlock_irqrestore(&sbi->iostat_lat_lock, flags);
 }
 
 void iostat_update_and_unbind_ctx(struct bio *bio)
+{
+	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
+
+	if (op_is_write(bio_op(bio)))
+		bio->bi_private = iostat_ctx->sbi;
+	else
+		bio->bi_private = iostat_ctx->iostat_private;
+
+	__update_iostat_latency(iostat_ctx);
+	mempool_free(iostat_ctx, bio_iostat_ctx_pool);
+}
+
+void iostat_update_submit_ctx(struct bio *bio, enum page_type type)
 {
 	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
 	enum iostat_lat_type lat_type;
 
+	iostat_ctx->submit_ts = jiffies;
+
 	if (op_is_write(bio_op(bio))) {
 		lat_type = bio->bi_opf & REQ_SYNC ?
-				WRITE_SYNC_IO : WRITE_ASYNC_IO;
-		bio->bi_private = iostat_ctx->sbi;
+				WRITE_SYNC_DATA_LAT : WRITE_ASYNC_DATA_LAT;
+		lat_type = (enum iostat_lat_type)(lat_type + type);
 	} else {
-		lat_type = READ_IO;
-		bio->bi_private = iostat_ctx->post_read_ctx;
+		lat_type = READ_DATA_LAT;
+		lat_type = (enum iostat_lat_type)(lat_type + type);
 	}
 
-	__update_iostat_latency(iostat_ctx, lat_type);
-	mempool_free(iostat_ctx, bio_iostat_ctx_pool);
+	iostat_ctx->lat_type = lat_type;
 }
 
 void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
-		struct bio *bio, struct bio_post_read_ctx *ctx)
+		struct bio *bio, void *private)
 {
 	struct bio_iostat_ctx *iostat_ctx;
 	/* Due to the mempool, this never fails. */
 	iostat_ctx = mempool_alloc(bio_iostat_ctx_pool, GFP_NOFS);
 	iostat_ctx->sbi = sbi;
 	iostat_ctx->submit_ts = 0;
-	iostat_ctx->type = 0;
-	iostat_ctx->post_read_ctx = ctx;
+	iostat_ctx->lat_type = 0;
+	iostat_ctx->iostat_private = private;
 	bio->bi_private = iostat_ctx;
 }
 
diff --git a/fs/f2fs/iostat.h b/fs/f2fs/iostat.h
index eb99d05cf272..67b468691498 100644
--- a/fs/f2fs/iostat.h
+++ b/fs/f2fs/iostat.h
@@ -6,17 +6,24 @@
 #ifndef __F2FS_IOSTAT_H__
 #define __F2FS_IOSTAT_H__
 
+#ifdef CONFIG_F2FS_IOSTAT
+
 struct bio_post_read_ctx;
 
 enum iostat_lat_type {
-	READ_IO = 0,
-	WRITE_SYNC_IO,
-	WRITE_ASYNC_IO,
-	MAX_IO_TYPE,
+	READ_DATA_LAT = 0,
+	READ_NODE_LAT,
+	READ_META_LAT,
+	WRITE_SYNC_DATA_LAT,
+	WRITE_SYNC_NODE_LAT,
+	WRITE_SYNC_META_LAT,
+	WRITE_ASYNC_DATA_LAT,
+	WRITE_ASYNC_NODE_LAT,
+	WRITE_ASYNC_META_LAT,
+	DISCARD_LAT,
+	MAX_LAT_TYPE,
 };
 
-#ifdef CONFIG_F2FS_IOSTAT
-
 #define NUM_PREALLOC_IOSTAT_CTXS	128
 #define DEFAULT_IOSTAT_PERIOD_MS	3000
 #define MIN_IOSTAT_PERIOD_MS		100
@@ -24,9 +31,9 @@ enum iostat_lat_type {
 #define MAX_IOSTAT_PERIOD_MS		8640000
 
 struct iostat_lat_info {
-	unsigned long sum_lat[MAX_IO_TYPE][NR_PAGE_TYPE];	/* sum of io latencies */
-	unsigned long peak_lat[MAX_IO_TYPE][NR_PAGE_TYPE];	/* peak io latency */
-	unsigned int bio_cnt[MAX_IO_TYPE][NR_PAGE_TYPE];	/* bio count */
+	unsigned long sum_lat[MAX_LAT_TYPE];	/* sum of io latencies */
+	unsigned long peak_lat[MAX_LAT_TYPE];	/* peak io latency */
+	unsigned int bio_cnt[MAX_LAT_TYPE];	/* bio count */
 };
 
 extern int __maybe_unused iostat_info_seq_show(struct seq_file *seq,
@@ -38,29 +45,21 @@ extern void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
 struct bio_iostat_ctx {
 	struct f2fs_sb_info *sbi;
 	unsigned long submit_ts;
-	enum page_type type;
-	struct bio_post_read_ctx *post_read_ctx;
+	enum iostat_lat_type lat_type;
+	void *iostat_private;
 };
 
-static inline void iostat_update_submit_ctx(struct bio *bio,
-			enum page_type type)
-{
-	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
-
-	iostat_ctx->submit_ts = jiffies;
-	iostat_ctx->type = type;
-}
-
-static inline struct bio_post_read_ctx *get_post_read_ctx(struct bio *bio)
+static inline struct bio_post_read_ctx *iostat_get_bio_private(struct bio *bio)
 {
 	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
 
-	return iostat_ctx->post_read_ctx;
+	return iostat_ctx->iostat_private;
 }
 
+extern void iostat_update_submit_ctx(struct bio *bio, enum page_type type);
 extern void iostat_update_and_unbind_ctx(struct bio *bio);
 extern void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
-		struct bio *bio, struct bio_post_read_ctx *ctx);
+		struct bio *bio, void *private);
 extern int f2fs_init_iostat_processing(void);
 extern void f2fs_destroy_iostat_processing(void);
 extern int f2fs_init_iostat(struct f2fs_sb_info *sbi);
@@ -70,10 +69,10 @@ static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *in
 		enum iostat_type type, unsigned long long io_bytes) {}
 static inline void iostat_update_and_unbind_ctx(struct bio *bio) {}
 static inline void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
-		struct bio *bio, struct bio_post_read_ctx *ctx) {}
+		struct bio *bio, void *private) {}
 static inline void iostat_update_submit_ctx(struct bio *bio,
 		enum page_type type) {}
-static inline struct bio_post_read_ctx *get_post_read_ctx(struct bio *bio)
+static inline struct bio_post_read_ctx *iostat_get_bio_private(struct bio *bio)
 {
 	return bio->bi_private;
 }
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 99cbc5949e3c..040a430e1199 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -2045,7 +2045,7 @@ struct f2fs_iostat_latency {
 
 TRACE_EVENT(f2fs_iostat_latency,
 
-	TP_PROTO(struct f2fs_sb_info *sbi, struct f2fs_iostat_latency (*iostat_lat)[NR_PAGE_TYPE]),
+	TP_PROTO(struct f2fs_sb_info *sbi, struct f2fs_iostat_latency *iostat_lat),
 
 	TP_ARGS(sbi, iostat_lat),
 
@@ -2082,33 +2082,33 @@ TRACE_EVENT(f2fs_iostat_latency,
 
 	TP_fast_assign(
 		__entry->dev		= sbi->sb->s_dev;
-		__entry->d_rd_peak	= iostat_lat[READ_IO][DATA].peak_lat;
-		__entry->d_rd_avg	= iostat_lat[READ_IO][DATA].avg_lat;
-		__entry->d_rd_cnt	= iostat_lat[READ_IO][DATA].cnt;
-		__entry->n_rd_peak	= iostat_lat[READ_IO][NODE].peak_lat;
-		__entry->n_rd_avg	= iostat_lat[READ_IO][NODE].avg_lat;
-		__entry->n_rd_cnt	= iostat_lat[READ_IO][NODE].cnt;
-		__entry->m_rd_peak	= iostat_lat[READ_IO][META].peak_lat;
-		__entry->m_rd_avg	= iostat_lat[READ_IO][META].avg_lat;
-		__entry->m_rd_cnt	= iostat_lat[READ_IO][META].cnt;
-		__entry->d_wr_s_peak	= iostat_lat[WRITE_SYNC_IO][DATA].peak_lat;
-		__entry->d_wr_s_avg	= iostat_lat[WRITE_SYNC_IO][DATA].avg_lat;
-		__entry->d_wr_s_cnt	= iostat_lat[WRITE_SYNC_IO][DATA].cnt;
-		__entry->n_wr_s_peak	= iostat_lat[WRITE_SYNC_IO][NODE].peak_lat;
-		__entry->n_wr_s_avg	= iostat_lat[WRITE_SYNC_IO][NODE].avg_lat;
-		__entry->n_wr_s_cnt	= iostat_lat[WRITE_SYNC_IO][NODE].cnt;
-		__entry->m_wr_s_peak	= iostat_lat[WRITE_SYNC_IO][META].peak_lat;
-		__entry->m_wr_s_avg	= iostat_lat[WRITE_SYNC_IO][META].avg_lat;
-		__entry->m_wr_s_cnt	= iostat_lat[WRITE_SYNC_IO][META].cnt;
-		__entry->d_wr_as_peak	= iostat_lat[WRITE_ASYNC_IO][DATA].peak_lat;
-		__entry->d_wr_as_avg	= iostat_lat[WRITE_ASYNC_IO][DATA].avg_lat;
-		__entry->d_wr_as_cnt	= iostat_lat[WRITE_ASYNC_IO][DATA].cnt;
-		__entry->n_wr_as_peak	= iostat_lat[WRITE_ASYNC_IO][NODE].peak_lat;
-		__entry->n_wr_as_avg	= iostat_lat[WRITE_ASYNC_IO][NODE].avg_lat;
-		__entry->n_wr_as_cnt	= iostat_lat[WRITE_ASYNC_IO][NODE].cnt;
-		__entry->m_wr_as_peak	= iostat_lat[WRITE_ASYNC_IO][META].peak_lat;
-		__entry->m_wr_as_avg	= iostat_lat[WRITE_ASYNC_IO][META].avg_lat;
-		__entry->m_wr_as_cnt	= iostat_lat[WRITE_ASYNC_IO][META].cnt;
+		__entry->d_rd_peak	= iostat_lat[READ_DATA_LAT].peak_lat;
+		__entry->d_rd_avg	= iostat_lat[READ_DATA_LAT].avg_lat;
+		__entry->d_rd_cnt	= iostat_lat[READ_DATA_LAT].cnt;
+		__entry->n_rd_peak	= iostat_lat[READ_NODE_LAT].peak_lat;
+		__entry->n_rd_avg	= iostat_lat[READ_NODE_LAT].avg_lat;
+		__entry->n_rd_cnt	= iostat_lat[READ_NODE_LAT].cnt;
+		__entry->m_rd_peak	= iostat_lat[READ_META_LAT].peak_lat;
+		__entry->m_rd_avg	= iostat_lat[READ_META_LAT].avg_lat;
+		__entry->m_rd_cnt	= iostat_lat[READ_META_LAT].cnt;
+		__entry->d_wr_s_peak	= iostat_lat[WRITE_SYNC_DATA_LAT].peak_lat;
+		__entry->d_wr_s_avg	= iostat_lat[WRITE_SYNC_DATA_LAT].avg_lat;
+		__entry->d_wr_s_cnt	= iostat_lat[WRITE_SYNC_DATA_LAT].cnt;
+		__entry->n_wr_s_peak	= iostat_lat[WRITE_SYNC_NODE_LAT].peak_lat;
+		__entry->n_wr_s_avg	= iostat_lat[WRITE_SYNC_NODE_LAT].avg_lat;
+		__entry->n_wr_s_cnt	= iostat_lat[WRITE_SYNC_NODE_LAT].cnt;
+		__entry->m_wr_s_peak	= iostat_lat[WRITE_SYNC_META_LAT].peak_lat;
+		__entry->m_wr_s_avg	= iostat_lat[WRITE_SYNC_META_LAT].avg_lat;
+		__entry->m_wr_s_cnt	= iostat_lat[WRITE_SYNC_META_LAT].cnt;
+		__entry->d_wr_as_peak	= iostat_lat[WRITE_ASYNC_DATA_LAT].peak_lat;
+		__entry->d_wr_as_avg	= iostat_lat[WRITE_ASYNC_DATA_LAT].avg_lat;
+		__entry->d_wr_as_cnt	= iostat_lat[WRITE_ASYNC_DATA_LAT].cnt;
+		__entry->n_wr_as_peak	= iostat_lat[WRITE_ASYNC_NODE_LAT].peak_lat;
+		__entry->n_wr_as_avg	= iostat_lat[WRITE_ASYNC_NODE_LAT].avg_lat;
+		__entry->n_wr_as_cnt	= iostat_lat[WRITE_ASYNC_NODE_LAT].cnt;
+		__entry->m_wr_as_peak	= iostat_lat[WRITE_ASYNC_META_LAT].peak_lat;
+		__entry->m_wr_as_avg	= iostat_lat[WRITE_ASYNC_META_LAT].avg_lat;
+		__entry->m_wr_as_cnt	= iostat_lat[WRITE_ASYNC_META_LAT].cnt;
 	),
 
 	TP_printk("dev = (%d,%d), "
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
