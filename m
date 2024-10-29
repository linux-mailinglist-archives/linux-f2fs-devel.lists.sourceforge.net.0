Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BF19B49A9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 13:28:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5lKN-0008U7-ME;
	Tue, 29 Oct 2024 12:28:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1t5lKM-0008U1-Qr
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:28:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a3759lDW2XG3mIcQ07LLA7vNDxcRHU3ZF6wrqWaZn6c=; b=mquHbgAO1+qztbDseCvBzApQIk
 ZJKgaZZbsYYyD7jUbEFhWHvCDETbs4iGmY8McpCvWSy4iLmPV7SkkFgByntfWWDGbZCjiiBEEHi6e
 UjSSe6JbnFUbck1E3daf9S1inUyRXgi0wl9s++PrFHZoe2PuRbBwbpmRL4I51ps5M2NM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a3759lDW2XG3mIcQ07LLA7vNDxcRHU3ZF6wrqWaZn6c=; b=M8PRXE4sMsiR2XLRT6SyiwHR0o
 6gyKFQIxFmT4YloM7ogYg7jOy95ZcB74XN6MBpunYCXAfXE33/c6ouLXEE9dCVWQWniku7q3VuN0a
 mvNIG0+O9YPBLPQFkUXcah69+F//impG0jfXuXE+ImYCKHZFiYv+l8/e3GTdGyAXUJZo=;
