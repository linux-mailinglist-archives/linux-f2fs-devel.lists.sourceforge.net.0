Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B6EB93BB49
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Jul 2024 05:37:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWpHt-0004vE-Se;
	Thu, 25 Jul 2024 03:37:06 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1sWpHr-0004uo-Uk
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jul 2024 03:37:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3THoyRStXGRf5m1o5eC7bH5lI8GGFZGjNTB0QJ94BOo=; b=jSfKkKsfrzJ7smC/dxA8aNnu/l
 AGLH2KM9rF9orKeiEo9lS997qDirQKEbfElVJpFxT4xqq+SWU3pWan3cnzHHnTj2NHgjBQbL1GfDa
 7tqjyu/JEVcdchSMsnjtJ3UUvjNqyByEQa9dBhkyE0hj00lwUOUdEbiawckMmxoJzzqQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3THoyRStXGRf5m1o5eC7bH5lI8GGFZGjNTB0QJ94BOo=; b=inQgSU9cf/npgAJa4KsK8UBQrT
 rDyDvlEkCRyD8r8GCS2/qwA+zbshWFAtWolomPEDB6SGmvLyEdbX/tS43mUYsxX32GsZfDWBGJ6y/
 wUtTwdcA/IObdFDvP3+1HYg/5Vl0AMHXd9fE+cGe9Q+0r9MD4dlMjbqLymbvP+GxuYKw=;
Received: from mail-tyzapc01on2070.outbound.protection.outlook.com
 ([40.107.117.70] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sWpHr-0006Di-PU for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Jul 2024 03:37:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zal4Sl45LV9xpVc1QU/ZYT8dQ3v/8eWixf56azycemR3e6mCOWXNa+hnn6RSfNYlZu2GhegAvfdnM5zYVC5V7JnC0xy4ugBg53beJj8KrXQafczZd+DDhZ67Kuf+y65CrjLnsOTqk5120h4Yrid/Q80foJ330UMhkps2klyeLdOx/Jm87A7mvY9G+OUjAHc340EZRhn1EWjSBuQa49vzAhqDzflxXcSIsCZuVvBSxRjbQhB11xS78E09cRbjg2WYRAEVP6zDfPkS3aPV4LuAhUzVs6TIfhCCrEpqwGuqqB5paIxHJUdYI4dkgd8FFytXDlKsuesLSBALHzFANLfO7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3THoyRStXGRf5m1o5eC7bH5lI8GGFZGjNTB0QJ94BOo=;
 b=s2f6dmTLjLEWT3qR1cSnbM8Jx04QELceuZOLdRr2FZWaQoy99i9lDNkt8WMdlN3O1R03gIIUYpIhCvJf44T8V1lc90ci80FQgtcf7Wwm2+jLJDUCQfVK6tBhStJ4gTv0CyfAQW0covG2NitUb6SHxPAnkZbMKXjKXy4Ij8mmROa87nMV8mLR21g5iu6cKp/HgCLLOwuad7aTTv0MlVmBAPEs2si87GvcEb/fAbQ//zEPI/3KvwbDQwVB5sYXW8re2YJMJ5+Yi6x+wx71oPTD19AXqEhPkBbzLWuGUtDfGROOC+ukDyXO8k+TZIlymvYSN8VzfQyZUc3ZZMOGfqekHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3THoyRStXGRf5m1o5eC7bH5lI8GGFZGjNTB0QJ94BOo=;
 b=IjZrqO5c64L6Dejmz6Y7dX+gHEhmWfWTnL5FBOLT+bN5DcQK4uB39+foE/vtbP6+j9weRCCNqSUQkUtMbNcStn+YmEUvHI9xKAn6lpwsSf+XcgZE8tS1iaBQIFvokCrA6IWkNh2dB6VSJkTYk5qNrsXzGPxrOEO5aylh75UFPWyeydzAfay69CbeBlyY632ID34CU11RyEAftIVQKeudz+VH5nonXhKK62qRfrEFdseoPoAcs0AOpXzR3efYioALlbQd89P1LqeEV4CATb182CwMmH8J3RKvNF8bWTE/VLYfrK6fUqtOU0GYIUMZbdZ8AkJV8a7/KLHJJ0PzKAVaNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by TYSPR06MB7300.apcprd06.prod.outlook.com (2603:1096:405:99::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Thu, 25 Jul
 2024 03:36:55 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%5]) with mapi id 15.20.7784.020; Thu, 25 Jul 2024
 03:36:55 +0000
