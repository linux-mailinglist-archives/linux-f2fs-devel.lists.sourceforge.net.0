Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB4091B4A3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jun 2024 03:32:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sN0Tc-0004Ne-VM;
	Fri, 28 Jun 2024 01:32:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sN0TZ-0004NO-2h
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jun 2024 01:32:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SFn6PIa8P/df4G28mhr6CD8TJO3PTD1fEoU74xReBDQ=; b=PVtiubI+PjF16NoZNi8X6Um3KB
 IYxbs9nRDAUsrs5FdY+WhNEjFMYWzckEq2PJ9toiEW/GjwvLhxeK0kiXm12QWNrKiResLqX0DKNvw
 qXr0/DD46dZ9gnW5vqqUZ/2xfKsVUn/28BaKqep4R6cjAD3VUUKzndrbfmi2Cx7x/AeU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SFn6PIa8P/df4G28mhr6CD8TJO3PTD1fEoU74xReBDQ=; b=MmMcvGOYDk3TeI9sJdhUC1wewj
 Nu9cdtuh7fga7qHEuR986UXoSCkN29FoWuCSyEiLEjiPNxdifBVaUkxQOSN8jTs7Ik4b+TMW/wpN6
 o9jcFAYawOwKKPVc4h4aZyELFlRzNRStgFDJtIf0wOznR6RFIMn0hPE3IwenzVsjTYdA=;
