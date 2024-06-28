Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D85591B4A7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jun 2024 03:32:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sN0Tg-0004OJ-F4;
	Fri, 28 Jun 2024 01:32:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sN0Te-0004Ns-O9
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jun 2024 01:32:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dq3dmc001amoNkyNORSo8UT5tprSJxmwuGIVCtG2oHk=; b=A3M80r/yJTbX8W5aAm4vEijjKQ
 +B6G1GDjU/WA+IKxpsKcxLukL5aa9xawjSegPjMkGeInZ6XvYpxrcNRQ4lyKIJTxIgvTe0EU9Eclx
 zuo8p1jfak9LPBoi8Xmp/BpqcIKkIT/3Cu0RcbKmy8zdlpfbOI24Ax3Lvb1YYeO5RoD4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Dq3dmc001amoNkyNORSo8UT5tprSJxmwuGIVCtG2oHk=; b=Aidua47Fgm6AbAbRg/NztF6EbV
 5D7kPA+Wi/rgPwxkkM0uGelDYxIp3GnD2DMhXGh0DaHeS87ehhAvNBQ2ewQLiIu7wQ9pjEDpNPQ2F
 0dN97ezNA+X3pJSWdZ452DRrkv7Z0QBAjp1X47TouwTOsrcf46fxHTTYNwnlYZgMAuVg=;
