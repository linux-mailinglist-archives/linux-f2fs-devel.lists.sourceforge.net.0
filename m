Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A3A26EE58D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Apr 2023 18:19:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1prLO9-00023f-17;
	Tue, 25 Apr 2023 16:19:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1prLO6-00023Y-Lc
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Apr 2023 16:19:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4aKy1TlcGPQwMdON24yt4sjb5Kdk0aOqocrHu86zll8=; b=Gp+DskdsiB0VksZVXlep8Teqc8
 UP+Nev1kzTsp5DKS6/LGTBzUT+J7fqllYWH3I/zOSOVq9LFnW269OEtPK5+K6CiwfEOdHLWLtdhBg
 MKOwQC+RGSb/L+0f9PUGtgmC/8mC/E6idlKjPOhZxkhy+Wt8YjI0ECxwP33zzZ46so4w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4aKy1TlcGPQwMdON24yt4sjb5Kdk0aOqocrHu86zll8=; b=j
 51RwSqVVlUkOMLFUAutuZE/JrcqBZ7BdvhEGsN+wmWSKlKKSFQ4icBuwG+qM27yle+Xz+bBCBLuVc
 Md/M3UzvEi2qQKCEwAQyE2xD5/J+MI7Vjhveh+iwGonqE9QyjjnVJzAreMxaQkGWkOo67pBCYXKJ5
 QeKuKgBXs9odTGUw=;
Received: from mail-sgaapc01on2097.outbound.protection.outlook.com
 ([40.107.215.97] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1prLO2-001KBn-IP for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Apr 2023 16:19:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PoI0JjdRMa6o7JGoaq6TpzioASF/EHIDaSlMEjmYtHeduZCvpfr75rDJceHRyJK2vczE2o7omE3Thnp9giYoBBFt2Fm2gOdkzpSbvJz/FwE04KiePscVEpxt+M98OHB2PH0A+TqXy6swMXRRzR34I/t2AEL6/hdwH6p4lW13BXLVe5KBO/5k5z+zqWslj8P5Jv443psw7jQDXTUzmOXA6eHGguFVN/bYBE/GvgshuLdjUpZnvo0unIDCwkBnVfAW2d89qNrNXxD/LEtxEKQuc1kckwodN8ocIRcgHMNwTCWCjE5jYmcEqGpEomiHz5zAaqTPraTE5P9V9Vtc8QrJQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4aKy1TlcGPQwMdON24yt4sjb5Kdk0aOqocrHu86zll8=;
 b=hLrspBAtIhUL3dPBMegCCXXQEUwjwvnjOBDSVZw10h7izGGsiweuaHEos5v2YrdzDIPv395I04Q7fN74PEU8YUuE0yQyJkZ32L5mltnqvl5FDHkDWHzA3lA3Z7YfKAziTpWmBem4eN7QtKqq6BvU2p/bI11n+ATKsvplquh99xfVz7G05rbMlB2u/sP/QI2LzydBpBemrrgCiZ9IEb4c4VCc5jPDIo1W9aQJoRsM7f3fLZCerhEsDEkoC7fNKQHI9k3kNdBHvC9YjWREgsJHY4CUBtVT1Zy7l4KH1ZLdlQfmmcdLkDKBj+qVOp/9tS/nk8h0qAz+1Uk2pOATrsV4mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4aKy1TlcGPQwMdON24yt4sjb5Kdk0aOqocrHu86zll8=;
 b=jnA0m25GiKqJgSKLFUK7Weab3NnUZcl+tn0MSbCUNNwJwdgarpaSKNXhHQecvFgjWf0erFWaeUfgeHzLy8sry34slQ+rERAkoHDY700PYcIUTvfLo3EMQhDgTs5+Rxa87MeKAr1LiOXBaky1z9I45vhOVwtdGxoKwzjrr4GUb36ggRxbISK6DHxaxW8Wat9n+0sjBFy7iKCRpLIJky7+5QWaRlLX7BA5kTMGmL4ikHpb8FIpPPAzYSDt/80iPM3V6bNBc6m80idWcfRYr3DMTUnsPp/eEsIDkBnoXa/ybRn0JgM7wuP0XwgpzgldWUXX9cXAwPkXZrrhJxVPD8Yg9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB5045.apcprd06.prod.outlook.com (2603:1096:101:47::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.32; Tue, 25 Apr
 2023 16:19:15 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%7]) with mapi id 15.20.6319.033; Tue, 25 Apr 2023
 16:19:15 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Wed, 26 Apr 2023 00:19:03 +0800
