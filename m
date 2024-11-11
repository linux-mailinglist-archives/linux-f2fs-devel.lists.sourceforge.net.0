Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AE329C3A12
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Nov 2024 09:52:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tAQ9Y-0002yE-Ik;
	Mon, 11 Nov 2024 08:52:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1tAQ9L-0002rR-1W
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Nov 2024 08:51:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c9ceKEwiR2MpS6zNV3Xg5/5F9h1yAOqNksCS3ez9i7g=; b=HElnwCwYTKg+ROMz1Ilzwy7ebq
 JQUNhp34TVqmK5gjZa1yaxSGGINfeYFAsq/v+EkzQe55I9S6Kkw5n1NJOf5UexDDAAWV2AN72tgF2
 XyFSLe3kJU81ks0hQ2ZQe+jwDR9N6Y9mEReYuyBN6+GfpUMah7SWKgYhjj4ttvxFGvCs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=c9ceKEwiR2MpS6zNV3Xg5/5F9h1yAOqNksCS3ez9i7g=; b=B
 j0pXH3smzfOt6XuV1Tn1No4uXDqRCfYKOnx2DsEBC7z5d8I0PSvZPMfRKcL9NmMPQGBvVmbG5QPWw
 O/Xp+kWTnIRyPgD/73TU/XYzVnm628TgvwAderwDwL3V/xLTfsZq7yOraTP34og1QRLD3Rkf7iU4j
 VGfraGNYxvzufM6k=;
