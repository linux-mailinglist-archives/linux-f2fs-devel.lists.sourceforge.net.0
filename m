Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39EAA9B4950
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 13:12:16 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5l55-00044k-0G;
	Tue, 29 Oct 2024 12:12:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1t5l53-00044N-Qp
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:12:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mjkCV3Ra+l0qYLj4JLSUG7YBWRHNs95IifUoKflIWOw=; b=nWHOuaP3nA5PfIuyUhZ4xUb2Ix
 25K4aRsrH05GoW+2xcXi0D5Z586NvLnraiVsStXoxj8pzNL2U13lEi4ee5Qql5gBbXNDrXKCoAA9w
 1kE5o2ciRkNslMdi1iMZUNRufw1/2u+Q8C0JTN4Pz0CJKUuARYHYsKvKBfFlCFCEFTbE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mjkCV3Ra+l0qYLj4JLSUG7YBWRHNs95IifUoKflIWOw=; b=SKLAZCoqu3I3dqphBsADdFcQr6
 tCQ97739nYndxK+BIhVWekbeM67cwm4g/B2tMhW6PT4xSim4gej2SUYJJf6cECmBSC6t876sEiTfV
 hFpV/U+fC9Z6K38c09CUPrODYFrFUbD0pQqTZUzDpa4s3Vx6fNwdxhNXVyiE7/Hyvfvk=;
