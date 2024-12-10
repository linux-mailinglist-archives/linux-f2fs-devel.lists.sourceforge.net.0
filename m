Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A50659EAAAC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Dec 2024 09:29:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tKvcA-0005lO-OJ;
	Tue, 10 Dec 2024 08:29:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <weilongping@oppo.com>) id 1tKvc8-0005lE-9A
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Dec 2024 08:29:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nsvXxv1DDPHofLn2pOKb8xisA+DzNG2Z/Vo7ipnVzxI=; b=XnJdkZbYjg+uNUG2Jym/o1j5Ds
 4TNuSJBaKwaRWrOsgX4+2Q/sbM2VzF/qiuxaG/JNpyZyReiSFHWuBDNTpgaHqihpIv/JT/221WOHw
 VhQHAyrJ/H3YQGgLgitvvFHrpgQnAipgTMLHVQviGRZGJMgx6sZ7b+e8B8f2uUyq5mhw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nsvXxv1DDPHofLn2pOKb8xisA+DzNG2Z/Vo7ipnVzxI=; b=LrwDTAUfs0oVelHYKE/6jHq1gl
 7CeE0R+lhs4Lv/jtbPc1Gj3AOt727z9iTc+yzq64iOORkb88C2sG+Q1kGmGHy5Z+XmUSGxXHATQU7
 /zv0vsBOq+E4oiQgNM62+n+kR4T33YwiMumsTnPtEg/1xXGIr72nyFuAwWAQ708k5e6M=;
