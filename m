Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB009B499B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 13:27:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5lJJ-0006il-J2;
	Tue, 29 Oct 2024 12:26:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1t5lJH-0006ib-0K
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:26:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bIj2uAcDhxv0OjC9c9O2Q9P0Ec1jmp/LYUTdXryx4lo=; b=iLW0AMTX6+v3g/KaezlocUP2iL
 AnEJslaJ1SQiMCGW9IUcVvSqoXTi3UJxsZlhq93I5w1PCDwBcXr5Xm0DzTTU9mriGzvCkB7312duU
 Th0krXwbKFxs9vkZYVXbb254t9J7brI5CKlvFjLAU4LXcgkLygI4a0NKzcSxCwWRkL5U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bIj2uAcDhxv0OjC9c9O2Q9P0Ec1jmp/LYUTdXryx4lo=; b=ksn7sHYjbk5ySHkxcZPXRgHIgk
 QnD1J496Tftn0OGHSOWG/XaWYn0hp9D8+gCHHy1G5u6eRgs8iixuUcGXsCM4np+RM8rAjEjf7yifX
 uuHU8k6FyZ7q/Ayv2Nm6P6NwXuDsM5qM3wdRKsKtFo1UEcHSLBWogeTmVf/RMVsGPR6Y=;
Received: from mail-eastasiaazon11010057.outbound.protection.outlook.com
 ([52.101.128.57] helo=HK2PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5lJG-0000bs-Mc for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:26:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kcIArFqiLUId7UP4IlRWFlXX0tF7pUcK9i8C50hIssZc7ZK8N1stXF4MBN940luyyPiYuH9TILwe2gHXMBebzOKuWXprnquo3gkazzmdxd3GEJqoz2VWj54P3bwpzgr/OSDTEVZJ+6LjXnga3z4ZK4Yb0KjnedaGlXYzq6DPiaBG11TKdGmQ+4N99ZYaX7uobwChkXcHHzmW4vJ8OY65JTVdtVczrBQRgjxNKjTfNq8Sp9lNZdfAREyjhSSrSiYZkNC3ChITNNH1IdEic7p/1pzOT4v6Hfh3g2qyeJjATUvb8HXiVvWl5XOPjC7zCNRP9W9I2xgBvhB3De53j2KTyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bIj2uAcDhxv0OjC9c9O2Q9P0Ec1jmp/LYUTdXryx4lo=;
 b=U6SB+0VQk529kI3ADZNWY93ukhmlx0B8SKFADGpGstEP3Q6kaKp0ms8rzRDBKdBv5n/KcY/4aP9Oq/fdgOh7bqnrAfa+qC/spy1Cuao6VrtXF2dereqyEC2fNBH5xi/rvqf0YMoBLPsyzoSGMqJkQc1Zmojpl3Ggvh8HtY7eqEDmpOyGrbF5RjnU+9gBCnRk0pcJxBAUikUkrBw2JyTeouwoIqxRCixlbiwpc7OkrVQbQxAXgd/rkAZGp0yp5MTe3/efOSc0aELpvJGfaDAMBVo80Fk53pBoyGPl/u+QnyRMwq4r8CYxk7d3rFwaQYWde+h0gECMMBtxGkR+iJBdmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bIj2uAcDhxv0OjC9c9O2Q9P0Ec1jmp/LYUTdXryx4lo=;
 b=Qp956mk0SVaQhaBJNLUWPHpkWb8zML2NxCHI173tbHkfHfW2Mqbb3nnf8PH7bgNUGV0z3baP+m/gheskENuQ03Y7jEUu5HWSPO14b8EIS3bmzTlnSH/QzN1VlnQ/eN2JrH+uYzw2ELJIMqprQsY48FXnJQQ6eRV/ANlhh0wzVt0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TY0PR02MB6982.apcprd02.prod.outlook.com (2603:1096:405:e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 12:11:44 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 12:11:44 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 29 Oct 2024 20:09:46 +0800
Message-Id: <20241029120956.4186731-15-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241029120956.4186731-1-shengyong@oppo.com>
References: <20241029120956.4186731-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TY0PR02MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: 2344d5b1-1600-41c3-e819-08dcf812dab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fwGUIiRja7TRdunYK61vkPgndxwAQl1WExapcDyKt/Iw3mSEYUGQCNt4T5HV?=
 =?us-ascii?Q?PxE7ZOQYCqTGJPkM96zHWKPHxsJOoFNUNLgVDZqOP3fNZLJ5hB8oWigMYPqN?=
 =?us-ascii?Q?Ruz1N3hCNpBM+C3h5K/cycAvTGlgWZfLHCshfiqRbkyA2U+zFjMUl9DC8/ia?=
 =?us-ascii?Q?aVvIgm/zs+lCY94qPVkqNAPuQm1vunJQTRB5nT1JKU7fhOLjMZL9uax/daSB?=
 =?us-ascii?Q?6Fr+bz4ETmqi55+z12VIh10pRZLC/w6mfXhmsd5L3qG6+jH+aGq46gWI7PTU?=
 =?us-ascii?Q?oq5pVscwFEsKVrnTtb8ZZkTqPQVRyJi276ox81Rew7dUuATSGaVEVpWMGHZd?=
 =?us-ascii?Q?7AXfct3CbgD4r4Nhvz/F2LmWVQarywO1VxTT9553Rf6kaVHeeQxjZUQoMKjg?=
 =?us-ascii?Q?Z43hpqbtOJIyEEXij9jRevVkcI5o61JMagB81NCfIaYvFeT689OlQBdLi8Ej?=
 =?us-ascii?Q?FCvjMAZaAlne4lwlrD+uJ3RPIDqKSgicSXaVZVXzPJ1T+yXNx9yKv5w8HGhk?=
 =?us-ascii?Q?yr920n2pbwiG9KWzrtaVjj8LMJd4J1VQhMu29fIP3Po3p63FvsTyQAuXxQrm?=
 =?us-ascii?Q?RYK5CMoPAo5lHZC/xDJndE/FyHUNOkRoNFtuKDHWpyBGecz+gVQL3GC+AB6H?=
 =?us-ascii?Q?rizDBm6qz6Q4fb3xyYOT7gyuuNmoZ7SLkQ6uG73FGUtA5Ff4rVTrBj6Muwp7?=
 =?us-ascii?Q?3r7GC6iKDhhl0qsbSMNk7Ap5z4+b9jBaP5psvxWKclH7An8yGJNqxz51uF9d?=
 =?us-ascii?Q?atb4VcN5tbfSLE2X8HTSgxN8+tHUZq7PC2iYCoap2hZnKubNHIxfMw5kcUT7?=
 =?us-ascii?Q?g4Vwzf4dC+zcxDCzmfvBYt8oXHAPaMRA6ufohy4oBgIEWTLhVD9PRGHSiUwm?=
 =?us-ascii?Q?UJxGwrHy5eQgNv7+aVi0PNeliYHhFV7y3gRRka1S+3qnc2yjBzNv0WamSkdl?=
 =?us-ascii?Q?Jmk0KMXriaN2YxiGvg4YklHerRgzSrxCx7XSdqgTz/iIU34tq/2Mxmga/mpJ?=
 =?us-ascii?Q?YuLrXnvxA9SCXpFnv43LWGTu2WMt4kfHnsZ9QxjacFZwoqJ57kh9cUt5vikR?=
 =?us-ascii?Q?bObjgzODsC8YQDoIXJGVrNP+WyS7VEcjp+vJHPlb+vycbWmNs0R/n2FB/r+S?=
 =?us-ascii?Q?P2pHqlTJZdZsJWuiuH/N6OFh5yfR6mmQlGeHV0RH9emeBNlo3CtbH6vIE8cj?=
 =?us-ascii?Q?zrFhH7d3fhTV3Cw/vCaf/QtcXc9IlxavCpiIhTcNhojHAogFGsM8UQaBOpte?=
 =?us-ascii?Q?9oM8/cC+JawyeflJ8irjHVo8kAbW46DjN2JIW+7WLQQg5CsThohWHnMiXCVh?=
 =?us-ascii?Q?uAhQQWqu3k2yiPYnpB/kD+O0dx8FYu8AZxYZa0JoralilIyKSKJ66GDFHGi+?=
 =?us-ascii?Q?bQlCgko=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?isG2M9fuEIQsw1dXFSlWMw3kCVc0HTJMP72kIafvLkiufY+Y9221HMtVQ9hZ?=
 =?us-ascii?Q?rmeJNx04MnfjcoHDNPO+UO8EsqbgyTs/p2FRcroP2Kpaq3D+sTSJ808o1nhU?=
 =?us-ascii?Q?l8RJ3mwCMuHdizG8LCYtIG39nXzJZd2+0IX6qyw8vjiNo/cLHrOgjvaHhfqa?=
 =?us-ascii?Q?48CtDC8Ni45plXaM+wyI+Dz/c+kRwML2VZ7I5OAqcmb3ojzph213O7hrTOuT?=
 =?us-ascii?Q?enRHjP5IPuxCTiRctjViuv/c22Ty/jgMJNEXIq/RlR/fJAI6zUwMzsq40bxk?=
 =?us-ascii?Q?HqW+PQspEwpMuqg79ZUMnbXkUKT2WE6PJHRn7VS/trGM3lp3t3SzlyJp9IvU?=
 =?us-ascii?Q?gRiIqF/148h7Z0r7AqWYMVI2g0vO20JXalfYlyPrgT5ceFxEej1u9vnutaYR?=
 =?us-ascii?Q?WvKAsPZ+NjcRvz3ioOnLI4Fxin08rqLterAZpK1NQMUgG+rLPcqy4spB7Ebl?=
 =?us-ascii?Q?WiWhoN9UN07+bbuJ6x2VrSv4a4kZhTm1LjT/Ro6TyKSiYxPaSB0fV558pi6t?=
 =?us-ascii?Q?cxEmbCMLyTE/lP5FXl1Ia75PnPd54K37NvkyAQybIumVoC36+MojLWOOOwBh?=
 =?us-ascii?Q?O1DeBbM25+q36/WdGRAnsoxiQxpZzKrSvkwv0uM1mt9d2FMn0tVBz3bsgLm0?=
 =?us-ascii?Q?X1RefclCfYBt4E7UWhdAa1kofJYiCgM26yvMulOM0Hz0UefKQ1VOOGOFbsgU?=
 =?us-ascii?Q?DjYcg8+TauuJtwkjgq9DloqKF4kRdIbLw4podeZNqxagn8ZypYVUpr3uAkKN?=
 =?us-ascii?Q?s0OmccMPKOrjkdQL7E/LPIlh9sZN0NYc+TQimEg9v8odi9cuCHTnTABT/vU9?=
 =?us-ascii?Q?7fDtmgb/tbT6jJ2h+dhqRs5e6z58H+48qXbe0qFnRB6i9hYRjBHOgBWp666F?=
 =?us-ascii?Q?yGY2QsmonYnGEcNkqvkf10ZR3OHZNlv2vr8u4PqoKV5kpxZHNa17+lFZl9vf?=
 =?us-ascii?Q?3JsL5+dxtnyGQp3kJZZnIwrgNvjNGJwYAXBj7yJD+JYCbMcQpFnr7eG37IQc?=
 =?us-ascii?Q?14VB2IAJrpijmD2RYKilnEuybk/NtaGaloBFYyhSNRQGaw3ZvHNAWUKw7dcs?=
 =?us-ascii?Q?3naoYJFXEbIX8TvimgF9MFjysOM4lE6773Ouxw3Kkx8k7G545Y+jlvCMZ07L?=
 =?us-ascii?Q?lWNeTym66LENnyrWbbCDi3U6JXSpFjTE4+Ax2iU87PFC7NMNAf2FBdMRxchT?=
 =?us-ascii?Q?Fu+eIFLQbomzCGlQmHhqH6FmK/eS5Pv5xeZlPiNsUufb40R56UrxOq0MkIY9?=
 =?us-ascii?Q?Zm0YfZaW2BKu8YKNH+tE923AqsCZM4avQu370YX7j5GaAOQ0X9o1oOKXoUFV?=
 =?us-ascii?Q?cXPIeYODm4QrqzTq2/gWp6WLjLvmGY7RVA4WcGiO0ZIAlfZ3HJXNgbBRP0Gn?=
 =?us-ascii?Q?yQ168jHGJdHKGOCRq4Orv98aGBS1/UicBwDn4JTnCj+KL7FZ5RNnOKNqnrpn?=
 =?us-ascii?Q?BdLgk1aneR76dXG/SsrG86zmYlSc95810RJzCU8DXKAB+Q5gwS4Mg/KWTckn?=
 =?us-ascii?Q?a09tEsE1ihkLXcB+f/gkCeaBIstHf66btEdX0uw7dS5c1EonxWvNrMyXUWNn?=
 =?us-ascii?Q?zNbX9ub2tGjeU0QAlAgq6mVkyxlusoFvJ1mfO752?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2344d5b1-1600-41c3-e819-08dcf812dab8
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 12:11:44.4201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OtAm2dhwRMGaNPYRmqyIR9+WkulLfu44yrYAA/M0f3JNkEinXvs8hcmuv9ddRzzzlaDiCALftqOy3PqWdqh9kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB6982
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Sheng Yong <shengyong@oppo.com> ---
 tests/f_sit_bad_type/README
 | 5 ++++ tests/f_sit_bad_type/expect.in | 34 +++++++++++++++++++++++++
 tests/f_sit_bad_type/script | 45 +++++++++++++++++ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [52.101.128.57 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.128.57 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1t5lJG-0000bs-Mc
Subject: [f2fs-dev] [RFC PATCH 14/24] tests: add fsck testcase of fixing sit
 entry type
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
 tests/f_sit_bad_type/README    |  5 ++++
 tests/f_sit_bad_type/expect.in | 34 +++++++++++++++++++++++++
 tests/f_sit_bad_type/script    | 45 ++++++++++++++++++++++++++++++++++
 3 files changed, 84 insertions(+)
 create mode 100644 tests/f_sit_bad_type/README
 create mode 100644 tests/f_sit_bad_type/expect.in
 create mode 100644 tests/f_sit_bad_type/script

diff --git a/tests/f_sit_bad_type/README b/tests/f_sit_bad_type/README
new file mode 100644
index 000000000000..e0a1726528c0
--- /dev/null
+++ b/tests/f_sit_bad_type/README
@@ -0,0 +1,5 @@
+1. create f2fs image
+2. mount f2fs and create a regular file and write data
+3. get a block address by dumping the inode
+4. inject type in the sit entry of the blkaddr and change its type to NODE
+5. fsck fixes the type to DATA
diff --git a/tests/f_sit_bad_type/expect.in b/tests/f_sit_bad_type/expect.in
new file mode 100644
index 000000000000..3e69b378336a
--- /dev/null
+++ b/tests/f_sit_bad_type/expect.in
@@ -0,0 +1,34 @@
+Info: Force to fix corruption
+Info: checkpoint state = x :  nat_bits crc compacted_summary unmount
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
+[FIX] (check_sit_types:x)  --> Wrong segment type [_SEGNO_] 3 -> 1
+[FSCK] other corrupted bugs                           [Ok..]
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
diff --git a/tests/f_sit_bad_type/script b/tests/f_sit_bad_type/script
new file mode 100644
index 000000000000..cb475ba8232d
--- /dev/null
+++ b/tests/f_sit_bad_type/script
@@ -0,0 +1,45 @@
+#!/bin/sh
+
+DESC="sit entry with invalid type"
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
+SIT_VBLOCKS_SHIFT=10
+SIT_VBLOCKS_MASK=$(((1 << $SIT_VBLOCKS_SHIFT) - 1))
+val=`$INJECT --dry-run --sit 1 --blk $blkaddr --mb vblocks $META | grep "inject sit entry vblocks" | awk '{print $(NF-2)}'`
+vblocks=$(($val & $SIT_VBLOCKS_MASK))
+val=$(($vblocks | (0x3 << $SIT_VBLOCKS_SHIFT)))
+
+$INJECT --sit 1 --blk $blkaddr --mb vblocks --val $val $META >> $LOG 2>&1
+$FSCK $FSCK_OPTS -f $META > $OUT 2>&1
+$FSCK $FSCK_OPTS -f $META >> $OUT 2>&1
+cat $OUT >> $LOG
+
+segno=`get_segno $blkaddr`
+SEGNO=`printf "0x%x" $segno`
+sed "s/_SEGNO_/$SEGNO/g" $TESTDIR/expect.in > $TESTDIR/expect
+
+check_result
+cleanup post >> $LOG 2>&1
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
