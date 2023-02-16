Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 240BA699C79
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Feb 2023 19:39:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pSjAT-0007Xi-Dt;
	Thu, 16 Feb 2023 18:39:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pSjAQ-0007Xb-AI
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Feb 2023 18:39:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PFbjTKmo/pXL2nDjChjaX+2/rnMGgJB5qneLMNYpgrw=; b=ARmb+j2viSM9hIkYwnMvVl/3vV
 BDcGITScj5/XU/oeLquOFczPJNKgbkH1wcaHsI8LvC3z15EyhhNLoB8g1FT6rKLdMaRnRzM5hPQGc
 cixXmSWa5I71NabbiCgcX5hdcfydcWrcOA472a5uAMPv5kSzJtEmDbZ2SJpmbDGC+yJ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PFbjTKmo/pXL2nDjChjaX+2/rnMGgJB5qneLMNYpgrw=; b=I
 UToiN9pfQgffxem1o0BO6Yr2DJAovysyVtKjtY0MVPkv9qjqbJSusx/Qs871F2bWM9bmfzd4TArLe
 8nPkIf+RzVLuuPAKLgT9eTuRNAXKCw9nOKjGmExELvlDA8z9CPMMXF0ln6xWLtaT9fJsUZR3iiNjz
 duGsodNx7jkC0o+M=;
Received: from mail-sgaapc01on2109.outbound.protection.outlook.com
 ([40.107.215.109] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pSjAG-0002BS-4D for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Feb 2023 18:39:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gbqNyrGtNr9dpUsEsjEDZXEU4PkdIDamw9oheHca6Q0C1FyLrG0EFvf1AWL16MQ6cyWcWbm8DHI0wW9DvPcb9VJTHCnuWmwmY1zJ9jJ9VigW38m26tR2HCvxutfMyvFEAxVtnkTYUcKUvbY8tJzXqThvD5GDWLrv1K9DhoHDO+vvi9FKjvQYzZ4kBP56iRMiR5suu9nRqt2xVOJfj4J3zAyjna/m7tBc7t/I+Ed2es//eUzPkJrX1A9G3E/pMWrUhr1ZMvSu2vNEOfgbg4itYUS9sOqh1NeAiIAlBu/cKPq9uM9LPA5e3TFUcv/fLzCGkwyBOZ9OJmexpgJi47fQ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PFbjTKmo/pXL2nDjChjaX+2/rnMGgJB5qneLMNYpgrw=;
 b=FQb+NM9nYQ1JrqvyfX0uDPQ5y3JsVN0CMnG7BWi5+Pn7TlB/EVi5HjjQs/jD3cdffGhpUpxEn+3eBWiF2GP7sxU+cCmH/SxcgTqHhHrtg4jLKHh6M13nyIg2fdNeVBMmGYqAiXjiLYOkHxYIxBeEXMI1DpOK2vEVC/mJRW40+swrjpSEax6Sv9anXFNepPZcSe5sl0xY6JrwgAfQi1MU4gx/DBfOVb0uL2Htt0vF/SWJRI9tcHEknUBbTDazZQBbzsZTv/CEUQ9H+eTvRbtxQUqb1MYRhRPPdzGOjGDH97c9U33pI2+LoLBi01C8f55RdnchP+PjAqKsnsNdDTaGSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PFbjTKmo/pXL2nDjChjaX+2/rnMGgJB5qneLMNYpgrw=;
 b=QrNuFm3Z/Pdk2l7eThx8laIgCODXCDaFTBcLXCs+3dGLoNBkFQYXKORuHJHBqGMHwAo8s7UrYQUCjl4x6G+y6aX1Pgj0iRnfGI3drNMOAIURf1m90Wtco1orW6mefrhYQ8MAl9Hfw6WqTgh93fdnWSJmCN6Sr4R33WzzE3OCzywefJ78uHWFtoOmdKYFf4ZJTFCI4oFlVE6XobOmn+cgnHwa4+IPxqOzC2+cnob0op3YDx1irhfRzhgUhDNMcncEQG29uZBNnJxLuFi8s6TWjCutphfBRF8kujRmz56sqhEhCmRdoXLpxtkwqD0LJ2eO/wiYrkPFm+s35obyyOJq/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by SEZPR06MB5389.apcprd06.prod.outlook.com (2603:1096:101:64::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12; Thu, 16 Feb
 2023 18:39:16 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::a2c6:4a08:7779:5190]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::a2c6:4a08:7779:5190%3]) with mapi id 15.20.6111.009; Thu, 16 Feb 2023
 18:39:16 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 17 Feb 2023 02:39:06 +0800