To: chao@kernel.org
Date: Wed, 24 Jul 2024 21:51:19 -0600
Message-Id: <20240725035119.2843004-1-bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <fd64e14e-7a77-4fe4-9569-f7342c68953b@kernel.org>
References: <fd64e14e-7a77-4fe4-9569-f7342c68953b@kernel.org>
X-ClientProxiedBy: SGXP274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::15)
 To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|TYSPR06MB7300:EE_
X-MS-Office365-Filtering-Correlation-Id: c9a42052-3c26-420d-63fc-08dcac5b07a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eutEnM7k/Ps4qa6NUBoOgYsV98gxHtZLBMDD5kNJDnQXtcaYX/3yS5TW89xU?=
 =?us-ascii?Q?GGxUfQdWx1IbInPoyUBT0IYQ25CbuLluuKEUB6FAdj8++q/7PSSLgVHtBrEO?=
 =?us-ascii?Q?dXwnuAraRHx5IOOC3Ak2v2J0nyv1i/1Kw0ea4xoI9V2rugVjqc2uDvtOHJEe?=
 =?us-ascii?Q?fWBOfes7trYTP3G8hZJOPBz+tWYLGsqqQ7+9v5fd7xVlIoyOCo/BDxExuQ1h?=
 =?us-ascii?Q?g1rF2h1Z3xrGggwwcTGCRg7IWsXFNjfA+ci2mAtDpeZYxnT6O4DiMZ+lG5wP?=
 =?us-ascii?Q?ueSQZKXRraRhNeW6eB3gUPh+yOKbbYm8rKx6UkB7enlm3iae4oo5HXQq6mKJ?=
 =?us-ascii?Q?ocLqRbKA2rpt1/KppBchtEIKLSMNx8Lv8Do2NNIoOk/QUH+QWZIp4EjUpqDt?=
 =?us-ascii?Q?sYEHmDoWo/8sUghD97It+QN45Ovf4Rsq+X0Z5n9VWZ08kT9fXfeN79VTjJ+v?=
 =?us-ascii?Q?9sWUkv4ymsHo+FxUpW5nVoT4Up25ZSQYfehySvcv0asXolw4J630TCu/Xz8X?=
 =?us-ascii?Q?CfKjPe3bWBvWOsuQuMWEr5WQsUYMiJ9oDaRRrEZCaijxjOqKsbr5tH6yB/sV?=
 =?us-ascii?Q?hwmPWj60605/yqXXOQL9FxU0GbnsMxOxLL+qSar3bYzQw6Ae5yVHSgx90AFv?=
 =?us-ascii?Q?pcmHOsu7AK/9YkgpM/+uqMLgNnZbZNEu1DAtsTQLyAACHlvKi82rdNlL8/0M?=
 =?us-ascii?Q?kqN8No5WslArGSanyMhgsSzNiow+WLuleNhCa6X5yYh+VkxHq0hbhFzNr4hw?=
 =?us-ascii?Q?i8VwSxcER1Thho54HHcWWkUo2jl8LLHu/ZhyeHJVuCFA0IAVEPTGYsCi1gaE?=
 =?us-ascii?Q?RSr7DVx1Z9UPBu0zjXzElbAMWJt294twlr56b6awZFEh+bK8et1YUVCywQ1a?=
 =?us-ascii?Q?J/9RhnaqATQ7dPx2Y937Yy530/vkXr2Y9O+YI6S0laYeLwvpvF0VcScJGIie?=
 =?us-ascii?Q?UGWLjQc4WAWkTe03AKBpKDjsHtwFABm1/4brlns37FYj/76XM9QV0lDVK4dF?=
 =?us-ascii?Q?E1S/zfxBTB4/Hvf4SDxSnXvq/+i3HAHjUqOOghGQA0vkSCPCsb2y0vsud1gI?=
 =?us-ascii?Q?ZAJhvLyy2qZEwAEaqNOTYgTwhkoMx30klLkPE9khIKWVpBmdPXaxmcGad5S5?=
 =?us-ascii?Q?1FysNUtOXevgsRnUX9t71BOpjro12KLtDDNCdL+1tx7FZgf1QzOp6LPgNC7/?=
 =?us-ascii?Q?UWtrA788+NR6FPpZFxgk2ruWuaOoxBXbwGUE3AX0zvZkar7WuFMNva+C/Kt7?=
 =?us-ascii?Q?OqN2b6160mCGGiPbGtQn9naNegkrlYn6qRja3zSCa7J0lSqt/TgzZ9YbCfXv?=
 =?us-ascii?Q?4xRtR40j9W8XLUnKfy1cyC21HB21aU1aP+fFwFxXE/P+h8Mp4NCiKB3PeVko?=
 =?us-ascii?Q?BnkLlCg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?izXW3P7ezYEYxPyOyeeGj6cSYBaXxKp4bATWfRiwo50r3UAjpC+pYI2pXDiw?=
 =?us-ascii?Q?6L0BOqQ5zSqWLHydKpvS2T8lcCQhAdEPr+MJ7a4+3rBuCxwAvygAAUDv6exA?=
 =?us-ascii?Q?6Hb4Irhzs8rrh4xpo3BRJ9J22ezbB2EybMj5C+vdze8WMWQlVLURsJ73sa10?=
 =?us-ascii?Q?klggmAppSx/43/k2bwPojrFf6cq24qYRkj44UX7rGqw39KTBHRvipJuGK5jj?=
 =?us-ascii?Q?QY1cNwu98Q2go31w31UqigopcL2VZ2lBZE2vRjBT7q9iUECuos5ucq4ITyl+?=
 =?us-ascii?Q?y79U/jf0dU2aVLuRaYjDMhYZkZL6vrvT8+KBCuGPa1qxrHNnXScP6Pe37lg4?=
 =?us-ascii?Q?INWtTvIsA/0vvIIOEtCd7bAtmV0+OlXRmd+9gDtclpcFAbzug0gbPcINO1BE?=
 =?us-ascii?Q?YuqXruxrnqGHvjsyBrkEOkXdQdtkcu1VjEzKZpZ17xp2gn5YOVT8sMarEwHN?=
 =?us-ascii?Q?gZOfA8NZN1AdtKxriT6ghqG7OBODH57jLl1U4dVEMJQihQiw7/Ldb8F2fR9e?=
 =?us-ascii?Q?brF2vhY0yf7rfaXuCl3MJbIK5lqZ7el79bBboVZ9wYCLgM23cEfm4vspWNbD?=
 =?us-ascii?Q?tdI6iC0iKl4QKHM2ST0qHJvd76R3i6nc2vlbE2Qm+/xYDz2rb83byzWCmjpb?=
 =?us-ascii?Q?TeTCzwlFzSaYX2tt1hE5NPAq/JGn5HksvbALSmgVNOl0TV62xing70SKJZNf?=
 =?us-ascii?Q?CTHj8QO0glNSrPo/qHTcjXkNWbFgnCR+0cY4gSH6Q+mz8VAB3V9tDmvKXcAW?=
 =?us-ascii?Q?XSGhOIqZ9cUEtP4QRyqYca/Dd2y28gHXXjWOYguGEP8TAeMKTsMlSOilT44u?=
 =?us-ascii?Q?Hzz2512FQam6Kb2CgHMEWWSMGnr2eZX4S0+EZNUOaVw1JEjaCjcnpiYM+DHP?=
 =?us-ascii?Q?Lc3Rbq1xbdVDls30apw7PJHwZCJlQ3TJx0lBNAOdK7R4b2AUg6IcJb3rNXFr?=
 =?us-ascii?Q?SBl9+n5aLR79NWyorI0LWxUEjdSZJ50rMBVRCHN5fmOhDow3kOEC9pODpbcs?=
 =?us-ascii?Q?lkG5LR4HZUtMLsmLmKuTtMoEuJowtksyiALpn/S0tjmYUxuEWHFX5FGF797G?=
 =?us-ascii?Q?VxalOCMY75UUbLfqdQhR0JlpL1h2iJZSgnG8zwvtztbXbR3Y2KnzKQM6z6i/?=
 =?us-ascii?Q?3kVL7q2GA7mtQpnGg9IkC4lHKaevm5EOUpaSjXXvPZU4T9+cfZ48wGhPCLb7?=
 =?us-ascii?Q?AGE57mXoZTtt5enIbKpUjLpKBbda1IRupnJ/SfVvalC4cjM1ENsaA4Q4QhHR?=
 =?us-ascii?Q?0ZKisWs+a0xKwhYW8crHZRATnDvBuc7vG1DxhLTuhasfMxNWAMjm3cyUU03C?=
 =?us-ascii?Q?nDO38LBul/aQmYVl8Ix8Pa91bcwk47kCpKV2uEwRFIdL/fSBf/UM7oC0a6my?=
 =?us-ascii?Q?H7PrfOrCQ/6uh3yGnbgNjd2AYIAJjC1lVX1mWifxIjw4d455fiZzoUsO01W0?=
 =?us-ascii?Q?8JeUUn1DN+bbgRq0wYqtjJASVZZMEwMMHSe5z1TSaOqkzvJ5XPSXddSt3jG1?=
 =?us-ascii?Q?LmXrNyztAJ9AXLoNsYH0wYwLJGkkGprgM4Y4RjMThzT5NuXsynS6UBlH8Qen?=
 =?us-ascii?Q?n/J3r0lq1c2nhxTW2+71bYw24IAWWxxd9uAsXbdi?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9a42052-3c26-420d-63fc-08dcac5b07a0
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jul 2024 03:36:55.1416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wBFoH+NuWspfZh0EODHqgOGsdIDM4vNcy55WEPU+ZjmYXVnxamGhILpyTZEdcuPrWe24vaTMUM5WkSIXtoFF4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYSPR06MB7300
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jul 25, 2024 at 10:33:33AM +0800, Chao Yu wrote: >
 On 2024/7/24 18:35, Wu Bo wrote: > > The cp_ver of node footer is useful
 when analyzing data corruption > > issues. > > > > Signed-off-by: Wu [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [40.107.117.70 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.70 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.70 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.70 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sWpHr-0006Di-PU
Subject: Re: [f2fs-dev] [PATCH] dump.f2fs: add checkpoint version to dump_nat
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: wubo.oduw@gmail.com, jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 bo.wu@vivo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 25, 2024 at 10:33:33AM +0800, Chao Yu wrote:
> On 2024/7/24 18:35, Wu Bo wrote:
> > The cp_ver of node footer is useful when analyzing data corruption
> > issues.
> > 
> > Signed-off-by: Wu Bo <bo.wu@vivo.com>
> > ---
> >   fsck/dump.c | 33 ++++++++++++++++++---------------
> >   1 file changed, 18 insertions(+), 15 deletions(-)
> > 
> > diff --git a/fsck/dump.c b/fsck/dump.c
> > index 8d5613e..ca38101 100644
> > --- a/fsck/dump.c
> > +++ b/fsck/dump.c
> > @@ -21,7 +21,7 @@
> >   #endif
> >   #include <locale.h>
> > -#define BUF_SZ	80
> > +#define BUF_SZ	256
> 
> 128 is fine?

This buffer is located in the stack. Making it a little bigger shouldn't cause a
performance drop, right?
128 seems prone to overflow if additional information is added later.

> 
> >   /* current extent info */
> >   struct extent_info dump_extent;
> > @@ -38,6 +38,7 @@ void nat_dump(struct f2fs_sb_info *sbi, nid_t start_nat, nid_t end_nat)
> >   {
> >   	struct f2fs_nat_block *nat_block;
> >   	struct f2fs_node *node_block;
> > +	struct node_footer *footer;
> >   	nid_t nid;
> >   	pgoff_t block_addr;
> >   	char buf[BUF_SZ];
> > @@ -47,6 +48,7 @@ void nat_dump(struct f2fs_sb_info *sbi, nid_t start_nat, nid_t end_nat)
> >   	ASSERT(nat_block);
> >   	node_block = (struct f2fs_node *)calloc(F2FS_BLKSIZE, 1);
> >   	ASSERT(node_block);
> > +	footer = F2FS_NODE_FOOTER(node_block);
> >   	fd = open("dump_nat", O_CREAT|O_WRONLY|O_TRUNC, 0666);
> >   	ASSERT(fd >= 0);
> > @@ -54,6 +56,7 @@ void nat_dump(struct f2fs_sb_info *sbi, nid_t start_nat, nid_t end_nat)
> >   	for (nid = start_nat; nid < end_nat; nid++) {
> >   		struct f2fs_nat_entry raw_nat;
> >   		struct node_info ni;
> > +		int len;
> >   		if(nid == 0 || nid == F2FS_NODE_INO(sbi) ||
> >   					nid == F2FS_META_INO(sbi))
> >   			continue;
> > @@ -66,15 +69,15 @@ void nat_dump(struct f2fs_sb_info *sbi, nid_t start_nat, nid_t end_nat)
> >   			ret = dev_read_block(node_block, ni.blk_addr);
> >   			ASSERT(ret >= 0);
> >   			if (ni.blk_addr != 0x0) {
> > -				memset(buf, 0, BUF_SZ);
> > -				snprintf(buf, BUF_SZ,
> > +				len = snprintf(buf, BUF_SZ,
> >   					"nid:%5u\tino:%5u\toffset:%5u"
> > -					"\tblkaddr:%10u\tpack:%d\n",
> > +					"\tblkaddr:%10u\tpack:%d"
> > +					"\tcp_ver:0x%08x\n",
> >   					ni.nid, ni.ino,
> > -					le32_to_cpu(F2FS_NODE_FOOTER(node_block)->flag) >>
> > -						OFFSET_BIT_SHIFT,
> > -					ni.blk_addr, pack);
> > -				ret = write(fd, buf, strlen(buf));
> > +					le32_to_cpu(footer->flag) >> OFFSET_BIT_SHIFT,
> > +					ni.blk_addr, pack,
> > +					(uint32_t)le64_to_cpu(footer->cp_ver));
> 
> (uint64_t)le64_to_cpu(footer->cp_ver) ?

Is the upper 32 bits used for CRC?
I've noticed that the checkpoint version dumped is always 32 bits long.
To better compare with the current checkpoint, I only print the lower 32 bits here.

> 
> > +				ret = write(fd, buf, len);
> >   				ASSERT(ret >= 0);
> >   			}
> >   		} else {
> > @@ -87,15 +90,15 @@ void nat_dump(struct f2fs_sb_info *sbi, nid_t start_nat, nid_t end_nat)
> >   			ret = dev_read_block(node_block, ni.blk_addr);
> >   			ASSERT(ret >= 0);
> > -			memset(buf, 0, BUF_SZ);
> > -			snprintf(buf, BUF_SZ,
> > +			len = snprintf(buf, BUF_SZ,
> >   				"nid:%5u\tino:%5u\toffset:%5u"
> > -				"\tblkaddr:%10u\tpack:%d\n",
> > +				"\tblkaddr:%10u\tpack:%d"
> > +				"\tcp_ver:0x%08x\n",
> >   				ni.nid, ni.ino,
> > -				le32_to_cpu(F2FS_NODE_FOOTER(node_block)->flag) >>
> > -					OFFSET_BIT_SHIFT,
> > -				ni.blk_addr, pack);
> > -			ret = write(fd, buf, strlen(buf));
> > +				le32_to_cpu(footer->flag) >> OFFSET_BIT_SHIFT,
> > +				ni.blk_addr, pack,
> > +				(uint32_t)le64_to_cpu(footer->cp_ver));
> 
> Ditto,
> 
> Thanks,
> 
> > +			ret = write(fd, buf, len);
> >   			ASSERT(ret >= 0);
> >   		}
> >   	}
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
