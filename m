Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC4A891B4A8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jun 2024 03:32:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sN0Tg-0005UP-B1;
	Fri, 28 Jun 2024 01:32:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sN0Tb-0005U8-P2
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jun 2024 01:32:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i4bgclkosFD0UTNYwFawfFNM1WklWN2EzTUGRIE7v20=; b=bcgE4arbP+LZst7iIf9IhbNvF7
 cC03wKh/kfuht6dUx8icWDFBK8dLeK09wenj1v08pLlSpp+4apIAg9BZmEXJpmaQ3s5QgtYi5d0v+
 Kkoj5HDCfcW09MAt832tyPMFI5McsLvRbx0buelTMVsUE9TxjLAYJVYsZTa6zQVBVdzw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i4bgclkosFD0UTNYwFawfFNM1WklWN2EzTUGRIE7v20=; b=F3Fytc/kDhVlsB09zmfZ1tOj7i
 GxUA8gPWe2VUWmbYkF8f+wjefIxmEDhmo9olaaZa9SpNuWurIIQyR1DYkkoZ3rX3y7DwmB3fHuAE0
 llsLX+W2oHDlRTluPZM1OJ5CKT+iqY+uW/cl7Z053lj0cC+fsZpYW7EWG7PZkFb386n0=;
Received: from mail-tyzapc01on2065.outbound.protection.outlook.com
 ([40.107.117.65] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sN0Tc-0006Jd-OU for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jun 2024 01:32:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EJPV2Y0eey3iM+SKm5q4+r1ZVlMLeb3eQ23fCvPuDLhmrUnQQ1w95xm7SKWgXNE8EUrn7UczPHl9dLHMQCifsjxvghkFo4kTMPyvOG3xpeeyQcelvpA0ty1w1kaLozmtxGfXZLgw4M2k9+675DGfOPygnY8mLo3HmufXzdQDhhTst8/F683NaGNwHn4TkQWx9Z+McaMX+dmXaJiEwDSIJFo0fGSHnGq8fi558AXhCwAGVcdCEHmEcV8lgJAfZQAs/k9/fG8GjIkWgIq1rSC5yqfBdPios30EqG87ihFik27/uTil9bCcAzkoxYGFWBUJCLBhAxNOsL0P5+yhSZPJ1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i4bgclkosFD0UTNYwFawfFNM1WklWN2EzTUGRIE7v20=;
 b=SA2rjdUZYbW0C90Wingwi1JgQqKZgjOfcu7WcmP+mcy1QhiyuzYAgVKu7aq50CHnn9VI4QlTxqnPJmv9GycOWMYIr2S0SFqMabQkjLodX9cy9O6QKhlicTb1ZaYxQUefthqMjsYs/eph/jfF2nV6OfuIQHGOu+U6+bUib5EmXbLee6xHxiL/Y8nwVKH+VmX3GILo0+6lWgmblctBVhp20R6BuJRPFE2wpG9afzeAqEyi3P4lwsoELWHOX2q2BaCh5RltLuiNTEISZP/CgyTPopqQGfo59wfA1S5CKbkmi7vaYUonyI+xL1Jlmi4CWClGdL/xapplmp+pCySWD1xHew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i4bgclkosFD0UTNYwFawfFNM1WklWN2EzTUGRIE7v20=;
 b=MeYs8bDnOetNQh+ns3LYviDhyL/+LpzTCyYGoVwIe68syj1LP4zatZJuI6e9tcx4EaMfhTg0aPIU7QFHl+GPfiW9Z/sP8As4c+1Jq1DFUaCTHSc5bYsPV35Tnfdbu+UisRiahg1aItfDKS9IESYsoN+5kXDpjmnUqpgBofFxts4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TYZPR02MB6576.apcprd02.prod.outlook.com (2603:1096:400:41a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Fri, 28 Jun
 2024 01:32:26 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 01:32:26 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Fri, 28 Jun 2024 09:31:37 +0800
Message-Id: <20240628013140.2444209-8-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240628013140.2444209-1-shengyong@oppo.com>
References: <20240628013140.2444209-1-shengyong@oppo.com>
X-ClientProxiedBy: SI2PR01CA0047.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::10) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TYZPR02MB6576:EE_
X-MS-Office365-Filtering-Correlation-Id: f3b110eb-9b3b-4a5c-970a-08dc97122a91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qejrza+XgXGHPZtBNQVO6lu513U5GiIcIUMY3Om2nCn9W4daPFac0byF5lpI?=
 =?us-ascii?Q?DLqPjRKFiwt06SnUr89zS8jZsKvUPiOo+O+TF87Wim4TnBvnCc8qQTtOy6Jk?=
 =?us-ascii?Q?ecqATcHCf4AnM8pSuH2zOKp2rKRDKuRgiCpL4w+W4OEXCWQABuEcIsgbYypi?=
 =?us-ascii?Q?KUKumA3B/gdA5ziy5jdsSB56SsOx3ngOfwEQRl6etT1U7MgyfOBOV5+wGCKN?=
 =?us-ascii?Q?PDyrt3peA7X14yNps5RMWUiaGKx/b3fljvrVIjN4xwadQJtpIC3g+olaPJ4c?=
 =?us-ascii?Q?YEma0EA+Kux/FFz9BuuZvCCEj09Sqk+1Ee6tRbyp5xedrCkdgzLrEDzOYk1R?=
 =?us-ascii?Q?4dA/ivAG77AAWcsWOMYK2PZKmXWeQyY4s64+2uNscVQdNQFYhdPfO6DDdyfu?=
 =?us-ascii?Q?jFM46bJtnPSi2IHTMgjOHRUW8CzDNlGeXk+cWU6NPWDOjrBM8hlD/8tSkLg5?=
 =?us-ascii?Q?YBH8I/cHi85SlMnT8PJ+sISHlas8Opr8BsUmyBDJ8YVg2w3JzAjTn2z9VZsR?=
 =?us-ascii?Q?AfKcK6i0GiSzXjEFdJUExvisUzOD5u5HoqgG8eRwk0A1gJscelcXNyhY9AWV?=
 =?us-ascii?Q?vn+zLbXq3+H/LX0XXxK/PYq8DtWocxDCoD+8PBgnw5uLUumWv9+EFowhCsc1?=
 =?us-ascii?Q?2+NjNamUj4f/ATGd7Fioe9m0cFEglJA0wc8YkXr6tMtNAMdpBAZIfrj61fxx?=
 =?us-ascii?Q?Wa3AhpCGQLVtrekMQ65Fm+IA384J8fP8ky1eJR5pvn8b2vUj8ANdfUkMJt4G?=
 =?us-ascii?Q?Jb5FU9afcmj6s1XqUU0UDluHNHrtEyAtEz7aVCcYSLQO9R62/kLrMngSbUJ3?=
 =?us-ascii?Q?OYjdXrkxpJiJaYBnlTTweuw+J4jHZRHnXCYlHX/I2IjHicVd74CrCgJVaOa/?=
 =?us-ascii?Q?m7jphIe30TRSpl6VSwmBh+JxCnq2kJQv49cAJdjyYLl5KCHKUJisqJPa/lMI?=
 =?us-ascii?Q?rw45VqHmmQB4ifyfOuTxVhkcOUSVexgG3wwbqOPuTKsWfweswpXOjI7vp7Js?=
 =?us-ascii?Q?9EITb54FN1I5Ecpy6HCXCkwGcc+oEGOdmym7cx2zoBVN4OrgtkPRl1/NQpar?=
 =?us-ascii?Q?UHE7Di0yqr6PAaPi7nFRU/G1eOmMJ6qCEQ11ZVSusgsnk+2MnC7h9bgoOZzF?=
 =?us-ascii?Q?0R0UhuphnQIIQPWpToYyLmIEwfTbLA2/6LdILJ6pvP6dEtB2PP13UsH9utEN?=
 =?us-ascii?Q?nuHrBDMF1E5U5Ld/lUIQgxfZNYgYOdt/f+4EXjy6oy26PLSDdK03L07h1eJN?=
 =?us-ascii?Q?B6zL8J1C7Gv+xTVP7Vs0cFOnN1wGYzCfImPqisq2goens2tWW6kb8BHoGiGS?=
 =?us-ascii?Q?ph0ZaO3QFeUYR770g1Zh0Oa2LG9d/0Z2ARud5pOrh3mqXWGeAJjpR3KVwM4h?=
 =?us-ascii?Q?hCR95Bh7JiqF6V6KrhLxZ8BORteX1p9XK0jJWmppRm4yNlYyGQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?943U9qbhICek3xZS6xPetGGKWHN/0dfxHFzCiLmJ/3tK3hluB1bxtLOkNqE7?=
 =?us-ascii?Q?UT7dWtA/XNaDCJGmBZ+RJut/ztu6VS0NnVLai2ST9IyraAPjFs2LqJJqrZE2?=
 =?us-ascii?Q?MaYm+wARjE6c8Ek+We69cKyICwQkJ+g9G0w0HrInfqbCoyWbCLGMmXtweS2e?=
 =?us-ascii?Q?aSdFJiwodDRN2TeRjv9MDpLGU9ZCql/X1RB3ayTT1/9HTszVKqby5evrWY5n?=
 =?us-ascii?Q?7Rh7zV4hLeRnYf4SOs7NjBXqW33E+SFvL/+zMGdqSNaDFUauJb6nDXarK42u?=
 =?us-ascii?Q?zRNjAdpLE9KR3/1xdpQFm0CPgrOzySlCGruEWmFKaPFQOFGkKnPxEYDr+yno?=
 =?us-ascii?Q?MEzpFQc26YVYK7V/t/Q3Q+y/zbhF7ClCjPGUtmDnCC6ETdXCRQj3+6z7+Nrx?=
 =?us-ascii?Q?XHdE080cO7iSWa7gp/lt9sG/B1LaPqbJxQEGyRmJ/vc81gMUmJP+FyAbfWXD?=
 =?us-ascii?Q?ZchRUxMh8tGSJv2TsTkduu01+xC+Vv5EoCi7dVluF4OA0vx5pz4VZxld3ptx?=
 =?us-ascii?Q?X8Nt0BOkvt/XVBsZyHsY4RT994yuBP8sCGgEWzWvdvdciTWrcVx7fyw1aOgk?=
 =?us-ascii?Q?0CVbGw/LYJN7Kpc57hfDXJ7fQsP5j8F5JGtf64e2xyCbOCjYfRS21bZXEPFa?=
 =?us-ascii?Q?ETVeTwgxBL8+I8qFH6iKQq32KSCKX2cYeImHc2byAC9D6Dd7OccFVRuRPYqh?=
 =?us-ascii?Q?LJiuS8VMso4N7gXZzuEVPtxyKvEpV+3HkKvUa9E8/UutEjzaFMkRmEWXNENf?=
 =?us-ascii?Q?fUvJl2tyAnf97I4+d5TumynVR8drx3DJc+1HOtj4MNkq9lxQY+6wkVKOtVRG?=
 =?us-ascii?Q?LVKZCzy43NgcrrJaU7+K+Bx6DhfbQJtjeVV1J8WyJqmc9iQEfx7+t+coC7Vq?=
 =?us-ascii?Q?h/PC5dNvjmrIWvILB13uk+z1aH8fNoDwX2jpI1SGPsM/DnuwLVxsYLzMUWzm?=
 =?us-ascii?Q?lp1yqZoQ5sNSJyo9pdgps3anoxjoGNzpl0U8NM6ucAoLM1DJhuLAf6Adrmdd?=
 =?us-ascii?Q?95QRygOsJqeW2b16lTOxK1lLDN+GEodAqy5C0q+Msgz/0mC7FUsxltcwaSjf?=
 =?us-ascii?Q?kllTdqIBP1yEqMO8JSptLSYfU4c8ZY6pLKGmlP0LqL/HyZAPaMrwhl+sg9ok?=
 =?us-ascii?Q?MtdSLy7UVFzCzFvRDBNZ9z0/r8p5aUEyh/j3LyQVW0Jcr4am2BBhTzjmShG1?=
 =?us-ascii?Q?STjGyk25kq99zi2zK/XWeDy0OPWnsI3bLgYev62Ocm7adHINpSkovPgy5RSi?=
 =?us-ascii?Q?0lgIuvjBaXDswPI/bS5Jby6UW5ciwUK9hkI5C4Xsvlnwf6/NEknwSuoHBBaA?=
 =?us-ascii?Q?PogW+so7fuSp7e5uPEPcG9AnXvSE13NAq5+z8TKNRR09JAZYL6qJsiGkAd5h?=
 =?us-ascii?Q?aNvBDD0JwNiYue0TuxuiwFaqM1IOWcHq1VltCdjWXStQu7xTnZo9uafRXbMQ?=
 =?us-ascii?Q?OyzKdD6pXRSGn0+1Z7b3xmQfKo7WmU2NRXDqq2WXBAaX3Vty9qxhqdkLuwY1?=
 =?us-ascii?Q?2nzA+uNDmxCDcTMBfqO7cWIV8ZtqeAi2XLZh8kuHMhuGuoFzWzQAwOl9blyR?=
 =?us-ascii?Q?4zd1EWl6yNC8659EqgVPmqG5TMbhHW+um41rwhYk?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3b110eb-9b3b-4a5c-970a-08dc97122a91
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 01:32:26.0860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LUXIOZm9P2kMVAllZOzR9bcPcLpFvfgd0TwEnF8IO5WyrjKurai5nCqHI4RCNsc4tjTtcBIFrnPl3v4n1ieadA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB6576
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch enables injecting summary block or summary entry.
 print_raw_sum_entry_info() and print_sum_footer_info() are added to show
 values of the ssa entry and summary footer. The meanings of options are: *
 ssa: means ssa entry is injected. 
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
 [40.107.117.65 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [40.107.117.65 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.65 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sN0Tc-0006Jd-OU
Subject: [f2fs-dev] [RFC PATCH v2 07/10] inject.f2fs: add ssa injection
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

This patch enables injecting summary block or summary entry.
print_raw_sum_entry_info() and print_sum_footer_info() are added to show
values of the ssa entry and summary footer.

The meanings of options are:
 * ssa: means ssa entry is injected.

The members could be injected in cp contains:
 * entry_type: summary block footer entry_type
 * check_sum: summary block footer check_sum
 * nid: summary entry nid
 * version: summary entry version
 * ofs_in_node: summary entry ofs_in_node

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/inject.c | 123 ++++++++++++++++++++++++++++++++++++++++++++++++++
 fsck/inject.h |   1 +
 2 files changed, 124 insertions(+)

diff --git a/fsck/inject.c b/fsck/inject.c
index 0fe9b9d..7df9334 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -43,6 +43,25 @@ static void print_raw_sit_entry_info(struct f2fs_sit_entry *se)
 	DISP_u64(se, mtime);
 }
 
+static void print_raw_sum_entry_info(struct f2fs_summary *sum)
+{
+	if (!c.dbg_lv)
+		return;
+
+	DISP_u32(sum, nid);
+	DISP_u8(sum, version);
+	DISP_u16(sum, ofs_in_node);
+}
+
+static void print_sum_footer_info(struct summary_footer *footer)
+{
+	if (!c.dbg_lv)
+		return;
+
+	DISP_u8(footer, entry_type);
+	DISP_u32(footer, check_sum);
+}
+
 void inject_usage(void)
 {
 	MSG(0, "\nUsage: inject.f2fs [options] device\n");
@@ -59,6 +78,7 @@ void inject_usage(void)
 	MSG(0, "  --cp <0|1|2> --mb <name> [--idx <index>] --val <value> inject checkpoint\n");
 	MSG(0, "  --nat <0|1|2> --mb <name> --nid <nid> --val <value> inject nat entry\n");
 	MSG(0, "  --sit <0|1|2> --mb <name> --blk <blk> [--idx <index>] --val <value> inject sit entry\n");
+	MSG(0, "  --ssa --mb <name> --blk <blk> [--idx <index>] --val <value> inject summary entry\n");
 	MSG(0, "  --dry-run do not really inject\n");
 
 	exit(1);
@@ -120,6 +140,17 @@ static void inject_sit_usage(void)
 	MSG(0, "  mtime: inject sit entry mtime\n");
 }
 
+static void inject_ssa_usage(void)
+{
+	MSG(0, "inject.f2fs --ssa --mb <name> --blk <blk> [--idx <index>] --val <value> inject summary entry\n");
+	MSG(0, "[mb]:\n");
+	MSG(0, "  entry_type: inject summary block footer entry_type\n");
+	MSG(0, "  check_sum: inject summary block footer check_sum\n");
+	MSG(0, "  nid: inject summary entry nid selected by --idx <index\n");
+	MSG(0, "  version: inject summary entry version selected by --idx <index\n");
+	MSG(0, "  ofs_in_node: inject summary entry ofs_in_node selected by --idx <index\n");
+}
+
 int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 {
 	int o = 0;
@@ -137,6 +168,7 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 		{"nid", required_argument, 0, 9},
 		{"sit", required_argument, 0, 10},
 		{"blk", required_argument, 0, 11},
+		{"ssa", no_argument, 0, 12},
 		{0, 0, 0, 0}
 	};
 
@@ -204,6 +236,10 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 				return -ERANGE;
 			MSG(0, "Info: inject blkaddr %u : 0x%x\n", opt->blk, opt->blk);
 			break;
+		case 12:
+			opt->ssa = true;
+			MSG(0, "Info: inject ssa\n");
+			break;
 		case 'd':
 			if (optarg[0] == '-' || !is_digits(optarg))
 				return EWRONG_OPT;
@@ -227,6 +263,9 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			} else if (opt->sit >= 0) {
 				inject_sit_usage();
 				exit(0);
+			} else if (opt->ssa) {
+				inject_ssa_usage();
+				exit(0);
 			}
 			return EUNKNOWN_OPT;
 		}
