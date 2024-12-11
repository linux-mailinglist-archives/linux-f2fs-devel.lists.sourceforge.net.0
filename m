Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B5689EC077
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Dec 2024 01:14:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tLANT-0008OZ-C0;
	Wed, 11 Dec 2024 00:14:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <weilongping@oppo.com>) id 1tLANS-0008OS-6H
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Dec 2024 00:14:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3OrDzgu8AS1QKRIzR1AKKi8ZBS9DAvpuhxDPK3L6pxs=; b=BD52iPI7NrUuTfFc9M+xNG7grP
 A+RsD7ZW7u+TGep+goh1lArgVp1ZKa2pzg7N7Pq+3lGqezJAoHTHpjRcxP1xyGl+nCAfkb8uJbf67
 8+l9S43D70NuzP0AbeFpyUKFENKIJ40tI/040pDneJYWCzBrwuKuax1Ak39YSbDE+K7o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3OrDzgu8AS1QKRIzR1AKKi8ZBS9DAvpuhxDPK3L6pxs=; b=N8g2ohhMiny1U38yzuHb7MxdpZ
 u4yzp6eUaEtElwspj/4OfVWVAcjVRZVbq6Z2KjLTrAIpSxz4AXgrgOrXcBJb69XIKosPJmT8wcDBf
 pd9leTg45ZQPbo2f2igs9dVxVQndWk3QzKAqMtT38NIVHiCpYDygRhJ7SG/9Tgu+pG10=;