Message-Id: <20230425161903.6261-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SI1PR02CA0010.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::17) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEZPR06MB5045:EE_
X-MS-Office365-Filtering-Correlation-Id: 796d5ed9-50b2-4dbd-280d-08db45a8cfc7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 48KKjGzrrPA6jMznRRmQ2VQ8FHZwQmuefuKTgpZwP7POP1m7H4UPXSR0VMptM3R62ByOrE24xsPft0ikcBRQp+3XcrOlBK24zY0SG6sBBeLcjOM0oIUFS58NtVG3T7b4LgHj8lWGaeKJQtBuHFubUZ7pbGuj9aB+Ks5oiaqGx39Rcq9O+famTOeEwWbCV8Surc+W/H3TNAbpG1wOk1J6BUaMj5pckY6sTIYHy09VfWb9YNdvsd8OF/7O00yHMciw4DG8JEKTvZpPTcF/7MUKF9ZTSRjviCGiqF1mDAlJOMxXloBwe4JkEdRRkK94HbT2EgPgeZWfigENHQOMIaMBYoSfO8FIRX5Zlm0Beq0qNVsGeSuvzAx/tyFe/pc2qKwsMKGbLUdt3FWuZkt1wuXn2oVP70mTWgg3bCMOWBsaCrGAwXHtkkUIFtKF/n3+3JwuiPN/16WvX5T1V3LWrL1P0YDO4Bzew68PPXuF8vO1iWNgmDfN8Eg5xGXdgrfpfnP7y8LIW/mcNvdH8FX0kVx3Gj8ZmJAgSXgVdVZSn7c0BbHY34vyiLI9wwMdzVlbnC+siJFYU03phLSG+hu4V8ckaXcw6ysy1JDO71HKgUzs4Yc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(39860400002)(376002)(346002)(396003)(366004)(451199021)(30864003)(52116002)(966005)(6486002)(2906002)(6512007)(6506007)(2616005)(6666004)(186003)(1076003)(66946007)(66476007)(8936002)(8676002)(66556008)(41300700001)(4326008)(316002)(26005)(478600001)(5660300002)(54906003)(110136005)(38350700002)(38100700002)(36756003)(86362001)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DEtWJbtwYKTcznWBgbFTejN0b6+lQ4VcfLo3qzQuhNat5zJjQpTQ6sq+yPVV?=
 =?us-ascii?Q?sXZWsS7UsqJXxAddRVL0tAzup5n7OcdFJJ9U+RO0E2XR037P6+mbLmNycebD?=
 =?us-ascii?Q?XOKEF5SExvgtaXfSSAQLt2gGB2ynNgw+gHYltPoqmUO15NONfOPFHxlAC4An?=
 =?us-ascii?Q?LVCZqlymc38NP2j6fPAO0n5NS1hQYmpNU+zF7O+6Nf0PEDakU9YuZemCIhoI?=
 =?us-ascii?Q?0eLXtgazfOXyMKQ4O4O8O1CVLBu9ITsdw/7lGswGLDwdZjyzmmYYo5Uvyn43?=
 =?us-ascii?Q?rfWn58Z7k3FJD/uCnGrmeQOdSCLwICCTTAI9d+EZbxCpPnXXJt+kRsAQ2tmq?=
 =?us-ascii?Q?TBDiRQNx+uCXd8MMJuWRyoToBiS/TYNS/HV2n5XaaRPloV7SOVSDjlzQ4piR?=
 =?us-ascii?Q?N6DmTwQA0Y90d3jJglU11SQ3HhUdOPbMdtnIgLQrtXP6qvKVRNInQJwbQ3aL?=
 =?us-ascii?Q?N2UKRHkoXxEYqPW1hclfksAsyjbgE22lrM0GaQJvuZX49nL1MzZUykWOqpB7?=
 =?us-ascii?Q?CYiICrh22z16U+ADZ3UQl/dtO6N/t9kVEfiTIgfqEf83YmvBO8dUcN1DJ01V?=
 =?us-ascii?Q?P2LNRr9ivpZVzvuiPaF2FvsMcqU3XIjjvDevjthAzfteveLKPa816IINxsKw?=
 =?us-ascii?Q?sJaZ3tiI58FdEdwSsZBTrzFnr+Zvb2API5o3ltEimLClRZAeIO6c6PCueacj?=
 =?us-ascii?Q?4cIvyFaHUMP4jIJsAJIfurGCXJcgr6nlecp+QvZFJEIJQUTVvG1NBqbSnID3?=
 =?us-ascii?Q?Ug7hqgwgl4WlzBGMV2g7+hcp30BahoZjB5tMcUi0SsrPl6Hhfno9JEOqAfKd?=
 =?us-ascii?Q?riAbGS6AhTgQPLBUJ9GVBERLtFTYG1QmfPsFUPJrQJuX0llFUSuUAwPMauvb?=
 =?us-ascii?Q?g4n2KyDr06Ckagu7MktTjAkfLFD9ct+emkEfdU7DJu4g2tNoXnYYXIaLggWy?=
 =?us-ascii?Q?1DgD5RUDZ63q2DqdGUFgiq+K7qc/2zU7A1rZuXI88c7Z0SNOt+Q8HOdjssMM?=
 =?us-ascii?Q?DMZY3IfnR9tmIWA77oZQjN9E/FrCq4aljJogMEepnb5P85JqcoUBDdxE7vL7?=
 =?us-ascii?Q?k3m35IZSIanAbmBOIWcr+fpH412YH2wleDT04y3JKtO4Is3Qo6/TDRvnZtXL?=
 =?us-ascii?Q?Q+1Gmz/N94403SduyfxYOCsyOjEGltqPB6o2Bt+2KaAbdyU+vfr943exQzWS?=
 =?us-ascii?Q?4irPvrKvJZCxPGTExWK2FP19BKv3ENKedTup/lAWcqPcRMnsmDhfp9PfzS0p?=
 =?us-ascii?Q?iD73a+cIlpniITDUsc/trvyQZZ1EmvhQqenm7KXT6cdUNnMzWzRTxb6jw57W?=
 =?us-ascii?Q?+9jMQWRFC60nLi7LORcBIq8B2T3Abl6PokAIcum20B2WLXDqwFMrEOWmz82Y?=
 =?us-ascii?Q?Ow5xwZNLep4ROPpOMIL+bA//dJPhhb/EZzHMCnwXeg1AI2ZlTILLN8NxuVyF?=
 =?us-ascii?Q?8pPLw5kPtkmDAocHgX3AKrWXsrQWxY4kwO2F78To1IFmo21fpe3AlVxhIinV?=
 =?us-ascii?Q?EZHH13yqKfNT3ZgIvOktaCEQrRaOjz+3Boq4QpNQJggtg2waF2njnno2gBdM?=
 =?us-ascii?Q?DiCRa9DO/dZMIJ6S1I8TVuEEXSJ2NlTTCD1XlzSl?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 796d5ed9-50b2-4dbd-280d-08db45a8cfc7
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 16:19:14.7646 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xlrStuaoGyoukXxTyrNaVUFLd2OcuSsrSim/SdT7rSBDc0WQywUS5fkFeIrGnc/Jqn9ilM03xHEgA6vYiVi6lw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5045
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch provides a large number of variants of
 F2FS_RW_ATTR and F2FS_RO_ATTR macros,
 reducing the number of parameters required to initialize
 the f2fs_attr structure. Reported-by: kernel test robot <lkp@intel.com> Link:
 https://lore.kernel.org/oe-kbuild-all/202304152234.wjaY3IYm-lkp@intel.com/
 Signed-off-by: Yangtao Li <frank.li@vivo.com> --- v3: -relocate current_
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.97 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.97 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1prLO2-001KBn-IP
Subject: [f2fs-dev] [PATCH v3] f2fs: refactor struct f2fs_attr macro
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel test robot <lkp@intel.com>, Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch provides a large number of variants of F2FS_RW_ATTR
and F2FS_RO_ATTR macros, reducing the number of parameters required
to initialize the f2fs_attr structure.

Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202304152234.wjaY3IYm-lkp@intel.com/
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v3:
-relocate current_atomic_write
-add comment for atomic write node and block age extent cache node
 fs/f2fs/sysfs.c | 239 ++++++++++++++++++++++++++++++------------------
 1 file changed, 148 insertions(+), 91 deletions(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 467d743c801f..cab9e63306bf 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -842,68 +842,159 @@ static struct f2fs_attr f2fs_attr_##_name = {			\
 #define F2FS_GENERAL_RO_ATTR(name) \
 static struct f2fs_attr f2fs_attr_##name = __ATTR(name, 0444, name##_show, NULL)
 
-#define F2FS_STAT_ATTR(_struct_type, _struct_name, _name, _elname)	\
-static struct f2fs_attr f2fs_attr_##_name = {			\
-	.attr = {.name = __stringify(_name), .mode = 0444 },	\
-	.show = f2fs_sbi_show,					\
-	.struct_type = _struct_type,				\
-	.offset = offsetof(struct _struct_name, _elname),       \
-}
+#define STAT_INFO_RO_ATTR(name, elname)				\
+	F2FS_RO_ATTR(STAT_INFO, f2fs_stat_info, name, elname)	\
+
+#define GC_THREAD_RW_ATTR(name, elname)				\
+	F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, name, elname)	\
+
+#define SM_INFO_RW_ATTR(name, elname)				\
+	F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, name, elname)	\
+
+#define SM_INFO_GENERAL_RW_ATTR(elname)				\
+	SM_INFO_RW_ATTR(elname, elname)				\
+
+#define DCC_INFO_RW_ATTR(name, elname)					\
+	F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, name, elname)	\
+
+#define DCC_INFO_GENERAL_RW_ATTR(elname)			\
+	DCC_INFO_RW_ATTR(elname, elname)			\
+
+#define NM_INFO_RW_ATTR(name, elname)				\
+	F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, name, elname)	\
+
+#define NM_INFO_GENERAL_RW_ATTR(elname)				\
+	NM_INFO_RW_ATTR(elname, elname)				\
+
+#define F2FS_SBI_RW_ATTR(name, elname)				\
+	F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, name, elname)	\
+
+#define F2FS_SBI_GENERAL_RW_ATTR(elname)			\
+	F2FS_SBI_RW_ATTR(elname, elname)			\
+
+#define F2FS_SBI_GENERAL_RO_ATTR(elname)			\
+	F2FS_RO_ATTR(F2FS_SBI, f2fs_sb_info, elname, elname)	\
+
+#define FAULT_INFO_RATE_GENERAL_RW_ATTR(elname)				\
+	F2FS_RW_ATTR(FAULT_INFO_RATE, f2fs_fault_info, elname, elname)	\
+
+#define FAULT_INFO_TYPE_GENERAL_RW_ATTR(elname)				\
+	F2FS_RW_ATTR(FAULT_INFO_TYPE, f2fs_fault_info, elname, elname)	\
+
+#define RESERVED_BLOCKS_GENERAL_RW_ATTR(elname)				\
+	F2FS_RW_ATTR(RESERVED_BLOCKS, f2fs_sb_info, elname, elname)	\
+
+#define CPRC_INFO_GENERAL_RW_ATTR(elname)				\
+	F2FS_RW_ATTR(CPRC_INFO, ckpt_req_control, elname, elname)	\
+
+#define ATGC_INFO_RW_ATTR(name, elname)				\
+	F2FS_RW_ATTR(ATGC_INFO, atgc_management, name, elname)	\
 