Received: from mail-tyzapc01on2044.outbound.protection.outlook.com
 ([40.107.117.44] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sN0TZ-0006JV-6u for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jun 2024 01:32:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MXJGrRpbLrcI8nAxA+RjPJy8H8KvIS3agujK0hzQFq2tU6xcJPiOwQ69mXZFWGNzCtsCHPKbrtZTeHfNBLbCS07CZ2mBv/jEsb2rGHP/rP7fwElCfZM/vhMPkebZUBZMtjregDCmgeNVpuUVaErYe5le7L6PbIsQel6tLoCFrMyy+GTAO5BdB/kRfCOv8WZ4P6l5cLtf1HRRLL46Ou/wT2xbSXi+UPp7MIt0LNvOS+eRPvZS8178RWUFO3jwKdBXNfr3yOEBCwa/loE4/iuQiWS9ACrib9EQqpGptyFviuE2XhJSiDt8qbThwDzVRhQmu1xDX9lHAdLinEINv8A9kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFn6PIa8P/df4G28mhr6CD8TJO3PTD1fEoU74xReBDQ=;
 b=jfxixdqd3xOZrsA8c3RQKkuL00ynu3gg4DeFI+p68zJXtY3TlgRHCxhp2COcsyxJxAb+rpoWCh9bh6Y1VPysZ53NrdQEo2b//X2+KcgEBcfj3g7Vl4dqae6wFA6YiqPC0laDjNB/sILlfgW6U0xdevZQ3wO+fkn7I/AGj3MhsRQ/ONYNIrAwgCP0Mu4N9rqfKxc7zRQmC9drColq3EStxUO/900qRhgTlBXbGVoGMNjIkJ08MwbQoxas4gMxryS1UMoufoeu/DqsdXqDRTQMaYwk4K5OSldyCKGUVz4kTpACq8AIC8PaUu+SUItHc8uXLP1R5BzvrhgKDZ1+UFD45g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SFn6PIa8P/df4G28mhr6CD8TJO3PTD1fEoU74xReBDQ=;
 b=WnDhAqFQ7qtc/Qf/hFmhNaRfTYvrCMfp1K/0OO/Fy+KXtDLQ2cFRfhXeLbNG/w3GG72EYszsvHD17P2MUT7uYsGHGY/s1VKv6s73Il452iwQk97TYF99jUw9WpGSULJYTqjKTZ5vPXczcd0zi+vCvmXTqPSmGccdwQ8uNjmDpk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TYZPR02MB6576.apcprd02.prod.outlook.com (2603:1096:400:41a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Fri, 28 Jun
 2024 01:32:20 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 01:32:20 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Fri, 28 Jun 2024 09:31:33 +0800
Message-Id: <20240628013140.2444209-4-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240628013140.2444209-1-shengyong@oppo.com>
References: <20240628013140.2444209-1-shengyong@oppo.com>
X-ClientProxiedBy: SI2PR01CA0047.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::10) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TYZPR02MB6576:EE_
X-MS-Office365-Filtering-Correlation-Id: 169f732c-d6e1-4e76-9d34-08dc97122726
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lw5hbd9mZmBv2V4vSmUtb1v/7pa+qqeU+PbIcNHnEFxSIagSiC6HMWio2JDj?=
 =?us-ascii?Q?VRjUGVXCFyEHYRGI1WBTY+eeG3AzywWpr3cTol/HFjyptnZA4QUlaI9KyUS/?=
 =?us-ascii?Q?svjOx7RIRYHFo8CasguNR7zAQrEdXojZ/aVkWadUpSftaoc+MDLHP4FLHHo9?=
 =?us-ascii?Q?CRWNMB7e4OreJbadZ7fhegrTaRohWcvQxQTSQhVhwA3scNhVD4c+waivoDKX?=
 =?us-ascii?Q?acPQwkOUaTf8pUlxZj32ztalpnJd7hDGBFNQpQ0mfpYa4eU0YNBrrYEmQsz6?=
 =?us-ascii?Q?sP2RrI+IyDo/Pd6xsZ+xlfPo/FHKESMW3xQlqkwDab9QH6FhOR4DkNxUGlWg?=
 =?us-ascii?Q?wxl1ZGGCH6fkNaFRTkU8A5BA4Oxt4paaVyhaY0ITqxSbxnLYaRUg8U1zSlGt?=
 =?us-ascii?Q?n6BMbJKCF21gSiDNzNTsabK80mjGOBaoMCp/S9T7QJyY8kcsU1WGcsVme7yC?=
 =?us-ascii?Q?C0Jm2RxDRg0PfvK7qrmMgg5z4Hx1cKchAZlzdSHhu+4LUT+VhhLnXHtNhgOR?=
 =?us-ascii?Q?Z/EtvcjV1KdTV9GVhm8CSz9mTIk1bDmOd4cO+YyPMxbxjAjwdOOrfjC8/F8d?=
 =?us-ascii?Q?3boU1aAY81n6tJnpiOrqfbFKhITUV4lR/TIo2XO0kZzc8gvfNGDz8Qg1+geS?=
 =?us-ascii?Q?R27Trokwon0mwMrrVzvFPi11AbutYH1yrp6Gw02eA5Qz2AE3hokWVIZm8ic7?=
 =?us-ascii?Q?hc2p7hHT8/Nt6J4ryfA47OCuN/GhW07OuYfIHMIuQRTcYGorI4N/PR+KRsAr?=
 =?us-ascii?Q?RiQ6qkFu7fKhJOCJwu83DpkA/Vp+cRRMci1iP4c4/4/7Gv+xdNrh73tkl65+?=
 =?us-ascii?Q?eKLYUaYIjudsfuWkzdZ4gEqNsJd5ma/24gbfoutjbNjzQ+ZSiAp2998aPHeu?=
 =?us-ascii?Q?d7p1Uimtt7Z1nDdcY4addqmvgjx/sPw6xZlcZ6GKa+M3EKD+aE49XVzt05fN?=
 =?us-ascii?Q?AAwCHIrrqxiMzrZN+nPsS3V9q+ngUow5fclN9u8MxJ+iThaXE+7z1Cv+wBK/?=
 =?us-ascii?Q?0WgZZ+wSQI92WKsuoSufyyM1lz7HrM4Dgk+fRoaJ0+nfdAbPmfYhggc6Wamn?=
 =?us-ascii?Q?5LSBXpHRYFVdbf2l73uzlt7ezZr4oAlA3cJ8/olSZFx58ZQJB5RQQz8UYfUY?=
 =?us-ascii?Q?bgOeAF9q+B+hnaq4osZzkrJxPODyzTRBQZiHNVs8Oy9tmEFHAoRb00qOldJ3?=
 =?us-ascii?Q?jd841xOEtrsLUvMAKYUisGZczVkZ1x3aZ9sr/Lge9L4/M0CZnv5newO7Yj+D?=
 =?us-ascii?Q?HqRgdiG8hiEPll6gXtzE274dJVCVF2h4daBFPFKfMI0Rps3z++OCl/Zh2Ss6?=
 =?us-ascii?Q?8DDyLMhJXxDt7Tiwxrk7RylezDM+kU0wBoX9vDpntqP45xckXLw/Q6AY0ejQ?=
 =?us-ascii?Q?sOvH3UxpdJD0zi9CA9G03GJTNTvgMr9gciVxJRwMmHspXqUNgA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w8ydHIv4B/QT6tF1/vmjw5vuHfXvaz0CLn32nPA229MklQED5gPem4NEICPa?=
 =?us-ascii?Q?PTzL3YJ2ZCiti2OdlD5XQMEz3R+IUTwU2d7r2EP/zyMn21wX0eOwT08OJIWQ?=
 =?us-ascii?Q?3mRwgyYxxxxrjPeBd+24S0ex+Y1oa2nAo6qw+UfUW6FHFb7I2jhaAiaYkf0R?=
 =?us-ascii?Q?u7S4ZKkh0hP9kDPCj0S1Cwr7Xg4RJbReICLqogjEuPumc4kYDwf+BoCcrsYJ?=
 =?us-ascii?Q?3rThYSGs5s4jyzYrEUDzFJCX/SzQfSTxzJyZmVcOHBJ7V7nyQFPFV97j6Lvf?=
 =?us-ascii?Q?sgqdVge8jYc9dsJe/IZmCPI2+LABL7IFP1+lqmTbkm6XFG5WhIsc+DECpqHw?=
 =?us-ascii?Q?KtpxGlp7+jpztV2ZtB1WeZCnxKetTYlWhS+hQFUHk9ScPJ0PY0yNj9blhYQy?=
 =?us-ascii?Q?EynvvjijfhlcOnzfH01W7fBSgLGv1leVMUCLkr60q/AloX2rRQEdJuEiPBiP?=
 =?us-ascii?Q?1WrpIYVOo8lRSB/8jOSifvM/W9yPD9RwtTbKtR9kwryiZz/0xyqei/9qxZu/?=
 =?us-ascii?Q?P6+oIi+ssYEzuLj2Jj20/o09VAb/uueihdNLzyW+SsWFiXtdVNtB9e4TUsHU?=
 =?us-ascii?Q?RpO8o9ReZ9A6IfQbhyWGXLfoc7lMuOoJrPVmqA5njBMYv+P/252FOgOo08O1?=
 =?us-ascii?Q?9Lsqaflo5xIgb1DYbQ2dREHBrJPPJuUQlNcVYrEgnsPMZVSHUyGSjJ/1AX2v?=
 =?us-ascii?Q?BuRcISFVh6DMM+15eQV0mJk9awR8lzA2wGHwHY+8AMmV+scaGqX2iQcfk0uT?=
 =?us-ascii?Q?rhfBfmEqv9AWD8873VkQku/r24HErZQbjHpNsGbp2SSYSNCboHKl8Ms5KWdj?=
 =?us-ascii?Q?tbDMo2yGjZ9MzUKhUUhsr58gSRp907b02HZ4CY++lTLvpA5y2SGwM0GNDrOz?=
 =?us-ascii?Q?xyQ7v9V54PwyF+auMqEOcWdmpO4JJRIOEgxwPzTh7W3yPNRn3qukK+Y20oQ7?=
 =?us-ascii?Q?modJRgwCf1fekm5JqnDqXEwG0TlqDn2imafQBtyV088HXOa1n4vdMA4V2rLh?=
 =?us-ascii?Q?64K3lK77NOZhMLzBKSgAVq2JUJP0VAuS98tnTzccc468KIXPFJtVF3YlcjHn?=
 =?us-ascii?Q?GIXfcsYvXFRU8/a3A4KkGk+rc/C3SVIWyKmErTdVlfAUzJHeabK6sVj3oZup?=
 =?us-ascii?Q?WCtVm/TEhuw2O1/KkkijM66atxQ2p8QieyV9oGrk6qyipNO5PnnwoFkqNh2h?=
 =?us-ascii?Q?r/yjCy+sT1su6rocByt6j4uXMhZ7OP100oYFgMT1L8tZK2HRNSEnKrmqGI/Z?=
 =?us-ascii?Q?6glx1hcML1OZXtaJkiKyL9NMbYn7Mo/J7TEgXNxYE5vr4D1g42Z07kHL13yI?=
 =?us-ascii?Q?SFDepihJHl3EhpTJ2DC8zhcZLN45+/5J+fRNmLFthTS/PRxQXHF8CNlSskzk?=
 =?us-ascii?Q?Xu946GSIs5ftXRt+ZKECzIy2JabfSr5fmocraSvYPKZ45VEG8VjelRWbOIcN?=
 =?us-ascii?Q?9pmm5iSs6RKCTg0237aTPa1o+cXg+PWnTy5EaIZ/uRJ1vhY9OZGQ+wUvu35F?=
 =?us-ascii?Q?lPJSm4e9D8WQ6WIKvEczh4UY9vovfgBe1qPUMF03xSdii477J1bb4tR/Nri9?=
 =?us-ascii?Q?OXLL8YDJGLHiYIIq3b6UrnLZDu7Z0KVaIEhKodas?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 169f732c-d6e1-4e76-9d34-08dc97122726
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 01:32:20.3761 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xhxTwxukots7XJggCTi3s70yeFHUxQJ3JdXoCjSNfTD+hHrSHo/LvAlFosZxS2urrrwkOlx8bLQk6/cILX+B7g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB6576
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch enables injecting super block. The meanings of
 options are: * sb: means sb is injected, its argument chooses which sb pack
 to be injected, where 0 means the current valid sb is choosen automatically.
 * mb: indicates which member in [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
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
 [40.107.117.44 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.44 listed in sa-trusted.bondedsender.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.44 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [40.107.117.44 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sN0TZ-0006JV-6u
Subject: [f2fs-dev] [RFC PATCH v2 03/10] inject.f2fs: add sb injection
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

This patch enables injecting super block.

The meanings of options are:
 * sb: means sb is injected, its argument chooses which sb pack to be
       injected, where 0 means the current valid sb is choosen
       automatically.
 * mb: indicates which member in sb is injected, its argument is the
       member name.
 * idx: is used when the mb is an array, its argument is the index of
        the array.
 * val: is the new value to be set when the type of mb is a number.
 * str: is the new value to be set when the type of mb is a string.

The members could be injected in sb contains:
 * magic: magic number
 * s_stop_reason: s_stop_reason array
 * s_errors: s_errors array
 * devs.path: path in devs array

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/inject.c | 134 +++++++++++++++++++++++++++++++++++++++++++++++++-
 fsck/inject.h |   5 ++
 fsck/main.c   |   5 +-
 3 files changed, 142 insertions(+), 2 deletions(-)

diff --git a/fsck/inject.c b/fsck/inject.c
index f6fd346..21dae42 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -18,17 +18,42 @@ void inject_usage(void)
 	MSG(0, "[options]:\n");
 	MSG(0, "  -d debug level [default:0]\n");
 	MSG(0, "  -V print the version number and exit\n");
+	MSG(0, "  --mb <member name> which member is injected in a struct\n");
+	MSG(0, "  --val <new value> new value to set\n");
+	MSG(0, "  --str <new string> new string to set\n");
+	MSG(0, "  --idx <slot index> which slot is injected in an array\n");
+	MSG(0, "  --sb <0|1|2> --mb <name> [--idx <index>] --val/str <value/string> inject superblock\n");
 	MSG(0, "  --dry-run do not really inject\n");
 
 	exit(1);
 }
 
+static void inject_sb_usage(void)
+{
+	MSG(0, "inject.f2fs --sb <0|1|2> --mb <name> [--idx <index>] --val/str <value/string>\n");
+	MSG(0, "[sb]:\n");
+	MSG(0, "  0: auto select the first super block\n");
+	MSG(0, "  1: select the first super block\n");
+	MSG(0, "  2: select the second super block\n");
+	MSG(0, "[mb]:\n");
+	MSG(0, "  magic: inject magic number\n");
+	MSG(0, "  s_stop_reason: inject s_stop_reason array selected by --idx <index>\n");
+	MSG(0, "  s_errors: inject s_errors array selected by --idx <index>\n");
+	MSG(0, "  devs.path: inject path in devs array selected by --idx <index> specified by --str <string>\n");
+}
+
 int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 {
 	int o = 0;
-	const char *option_string = "d:V";
+	const char *pack[] = {"auto", "1", "2"};
+	const char *option_string = "d:Vh";
 	struct option long_opt[] = {
 		{"dry-run", no_argument, 0, 1},
+		{"mb", required_argument, 0, 2},
+		{"idx", required_argument, 0, 3},
+		{"val", required_argument, 0, 4},
+		{"str", required_argument, 0, 5},
+		{"sb", required_argument, 0, 6},
 		{0, 0, 0, 0}
 	};
 
@@ -39,6 +64,33 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			c.dry_run = 1;
 			MSG(0, "Info: Dry run\n");
 			break;
+		case 2:
+			opt->mb = optarg;
+			MSG(0, "Info: inject member %s\n", optarg);
+			break;
+		case 3:
+			opt->idx = atoi(optarg);
+			MSG(0, "Info: inject slot index %d\n", opt->idx);
+			break;
+		case 4:
+			opt->val = strtoll(optarg, NULL, 0);
+			if (opt->val == ULLONG_MAX || opt->val == LLONG_MIN)
+				return -ERANGE;
+			MSG(0, "Info: inject value %lld : 0x%llx\n", opt->val,
+			    (unsigned long long)opt->val);
+			break;
+		case 5:
+			opt->str = strdup(optarg);
+			if (!opt->str)
+				return -ENOMEM;
+			MSG(0, "Info: inject string %s\n", opt->str);
+			break;
+		case 6:
+			opt->sb = atoi(optarg);
+			if (opt->sb < 0 || opt->sb > 2)
+				return -ERANGE;
+			MSG(0, "Info: inject sb %s\n", pack[opt->sb]);
+			break;
 		case 'd':
 			if (optarg[0] == '-' || !is_digits(optarg))
 				return EWRONG_OPT;
@@ -48,7 +100,12 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 		case 'V':
 			show_version("inject.f2fs");
 			exit(0);
+		case 'h':
 		default:
+			if (opt->sb >= 0) {
+				inject_sb_usage();
+				exit(0);
+			}
 			return EUNKNOWN_OPT;
 		}
 	}
@@ -56,9 +113,84 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 	return 0;
 }
 
+static int inject_sb(struct f2fs_sb_info *sbi, struct inject_option *opt)
+{
+	struct f2fs_super_block *sb;
+	char *buf;
+	int ret;
+
+	buf = calloc(1, F2FS_BLKSIZE);
+	ASSERT(buf != NULL);
+
+	if (opt->sb == 0)
+		opt->sb = 1;
+
+	ret = dev_read_block(buf, opt->sb == 1 ? SB0_ADDR : SB1_ADDR);
+	ASSERT(ret >= 0);
+
+	sb = (struct f2fs_super_block *)(buf + F2FS_SUPER_OFFSET);
+
+	if (!strcmp(opt->mb, "magic")) {
+		MSG(0, "Info: inject magic of sb %d: 0x%x -> 0x%x\n",
+		    opt->sb, get_sb(magic), (u32)opt->val);
+		set_sb(magic, (u32)opt->val);
+	} else if (!strcmp(opt->mb, "s_stop_reason")) {
+		if (opt->idx >= MAX_STOP_REASON) {
+			ERR_MSG("invalid index %u of sb->s_stop_reason[]\n",
+				opt->idx);
+			ret = -EINVAL;
+			goto out;
+		}
+		MSG(0, "Info: inject s_stop_reason[%d] of sb %d: %d -> %d\n",
+		    opt->idx, opt->sb, sb->s_stop_reason[opt->idx],
+		    (u8)opt->val);
+		sb->s_stop_reason[opt->idx] = (u8)opt->val;
+	} else if (!strcmp(opt->mb, "s_errors")) {
+		if (opt->idx >= MAX_F2FS_ERRORS) {
+			ERR_MSG("invalid index %u of sb->s_errors[]\n",
+				opt->idx);
+			ret = -EINVAL;
+			goto out;
+		}
+		MSG(0, "Info: inject s_errors[%d] of sb %d: %x -> %x\n",
+		    opt->idx, opt->sb, sb->s_errors[opt->idx], (u8)opt->val);
+		sb->s_errors[opt->idx] = (u8)opt->val;
+	} else if (!strcmp(opt->mb, "devs.path")) {
+		if (opt->idx >= MAX_DEVICES) {
+			ERR_MSG("invalid index %u of sb->devs[]\n", opt->idx);
+			ret = -EINVAL;
+			goto out;
+		}
+		if (strlen(opt->str) >= MAX_PATH_LEN) {
+			ERR_MSG("invalid length of option str\n");
+			ret = -EINVAL;
+			goto out;
+		}
+		MSG(0, "Info: inject devs[%d].path of sb %d: %s -> %s\n",
+		    opt->idx, opt->sb, (char *)sb->devs[opt->idx].path, opt->str);
+		strcpy((char *)sb->devs[opt->idx].path, opt->str);
+	} else {
+		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
+		return -EINVAL;
+		goto out;
+	}
+
+	print_raw_sb_info(sb);
+	update_superblock(sb, SB_MASK((u32)opt->sb - 1));
+
+out:
+	free(buf);
+	free(opt->str);
+	return ret;
+}
+
 int do_inject(struct f2fs_sb_info *sbi)
 {
+	struct inject_option *opt = (struct inject_option *)c.private;
 	int ret = -EINVAL;
 
+	if (opt->sb >= 0)
+		ret = inject_sb(sbi, opt);
+
 	return ret;
 }
diff --git a/fsck/inject.h b/fsck/inject.h
index 62543c1..c7d0e33 100644
--- a/fsck/inject.h
+++ b/fsck/inject.h
@@ -20,6 +20,11 @@
 #include "fsck.h"
 
 struct inject_option {
+	const char *mb;		/* member name */
+	unsigned int idx;	/* slot index */
+	long long val;		/* new value */
+	char *str;		/* new string */
+	int sb;			/* which sb */
 };
 
 void inject_usage(void);
diff --git a/fsck/main.c b/fsck/main.c
index f093ca7..d6a7a47 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -817,7 +817,10 @@ void f2fs_parse_options(int argc, char *argv[])
 #endif /* WITH_LABEL */
 	} else if (!strcmp("inject.f2fs", prog)) {
 #ifdef WITH_INJECT
-		static struct inject_option inject_opt;
+		static struct inject_option inject_opt = {
+			.sb = -1,
+			.idx = -1,
+		};
 
 		err = inject_parse_options(argc, argv, &inject_opt);
 		if (err < 0) {
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
