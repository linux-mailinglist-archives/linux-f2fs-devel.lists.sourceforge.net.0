Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AAA291608A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Jun 2024 09:59:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sM15D-00035n-25;
	Tue, 25 Jun 2024 07:59:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sM15B-00035h-KE
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jun 2024 07:59:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iGQUlicVmsetEsTvfJvbGAI9C5xIVPocsnR+TYy2Lbs=; b=es3WNX2aLIYsF5UkLUU+/b7IN3
 oVeWO5I2mpKp1725AP0g9hVO/u1ebMNrhWOUhxNElSD9Eg3GhZLeXO6mnQ2RsfiszKY/OhEN3OKU6
 9DL+JQjm0zk0dpz1m6ooxeaO9tl/vW//IGezRRPRHjY72BRHS65837P0BrsXZe7eLXGA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iGQUlicVmsetEsTvfJvbGAI9C5xIVPocsnR+TYy2Lbs=; b=C
 ERbA9dWWS4G1AZnbj0sF4ux31jhHf0iPwjUAvGlho/kMMwB+6W3LYoHzCQP3BMQB1WUJQ2R4rI3x0
 yudHwMOTLaFS+mGkqZYUVVc6pqEiaVTUvWauMIQxR+/Z4Em1IlC41JEnabtuDFKqoAzeXBH4cVDa9
 PUjkNwC8KgIshn7Y=;