-F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, gc_urgent_sleep_time,
-							urgent_sleep_time);
-F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, gc_min_sleep_time, min_sleep_time);
-F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, gc_max_sleep_time, max_sleep_time);
-F2FS_RW_ATTR(GC_THREAD, f2fs_gc_kthread, gc_no_gc_sleep_time, no_gc_sleep_time);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_idle, gc_mode);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_urgent, gc_mode);
-F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, reclaim_segments, rec_prefree_segments);
-F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_small_discards, max_discards);
-F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_request, max_discard_request);
-F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, min_discard_issue_time, min_discard_issue_time);
-F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, mid_discard_issue_time, mid_discard_issue_time);
-F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_issue_time, max_discard_issue_time);
-F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_io_aware_gran, discard_io_aware_gran);
-F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_urgent_util, discard_urgent_util);
-F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_granularity, discard_granularity);
-F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_ordered_discard, max_ordered_discard);
-F2FS_RW_ATTR(RESERVED_BLOCKS, f2fs_sb_info, reserved_blocks, reserved_blocks);
-F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, ipu_policy, ipu_policy);
-F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, min_ipu_util, min_ipu_util);
-F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, min_fsync_blocks, min_fsync_blocks);
-F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, min_seq_blocks, min_seq_blocks);
-F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, min_hot_blocks, min_hot_blocks);
-F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, min_ssr_sections, min_ssr_sections);
-F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, ram_thresh, ram_thresh);
-F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, ra_nid_pages, ra_nid_pages);
-F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, dirty_nats_ratio, dirty_nats_ratio);
-F2FS_RW_ATTR(NM_INFO, f2fs_nm_info, max_roll_forward_node_blocks, max_rf_node_blocks);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_victim_search, max_victim_search);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, migration_granularity, migration_granularity);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, dir_level, dir_level);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, cp_interval, interval_time[CP_TIME]);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, idle_interval, interval_time[REQ_TIME]);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, discard_idle_interval,
-					interval_time[DISCARD_TIME]);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_idle_interval, interval_time[GC_TIME]);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info,
-		umount_discard_timeout, interval_time[UMOUNT_DISCARD_TIMEOUT]);
+/* GC_THREAD ATTR */
+GC_THREAD_RW_ATTR(gc_urgent_sleep_time, urgent_sleep_time);
+GC_THREAD_RW_ATTR(gc_min_sleep_time, min_sleep_time);
+GC_THREAD_RW_ATTR(gc_max_sleep_time, max_sleep_time);
+GC_THREAD_RW_ATTR(gc_no_gc_sleep_time, no_gc_sleep_time);
+
+/* SM_INFO ATTR */
+SM_INFO_RW_ATTR(reclaim_segments, rec_prefree_segments);
+SM_INFO_GENERAL_RW_ATTR(ipu_policy);
+SM_INFO_GENERAL_RW_ATTR(min_ipu_util);
+SM_INFO_GENERAL_RW_ATTR(min_fsync_blocks);
+SM_INFO_GENERAL_RW_ATTR(min_seq_blocks);
+SM_INFO_GENERAL_RW_ATTR(min_hot_blocks);
+SM_INFO_GENERAL_RW_ATTR(min_ssr_sections);
+
+/* DCC_INFO ATTR */
+DCC_INFO_RW_ATTR(max_small_discards, max_discards);
+DCC_INFO_GENERAL_RW_ATTR(max_discard_request);
+DCC_INFO_GENERAL_RW_ATTR(min_discard_issue_time);
+DCC_INFO_GENERAL_RW_ATTR(mid_discard_issue_time);
+DCC_INFO_GENERAL_RW_ATTR(max_discard_issue_time);
+DCC_INFO_GENERAL_RW_ATTR(discard_io_aware_gran);
+DCC_INFO_GENERAL_RW_ATTR(discard_urgent_util);
+DCC_INFO_GENERAL_RW_ATTR(discard_granularity);
+DCC_INFO_GENERAL_RW_ATTR(max_ordered_discard);
+
+/* NM_INFO ATTR */
+NM_INFO_RW_ATTR(max_roll_forward_node_blocks, max_rf_node_blocks);
+NM_INFO_GENERAL_RW_ATTR(ram_thresh);
+NM_INFO_GENERAL_RW_ATTR(ra_nid_pages);
+NM_INFO_GENERAL_RW_ATTR(dirty_nats_ratio);
+
+/* F2FS_SBI ATTR */
+F2FS_RW_ATTR(F2FS_SBI, f2fs_super_block, extension_list, extension_list);
+F2FS_SBI_RW_ATTR(gc_idle, gc_mode);
+F2FS_SBI_RW_ATTR(gc_urgent, gc_mode);
+F2FS_SBI_RW_ATTR(cp_interval, interval_time[CP_TIME]);
+F2FS_SBI_RW_ATTR(idle_interval, interval_time[REQ_TIME]);
+F2FS_SBI_RW_ATTR(discard_idle_interval, interval_time[DISCARD_TIME]);
+F2FS_SBI_RW_ATTR(gc_idle_interval, interval_time[GC_TIME]);
+F2FS_SBI_RW_ATTR(umount_discard_timeout, interval_time[UMOUNT_DISCARD_TIMEOUT]);
+F2FS_SBI_RW_ATTR(gc_pin_file_thresh, gc_pin_file_threshold);
+F2FS_SBI_RW_ATTR(gc_reclaimed_segments, gc_reclaimed_segs);
+F2FS_SBI_GENERAL_RW_ATTR(max_victim_search);
+F2FS_SBI_GENERAL_RW_ATTR(migration_granularity);
+F2FS_SBI_GENERAL_RW_ATTR(dir_level);
 #ifdef CONFIG_F2FS_IOSTAT
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, iostat_enable, iostat_enable);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, iostat_period_ms, iostat_period_ms);
+F2FS_SBI_GENERAL_RW_ATTR(iostat_enable);
+F2FS_SBI_GENERAL_RW_ATTR(iostat_period_ms);
 #endif
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, readdir_ra, readdir_ra);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_io_bytes, max_io_bytes);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_pin_file_thresh, gc_pin_file_threshold);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_super_block, extension_list, extension_list);
+F2FS_SBI_GENERAL_RW_ATTR(readdir_ra);
+F2FS_SBI_GENERAL_RW_ATTR(max_io_bytes);
+F2FS_SBI_GENERAL_RW_ATTR(data_io_flag);
+F2FS_SBI_GENERAL_RW_ATTR(node_io_flag);
+F2FS_SBI_GENERAL_RW_ATTR(gc_remaining_trials);
+F2FS_SBI_GENERAL_RW_ATTR(seq_file_ra_mul);
+F2FS_SBI_GENERAL_RW_ATTR(gc_segment_mode);
+F2FS_SBI_GENERAL_RW_ATTR(max_fragment_chunk);
+F2FS_SBI_GENERAL_RW_ATTR(max_fragment_hole);
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+F2FS_SBI_GENERAL_RW_ATTR(compr_written_block);
+F2FS_SBI_GENERAL_RW_ATTR(compr_saved_block);
+F2FS_SBI_GENERAL_RW_ATTR(compr_new_inode);
+F2FS_SBI_GENERAL_RW_ATTR(compress_percent);
+F2FS_SBI_GENERAL_RW_ATTR(compress_watermark);
+#endif
+/* atomic write */
+F2FS_SBI_GENERAL_RO_ATTR(current_atomic_write);
+F2FS_SBI_GENERAL_RW_ATTR(peak_atomic_write);
+F2FS_SBI_GENERAL_RW_ATTR(committed_atomic_block);
+F2FS_SBI_GENERAL_RW_ATTR(revoked_atomic_block);
+/* block age extent cache */
+F2FS_SBI_GENERAL_RW_ATTR(hot_data_age_threshold);
+F2FS_SBI_GENERAL_RW_ATTR(warm_data_age_threshold);
+F2FS_SBI_GENERAL_RW_ATTR(last_age_weight);
+#ifdef CONFIG_BLK_DEV_ZONED
+F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_sec);
+#endif
+
+/* STAT_INFO ATTR */
+#ifdef CONFIG_F2FS_STAT_FS
+STAT_INFO_RO_ATTR(cp_foreground_calls, cp_count);
+STAT_INFO_RO_ATTR(cp_background_calls, bg_cp_count);
+STAT_INFO_RO_ATTR(gc_foreground_calls, call_count);
+STAT_INFO_RO_ATTR(gc_background_calls, bg_gc);
+#endif
+
+/* FAULT_INFO ATTR */
 #ifdef CONFIG_F2FS_FAULT_INJECTION