Received: from mail-eastasiaazon11010049.outbound.protection.outlook.com
 ([52.101.128.49] helo=HK2PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tAQ9H-00043C-TE for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Nov 2024 08:51:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aTF9hxE6qT7MWPwjN8AChQSEB3KbmCQVoR5O0IkzrKX439UaawXn+/BjNiOXFW1q4cBOFawlEwlONDwbRgwPIV/FCc9f/TMm+RIoeJ3Fn5ZH43iHVMD8s3ICo5+g+IH9ffJntaqfK1l8/kk5O4Y7VOo7lW7TzwfHxMaiw5iiPpLAQ57VLqAuy5D4KlfQ+rO6lNQEq61A7m1RnDw4HRYhO2COKcSc6rRWb45kRDhAvLItaw2bPrHTL9lzihyo9jQQqYg04OOgh5vZ4n33BIfHIXRuBV8Kx5Mo7CFayClZqfVEtfYM/JGe2Y4OYDia19QQ3/9iWVHcFVDOuyKGyyk2MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c9ceKEwiR2MpS6zNV3Xg5/5F9h1yAOqNksCS3ez9i7g=;
 b=XNHyc1SptX6u1dzXdpP3a2bZ4587rlB28BmFx3OS41HbHj9y6Y2UwOP1SMTXZh1xFgMqpA2Bi0V8NNHmT9NTGAxjNVszk3wgACn4ER7ya8ly9S2nznIYgr/eNmkkqt9JRgDFiyoqswPPwoHR+UuaEOS+Vrkgj6BxwkJ4qdmvN6MjA+zwLWn9HGPq0XhRmB0zeeCw7B0CVLOx2ETIDs6NSPEo77/M0qBawHSrojQYhGOwBFLlNoxqLNoxLzEw2/EKMOOneDd0WshmT/Dvy2aMAcSxHexKkTPxcLNTn4zz9JcD9erGC0MLfBW55L9e6vdywj0jNzUOv9ghq24Qi2H7hQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c9ceKEwiR2MpS6zNV3Xg5/5F9h1yAOqNksCS3ez9i7g=;
 b=Ngv5jW1c+z2DL6VbGAOEo28+gMiqvQ1B8UBk/FqPSZbP9tK9asaAfnidGkHpJY4zOsmkY0UUqNjKF4EWxH3Grf2c7erkdB63G6uqLDGaRRuejCv038cNGwRq+ER3Bhf2kvfg36aAsPtdZDVnRW6wS+SHd8UFdnpbDCSC2YJXT0A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TYZPR02MB7393.apcprd02.prod.outlook.com (2603:1096:405:44::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.26; Mon, 11 Nov
 2024 08:51:43 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 08:51:43 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 11 Nov 2024 16:50:57 +0800
Message-Id: <20241111085058.4136077-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: SI1PR02CA0011.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::19) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TYZPR02MB7393:EE_
X-MS-Office365-Filtering-Correlation-Id: f63778bb-bf85-4438-afba-08dd022e10a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?9ZRfVmHa+bhtYrrDVLxY+YusGuWh8wA4qKiXEoiN1XMgfz2vdafNPJAz+r+d?=
 =?us-ascii?Q?BN7IjGRy3BCUia3gD4yFNLpFpS4jW97hJEqaUc80fqMe8Gn6Ew6MBWQ5cAvY?=
 =?us-ascii?Q?avHaT0K0/MfPt5nfmTx20+/ocKS308adBtvpV5ZzbwslJd3tT/sTrT7onTgP?=
 =?us-ascii?Q?FRwejdDmw1lu7cy0eLCFuHKfxFmC9r3lgOj6OOnnOb7K/2vYL/q84ErZ27xy?=
 =?us-ascii?Q?bTOU8/V4WKbde7jGP6tBmGDXhSSPuX8RGbpx6GlDO/aJ22TBL1MkHdjcXgZn?=
 =?us-ascii?Q?imiwis2iyC4LfJavTx/GSrMvydmGeyFIPrgtNy0iWOYSgz75jWByKB2zosMA?=
 =?us-ascii?Q?AIzU/lhrk+5WB40wmwfpZgKD4GkGpg9d2NcGr4yCOo4JlauSyU6Sa+gSE9TX?=
 =?us-ascii?Q?n6NnJbgMNtIvimIo8dWLVhyQzZAwmFXf2d8WE4V7eb9Wy9+ZygJcmxmRFaEU?=
 =?us-ascii?Q?UGJ0ddTC3qTf0ERVZAWIkYVw32BsxoX9TSOB7wlhev4piM5bg9z66T2imGEh?=
 =?us-ascii?Q?JzRBI8JKucDz3+xKbrJnJtpFiULxqhpMiBtCbsxr8NDn8gUD33Iifsqg4IVq?=
 =?us-ascii?Q?h6yQvdqK8ulCZjfCiC79MzJLPGfbVvcah5VoVBt/Sy2LInSxulyM8nMfd5Wb?=
 =?us-ascii?Q?zPIrDKT4rFqHfypNdsk8ejWffk3ahCyvbOcFMFWfC2FNGs4D7GgC4h3NK+GS?=
 =?us-ascii?Q?SsnvoDH1/O9D73y9yH6eqVBuzXY+DIypg08uRkzAqyfPU0Kn/OKZwA8vupN2?=
 =?us-ascii?Q?CLmfz7sqPU8pCnfOEaz5mwaV2+xGMyEVxLGWlSalLgnxFVv7BmV0UPW5NcEO?=
 =?us-ascii?Q?ofXmovFdDYFAoaPDBZLmuxcY1MnNbr1zWW45X3VWRFCA1iV0EcGoUNO8BFQ/?=
 =?us-ascii?Q?BAQ81zCDAwuCrQADkZ+eew6OiXDd1iuriFi+MAI69RYeqOdImaZqYpKRK4Ys?=
 =?us-ascii?Q?DbF7Rfg/7KtTwuoDLPuQMVpTcVr1VrCBmE9tRdXtl1G/nZgAVgCC8/h2gI3u?=
 =?us-ascii?Q?BJPK3Dday1RTxYOGMXYDMC9tjsDZ4tR5l2930a0C8V5a7xn0SAiNnW/9Wj7/?=
 =?us-ascii?Q?3aGiU2fVtd44yp3Jl+biuym00sebK/uAYVM/oC2K+UFOP9qrQXwu09YyO5jf?=
 =?us-ascii?Q?+Qe9w5slaOlgMre2OUq6HqeUjUqcSrAD6D8koG3ZX16lxj1NRWBtcLM6cNI6?=
 =?us-ascii?Q?0g+1J6j4DLNeqPZNvngem/EF7U4C4KZwFCLMWzUm9ct50aRzTRQf/X8XWU72?=
 =?us-ascii?Q?dItcO5sagibNVfW7CIXsvqxE8O9OER7M8CGYtq+U0wvZvVMEzRGmSby1Gidj?=
 =?us-ascii?Q?zftGXyL5M8LX4ZnO1GIGJOmzh08v/5LLtW3KRN/HYDyt13gx3dqBmF+b/wGM?=
 =?us-ascii?Q?IukhWa4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9cym6LAFnVwboota+J/00CkG5e0gEJ/FOE6g3RXCdZXAlTLoyPphBV85XLZt?=
 =?us-ascii?Q?CwsCYm7ZOwCwvho+fS6uh7+8f+OVcnxY8xtEKQjNEHeyHTH3HnZ8amgtKvA0?=
 =?us-ascii?Q?BtI4XnWoeqJsznB7nVVViCmfSvxWpSbw/Ustrz/1ZK15x6bramNcSYxDa/yr?=
 =?us-ascii?Q?7hKafrAYrXu4aJ5a6D3cKx9wOwDkLvXGvdYTUqvJLXL0lfcduQ6VMwZPFS44?=
 =?us-ascii?Q?PkvVCklzcf4dZWoNJFMo/LSI5cNOvl3K1s/QzhKETcJN25wIo/H8puzY+IkR?=
 =?us-ascii?Q?FboxWPpYuX0yXviY4OBKLpEeY4xah9AE+io8ruKJnrOvMo0pY50x1vC4JRhu?=
 =?us-ascii?Q?hRnJDt+MMHXdIpaaKDHzLfJSWCSy6e130tFvgKgYXJLmfk4f+zVgnFRYCDjH?=
 =?us-ascii?Q?UBuFRTgCu4na9gRrF3e73G3Ls5LCAiWHz/CLMayvIgNQvDTQzP2mcKRegYHo?=
 =?us-ascii?Q?WBAaanDpA71ukuIvf9ruItr5ECdcn0/SJdA/7ZtXCPeASZnCA9KfdgHmjyEA?=
 =?us-ascii?Q?4FktArS3uRF9YHXDWAItGJ9lYQjdBfp+ldGPkbaQcxNq/pcS6m5JTC+utsW1?=
 =?us-ascii?Q?ddiC5CZwC4LkKND/8BaiU5TZoEBF/YDng7FdQByc+ok4ZxoIPAIBzpoVHvxj?=
 =?us-ascii?Q?uTbpr1u/YCj/mCvtF1vbP/Wdd/Bff7s9FdjCDCfD0UbKNKUmQW9WPPjzPko6?=
 =?us-ascii?Q?ndOU43eloZ1KNC2GZit3pc/gbVRSKX0odjTKhP++SY94aalJ4YJnSCDyFPTy?=
 =?us-ascii?Q?Y30r5bo7z4EhNWC9o+o6htwC/3VmGTfQzPMfesak902fgJxvxh6k/EBVgpRE?=
 =?us-ascii?Q?zkQvbuVrSSVaCusRs938AgGnpXPJFbU53Ez13GCC4gHtUMMttFqBrd0w8hW5?=
 =?us-ascii?Q?GeyIvDRZ9XpeurIfwcArC5bv2Q9aqMfCwBCjLwFyBdFU6q4VIiHCuR9zmZjs?=
 =?us-ascii?Q?HyuxPtXMNnRBEnMpKgDzGVodHb0QfOqiJH98r8USk/PcXmcQ3y5Lne7EnZF2?=
 =?us-ascii?Q?DH2rBcBzCYUKOPpYUVRR1goQ8a21n5DuFbPJBCAaTKABllYOWTYyoXyMSmbk?=
 =?us-ascii?Q?/t6hdtNIvJB2lHr59Xtoy4MS6HtAQSQfsLP3WCkvvuUAEyWwnzhsT4td69X9?=
 =?us-ascii?Q?SEb6K3DLAuLlYf+fWWkSeUphPmlAR5Vcfo3yqNPokhG0GVZK9bjgf+jj0sh5?=
 =?us-ascii?Q?gMZk85jTqpGSTJJHPskBJ4VGz9Uel7nSpqS+bl2DjxeNvj9vBT6aUQsDr5q2?=
 =?us-ascii?Q?/oLQcXUOH9u4nc0WGvy38Y1euVRglxDNPr0vnlUuwGw0PfRns+7vMCMB6RdV?=
 =?us-ascii?Q?hZEIyibW4kVrmTl0nIn0wQqMbKbMj0fphchp/6bPLtrWOAGJH04LHKoFo66K?=
 =?us-ascii?Q?AjdL3G/+HYmDvIqZk41jDpJY1pnSGtWFGC5ldOvzYPNQdRPM7z0csQVLzqMc?=
 =?us-ascii?Q?5eF/SD48mURkY3A0OxmqyzN6mfdc7E6OV1ZjUVMtodHhjOEroB4jdWeotHKp?=
 =?us-ascii?Q?ExgzTXfv5/LKbhUJ4XUEIuFc6rf26/n0H7RyKPVXVnCCoDT+zjw+0ueq6bet?=
 =?us-ascii?Q?IjGPIdpkHUD4Oc/Mw2A+UsS4X8c7MFueRxv2feEl?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f63778bb-bf85-4438-afba-08dd022e10a6
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 08:51:42.9961 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tqlRmc5mG3SAQBS3V6Vil1U0W0CBaQD/tD65+omZncb+WcGVb0aMFgFTziDe52k9487G3XM1tM+lr83tp85tCw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB7393
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Fsync data recovery attempts to check and fix write pointer
 consistency of cursegs and all other zones. If the write pointers of cursegs
 are unaligned, cursegs are changed to new sections. If recovery fails, zone
 write pointers are still checked and fixed, but the latest checkpoint cannot
 be written back. Additionally, retry- mount skips recovery and rolls back
 to reuse the old cursegs [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [52.101.128.49 listed in list.dnswl.org]
 -0.7 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.128.49 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tAQ9H-00043C-TE
Subject: [f2fs-dev] [PATCH 1/2] f2fs: fix changing cursegs if recovery fails
 on zoned device
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
From: Sheng Yong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sheng Yong <shengyong@oppo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Fsync data recovery attempts to check and fix write pointer consistency
of cursegs and all other zones. If the write pointers of cursegs are
unaligned, cursegs are changed to new sections.

If recovery fails, zone write pointers are still checked and fixed,
but the latest checkpoint cannot be written back. Additionally, retry-
mount skips recovery and rolls back to reuse the old cursegs whose
zones are already finished. This can lead to unaligned write later.

This patch addresses the issue by leaving writer pointers untouched if
recovery fails. When retry-mount is performed, cursegs and other zones
are checked and fixed after skipping recovery.

Signed-off-by: Song Feng <songfeng@oppo.com>
Signed-off-by: Yongpeng Yang <yangyongpeng1@oppo.com>
Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fs/f2fs/recovery.c |  2 +-
 fs/f2fs/super.c    | 11 ++++++++---
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index e4d81b8705d1..324f948247ae 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -899,7 +899,7 @@ int f2fs_recover_fsync_data(struct f2fs_sb_info *sbi, bool check_only)
 	 * and the f2fs is not read only, check and fix zoned block devices'
 	 * write pointer consistency.
 	 */
-	if (f2fs_sb_has_blkzoned(sbi) && !f2fs_readonly(sbi->sb)) {
+	if (!err && f2fs_sb_has_blkzoned(sbi) && !f2fs_readonly(sbi->sb)) {
 		int err2 = f2fs_fix_curseg_write_pointer(sbi);
 
 		if (!err2)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 87ab5696bd48..42224c71ae20 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4738,13 +4738,18 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 reset_checkpoint:
 	/*
 	 * If the f2fs is not readonly and fsync data recovery succeeds,
-	 * check zoned block devices' write pointer consistency.
+	 * write pointer consistency of cursegs and other zones are already
+	 * checked and fixed during recovery. However, if recovery fails,
+	 * write pointers are left untouched, and retry-mount should check
+	 * them here.
 	 */
-	if (f2fs_sb_has_blkzoned(sbi) && !f2fs_readonly(sb)) {
+	if (skip_recovery && f2fs_sb_has_blkzoned(sbi) && !f2fs_readonly(sb)) {
 		int err2;
 
 		f2fs_notice(sbi, "Checking entire write pointers");
-		err2 = f2fs_check_write_pointer(sbi);
+		err2 = f2fs_fix_curseg_write_pointer(sbi);
+		if (!err2)
+			err2 = f2fs_check_write_pointer(sbi);
 		if (err2)
 			err = err2;
 	}
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