Message-Id: <20230216183906.54541-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR04CA0011.apcprd04.prod.outlook.com
 (2603:1096:4:197::10) To TYZPR06MB5275.apcprd06.prod.outlook.com
 (2603:1096:400:1f5::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5275:EE_|SEZPR06MB5389:EE_
X-MS-Office365-Filtering-Correlation-Id: 82059615-09be-4c13-8cd5-08db104d1b58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4zrlI9R+KI8sJ6QlFwClOiVqPrEsbxfW36f8cQY1Cq1ZTt/oP0HIAhLhGmWvK7119ZnSiwFju8iPNUtpGT7b0dRXuTEYHdxt7XMWjXGoi8ZmXpTOTXnNfjgwXjhuoNBIg6VWMqk7oSxbVnkP4kCemfCVDwz5QgbvcbDXZDn17BbV0VzlpPU9oNxggd2PThjuQu+kz7TqeAsrJQgzDl+F91W69mq+FSbjhedrGqU+9qLaTzNWqeovnExx3y6TJXvVBggMzA0Y9fI76vqUXUkH95QAIC/tlSC45NTODpfZSo+R2k9kzn00gEhzostyXnJJ3lVB5HyiRfyv0HASH8XTMiptLD/Kyjy7/ywEDKtz9B+ro5BiczmlnZgd/vZl0lIv61XWwe05AtwZzo5klj+AWBiwpRaEfEW5eDSQLd2b2owKE21gL7Qnt7souC0rdfB5YyJrYNDQD2y5PzjtGI92JiG1DqWntlNOcSd+eNZQnlURs3XAbQtpBXnqzwki4VUBtsAJDZFYgUXmmA5mHrI+a58YrTiFyV9BP5T/c021urQ/PMOpz6jfJBOrieEN//OBuNVZZakKWIHP5JO+TPfY2WucLpQx0UVTVQtulQh9plb2L/KPaVeKlmqlbavgeoD1VTto+Xjj6K4TbUrfsklJOLb97avNGItfnWHNCPFrkGlx+wZz7Ii3ocZVuf9sF2+nUS+1Ok8u6KPnYQqzmCNtzw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB5275.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(366004)(136003)(396003)(376002)(346002)(451199018)(36756003)(86362001)(4326008)(66476007)(66556008)(66946007)(8676002)(38100700002)(38350700002)(2616005)(186003)(52116002)(6486002)(478600001)(6512007)(26005)(6666004)(8936002)(6506007)(1076003)(4744005)(316002)(5660300002)(2906002)(107886003)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0MfCrvn0wf6tQGrgiCiLiHRp8jQajnCFbFYxgrt/TsVpsBHBIP9DVRKJsFAt?=
 =?us-ascii?Q?5VlEWpnea+MzgZmFLf6zebc9FAG70mtWpAMDB0M6MJZNbZHuaApMx6fWwW7N?=
 =?us-ascii?Q?Nfvi1qE/DPEitr7lcAMKoUYHL8z62Kc0+73GHpWpCH2qP+ZJ+PqO4oxH5jKT?=
 =?us-ascii?Q?MKybwX1BdxZujPguSey/y8KID1lOWOMHfn3pN5MtizbO0L6s7Qv7psPQ8RKW?=
 =?us-ascii?Q?+TVbCUF6WdFif9o+P8nVcCkJXhSCTYumovEpo+I6xcnGgt9P1+yaP1k8Lkmv?=
 =?us-ascii?Q?8Oktx+jmGPXxWzD1mxP6n4R9Bl9l2h9JKSkef1dE7GCf6MD1Gp3I0YwP9dxW?=
 =?us-ascii?Q?aSdjCQQ+1A8ndP+34jd/DlaCdt4MVGVepBNFCcJbFgtQTo43Bw+1SDVAhptP?=
 =?us-ascii?Q?qxjHM41eCO48U16SJVLSEBByqjOO2798mSOW/KBI1RH+wyLBMt5yt42JlLVm?=
 =?us-ascii?Q?p6yMeFYHGFP/rs44HyBDovGrnjrO04AcR1Eg7wYc7BsRN9dvqmSNiM7oBc1Q?=
 =?us-ascii?Q?LGanC5GtsWaQfdOQypIXbWFfq+IPG4RorZra9s1axlX/MIAURuigbUmDk6KV?=
 =?us-ascii?Q?8EETD7WCkyHfIrqY+okBMzWNG7/UalctO2Cqmq/BBuzSdZGJp4SvHlpPef8X?=
 =?us-ascii?Q?9OwfliZCfWRkGbhhnID04QTxqJAqTGC8FbXjzR8UfM7e89x69Pof2pM6jul/?=
 =?us-ascii?Q?gZG7GgBMEEqKcQshIM4fHi/yA3qarfXz0469PGeXNziKsik8CWL+XcGIk1V/?=
 =?us-ascii?Q?stBEt69pTcNC9J6qAzc1hLpDzKeL0xiz84Ij9dLiu7db84wL0LfbZ12KkKrM?=
 =?us-ascii?Q?44CaqueAkG8s+Gqg7BRJlxm71fW829zBEMPq7yp5VQTHMfJwhE+4RRTvQYrZ?=
 =?us-ascii?Q?0HY0RUnzOKS/JPFkNIeRCZVXH9T6bV+CZrLToE9gnodQKV16aFTNs3j8/dhW?=
 =?us-ascii?Q?fTnmKNgnWsGj2NWJ6QUf/6HiSarnLJtXRsLEh+wTLPEP5Viqn4MVs17PKnXu?=
 =?us-ascii?Q?zYuktgMlkqrY/UDYf9uXK7aT4feO7BNDZBDxxpTcjuUh0NSRv8Nv0qgHdnCS?=
 =?us-ascii?Q?cuBy/kzOwcNEyQxU9VgvVV/0hKbcMsexYGM02zZ+i6Vx3zQedhBJ3kQmD/24?=
 =?us-ascii?Q?PV8u951hIM76qPqoiR3cMFRNXx8ZwWOXRobwa0O9wXliqAFMt5ifDQfzr6ko?=
 =?us-ascii?Q?Fcu5dDoWUwmTR4mIAocTciqbXO+fTSw+eoJPjBFMT3mLOUXoH0o7NH5tZ+gN?=
 =?us-ascii?Q?D6rLQAOS+UgCabcGzzBfUxrOY99qXRTrQ+SeRdQzkLO/Nt0flDK9PK59duY8?=
 =?us-ascii?Q?HAf8d1FiufsqCG9cnkBsWzoA06P8unM2TJHJ+dpiadSYbWGLVK3dH7NGmA9n?=
 =?us-ascii?Q?nZbRNvPT8uNDkO44EJo0Zv3I2aMaGzHgI+Jl57JwLgUAiDeiIgEln6fCP8Q3?=
 =?us-ascii?Q?35aor42cVh4q/x2VM30RX9uruL1c1uideamLLlxCptmdahcM/3qQJtFNOLhK?=
 =?us-ascii?Q?H1DR0L4akVoTa7+WEYKTRmPG9IJ2+LnIn5pVTnvRKvyhW6YuHzOfuzYY6qXq?=
 =?us-ascii?Q?pwIyOB3n4W0h/YIiADKgA4hkaF19s80WKibSTGt3?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82059615-09be-4c13-8cd5-08db104d1b58
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 18:39:16.2715 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YnoAbyx4WbxFtkXtAjkffVerugHwfFnx1JMsvJ+DMvxB9Gv4dWHs+gdcgcbPcPTUWwIQ4dVMKCRuE4yQ7skz6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5389
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The SBI_NEED_FSCK flag usually means that the data in the
 file system is abnormal,
 and the fsck tool needs to be used. When CONFIG_F2FS_CHECK_FS
 is enabled, let us trigger bug_on at the first moment w [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.109 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.109 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1pSjAG-0002BS-4D
Subject: [f2fs-dev] [PATCH] f2fs: bugon w/ SBI_NEED_FSCK when has
 CONFIG_F2FS_CHECK_FS
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

The SBI_NEED_FSCK flag usually means that the data in the
file system is abnormal, and the fsck tool needs to be used.
When CONFIG_F2FS_CHECK_FS is enabled, let us trigger bug_on
at the first moment when SBI_NEED_FSCK is set, so as to
analyze the first scene.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/f2fs.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 21596e0266ba..055bb7246a1f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2074,6 +2074,9 @@ static inline bool is_sbi_flag_set(struct f2fs_sb_info *sbi, unsigned int type)
 
 static inline void set_sbi_flag(struct f2fs_sb_info *sbi, unsigned int type)
 {
+#ifdef CONFIG_F2FS_CHECK_FS
+	f2fs_bug_on(sbi, type == SBI_NEED_FSCK);
+#endif
 	set_bit(type, &sbi->s_flag);
 }
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
