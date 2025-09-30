Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE999BABB03
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Sep 2025 08:42:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dzhJ51K7wlQm0xL5Ezxz5g+zHhoed6Bn90A3UylpgIA=; b=b1LFf6B9NbmP/H4e/qTizubYcN
	pRanr5vM5ahYg68gVvt+2RWUsGszgzYdunAlYN9r+SStJMFNMyYrKoYA7grEMm4tmJECWc6o6tC73
	9dkF4ZpEpBO4pjPjJ4XafcogmbXG1WSrQjYlPm+yPSM7tgEJRcPhqCXNmNZqI9+bQyl8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3U3f-0002B8-Rl;
	Tue, 30 Sep 2025 06:41:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <oliver.sang@intel.com>) id 1v3U3e-0002B2-Tx
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Sep 2025 06:41:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Message-ID:Subject:CC:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mcuhu/rZlIkBVrb2aVM3jqeBHVrUqTF3LM8puwkLqwk=; b=IjuLWGLNc4eSmVojQTPQhc4vTh
 hlE1Olt3QkB+HsmKkj8YeadmTBd9uXeqplkgRpzoi/YKstx/4sg6aCAUjBxXwlBmmY9eXCVJBbMpr
 SXNW104DuTddNLL1+0Gp9UjJJ5ET8XurYDORiTnNrp4F5cjFkiWlYKkYfA4+F7FfzA/w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Message-ID:Subject:CC:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Mcuhu/rZlIkBVrb2aVM3jqeBHVrUqTF3LM8puwkLqwk=; b=I
 AUky5hI6t/NfeQu11usNGUqN889IlupGziPZl5KyF7DZOoDjYcr62VZ9dx8ruv2s6Tz5uEiPNXfZf
 Z34CgpDrsEhY5hnmz3EtnGZxDpm04EtJ8m4eco4brjpR5T+Upq42cHwL9QxzUVMBWXMTgxDWECChz
 LtKp6Z+Cx3P7w794=;
Received: from mgamail.intel.com ([198.175.65.16])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v3U3e-0004aT-5n for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Sep 2025 06:41:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759214515; x=1790750515;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=y6bhctlEHXIJ1E2mysLlWBSOL2Hj3Mhq8KcQHVVuWFY=;
 b=BB3j6B8h1v2HdxJXS+CAKxFFH/9eUN9ApYlJlgSwnPcIcJeCO85IC3VD
 gq0SgayBc0DNuY1ZRZR5z26JiEoTRPkGpdjBy4vPd482T3ReTrCcYcKRt
 uGqMDICWV5IKjz8qj4k6PSNbkbUmt4mrmlwA3IfE3lMEfy1qmfuTzoMTb
 V/sHHyatGe2jb6TlyXWzq61mMnRHOePH8rL5fKFN9TRTZrbgFbgKWb0xI
 mEdvJH0G+vLVhPgHxQy5zJM95GYHoQ/aCYB8fWg7ULjmscG8SPGfZqUfd
 3hmap4FJaYU7NuOwn4jDS4ZYEM33UCpFoflTXmOIGvKfFnn42p/jgzak+ Q==;