@@ -552,6 +591,88 @@ static int inject_sit(struct f2fs_sb_info *sbi, struct inject_option *opt)
 	return 0;
 }
 
+static int inject_ssa(struct f2fs_sb_info *sbi, struct inject_option *opt)
+{
+	struct f2fs_summary_block *sum_blk;
+	struct summary_footer *footer;
+	struct f2fs_summary *sum;
+	u32 segno, offset;
+	block_t ssa_blkaddr;
+	int type;
+	int ret;
+
+	if (!f2fs_is_valid_blkaddr(sbi, opt->blk, DATA_GENERIC)) {
+		ERR_MSG("Invalid blkaddr %#x (valid range [%#x:%#lx])\n",
+			opt->blk, SM_I(sbi)->main_blkaddr,
+			(unsigned long)le64_to_cpu(F2FS_RAW_SUPER(sbi)->block_count));
+		return -ERANGE;
+	}
+
+	segno = GET_SEGNO(sbi, opt->blk);
+	offset = OFFSET_IN_SEG(sbi, opt->blk);
+
+	sum_blk = get_sum_block(sbi, segno, &type);
+	sum = &sum_blk->entries[offset];
+	footer = F2FS_SUMMARY_BLOCK_FOOTER(sum_blk);
+
+	if (!strcmp(opt->mb, "entry_type")) {
+		MSG(0, "Info: inject summary block footer entry_type of "
+		    "block 0x%x: %d -> %d\n", opt->blk, footer->entry_type,
+		    (unsigned char)opt->val);
+		footer->entry_type = (unsigned char)opt->val;
+	} else 	if (!strcmp(opt->mb, "check_sum")) {
+		MSG(0, "Info: inject summary block footer check_sum of "
+		    "block 0x%x: 0x%x -> 0x%x\n", opt->blk,
+		    le32_to_cpu(footer->check_sum), (u32)opt->val);
+		footer->check_sum = cpu_to_le32((u32)opt->val);
+	} else {
+		if (opt->idx == -1) {
+			MSG(0, "Info: auto idx = %u\n", offset);
+			opt->idx = offset;
+		}
+		if (opt->idx >= ENTRIES_IN_SUM) {
+			ERR_MSG("invalid idx %u of entries[]\n", opt->idx);
+			ret = -EINVAL;
+			goto out;
+		}
+		sum = &sum_blk->entries[opt->idx];
+		if (!strcmp(opt->mb, "nid")) {
+			MSG(0, "Info: inject summary entry nid of "
+			    "block 0x%x: 0x%x -> 0x%x\n", opt->blk,
+			    le32_to_cpu(sum->nid), (u32)opt->val);
+			sum->nid = cpu_to_le32((u32)opt->val);
+		} else if (!strcmp(opt->mb, "version")) {
+			MSG(0, "Info: inject summary entry version of "
+			    "block 0x%x: %d -> %d\n", opt->blk,
+			    sum->version, (u8)opt->val);
+			sum->version = (u8)opt->val;
+		} else if (!strcmp(opt->mb, "ofs_in_node")) {
+			MSG(0, "Info: inject summary entry ofs_in_node of "
+			    "block 0x%x: %d -> %d\n", opt->blk,
+			    sum->ofs_in_node, (u16)opt->val);
+			sum->ofs_in_node = cpu_to_le16((u16)opt->val);
+		} else {
+			ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
+			ret = -EINVAL;
+			goto out;
+		}
+
+		print_raw_sum_entry_info(sum);
+	}
+
+	print_sum_footer_info(footer);
+
+	ssa_blkaddr = GET_SUM_BLKADDR(sbi, segno);
+	ret = dev_write_block(sum_blk, ssa_blkaddr);
+	ASSERT(ret >= 0);
+
+out:
+	if (type == SEG_TYPE_NODE || type == SEG_TYPE_DATA ||
+	    type == SEG_TYPE_MAX)
+		free(sum_blk);
+	return ret;
+}
+
 int do_inject(struct f2fs_sb_info *sbi)
 {
 	struct inject_option *opt = (struct inject_option *)c.private;
@@ -565,6 +686,8 @@ int do_inject(struct f2fs_sb_info *sbi)
 		ret = inject_nat(sbi, opt);
 	else if (opt->sit >= 0)
 		ret = inject_sit(sbi, opt);
+	else if (opt->ssa)
+		ret = inject_ssa(sbi, opt);
 
 	return ret;
 }
diff --git a/fsck/inject.h b/fsck/inject.h
index ece4915..c828f3f 100644
--- a/fsck/inject.h
+++ b/fsck/inject.h
@@ -30,6 +30,7 @@ struct inject_option {
 	int cp;			/* which cp */
 	int nat;		/* which nat pack */
 	int sit;		/* which sit pack */
+	bool ssa;
 };
 
 void inject_usage(void);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