-F2FS_RW_ATTR(FAULT_INFO_RATE, f2fs_fault_info, inject_rate, inject_rate);
-F2FS_RW_ATTR(FAULT_INFO_TYPE, f2fs_fault_info, inject_type, inject_type);
+FAULT_INFO_RATE_GENERAL_RW_ATTR(inject_rate);
+FAULT_INFO_TYPE_GENERAL_RW_ATTR(inject_type);
 #endif
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, data_io_flag, data_io_flag);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, node_io_flag, node_io_flag);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_remaining_trials, gc_remaining_trials);
-F2FS_RW_ATTR(CPRC_INFO, ckpt_req_control, ckpt_thread_ioprio, ckpt_thread_ioprio);
+
+/* RESERVED_BLOCKS ATTR */
+RESERVED_BLOCKS_GENERAL_RW_ATTR(reserved_blocks);
+
+/* CPRC_INFO ATTR */
+CPRC_INFO_GENERAL_RW_ATTR(ckpt_thread_ioprio);
+
+/* ATGC_INFO ATTR */
+ATGC_INFO_RW_ATTR(atgc_candidate_ratio, candidate_ratio);
+ATGC_INFO_RW_ATTR(atgc_candidate_count, max_candidate_count);
+ATGC_INFO_RW_ATTR(atgc_age_weight, age_weight);
+ATGC_INFO_RW_ATTR(atgc_age_threshold, age_threshold);
+
 F2FS_GENERAL_RO_ATTR(dirty_segments);
 F2FS_GENERAL_RO_ATTR(free_segments);
 F2FS_GENERAL_RO_ATTR(ovp_segments);
