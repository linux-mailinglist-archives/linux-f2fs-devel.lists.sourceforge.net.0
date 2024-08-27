Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49DE69600CD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Aug 2024 07:06:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sioP0-0000bl-R4;
	Tue, 27 Aug 2024 05:05:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <oliver.sang@intel.com>) id 1sioOz-0000bV-9m
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Aug 2024 05:05:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Message-ID:Subject:CC:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WgVdGsRswO3rdJA9O7HvIv7s4EbYU+SvwYuEuk/GtMU=; b=BjU/QMeZHABS+ePWoqDProp5JI
 JrZ5zhvYIj6KX8bknNiCDQi3LGSvMJWl9yv5sDEteGZ5WLuklnThD2w1ckevpTKQGgteyTLbwGepU
 dRvXBZnpTDxQ/q43dMFKoDL51CZIARk9vTA34vtzYH9/k10wF8Z/DfrHmFlMd4hOqijM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Message-ID:Subject:CC:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WgVdGsRswO3rdJA9O7HvIv7s4EbYU+SvwYuEuk/GtMU=; b=B
 x1kviVAl21r8yIwBU7rXNhipqfvpCL92TnKWSscbLjmvQTNvO5VkOo8eIc7ktVrqFpqbFRhDSefpp
 jzN+pYY30ujawZtHQKTMEWnu20pFgWkKE/h/Z8KwTqYDLDcDF78E4AMdYnGRZ/Qbc641tLP/QMjBx
 FCFUQPl6Sx/ay9mo=;
Received: from mgamail.intel.com ([192.198.163.7])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sioOx-0000z0-FQ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Aug 2024 05:05:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724735155; x=1756271155;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=/ReXcGw+880NSciLX17cOJYd47j4UnsDj80TwhYZmwM=;
 b=IV2egWK7rx0+/lRGJI3E/vo1XBi2h3SHy6qRZY/0n/t8zgjzGk1yY22g
 5TPCY54zoDWUxPl8BTymrq6sRVsZhWzmlkIK+XUVaKhnIkpLhCr7+cNgs
 lB3j8eQNW9SJFZZ5GGRyNgIFSXqLwMfEsmp1KI4wo/afiEEjETbkEE4Sp
 L1ai2zTDpKGIZv04tt6pPQlWYJPo7MLgkXrl1xDjpJbtR3sDq71yxbKhx
 AswgleXTnxJ7FRaf+KFzJIW3MDaksJ1/MABxK7JMP7/xto7HkulFCzUbd
 XYuGr35lQoHRrzrDVbPH4WSgvpTolT9cAsU5d16NGxTT5DmN5ZN6LChJw g==;