X-CSE-ConnectionGUID: X8wrw3enRAO9Unk7UqOzsQ==
X-CSE-MsgGUID: FyL3aM4zRAiGyOvMgJknbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11568"; a="61627503"
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="61627503"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 23:41:44 -0700
X-CSE-ConnectionGUID: rsXerilWTg23gpbTUuGsiw==
X-CSE-MsgGUID: dgBj32ViSfi24GtlDIHmag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,303,1751266800"; d="scan'208";a="179211371"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Sep 2025 23:41:43 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 23:41:42 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 29 Sep 2025 23:41:42 -0700
Received: from CH5PR02CU005.outbound.protection.outlook.com (40.107.200.30) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 29 Sep 2025 23:41:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vtMaNJn+Qgqa7yNrOvtWmoRVWovpusw2EKk2ntes2PIpD2jdzTfuhv09NiSK0PJWCkZJGdv6WuznASJ7yY3IAVjfrsz2pT9ml7VQd6RcCGuPJ9CtdRgt8gKriVbhHyOI6c/vwBnwVv5ShrSxp4a4Lrz6dxUEdpr1RmeVlFLqx2UQQocLGt1cHpEEKAS/I1Rfct7DxQI8wl9Iuf9A+8+wt9EZF9LuD5GBISkBVzO/TKv7EfKbtVFgbLvT8RLlldCt/doMugCMDXdC6gWfIgLlS0IPqLWEQSbV78Bexz8kRNyiMrMCW2i5hn3h70YNj7Xs1Xv0ivbBtYKp0//6LuJLiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mcuhu/rZlIkBVrb2aVM3jqeBHVrUqTF3LM8puwkLqwk=;
 b=jU6DDcqXBP0Gj1ao5ss4stLcylHDbvuFOPiSYdsEyWhohHKll6MrzGw43RjEOafc6ClLrlEB3oHg6uFxU5zM6tIk0QbK+GG/STQln96p7mwf/B9UvPfZ9GT5htSdUAuNHbhmqIVCOWxXTjbcIc53/R5EcmiNPpgRv/WxPHT+aKR9f37W7ih+IzU3KUtZniQEGEFYtJnld1+a9Aq31rnJApPERUllIqrmRngR3fO9t6UktqHe1napmIJvcpKAvuSOwFJpJDJ30rcVeP2J7WTooOo81HutAAOrJk/JYjKMMMEF5iM1tJD338zHLumZklU9CrmvzhVnt/pkGIklktcDcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by IA1PR11MB6220.namprd11.prod.outlook.com (2603:10b6:208:3e8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 06:41:30 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.9160.014; Tue, 30 Sep 2025
 06:41:30 +0000
Date: Tue, 30 Sep 2025 14:41:20 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Josef Bacik <josef@toxicpanda.com>
Message-ID: <202509301450.138b448f-lkp@intel.com>
Content-Disposition: inline
X-ClientProxiedBy: KL1PR01CA0078.apcprd01.prod.exchangelabs.com
 (2603:1096:820:2::18) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|IA1PR11MB6220:EE_
X-MS-Office365-Filtering-Correlation-Id: 31cd1306-02e9-4700-8dda-08ddffec635a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vkhdDQsR4+fc7NuHjDSi8vv/lTed723PUKVNzO2NiJ+aeERo6sV9SJHusFhU?=
 =?us-ascii?Q?97os7w3j5fhTuXCMfrNa1eoex2o1iUs9YxhdeEXbT7aZV4PaEDCW7QhdeRLe?=
 =?us-ascii?Q?czkmrdFhm8z0bUfpNpG6z7lhG69WCsqBBQOHzmn5aAJFtUpYzxhSQE3qimy3?=
 =?us-ascii?Q?VWV3MOCgyg7eA8i0DNKy9I8bgPZBFe4vrOjgpwO9Tjq3YUwoH2EKZ46L+Nv2?=
 =?us-ascii?Q?c6NLfkuqbja+fc53EdY8TceRHVyhKoLR+8deUKAlHzDA1Kh2o0IdJmDOxzcN?=
 =?us-ascii?Q?WworyKx+p/VxOPmcflVrC1M473T1OjCCtHmbCgqLllNgU06R4OYsFR5PAMwF?=
 =?us-ascii?Q?o7LamZKJVzlrv9ohqGCVTZl4LnZd6xX6uBGUTk241PqoYS2+I6Szc1yNSdBF?=
 =?us-ascii?Q?MuNJKLTBz+mgpVa1bK67Z0QxIg7Nx3ByuO62gHeGTEk4azVMd0O02oqdhdIY?=
 =?us-ascii?Q?6dP02m29lxFpNNYRclNMuDuD4RrHo9J1BvWNLnd1ZTBTnqoqq9lYjZn/CwGP?=
 =?us-ascii?Q?a4TOIfnjJ7J1OXm6EOuoWGSXJYAVVVCzmtu/UPrF92P2WvET9mcIdN2F9tYL?=
 =?us-ascii?Q?ArKI3b9NAoiq3A07zAtWtTlh2oDutIwUe64NoV/t2zKYbjUGuQF73oxjGEoZ?=
 =?us-ascii?Q?RytpO/E8SBLgfbovCiUteD5QV9eUDkrRRo6sXvvPY4PmbjbHcwAWrNweMx9l?=
 =?us-ascii?Q?TeRE81Yw9eeA5BgCO6taxNjZv6uQu1SroYMwd0LsShvWSkNZcxlBAV65Z281?=
 =?us-ascii?Q?2m+4hms1X5lPekx25aNnjbqxEVLdD9XrWNxLuegoY3Od+JGX+mhDyDOhKq/6?=
 =?us-ascii?Q?XRUELYkDiZ+ThzkB1sBvzQwWhDs/MJ3cO+p9EBuV5wWmQTBCzoQopU1oWjGJ?=
 =?us-ascii?Q?FQHs4Xpl6cFQYfJCDBazJpMKWsMs9hL8ZnPZhPe/gf69+7dK33GRRA02jkeI?=
 =?us-ascii?Q?hrcLe7eh87a0CNlb+7B/8K5SREcaWUsMiXXM9oyAgpibAhh5aTgsp9pgkzEB?=
 =?us-ascii?Q?Yawasnhdh3gH2ajGZBR+wEU0WYy1xPnEgkTkHCU1NsCru9gHa597UrZWcWdY?=
 =?us-ascii?Q?xEJfnBBWiniyfiVo19qTFOWp17TCvBTyP7W7daENFLnbjooiQJKj9FrwX45+?=
 =?us-ascii?Q?bpyUhbKRX+jdMHcS6HlJTKTTO+aOpg9gfn20SDq+HaDqGEmBP1Px1H2y1ujE?=
 =?us-ascii?Q?ns3QlMZ6TAKnGaswYEZvVd5gNFbomGfGZiVYVMyp7HaeauWQbXR1pLJAAdcQ?=
 =?us-ascii?Q?U+SwUdwT0RR++8/ir7oPYDXmHR+iGFmXLE1vwLMbQm8UMDlFHWhA6nHibI8R?=
 =?us-ascii?Q?RDpldoy/Pfv0bQm9FLU8fuzKzqb+attxwkF0fi6IZ8J9jGteLcqPqgzDhL/X?=
 =?us-ascii?Q?8flq7FmL7HJPA/6SPkjE8UZ5/0eBMdy16PEAnjcc8/Cn0gZyvg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KiWqLzjEsHuH51WNhQmjHYXH4u6dIjVtRxN9CjWC+c2lxOyIeK1z7l3XgHR7?=
 =?us-ascii?Q?O3iqSLH0jVufjlWfU7RYT2eOyQiBNyCiavfo8I7BYmNtKFcGuLu3jUzvF1am?=
 =?us-ascii?Q?Q5XNXmgkOGJ1nJkKHUPSLmWmJ5cYoAbQ/UCSw+1FlAIErYGsB/+4irEk+fUE?=
 =?us-ascii?Q?4WufBB2/E6D+8KvdNaGQ9KB0V6z+AKNl5BIlJQyYl9bqPz/1NCwZlh0eISyW?=
 =?us-ascii?Q?EBeRFz1LJo38+BnDRad2TDfyVEHqeE2ixOr7thWH1hMD1Y5V2H9zsdxyXJlU?=
 =?us-ascii?Q?gRcPkZmr9odGmxxq9Vx1nEIa3xA9T2Ggm4mivZ/A5OKuz94TMEy7GvvAhrwR?=
 =?us-ascii?Q?/UL0u52aM6MKdUmY9ox+DVrUHgdpfVJH8HPG5BuVmM0Wag1/xo7OhXGLHNBp?=
 =?us-ascii?Q?utOsCF8+LIyGTlHYqRciKgE5ZzEI6+83Rd/ey9aMA+mRB6oxCkJX9zYxyUo2?=
 =?us-ascii?Q?Hdn8I41tjJvHQuEfmAS+QR1Jkl6WTID+1k2wHExDIw3qMwLf4SVuF/CKm4sr?=
 =?us-ascii?Q?gPlFCiXLhKIloI+rgu9iRP/vnKfeTd7h39FYjjzR7y3de7VfgrucB+iOFtfe?=
 =?us-ascii?Q?H4MDhhXVP8X1SfZDXfLlUEGGqpMnMrqhR7uq4QWY/JPVZ2rMj7+qJE1MLTFr?=
 =?us-ascii?Q?UbEh0kISqJPppAtWWu81jrpKrOkjdgT6iuRlqUbVXVV7i7rALt4fml9xu0Mo?=
 =?us-ascii?Q?1V0bAaSGXVzMfcGJkEicY8iaVGWP5pUeB3r7lQ4w30y54Ya+oxTWHnoH9tEt?=
 =?us-ascii?Q?jsnLmx5MPi3DOGTWKPDVrjd8bHjJjHtxoq0jkzA8X7uONGyu1FCfMBPBG+uz?=
 =?us-ascii?Q?HTg3I+DYekiElgbk3fhHLfFnUJBA1SyFMWpTl3UnjuKENKTHymb2Salrp1AV?=
 =?us-ascii?Q?khwzftQyjZcZ1bN1L0g1jM/tqNOP9ocKkTKlkaexoVaKbk+/pgWv88aLEQcy?=
 =?us-ascii?Q?CqN89AbicVJLknt4JAgPudBtNV47uHBHLm/d9asfKRHe7w/Ws7oAePGILz39?=
 =?us-ascii?Q?nquBHg+GeZm9gFi5Y1JU70fwN5iqGlzfT+Dd4NiOMA/OkBLBanxxoj2DETTa?=
 =?us-ascii?Q?W2ELGgw/IHWHGdkrRFGpTD605j8VcFuQ0TWecI2RSSWqIM5HQyk8y6/+4IUj?=
 =?us-ascii?Q?xO32hsMSOCelGXb+oY1I/lp/aF2AzjjggSgOLldtxnlG5PN0PgA932XZm3kt?=
 =?us-ascii?Q?M4yjhlwuhSaLQNqrKjscBe3YXy+n5Taof4qh5bS6yrM8IeYIGXWPdWmIt3qp?=
 =?us-ascii?Q?9s5Yw5oHrb9zm+33IY7gVsZJgXUaXIgyRHBO15IvHCmJSdVWJ/+vpNeOQwvd?=
 =?us-ascii?Q?VtdM5x4/HJJic9dunywmz75BeLOlsS5jt9adzx2b5XBqTGL1fj91tyPFxrpp?=
 =?us-ascii?Q?fTgvO6kDdZXZTF4+vKmyh244EcEIqPFMXDYYZWCX9t/6QWorB0zTFQxKOfcm?=
 =?us-ascii?Q?WNIAPnaNrvLQB4XOUW5YUtdA0Z6SfXglH8euKuhf+XP7LIBGiaF1Wzhtzz9z?=
 =?us-ascii?Q?AMhLZR/wWTamJOtOySSNNBDhTQmty1uyWOoz33YXlA+Kadc3ziacjxnkMHV2?=
 =?us-ascii?Q?A0YsKtTggxs027+FQ06aF4MmsZM2P1p+DEQsPpyaTGjR5DXUcPqKMIW1Lynp?=
 =?us-ascii?Q?lA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 31cd1306-02e9-4700-8dda-08ddffec635a
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 06:41:30.1810 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zRfF0OCOdUClXBhZ+WXkeOzSP2GcRsP5n/8PI5J4UD90OuYeuCZ1HkdpitHLFvZQP7IjyI6WM2Oyu+jhNAZvVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB6220
X-OriginatorOrg: intel.com
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 kernel test robot noticed "Kernel_panic-not_syncing:softlockup:hung_tasks"
 on: Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v3U3e-0004aT-5n
Subject: [f2fs-dev] [linus:master] [fs] bc986b1d75:
 Kernel_panic-not_syncing:softlockup:hung_tasks
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
Cc: Christian Brauner <brauner@kernel.org>, lkp@intel.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 gfs2@lists.linux.dev, oliver.sang@intel.com, oe-lkp@lists.linux.dev,
 ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



Hello,

kernel test robot noticed "Kernel_panic-not_syncing:softlockup:hung_tasks" on:

commit: bc986b1d756482a5ec2d7d9625229d9b9df95ae1 ("fs: stop accessing ->i_count directly in f2fs and gfs2")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master


in testcase: ltp
version: ltp-x86_64-220f579cd-1_20250920
with following parameters:

	disk: 1HDD
	fs: f2fs
	test: fs_readonly-03



config: x86_64-rhel-9.4-ltp
compiler: gcc-14
test machine: 8 threads 1 sockets Intel(R) Core(TM) i7-4770 CPU @ 3.40GHz (Haswell) with 16G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202509301450.138b448f-lkp@intel.com



watchdog: BUG: soft lockup - CPU#0 stuck for 22s! [f2fs_ckpt-8:17:5378]
Modules linked in: dm_mod f2fs binfmt_misc snd_hda_codec_intelhdmi snd_hda_codec_hdmi btrfs blake2b_generic intel_rapl_msr xor intel_rapl_common zstd_compress x86_pkg_temp_thermal intel_powerclamp raid6_pq coretemp platform_profile i915 sd_mod sg kvm_intel snd_hda_codec_alc269 snd_hda_scodec_component snd_hda_codec_realtek_lib dell_wmi snd_hda_codec_generic intel_gtt dell_smbios snd_hda_intel kvm drm_buddy dell_wmi_descriptor snd_hda_codec sparse_keymap snd_hda_core irqbypass ahci rfkill ghash_clmulni_intel ttm snd_intel_dspcfg drm_display_helper rapl snd_intel_sdw_acpi libahci snd_hwdep i2c_i801 dcdbas mei_wdt intel_cstate cec lpc_ich snd_pcm i2c_smbus libata drm_client_lib intel_uncore mei_me snd_timer pcspkr drm_kms_helper snd mei soundcore video wmi drm fuse nfnetlink
CPU: 0 UID: 0 PID: 5378 Comm: f2fs_ckpt-8:17 Tainted: G S                  6.17.0-rc1-00015-gbc986b1d7564 #1 PREEMPT(voluntary) 
Tainted: [S]=CPU_OUT_OF_SPEC
Hardware name: Dell Inc. OptiPlex 9020/0DNKMN, BIOS A05 12/05/2013
RIP: 0010:native_queued_spin_lock_slowpath+0x704/0xad0
Code: 66 85 c0 74 39 48 b8 00 00 00 00 00 fc ff df 49 89 df 49 89 de 49 c1 ef 03 41 83 e6 07 49 01 c7 41 83 c6 03 f3 90 41 0f b6 07 <41> 38 c6 7c 08 84 c0 0f 85 5d 02 00 00 8b 03 66 85 c0 75 e6 89 44
RSP: 0018:ffffc90001a4f890 EFLAGS: 00000202
RAX: 0000000000000000 RBX: ffff88810d440080 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000002 RDI: ffff88810d440082
RBP: ffff88836da42200 R08: 0000000000000001 R09: ffffed1021a88010
R10: ffff88810d440083 R11: 0000000000000000 R12: 1ffff92000349f14
R13: 0000000000040000 R14: 0000000000000003 R15: ffffed1021a88010
FS:  0000000000000000(0000) GS:ffff8883e693e000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f99f429e0f0 CR3: 000000041b872002 CR4: 00000000001726f0
Call Trace:
<TASK>
? __pfx_native_queued_spin_lock_slowpath+0x10/0x10
? __pfx__raw_spin_lock+0x10/0x10
_raw_spin_lock+0xca/0xe0
? __pfx__raw_spin_lock+0x10/0x10
? __pfx__raw_spin_lock+0x10/0x10
igrab+0x19/0x90
block_operations+0x4b5/0xdb0 [f2fs]
? __pfx_block_operations+0x10/0x10 [f2fs]
? update_curr+0x3fe/0x550
? down_write+0xc0/0x140
? __pfx_down_write+0x10/0x10
f2fs_write_checkpoint+0x1fe/0xf00 [f2fs]
? complete+0xb9/0x200
__checkpoint_and_complete_reqs+0xe1/0x310 [f2fs]
? __pfx__raw_spin_lock_irqsave+0x10/0x10
? __pfx___checkpoint_and_complete_reqs+0x10/0x10 [f2fs]
? prepare_to_wait_event+0x8e/0x720
issue_checkpoint_thread+0xc1/0x230 [f2fs]
? __pfx_issue_checkpoint_thread+0x10/0x10 [f2fs]
? __pfx_autoremove_wake_function+0x10/0x10
? __kthread_parkme+0xb1/0x1f0
? __pfx_issue_checkpoint_thread+0x10/0x10 [f2fs]
? __pfx_issue_checkpoint_thread+0x10/0x10 [f2fs]
kthread+0x39b/0x750
? __pfx_kthread+0x10/0x10
? __pfx__raw_spin_lock_irq+0x10/0x10
? __pfx_kthread+0x10/0x10
? __pfx_kthread+0x10/0x10
ret_from_fork+0x24c/0x310
? __pfx_kthread+0x10/0x10
ret_from_fork_asm+0x1a/0x30
</TASK>
Kernel panic - not syncing: softlockup: hung tasks
CPU: 0 UID: 0 PID: 5378 Comm: f2fs_ckpt-8:17 Tainted: G S           L      6.17.0-rc1-00015-gbc986b1d7564 #1 PREEMPT(voluntary) 
Tainted: [S]=CPU_OUT_OF_SPEC, [L]=SOFTLOCKUP
Hardware name: Dell Inc. OptiPlex 9020/0DNKMN, BIOS A05 12/05/2013
Call Trace:
<IRQ>
dump_stack_lvl+0x47/0x70
vpanic+0x1e4/0x480
? __pfx_vpanic+0x10/0x10
? show_trace_log_lvl+0x2a4/0x2e0
panic+0xbc/0xbc
? __pfx_panic+0x10/0x10
? ret_from_fork_asm+0x1a/0x30
? add_taint+0x26/0x70
watchdog_timer_fn.cold+0xd0/0xe4
? __pfx_watchdog_timer_fn+0x10/0x10
__hrtimer_run_queues+0x2c4/0x660
? sched_clock_cpu+0x68/0x520
? __pfx___hrtimer_run_queues+0x10/0x10
? ktime_get_update_offsets_now+0x82/0x320
? sched_clock+0xc/0x30
hrtimer_interrupt+0x2ce/0x7c0
__sysvec_apic_timer_interrupt+0x89/0x230
sysvec_apic_timer_interrupt+0x68/0x90
</IRQ>
<TASK>
asm_sysvec_apic_timer_interrupt+0x16/0x20
RIP: 0010:native_queued_spin_lock_slowpath+0x704/0xad0
Code: 66 85 c0 74 39 48 b8 00 00 00 00 00 fc ff df 49 89 df 49 89 de 49 c1 ef 03 41 83 e6 07 49 01 c7 41 83 c6 03 f3 90 41 0f b6 07 <41> 38 c6 7c 08 84 c0 0f 85 5d 02 00 00 8b 03 66 85 c0 75 e6 89 44
RSP: 0018:ffffc90001a4f890 EFLAGS: 00000202
RAX: 0000000000000000 RBX: ffff88810d440080 RCX: 0000000000000000
RDX: 0000000000000000 RSI: 0000000000000002 RDI: ffff88810d440082
RBP: ffff88836da42200 R08: 0000000000000001 R09: ffffed1021a88010
R10: ffff88810d440083 R11: 0000000000000000 R12: 1ffff92000349f14
R13: 0000000000040000 R14: 0000000000000003 R15: ffffed1021a88010
? __pfx_native_queued_spin_lock_slowpath+0x10/0x10
? __pfx__raw_spin_lock+0x10/0x10
_raw_spin_lock+0xca/0xe0
? __pfx__raw_spin_lock+0x10/0x10
? __pfx__raw_spin_lock+0x10/0x10
igrab+0x19/0x90
block_operations+0x4b5/0xdb0 [f2fs]
? __pfx_block_operations+0x10/0x10 [f2fs]
? update_curr+0x3fe/0x550
? down_write+0xc0/0x140
? __pfx_down_write+0x10/0x10
f2fs_write_checkpoint+0x1fe/0xf00 [f2fs]
? complete+0xb9/0x200
__checkpoint_and_complete_reqs+0xe1/0x310 [f2fs]
? __pfx__raw_spin_lock_irqsave+0x10/0x10
? __pfx___checkpoint_and_complete_reqs+0x10/0x10 [f2fs]
? prepare_to_wait_event+0x8e/0x720
issue_checkpoint_thread+0xc1/0x230 [f2fs]
? __pfx_issue_checkpoint_thread+0x10/0x10 [f2fs]
? __pfx_autoremove_wake_function+0x10/0x10
? __kthread_parkme+0xb1/0x1f0
? __pfx_issue_checkpoint_thread+0x10/0x10 [f2fs]
? __pfx_issue_checkpoint_thread+0x10/0x10 [f2fs]
kthread+0x39b/0x750
? __pfx_kthread+0x10/0x10
? __pfx__raw_spin_lock_irq+0x10/0x10
? __pfx_kthread+0x10/0x10
? __pfx_kthread+0x10/0x10
ret_from_fork+0x24c/0x310
? __pfx_kthread+0x10/0x10
ret_from_fork_asm+0x1a/0x30
</TASK>



The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250930/202509301450.138b448f-lkp@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