Received: from mail-psaapc01on2065.outbound.protection.outlook.com
 ([40.107.255.65] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sM15C-0006o6-OV for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Jun 2024 07:59:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XtfsugfOt/duZjw2WQXSR2oO3K7unNv/ghCXhUQnPpXb6u6YLBmPLhJ/wyl2OA6m5eIcwlCNnua560vrf3DGflyGIC0KTknoIedffGJv1hFdZg5UOePekEb9DEFDqQw9CCt1pepeBq5YbhoZ+nE6OGAHZ0eMS5NiHKOrO2lWqQMTfz88WEeAkrDKrGBz4Skm9JvY+kZh3O0vsK8ecD+FjDR9dTNpR4s4aHZp7gl69HURtpA6kFj9KLsExDscQO/dAWJVxVsAqpE4g6c3a0nwungybTMaS1HZvBvwRT9SE8YtstGwdBJyH+zJmmzJnKa3PNRFAH2KG10ID+4Zj/SLww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iGQUlicVmsetEsTvfJvbGAI9C5xIVPocsnR+TYy2Lbs=;
 b=WgMmjPmjDhvLd63Dyn2r/TrUyTwQAYbR55C3ffS27Hgg9HOXSDNlJ9kP6sLiDspXY2xKVablVeiXKFSOs+6PmDrrp7yax3cz7+7UoZQijoKLFLQSvaOfJItXCIMTr21gwieZz73tSug82fOGeHFK2VPWkIfBUr/lf3bsA7eHg32zWe9PW+XMK7fBv7dNcoETPkOGqVH6EZQF3QjiOv99UCNloaXZ4sllEumDMIVb1zjnjNSOte1MpDz/YZ2ufBFjpRtF9TOPfeplXq5McKNAn/ur/TmhXSgvf59Op2umvIc1e4wywuVvlTFrYUJtLDMxsAtVWq8FzOtKK21Id37XVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iGQUlicVmsetEsTvfJvbGAI9C5xIVPocsnR+TYy2Lbs=;
 b=RsYMDzE/D4JFzkf0Zu8nfJV2VBHzetY+YnpfTr6sYtGpgv8Ycq0v3upFyvl9zXWENNA4lX5cnD5jHCMDOql/8PtmbgXsPdKwEwgRnM9CbdWU38NUFaal2nTdzWquULAl8V0l0dDCVvd6Fuvpj8j3A0yk4vPY/CFgGa+0zh/MnSk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB6002.apcprd02.prod.outlook.com (2603:1096:4:1e9::6) by
 SEZPR02MB7259.apcprd02.prod.outlook.com (2603:1096:101:1ed::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7698.26; Tue, 25 Jun 2024 07:59:08 +0000
Received: from SI2PR02MB6002.apcprd02.prod.outlook.com
 ([fe80::430e:3ab6:1ee6:968d]) by SI2PR02MB6002.apcprd02.prod.outlook.com
 ([fe80::430e:3ab6:1ee6:968d%3]) with mapi id 15.20.7698.025; Tue, 25 Jun 2024
 07:59:08 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 25 Jun 2024 15:58:39 +0800
Message-Id: <20240625075839.3750112-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: SI1PR02CA0002.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::16) To SI2PR02MB6002.apcprd02.prod.outlook.com
 (2603:1096:4:1e9::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB6002:EE_|SEZPR02MB7259:EE_
X-MS-Office365-Filtering-Correlation-Id: b15da480-336e-4437-aef8-08dc94ecb0dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|1800799021|366013|376011|52116011|38350700011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QzFe4L01/Wf2GgAoEZObpQkvNYvvJOlgmHR1D3IvE2/zyY6v0dxBOM8H6y0m?=
 =?us-ascii?Q?QfbNmVNa0kSJ4cE78XjNtAmuXkMv3yZSqiZbskWgo4ctpn/3dZA4GPCZq91D?=
 =?us-ascii?Q?egfsAQLaG9TETdjY+P615+uM4v2KFQFR1lwl1V9wy9SXeET5RlEuhJm3hFti?=
 =?us-ascii?Q?sSKk/8GrqhPvIY0zkHqkKx2CrSOpIzf9QNnzUuUnxhUQh///nKdcGURsVBWa?=
 =?us-ascii?Q?eAhfom2vLptYvlA8+g/WClSxgdx5NGxlIKA1pjFKsPVBoco0A370x9bn3qft?=
 =?us-ascii?Q?Ftm/PrWHZP3ezmwVrJWmNGtMoImx7LlN4LwsJh8l3qxlq9WXTirMhSltqwGU?=
 =?us-ascii?Q?XsW92aFSbPqygiSxac0GoTgYO5mtOD/KwLc7sRhma/Tj9UByfcjwnmN/oMXe?=
 =?us-ascii?Q?isAfM92xZrU1v9RYmfh8lp0cqpLXdKfYv4/FGgVEfBMeZ9B9cGgpBh+mObvz?=
 =?us-ascii?Q?KLShXxmh9HJlxcqTsO6ZNLHhFcYFIfq3/sEH0SEGG52UA50B8GUPUa4pneR0?=
 =?us-ascii?Q?UtoT6L9bIIN4dViO46OSIY4XRzkcwfYiolOtWrS3ycsXRIieIrc1zZb7tJos?=
 =?us-ascii?Q?Pixl3NaiNWELUWvz9wwRkNK3vx7bQ3XM5FLJDLhcrnw3dDOTZhZQ130PXKqM?=
 =?us-ascii?Q?HYpxA+2kdumFp8SKhpv8NaG41mTzKZBi3up/XvDubJJDMmPGaawB6l9498s4?=
 =?us-ascii?Q?X4btx9n1thtCoUze43++vKOCFJpEJd57K6LVtzxLH7QtORDBVEOUmhcZqRU1?=
 =?us-ascii?Q?C2YYMHupIe1G/N89g8m5A8ClGOyY87+ZRfpXRyRebqmG3tm/cb1HmqZUDwgm?=
 =?us-ascii?Q?gZMxMMgLRY9usKXuoUhrKydkfilVQF5MjZ7djebdy7Gq2vI61zQ6U/POp/M0?=
 =?us-ascii?Q?DnO514lDvDvPVM/36gItu3THT76l54XNK5nApmqKlc4RfwnKH87vaVK/aP/e?=
 =?us-ascii?Q?dOdIGInWdkjG7dP0b5nFcD7IZND5+DgRMm4mGvUqwJokT0MwsyctFvMxOrlE?=
 =?us-ascii?Q?hKWABhdx78cAt3Ben8mzMMtlLwajwnk8ayTnyGIOEBW0IGOnvp7vJufIKtJk?=
 =?us-ascii?Q?hB0WmY83k/x9MKuAJHMZSceZKcb5rq6keNGRvXinq3gwaW58KMgTqKYL8tYF?=
 =?us-ascii?Q?k+sfy1IXIqPpNLHpshH7Vp/EIFo+BO1qpen7UG1zyNEXZBzery6Nv2IMHfrG?=
 =?us-ascii?Q?rN9lu15fdp4RB+2dLjU5im8MirtsSRZQv53wGoWL4YyR5t+c48xmgPKPKZUz?=
 =?us-ascii?Q?ueLHtz0RcRFOjJP4EldqegBclPtV+RsnMy+5u+Hzs94wqDf8S+A1yZxkZyco?=
 =?us-ascii?Q?si4XxYEmoCepY7Eq/Jw8oGUZFBwQYQNu6Kvay4x7CNPsvHcZBQHEtqykEGyi?=
 =?us-ascii?Q?LCB6xqg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB6002.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011)(52116011)(38350700011); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/4SFl5Z8xtNeWLP/Zwlhy1QXVWPmkrMTQNN1XYm+le9gqca41mr+xa9vV1Y/?=
 =?us-ascii?Q?tTYVtmUfmB+c0fUg6Dq5ANCwkZNQAir8Zn4NLtSmMwmfSWaeaEjgkEuaG7zy?=
 =?us-ascii?Q?zdxMpobg0iMhoQZOJ63bsJ2WCv8AeF25pjvaaWWxyNbCA+v4e5jxRQ5Q6XJf?=
 =?us-ascii?Q?Z3GUU0S4272LuRYVaucxbxwCEDz2u0ZiokRT6yvITVyUpJjYZVFsfduezJl8?=
 =?us-ascii?Q?7ep8pfXTfuVLGICGrowMKZX6QdpCBQxdoBflJnScn8Hyx4AlRbu6/7M5DRgv?=
 =?us-ascii?Q?MqSThcCq4WwazI5lD9SqMjHAj0qxNunZfTB9UVGw1VrR5PXmRLaVA9D19skh?=
 =?us-ascii?Q?+IM63EBLTPO/HqeplS2eMhuOPW/dMEGXOhQRvKQzKVOY2tdoTpHIr78ThUXP?=
 =?us-ascii?Q?vuXvcM/1BebCcx7cwCelihktwnKsquanYLaUTswKZRjtmyS7//K1ZphVBxWS?=
 =?us-ascii?Q?FU2kKX0B+m/dW9H/HKWEW2/8WTfNkvZdUHXpi13MT9ug/BX+59rcZbgf3rgA?=
 =?us-ascii?Q?UEtZrlYRvSEC8gHQhQH1BBjVwInqvtmlnGYk1F96eIb/3RSZXsmckNix6EXH?=
 =?us-ascii?Q?+ePCvf7fY3wVk4e4wnumn1JGF5phxKz292xDzGZm7IHZi8xcl1l9atyFk7If?=
 =?us-ascii?Q?ofVMku8AUPDEzuDSy73S4pK7Ch1/gHb4VBrUgPmXfr6ifcA32aba1ebGoTuT?=
 =?us-ascii?Q?P04A5eIc60S7Nw3tfaq+3pdwX2LzvxVID2Yvcbpt7eTk6Ef4n14g5KLqDL5v?=
 =?us-ascii?Q?4Gxx1pKDMilY2KsKtnoZylGzHG8FKQGgUK6LJGSL6U8msU4HoEtWneusPvdP?=
 =?us-ascii?Q?dwJP5OEzmKu+BMiKm/0clD4v8RF6K+8d2+PbJHuONLw2dceN8KohUjxBEgE4?=
 =?us-ascii?Q?n/wId18+L2mYZj5QTNC09/VTC+3XVeirZLNnkkoT9YROoNfgjZ0/ketesBQp?=
 =?us-ascii?Q?Srj+PeGNu5L0xbCqQW/vv2/+ko//9UfKtIoGmC3YUKOV7GjtTErnwbRzHLqz?=
 =?us-ascii?Q?ZhZlZsTAiaYUOukR01iFx1GDqphKz7e2p8I0BeDRNygRMU+mfJXcnaiw+s55?=
 =?us-ascii?Q?KBzclyV+csXCsWd4XQIOd0iDIZG88wiYLF+socXvRuGNY6CB6aLJRa2s2QFo?=
 =?us-ascii?Q?KddqThU+uiPeYZEMJeKxH49+92pr/hhKnxK+QbshXDCifvo0OYHCYpmvVW8z?=
 =?us-ascii?Q?gZORQ5YI72CLwUMxmySZxyYfDPAWFdYfNYHKCe2k08zE5/zGXQNb3zYdCPnI?=
 =?us-ascii?Q?rFEZvvukkwzNrZ0ggtHkkIF3Ml5+gDz5m5lsGCabGC1cz3NqZVmdJQTB0rZz?=
 =?us-ascii?Q?8C2YQqzCvTV7pzr462R6GFBFKWaFTphiBheVBJse6k7BGs0uX48b9dztHctL?=
 =?us-ascii?Q?bmTRZzTqQj+q4P2JSiXS417ENp5NI5FNfKzSoDYVpwqXJ2DhhSUT0k6Qidm7?=
 =?us-ascii?Q?4GO2gZxTILDjuZ0nMBigwMORBcTW0oQb6pin7yMHMtTDdoOzuh82jM3DE6LO?=
 =?us-ascii?Q?cmgUGUoFGxjztAobZoY33CQanO8gj4Ld8EgqQXD2kRN8stlwf02PxNnwyg2i?=
 =?us-ascii?Q?t0keBlzA6e1wxlGI1fNIpmNkJ7bQsfHQYNUuEgcE?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b15da480-336e-4437-aef8-08dc94ecb0dc
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB6002.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2024 07:59:08.1890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5TM/mfV9DH0EGGtg2WLCXQ1a1CPcJucuHmQJ4IOuYmd1DMR/nvTIvLqISR+uBCPgeqdRNqPOGMw0A5C+jy0ANw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB7259
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If mode=fragment:xxx is enabled in large section mode, segno
 returned by __get_next_segno() may located in new section with different
 type, which messes up ssa type. This could be reproduced by the fo [...] 
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
 [40.107.255.65 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.255.65 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.65 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1sM15C-0006o6-OV
Subject: [f2fs-dev] [PATCH] f2fs: only fragment segment in the same section
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

If mode=fragment:xxx is enabled in large section mode, segno returned by
__get_next_segno() may located in new section with different type, which
messes up ssa type. This could be reproduced by the following steps:

  dd if=/dev/zero of=test.img bs=1M count=10240
  mkfs.f2fs -s 128 test.img
  mount -t f2fs test.img /mnt -o mode=fragment:block
  echo 1 > /sys/fs/f2fs/loop0/max_fragment_chunk
  echo 512 > /sys/fs/f2fs/loop0/max_fragment_hole
  dd if=/dev/zero of=/mnt/testfile bs=4K count=100
  umount /mnt

  F2FS-fs (loop0): Inconsistent segment (4377) type [0, 1] in SSA and SIT

In order to allow simulate segment fragmentation in large section mode,
this patch limits the random range within the same section.

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fs/f2fs/segment.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a0ce3d080f80a..55d474f5c2103 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2782,10 +2782,21 @@ static unsigned int __get_next_segno(struct f2fs_sb_info *sbi, int type)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
 	unsigned short seg_type = curseg->seg_type;
+	unsigned int hint;
 
 	sanity_check_seg_type(sbi, seg_type);
-	if (f2fs_need_rand_seg(sbi))
-		return get_random_u32_below(MAIN_SECS(sbi) * SEGS_PER_SEC(sbi));
+	if (f2fs_need_rand_seg(sbi)) {
+		if (__is_large_section(sbi)) {
+			hint = GET_SEC_FROM_SEG(sbi, curseg->segno);
+			if (GET_SEC_FROM_SEG(sbi, curseg->segno + 1) != hint)
+				return curseg->segno;
+			return get_random_u32_inclusive(curseg->segno + 1,
+					GET_SEG_FROM_SEC(sbi, hint + 1) - 1);
+		} else {
+			return get_random_u32_below(MAIN_SECS(sbi) *
+						SEGS_PER_SEC(sbi));
+		}
+	}
 
 	if (__is_large_section(sbi))
 		return curseg->segno;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
