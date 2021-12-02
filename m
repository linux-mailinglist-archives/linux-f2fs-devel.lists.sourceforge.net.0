Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 59165466055
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Dec 2021 10:28:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1msiOL-0000Db-3Q; Thu, 02 Dec 2021 09:28:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1msiOJ-0000DV-6d
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Dec 2021 09:28:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pHaSy+Gg1G6Hzu3ObL5QK6ALisHLA+eJgRJiqm+orc0=; b=gHgXq+eOvcJ4GPqRPm1zdN2N0r
 EipFx/QX65LK62jQUN34wXeijct5mH6UJIVACM1t5phrQUDusGuKq8o3WklUhAhIX3UEOwVUGRjUl
 D6TIzMPnrLAUXjJUEcBqYbAoiTmHSFO87yTEP8qxXA8msVSKHPFZAuPRzeTd5DjKuRQs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:To:From:Sender:Reply-To:Cc:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pHaSy+Gg1G6Hzu3ObL5QK6ALisHLA+eJgRJiqm+orc0=; b=A
 YzfFTAF3kgXzgN4H+NZRW5F4H/VhYaOasEh+Ja9QZoOddzuNI87/A1lcR1FFXegUDLTwCFtd/Yh6J
 0X6mHZ6aTtGyhbSFuKWnjR8r4d4DYK+AHsgjqgMLcgK8CU0gY2GpOza82L1dNisbJwrBDwUlfl4lC
 ThoQP4q6hpkDnGmY=;
Received: from mail-sgaapc01on2101.outbound.protection.outlook.com
 ([40.107.215.101] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1msiOF-0003Q6-TI
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Dec 2021 09:28:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ab9bghzVCZo0Dpj7PCG6VNqD8Q+yMTNKj+o5qeFRs/lDYUDAimYHxSQt0+Ih9NhDNou7Nip1YoQJ3ZwO4h9kkhgO9NmdVMxx1i4ydJJIY+0AtCFYRLy+CBhMpc6tHYloRHyGavMPrYH+AS8FyhWGhz8htnhkvXfxMFAb8ZjnHyQH93ige5A9fSI3EqqyVL34SIMS3+Q0ZLJM1hg+UDpXVWbBvOuilhlVo11sfebxdcZcXzCR8Dl+rKI1/rKal1eveDd6DZRc3kTnXEGji7GRI6zbg5kXTAxjUEzC6Ej986bvbd34nrVmTCrVHgfbLMilBBL/hjHpesGltfMw5ToT8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pHaSy+Gg1G6Hzu3ObL5QK6ALisHLA+eJgRJiqm+orc0=;
 b=az6v9wKGtZoC7ZKqu8Jyfzo34vYiNrQNe+mn8CQv+PzFn7gMDuaNuu7jAB3c/uktStPnjjpOHY7E+OFwvtB4ELOD2Tkmm9UQ6FrpjyDSAXqFpmnnQFYJAdlOlIn76ZnIomVMe0BE/5jco604VwTDpQYmUSsdCqrLstXHZMceqMGJzfzNSN8QHtI+fr3M2PijsdmdrKzGRfXo+YUMXz4g3UCgoK3j8y2Rk3Vi4zqhUcFf3QfXC/XfIDa2Q/Da8tDsK3yfkiGzsuRCcmxTUBKmQLmADHmkHAUQMUqR06s3Q6YjZpbgT0DCp5KHYGg03+uVgdlIT5cOp+n1NEJQ1OoARA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pHaSy+Gg1G6Hzu3ObL5QK6ALisHLA+eJgRJiqm+orc0=;
 b=DcCoahJ1wwZpHRZWAvR64HClboKxf0BjuZfSIpQrjBg00S8dw8BJY2Uxnnut4EyhBGhYtubA+jpPicnsEU/YRVQ47VC1Q9uWhK8AhMHPCSZwhA7lKWjo/Xu1tbAwSGEcXyx1poD7FPEQzaVHfau6DKZhTcR0fneq6wEb93l3wL0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB4084.apcprd06.prod.outlook.com (2603:1096:820:28::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Thu, 2 Dec
 2021 09:28:19 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a%5]) with mapi id 15.20.4755.016; Thu, 2 Dec 2021
 09:28:18 +0000
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Thu,  2 Dec 2021 17:28:12 +0800
Message-Id: <20211202092812.197647-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: HK2PR06CA0012.apcprd06.prod.outlook.com
 (2603:1096:202:2e::24) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
