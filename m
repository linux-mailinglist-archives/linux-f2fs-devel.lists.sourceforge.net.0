Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C150976B98
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Sep 2024 16:08:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sokV2-00008v-Pi;
	Thu, 12 Sep 2024 14:08:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <oliver.sang@intel.com>) id 1sokV1-00008e-E1
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 14:08:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Message-ID:Subject:CC:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WC6Eq6eHUvsY7sjzj2hJAj+TwEoTlaa3F4gMrokadgY=; b=IdE6E4BB7WWzObsli/sJqGJmZh
 ugwoTTe5UaNAbB0mNKzFvuTWsxghKIy/FJwTx8ca7jaDKC00PN6/LUdaBOlu9YjUpfgzGOgZU5XRw
 hC/keVRZmyRkBaOM3xf93qEkiggdscTJdGAFqMt8JPX3Eksf0rje2h6E8pqocfJk/SyY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Message-ID:Subject:CC:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WC6Eq6eHUvsY7sjzj2hJAj+TwEoTlaa3F4gMrokadgY=; b=E
 RfVy4SgAkgxd5O6vmV8rNLXCUt9C22wSdijZtg2TPwkm2XwL30TnYlUGgF7e+pNArGmHjR930Vcs3
 H6SfWmJQJJumxRdbWybEeG6RFujUQyVEPM04RvgD0TLOOnsCTSujCu5NWlW/1r7hd7dAhMGogwqeV
 pSX2C5pzE0xMg3CU=;
Received: from mgamail.intel.com ([198.175.65.21])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sokUx-0002IP-5q for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 14:08:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726150120; x=1757686120;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=1wnyDhtjfvrEoVma9z0MrARd7uywNVCTZKbEtK1KX+8=;
 b=QUKiRhLwxGLL75YB8J4snS+rVCMZ7g5PAvWsJKHqyZ5LDA4MV4LRfKfh
 jMMCy/EPUWURDfgVj5rzbZlb89066SxpS/Jxv0S/8phg45RGw5n8jz+AF
 OVXkg+ZXa14ygZ1oPKUP/CUCZsrepabXHKByLgNON/3BC+GcpeuaPvXPn
 PjsMRbnIa37brb01wxtl88VEYautxo+iA1cLn95ZRyqsBc+dMt7CYNlHN
 Wc6KU95+y6Wyj62ueDf3oZIqsbX9RmZ3I6zE6c5My+kxSD+I4UjGPruKO
 KcVD+9yBHsCIZtizEnBYAymBJoCFXmtonY3nuBAz1w9fNdxjtmD6OFdvC w==;