@@ -917,10 +1008,6 @@ F2FS_GENERAL_RO_ATTR(main_blkaddr);
 F2FS_GENERAL_RO_ATTR(pending_discard);
 F2FS_GENERAL_RO_ATTR(gc_mode);
 #ifdef CONFIG_F2FS_STAT_FS
-F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_foreground_calls, cp_count);
-F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, cp_background_calls, bg_cp_count);
-F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, gc_foreground_calls, call_count);
-F2FS_STAT_ATTR(STAT_INFO, f2fs_stat_info, gc_background_calls, bg_gc);
 F2FS_GENERAL_RO_ATTR(moved_blocks_background);
 F2FS_GENERAL_RO_ATTR(moved_blocks_foreground);
 F2FS_GENERAL_RO_ATTR(avg_vblocks);
@@ -935,8 +1022,6 @@ F2FS_FEATURE_RO_ATTR(encrypted_casefold);
 #endif /* CONFIG_FS_ENCRYPTION */
 #ifdef CONFIG_BLK_DEV_ZONED
 F2FS_FEATURE_RO_ATTR(block_zoned);
-F2FS_RO_ATTR(F2FS_SBI, f2fs_sb_info, unusable_blocks_per_sec,
-					unusable_blocks_per_sec);
 #endif
 F2FS_FEATURE_RO_ATTR(atomic_write);
 F2FS_FEATURE_RO_ATTR(extra_attr);
