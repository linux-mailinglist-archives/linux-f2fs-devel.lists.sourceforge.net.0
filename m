Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F3B191B4A9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jun 2024 03:32:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sN0Tk-000335-1Q;
	Fri, 28 Jun 2024 01:32:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sN0Tc-00032e-Bg
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jun 2024 01:32:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1XkzWrJunNjwg07SZ0xtl89vq9kjD5f3AOik3evu6LI=; b=F0lxDCUu2oIf1et39Ne8eHePpW
 wGoax4HE/gc6NrzLmTiBu6FqzkxboxSrF7F1xCDNDvjLMgQucUY/ULb9cvjfuFn4UtCq1ZSuK90mJ
 xjzBR+AudmKRl0cbHvYOfBCK16Kjf2fD0mflosaO7XOK2skkI3/HW7AaabzMq7BDS7tY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1XkzWrJunNjwg07SZ0xtl89vq9kjD5f3AOik3evu6LI=; b=S6nkbYfP6qSvmwV2WOQ+RoZFV7
 dGDSZmC400HrhT/tnymP6E1ZFHwEgR8UfD8sN8YTD4IqZefgHSzUceXWPY1Y1vjapOzg2JsK9YbHV
 kfvlpmssER84mQoA4Ooe3iq7Alm9TrbRnDSOoY/KXyAlFjJCJj0V9ROthcFQGnyd4wxI=;