Received: from mail-koreacentralazon11013051.outbound.protection.outlook.com
 ([40.107.44.51] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5l50-0007Sn-8R for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:12:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJX9Yjv+zyJUF8/QG3ocouApFIzv7lMIYskLzrtYT/BtX6p3Cx01SYdwq91EIbzBBJSX4P7JlWODG0Ur0gx+SoMqBnStAmkvUFyTgf0ulmsREsETNVZVealBFkfCK8+VN1c2mzYRnVq+ct2sm4sSqb7tVPf8un9pv4sNaE/2/rY8iz5IPUEweIOTCTocz//u/iQbEeMONkSulvOrP1/kmzbYXTzWAhKA7XDuLvRuHvh+GLIZS7ga4ksKQ57ol21wn5ENb7iMltLxRCJ8x+CO6RfmeiGWyqu9lH9xLtxcdNZYh3d68obXQCPjfoHTP75CIdpFwDoiYeSxeeq7gNSBgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mjkCV3Ra+l0qYLj4JLSUG7YBWRHNs95IifUoKflIWOw=;
 b=LXrfUDtCDOxa+ZnmMicUr/M0JOZXP94YFApeM5wen1fHx1k2r2qXfKs8yo1dKiq8sumDA7G8HhzUv+X7MibpsOyD9T4P1mV697BgIuX+5En5wdTipIUe+aXwjeUbLIxOu0Y8Tg8pnB8W0chGRRNdiDp5fv6hbl5VNZ7UAGmojYFlkgSkFxL5P6JxiUFNnTsW3Rdz6r+FRAGCG9dMyB/5HJ29vj+P42m4F6twHZsQaeMAdr0CmSNjhoSgrMZ2oGEJno0pUHqiURtV+yCMUyhrUsFWhqQvGDoAbj+0FC8sB3aFh47AQC8Kao+/TdiLEvttjLF3mtPu70JgePaxZRTOqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mjkCV3Ra+l0qYLj4JLSUG7YBWRHNs95IifUoKflIWOw=;
 b=apmJYLEslMll7yAlnTEgI1GkwtlA1IzaYBGyTDr9DmUgkdphRKnP/UgfJw6rUp0qjiWTOzFSyquYcrCHWIaH2XdVf+O7jth50/BZUmJaGox7/8cjATmKrDy+sLwg5zUQxW0V0BlitjLTn6wwQiDW0UfEnhbMz57wOu6VQTaSsWY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TY0PR02MB6982.apcprd02.prod.outlook.com (2603:1096:405:e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 12:11:56 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 12:11:56 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 29 Oct 2024 20:09:56 +0800
Message-Id: <20241029120956.4186731-25-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241029120956.4186731-1-shengyong@oppo.com>
References: <20241029120956.4186731-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TY0PR02MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: 8629016b-d582-4065-2cfc-08dcf812e1dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?C+C39dUzposgteov/UCzYd7aXi4qkE1KWzjf61aiW3syoy3LnZWI2kWnZXsj?=
 =?us-ascii?Q?c2+EFRLqHl7ExeeHEcTe3Oy6kJPJzxQDXMYuEKOlbWEAVI/7JvNihHGMV8rw?=
 =?us-ascii?Q?nNWUAQEMfCdRq0dbXHAGPFz0nP1bwyHzKFJnaFKN0IkVJlyOS0ypz2PbsEMv?=
 =?us-ascii?Q?wlgA4TfLwd66UOd3wRlNw0SSkkj35+wT1ObdYFb2UF3pwItG7bASqCSIawv3?=
 =?us-ascii?Q?4+Z75QuhrDOhKnLI5sKJbYWyzotrJ4fYWNLDyb903UpE/SNjnQB1L5lccwaB?=
 =?us-ascii?Q?6TMxQQbg1Q6GeXndlw67SApWgJ1deBD2ImYBzu9TppR/aFbQzV0kgmWXhsmH?=
 =?us-ascii?Q?5O0MT45PpJq9MCUYWXN3nrOYI8XetMnoOFHbb4EWN+PqdKFYnaAR39UF0lYk?=
 =?us-ascii?Q?RZ5GTYcsQVlTJ4Uxmh52u8K6aI8CJxK0ovUnyacKLuVlyP1Yl6aQhJnIf3AG?=
 =?us-ascii?Q?i3gQewWb+3EjmKYiNee7yrMV9rwn9vijSDVu+lAEZmCqg+a0QDMWHEzSkkmO?=
 =?us-ascii?Q?cJQZ3H4gLzcTzkI3ysb5s/EYAKOUa0xRFauCSAiV540KfVwywifbgM99snVk?=
 =?us-ascii?Q?XSk4jR/fkYqAUAKajXZcQRN3NU6Di30GRKgB8kroyLmG0KCpcLVyA4v9tJR+?=
 =?us-ascii?Q?XlfxTM8VeWQJe9UmnKiuhBD+gkb8kj4BFe1/clGMsLpY3kn4ti+ZiUOtoG8T?=
 =?us-ascii?Q?84KUjq8m+7dj4bmSR75XwmGBjvZh9Va+H1wMDd3/oOIzS+kGFNKq0cdWk1rh?=
 =?us-ascii?Q?lEyHqVzAVQLy29i2PgpNm0+I6vAUB6yNdP4JCtl31WhtngkfFdZb06ni9Q2A?=
 =?us-ascii?Q?zgob2eeul0hLNPAhFGH9iG2vkKiOMBoRz4k5EaSB2MBmPV4DFvYlT1a+mV6x?=
 =?us-ascii?Q?b9fRC5S04SFxVcCIeu8VtQ3GQdvWxVbUxp9YxNOdAdtXNI3BYDura/WJVzFc?=
 =?us-ascii?Q?aMvkqKAF54T5+jA3ewpYeqMYy5W67vcWzMogTpQVsPMEH4cpJzCMNZafluss?=
 =?us-ascii?Q?vR0QvN+LA9zPybAonSsmP5TUeKEwFAZIvEzSrkTp7IRcG4/iNUN963BOOjoA?=
 =?us-ascii?Q?/cBCCfusUOH43CuWcBmio/+6sptS6LE7tIZu9VaPczG3PHoGvq0gLZAjqpVZ?=
 =?us-ascii?Q?AzjHQ3O6+m1K9kR8UsVOMgz4yGI9lugiRYltgCC684vpgVisAu5TVVE9trH2?=
 =?us-ascii?Q?Vy5dSr0E+W4dlVDh4TsGP0eMsebk7EgNOJ0iQz1QE133C29VDxgIm4dgsGPg?=
 =?us-ascii?Q?8/ssIAKCl3imTrdlK7G4CWnrvMY0LXIeVpKyoRJtQbklXjv5/0LNhoKZD9De?=
 =?us-ascii?Q?Pr7cq5PENEQIUTThHq49h3JE5Q/WHJpOyB6chuBb1BD/uY2PDHay6YItsAsB?=
 =?us-ascii?Q?pfKXdGw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t5MEyStuM9AY8B9JIM1o6K7YDUahXf8tqzqF48Akp+wTP6qB9i26nBFsaeV0?=
 =?us-ascii?Q?aeFwTDUfnRlxDjDbW2eR1K1pl8Xl+n/EqZV+sWVGWt4rF8zaGYg8Pb7nVLkx?=
 =?us-ascii?Q?7t6THaYgUY7j/nnkouaO1VOChiZfdLv4liOYv54Q++ZxW3h+YwF/cUU07iuK?=
 =?us-ascii?Q?Cxuj1mmY+/V5yNcs2EPKjYTbTYNRGnkbtl1RoeOdV+GcjzmaJTliypS7JUYw?=
 =?us-ascii?Q?ddZZN3lfVvTQ1BUxrsMbYNuKxoz5AKNq11CPLtJ50IMyHajMn0fxNa47fSlr?=
 =?us-ascii?Q?x+vrzylSbFvfwf/L479HHPz7jS/oVthG3i2YRloRC5x0k9tFwqgtUKhiHt2I?=
 =?us-ascii?Q?0PsxZszvBVpU8c1TauerSYfjG6Hn0pzJ6waEc6sGs+lqNBflSj7faJ6CY0AB?=
 =?us-ascii?Q?l3Q1VjPdhuW0fpYJg3NyPxilFR0OIbmLATQzq+SD4kkLbG7bS3v1cJGAtr0V?=
 =?us-ascii?Q?rzEK7WXWUvpkJ0PwYULgmbLU4MhwR5iVOeMDekq9n5MmiVlrRa9nY7+lP4CO?=
 =?us-ascii?Q?7zpxcad5Fk5VQbp7IdBd3bHpfAUlARpgTalOEM5Nk0GYlixY1SogiYVUwJq3?=
 =?us-ascii?Q?XmN1uAJjX87s0Dbv0ZdUx8+/Gf2M4aq+Ykc9sCLWBhejXdhwoaslt2stysOL?=
 =?us-ascii?Q?ruD+rMD1Qlr+1SWjTX8llyrq+rNNFizjohnoXABuvrNX2hcx9WSwZDGhbHId?=
 =?us-ascii?Q?pPwBHf4guaG0oyqnO2hJn9z5gURZWMEsZ8ogfVrgT12tHoPdCTi6YGlsBbZQ?=
 =?us-ascii?Q?OFlv7Qc2ski2tMsriRfLqrETs5vw0KWusy1kUNNVVX1mhPEc0AhML+tWkZVA?=
 =?us-ascii?Q?5Z3+STsqcScPNgKlL0gzVG8/iMsY3oOfz7RUmdbGT3+/V/RavJ3h5U0VQSM+?=
 =?us-ascii?Q?6HzWh8r4nsyChoPlrD+A03fwd38MSqSBrok7MBjKNrgrJSrXdoDAA2cEtr8Q?=
 =?us-ascii?Q?c/lTpV6wVfd7xsZinzsCuQQIfjOOvG7He25zqzAt5a11oP3DnzywhpVkGj0M?=
 =?us-ascii?Q?eaj3TSC85dzx3SwQX/bLoMr0knFfKJsbtRTBiD1KCLY2fMvAW8h7OFqs7Fkk?=
 =?us-ascii?Q?pMI008HwYgztHUaf91dzFcnDiu9sfgxMYs0PDJElGZbUAjCw7ttY3HxqQ9WF?=
 =?us-ascii?Q?jY9DlrxShsoAC2UQ9kqFufg8sbJGonO+xi38xsnRJFFEkhnhRWLqp3bmpXNk?=
 =?us-ascii?Q?IWLe7QAMsnseu6dgXZkzOPNDiHDETPxCm3cTaqWGEEPQOqowMU00vOFowkqz?=
 =?us-ascii?Q?CtlP1+xwmd3KDXD0v1pcvFLHqznHV6oL3onNt6l2qua5h/qVUgt/ZTU2q0ZF?=
 =?us-ascii?Q?IZfN3DMM0rKpbGLhs8i3dcjFYT9mWNCXoDRGspBhCBLJpoPQCs8O7m1heqQj?=
 =?us-ascii?Q?4YH9nXKYNaUU7VE4b0rQ7ineQxqwPWSLY1ywcrfr+u+0g8IwEVDdnsQ882QI?=
 =?us-ascii?Q?1ZyvchgYNRMifL0Nv4T3uBKsL9kT3nBE/EuxLgEAdr+bh+rcXAoJnJD/EgFX?=
 =?us-ascii?Q?meGg37lIp1TK0tiIUbksnU6AgVPFSIxtAIpXa2EvkBLrvy+6cbWqtS0cjvgL?=
 =?us-ascii?Q?fJaACphEHERpsbxQeowGDTDOfMOaH7sVAQN2/5wm?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8629016b-d582-4065-2cfc-08dcf812e1dd
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 12:11:56.4879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rz02QyiTZnMXGEczMfAOuk58y0OwbYTxkLXf5f9Skn0zz4ZrARQUi/wPZ5D6YPd3h5FtCMHpo00nC+ry9EX2cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB6982
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Sheng Yong <shengyong@oppo.com> ---
 tests/f_loop_fsync_dnodes/README
 | 39 +++++++++++++++++++++++++ tests/f_loop_fsync_dnodes/expect.in | 40
 ++++++++++++++++++++++++++ tests/f_loop_fsyn [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.44.51 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1t5l50-0007Sn-8R
Subject: [f2fs-dev] [RFC PATCH 24/24] tests: add fsck testcase of fixing
 loop fsync dnodes
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
 tests/f_loop_fsync_dnodes/README      |  39 +++++++++++++++++++++++++
 tests/f_loop_fsync_dnodes/expect.in   |  40 ++++++++++++++++++++++++++
 tests/f_loop_fsync_dnodes/imgs.tar.gz | Bin 0 -> 173228 bytes
 tests/f_loop_fsync_dnodes/script      |  16 +++++++++++
 4 files changed, 95 insertions(+)
 create mode 100644 tests/f_loop_fsync_dnodes/README
 create mode 100644 tests/f_loop_fsync_dnodes/expect.in
 create mode 100644 tests/f_loop_fsync_dnodes/imgs.tar.gz
 create mode 100644 tests/f_loop_fsync_dnodes/script

diff --git a/tests/f_loop_fsync_dnodes/README b/tests/f_loop_fsync_dnodes/README
new file mode 100644
index 000000000000..77dcba497f2d
--- /dev/null
+++ b/tests/f_loop_fsync_dnodes/README
@@ -0,0 +1,39 @@
+1. prepare f2fs image with fsync dnodes:
+
+	mkfs.f2fs $MKFS_OPTS $META
+	mkdir mntdir
+	mount $META mntdir -o mode=lfs
+	touch mntdir/testfile
+	f2fs_io checkpoint mntdir/testfile
+	fio -rw=write -bs=4k -direct=0 -size=4k -numjobs=10 -name=testfile -fsync_on_close=1 -group_reporting -stats=0 --output=/dev/null -directory=mntdir
+	f2fs_io shutdown 2 mntdir/testfile
+	umount mntdir
+
+2. inject fsync dnodes to generate a loop
+
+	inject.f2fs --dry-run --cp 0 --mb next_blkaddr --idx 1 --val 0 $META
+	    [inject_cp: 592] [   0] blkaddr:0x1201
+	    [inject_cp: 592] [   1] blkaddr:0x1202
+	    [inject_cp: 592] [   2] blkaddr:0x1203
+	    [inject_cp: 592] [   3] blkaddr:0x1204
+	    [inject_cp: 592] [   4] blkaddr:0x1205
+	    [inject_cp: 592] [   5] blkaddr:0x1206
+	    [inject_cp: 592] [   6] blkaddr:0x1207
+	    [inject_cp: 592] [   7] blkaddr:0x1208
+	    [inject_cp: 592] [   8] blkaddr:0x1209
+	    [inject_cp: 592] [   9] blkaddr:0x120a
+	inject.f2fs --cp 0 --mb next_blkaddr --idx 6 --val 0x1202 $META
+	    [inject_cp: 592] [   0] blkaddr:0x1201
+	    [inject_cp: 592] [   1] blkaddr:0x1202
+	    [inject_cp: 592] [   2] blkaddr:0x1203
+	    [inject_cp: 592] [   3] blkaddr:0x1204
+	    [inject_cp: 592] [   4] blkaddr:0x1205
+	    [inject_cp: 592] [   5] blkaddr:0x1206
+	    [inject_cp: 592] [   6] blkaddr:0x1207
+	    [inject_cp: 592] [   7] blkaddr:0x1208
+	    [inject_cp: 592] [   8] blkaddr:0x1209
+	    [inject_cp: 592] [   9] blkaddr:0x120a
+	    Info: inject next_blkaddr[6] of cp 2: 0x1207 -> 0x1202
+	tar cf - meta.img | gzip -9 - > imgs.tar.gz
+
+3. fsck fixes fsync dnodes by breaking the loop
diff --git a/tests/f_loop_fsync_dnodes/expect.in b/tests/f_loop_fsync_dnodes/expect.in
new file mode 100644
index 000000000000..3f0790224663
--- /dev/null
+++ b/tests/f_loop_fsync_dnodes/expect.in
@@ -0,0 +1,40 @@
+Info: Force to fix corruption
+[ASSERT] (sanity_check_node_chain:x)  --> 	detect looped node chain, blkaddr:4615
+
+[FIX] (loop_node_chain_fix:x)  --> Fix looped node chain on blkaddr 4615
+
+Info: Write valid nat_bits in checkpoint
+Info: checkpoint state = x :  nat_bits crc compacted_summary sudden-power-off
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
+[FSCK] other corrupted bugs                           [Fail]
+Info: Duplicate valid checkpoint to mirror position x -> x
+Info: Write valid nat_bits in checkpoint
+Info: write_checkpoint() cur_cp:x
+Info: Write valid nat_bits in checkpoint
+Info: fix_checkpoint() cur_cp:x
+
+Info: Force to fix corruption
+Info: checkpoint state = x :  allow_nocrc nat_bits sudden-power-off
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
diff --git a/tests/f_loop_fsync_dnodes/imgs.tar.gz b/tests/f_loop_fsync_dnodes/imgs.tar.gz
new file mode 100644
index 0000000000000000000000000000000000000000..8a4e5d75b002377f23ef5f69f6928396e24afcb7
GIT binary patch
literal 173228
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%0D3EHBTn((Za+xzN(Bj<0xISgyCz
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
C*7Aw~

literal 0
HcmV?d00001

diff --git a/tests/f_loop_fsync_dnodes/script b/tests/f_loop_fsync_dnodes/script
new file mode 100644
index 000000000000..adce57c686c6
--- /dev/null
+++ b/tests/f_loop_fsync_dnodes/script
@@ -0,0 +1,16 @@
+#!/bin/bash
+
+DESC="recover loop fsync dnodes"
+
+. $TOPDIR/tests/helpers
+
+cleanup pre > $LOG 2>&1
+
+tar xf $TESTDIR/imgs.tar.gz -C $TESTDIR/../
+
+$FSCK $FSCK_OPTS -f $META > $OUT 2>&1
+$FSCK $FSCK_OPTS -f $META >> $OUT 2>&1
+cat $OUT >> $LOG
+
+check_result
+cleanup post >> $LOG 2>&1
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
