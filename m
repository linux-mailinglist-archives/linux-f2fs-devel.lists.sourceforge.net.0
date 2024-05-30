Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A08AF8D4972
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 May 2024 12:17:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sCcqh-0005pt-Hi;
	Thu, 30 May 2024 10:17:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sCcqf-0005pk-QJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 May 2024 10:17:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6iFIcbH+I7wYmetgUEl0PtVhb4wF6eGAVvDNn7nfilc=; b=Uwt6epa7cw5kVd9ygbmXoUwQzw
 I/e/SIVGWb+okJmFlITRCGWXcmBWHxAoPwiWwOAwnXd4OgnUQ5Tx94+cgLzkebvHz2i+39FD00FCV
 UJUy+kyTsoXcRGxrHzTX+V/PDe7cA3Uv8ts3233PSu9gk52txYywb/KYBHGRf3rFPFn4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6iFIcbH+I7wYmetgUEl0PtVhb4wF6eGAVvDNn7nfilc=; b=JUXM5uFTKeb/u7XePnrHgCIXln
 L6W4b6eRPRl8ysQIn5ngBPyhBxOHb/Th1N+hHVeu54wOhA2WQGzB2nCQ2xErajX8w3X0IDv2ccmUe
 SxCsAb3oRPa3CGCpbBu3x0IsMEIj92SjayMko9U1Uk4imHa/JcpvvG+p97d8jvpGqyx4=;
Received: from mail-sgaapc01on2047.outbound.protection.outlook.com
 ([40.107.215.47] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sCcqe-0003CJ-QJ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 May 2024 10:17:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MI5tDdDYj1IaDgENOXD9duh9ZysYx5W4G4SGc8//wWCdqXsV6SFK2qPp0RkuuZttf21a/774zFNCddQQ8D2nqxe2p20GJBauVgNK+lyIhBAsPgU4h60m1KJlb3QYGKcidyW3QKm4amNq4oxw6odPJYF2OLMoGu7sX8Q4/oiaAerX2YYxWSjGzFxm02RktPLMVz8Q9h7CvdDr3o8/mKWr2QJYrIKS0HGl9FgPR/YYr7BYpTfES2qjkPneI290lnax4ZgUkRPsoJAheZYFqRxL2+1UtfrRsKeAV7JNH5DjJ8aR/PYW24YsVfmXL4QRjkw+Wc3HQ1D2EI8U1p/nEnX/1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6iFIcbH+I7wYmetgUEl0PtVhb4wF6eGAVvDNn7nfilc=;
 b=gn2MYi+LP1X/CHXB01FjLLLxRKnajR55ouBLdDzaQHGeeTGgboaG+S8kGjvzw7jxVKVhJePf6udYWf9QjCiq55CPdc8hrqnJO0xYoQE+sdQVWx/Cuk9KZ92Oqc0psfASML0koKXojMaEjjTYhS+KwQkTP2BQRJ7aUtzyWHan66Dpu1CJ5Fy6LjmY2d0jQ6Eu1F79JFCbn6w0TfSaQ67vOi3Ub9pZcKaOPZXO+DIx7dsS6P8Do92Xl3wNsOGfeJyok2P2AUnX73uj434BMf3EqlN1ogVB/ImrsI4Fu2OUtBSlCaMjMNktIYNfpE3laZ8dCRA9ae6tRRSuvuguQytCuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6iFIcbH+I7wYmetgUEl0PtVhb4wF6eGAVvDNn7nfilc=;
 b=uP1AogwkXhGJ6R+cJChXJ4lH3Qn8dbvVOHH4LNFaVjY0wRq/aXhN/RLLM4fVkwrLmC2LNSmA9wbHfppP5TRlP0xMNntRT+Vk+grnzR2JF9FVm1Gpc2cnEmAN1aqBazFqbx3tp2xtrHxU4G/3gL1OsPdu62UYXNALeGMeC3xbKnk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TYSPR02MB7389.apcprd02.prod.outlook.com (2603:1096:405:34::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Thu, 30 May
 2024 10:02:28 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%4]) with mapi id 15.20.7611.030; Thu, 30 May 2024
 10:02:28 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 30 May 2024 18:01:58 +0800