Received: from mail-koreacentralazon11013000.outbound.protection.outlook.com
 ([40.107.44.0] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5lKL-0000i3-EP for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:28:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OlBbSbCGSMvuidlDFjLr5zbBxXGjKlqUwfLLeaiNEyG8i2yAhW4nR8cGN22D2Ube06lsca8QsHRh47VoRE0HTMZliTQaNAUhghc8mc5NzY5vGBvxNo5kQPv6RLfBWvgU7ZVfISCXqL14TXmmzG3R6P725Kz1t5TRMzqVopB8XbhjLFEBg1K4hvNVZy84dC+IpRc00m5eGF5PT2x1TQkDSTYLLawLlKFxeIY1g+iz4KhHDTUhTz0ah40MWQfRwj9rhQIrkqD/PMlSy0JzsH2vozcLc6zuli3+FYvQE/949hIBbdaojHFBUX1i4BVaMO4YAc4lwfavQMgye44i6RRGEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3759lDW2XG3mIcQ07LLA7vNDxcRHU3ZF6wrqWaZn6c=;
 b=pPntV7GLVGJ681eWEupLLLa5VEbJA/a8MGuhIMSTJ17mqiCCGVJ/OfBFvkzFkRWAI/MYtfsbyc65X7s7eJ10V8OlgrgY/CLkMxG6ZtsfgtH2P7q9G/qWaRFp5hAH8N1yqURKd+dAD+20WkasQOn5mYYuVehpcg46X+2BpPny99k8DTYgAbD147T/IojXKyNMoSxckj8/f3kHpJL2v8qr+BU1+NgXlekIXhFx3jrPA0PvBcE4Cs8zr/5LeXxYdExiibhURqmXMPTa71myaZbxHRe3nOH82YrvtpzF3QGneYsaZkwkCWZrRpGC4zP2d5QcWh5ca2+0rMp2QTTmoAuItA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3759lDW2XG3mIcQ07LLA7vNDxcRHU3ZF6wrqWaZn6c=;
 b=Sa+pMGfx3pDe8s0rsLK2Uf1Va82kITwbxVeUPVxT0PaN77bJ+29pYjRgOSjQ+p4glQdDWce/e+h2XbXL1wTcM2sRAXE3SgDxyX4sq48y1AoBoBld7CUZC2UdckaTkyBt0EPMjDxYwwo9Kbld9QfRMLcRfhdHoKYTLhYL2UmMXYw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TY0PR02MB6982.apcprd02.prod.outlook.com (2603:1096:405:e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 12:11:46 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 12:11:46 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 29 Oct 2024 20:09:48 +0800
Message-Id: <20241029120956.4186731-17-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241029120956.4186731-1-shengyong@oppo.com>
References: <20241029120956.4186731-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TY0PR02MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: 84447fa5-4d8f-4722-1b2c-08dcf812dc27
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Bqm6jqTSf9eBAuUiIlyoltORi1D3R6pZtfZ6fBGsboiOPP9JCCutv+6IVrDw?=
 =?us-ascii?Q?+4UuORXWYqa7khpAFWhNTJT1o1e0apVHvzrwcvqVu8HFDF9zIzxFmhVIUcwo?=
 =?us-ascii?Q?YKiEpPG91EBtQ/0ULOHBLlCgAsy2yQfvFGHTBHVAlw/E5zZRM0if0L6XaeHs?=
 =?us-ascii?Q?PmlDojkkn+JCuvUrhQ/gVrCJRET8Wld6mJ5tcnr4EDa+F9fgeF+Ub6Ij/z7C?=
 =?us-ascii?Q?qlXoF6G1+lL0ab48i0kGHlQ/esrmZzriaVD7ga+druLqVptyjkxZh9CzAfwC?=
 =?us-ascii?Q?BONKeaGLNp0xT9eOjlx0XfL4mR/xLkyvek9+EbE6tYBf7eOS1yhRL5J6odOW?=
 =?us-ascii?Q?gCTtpT8UEVG4zrh36vg4HJm28tYnmqTmm4O+IzBLHZAgDzeEtRGI2wTTqI5T?=
 =?us-ascii?Q?tVdUCvP3r2RuJE/2ars2OXnSVbfSvTaTKJZwKcm6USjnQrZnweGAcyHbZ8nH?=
 =?us-ascii?Q?K3DTR+Rc6aRDw+mxHSlO4ASkjf/zEr3s8fSPO3x3oOZYO2hJIA2akqtssdl+?=
 =?us-ascii?Q?dL+ypUftDGH5lBVj5gdknzZHgc3u8g2TghJIzp7XlTbWc+HhlTO0VMoLSA75?=
 =?us-ascii?Q?3P5Hp6vjH+4UUn9BQ5Y3JWLpFdDZlZqB6k5M2oLmzh52Wli75REt/s0HXWkk?=
 =?us-ascii?Q?pErw0w+c10d6CcnE14fbIu16jTPFKcspYEoTF86JEIocI/V+5Y4bW4TFnj8f?=
 =?us-ascii?Q?+fBVWbj5yvgL4lFhwgJ/6VrytcJ99z7yOBhHnSpBCsvcxMW/qnTRflmIEFZx?=
 =?us-ascii?Q?tCLbunJZGPPs9FPpZwnVY52fsLzOL0EOTK2w0cwpHJuTdtZ9TLQFx0EGW5wC?=
 =?us-ascii?Q?Fs1D0xsTFyv1ZwRskpwt1bdSxAY5pASKp0K8bQ1nfpF7gEU/p6Oe2FoATmcV?=
 =?us-ascii?Q?B2DCFCKzKCR0z2KFEc3Hwq9fDq0VMIhz309LiTUHsWSol42/u/DByKZ6YL9K?=
 =?us-ascii?Q?NbW1DbeVT8+RkTIGaKo7xJZ68GKyNt6gnujEXZvAEez1I+YlLxbp9v2FNJVb?=
 =?us-ascii?Q?io2S3syyEtOR7z6YUAih+oksDUUB1VKH3no58Dg8C8IhTLB7ZacLCwatSWkf?=
 =?us-ascii?Q?fxn739Zy05LNeIb6Df+AIT8/vP7JHOL+ocHp5tIe07rraQjuX4qVlMRlRsT4?=
 =?us-ascii?Q?BPJrlL1wlA1xnlWGS7WBJ3K21J1MQwE0OG0H8fljtuLQ0axtASbdiDlcbpmJ?=
 =?us-ascii?Q?/Nv3KUFJ/+abCydfA5b8k0oyEg7aBmNdlLzo8CgyqCc5i8z9MRrcze8iELiy?=
 =?us-ascii?Q?jgrUWDHSe+H1SOSr3vMIhxNA08DdLTAZU/FTC/qirDxaE/irF5Bmxi9o9mFS?=
 =?us-ascii?Q?5m0jkGnQgtkyMNTz2Zz313gTbNnIi0maHdqyb9/wpQzxxecdBPLBmBM94EQD?=
 =?us-ascii?Q?XLYd+eo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?+L8sUWm1XFsVlsfa+cy7Ut+pvrL8ofyX4HxaUfmTW2+/37NHtdwc63lztKtn?=
 =?us-ascii?Q?40zcr/TEgGNesEeOsc3COdq1f7+HN7p3wyc7mQfAN071Z5ljgKsngkAWCU8X?=
 =?us-ascii?Q?r6BOD6ntICG5oahmdwT/mIbSlpTuTEtGu2o8+9kfnpKc6yT4OhT89rKBXYrO?=
 =?us-ascii?Q?LhIaPx8EC5/CdMyDzMhdawC920svMa1FYy16tShvufDU7FlOqJbG/OgB4mjV?=
 =?us-ascii?Q?9kx5/g5iyDsgDimAssuSlfkP4fL0fdiNKVUz+VoSYc6VPUV+a8EatdLB0T+d?=
 =?us-ascii?Q?hhGzRBoE/YCZvV/Ndj+8p+ndkf7PFr1YDTo63jBW57aL6DyV2VdSbnyW7STS?=
 =?us-ascii?Q?1KS3H9iPgUUTjWyYhn2Vf3HOEPJ0z9DxUk8viYrTBFyPx1E3cbxekTdSMnLm?=
 =?us-ascii?Q?tWW1F1VFjKwmPum5Amkevypl4OOWjVfUygPWVyHlEIOHQoa2h/UwHsygcoqn?=
 =?us-ascii?Q?05Nm7tXJGkFssfXHWBRWwRqyghKrl+Wx6wGZOdfCUblHvP1cMwwuN5eCEi09?=
 =?us-ascii?Q?ecZq4Kafl2RffphfpNN65ZqmkprBI6x96GZH0I8np67qNQILpt/amyNj2Dy6?=
 =?us-ascii?Q?cr8xlrmruDHTGO9GX0JeOoy3oOHZkM4JnbRaEwvU7E3H4QoWfe5OU5YfXWIq?=
 =?us-ascii?Q?PSvijVl1N8PIiOZggMHmoH9/UBwoFwgj10uvfRsfK7vSPx2VaQCsx7deDsw8?=
 =?us-ascii?Q?mcsq/0lz9XD72N5X3r2em06QWMFE1zhyA4p1F/t8/9lD8EIkpiI+NwAJz/0Q?=
 =?us-ascii?Q?vPBpOovFmmTlFEtqGbD1gkNoQNxBUpTKRLNwYVa0dJvcQnxZZ64l9P1/uuhc?=
 =?us-ascii?Q?dV0ObB88OtPMZqdqDeDxQu75ZQVpP9tcE4G2hBsz8A/L91GytMDqIylzVRFM?=
 =?us-ascii?Q?RTidZvOzqx/jbA4VNTWUzGogE/HC6Z4kCo6EVADZ/1xNMiDd97pVNBFb4R3x?=
 =?us-ascii?Q?e6bHgiOW5xtqFqzzFMrYSQnEiBnPWV+muPY5sVfthOf7213S/XSia64C5O6S?=
 =?us-ascii?Q?UFVwOVxPExAd1y8nwmJPUk2GrGzGIOX2ACuyzf5hdmVp9RKCasWe4tiLMrMc?=
 =?us-ascii?Q?avNs52kxes0NUR7zcQgEge3JzhGs3qRnFhJqD9jhUvrYs7Nq7YBpvEL4mhgF?=
 =?us-ascii?Q?gFwA+Jhh3I0rWdOtDydTxxWjfTu84fSTOl5q3+6WiNotqFe2Qe+bHifJbDtB?=
 =?us-ascii?Q?gLwGOPJO+p4MtNoX/TClej/JVMsNFpww87kG8y2cvtvJt+99dkYsRDCE0mSD?=
 =?us-ascii?Q?qbpqvEcDHJdi1l6x5tFZEMK9pPDymBE6C9TZYCD5hc67Bz712Nm7dEwH1qRN?=
 =?us-ascii?Q?NTokfE5yajusVZ8okOMaJ/ycIyo0sXGuFCn0FQ395EvQATs9x1PJtC4szxBz?=
 =?us-ascii?Q?vbeflCWtD9a+OivcbNJkvaPO4pTEFHwr0H816ORKq0oeawZecq+AGAw+WpQG?=
 =?us-ascii?Q?lpgRLbcYabEG/Gw8tOMoLi/KkPTm8TPcUYVr/zCPwV/iohItEsu6OfI9Lwqx?=
 =?us-ascii?Q?biWzTagWekrRctv8jLaI9xAUGSEuWDmm5lfMkWOTvyXW3O8H4NN8p3hw64RJ?=
 =?us-ascii?Q?eSXW89zqzTd5KIyeWaGtTdQOsWyq0GMyAJl551LH?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84447fa5-4d8f-4722-1b2c-08dcf812dc27
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 12:11:46.8090 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mq5jWAhCq9LNVjEHg1yHREPxWvGamuRIy20GcnkvjgRkasXTXyuIQZtrz9NqT9u9Cf+N5F+ZGmYZ8m69Mzj1ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB6982
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Sheng Yong <shengyong@oppo.com> ---
 tests/f_sit_bad_valid_map/README
 | 5 +++ tests/f_sit_bad_valid_map/expect.in | 35 ++++++++++++++++++++
 tests/f_sit_bad_valid_map/script | 50 ++++++++ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.44.0 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1t5lKL-0000i3-EP
Subject: [f2fs-dev] [RFC PATCH 16/24] tests: add fsck testcase of fixing sit
 entry valid_map
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 tests/f_sit_bad_valid_map/README    |  5 +++
 tests/f_sit_bad_valid_map/expect.in | 35 ++++++++++++++++++++
 tests/f_sit_bad_valid_map/script    | 50 +++++++++++++++++++++++++++++
 3 files changed, 90 insertions(+)
 create mode 100644 tests/f_sit_bad_valid_map/README
 create mode 100644 tests/f_sit_bad_valid_map/expect.in
 create mode 100644 tests/f_sit_bad_valid_map/script

diff --git a/tests/f_sit_bad_valid_map/README b/tests/f_sit_bad_valid_map/README
new file mode 100644
index 000000000000..5306bdd31ae5
--- /dev/null
+++ b/tests/f_sit_bad_valid_map/README
@@ -0,0 +1,5 @@
+1. create f2fs image
+2. mount f2fs and create a regular file and write data
+3. get a block address by dumping the inode
+4. inject bitmap in the sit entry of the blkaddr by clearing its bit
+5. fsck fixes the bitmap
diff --git a/tests/f_sit_bad_valid_map/expect.in b/tests/f_sit_bad_valid_map/expect.in
new file mode 100644
index 000000000000..e1a287825d56
--- /dev/null
+++ b/tests/f_sit_bad_valid_map/expect.in
@@ -0,0 +1,35 @@
+Info: Force to fix corruption
+[ASSERT] (check_block_count:x)  --> Wrong SIT valid blocks: segno=_SEGNO_, 512 vs. 511
+Info: checkpoint state = x :  nat_bits crc compacted_summary unmount
+[ASSERT] (fsck_chk_data_blk:x)  --> SIT bitmap is 0x0. blk_addr[_BLKADDR_]
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Fail]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Ok..] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Fail]
+Info: Duplicate valid checkpoint to mirror position x -> x
+Info: Write valid nat_bits in checkpoint
+Info: fix_checkpoint() cur_cp:x
+
+Info: Force to fix corruption
+Info: checkpoint state = x :  allow_nocrc nat_bits unmount
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Ok..]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Ok..] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Ok..]
+
diff --git a/tests/f_sit_bad_valid_map/script b/tests/f_sit_bad_valid_map/script
new file mode 100644
index 000000000000..0064c26979d8
--- /dev/null
+++ b/tests/f_sit_bad_valid_map/script
@@ -0,0 +1,50 @@
+#!/bin/sh
+
+DESC="sit entry with invalid valid_map"
+
+. $TOPDIR/tests/helpers
+
+cleanup pre > $LOG 2>&1
+make_f2fs >> $LOG 2>&1
+
+mkdir $TESTDIR/mntdir
+safe_mount $MNT_OPTS $META $TESTDIR/mntdir >> $LOG 2>&1
+if [ $? -ne 0 ]; then
+	echo "cannot mount f2fs image"
+	exit
+fi
+dd if=/dev/zero of=$TESTDIR/mntdir/testfile bs=4K count=513 status=none
+ino=`stat -c "%i" $TESTDIR/mntdir/testfile`
+safe_umount $TESTDIR/mntdir >> $LOG 2>&1
+if [ $? -ne 0 ]; then
+	echo "cannot umount f2fs image"
+	exit
+fi
+rm -rf $TESTDIR/mntdir
+
+$DUMP $DUMP_OPTS -i $ino $META >> $LOG 2>&1
+blkaddr=`$DUMP $DUMP_OPTS -i $ino $META | grep "\[0x100\]" | sed 's/i_addr\[0x100\].*: \([0-9]*\)\]$/\1/g'`
+echo "ino:$ino blkaddr:$blkaddr" >> $LOG
+
+offs=`offset_in_seg $blkaddr`
+idx=$(($offs >> 3))
+mask=$((1 << (7 - ($offs & 0x7))))
+
+val=`$INJECT --dry-run --sit 0 --blk $blkaddr --mb valid_map --idx $idx $META | grep "inject sit entry valid_map" | awk '{print $(NF-2)}'`
+echo "valid_map:$val mask:$mask" >> $LOG
+val=$(($val & (~$mask & 0xff)))
+echo "corrupt_map:$val" >> $LOG
+
+$INJECT --sit 0 --blk $blkaddr --mb valid_map --idx $idx --val $val $META >> $LOG 2>&1
+$FSCK $FSCK_OPTS -f $META > $OUT 2>&1
+$FSCK $FSCK_OPTS -f $META >> $OUT 2>&1
+cat $OUT >> $LOG
+
+BLKADDR=`printf "0x%x" $blkaddr`
+segno=`get_segno $blkaddr`
+SEGNO=`printf "0x%x" $segno`
+sed "s/_BLKADDR_/$BLKADDR/g" $TESTDIR/expect.in > $TESTDIR/expect
+sed -i "s/_SEGNO_/$SEGNO/g" $TESTDIR/expect
+
+check_result
+cleanup post >> $LOG 2>&1
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