Received: from mail-psaapc01on2065.outbound.protection.outlook.com
 ([40.107.255.65] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tKvc7-0006Ls-Kc for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Dec 2024 08:29:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lYqjosgm6QeDlnCdlK0MD4x3IIdhqj6auTT5khBMoCu2JWcKPYs2sRIsP8T/XPkkOtkaOQPzlVkFjJR9m74zf9z4UBQaiZoTGAd4PstU4e/m1Naga8aKHO4i9aZHekEkl6gZbEblVtF7t8khjvm9jHPmDXVYDWcnshRJ1+zdBBFT1Y559oZqIB4TzDNgDNWosK5gZ0VpClAmLx7nIKhFk7g3KU//Sq3ViBZNMZkk9wKbkJSXkpu7ekpz8s6rXZlXsMx9NMvNZG7sQshIgAGhjXAoHv5XX8CJe3Ty2QTLUeT0mqyUb+q3rpJnYKdG3gE8SM/7CnCFao3DH9FCSyNufw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nsvXxv1DDPHofLn2pOKb8xisA+DzNG2Z/Vo7ipnVzxI=;
 b=AIHOShY212LmIg9W5Iclj5NMzm1hQY2FanSi0rl9yvskZfI7X4Is54fEPHoeNjiWF57iU/5K7FLca4/F/trHiuMcA/5fiKSNGxugJP/MvyP/Ix9z8CTIAGq4/Z55TQIkihhjFEt6H6vueJFNHIFQ1+oRQgwzU8VB/wJK4CAeN7HQ1EzKhReN2faz26pfbOeFSPQKtLXL9RND0ZELtnZpALqrJalJc5U4WNwm3oQX4O+iYhnjzLs+1akFyYxF7giIM76EIHHdcP6Ye5vUWEqZ/6Hn4BpW1PVtaDyYHSKT+eU5yY9H4RE+NUJVb18fSGuwaVMTngH0wHdUrCIa0S+Ynw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nsvXxv1DDPHofLn2pOKb8xisA+DzNG2Z/Vo7ipnVzxI=;
 b=pSIiE1dYrD8BANsCTppnO2qc6Khbgdu2Qg8T2t+FpIY++SQ4uD5k0eFvs8SuE2yxqwOnQqklbq2qolM/ms1c6oC986zmAFsZNBytGs1qcD6FcJwvXbryPgh+0aUwbNam2D63CJ3G3PqvEzDaz2RanEGBE5J8e9XnuOPU2ax/etU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEZPR02MB7967.apcprd02.prod.outlook.com (2603:1096:101:22a::14)
 by TYUPR02MB6251.apcprd02.prod.outlook.com (2603:1096:400:35a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Tue, 10 Dec
 2024 08:28:55 +0000
Received: from SEZPR02MB7967.apcprd02.prod.outlook.com
 ([fe80::5723:5b88:ed4c:d49b]) by SEZPR02MB7967.apcprd02.prod.outlook.com
 ([fe80::5723:5b88:ed4c:d49b%3]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 08:28:55 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Dec 2024 16:28:03 +0800
Message-Id: <20241210082801.4104194-2-weilongping@oppo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241210082801.4104194-1-weilongping@oppo.com>
References: <20241210082801.4104194-1-weilongping@oppo.com>
X-ClientProxiedBy: SG2PR04CA0207.apcprd04.prod.outlook.com
 (2603:1096:4:187::9) To SEZPR02MB7967.apcprd02.prod.outlook.com
 (2603:1096:101:22a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB7967:EE_|TYUPR02MB6251:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eec5177-b2d6-4805-f879-08dd18f4af4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Y4Rnj9dsLALSj+2E/YAQmnIsV48yWNEi0+Uj1X6Yx8fjrq6aWc8xAVmLWgZz?=
 =?us-ascii?Q?L8xsdrNGLbJ/vU74yzc19jmoHRpWEQYvCMDgTfP8iIos4CsmdkQQkcz6t4il?=
 =?us-ascii?Q?nPduoNgr8LoZfmxIixevNDGCbcmp52sDupKqIWeJIQOiLoQ+l29wSnGKIl4T?=
 =?us-ascii?Q?TWe7P/n1yIGTzu/FrZEmrf3TKygNdZW0SC5/kBVcVcCUrnhoruqeXwwDMdO5?=
 =?us-ascii?Q?vo1DmvEbs3ftcIDyrGmimb0eE/WG+NjYpHmyUD+gJE/HBhOx73fq6n7Z3O8M?=
 =?us-ascii?Q?9SaOZKGkjbwANkVuypfekR+2Qvms03LrXlncKY7dVSQsLPPIVZdS1rxu+s2z?=
 =?us-ascii?Q?YAer/Dpq/ci8h5EdlBP+jrXFggJCMWLM/8BARdh5JmfVK7YPoyOwoG0KhJ03?=
 =?us-ascii?Q?uJ2cXbAUOdSPd3VKpZDmNRkf/hfylLxI1qzJCM+YuUJgDSOa/lLiICHet1Mf?=
 =?us-ascii?Q?Kaq89MEmcZai7Z2dX5t2DxhlzCzviIutc4VMinsXVaQCoAJjNQRFprjONNtu?=
 =?us-ascii?Q?COKhsKrTfD0HkpNgnMj0pAUPuY/OBbIB8YPOzi6EBG3ZMSXrOqplTj1dW7p0?=
 =?us-ascii?Q?uQGP4WrVffwLsZtVpxDj178yQYHwEd4bMripOqOeoVnJfO4dClCEhwrH1NcS?=
 =?us-ascii?Q?FbkxNOlFBKfxApcvNaHjssDYVrG4kejlgMhJol6eRrFq0hLsCJKg0mAeWXFB?=
 =?us-ascii?Q?au15BC4XL7VIV6VLFTlEQqzNLODlPqdcv+foRrkgR3+QQEHCKvr9+q8BP65U?=
 =?us-ascii?Q?NEj9CpHijS3H5VAICPx3KMCcyR1vVbhnRPqAWeRASZMbri/ZpiDOVdi5L6+E?=
 =?us-ascii?Q?nVzdHymF8H4HMhtK9CnctgC9BrVNsqzzzo6Qpp+eB5qAjFjLNz+CUS9FuGM1?=
 =?us-ascii?Q?dbzzqk6RpkhQEG4zBcZ3RBs/AY4yzXZciyyPqFYwdHMg4zQdwRbEAZXibNO2?=
 =?us-ascii?Q?R6KflFOMHVjARiFhEERasm4SApPnvOapwTGy9lI+cpWKa7bJMsTUViHe7Q4t?=
 =?us-ascii?Q?qFXvHh5S52CNWoC+3M6FtIAgh2b5Z5GTj+EtQcmT9i53udKzrkAxO3IAAZEM?=
 =?us-ascii?Q?ABvNL5iGF9JUvjRr6bNSv3rsdDkyCFSTzvEtpMeS5xk/vuYDc4RfVhaXqjhk?=
 =?us-ascii?Q?5yHTqeD2TDAEasLFrxUdQlbqMKh7EDZUf5FF/NuXpwl6HwVs7lYgPrM9kSvV?=
 =?us-ascii?Q?2Xd4RgINTYvYkSdcD6y0nL8YpXsfAqYabWIuuJ1jzITYp8c4tmVd3mrlZKrN?=
 =?us-ascii?Q?uTqpB2ggMSZgjwq/rOcnIxpUD2a8Xca9F+3Ied1CxtEQjbK1/h8ayu/hFkdH?=
 =?us-ascii?Q?7GkI3dC1NVUDSXF6bw+HUhhK5hjO8xQ8HCHX7YptYadOJvo+OP1/e8D1qxDm?=
 =?us-ascii?Q?Oy1edpjc7P3SJ+J49QGRug8fSdGK9RmGxYE/ktHxgNvnjKug1A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR02MB7967.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c1Ts8WpNr4yjMzWCVTgQ92Vk8dt+meRgTXcvT9LXELJTtStaTvielMfmk0/I?=
 =?us-ascii?Q?0Rd6ntnNoPpVU+gzHEtxAktkb/0gFuM+zgRLdpk58/0dkkRq/lZo+eYiytWe?=
 =?us-ascii?Q?0zU7+vYghyuavuTx8htxJhEuPOg55h5BaLPONOjA2jhiZ6hfwrLuXH+EM9F0?=
 =?us-ascii?Q?ufFmUjXnFR2uTAUfBeBbZ+tjVadZNsUhzvHFLtSk6nwEDEew2h7Ey465Jqv4?=
 =?us-ascii?Q?j6zuWLphXpe3ixbIRnQQDx3x5yYf3Ey3XXXKYWCjLREt0WZjdHKsdQ+lfSlI?=
 =?us-ascii?Q?I+IVOQpK0t+8XB5wnTZxevPNaOJGGH/uK537RMudWCLyCApFOCuDkiB4iyGn?=
 =?us-ascii?Q?04kHPFF9enpTB/VLXm5SX79ffvehUjTDw2AOb0oDdQt0ZazKbZ6MeedqO7RG?=
 =?us-ascii?Q?ntRgUp53fRL6kV9hVbqNrxHosyv1TO5yHokAS16PUg7LTCTFF7l7wLlJrTi7?=
 =?us-ascii?Q?tmp80zNLmK/iK3g3HJHjSoQ6FU6mBwMMqXRRUCn6bgaNrSAbYlMUUe9WLrCy?=
 =?us-ascii?Q?p1tFcVC8qQugfDnu/PpBNjWAG/VvmkUDasa4655L7KXXTUGcqk0O/9V/3dtD?=
 =?us-ascii?Q?18GQlcFRQ2aNa5NKBCzpTT/IRWhes4Y7eF4lAGkvKuFFgM2hvZlxND/qwsq0?=
 =?us-ascii?Q?Fy+Gony0ZD3fmrY9ER6UR6W899CnBS9Q2juWZHeCTg9QIoM64FB7HLFLfoK6?=
 =?us-ascii?Q?RBk0hcV3W9YUbbEHCHb9GNRoQOSAo6dFUusyp8SEUkEbshNUbAQnbmn/Tnd0?=
 =?us-ascii?Q?mOhavxLDxiHvqaq9R2a982IEA/IktdshysqNJ1Kwy6T9iR+Nab69O6o2NNgQ?=
 =?us-ascii?Q?W8Pm8vtz/cq5buy2XBheS+f5sCWsEtZ7boMyXUX3DFpSk4GQle0UWlG1Qag1?=
 =?us-ascii?Q?EEGVUBtvtoFOSrwU5+fOX3H5FWoxO1Rjw16DO6ANQZoej98beP6nrR56Hvc3?=
 =?us-ascii?Q?lvCIjDDWKjAR+j6HH29D9XPlSqKuuzNc6RTr1jfUoGPKvg4Rq0eTdF5WlPIA?=
 =?us-ascii?Q?LBZVOteGTSPqG9TBHO/0jq2TSLOUK/o4pct/Jcgi9YJzNici/ToRexvrrfn9?=
 =?us-ascii?Q?1YQaVX2nAZslhXW4M/wlJ+zmYT4KvEWv6q+Bu6fU6NRsPBV3h8ooA4Ef38Oy?=
 =?us-ascii?Q?ubMS+xSGZ3JWwDHk5CtHmDVj+zGg2FwfTK+7ksNlUomdsBX85btifiO5rPJl?=
 =?us-ascii?Q?jv57osE6rY+LayMHu5FF5r3lzhdZaUoBibQmEn8OUDaq8DDLznGNFQpJc6Vp?=
 =?us-ascii?Q?jr96wvwMfx/+Nc4VtYguWwiuSUfRm22ZQB57YdeFlA+D1z5crWdXk9+7m/RY?=
 =?us-ascii?Q?m4pb6AOVeCeFHyHdURsGQJqRpxkLnFIXJxi00YqwEneH3QLoNjzPc9dyI5VO?=
 =?us-ascii?Q?9/Nj3WmWEfKBoSovEkeGKGt4pN0FX+OtYVnyqvpXZ0aJ/SO6L3ANvsVLDwJY?=
 =?us-ascii?Q?Fzk3CRB1JNEjlwf4KC1J7c36uW4zNyCSmfRHOlSUm4yfxibn6ceV2lGZOi+F?=
 =?us-ascii?Q?4lfNco99f3jBU0U4TQNGZt1nriyJTKgwp2B/v0aMkK32PwQ3Gx3H2Ttu9cwv?=
 =?us-ascii?Q?mtbtNFPZp2qw8YPGWxCW5UMxcX79gCrrBRb4JYFMdZr+k/RJrS/K4WRvGXM6?=
 =?us-ascii?Q?2w=3D=3D?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eec5177-b2d6-4805-f879-08dd18f4af4a
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB7967.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 08:28:55.0819 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fGHzSOnpYGKYTOiYf4SRo4tuyWqS3bAz6ZiBZCKLHc/KbXIsXvjWOYQTGCdymR/JlF1aELRuOdzEIWw9aRwEuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR02MB6251
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch enable pread and pwrite on Android platform.
 Signed-off-by:
 LongPing Wei <weilongping@oppo.com> --- include/android_config.h | 2 ++ 1
 file changed,
 2 insertions(+) diff --git a/include/android_config.h
 b/include/android_config.h
 index f5cd4de..b11e2e4 100644 --- a/include/android_config.h +++
 b/include/android_config.h
 @@ -36,6 +36,8 @@ #define HAVE_FSTAT64 1 #d [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.255.65 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.65 listed in wl.mailspike.net]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.255.65 listed in bl.score.senderscore.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1tKvc7-0006Ls-Kc
Subject: [f2fs-dev] [PATCH 2/2] f2fs-tools: add HAVE_PREAD and HAVE_PWRITE
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

This patch enable pread and pwrite on Android platform.

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