Received: from mail-tyzapc01on2065.outbound.protection.outlook.com
 ([40.107.117.65] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sN0Tf-0006Jd-2X for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jun 2024 01:32:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WmC56ZzdmtrPd+JAte04QNcOHHhUbt5z2i1gq9IpBAlpoucNrUqvrrMi+fRCUrdjNlJDaLUFLCEe0QKRNkWEz3xyvd2tOGiZo5gDweIM6A63KLMdYptKzEjpvMRaDI19dVXtsnpbfgk1/Br+g0xXQ1pZW3mokOgElsVIUiO0vQgHksyfPZOx+DsWnzZe3xh59Wqe5cQodSqY70LIaNzk8xvE2jes53ngnIRXVNs+g68X0PNPPTqrAhZjaWbiWAo1GIuneOYN88gleiN6c54sh8FDLVvQvZvMdIv7q8FCOlRMOsUb8fEa9QqIEee6O9KZjqDyRuwhmYcwThl47bHdQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Dq3dmc001amoNkyNORSo8UT5tprSJxmwuGIVCtG2oHk=;
 b=Yi6UqPloQyKue5Eq2wfeViySImI7itAQOydsoZVunHKyO2HFKOJI0wZLd9W0QLdqgf+oyxVSHe90xt9w6F2nGsYhVKO1A+TvdRXulVSVfpEQlTD7ow0/PSqQoPtCfb0PGGm/6RAVIctql/KG6IMxz17K6o8errW1MTvWKm8kzBet17LPqK0JigHrHTRvoPZTKEz5MYHPVcHVyiLNrQhEntyEHY3Fej1i8R/IPRTqhn/TecIW+XaPhT9uIlr4qVjtR/SZvhHbtAQY3zQMgRC0OFPXC3Hg3tCenIRwL9zoQC4jXS2Y/c5G/Ji58AKjYthRvxyXbCouhR7dgtYZz5HC4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Dq3dmc001amoNkyNORSo8UT5tprSJxmwuGIVCtG2oHk=;
 b=NcDs/69JCPq0Mvcv+bWZURum67ckEFMfyZnMlPNYHt/ufwqgWFBfEsT6h0gHvL/2iB2A2nm9F9jQBSAykheyudG7/y4WfLCIvEjy0F7lQr3BWiuWsJTz0L9QMfAqFdO1qgS07nK5sElN3hzdFGBKevPw5You7zGR+brdqO5KfSc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TYZPR02MB6576.apcprd02.prod.outlook.com (2603:1096:400:41a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Fri, 28 Jun
 2024 01:32:30 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 01:32:30 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Fri, 28 Jun 2024 09:31:40 +0800
Message-Id: <20240628013140.2444209-11-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240628013140.2444209-1-shengyong@oppo.com>
References: <20240628013140.2444209-1-shengyong@oppo.com>
X-ClientProxiedBy: SI2PR01CA0047.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::10) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TYZPR02MB6576:EE_
X-MS-Office365-Filtering-Correlation-Id: eb121284-4170-4be4-7b8a-08dc97122cfd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tea7HavNruBhxN2723Dxd3cjV+SfsL0zfSKntNR9Ci5xZJxtMKlVkCqjeTWl?=
 =?us-ascii?Q?QQuGLPMiWeUWBZvaZCDy3Q4S9OY4Xxg+XYvkaYHpUuqNBnFioCzmjJjm1r8o?=
 =?us-ascii?Q?6qZqVJRYhpnRqVXO778YLqfNDURgeRwQesyL3eoHjnrkg6DrAV5pfE24eiAM?=
 =?us-ascii?Q?F44biBgCAWvsUwRkxUfubJxF98fcXnSJ4TH4hE8nCeN6K2AxNu/1N379/WTi?=
 =?us-ascii?Q?h+z9NzJ2R+5WK/vt3Ge84EOLHn87pfv0tXsiQ16lw903YXhpbPYtcGEM5TMA?=
 =?us-ascii?Q?6XO3l0mX1Qb5ZXHsrN5385HAciFrLuJp4O/iQtgSTftoWLxVldEspgWrKJZr?=
 =?us-ascii?Q?EkPvSYjs9hU5+Kr9vOt1r6Hb0MoySHokRNCJEioxslA4lkgM/p1kL+i74X6I?=
 =?us-ascii?Q?0XXZXlsKwJP2hftPq5cajjC3uNDUIszDUPs1nY9/AYt5wBs38QRGp0a463OR?=
 =?us-ascii?Q?WbOJTNVe/ZpKiURih08xhW2dh1tBbSI7QpdH5/Pei9Em2vSA9GzQq3BdbJSu?=
 =?us-ascii?Q?05+UeA9qe1cGY2DujVGHREsbKoRC+qn9ETt9jwyF/Jzjv//y7hufSw69Ombq?=
 =?us-ascii?Q?pkSCQo4JcL2lUt+T5tK09Fk24WZlyArZvpVxLSWERThcNrRJLBmDM0lqfaJC?=
 =?us-ascii?Q?oG1lQC+E0ICwAsvpqeL2t6zl7jlZMmlapbvlszi2ouo8gl3NBwF4FyRVvhmA?=
 =?us-ascii?Q?jzXiaGf4PZCKV+/khWy4BV0KvBGDM27SzPW/Yd1b6/zq0+poroQQICbnD6Cr?=
 =?us-ascii?Q?gWwyysTHODkhPREGkKGll27MuDLRD3JKjbg8jcDj6F/BV59NmiiiKE9Hqn2g?=
 =?us-ascii?Q?01DP7E37hB9XTBeXRMtD6YWsD/ZGM7zCyzKzIKVFkg9oQrY132VIbqixaHZm?=
 =?us-ascii?Q?hG/l0m5sMOQyKA0/qSwKTwqojGgKQJ3Jfd+E51uPVqicqfvQfml1n0oeOkmt?=
 =?us-ascii?Q?XVBLG3YBovQT1y771WrT/RwPXX+atDsgUsnfvZTyczgSaav7Gjzmbvb9VtBM?=
 =?us-ascii?Q?Az/rCV+yJkdsDaYNs5ZCxfp3EaaUMC8arWl7RdNSOiyfbBOvI4oNi3/ZVg17?=
 =?us-ascii?Q?Eoux7rIO+m4buOsDWWOGxAh6mUj/0kipo18BBPVW5ZAthNo+Elm1H6TnfIjY?=
 =?us-ascii?Q?478Qd6Qbk8xSjrzFQVz8qezeC3eAgBWdMb/s+Nxj1IGZ1CMALEVsf3X2cLly?=
 =?us-ascii?Q?uCKzYOZdMLwkFhsaRs0feH52VhSxi46qBmnDdrnZOXvtmjSmRdTZ7MR6otPX?=
 =?us-ascii?Q?hjO2+Sb91latwzlnLLYJxyHGXa34lsQ1poQ8q4wW9hBji3l9SQevS+sDz5IW?=
 =?us-ascii?Q?9pK74KJLocWTcjFMocG6P/qVqmAO6Jd7MGY9fE2/jRPpiTQXlxuRcnw97Ka7?=
 =?us-ascii?Q?b8HIfvRDZCogPt0Z3O49SW6wGwFifgmXLG9qdWqpLYcVgghXGw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TA71eYa6+I7lXQX2+4T92XYd0KYCz7oEfF4i32gyecrk6Zb/cet2r32nBX9i?=
 =?us-ascii?Q?F1qHf/6U3E1aBmb2nCBQOqJ1IlIBuFWZ+5EL/Fk0ZMVKSmt+l14fo8MsO8DV?=
 =?us-ascii?Q?CwlUn75b9QPwUkmmSIWR5pEKY1Fwn1wPy1GG8nHRP59+zRUQb+w11lAOM+Kh?=
 =?us-ascii?Q?BYQNOlbljkrtbaP+jtOZrZWS9/VFbckcRF8PW/ZubeivQoe2NbeouEHFTwtF?=
 =?us-ascii?Q?AQ1wobyul5fxn9dWCkmox6R3EcAxhH2TXcVRPM88kR1ljx1kC1GaKHH70KzW?=
 =?us-ascii?Q?xjNdHtKicqWo1ZFKmgbC/lDpV1/ECngPQKc+yIaS7WtMWev7dcMOG9Y4mnJE?=
 =?us-ascii?Q?Ey2Z68k3LDOIw5QEiSyFOEMZhzh0JMtNOarnm8tzCPFjY+1m9YtP+YcON0GZ?=
 =?us-ascii?Q?1HWJwIQRcUnjyzi3q1GrncPbx1x/txPwdOpNmnpWjww6Z4E6Mek94tXUybYz?=
 =?us-ascii?Q?GdOYYJoRBgUhk5xJzkqv7/IpWFRea0qjuK5yS8YbuS0VVcgPTl/JIkIOpjKr?=
 =?us-ascii?Q?alG+OXAfhWrBff5emja4CaRG9UPbwYLHneK9NSq1mtoDi9qyxiUODK870gR3?=
 =?us-ascii?Q?ea4dSlbmHNzNXvQAb2GbN5r2n4tABN51RLHlA12gw/cwRqwaMKL2i5BoIwyd?=
 =?us-ascii?Q?pPjG/K9oxUJ9tmnDZ+0/egrrtgmkVmiyLlxOd5gM9gqw/L8s8GzglWiot0zA?=
 =?us-ascii?Q?2ac5Lrm0mpIEa97yoJoz5gT9hHtMaP36wf91L9ceBeTM+2WzwvIhFTaDEqAF?=
 =?us-ascii?Q?FfAoN4xot+eFPtrzPImIJ59QXRnrVRSkpf69s4D2CvTV5dDXfy7MT1MG3ONw?=
 =?us-ascii?Q?a5JxY15B28kem0w8vQDZs1kpqKnHrFS+BQ2M88yHE4sgsVATWw6RYWpqCAlA?=
 =?us-ascii?Q?pExt4Mvej/sc3cIbvsD3NEI+OgK2u4+anuB1m5Qu3VXgoJUa7QLZ5R8p16vI?=
 =?us-ascii?Q?5tJvAJAN6xW8qd9Uw7jtWAGPiY2Lc+PHHveCnYHV/tsWdj7s54+id3J+rQbR?=
 =?us-ascii?Q?Irgz4CYleiF0B0roIy+PolIC0DUHpI9zomWcaZm4HA2dJDSK8ihPPM/gMwYF?=
 =?us-ascii?Q?r8fYJgqeWUXs37RtyLZ89iT2sPfZeN3ipjnYBmb8bQFVNFs0jsDX0DedxFxz?=
 =?us-ascii?Q?mZ0w3S4oU8NR2rKKwhkKGGXAbE7RzJNkGMiHQWm55aiGOY6dd4ksgGYLN92b?=
 =?us-ascii?Q?k+WqBAMrp0PfuWTzuxHSRa8LqxSISTvN79hFJqo5MTW0bxMug5N4NFLogIPZ?=
 =?us-ascii?Q?rLkdlv7QEg2ZPCyxzkLnYe+hiTFkPHEKMmc5QW388qf5PkLFKRq3Up1KGEGq?=
 =?us-ascii?Q?XuWokgsoLY82FkB4KAVfzbj7ilNV0rAvc6G5ccJRVg8EQjV7Z01ysiiOgi3m?=
 =?us-ascii?Q?GAew0TjUg2LzuM6SGLXOKMnhb91kMDrJZK1yYWHFvXJFDvVtZacULmMWN61J?=
 =?us-ascii?Q?e7RVfZ1RIlD1If8grm3AEwLbwEJVytbklIFv8AT4lk13WO4HIY8V8+Rj5C6k?=
 =?us-ascii?Q?Esuo5wgi1RB/93IMqf0eohJUisAnNUTLsh8sf5VytFih7tg2o/vbolVRklrt?=
 =?us-ascii?Q?X5sFaxy8PDkWXzVdBu76ZOZp8BXq8Ss9lZhAWewW?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eb121284-4170-4be4-7b8a-08dc97122cfd
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 01:32:30.1592 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /a+nfcMxD/C17JvOn63ddYvoVKcg+Mnztxa9icKO9CHh7WoOjHl9gPVrnd96s0b4gSvT7SmudzTwl8tPP9dfow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB6576
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Sheng Yong <shengyong@oppo.com> ---
 man/Makefile.am
 | 2 +- man/inject.f2fs.8 | 225 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 226 insertions(+), 1 deletion(-) creat [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.65 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.65 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [40.107.117.65 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.65 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sN0Tf-0006Jd-2X
Subject: [f2fs-dev] [RFC PATCH v2 10/10] man: add inject.f2fs man page
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
 man/Makefile.am   |   2 +-
 man/inject.f2fs.8 | 225 ++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 226 insertions(+), 1 deletion(-)
 create mode 100644 man/inject.f2fs.8

diff --git a/man/Makefile.am b/man/Makefile.am
index 9363b82..b78344a 100644
--- a/man/Makefile.am
+++ b/man/Makefile.am
@@ -1,3 +1,3 @@
 ## Makefile.am
 
-dist_man_MANS = mkfs.f2fs.8 fsck.f2fs.8 dump.f2fs.8 defrag.f2fs.8 resize.f2fs.8 sload.f2fs.8 f2fs_io.8 f2fslabel.8
+dist_man_MANS = mkfs.f2fs.8 fsck.f2fs.8 dump.f2fs.8 defrag.f2fs.8 resize.f2fs.8 sload.f2fs.8 f2fs_io.8 f2fslabel.8 inject.f2fs.8
diff --git a/man/inject.f2fs.8 b/man/inject.f2fs.8
new file mode 100644
index 0000000..01d58ef
--- /dev/null
+++ b/man/inject.f2fs.8
@@ -0,0 +1,225 @@
+.\" Copyright (c) 2024 OPPO Mobile Comm Corp., Ltd.
+.\"
+.TH INJECT.F2FS 8
+.SH NAME
+inject.f2fs \- inject a Linux F2FS file system
+.SH SYNOPSIS
+.B inject.f2fs
+[
+.I options
+]
+.I device
+.SH DESCRIPTION
+.B inject.f2fs
+is used to modify metadata or data (directory entry) of f2fs file system
+image offline flexibly.
+.SH OPTIONS
+.TP
+.BI \-d " debug level [default:0]"
+Specify the level of debugging options.
+.TP
+.BI \-V
+Print the version number and exit.
+.TP
+.BI \-\-mb " member name"
+Specify the member name in a struct that is injected.
+.TP
+.BI \-\-val " new value"
+New value to set if \fImb\fP is a number.
+.TP
+.BI \-\-str " new string"
+New string to set if \fImb\fP is a string.
+.TP
+.BI \-\-idx " slot index"
+Specify which slot is injected if \fImb\fP is an array.
+.TP
+.BI \-\-nid " nid"
+Specify which nid is injected.
+.TP
+.BI \-\-blk " blkaddr"
+Specify which blkaddr is injected.
+.TP
+.BI \-\-sb " 0 or 1 or 2"
+Inject super block, its argument means which sb pack is injected, where 0 choses the current valid sb automatically.
+The available \fImb\fP of \fIsb\fP are:
+.RS 1.2i
+.TP
+.BI magic
+magic numbe.
+.TP
+.BI s_stop_reason
+s_stop_reason array.
+.TP
+.BI s_errors
+s_errors array.
+.TP
+.BI devs.path
+path in devs array.
+.RE
+.TP
+.BI \-\-cp " 0 or 1 or 2"
+Inject checkpoint, its argument means which cp pack is injected, where 0 choses the current valid cp automatically.
+The available \fImb\fP of \fIcp\fP are:
+.RS 1.2i
+.TP
+.BI checkpoint_ver
+checkpoint version.
+.TP
+.BI ckpt_flags
+checkpoint flags.
+.TP
+.BI cur_node_segno
+cur_node_segno array.
+.TP
+.BI cur_node_blkoff
+cur_node_blkoff array.
+.TP
+.BI cur_data_segno
+cur_data_segno array.
+.TP
+.BI cur_data_blkoff
+cur_data_blkoff array.
+.RE
+.TP
+.BI \-\-nat " 0 or 1 or 2"
+Inject nat entry specified by \fInid\fP, its argument means which nat pack is injected, where 0 choses the current valid nat automatically.
+The available \fImb\fP of \fInat\fP are:
+.RS 1.2i
+.TP
+.BI version
+nat entry version.
+.TP
+.BI ino
+nat entry ino.
+.TP
+.BI block_addr
+nat entry block_addr.
+.RE
+.TP
+.BI \-\-sit " 0 or 1 or 2"
+Inject sit entry specified by \fIblk\fP, its argument means which sit pack is injected, where 0 choses the current valid sit automatically.
+The available \fImb\fP of \fIsit\fP are:
+.RS 1.2i
+.TP
+.BI vblocks
+sit entry vblocks.
+.TP
+.BI valid_map
+sit entry valid_map.
+.TP
+.BI mtime
+sit entry mtime.
+.RE
+.TP
+.BI \-\-ssa
+Inject summary block or summary entry specified by \fIblk\fP.
+The available \fImb\fP of \fIssa\fP are:
+.RS 1.2i
+.TP
+.BI entry_type
+summary block footer entry_type.
+.TP
+.BI check_sum
+summary block footer check_sum.
+.TP
+.BI nid
+summary entry nid.
+.TP
+.BI version
+summary entry version.
+.TP
+.BI ofs_in_node
+summary entry ofs_in_node.
+.RE
+.TP
+.BI \-\-node
+Inject node block specified by \fInid\P.
+The available \fImb\fP of \fInode\fP are:
+.RS 1.2i
+.TP
+.BI nid
+node footer nid.
+.TP
+.BI ino
+node footer ino.
+.TP
+.BI flag
+node footer flag.
+.TP
+.BI cp_ver
+node footer cp_ver.
+.TP
+.BI next_blkaddr
+node footer next_blkaddr.
+.TP
+.BI i_mode
+inode i_mode.
+.TP
+.BI i_advise
+inode i_advise.
+.TP
+.BI i_inline
+inode i_inline.
+.TP
+.BI i_links
+inode i_links.
+.TP
+.BI i_size
+inode i_size.
+.TP
+.BI i_blocks
+inode i_blocks.
+.TP
+.BI i_extra_isize
+inode i_extra_isize.
+.TP
+.BI i_inode_checksum
+inode i_inode_checksum.
+.TP
+.BI i_addr
+inode i_addr array specified by \fIidx\fP.
+.TP
+.BI i_nid
+inode i_nid array specified by \fIidx\fP.
+.TP
+.BI addr
+{in}direct node nid/addr array specified by \fIidx\fP.
+.RE
+.TP
+.BI \-\-dent
+Inject dentry block or dir entry specified \fInid\fP.
+The available \fImb\fP of \fIdent\fP are:
+.RS 1.2i
+.TP
+.BI d_bitmap
+dentry block d_bitmap.
+.TP
+.BI d_hash
+dentry hash.
+.TP
+.BI d_ino
+dentry ino.
+.TP
+.BI d_ftype
+dentry ftype.
+.RE
+.TP
+.BI \-\-dry\-run
+Do not really inject.
+
+.PP
+.SH AUTHOR
+This version of
+.B inject.f2fs
+has been written by Sheng Yong <shengyong@oppo.com>.
+.SH AVAILABILITY
+.B inject.f2fs
+is available from git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git.
+.SH "SEE ALSO"
+.BR mkfs.f2fs(8),
+.BR fsck.f2fs(8),
+.BR dump.f2fs(8),
+.BR defrag.f2fs(8),
+.BR resize.f2fs(8),
+.BR sload.f2fs(8),
+.BR defrag.f2fs(8).
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