X-CSE-ConnectionGUID: ihpL/80LSVqGqR+WPVwUhw==
X-CSE-MsgGUID: zYVJZN7vS8WcMS797jcF1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="24941762"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="24941762"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 07:08:29 -0700
X-CSE-ConnectionGUID: 53pA5d8uTzywMNnaGgmYtg==
X-CSE-MsgGUID: ZKCWB43FShKLwYVorlS47A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="67708832"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 07:08:28 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 07:08:27 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 07:08:27 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 07:08:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cgTxla4U5A7ujNATo/bvepQJseHan858Qew7hKUU3HlGusG+TVyyoqQuinIPUCZCQukyieQLNQk3xJ9LN630v3NIkN6rD+YBDqGVAFTWSGEryfHTAMFrbggoqaRAEVmb9/c17dMgxVS4Dyef3Gy9pTJDqYQe8ecchcYHZc3un8jPBNaSaDxXAs7Qw6rCqT3eziD1cOL88SP1ITcrO/+9WIt1tpAQjvoV6cphNzgNcY5ECO5eXzECsuXzOGYBWdyLelZ93nwFkOu9cyiw+Z718ZrPnMU4zzScfJT712zoo+OgSh8mv7rdXlwDA48MMJqZGBMgcpITkn+5iWGZRH2nGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WC6Eq6eHUvsY7sjzj2hJAj+TwEoTlaa3F4gMrokadgY=;
 b=bKYXjNc1CXLesDASWqCs/BditjNxRVg9HAzTlLvbtH/d00AAOC2octkPWXxsQPE7H9EZF2kYD9m5rciT2KfCxAYLmO83Yi6pw/ADQjCfboV+1Wz+NI08iECG/260l3ZblmX4ooJVEct+3o7WLoFyAJDYNN7ar+EGZkmnUSwmP2SKItRKIocwBfNbkj4j4h/M5XLo0mxIKfOZVNpKTojR84WICcnP3HIB/UTKDdWeBBrw9dhoNQ7F4fUJeoD+Yd8ru0Mmph8ZA8UhuH+FtNRNNxtCXVBa7JKfgT4033aB0MYB2pp26rX3GAA9UM3X/jsx2I0lEw8YmfeiIIiUKtC5bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by PH7PR11MB7004.namprd11.prod.outlook.com (2603:10b6:510:20b::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Thu, 12 Sep
 2024 14:08:24 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7962.017; Thu, 12 Sep 2024
 14:08:10 +0000
Date: Thu, 12 Sep 2024 22:08:00 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <202409122103.e45aa13b-oliver.sang@intel.com>
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0181.apcprd04.prod.outlook.com
 (2603:1096:4:14::19) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|PH7PR11MB7004:EE_
X-MS-Office365-Filtering-Correlation-Id: de26d436-f0f5-4c5c-b958-08dcd33454d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EqZo1kJ+weEpZ3oBvrWAZLr57yn3IgceYbXpfpDZW+K3r1aQ2MKPBQuXQrgK?=
 =?us-ascii?Q?4L7h31xQ8Vp1MP2vR6PW9sT6N6hxBv98poQIByrdawAVYS0Weul9Nn/PsKlT?=
 =?us-ascii?Q?H0YH31BH4vzHgULcMrhafGIrp2KKp23xcJQ9eBsPoXQwbST0c48reUYGZMDq?=
 =?us-ascii?Q?97n0nwVN38C0fQdzq/tfdBX3PeohHjCZ5fkLiPxPhdSkLlTR1ekdCrP9ALsi?=
 =?us-ascii?Q?Guw6zorxT9XN2vnSR76p+j0aqL92zbNOz34M/g41sRpVmooK5E77WyG6u9/c?=
 =?us-ascii?Q?jLUDuF+mvVcsVMgbOz8f1PyDgGTZUQPy5656mTt0E/LZUkG411pjQEeEpWpR?=
 =?us-ascii?Q?TXQ3X2ZLQ3Ye3PDlse7KaprSVvBZB+BMaR89X/rOEiYzUqpj68yFN7BFJDUw?=
 =?us-ascii?Q?Z7NAW5ugOt1/z7jKjCdqFpbmsHXGXHidbxq4U24/TqJP4oeSEP1NJ8nJkqrM?=
 =?us-ascii?Q?zVg/fvTdDfwWbXwnak1RuqC6ToV0kadyrDQtJg9JgwFN2Umopep0sVvuXta1?=
 =?us-ascii?Q?STNhRqn5zlWa/niDu3DhQmBflVMQ2CzYahdlja7d8oVsjnpbB+dj1+GJ4ULv?=
 =?us-ascii?Q?fXuCTOyTFMvBTO/uNbuA7R0G3IryOC/JUJLRxlrxtCN04Ls9rW/NWXfneeTf?=
 =?us-ascii?Q?CBNhxUvMV2qol16rmQKJt9asUrXOB+7lmVRlwUagalOMi3htSeDErF5GZvyz?=
 =?us-ascii?Q?FBb+CrQuyrtZeK0yRrgu+dgh2JgOr9pbM8eyMAa7eiPC0tUurrq8YW5JFtpy?=
 =?us-ascii?Q?h63iwb+wdBwC8k4taJmUXjKATFQ+MMJD9SpUNUiLBPaHcQvTj/HcflE+DWA5?=
 =?us-ascii?Q?kwqOoylIFFA5+Uy486UnyBaScZIMmUg0ksazaSF1APE20VryP1ujXTvIkaH9?=
 =?us-ascii?Q?R5ewcdL+/E/hGcO39rGMMhQ4IbULUJNQC+VligutG6JTnHpLxM97mAiQm7Ns?=
 =?us-ascii?Q?SGv4SZ9yDvpitawao09poa7iU28g9vmQjglopGbAQzbhvsywELCLNOQh5O/D?=
 =?us-ascii?Q?zYEjMDCxNj7+TAYT1ZnbW8hWGmmkknk1RBBs3jJy+mcIs6RmNoU8O+aPxVwZ?=
 =?us-ascii?Q?hWD55SnZoAAJKrFB7RBCHzHiL/XLAfH8CM898uy2mJsw8OGdJV2rfwzdozDD?=
 =?us-ascii?Q?jyGDVnrq70irgryY7Cs2qNNlsaQvnyiyIS59+qbKohPU44rRHvwnZIHaE9u2?=
 =?us-ascii?Q?PVvgjYPEPQvjGL+0rtuYZy+xYvOJ9REORc6AMMTX9odpAVw3NzV9ypUNShon?=
 =?us-ascii?Q?parnqO64xudUA8BfLudxc+SqDb38QtS1oKn9Q1E8kS1Wj/LUzlCYsn2+KqRV?=
 =?us-ascii?Q?AQiy3CkpVBw5K09go1AprQWL3rY8DWjSctLro9c+DVFadkEGlogLcChAPT+0?=
 =?us-ascii?Q?EiZpLFA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9+K/rkYCQ/3eeOf/QMB30wCkYYTiQVi/i49O9w/F53nHpRaKASwV2EEIhK3t?=
 =?us-ascii?Q?/LtOOdVzAX5+B549ItKKt+uJqkUz1KkUmE7iuAtj9XsdZVtYLe7KmLxeRiCr?=
 =?us-ascii?Q?qKTz8w7IVee/Jj66MxGkEeMzU0eQI+KF1BO61r/1E95hd7g0n60cBsfdmdJ3?=
 =?us-ascii?Q?Ov1y33jvyvoo9PgoSfoF0GrfTrB8JGBL9bqrO+0ePJNtbXgeY5FFkn8Lzd9C?=
 =?us-ascii?Q?yorAuOWtza3zqX/Ox8yFdwnF0agTWs23bSislx2GLE/KghdpLAslRXGR1N/Z?=
 =?us-ascii?Q?atLUFq0PFzRHHxKn5FuI4a4mE/lunFaMLtRroQDU0nhLrUeYsuLpzRr4j+Xn?=
 =?us-ascii?Q?QSmnryaKuLHsDR6QZjmXW2JCoBC9lMk6aIOWau0k5HdwNDGIcf8XSitVlGDV?=
 =?us-ascii?Q?gJF0nnJgjUmCwZBbX7Lu5lRzBPBipmGoBJCAejN/THNAZl1gGcisDX4wlh8x?=
 =?us-ascii?Q?UTFygumcWO2nf5XehtcZ2XShanzDHz4sRoMPw/amMd1icHZ2G8E0AYsQUqRH?=
 =?us-ascii?Q?UEiY8VtFxOy/jS+ZmaJ2sCE5XzYVSqfeLuZbSlVL6KVMssjAG+VYfHOjJ8JY?=
 =?us-ascii?Q?APQ5/ZqM7hhN2wsw7bTb3LT1eeewwwBHDkpLCKIo3+FFigsD+yrSQyvWPvDg?=
 =?us-ascii?Q?IbHx+YRxj9P/W856ujVpJbJlreS0ZVvV9/9bL8XkLRq5WI+Id1Q0JjKwN1ie?=
 =?us-ascii?Q?MB3xynQBUD5bA9uQnc1pfkmiNZvzQ4O0iRCM1hzK9ySZPTk+MvkCpVJL63/M?=
 =?us-ascii?Q?kAIGFgZ562JtTZpQAAJikJlIdpJ7I7XL0CgIViuI5M0sAg2/HVf6E6h1ITR3?=
 =?us-ascii?Q?0/eP/B7KORjtf6298Wen1iSYm8ExwVtTSE8/YKzNxe3kGOhpSHnF7virzvfN?=
 =?us-ascii?Q?y6iDaJ8ZAiO1kb3qBGvp2D1OAZEbJq7sLT0F6EmBFMcAj9SSAGGIiZp8KKTy?=
 =?us-ascii?Q?LKOwmHnWZAorH75yw35SqJpqqzYBzQgMkAcLk8il+K3M7/Ok1dLOgTUubsfe?=
 =?us-ascii?Q?tILp12IsQ6KD41/HhIABknoAGbIyIqXSGRI6aS0xNLs37TA45Qr8lstMxh42?=
 =?us-ascii?Q?ybfdnS6RRVFdTOK9HXYZc96BG9wFIwUXqlE+L4ZEeJknLrOi5vBXXdOPTbrV?=
 =?us-ascii?Q?juVMGpmrs3O/Obgfl1p1092hMxDNjOH5Q4+8rFpENG8PAMFOExsi/MpiPFM4?=
 =?us-ascii?Q?Dhn4oTS3mMjXM78DcE9YBPVqnrOg+Ey+/TJzlIa/Iex1EAU4rHxeC/iKpo8T?=
 =?us-ascii?Q?NVqZvbZ7Sul+mKUgtge+nIkCct9fCmL+0TuQSWqu+amkO7FJNutj+g2cYhJi?=
 =?us-ascii?Q?eFe1V/YjpFtDYM2m2kOafE33pZ8xiphTPM9WjFFJRuIlBtFDYCNG4wDbEd8s?=
 =?us-ascii?Q?WiNRsfpIRcbm8Oa2j82N8puCFaGRLo8BZTSHO+TyXVIoz2sYzXlhJEkytz9j?=
 =?us-ascii?Q?VuJHmXOmKrUsOl3mtUoyZiBIHxul1o0Q/fb0+Q/t9jwWnWJ5Gw7cjfxcX/03?=
 =?us-ascii?Q?li/6drUCO97JSmvpmoRW+q+2tFpX26Z0cepfvoc7uRXS2rUGFm2yFJS1qVDS?=
 =?us-ascii?Q?U1ECvsaYeoX+9FyiF31m9RYaC2ufrXog910xdGCMZDx1a0zSm2c8nIEaLmKv?=
 =?us-ascii?Q?Tg=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: de26d436-f0f5-4c5c-b958-08dcd33454d1
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 14:08:09.7025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0K7J2mLpHiDhB+zLbfNQtIatN3ZBZNTOkqUs/o9pikRlTR2moa3l1G3qZPYkdlgMM0vKBMPdNuO7oYAbs5stkg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7004
X-OriginatorOrg: intel.com
X-Spam-Score: -1.4 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 kernel test robot noticed "ltp.ADSP069.fail" on: commit:
 9f0f6bf4271488b3d3a290ba119a0e0a08df2cc6 ("f2fs: support to map continuous
 holes or preallocated address")
 https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git
 master Content analysis details:   (-1.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.175.65.21 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 1.2 SUBJ_LACKS_WORDS       Subject is not short yet lacks words
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sokUx-0002IP-5q
Subject: [f2fs-dev] [linus:master] [f2fs]  9f0f6bf427:  ltp.ADSP069.fail
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
Cc: lkp@intel.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, oliver.sang@intel.com,
 oe-lkp@lists.linux.dev, Jaegeuk Kim <jaegeuk@kernel.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



Hello,

kernel test robot noticed "ltp.ADSP069.fail" on:

commit: 9f0f6bf4271488b3d3a290ba119a0e0a08df2cc6 ("f2fs: support to map continuous holes or preallocated address")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

[test failed on linus/master      8d8d276ba2fb5f9ac4984f5c10ae60858090babc]
[test failed on linux-next/master 32ffa5373540a8d1c06619f52d019c6cdc948bb4]

in testcase: ltp
version: ltp-x86_64-14c1f76-1_20240907
with following parameters:

	disk: 1HDD
	fs: f2fs
	test: ltp-aiodio.part2-01/ADSP069



compiler: gcc-12
test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-3770K CPU @ 3.50GHz (Ivy Bridge) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)



If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202409122103.e45aa13b-oliver.sang@intel.com


Running tests.......
<<<test_start>>>
tag=ADSP069 stime=1726063753
cmdline="dio_sparse -w 1024k -s 2048k -n 6"
contacts=""
analysis=exit
<<<test_output>>>
tst_tmpdir.c:316: TINFO: Using /fs/sda1/tmpdir/ltp-9n1cQWozoa/LTP_dioEeK1iL as tmpdir (f2fs filesystem)
tst_test.c:1809: TINFO: LTP version: 20240524-225-g0ac1e70cb
tst_test.c:1813: TINFO: Tested kernel: 6.9.0-rc1-00011-g9f0f6bf42714 #1 SMP PREEMPT_DYNAMIC Wed Sep 11 21:23:04 CST 2024 x86_64
tst_test.c:1652: TINFO: Timeout per run is 1h 00m 30s
tst_test.c:1406: TINFO: f2fs is supported by the test
dio_sparse.c:84: TINFO: Dirtying free blocks
common.h:72: TINFO: child 3874 reading file
common.h:72: TINFO: child 3875 reading file
common.h:72: TINFO: child 3876 reading file
common.h:72: TINFO: child 3877 reading file
common.h:72: TINFO: child 3878 reading file
common.h:72: TINFO: child 3879 reading file
common.h:20: TINFO: non zero buffer at buf[0] => 0xffffffaa,ffffffaa,ffffffaa,ffffffaa
common.h:26: TINFO: buf 0x7ffdbd3882c0, p 0x7ffdbd3882c0
common.h:85: TFAIL: non-zero read at offset 1732608
dio_sparse.c:117: TFAIL: Child 3879: exited with 1

Summary:
passed   0
failed   2
broken   0
skipped  0
warnings 0
incrementing stop
<<<execution_status>>>
initiation_status="ok"
duration=2 termination_type=exited termination_id=1 corefile=no
cutime=11 cstime=56
<<<test_end>>>
INFO: ltp-pan reported some tests FAIL
LTP Version: 20240524-225-g0ac1e70cb

       ###############################################################

            Done executing testcases.
            LTP Version:  20240524-225-g0ac1e70cb
       ###############################################################



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240912/202409122103.e45aa13b-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