Received: from mail-tyzapc01on2065.outbound.protection.outlook.com
 ([40.107.117.65] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sN0Tb-0006Jd-T7 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jun 2024 01:32:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gX8fCLdyGqq5kADgACRCcI8rKgLW3oM+UcGZeUp65BrK8iuB/AGG3VH2NQsJIvJFHdcDwPY3PhNC8H22NNdy82lBGbQl5ASpSw/u0fpzNWBzuTua/aFOdAMxUHTK85or85CUSf6EdQMXUIxp5xjhhBYd5TkS2Pi0fOWMyUGjdcIfHkL9IHM3M8aymBxugNgt+n6pcsf09MosHohzAZAoofWcCPfECCfQpFfuf2NrjJVfqXMg9EUJnXU4OxsYcS+R7bOPlVuel3TGF689LWIeZJmKQDtKHxq7Tr4fygB0sxrtNq7e7yjzNzsskgwh2FD9ZGkoHT4f1wFenmuRzwdoog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XkzWrJunNjwg07SZ0xtl89vq9kjD5f3AOik3evu6LI=;
 b=ktRPTeka2lyEiUNGD9ewSrkz8mXuGvCDfAbQVch3kTZ73D27rVYlf6CuS8Xsu9s//1bDLe4uaN1Awvjq9p2X7KRh2/cSXgEyauXJTZ3tdv8yOZTWFs6zx2yIS/z2No/WofmpUfLC2bJvWFyjcdcwZkjrVAnKUeBVTCzwLWafiFHJYX2auhRe4P4wi3uD8QrwaE7Vf6KSBHz2cNUNB04a4DOJGp9NKV83DdlS6nH2S3h8wobsjzPNA3pxfNdfz62MUx2cV6eJNWyIFvoxwtPqGxqSBs3Bt4Vpxg2yXSX2XPdatYG1UttQtohFcY1xGRHImb1F6ypkJkWv7kcUB4sWvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XkzWrJunNjwg07SZ0xtl89vq9kjD5f3AOik3evu6LI=;
 b=WjalKUl7ZesZnpOhIZPZSHVLsVfDXjHSVGiUOFhjYMWsL9pnULTZHLk68Mx2SR4a/vY8vIHSrUb8m1NxdtRpZh6DeEDfFMiUlU6KJNipprAYue90lNJFHuYCsGrnmmhEntj/ESnMVEzf/19C/UEZpFFM35zph7U5qlkg58GTK2s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TYZPR02MB6576.apcprd02.prod.outlook.com (2603:1096:400:41a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Fri, 28 Jun
 2024 01:32:17 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 01:32:17 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Fri, 28 Jun 2024 09:31:31 +0800
Message-Id: <20240628013140.2444209-2-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240628013140.2444209-1-shengyong@oppo.com>
References: <20240628013140.2444209-1-shengyong@oppo.com>
X-ClientProxiedBy: SI2PR01CA0047.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::10) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TYZPR02MB6576:EE_
X-MS-Office365-Filtering-Correlation-Id: b28d6cca-d370-4b83-9323-08dc9712258d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?AWGDaFJxIjkMmUi5Yw2RZc5a23C9R4paAb4CiwUvg2eovitLqSP5qcnWRzov?=
 =?us-ascii?Q?yT0hL6rwY1Xtv+ouObYyyPDybIqdxQFwgB4aaoBRydGz5+wjFqo+1rWyx1kG?=
 =?us-ascii?Q?CBpSiCAZt4ke2QwXN5S8eRNmefstbp3KFZ9DKkv192aQR6ZtcX9DJbVlv9Iy?=
 =?us-ascii?Q?X9G3O5zoFJeLfhAXh276BxRCZw+Yq/GlbLYNhTM2IN11KTNP/HVISLZl4Ycv?=
 =?us-ascii?Q?B5If1GK1SqY8smJupsScGOJ6blPs2xqDrBx74b5KVAa+Wje+4DrWzRmUpaDa?=
 =?us-ascii?Q?F60I6ZxZUgSYkd8i2FeNCfRyJal1DHGELNo4vmkedqHHpK8rIv8/dRBhUWm4?=
 =?us-ascii?Q?hQpC0SZoRwv4KWAcFRxTYzz2eT1geRHAkIz6LSh37lGDawTGHIWA93+/wNJ7?=
 =?us-ascii?Q?34Z03SASc0NcFzOKsecCs9LPs+VVwE4ul/MNGjAujZnhe5yFfjXaHAZKLq04?=
 =?us-ascii?Q?6VcQ2g3zEsODFvkBKj8nBYhXuhiKbButYV0C4RopHqm33zdGORKNOzeYhbEU?=
 =?us-ascii?Q?TsMp5Xx3DscpEipkX+st7sE9Q9hMWrHCWORKkekdQzePHafUkymbIuvb6g1m?=
 =?us-ascii?Q?UJOrmyI4egVyLgyAfwiAiJubuloNqNCA9U3v4jrg5dz2904ObQNKG3e7qsp3?=
 =?us-ascii?Q?/sOAVKu8gyJIMznL14mhw6go23mKIVlslookHf4FbxtYpc/GPAHY+0MxmUUc?=
 =?us-ascii?Q?abLpWikaXh7xj9ZMj85o2n4ySOWewXrWKt6TP92B/Rv7xN03Y/5giWLjuOtq?=
 =?us-ascii?Q?toieoA2iwlVM3WgIi7jgg1CxNim+GipTP18r4lFN9TuU6+k0Dwu2+DrGXt7X?=
 =?us-ascii?Q?MdR46pe7ocZ1eTnI5qgaXe+vsQa7D4i9f9/qpkmB0Ms4jd5ajaSxR/mFBvu3?=
 =?us-ascii?Q?VxEeUaB+ytGXYA+7YY0ByK1Ak3EzRfpchMcdFcnmGcaeUCtBGH9ga+AHERtR?=
 =?us-ascii?Q?7OkslGxwVq6JoRKzVQF1nuyJ2az7spXcyAzATJolFPRPfak9Zspt0rzhEPOC?=
 =?us-ascii?Q?D8QEW5eWPBlclURbTs9EphF0DqdjdaZ8uSGYoP5Ih5imBzKT9NBDgiCHApdB?=
 =?us-ascii?Q?b+kCWtLz4yRueLEwHPPh7L3BhXkIFfy8aNE7eGMfH57FhFWcmqSwTirZs4y9?=
 =?us-ascii?Q?suj9K1Q6EMQzwP+xnP2QGX4qpGcVc6k/XMBY4462w33+jV02dziUjPvnL+K9?=
 =?us-ascii?Q?vDY6LQSQ/TO0/VVD3+F+cwxLAfY0Un3ZiDvr+EXKNbx7ehQ91gwQvV+U+cEY?=
 =?us-ascii?Q?Ws0ayYps3iuigYxRk+bXM4g+IJyvzDzY4mHeQJ4t9Qkc5qGfv6dSGgCJTj5T?=
 =?us-ascii?Q?g/z+PeHIKkBalTQrfV5bKOxZj6ButHHRvQMMHQqxkkwRZAZW/+a73LFE/aTF?=
 =?us-ascii?Q?MfjVIzjEusiL8mwpR1C+nigJoWPf29FknHNj2UbAvGhcMxPkMA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w4jwBY+7uujDznmpPVr71uFEaxtPkuciVODPnbUlLcidqmuIRDVBYR75mMuT?=
 =?us-ascii?Q?sm3FNuU7b3yfdxsapPth8OAs8zPR7csUadaOVJUOcnxVb/Q/wdvAjTC0Mb1z?=
 =?us-ascii?Q?4hxo9wfvgvHXYD2rft5y9Rj2x2rtFkZQbFOeSH8fQ0b2fyuWtXs5F20WpJ+f?=
 =?us-ascii?Q?18q+rl8KSL+VPqcJeZ6ec/o1WBOZck7dRQ6QdzivMCpqPftT4XtE21VtlRIj?=
 =?us-ascii?Q?HSLzGXis3D83miSOCa1Gn9gKmU/PwR1t6f34OmM4eUgSNNtqKl8m8uyKbjHd?=
 =?us-ascii?Q?RePSU0EDif0tuCCLiA8iJRT/VX2CZ2Ow8vOtJtqOhgYA7HE8Xa3fMVONTGPX?=
 =?us-ascii?Q?4z3VpEg9DLUgkhnumB87/XrZodaQ76G0i8kytDPfUZ/8gTHrVTHAjD7Gal0K?=
 =?us-ascii?Q?Tv26Zoqi9eyIdfVpLoI0I5MwGTSX02mDtNZSNihCOLPMXTW63lCMP0gY83pE?=
 =?us-ascii?Q?jK18ZC+jGhTZNnu0z+Q2ZygpynfR9MOmF9lyx2qb1H/8nrRirU/cSH+emEas?=
 =?us-ascii?Q?r080lW5gW03/rzMsCp90UJ7geDVcYb6+k1rqI23Cwx6jxa5qzwJNOnPKid7L?=
 =?us-ascii?Q?cVsW1SZw/9TiYjtF/g1MH9YQUPGP67nSisbfap++13unICCbzcw7xIQslg/a?=
 =?us-ascii?Q?0xKBhLNh34we6RbrfMEZmjgYgWXJIpjKzW1hLpLcLyLHJJ1p0NXa2OYtgE8L?=
 =?us-ascii?Q?JcmVtbGsPgfaiObMRKUYwH/cXeOh0SG8vyxy1eaIg2+qwSZBgvQzruxl8kGJ?=
 =?us-ascii?Q?HQQPxViKku4aCZYQcCQyBovLUvXAvfKQfON8LhWONdlbukhPsu+NZ6CEHxeZ?=
 =?us-ascii?Q?32bmv2/8G0k6MA4chAaGQJb0UltoXqyKVQLejVnSD0+B+LBeUbzcIRTIsxi/?=
 =?us-ascii?Q?9MUZLrS7/vuCuzaVlOhkPY0SgfD1txWnhUOEB5Y+GgbnV7kJJOYZK4BLxqzi?=
 =?us-ascii?Q?cs0TtAgMbI0+pgwSyPXKDCaGCfx6byCkzmhRKPFk+rzAznHum+RTqOCXx2oL?=
 =?us-ascii?Q?vDqFGNJBJqIuwf5Gh3OZrEak/BZBynvRv2mwP9vY12tdirQg1Sg4hiDekdC9?=
 =?us-ascii?Q?hbEntplOmA1pLymeulXzoRoLkDPuSGeY5X3pC1d2S95O5xvzhvAWwn7/V6iv?=
 =?us-ascii?Q?WvNUcfUZPvTjIdAsYQjceENgzQdlDqDvo7u9Nh2pHV9w0oND1OG8Lr+NII6H?=
 =?us-ascii?Q?8gf+FmtqXgJwITrLRHaNP0sdGAPoUBJTDeut3cH6UwVpI919CobWwcjP5ASJ?=
 =?us-ascii?Q?I/Hyl12bHAXGekjlOatBh9YHRkw8uYqPbNdmePq4QUIkzVnALkDAC5CQYfIC?=
 =?us-ascii?Q?N2X7qVU1lTzVf6azLmW5uAFwnTFWnZUjtbpxjzMFwjblFGyudcZ6QmiawtYj?=
 =?us-ascii?Q?iDb9hlqDRA9tw0gdSwZA1/QAEr64iYcJ20Pp3HUKdHL7NZTXjr0242Qdjk0Z?=
 =?us-ascii?Q?+eWrF7srNHofZY3BNXws0Hzu/hpDfy7yuFc/H7L+thyniM+MngorT2kHKT1J?=
 =?us-ascii?Q?xsfSs091KhCnk+B7GbyKDWGPyk3f+KeCOzDSvpjRalGRYAbS/neWnD6ruWEF?=
 =?us-ascii?Q?+FsmBP+7jiT+muNlDJfjdumCSXpGGiWVapYxNSRO?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b28d6cca-d370-4b83-9323-08dc9712258d
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 01:32:17.7176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j226oHrQLpjbwrEHRnj6nlR//lfx+okiTLbTxbl8gKO+wZciq23GwELO5nfRaHdaIL96orL/AxPbfOUVjUBwBg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB6576
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Sheng Yong <shengyong@oppo.com> ---
 fsck/fsck.h
 | 3 +++ fsck/main.c | 2 +- 2 files changed, 4 insertions(+), 1 deletion(-)
 diff --git a/fsck/fsck.h b/fsck/fsck.h index 6cac926..4ca75b3 100644 ---
 a/fsck/fsck.h +++ b/fsck/fsck.h @@ -353,4 +353,7 @@ int update_inode(struct
 f2fs_sb_info *sbi, struct f2fs_node *inode, int flu [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [40.107.117.65 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.65 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.65 listed in bl.score.senderscore.com]
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
X-Headers-End: 1sN0Tb-0006Jd-T7
Subject: [f2fs-dev] [RFC PATCH v2 01/10] f2fs-tools: export is_digits
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
 fsck/fsck.h | 3 +++
 fsck/main.c | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/fsck/fsck.h b/fsck/fsck.h
index 6cac926..4ca75b3 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -353,4 +353,7 @@ int update_inode(struct f2fs_sb_info *sbi, struct f2fs_node *inode,
 int flush_nat_journal_entries(struct f2fs_sb_info *sbi);
 int flush_sit_journal_entries(struct f2fs_sb_info *sbi);
 
+/* main.c */
+int is_digits(char *optarg);
+
 #endif /* _FSCK_H_ */
diff --git a/fsck/main.c b/fsck/main.c
index 6edc902..9bda412 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -166,7 +166,7 @@ void label_usage()
 	exit(1);
 }
 
-static int is_digits(char *optarg)
+int is_digits(char *optarg)
 {
 	unsigned int i;
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