X-CSE-ConnectionGUID: QWZgsLOlR56CvkzvaVFEpQ==
X-CSE-MsgGUID: n23YJx3nSbiz9ia4DmWNCA==
X-IronPort-AV: E=McAfee;i="6700,10204,11176"; a="48577876"
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="48577876"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2024 22:05:50 -0700
X-CSE-ConnectionGUID: JKFpMhv0S6a1DR2eaDA5DQ==
X-CSE-MsgGUID: CNJE1vzcTnWrmtsgU8UOTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,179,1719903600"; d="scan'208";a="62904772"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Aug 2024 22:05:50 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 26 Aug 2024 22:05:49 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 26 Aug 2024 22:05:49 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.49) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 26 Aug 2024 22:05:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TJC/66fUCkpb7/RABtaUZRHuPVUrFoslgnA2HtTexEMC0Q3XBun4lxXiDqyw7/bKBgP29IBCM76URfCTlBKbw9fh722W8EKdWUqsiCZgQm89VMARAH3ebXQQVp0hnjUfFTwCvIRTFjCbB6QV8UaJBwI+xhJNOUJhjM2ksiXCIsMSlm3HHE94bZ+tf8cpBEeI13yXcg4G4ZvoMsaStrRMspqSpo1r336V4V2dC5hBM/Iobil2+azkl5+Y/u0C0rK2eEJU0t7EHU4zCxgHT6fUsQuJGE2U7K/iX6+nfJCb0WWdILm6X7s9tv+EHsYpegKO0LlCs0MLPKcWbX37Go6rOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WgVdGsRswO3rdJA9O7HvIv7s4EbYU+SvwYuEuk/GtMU=;
 b=YlJXiaQZRTwl4AbiOs0yTM6H6O5v0lMeeKjSNVk9fAYMQwXqyKNnNU/eI357mJhR9k3OI0uBJ61uli8CcJVuZMnZXN9Ed+3C8bczxCdVc+XOgLuGZaqN5N/WQq4AMT3C0Y0WZaFcAmMSC6XXm2CNG8Nf/0qKHxOHBJ999qXxpvHTaLqooFsnB+963s3HMmibW4vf9taCBnctxlhRsFeqoRdwE1E8vDLJSrkoiiQjEkIY1cQgLGf7FtwN8a5j9dTJv2NfNzDF/EWDFeHfi1Ha4yjM6oXpaW2TSkLxJfxb5zwqb9MWX/r6UJbDbs5Z9pafxT+J87l7J/xPP8xt5UQDEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH0PR11MB4823.namprd11.prod.outlook.com (2603:10b6:510:43::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.25; Tue, 27 Aug
 2024 05:05:45 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7897.021; Tue, 27 Aug 2024
 05:05:45 +0000
Date: Tue, 27 Aug 2024 13:05:36 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <202408271015.5b4de2c5-oliver.sang@intel.com>
Content-Disposition: inline
X-ClientProxiedBy: SG3P274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::15)
 To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH0PR11MB4823:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f502b55-bd41-45d0-d211-08dcc655e868
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SXtFv1TvNyqnbKSHwqGbFLp7hX1Xd9znrqaKMtlHaoyYt5uXARpq++AqqwZa?=
 =?us-ascii?Q?b7dxFk4YOUekLH8mJoSPolca8jhFxxu5sco7mDrvVBW2tBRoW2bi+jWyo2Uq?=
 =?us-ascii?Q?vryFGj0TIAPI61wkbtqPElCUS6j5F3Z1TeXG6hCRtOS50pW4ielcgcx+Djny?=
 =?us-ascii?Q?peR/W6cVeSY7ounXUKx07vOP9+0udejcjypV9IHlm3p5nH4gkxIGhFc91VLb?=
 =?us-ascii?Q?3Qntj5UAy+twzY1Ru9ylXPW+FjerCOZFgGsECZHg7Ukwl0N6GupGfiJt5hzY?=
 =?us-ascii?Q?t2/EER+45q7OXEFVEJekEzMkS6gj5ScYRBkV4EJ0YPiAvEcSEntpxrSHdckc?=
 =?us-ascii?Q?OxgBheCQRlB2ikHaLnemuPqzynbQI1UlNTipDyk9se/CfO732Pt/Y1bkMXJn?=
 =?us-ascii?Q?1/Q7vCa3fGinIrOpPXuuOY/vs1nia+lZ2Z8HoB7ybIHcRtVi6xUA3X4G+k93?=
 =?us-ascii?Q?9Q7UlPx0jLW4YKssElJ1VnIz/dR0Up+m+damGiPvaJkXGOi9eWy2eQwcSWz1?=
 =?us-ascii?Q?xfgTwR2sUunYH0IT4MDvvc4lty4MwNyjHfXtip1OyZAwJFUCdJH1k7HMJEYo?=
 =?us-ascii?Q?DDWGLFnFKfjFv0Cg2kjEG0fBQT5P19T9gHT9O+quN2rgBbT7PZVDH9ZMkMsW?=
 =?us-ascii?Q?TD+yXYtsQ8XsyjjZ+04cKn8h6QwftprHIpVfXZXzg7Z88bC7VcxmSZyGqffg?=
 =?us-ascii?Q?tSsbhaQ3rcoa+skzQIUjgYf4SYNTdImF1V+jwETNnZ8Qa3R41F+JrUiSZVq2?=
 =?us-ascii?Q?mjceW6FqstQDgzUZmi5GavRvzxGaPpANu2COJIciJwNplJ+L4cJXsa1l00uh?=
 =?us-ascii?Q?ZEUnnZAwPCya3x0xj7lmHP2QQvi2A4MclfHgBhD4ACVx2Yz6Z9WK1BeGsv6/?=
 =?us-ascii?Q?d+9dAe7CoPbJW099RpZk46tIZ7RyCsAiescklJGmCKsHrHNTW1GIep/DVXZC?=
 =?us-ascii?Q?1WvYXJUEsprTjz/I2mxKmrFlMzOtHaMmiLJiyBbDYquKuP3FnyWrsVxjYH7f?=
 =?us-ascii?Q?2nfUpM3zglA2YClhlaUs5LwFwLLAzFW0iRDdKwayd3ZHaGGImjfKX2wheHmO?=
 =?us-ascii?Q?mJBZyng+IcGjmwbRlPkezS29uOTPemqz+NeTaEKrbO49vkLt2KOcpm89tjYO?=
 =?us-ascii?Q?bdhqIhXW/JiuAnM8+A8xupdjqe8VFq7YkvOneGypA3T0ur7zUPNS5o9F4ycP?=
 =?us-ascii?Q?L8OhyGxiAtLuFlBwdcwV5kKJpayyJl9aBj1/pSf1hYanoKDyolwIiY+TUnDg?=
 =?us-ascii?Q?hHlFLbvc/nv6Ye7Fgh+WQG9NmKrQj2yF+p+bd8oRjHEwK7qK9XjTShgXE9l7?=
 =?us-ascii?Q?apc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0/4C07FrqcP0YS62Rg02f2dX/aK/vo9Yv1EJSjwSLlTr4UVI/+UHD16V7uMK?=
 =?us-ascii?Q?cn2KnWy+2IDy/xCjQnaLxdUbRkk4+wt+7AvkvzVDCpDjEeJwgQrRA/4AC+Ih?=
 =?us-ascii?Q?KlyLcqlLosCasatAbVrLGectz6fZ9mj84aBjHgBcfTPFCXaBJ4ePLWRf6Egc?=
 =?us-ascii?Q?xVxn7aC1KyIOONjuJdsFJXrMcPtC4/p+4ycs8zQLXPDATwkY2R7WPzHYCVTT?=
 =?us-ascii?Q?8/ygz4oq4FQu2yWbzS58f90nTQ0Rvd4W3x9CI9XJ0gVKwLL886qO+JDxw6ag?=
 =?us-ascii?Q?9PKQZcsZAaAT1ur9DHlMcgiHPmAwOOoPIgawyi+3mZJLtP95yl3gf9mDVdW1?=
 =?us-ascii?Q?wcVoURUesi2KPON0nHg6RAnC7x3hea0Q26NH/vKAfQFr0i4g0AdwQOrBEZnV?=
 =?us-ascii?Q?/sPwfwUQYg9taVAFLYBcv6ayG6LsUpdlYv8ZzxMqKaAoeKtZErHek3jBkNfX?=
 =?us-ascii?Q?VhX7frwIy7D43J+ywPWsQ5N32gAyyFrMOEcXTtfD8QkCGRyb2eOu44P5+94C?=
 =?us-ascii?Q?CdHH2Tt/KXG5ybOWZIPEgqPGA9MtBT5Ib8QF1NFJvslUSlZuUIyk5LXqAdxb?=
 =?us-ascii?Q?8jIAmcZ0OAOgNsAq6aQKwWTgeQASrCh848vrJul9Yx2L9Ch2PLaf9IJKP7nI?=
 =?us-ascii?Q?yR5AFg95DdOwQF8t7G/fIVXZMSof48Bb4ixLitPCUS3a4Lbug3GFlPYNXniU?=
 =?us-ascii?Q?PcvKIDrqXKB8f0Zty82sfrg+TqAxbSbndsseYIO2TnOAe+dAtD+4RyoyeoSI?=
 =?us-ascii?Q?vLzWV5YP/YKyz4ERSs7Q7N6rKbjPV5E0bFQ4SNi9Z/dkBBx8gbDfDHWfptcU?=
 =?us-ascii?Q?irOVDoW7pAUD1WpVzn4FGUeyAAX+9P0u72Ha7vZZCj+bF5ooNzlq6yBdbVgr?=
 =?us-ascii?Q?+htOs16tXcyqa6+8zP1vgAgkrYK/NrQdPvszFVdODSd/c3ShLrHsTWMjYzIM?=
 =?us-ascii?Q?9uNk5a8xMeO24/RtOWTKxKcOgQjymjgmRdW+DRy3sDIi8sy5nYCUUrUJzMG1?=
 =?us-ascii?Q?/oPQcVfK4X5D1TURUNGjf1BPcmruxwWdbfmoSSF+sTBAfyYMG/hqUMn+60Xw?=
 =?us-ascii?Q?ktk5oQ8QyDIkiUHzq7goWpCd/QrWeaCBGmB5YmNkWEj3CpCmRYK5LyZM1ROw?=
 =?us-ascii?Q?Hw5v40RyyIfKHpt8rkIU57xnXtEfyOUX36AaLP3guhKiV1nww1qK3Mq/dytl?=
 =?us-ascii?Q?Kgne2iaFP94e9Z9fcp7BDr5fWFEepmTumICW8DAPB6OPOqTbQdNRyirhCMEq?=
 =?us-ascii?Q?qiCB3lFeiXORI4TBvqSpoTelFjY9OUT2u/IA7je4m6xNkQaHf/buMhBVoCfF?=
 =?us-ascii?Q?5l9Vd9JpTLrD3TIlwdOENDdf/HpcdcLUqKX/QEm+gsMv0zbfd/6AnW3jXybs?=
 =?us-ascii?Q?qW7gh3cGGBdk0Un/OpNS9bY0kGjqUVQ1qKJIerSzIJ8+llVLpypBVY0YCCA2?=
 =?us-ascii?Q?yqT1ALmihU54uxzLRxRX0cBOEE0PYu4iypzo+oot2ec+dNsCPp7yv81KOpMM?=
 =?us-ascii?Q?VT+2BQ7kVSq9+t5rRcE/FOpaZgJXOhgE2m45IpI8Up76j6pV6Awu1cE3rqGa?=
 =?us-ascii?Q?CP7W5PmDEFNcfJF0+7w7v5gM10eDUDZgho2OE0LD?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f502b55-bd41-45d0-d211-08dcc655e868
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2024 05:05:45.4839 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MONy9kRbcoo9z8QGMjIVmbLEUTEY90yzaCQtTmqcW81QBNsSTUFrKVCcc4H3K6QspW1MAcHvskE5Fb+EQ7bPTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4823
X-OriginatorOrg: intel.com
X-Spam-Score: 1.6 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 kernel test robot noticed "INFO:task_blocked_for_more_than#seconds"
 on: commit: 96cfeb0389530ae32ade8a48ae3ae1ac3b6c009d ("f2fs: fix to wait
 dio completion")
 https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git
 fs-next Content analysis details:   (1.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: 01.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [192.198.163.7 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [192.198.163.7 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 1.8 SUBJ_LACKS_WORDS       Subject is not short yet lacks words
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sioOx-0000z0-FQ
Subject: [f2fs-dev] [linux-next:fs-next] [f2fs] 96cfeb0389:
 INFO:task_blocked_for_more_than#seconds
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
Cc: lkp@intel.com, linux-f2fs-devel@lists.sourceforge.net,
 Linux Memory Management List <linux-mm@kvack.org>, oliver.sang@intel.com,
 oe-lkp@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



Hello,

kernel test robot noticed "INFO:task_blocked_for_more_than#seconds" on:

commit: 96cfeb0389530ae32ade8a48ae3ae1ac3b6c009d ("f2fs: fix to wait dio completion")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git fs-next

[test failed on linux-next/master 1ca4237ad9ce29b0c66fe87862f1da54ac56a1e8]

in testcase: ltp
version: ltp-x86_64-14c1f76-1_20240824
with following parameters:

	disk: 1HDD
	fs: f2fs
	test: ltp-aiodio.part4-01



compiler: gcc-12
test machine: 36 threads 1 sockets Intel(R) Core(TM) i9-10980XE CPU @ 3.00GHz (Cascade Lake) with 128G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202408271015.5b4de2c5-oliver.sang@intel.com


kern  :err   : [ 1975.160382] INFO: task dio_truncate:7499 blocked for more than 491 seconds.
kern  :err   : [ 1975.162291]       Not tainted 6.11.0-rc2-00012-g96cfeb038953 #1
kern  :err   : [ 1975.163937] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
kern  :info  : [ 1975.165896] task:dio_truncate    state:D stack:0     pid:7499  tgid:7499  ppid:7498   flags:0x00000002
kern  :info  : [ 1975.168012] Call Trace:
kern  :info  : [ 1975.169513]  <TASK>
kern :info : [ 1975.170940] __schedule (kernel/sched/core.c:5188 kernel/sched/core.c:6529) 
kern :info : [ 1975.172569] ? __pfx___schedule (kernel/sched/core.c:6399) 
kern :info : [ 1975.174128] ? stack_trace_save (kernel/stacktrace.c:123) 
kern :info : [ 1975.175713] schedule (arch/x86/include/asm/preempt.h:84 kernel/sched/core.c:6607 kernel/sched/core.c:6621) 
kern :info : [ 1975.177213] inode_dio_wait (fs/inode.c:2478 fs/inode.c:2496) 
kern :info : [ 1975.178732] ? __pfx_inode_dio_wait (fs/inode.c:2494) 
kern :info : [ 1975.180360] ? kasan_save_track (arch/x86/include/asm/current.h:49 mm/kasan/common.c:60 mm/kasan/common.c:69) 
kern :info : [ 1975.181888] ? __pfx_wake_bit_function (kernel/sched/wait_bit.c:22) 
kern :info : [ 1975.183478] ? setattr_prepare (fs/attr.c:173) 
kern :info : [ 1975.185017] f2fs_setattr (fs/f2fs/file.c:1063) f2fs
kern :info : [ 1975.186637] notify_change (fs/attr.c:495) 
kern :info : [ 1975.188160] ? __pfx_down_write (kernel/locking/rwsem.c:1577) 
kern :info : [ 1975.189645] ? do_truncate (fs/open.c:66) 
kern :info : [ 1975.191087] do_truncate (fs/open.c:66) 
kern :info : [ 1975.192582] ? __pfx_do_truncate (fs/open.c:41) 
kern :info : [ 1975.194037] ? inode_permission (fs/namei.c:536 fs/namei.c:510) 
kern :info : [ 1975.195518] vfs_truncate (fs/open.c:111) 
kern :info : [ 1975.196955] __x64_sys_truncate (fs/open.c:135 fs/open.c:146 fs/open.c:144 fs/open.c:144) 
kern :info : [ 1975.198393] ? __pfx___x64_sys_truncate (fs/open.c:144) 
kern :info : [ 1975.199920] ? kmem_cache_free (mm/slub.c:4474 mm/slub.c:4548) 
kern :info : [ 1975.201350] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83) 
kern :info : [ 1975.202723] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
kern  :info  : [ 1975.204281] RIP: 0033:0x7fb415adaf17
kern  :info  : [ 1975.205651] RSP: 002b:00007fff6e0f8e28 EFLAGS: 00000206 ORIG_RAX: 000000000000004c
kern  :info  : [ 1975.207385] RAX: ffffffffffffffda RBX: 000055bd20741074 RCX: 00007fb415adaf17
kern  :info  : [ 1975.209091] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000055bd2074103d
kern  :info  : [ 1975.210765] RBP: 000055bd4dc17000 R08: 0000000000000001 R09: 0000000000010000
kern  :info  : [ 1975.212511] R10: 00007fb4159ea390 R11: 0000000000000206 R12: 0000000000000004
kern  :info  : [ 1975.214171] R13: 0000000000000064 R14: 0000000000010000 R15: 0000000000000064
kern  :info  : [ 1975.215872]  </TASK>
kern  :err   : [ 2466.680277] INFO: task dio_truncate:7499 blocked for more than 983 seconds.
kern  :err   : [ 2466.682130]       Not tainted 6.11.0-rc2-00012-g96cfeb038953 #1
kern  :err   : [ 2466.683485] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
kern  :info  : [ 2466.685152] task:dio_truncate    state:D stack:0     pid:7499  tgid:7499  ppid:7498   flags:0x00000002
kern  :info  : [ 2466.686743] Call Trace:
kern  :info  : [ 2466.687916]  <TASK>
kern :info : [ 2466.689140] __schedule (kernel/sched/core.c:5188 kernel/sched/core.c:6529) 
kern :info : [ 2466.690254] ? __pfx___schedule (kernel/sched/core.c:6399) 
kern :info : [ 2466.691533] ? stack_trace_save (kernel/stacktrace.c:123) 
kern :info : [ 2466.692815] schedule (arch/x86/include/asm/preempt.h:84 kernel/sched/core.c:6607 kernel/sched/core.c:6621) 
kern :info : [ 2466.694022] inode_dio_wait (fs/inode.c:2478 fs/inode.c:2496) 
kern :info : [ 2466.695258] ? __pfx_inode_dio_wait (fs/inode.c:2494) 
kern :info : [ 2466.696491] ? kasan_save_track (arch/x86/include/asm/current.h:49 mm/kasan/common.c:60 mm/kasan/common.c:69) 
kern :info : [ 2466.697829] ? __pfx_wake_bit_function (kernel/sched/wait_bit.c:22) 
kern :info : [ 2466.699156] ? setattr_prepare (fs/attr.c:173) 
kern :info : [ 2466.700333] f2fs_setattr (fs/f2fs/file.c:1063) f2fs
kern :info : [ 2466.701756] notify_change (fs/attr.c:495) 
kern :info : [ 2466.702975] ? __pfx_down_write (kernel/locking/rwsem.c:1577) 
kern :info : [ 2466.704241] ? do_truncate (fs/open.c:66) 
kern :info : [ 2466.705436] do_truncate (fs/open.c:66) 
kern :info : [ 2466.706641] ? __pfx_do_truncate (fs/open.c:41) 
kern :info : [ 2466.707775] ? inode_permission (fs/namei.c:536 fs/namei.c:510) 
kern :info : [ 2466.709133] vfs_truncate (fs/open.c:111) 
kern :info : [ 2466.710229] __x64_sys_truncate (fs/open.c:135 fs/open.c:146 fs/open.c:144 fs/open.c:144) 
kern :info : [ 2466.711485] ? __pfx___x64_sys_truncate (fs/open.c:144) 
kern :info : [ 2466.712728] ? kmem_cache_free (mm/slub.c:4474 mm/slub.c:4548) 
kern :info : [ 2466.714005] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83) 
kern :info : [ 2466.715220] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
kern  :info  : [ 2466.716486] RIP: 0033:0x7fb415adaf17
kern  :info  : [ 2466.717758] RSP: 002b:00007fff6e0f8e28 EFLAGS: 00000206 ORIG_RAX: 000000000000004c
kern  :info  : [ 2466.719330] RAX: ffffffffffffffda RBX: 000055bd20741074 RCX: 00007fb415adaf17
kern  :info  : [ 2466.720811] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000055bd2074103d
kern  :info  : [ 2466.722359] RBP: 000055bd4dc17000 R08: 0000000000000001 R09: 0000000000010000
kern  :info  : [ 2466.723766] R10: 00007fb4159ea390 R11: 0000000000000206 R12: 0000000000000004
kern  :info  : [ 2466.725408] R13: 0000000000000064 R14: 0000000000010000 R15: 0000000000000064
kern  :info  : [ 2466.726816]  </TASK>
kern  :err   : [ 2958.200311] INFO: task dio_truncate:7499 blocked for more than 1474 seconds.
kern  :err   : [ 2958.202114]       Not tainted 6.11.0-rc2-00012-g96cfeb038953 #1
kern  :err   : [ 2958.203466] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
kern  :info  : [ 2958.205053] task:dio_truncate    state:D stack:0     pid:7499  tgid:7499  ppid:7498   flags:0x00000002
kern  :info  : [ 2958.206833] Call Trace:
kern  :info  : [ 2958.207970]  <TASK>
kern :info : [ 2958.209063] __schedule (kernel/sched/core.c:5188 kernel/sched/core.c:6529) 
kern :info : [ 2958.210370] ? __pfx___schedule (kernel/sched/core.c:6399) 
kern :info : [ 2958.211614] ? stack_trace_save (kernel/stacktrace.c:123) 
kern :info : [ 2958.212856] schedule (arch/x86/include/asm/preempt.h:84 kernel/sched/core.c:6607 kernel/sched/core.c:6621) 
kern :info : [ 2958.214029] inode_dio_wait (fs/inode.c:2478 fs/inode.c:2496) 
kern :info : [ 2958.215341] ? __pfx_inode_dio_wait (fs/inode.c:2494) 
kern :info : [ 2958.216584] ? kasan_save_track (arch/x86/include/asm/current.h:49 mm/kasan/common.c:60 mm/kasan/common.c:69) 
kern :info : [ 2958.217788] ? __pfx_wake_bit_function (kernel/sched/wait_bit.c:22) 
kern :info : [ 2958.219114] ? setattr_prepare (fs/attr.c:173) 
kern :info : [ 2958.220297] f2fs_setattr (fs/f2fs/file.c:1063) f2fs
kern :info : [ 2958.221567] notify_change (fs/attr.c:495) 
kern :info : [ 2958.222775] ? __pfx_down_write (kernel/locking/rwsem.c:1577) 
kern :info : [ 2958.223964] ? do_truncate (fs/open.c:66) 
kern :info : [ 2958.225108] do_truncate (fs/open.c:66) 
kern :info : [ 2958.226262] ? __pfx_do_truncate (fs/open.c:41) 
kern :info : [ 2958.227498] ? inode_permission (fs/namei.c:536 fs/namei.c:510) 
kern :info : [ 2958.228670] vfs_truncate (fs/open.c:111) 
kern :info : [ 2958.229803] __x64_sys_truncate (fs/open.c:135 fs/open.c:146 fs/open.c:144 fs/open.c:144) 
kern :info : [ 2958.231062] ? __pfx___x64_sys_truncate (fs/open.c:144) 
kern :info : [ 2958.232296] ? kmem_cache_free (mm/slub.c:4474 mm/slub.c:4548) 
kern :info : [ 2958.233460] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83) 
kern :info : [ 2958.234650] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
kern  :info  : [ 2958.235930] RIP: 0033:0x7fb415adaf17
kern  :info  : [ 2958.237063] RSP: 002b:00007fff6e0f8e28 EFLAGS: 00000206 ORIG_RAX: 000000000000004c
kern  :info  : [ 2958.238601] RAX: ffffffffffffffda RBX: 000055bd20741074 RCX: 00007fb415adaf17
kern  :info  : [ 2958.240081] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000055bd2074103d
kern  :info  : [ 2958.241545] RBP: 000055bd4dc17000 R08: 0000000000000001 R09: 0000000000010000
kern  :info  : [ 2958.243099] R10: 00007fb4159ea390 R11: 0000000000000206 R12: 0000000000000004
kern  :info  : [ 2958.244574] R13: 0000000000000064 R14: 0000000000010000 R15: 0000000000000064
kern  :info  : [ 2958.246040]  </TASK>
kern  :err   : [ 3449.721200] INFO: task dio_truncate:7499 blocked for more than 1966 seconds.
kern  :err   : [ 3449.722637]       Not tainted 6.11.0-rc2-00012-g96cfeb038953 #1
kern  :err   : [ 3449.724151] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
kern  :info  : [ 3449.725677] task:dio_truncate    state:D stack:0     pid:7499  tgid:7499  ppid:7498   flags:0x00000002
kern  :info  : [ 3449.727394] Call Trace:
kern  :info  : [ 3449.728500]  <TASK>
kern :info : [ 3449.729661] __schedule (kernel/sched/core.c:5188 kernel/sched/core.c:6529) 
kern :info : [ 3449.730915] ? __pfx___schedule (kernel/sched/core.c:6399) 
kern :info : [ 3449.732183] ? stack_trace_save (kernel/stacktrace.c:123) 
kern :info : [ 3449.733409] schedule (arch/x86/include/asm/preempt.h:84 kernel/sched/core.c:6607 kernel/sched/core.c:6621) 
kern :info : [ 3449.734677] inode_dio_wait (fs/inode.c:2478 fs/inode.c:2496) 
kern :info : [ 3449.735922] ? __pfx_inode_dio_wait (fs/inode.c:2494) 
kern :info : [ 3449.737184] ? kasan_save_track (arch/x86/include/asm/current.h:49 mm/kasan/common.c:60 mm/kasan/common.c:69) 
kern :info : [ 3449.738465] ? __pfx_wake_bit_function (kernel/sched/wait_bit.c:22) 
kern :info : [ 3449.739717] ? setattr_prepare (fs/attr.c:173) 
kern :info : [ 3449.740912] f2fs_setattr (fs/f2fs/file.c:1063) f2fs
kern :info : [ 3449.742231] notify_change (fs/attr.c:495) 
kern :info : [ 3449.743426] ? __pfx_down_write (kernel/locking/rwsem.c:1577) 
kern :info : [ 3449.744606] ? do_truncate (fs/open.c:66) 
kern :info : [ 3449.745832] do_truncate (fs/open.c:66) 
kern :info : [ 3449.747038] ? __pfx_do_truncate (fs/open.c:41) 
kern :info : [ 3449.748280] ? inode_permission (fs/namei.c:536 fs/namei.c:510) 
kern :info : [ 3449.749532] vfs_truncate (fs/open.c:111) 
kern :info : [ 3449.750754] __x64_sys_truncate (fs/open.c:135 fs/open.c:146 fs/open.c:144 fs/open.c:144) 
kern :info : [ 3449.751994] ? __pfx___x64_sys_truncate (fs/open.c:144) 
kern :info : [ 3449.753303] ? kmem_cache_free (mm/slub.c:4474 mm/slub.c:4548) 
kern :info : [ 3449.754537] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83) 
kern :info : [ 3449.755749] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
kern  :info  : [ 3449.757070] RIP: 0033:0x7fb415adaf17
kern  :info  : [ 3449.758277] RSP: 002b:00007fff6e0f8e28 EFLAGS: 00000206 ORIG_RAX: 000000000000004c
kern  :info  : [ 3449.759822] RAX: ffffffffffffffda RBX: 000055bd20741074 RCX: 00007fb415adaf17
kern  :info  : [ 3449.761364] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000055bd2074103d
kern  :info  : [ 3449.762868] RBP: 000055bd4dc17000 R08: 0000000000000001 R09: 0000000000010000
kern  :info  : [ 3449.764421] R10: 00007fb4159ea390 R11: 0000000000000206 R12: 0000000000000004
kern  :info  : [ 3449.765958] R13: 0000000000000064 R14: 0000000000010000 R15: 0000000000000064
kern  :info  : [ 3449.767521]  </TASK>
kern  :err   : [ 3941.240221] INFO: task dio_truncate:7499 blocked for more than 2457 seconds.
kern  :err   : [ 3941.241971]       Not tainted 6.11.0-rc2-00012-g96cfeb038953 #1
kern  :err   : [ 3941.243381] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
kern  :info  : [ 3941.244968] task:dio_truncate    state:D stack:0     pid:7499  tgid:7499  ppid:7498   flags:0x00000002
kern  :info  : [ 3941.246768] Call Trace:
kern  :info  : [ 3941.247927]  <TASK>
kern :info : [ 3941.249017] __schedule (kernel/sched/core.c:5188 kernel/sched/core.c:6529) 
kern :info : [ 3941.250267] ? __pfx___schedule (kernel/sched/core.c:6399) 
kern :info : [ 3941.251521] ? stack_trace_save (kernel/stacktrace.c:123) 
kern :info : [ 3941.252708] schedule (arch/x86/include/asm/preempt.h:84 kernel/sched/core.c:6607 kernel/sched/core.c:6621) 
kern :info : [ 3941.253986] inode_dio_wait (fs/inode.c:2478 fs/inode.c:2496) 
kern :info : [ 3941.255231] ? __pfx_inode_dio_wait (fs/inode.c:2494) 
kern :info : [ 3941.256422] ? kasan_save_track (arch/x86/include/asm/current.h:49 mm/kasan/common.c:60 mm/kasan/common.c:69) 
kern :info : [ 3941.257705] ? __pfx_wake_bit_function (kernel/sched/wait_bit.c:22) 
kern :info : [ 3941.258954] ? setattr_prepare (fs/attr.c:173) 
kern :info : [ 3941.260125] f2fs_setattr (fs/f2fs/file.c:1063) f2fs
kern :info : [ 3941.261391] notify_change (fs/attr.c:495) 
kern :info : [ 3941.262601] ? __pfx_down_write (kernel/locking/rwsem.c:1577) 
kern :info : [ 3941.263779] ? do_truncate (fs/open.c:66) 
kern :info : [ 3941.264917] do_truncate (fs/open.c:66) 
kern :info : [ 3941.266044] ? __pfx_do_truncate (fs/open.c:41) 
kern :info : [ 3941.267257] ? inode_permission (fs/namei.c:536 fs/namei.c:510) 
kern :info : [ 3941.268451] vfs_truncate (fs/open.c:111) 
kern :info : [ 3941.269581] __x64_sys_truncate (fs/open.c:135 fs/open.c:146 fs/open.c:144 fs/open.c:144) 
kern :info : [ 3941.270861] ? __pfx___x64_sys_truncate (fs/open.c:144) 
kern :info : [ 3941.272111] ? kmem_cache_free (mm/slub.c:4474 mm/slub.c:4548) 
kern :info : [ 3941.273240] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83) 
kern :info : [ 3941.274502] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
kern  :info  : [ 3941.275872] RIP: 0033:0x7fb415adaf17
kern  :info  : [ 3941.277068] RSP: 002b:00007fff6e0f8e28 EFLAGS: 00000206 ORIG_RAX: 000000000000004c
kern  :info  : [ 3941.278608] RAX: ffffffffffffffda RBX: 000055bd20741074 RCX: 00007fb415adaf17
kern  :info  : [ 3941.280150] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000055bd2074103d
kern  :info  : [ 3941.281582] RBP: 000055bd4dc17000 R08: 0000000000000001 R09: 0000000000010000
kern  :info  : [ 3941.283213] R10: 00007fb4159ea390 R11: 0000000000000206 R12: 0000000000000004
kern  :info  : [ 3941.284655] R13: 0000000000000064 R14: 0000000000010000 R15: 0000000000000064
kern  :info  : [ 3941.286229]  </TASK>
kern  :err   : [ 4432.760118] INFO: task dio_truncate:7499 blocked for more than 2949 seconds.
kern  :err   : [ 4432.761567]       Not tainted 6.11.0-rc2-00012-g96cfeb038953 #1
kern  :err   : [ 4432.763073] "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
kern  :info  : [ 4432.764652] task:dio_truncate    state:D stack:0     pid:7499  tgid:7499  ppid:7498   flags:0x00000002
kern  :info  : [ 4432.766420] Call Trace:
kern  :info  : [ 4432.767606]  <TASK>
kern :info : [ 4432.768695] __schedule (kernel/sched/core.c:5188 kernel/sched/core.c:6529) 
kern :info : [ 4432.769905] ? __pfx___schedule (kernel/sched/core.c:6399) 
kern :info : [ 4432.771267] ? stack_trace_save (kernel/stacktrace.c:123) 
kern :info : [ 4432.772514] schedule (arch/x86/include/asm/preempt.h:84 kernel/sched/core.c:6607 kernel/sched/core.c:6621) 
kern :info : [ 4432.773699] inode_dio_wait (fs/inode.c:2478 fs/inode.c:2496) 
kern :info : [ 4432.774910] ? __pfx_inode_dio_wait (fs/inode.c:2494) 
kern :info : [ 4432.776269] ? kasan_save_track (arch/x86/include/asm/current.h:49 mm/kasan/common.c:60 mm/kasan/common.c:69) 
kern :info : [ 4432.777469] ? __pfx_wake_bit_function (kernel/sched/wait_bit.c:22) 
kern :info : [ 4432.778706] ? setattr_prepare (fs/attr.c:173) 
kern :info : [ 4432.779958] f2fs_setattr (fs/f2fs/file.c:1063) f2fs
kern :info : [ 4432.781241] notify_change (fs/attr.c:495) 
kern :info : [ 4432.782379] ? __pfx_down_write (kernel/locking/rwsem.c:1577) 
kern :info : [ 4432.783604] ? do_truncate (fs/open.c:66) 
kern :info : [ 4432.784772] do_truncate (fs/open.c:66) 
kern :info : [ 4432.785973] ? __pfx_do_truncate (fs/open.c:41) 
kern :info : [ 4432.787198] ? inode_permission (fs/namei.c:536 fs/namei.c:510) 
kern :info : [ 4432.788514] vfs_truncate (fs/open.c:111) 
kern :info : [ 4432.789655] __x64_sys_truncate (fs/open.c:135 fs/open.c:146 fs/open.c:144 fs/open.c:144) 
kern :info : [ 4432.790909] ? __pfx___x64_sys_truncate (fs/open.c:144) 
kern :info : [ 4432.792413] ? kmem_cache_free (mm/slub.c:4474 mm/slub.c:4548) 
kern :info : [ 4432.793602] do_syscall_64 (arch/x86/entry/common.c:52 arch/x86/entry/common.c:83) 
kern :info : [ 4432.794814] entry_SYSCALL_64_after_hwframe (arch/x86/entry/entry_64.S:130) 
kern  :info  : [ 4432.796255] RIP: 0033:0x7fb415adaf17
kern  :info  : [ 4432.797402] RSP: 002b:00007fff6e0f8e28 EFLAGS: 00000206 ORIG_RAX: 000000000000004c
kern  :info  : [ 4432.798963] RAX: ffffffffffffffda RBX: 000055bd20741074 RCX: 00007fb415adaf17
kern  :info  : [ 4432.800493] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 000055bd2074103d
kern  :info  : [ 4432.802033] RBP: 000055bd4dc17000 R08: 0000000000000001 R09: 0000000000010000
kern  :info  : [ 4432.803557] R10: 00007fb4159ea390 R11: 0000000000000206 R12: 0000000000000004
kern  :info  : [ 4432.805121] R13: 0000000000000064 R14: 0000000000010000 R15: 0000000000000064
kern  :info  : [ 4432.806589]  </TASK>



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240827/202408271015.5b4de2c5-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
