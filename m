Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CA79B493B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 13:11:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5l4l-000413-A6;
	Tue, 29 Oct 2024 12:11:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1t5l4h-00040k-HE
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H84WeJqbreBhXjnNxlITs+xU2dd7bqKtTWq9ySsC2s8=; b=GwSxUOF98onoJfn2AACm7/+chQ
 6La/s4MG7fJxqCuEsxeROoY9/q7ws1EUNV1D3Xbpx9TCuY4awksNdzA2sf29DxwCfzpBTFlqSZFrt
 FYoFgZcKMee3AmILiseR3C8uw41eNa7VFmL9iKSh2XV7LX0N34mVUE5hivkp0xMQwmsg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H84WeJqbreBhXjnNxlITs+xU2dd7bqKtTWq9ySsC2s8=; b=H1nj4AXdqM2PcHZhF+lGMEM8Pp
 UM/3PU4TzwUzVo6sbSWFELmKpvvuPEPNH3TkbfZ514qiBciFvY5FMAGCH15mdt9yG/adqXeSocgUd
 WiQpZsuluvVhtSSzkll1sGF5TBiyiHcJA1OitND5HP8aLqPvlpGTaU3BSLJtmQ9DZ3Ps=;
Received: from mail-psaapc01on2084.outbound.protection.outlook.com
 ([40.107.255.84] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5l4g-0007Qb-Sy for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:11:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gdIdgRv8jXux2Pk5ONe4SoZJSHkREFsLQXjwAAZwqn/hznk8PbCuwQqgth2qQWlZKoRrGpJsUQe3PfPJVqXWr5TUBFd2ttdSiKoP6WPIIz2jmCujR4glYOItLz80HlrfnHwfCJOxn2Dc23PdclvYuq+OdA84uNDnwOO1LQQYwMwzee0q46z41xzeJxUAgj3nJ0a40U0I4bV0ce+iEoKWCQAqjfycloEfFo1f51iBXr+AsHfHHzP05wKlcoYWKiICBG4hrjoqrb3oErTzKX2aniEbqypSOM7LcRe+CSs7gCsewHUznYr5C/4nwHREtS3qZ9hrHdwg2Bw4zIqPFFoo4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H84WeJqbreBhXjnNxlITs+xU2dd7bqKtTWq9ySsC2s8=;
 b=sOELNzRa71rXzlrF3bsLZtqRbYOe9vJQJRjcebc1ENDXNg+8paE5aDxEklHMKVnWkWv2Ny4kw/9t9e/kvm1wjudsUVmB/fLzba8lwmYoYsHoDn30GbwwlGN3mS5Jae0TXFIxqLCSe5nDW9ocWxuOTa1qXwGcfR+AmcCiy90FJzeFYR81DsmjvblK9KvzdROZ2+kkRMdU0kp/LIpe25yybQFW4GkdWu3HocMcN6iqOE2Bpb6t1ZwioFciiwgD6aEqeXiajgafHLfNLSgdnO5koQu9t31pQ5oX/q36ZkV1LSl3XVqffuMRklR/RgRQ1XqnxS7lCfG8HicRJWOsoKO5iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H84WeJqbreBhXjnNxlITs+xU2dd7bqKtTWq9ySsC2s8=;
 b=f7UZ/kX0hDzCuKka87txeyoHPzYj8056NYQEUyh3r3P6zbmOFt/K1lYF2QkI23Ut4nXVbivYWC+eNS9cMPm7yy13yDxD3FQHjtcDgmceAVVCv+LvrvNdSGTAgN3kQEDgUiGENV2NHxAgXyWo2qS7wZupB0XEvZCBENaP8cqb8Qk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEZPR02MB7326.apcprd02.prod.outlook.com (2603:1096:101:1f4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 12:11:33 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 12:11:33 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 29 Oct 2024 20:09:37 +0800
Message-Id: <20241029120956.4186731-6-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241029120956.4186731-1-shengyong@oppo.com>
References: <20241029120956.4186731-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEZPR02MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a01516b-8f3a-4e47-b64d-08dcf812d42f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Cm7C8Ggn5xtD+3SMhmqqKCSA7Ef1NZBCwk04RDyHFxjbfA+vSNHhOKoltBvD?=
 =?us-ascii?Q?N9BtBX4uHgnQwF7QAv9lUFETzWnqG8Y0e6zH1t8rOyf9sV5kLGPO3jjCCGBz?=
 =?us-ascii?Q?sQ9ofJiRt0FWZkzF7vhZULoYvoxxgRjea8NGF7UrRw3mH77YvWJlbPfHcQ5O?=
 =?us-ascii?Q?TvTvuqr3iOFy7Hs1SnduG9esLmhBk4ONzp8GMx9y2qVmWLp1OJbojUJODrkj?=
 =?us-ascii?Q?XMsKVEffw4LPqDRqh814Cf2hc7IawN5XvQlIp9XRKD2fwc7FSV2BF8HG+gmp?=
 =?us-ascii?Q?a2p9iDakIxJfqHHdneHhDWZDi7aK00BdvDMjImfaeh8ckv2g/tKT4Y38uMDU?=
 =?us-ascii?Q?w+w42p07n5k9teYZ/A7VFsdnp8jm6uI+jntExsn4oF5leU9DkHLlZCBcDcvp?=
 =?us-ascii?Q?mfNaM9Pe2hM4XPR8WdpbGQQLs3riPJZzNJiO27UEueL90B3/O6YBNRaKajJW?=
 =?us-ascii?Q?vlxFgMcZg7+lO2n5Hhf5fWS01DfdItWRZ2674ihEhcBbh1lou+uSCqnnTXGN?=
 =?us-ascii?Q?cfLGEZQZRhjErwtNIH/hQ+janx8BejhhIMf7hYcujt0e+h2KZTLmBRuWitAT?=
 =?us-ascii?Q?Pi9jeDlNdXZefYZCaH2BvwB9amhi0YFM2f9UuMRwcwZPiib/G68aC/W09vd7?=
 =?us-ascii?Q?dawE3RFx0fxrR6DIb8uVZbuXqSCTNKLV1xMGY63LLravIDHvN6GVZY0qEy/2?=
 =?us-ascii?Q?IbwDnsPqJifY9xrVO87jKEFpRBqbngGp+Hk8N+JUPtaE4B7rmvausVf8utrO?=
 =?us-ascii?Q?MjXXAkHBwf8FvXGvbqL5ZgSbSv+TwDW4oOe7+BgSXNCxm2Trlp6CyGh33Inm?=
 =?us-ascii?Q?pxlPtMvz+gpTEsPHZBXAf5HcQiZC8Ysw4Gd2HpDz6CVEZ8FvWQIJinARrcjm?=
 =?us-ascii?Q?oZMOISL/eH0M5y+0U97J9JALe9+AxpNQeveTiqgV0Ry9AJCL9dlx/Ut6pj6O?=
 =?us-ascii?Q?MsLyFhYlqsFMqaQWRyVw1VMIntijmkIpYvwdKwqwFew2o5THv1WklhX6lOPg?=
 =?us-ascii?Q?ULoc+RxYaB4YSSYug8PdaBu7QSkK/waSDQNeIrotk4DZxNPgF6TCuI98V35l?=
 =?us-ascii?Q?4IgUMibdcekiol9JxtXcW1DM9TFwEAPLXjRuTzfigWE7sIr20mU81q6OpUwK?=
 =?us-ascii?Q?ZDk7uDAaTRZZquXi84nUH0C5/bL2+eIyUKhBZ1joDhOJMreL604JYljNoeaO?=
 =?us-ascii?Q?h3haGPq0tMwXR2o6lFJFHlzqrgonneYXfGZLfkVpjvoE4hzCFoYoyYVSHCAO?=
 =?us-ascii?Q?Jy27J9UhD64F4G+Ipoa9WlLxPo5heXJ1TT0p6ufaTSc8kHKDfSqYfWKBwENu?=
 =?us-ascii?Q?KdfuBSLewyGHp+sVqkOmJVLt7ue14kL6ACZ+P5URMxLxg+6dHgAeVhCX2dKK?=
 =?us-ascii?Q?uIxs6ww=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BENNALoVD9RYZirGzzomBgdYXhEBjd7F6oHsFjVyo/ayL1k3UCfVcv09PJ3g?=
 =?us-ascii?Q?rnpm1iHkgG2Y7Y+EHuNLGNOqRgwksWV8kr7BBHWpcU1ros/sXSz46sACdd4v?=
 =?us-ascii?Q?I2FS+Nnaz56nJoDLEnvzxyBtW/Ye/2P2K4LaPh4Bg2uABHoy0kje1QKb/3R/?=
 =?us-ascii?Q?ZsUhtwWz/46K+8AsVLRHbG1TazQx3xdOgp191hg/lFOjIXNEKrR1jFyYTXxs?=
 =?us-ascii?Q?2Hna2FOBxS5I/xpfyq41H5rv28SBl8SVjPCpksGqsMeWG//zOcoa9pVYlxP6?=
 =?us-ascii?Q?zu7a884rjMHZx6iHRpXBUP5eRQuntHGYNp3vvaWyIjD47yGaXOpTWlJxaFaz?=
 =?us-ascii?Q?9mrBWEr4ez1Rl5krKgwx29jh4jpCnud9tfxt1sGmOD0EWrL0lEEUwrCaAYdo?=
 =?us-ascii?Q?BqrBm5egDIV4IfjuPpnxg7INiKhsPIbqcUhJ4Wlm+sqrZ3sjnOfAR6FEBGId?=
 =?us-ascii?Q?kw/gA/uW2lTQw32mQY0wfp2MUWRMnABNl7vdKn7eByOy6SxKRe3kGl2sJIp8?=
 =?us-ascii?Q?5+q9ns0EEyGE7mOdD3gN9KEWufEYRZpR5e+uAQJiRMdoLQGbCrLbvbl+G0V/?=
 =?us-ascii?Q?+DdZRe1AmRNLGrHQyYDjYy9cxwXtpOUhJ+LNKKqtX+EbQnrvXs7kPOz1TwpX?=
 =?us-ascii?Q?xLEEg1y0lPr1hR21mbNdlnyGkT1Tgl2IhZdBwg2SJi/zgKy070tGeVLXyHiX?=
 =?us-ascii?Q?h6u3Zuhv5z5KxwRI2GO61lGsAfzAmVPvV1JpkZhHh/Kp+y/+cSiTcgLkdU/e?=
 =?us-ascii?Q?FC+AztAo6V2+tKADxPj7f8ddp62w4SlR46ylNlnIjfUHRliPzJw1owWSa6gR?=
 =?us-ascii?Q?Ho/VfjV307m6EtY7rn336JTZeh8vVud2CRpZ+ps7oyvT7MI0DKggCzW7UYG3?=
 =?us-ascii?Q?HhpovLAH/6WQwr0QRWaDxCZPhYdVik9U+t/yuoPF//uhvWSxwfDKBGp0DSsX?=
 =?us-ascii?Q?WP87jnGE9aaXK/2+vlg3gBS6dsHQPzWMZxxhP0eynSzwzak+1B2letFIAL67?=
 =?us-ascii?Q?xLBH6p4wl9hDX8xvG9IQWN+P+EUKqhbLhaUVTOs5wZUL7ec3VxRJgFt34ANP?=
 =?us-ascii?Q?AwEcbLxpZEsJn7AqTzrgbtpr5si8rGxQ3/p31jfpxl47/SSNLXqbjhHnpPPa?=
 =?us-ascii?Q?n5TEBY+VhRPGKEx/9DinSOjez7LeJ7FpnqFrUtzZPn9X7K449u6EOSxKy5q+?=
 =?us-ascii?Q?PoXgNwb7S3NHt/v+mzLtLkX6dNw27b0nycfHJDARiFd5CSy6rntBO1z7UI1C?=
 =?us-ascii?Q?IjzRUtpoT4X9Cly/QTHEAuM4HuAVGmTnxD+cgNZYxcbS2brM1EOqTH+pNyX7?=
 =?us-ascii?Q?+XdG44ZKSQIPLOzOoTlxyz/MT/2dRN3Wuz1gBMx2vPfgNCUIR9loxryb4keI?=
 =?us-ascii?Q?qymJUC6Sw6GwfeJGowW1R2iXRSZgpbkrNHxhW1j2vAsR2n/lkeS/SAIdZ/pj?=
 =?us-ascii?Q?Xhb1JANByKcf6xi3+kvVdXSLTOyXsqNOaRPE6rLa2hGRZWXgAvwk8TY0ys4C?=
 =?us-ascii?Q?c3xRQ1Y7vbw/pQZ7GnQMqYa8taUDgj9n/9RWEybghSBULt5qBgbq03wGZFNi?=
 =?us-ascii?Q?QY5aBZ8rVgUMwh6VXAx6DAyjEzzVKnCLVVm4Qfry?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a01516b-8f3a-4e47-b64d-08dcf812d42f
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 12:11:33.4526 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pO0gQq1PFLlb48AXBff/U69Ua9coCk+oKtdXbSzDPzUvMcZc3tkJh1F0hK2IaI3ko3X/1NMa99+lVpVHRWZ8DA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB7326
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch adds a new member `feature' in inject_sb to inject
 features. Signed-off-by: Sheng Yong <shengyong@oppo.com> --- fsck/inject.c
 | 5 +++++ man/inject.f2fs.8 | 3 +++ 2 files changed, 8 insertions(+) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.84 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.84 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1t5l4g-0007Qb-Sy
Subject: [f2fs-dev] [RFC PATCH 05/24] inject.f2fs: add member `feature' in
 inject_sb
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

This patch adds a new member `feature' in inject_sb to inject features.

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/inject.c     | 5 +++++
 man/inject.f2fs.8 | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/fsck/inject.c b/fsck/inject.c
index c3e68eb35246..c997334ec57d 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -121,6 +121,7 @@ static void inject_sb_usage(void)
 	MSG(0, "  magic: inject magic number\n");
 	MSG(0, "  s_stop_reason: inject s_stop_reason array selected by --idx <index>\n");
 	MSG(0, "  s_errors: inject s_errors array selected by --idx <index>\n");
+	MSG(0, "  feature: inject feature\n");
 	MSG(0, "  devs.path: inject path in devs array selected by --idx <index> specified by --str <string>\n");
 }
 
@@ -412,6 +413,10 @@ static int inject_sb(struct f2fs_sb_info *sbi, struct inject_option *opt)
 		MSG(0, "Info: inject s_errors[%d] of sb %d: %x -> %x\n",
 		    opt->idx, opt->sb, sb->s_errors[opt->idx], (u8)opt->val);
 		sb->s_errors[opt->idx] = (u8)opt->val;
+	} else if (!strcmp(opt->mb, "feature")) {
+		MSG(0, "Info: inject feature of sb %d: 0x%x -> 0x%x\n",
+		    opt->sb, get_sb(feature), (u32)opt->val);
+		set_sb(feature, (u32)opt->val);
 	} else if (!strcmp(opt->mb, "devs.path")) {
 		if (opt->idx >= MAX_DEVICES) {
 			ERR_MSG("invalid index %u of sb->devs[]\n", opt->idx);
diff --git a/man/inject.f2fs.8 b/man/inject.f2fs.8
index 6cf66bcbf2a3..5196aa46699a 100644
--- a/man/inject.f2fs.8
+++ b/man/inject.f2fs.8
@@ -53,6 +53,9 @@ s_stop_reason array.
 .BI s_errors
 s_errors array.
 .TP
+.BI feature
+feature.
+.TP
 .BI devs.path
 path in devs array.
 .RE
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