Message-Id: <20240530100158.762954-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240529112411.380453-1-shengyong@oppo.com>
References: <20240529112411.380453-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR06CA0187.apcprd06.prod.outlook.com (2603:1096:4:1::19)
 To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TYSPR02MB7389:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b6e9608-3213-4f19-d752-08dc808f9cb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|366007|1800799015|52116005|376005|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FXg8TpXtn2q0qA8iaqFdBV16t+Ophl3s0ADfkqdThggnXU2xERLKdTjDuX/k?=
 =?us-ascii?Q?/TZldt+WWfZZNMNDbFbTpVRvUM5+3lnrbg5jwzNGUsNXhEq5/E7OiAN70Ckx?=
 =?us-ascii?Q?0wOb/Hcf2rFch/m6Z5DfgYY+j9tB58K3QVJ1GCFzi4mxBdv+Uc/QPLGbLbjo?=
 =?us-ascii?Q?JGcNBvHcr2/lXz1oVB1XbF+aHXkwm/PFI+PzhH4L9pu8SCxsFz36dn1vETEV?=
 =?us-ascii?Q?fzBHtdhladZFExAapEEigGVhyVA1w46mBf4GA32pQwGQRUCa5R9YeIUQUvQC?=
 =?us-ascii?Q?zokjGqz/Yh2YpUTy9o2JUD3zR+cEQc9N+ny/zsnop3grK8q9gE38z4UhNH/V?=
 =?us-ascii?Q?xDmrDAZqWPVP5Rll3v+brIIvr6HsecO5SoH52Vfcy2Qx36bgic+1c40wNZug?=
 =?us-ascii?Q?uH5PhJLqKrhhH00l8TRraXLHvTsXCwzCrWIS25fn4X8DQHXeZnsaZ4p9DlVM?=
 =?us-ascii?Q?/PKB4IrPzPQwxcfAIQWaGv5fGxNT9xzpzejj9+kvWkkRV1z7xHrozAx44g5n?=
 =?us-ascii?Q?+74DH2WgP6LzX4Zfw4E9PsgnKJvs9ZFIif44TbZ0yBlaQRH9OKNsbjnK3ipa?=
 =?us-ascii?Q?HKqKvEGu1TRIYVkn3wx+npcAbr5Sa1ScfUdKFIZbT9wn4iNFkNM6JVqpv4IN?=
 =?us-ascii?Q?5r1WMz4Gs2YuVBN8JqcFS+jPFLH20Sz6H3E6WsU38KftFcZNFyc1nHw0/cFa?=
 =?us-ascii?Q?9GnqbKM1/pTTP5+DnB912GuJFqAVXLmBb3BkvvH5Wz7Ewxjb0nmYvyoi827k?=
 =?us-ascii?Q?ZX1j0C/SragmK6APMLvHEegbzkDFHd3BFbV5MCLd09Y03Qu6e+9nreKN3QCB?=
 =?us-ascii?Q?6QJrr3YmiuBAJ7/rynBzxv7GCvrXZMIARwk3HRro3XBP9xzcsNtsVZxM/ZYf?=
 =?us-ascii?Q?7PrQBwQoRE+8N3gCrr8+jTJj4EmReL89wzy6DUKAgVwej1w/GUsCpO7Wtoiw?=
 =?us-ascii?Q?XGpoLwp10Ci6dF1XMV3pgAr4RAQsmed7u1gEGPCc7vDMJ44qgjAnk5qu/MRo?=
 =?us-ascii?Q?hHQZWre0bERBdUgYsk5u39jho6dAF4JH4rApXMdA+2hdYyApYEXjs//AojHq?=
 =?us-ascii?Q?bLglLpXV+xv3oAGsjJNIFkylLEqxzYVP6Nu6AK+NX4A9s/+KOg0GXc+e7kzh?=
 =?us-ascii?Q?rUGVCXAA3xdr6UjVxWu2qO6jTb0Ih8b24mkHc0qBZRWobrowZehyMA2qs4dJ?=
 =?us-ascii?Q?7GKZDCpH/aukzXs4aJgVpNI29yk47gJ8LN0JO8NVnDZ1HCIuMQXDa7QAd68m?=
 =?us-ascii?Q?yHR8qVZsrsUTDHYJ6Sf1G9wqb5L0yEKLSeXo1Vpxf2dv6Ine7d23V05tDfcR?=
 =?us-ascii?Q?Kd16DmcChNvPi/nGu7BCID6vP/0DlGYSdCJD/3lJWeh50A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(1800799015)(52116005)(376005)(38350700005); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GHDX/IJokzw1R0umXM6QrEUMmaNnPMGaHefRWG9Aq4OFGFaFETCeWhEaftGu?=
 =?us-ascii?Q?fiFrKUbb/XO0cbodQ9hziY5V4VznVSxt/gPvhM39hG40FHm6I4GNZ9Trz3Wp?=
 =?us-ascii?Q?e4bSarfI9QPrqJ/2xXjGcnKwLgp/9bqxkVFk7rMbpdV+mE76zh0w0yzvdm22?=
 =?us-ascii?Q?m7eBDB9KdXC4mW0s1pLrqR9ZX1HmMY8FmCIkSNtjIYe/OXl2VDLc/6i0EofW?=
 =?us-ascii?Q?SNsYu8TTdUs2ForuFMBZqDSyodo4RJ2Hh/NVmF5sNGzAmU8DRwLvVPJJvk0c?=
 =?us-ascii?Q?1WcYiNctGDn6kTUhQAn59MPULlyFMLitVrmupUefKmFHMNy6vwVPoL+vWizc?=
 =?us-ascii?Q?XcsDae72bNVj7yWpjfslJPH12vtjjq2NJHBDiNa/oPR4UpO5bd2yxIwlTZr7?=
 =?us-ascii?Q?RqEWwoM7JlyZxbV/u9Dyhd59f/V3khk6iLTtWMBmbZrYVvchH7Nw5G5L2GLc?=
 =?us-ascii?Q?rd4LdVNBV0teO7754yRJOilvZoLEzGRXJvChKuy/Bu79GD+oKKO3wYOiZB0G?=
 =?us-ascii?Q?m/ANyv66HnPjowV8jpjpDvOVxp1jlXhrpbkTEoO0IymtwCm8gacrzYbYVJC4?=
 =?us-ascii?Q?pzTuHmNnyFveh4e2z5/Ot99RNs7o/X7ZHz+S/F+8GABezdis9iBFREQVKwXE?=
 =?us-ascii?Q?/gjC2AQReR/bAMdK2jC10gw8ezF5u/9Ojv660o2vfbOnkyyc273kKf/tSSEp?=
 =?us-ascii?Q?gYNPEXTYMlovz6i2mY2QkPk2s6Hz6gwMeqVhcut4bTNnw+cl0ByfQfRp8YBm?=
 =?us-ascii?Q?22vcf/Slla+2qfxeDLrHSQ4IVBt90c2bbx4Mwy9klsr0UHVVWxP7Zll3ExPl?=
 =?us-ascii?Q?IFaHHcm+ng4Ug0n5hY67+IQDOiD0gkuDGpBmXW39xaK3qmFvT2jWaB6a8bbz?=
 =?us-ascii?Q?54Qvw8rdU5C9CkjT3K8/zH0cpSRrAPYQlKzD/MkURP9JjOVlrba7OjRLqNCS?=
 =?us-ascii?Q?Qqyma3JhDTcSxZL1xhQc/pDf8Tb3eD7jHWT1gk+lE4QaMzsEt0/RXOiw0AMt?=
 =?us-ascii?Q?MmJ4/HTloGE3L3hAvFTZ8HWDRf9lq2dzntH4cQKMp0fKuz2QEDYDfxLgYJg8?=
 =?us-ascii?Q?8TVhqs0xU2ov1wjNMkotxk7qZaklii8l0wXukuMxpTk1qiyhng65nShZMYBd?=
 =?us-ascii?Q?5hdaNWCzzgMTDcmJ3xTNr4WS7oB4gHOWSzijDVyDl+8Mlatt20JuI6PDRsbG?=
 =?us-ascii?Q?VH6nOtgeeYVoyT5ONZrLzeDPpbsP9NVa21gfMOwidGxWQ2tHdnHuhHt6woX5?=
 =?us-ascii?Q?haqi1POkguDfPXKRF8E3O6UdJQKXJmEjPYYR8Bz/JtBJJCYJ4U8UgxPKKvqk?=
 =?us-ascii?Q?qg6yxUSs8rtH8NheB65P3/3af9sWRVnlJJnDrlYLh3c/70muuwW7RjMxJIX1?=
 =?us-ascii?Q?IUMCM7ATd3lntkzpYWhrmp+JoDZA/I11HIzwxxBPaJwO2NSCgwv3vW+IHx1x?=
 =?us-ascii?Q?zlG71l9Gl5i4CBkVRmwNKmwGuO/XVrsZRmDrAYqCNcuSMpi/6QjuyWRqmIba?=
 =?us-ascii?Q?hKY/8HUEmEj+Fy7en3LN2oF+ccekbgujvS+WXrt7JCmtMr+Ov1gri1S6BEgH?=
 =?us-ascii?Q?f/cdb04cNmMUmLd/FIYAzDEVHB7Xii96hdcJ64K6?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b6e9608-3213-4f19-d752-08dc808f9cb0
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 May 2024 10:02:28.0515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X+KKWsoW9zjuMbBJMB1zypXkW1GEq2H/GOl7M1mnPLgRCMROFGYRXlHCbIQFq/I07jxxP9K2/thLttYo2S17bg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR02MB7389
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If curseg is not the first segment in its zone, the zone is
 not empty. A new section should be allocated and avoid resetting the old
 zone. Reviewed-by: Chao Yu <chao@kernel.org> Signed-off-by: Sheng Yong
 <shengyong@oppo.com>
 --- v2: remove and update inaccurate commit msg --- fs/f2fs/segment.c | 3
 ++- 1 file changed, 2 insertions(+), 1 d [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.47 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.47 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.47 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sCcqe-0003CJ-QJ
Subject: [f2fs-dev] [PATCH v2] f2fs: alloc new section if curseg is not the
 first seg in its zone
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

If curseg is not the first segment in its zone, the zone is not empty.
A new section should be allocated and avoid resetting the old zone.

Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
v2: remove and update inaccurate commit msg
---
 fs/f2fs/segment.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 4c8836ded90fc..50b38cbe33401 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -5004,7 +5004,8 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
 	}
 
 	/* Allocate a new section if it's not new. */
-	if (cs->next_blkoff) {
+	if (cs->next_blkoff ||
+	    cs->segno != GET_SEG_FROM_SEC(sbi, GET_ZONE_FROM_SEC(sbi, cs_section))) {
 		unsigned int old_segno = cs->segno, old_blkoff = cs->next_blkoff;
 
 		f2fs_allocate_new_section(sbi, type, true);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