@@ -956,37 +1041,9 @@ F2FS_FEATURE_RO_ATTR(casefold);
 F2FS_FEATURE_RO_ATTR(readonly);
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 F2FS_FEATURE_RO_ATTR(compression);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_written_block, compr_written_block);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_saved_block, compr_saved_block);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compr_new_inode, compr_new_inode);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compress_percent, compress_percent);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, compress_watermark, compress_watermark);
 #endif
 F2FS_FEATURE_RO_ATTR(pin_file);
 
-/* For ATGC */
-F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_candidate_ratio, candidate_ratio);
-F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_candidate_count, max_candidate_count);
-F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_age_weight, age_weight);
-F2FS_RW_ATTR(ATGC_INFO, atgc_management, atgc_age_threshold, age_threshold);
-
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, seq_file_ra_mul, seq_file_ra_mul);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_segment_mode, gc_segment_mode);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_reclaimed_segments, gc_reclaimed_segs);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_fragment_chunk, max_fragment_chunk);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, max_fragment_hole, max_fragment_hole);
-
-/* For atomic write */
-F2FS_RO_ATTR(F2FS_SBI, f2fs_sb_info, current_atomic_write, current_atomic_write);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, peak_atomic_write, peak_atomic_write);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, committed_atomic_block, committed_atomic_block);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, revoked_atomic_block, revoked_atomic_block);
-
-/* For block age extent cache */
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, hot_data_age_threshold, hot_data_age_threshold);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, warm_data_age_threshold, warm_data_age_threshold);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, last_age_weight, last_age_weight);
-
 #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
 static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(gc_urgent_sleep_time),
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