Received: from comdg01144017.vivo.xyz (203.90.234.88) by
 HK2PR06CA0012.apcprd06.prod.outlook.com (2603:1096:202:2e::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4734.21 via Frontend Transport; Thu, 2 Dec 2021 09:28:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e8acd44-cf55-4eaf-b728-08d9b5761353
X-MS-TrafficTypeDiagnostic: KL1PR0601MB4084:
X-Microsoft-Antispam-PRVS: <KL1PR0601MB40848FD7F31FAC21AE91F58EBB699@KL1PR0601MB4084.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aBwMSQGupjbu8pP4FrDTFJJ+89+lborSf2mvDFKga88KjWVFZuqD11G2t2aWpAGel6g4qSUQfDYR86iDzRjhqr7aPlN9VqHo4fCKRxSvmpGd1+HCNSQd9IBmWkNL4zSpK1zwwtnO3U0MeXFo0yLnsEDM1IUcbqd4eC3i40YUFrCXJTVeRIbYD3Kv+Sxm1Q2p0MxITmzxTa9sQtcD2MMIfTHizewOJJ0hgWpVyaVtJzL03zyT46+ExOwJgBJgXNRkCrLOZlzPGeQbalJA/I5aUNWq0M70hD4vY0/Ey/7ZbJlm/QntCJ0i4Bz+m9maeRTWnULqCtfEDZCVxoAktvBBFJ8hE0X+hb60k5jdvVPzOKtK/atmpQWTZ3aw1XF+AkrYVHKWBv9Ek1XIaqZCF1hme7zNQ6hepnTRHrLv1y3heh6cvLIToIHn8Pfps0ZZly4FqXGX66Kg0UhX+TU6fHflNCHIatqhnkB7gVpTCnS+tqiDcgHzhD6gbjxoA7Bzxoe4pyS+t5qEx2jk1KK7etVaaTvsmmD6yx2Wufm9osX6QREziumJB4n3Al0WODXXpK4n/pgz5SkrZGPLFKLF3r8v4rFAPyFCEBowfUj1IsDJF5eiTWwUzW5bjD0QTTRs7BYhFlFjAeHLXlD7h6xDf0gsVywA74fNo3Is2i8Ujx+AHdczasphPUk7ghYL2U0FlFlDRoS/dTqGAPVd6+6VCwI7QcX5zH59X4jOfCDN3KuJi0k=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2906002)(38350700002)(38100700002)(956004)(2616005)(36756003)(8936002)(186003)(6486002)(508600001)(6666004)(8676002)(66946007)(66476007)(6506007)(6512007)(1076003)(66556008)(316002)(52116002)(26005)(86362001)(83380400001)(4744005)(5660300002)(182500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?aV6xHUHcJHm/ppeL2jNFpumzsDxGTi2g4KBf2cbmubWbbqrTrK+QAtFryRj8?=
 =?us-ascii?Q?I7ErrRWJJceqIBEfQawEVdUcKF2zxu2SjsnOuWI/SUnhflnHj+7ckXKl+p3A?=
 =?us-ascii?Q?n9VPfm8nSaVLj/g12XjMk2P5yYW34xv3ViYG4qiZWYMBoLZDb/YsRJc5kst7?=
 =?us-ascii?Q?FrihKPU1qiILJcLHUNSJwDF3xbtxVvEpyUBtReRAeVCNT/fmjySo523kLHPA?=
 =?us-ascii?Q?M8RsEFZ7xQ3HNcIqQGkupGjUvJM0Q1jHw8GM+DLQAWX16fnBVI9P3vDUTm/8?=
 =?us-ascii?Q?jxrOmoKXWVUZa2659XdVZWFnIKrY3B5ZdVLxbktbHGX6aLBNc0C8Q6H+9Ywj?=
 =?us-ascii?Q?tJ9G5cVs4h8b/G4UmH56+zzfMRERaDga0lbl0J4wM0iFSW5RryZwMOY5f/7B?=
 =?us-ascii?Q?6XtZzIoJdALKVMGiFxIA49q9EC8aFmXG1e9S5O7blC4gnEPUe8SrEYPmW9fd?=
 =?us-ascii?Q?/Ng1z3VGam4uROdR3exh7bBH/fx/K2OIBvXfYqdMzi3V8BzdtnW3hxknSrHg?=
 =?us-ascii?Q?IU8kR7bpSVDGUpHW+7gMENXW1ZkP65E+rSmnnXj4z/FWsvqAbvGofyj9xqs8?=
 =?us-ascii?Q?sUcQ6Fu2hqAE2kFeupjdGgjI7xCdFjI37NhdG0/oIzkwuoQEtq835IAi1zkD?=
 =?us-ascii?Q?mYOjlOrcnIRgGkslEXxn8W0jy85nGW48JSQS/tTXS23EGaoOqxtJ0GIIk0Qq?=
 =?us-ascii?Q?Cx6YZGXexFqj6NdwQlVImzUGnGlI0NjAQ+ExR3AUtnAtTAv+mqJl3FhDp5rW?=
 =?us-ascii?Q?QIFPTUDSczDSG4zpIt+xnAqshYe5bDDZ5IOntfmytg7b0222hxXcqxjuycp7?=
 =?us-ascii?Q?3geJ0ulojC38hMytIYZ5R+k9Zzxgd47N2G2FhavU6qDTECMZD+Q5hQfUqFtT?=
 =?us-ascii?Q?bISea+qMqv44le3YjTGLV9sNDcHW15n/h3wET/WMX6wHFtdGMCZogs8e8mky?=
 =?us-ascii?Q?i/XoTHZaX+0a/ow///af5DZLojEUnFm0/1VdDOglVfzH5hX3cqTJH1bGOGA1?=
 =?us-ascii?Q?6a51FllvV5Jkn/zQqHRe4AF4DbjXQYbXeDw3bL6AteybkANMQgasPvuZR6nt?=
 =?us-ascii?Q?RqSRsBb8n4rgdXdYiqEpoXzWCeUHUZdfjQwVMxthJxggVjgri9FAkyf8uO+T?=
 =?us-ascii?Q?BO3r6I8Mdpg5umq7rVqZ/WOa6bpYPXNXsETamitA23NcxuknTVK+/CqSJSya?=
 =?us-ascii?Q?p8+M4HeeJwfqR5qkSv6QZkEfN4TvQDa7z9jnxfC94my8/kFSXaN1OyKO98p1?=
 =?us-ascii?Q?fytg7rjcPPdLWr/PCfvb/LNZirH1aKeaDU1ACdmqWyluaHZLQBIOP9mWIoHe?=
 =?us-ascii?Q?U7K7Wmd6ZIWErUzQ5z140/027KUtqYOGJVpTe0S2DxJ/JzO3SWajqYj0aT7k?=
 =?us-ascii?Q?b75NkPCcEGD6yEdm5XDX4ERoUwPXBVlGb1R8u9UV3t7fAMxjihozxfvqAlPm?=
 =?us-ascii?Q?slX42tdMhiaJ06obT0O0eSLMtfsGgbYf/kynEL+5BmUEn2FtLic9wjmvbpCX?=
 =?us-ascii?Q?w+UTGV3hO7EBdTSWyHHIImCyh4mmoPdmvXCkXZBG97OG/U3KB2gPvJOHlLz8?=
 =?us-ascii?Q?0auDds6aDYOmMo/y7/xkf8zMRtcdwJk1Ie2t3P1iaCahHDXgTg1s2gP3mPOm?=
 =?us-ascii?Q?Xtogq+zsehenfhldBg4idgQ=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e8acd44-cf55-4eaf-b728-08d9b5761353
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2021 09:28:18.6629 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fZZQi79URrp5RhWnwAhDd8bjNkRh2Kd7+1KmSfOsWMDGk0BWa+HMM79AWmZvaq0hE+zYBigvTgblMtASMw9o5w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4084
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When enable compress_cache option, in my test envrionment,
 sometime f2fs_invalidate_compress_pages will take long time to finish,
 find_get_pages_range
 take most time, is there anyone encounter this pr [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.101 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.101 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1msiOF-0003Q6-TI
Subject: [f2fs-dev] f2fs_invalidate_compress_pages sometime take long time
 to finish
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When enable compress_cache option, in my test envrionment, sometime
f2fs_invalidate_compress_pages will take long time to finish, 
find_get_pages_range take most time, is there anyone encounter this problem
too?  In my test, I have 8 files, each file size was 64MB, do some seq and
random read or write and drop cache, when drop cache, it happnes, my kernel
version was 5.10.43. Is there anything to suspect?

Thanks.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