Received: from mail-eastasiaazon11010044.outbound.protection.outlook.com
 ([52.101.128.44] helo=HK2PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tLANR-0002RU-DI for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Dec 2024 00:14:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hVVAbrBvAujHHa2O3hfgO+wSy2Ybi2/imiyRnYmiDwwE8b9HX4ChVN77l9pmlfD7osH81NiP4Pw28nXuNGX43GHCzTjhiPCP8tRx/txtwivQfKHo82LhpGzkEV8OoU8c/IvqwX4udFuEZGz4xJvAT8UfPGu5GLF/dvna3P0J4Fgq3/88UQK2/6JvtefwUIr066op167SF+yyRFuDOB1ecTeu87+RFi5wAE6bZgXWwWQ1tXyB4TUrF7hfkcCnOxqZnn95luC1dJC3I59qOSjzUX0B60a/CmZRXTr0WcD+h0ahxKX8Ytr+aGwHPhvi6IxWGyJiRU11YLpz5ifxQZEHJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3OrDzgu8AS1QKRIzR1AKKi8ZBS9DAvpuhxDPK3L6pxs=;
 b=KCQlyJSQZPnIvgbNRygRoFYEPGTjdGrhc0CTv009fT9CNSwOc0Phao+cImJHxa09/+ZOpKJd1CmHaV0YZ4S6FWfc2asHLU4x/esPvIrePwCRz71pp6EFtUGE/6DuiRvplGBl/ibE9O66p8yfw2dnJG4RcWnKEW+HMGyaPW+ss3vxLxfZCOMzjfJm1r7EKNZQuJ9Yj5Nx/oloPtzwu0EVEQaNROMFUpw2uvjmK6H46fPNslksDFcqwdzDl/2eeoSRNsuDaKeIjowfn4r2zyqNhb0L5/8ArsazH4QfAuyLNHBv94f7lc2LsTyutD7LhP4xhBuoyJLnS86gYd3RQjEZ5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3OrDzgu8AS1QKRIzR1AKKi8ZBS9DAvpuhxDPK3L6pxs=;
 b=iYZiAyupP7Ai877TFLLb66R6nPJT8UUO8hkRXlk0vYU75JnuJv43+VczrWicrqCGcUMCDjZJNtNMX3VKrfx4QJkl9MoUaLW8B6yMZoCa7HySo4zSC1we+xozrzJaTg0kRZedF7lj98w60qUHuiczCIZiAMFvbxbEJPuhO3aY9GY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEZPR02MB7967.apcprd02.prod.outlook.com (2603:1096:101:22a::14)
 by SEZPR02MB5591.apcprd02.prod.outlook.com (2603:1096:101:38::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 00:14:47 +0000
Received: from SEZPR02MB7967.apcprd02.prod.outlook.com
 ([fe80::5723:5b88:ed4c:d49b]) by SEZPR02MB7967.apcprd02.prod.outlook.com
 ([fe80::5723:5b88:ed4c:d49b%3]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 00:14:47 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 11 Dec 2024 08:14:06 +0800
Message-Id: <20241211001404.4120186-2-weilongping@oppo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241211001404.4120186-1-weilongping@oppo.com>
References: <20241211001404.4120186-1-weilongping@oppo.com>
X-ClientProxiedBy: SI1PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::6) To SEZPR02MB7967.apcprd02.prod.outlook.com
 (2603:1096:101:22a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB7967:EE_|SEZPR02MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b7de6a9-4ecb-46c4-da64-08dd1978d258
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fifuSQ7xm8mrOvQ1QT0H598EoiHlu26umblrqFsi2aICDKBinFDxAWglu52Y?=
 =?us-ascii?Q?AH/2SPp2ED7Y6k121KyiHhl4AnM14K/f2YyQx5Io+nbuqcuJ9hQlytabDSEy?=
 =?us-ascii?Q?29fOwNKOekq0VVrk1dlhbIiZ8IDuJA5jr8HwdmRKufn8iS83tOMBLS1k6508?=
 =?us-ascii?Q?5hun5mNOXdYWAmpu0tJI4UWH+gP7rJjej6TQPYUPmzUtCbkCmmOwRaTck0MF?=
 =?us-ascii?Q?b8/apSZhhwsHDCVhHU9ioL2RdHKL+DbBmYdkNV1f+NP8icUiI6B3ddZYQIAi?=
 =?us-ascii?Q?9pbcdygXRnd1TuxzupwIyE23ioRHggVvX83ddm/H1czXPL1+k2eedYK671d8?=
 =?us-ascii?Q?CG0f101rfzfq3pA/C4lMwvkORwNKvzNFvukEl6cvEVzD6EMcuVtWltSeE9p3?=
 =?us-ascii?Q?Bg9PQM1IvMehCuOLGLDOJOx/wovdP6F/WuDL5kOiMBWSElsvpaVB0/1RfIhx?=
 =?us-ascii?Q?aQm3nYa1+nO+HgN4URIJpPdw7IN0AQVrGiYOQyAvaKLA96RuTjiEfUxxtfF9?=
 =?us-ascii?Q?xFGCUz/r0whnkPU4yKoKi2wI6YD63emJs/5c57XPV9ewFuRzNLySO0m3xagm?=
 =?us-ascii?Q?5cozXzxia4HTa2iNF3mkbi0Bp/ajvAhOD7BEd2f6IuNvw7uReT6vqrX7f4ZB?=
 =?us-ascii?Q?JZ4ARHPLExn5TkIoIa0WyVLT+N+lUPzotiJ9vyMZ8G2u1XM8aqoGsyuvZHMt?=
 =?us-ascii?Q?UD0yAM0FKN+OQnx7D8MvHy5/fKN2vmkrCZrXcJtZnkuHIxKnoglQBphrmpoD?=
 =?us-ascii?Q?ZqdeczO49Cmy1PQs56mZiY1N5LDoLsHM4LM02dU6ARQYatncKf/HUsBAAgCv?=
 =?us-ascii?Q?YFSG5yTDo6x1vU2msxb1CA3s6+ZoGKLVRLKmzw82qwbh6QJYH5w06gVaL1f1?=
 =?us-ascii?Q?4GajL6CdB80IEX8wH7jbcbPegBjev0uGLMPpt8lXtDlGI+VzBnBqv5Ymp109?=
 =?us-ascii?Q?N9mXjk8Y7PTvYtEcqLm/JEQgC+seSTzjbyHTp2V9LHFxcR6N8b88TpBAo7wE?=
 =?us-ascii?Q?7Rz3QonLyZAxilj883G29EqdRitDJCyU6/pr33q6fq9qdb9aoNUrcBJwdpGL?=
 =?us-ascii?Q?7XeBAhNNJEecTlKEZqNhNQV4LFQzYxNVctV7F1OXYYPsGnp2ajo2vN2qBvdx?=
 =?us-ascii?Q?7nNTvzN0VJTzIdpzwjbMHhDu3FEO/I0Y1IUGWhVXtVBaUgFG4x5gOiEky8mg?=
 =?us-ascii?Q?ogQs6RDiFNs2fO+TvGYa4qxTxAV5yhfYwB+vSWz5G3TNtHnzuXRIA0raD7L5?=
 =?us-ascii?Q?0Au/mdkgX0G8OyiauSaW/REqDtCKhEVTyNc979+pBixkFBWT1BfyaJghPrpE?=
 =?us-ascii?Q?hEOXgfz1x6EP/VqMzPyYdf4lDaQvcFfopiMESO8keIcQFawGKvJ7OXuMTjEa?=
 =?us-ascii?Q?PhSKnSVzzyuXpK0qBhJvTdvyPqKWTEVxBt0x4aH4w8IrQagHYw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR02MB7967.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sXcnNaPKs+jAlEq5i88ij6y6UkILfXfLp8v6jdEUC2/CFLXne0nEu2yvUAZg?=
 =?us-ascii?Q?Rc5+ECxv0HwubcaTKyj8ECnmLlLcjPmfxpK1HUL/Gzec8+FWU6pMz/5zixRG?=
 =?us-ascii?Q?3xZo3BQKv9KrOB/cG2vruWC7Eb+NOSOVLIY5zBc6jNPfrBk9m1hvHmxUyFzv?=
 =?us-ascii?Q?w/cnnx50lCJC6dloAzz0i5d3RX/67LvEM+nDVCPK7AvNebIJZI+FDCkX2ml7?=
 =?us-ascii?Q?4XOssR9M0kTydqSGIXUJEzmuGTT6Ka3SgrX9eCOKXX4Hr1avbvfe/CQ41RXW?=
 =?us-ascii?Q?Kcnb7sX8kz5qPNpOyGElevCyb73hvF0JOCDnF7YjGDrIEDDRHVJQIpHyb6N0?=
 =?us-ascii?Q?Zg5MpIrTm3VtxS/KgTG/MFfxlB1el4qMkIG/AZvfNYrCH4kOej8xtvPa4Cd/?=
 =?us-ascii?Q?oSzvLAoM+SmGIsFI5kh84cfGUlIBY6c9FGEtPpz7uu1qEovDZ+nsjClKNxBu?=
 =?us-ascii?Q?GfXcuNVYfb4AUXu+aKraSf/nOtNUJG85dQk76I95Traw+jTqUzA79aZ0oBHg?=
 =?us-ascii?Q?Xyk/Ql3lFgE9W/MeUZB8o92x4A9uFqYlI9JCxVB5N77nMPnHyshJ/KdVQjiQ?=
 =?us-ascii?Q?aYWhdc3fUZy8hBMtrVsu2/0SiFLmOdpisWxPxJt2FiQXGhfKHO+YUXr00kTZ?=
 =?us-ascii?Q?KIYc8id3L0Y+c2jjrPp05W1UAGRW7KLTBjg/zdwlLGJmMOQQHIHjQPzuqLVy?=
 =?us-ascii?Q?9REKHGziVMPc6pLgtGJplievRMTFSdmY6iqYg2xemzC3F6BlB/UmBwSnl9be?=
 =?us-ascii?Q?z/4iX//GTesChlYviDFnPQdQOSgSG4KcBFDrHKHuXw0MpzRHNHFNjVuMOS2p?=
 =?us-ascii?Q?ZZVbK6JDKvxop2vcvxHdJxUUFlOWzOH6vYm67NKV5CkKvrgJhLVqDuw3A+tK?=
 =?us-ascii?Q?PxgxMNTNydFvwbdV4rI4Y7Ww2dzh6LgODk7Z9JtTMurvPJMbzZIDDyfG+9E/?=
 =?us-ascii?Q?houVJXPZDWYtSShvmsWi6L+xTaY66AOumwEGb/n1uzDHCbn7rS+40aDRz+uH?=
 =?us-ascii?Q?fBDDgQuF2pTcx/YVs4h5wSHx/jjX/rdGK0weCy3FVZ7MDcPoM3Vp4QSYwR4e?=
 =?us-ascii?Q?35g8TeI+VtLrCun4OBmmBDjDIS5SuQ6DU0lYRjZXWK4RKpzGUuGcfyt97iod?=
 =?us-ascii?Q?Ug8/acPQMBytKtU8bzWc1wfknqZjr/oefxI4xBB+8dNezvDWO8x0rj8DAXvP?=
 =?us-ascii?Q?duyve2hnOy5K9NH6bIuf0294IXUXkCGGIKSVahTl25GuUZR/dELRFER7Y1aZ?=
 =?us-ascii?Q?IKP7rcll4zctM1bEnLtCkYvOZFXQhU+vCO/szm/D7dUbqzOxmHcc0qn4hVzj?=
 =?us-ascii?Q?mjLAZPS2V8/9xMs2roKLT5nosmiHen07anEq0G/kC1Ahjyqz/317sdOl3VHn?=
 =?us-ascii?Q?yIBAF9n3H60KSdm3GeKnAhAttsBhEKQQ3rMlyEspQOvYTZ3WAof+GxvxQcS4?=
 =?us-ascii?Q?plvduFyYDioM/RiCR2RzlTUwCrHi83OM+vGJNRq9l9a62JoGu8ijPXJ9taUr?=
 =?us-ascii?Q?GNI43YZCkyZanEHVrJbpe6x3xSAjwRnU1eyH0I9uW6OrqcqciVhHlVz5sdYr?=
 =?us-ascii?Q?FKwtubPVhXb6fNRGcPcEameG7S4DfVky4vw09FyJFjLz749GCqgWujBk7VIi?=
 =?us-ascii?Q?Ow=3D=3D?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b7de6a9-4ecb-46c4-da64-08dd1978d258
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB7967.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 00:14:47.4627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G1UYbBoYwI+5gGNVNMWL8+B49ap3b0U00xrAYCHGGkxlNOBBTcehjgDYBVjsmWiUjF9LUv71UINBMapBQ/Wy1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB5591
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch will enable pread and pwrite support on Android
 platform. Signed-off-by: LongPing Wei <weilongping@oppo.com> ---
 include/android_config.h
 | 2 ++ 1 file changed, 2 insertions(+) diff --git a/include/android_config.h
 b/include/android_config.h index f5cd4de..b11e2e4 100644 ---
 a/include/android_config.h
 +++ b/include/android_config.h @@ -36,6 +36,8 @@ #define HAVE_FSTAT64 1 #d
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [52.101.128.44 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.128.44 listed in wl.mailspike.net]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [52.101.128.44 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [52.101.128.44 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1tLANR-0002RU-DI
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs-tools: add HAVE_PREAD and HAVE_PWRITE
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
From: LongPing Wei via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: LongPing Wei <weilongping@oppo.com>
Cc: panglu2022@gmail.com, LongPing Wei <weilongping@oppo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch will enable pread and pwrite support on Android platform.

Signed-off-by: LongPing Wei <weilongping@oppo.com>
---
 include/android_config.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/android_config.h b/include/android_config.h
index f5cd4de..b11e2e4 100644
--- a/include/android_config.h
+++ b/include/android_config.h
@@ -36,6 +36,8 @@
 #define HAVE_FSTAT64 1
 #define HAVE_GETMNTENT 1
 #define HAVE_MEMSET 1
+#define HAVE_PREAD 1
+#define HAVE_PWRITE 1
 #define HAVE_SELINUX_ANDROID_H 1
 #define HAVE_SETMNTENT 1
 #define HAVE_SPARSE_SPARSE_H 1
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
