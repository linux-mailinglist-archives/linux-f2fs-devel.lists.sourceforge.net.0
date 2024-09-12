Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA54976B2E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Sep 2024 15:51:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sokDn-0001wv-Om;
	Thu, 12 Sep 2024 13:50:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <oliver.sang@intel.com>) id 1sokDm-0001wn-Cp
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 13:50:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Message-ID:Subject:CC:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gdiWKXHaiRAJBgJUJXf0+Xmp3F1qi8WjplIXxmhEFTE=; b=aGWnh3iUHhnWn1sLADJmLIIKbq
 dliw+x4nR64fxjmpYh5jORtLfknBQBJbajbJDaO53w+tCMLQqNG+5PrdFX+V3H4j5IvHlUAAJSegn
 mIRz1l1IB120eF/g3CN97UdIzJ7Q/k47n7CyAQpU7t3dAXkzWKzxNRbPRl09ConuFwsE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Message-ID:Subject:CC:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gdiWKXHaiRAJBgJUJXf0+Xmp3F1qi8WjplIXxmhEFTE=; b=g
 PmxUKvbyT6APP1xmXvdJI5Y7i2LazbzQhPDN6BLUBV4myINPxag3r657rAY8xQj8KlAoFV2GQ3tMs
 2aeNcDEjCdR8Ey4dNCInHXxpvwxC1FyJipxme9noOwGsMHQx1C9aZLHLLwtXEmUY0FEfXnlheKeWr
 iHmWvKLIWAGJCLds=;
Received: from mgamail.intel.com ([192.198.163.7])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sokDi-0001Rd-Tt for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Sep 2024 13:50:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726149051; x=1757685051;
 h=date:from:to:cc:subject:message-id:mime-version;
 bh=K6w+GpA0+Ik6stG3vjJ+8HD8EDJID1/2FOXUXJyf6Fk=;
 b=G/1xc1LNuCDVV2EpGB59574kpc+2uiURYHyMuxKhUcpGxmAq5DKpLtfb
 cKKzu2qk7OgXZgbNOedRUG8tfK9xn4ZfmEVtuQ1AdgUC5aHvmIY7Ihk9c
 jiaorJIga9h4tuT6UJjclT08dz0Sh2AkIbFgz28CU6YhkO2PSQ6fp9H4r
 /hyUKE9xzQ3MAnS2zYfQ5Wui+yaH7rYxtZPNdhku5IFKYRN0uTgC7q3U+
 nv6MDrmiba6hqk2TEzDyvMbksD/pVa9ouIkugi4DGhkCijPhDxx+bNR5W
 /bY6Q/7Q8wvFUkfxtXdt9h0JegrnpHvpex0Xa/Y6Yf/s6rH7MZie5wn1j Q==;
X-CSE-ConnectionGUID: Ma8YfOc9Tpm2JktrWoDXtw==
X-CSE-MsgGUID: OPa/pnK3TOG1xcsjqozLww==
X-IronPort-AV: E=McAfee;i="6700,10204,11192"; a="50418231"
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="50418231"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2024 06:50:40 -0700
X-CSE-ConnectionGUID: 3Z/W/rG7Qda+PPz6eXfr9w==
X-CSE-MsgGUID: tPHZ35RCRiOtRD2xnw4u8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; d="scan'208";a="67947239"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 12 Sep 2024 06:50:35 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 06:50:23 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 12 Sep 2024 06:50:23 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 12 Sep 2024 06:50:23 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 12 Sep 2024 06:50:23 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rtkZsmx+c6N48ks8Cv0ewQgW2wEoxLLiqNun4DRYggAll39Cep9l3Bf0t82Zk8gLViUAkugvn64z/CMsmRE+5hdx9I3Ps8KwlMPMiCxITXQ9frgZRdftzGA55Afo3MaVu9wRYOoVkaZo1UlCq4CwgoSXYIUdotWqybZ1PAHyow3dxRNq8pX+K4cP7QCdSHgAIV/ICAdV1QG+yn0SlBUetdKxy+IGuSP6xPlN9Y6EbxVAtXIbmd0iycpOx/7WfjaORGQeUMvIzNvv4tNFoQ9QDFEo4s9I8U26W01zG+Ee2LrVhXpgaeaL/K53cOi3dETkyHVYs4nZR9AUHfgGco0qVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gdiWKXHaiRAJBgJUJXf0+Xmp3F1qi8WjplIXxmhEFTE=;
 b=aIx2gmTJmwNFtvcWPpcSqnLTIfOAlOQetyqG4yqpYG1vdhHosIHo0nLuW14nLqBGaFvHi8iIBheZW5j8GlWCsGfA+Fr7yKoe2sBBhKt9MHVYLV+JFP9P4XIh7us+Ha1JIUj6WTxTo6d5g3pqV+7ZwcxihCYFO0XGTNfqpdWdGWbQhjda0rW/kC03aKCaqDlb6k1XpzLpEbsMXDGSxwO4ikTzZIbJvUTWCDflPLHpYQAz0FVHUcsQ6z35EnYr9y2A0CWwCepr3vum7jqhZGnFtlm1RpyoBf2oqUSRj5ZpJYLZJCqIQPDGvSHI4EVjHGX5hXD1NM/SetjVlcPQrtYe8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by LV8PR11MB8512.namprd11.prod.outlook.com (2603:10b6:408:1e7::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.18; Thu, 12 Sep
 2024 13:50:21 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.7962.017; Thu, 12 Sep 2024
 13:50:20 +0000
Date: Thu, 12 Sep 2024 21:50:10 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Chao Yu <chao@kernel.org>
Message-ID: <202409122131.d6e2f8c1-oliver.sang@intel.com>
Content-Disposition: inline
X-ClientProxiedBy: SI2PR01CA0054.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::22) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|LV8PR11MB8512:EE_
X-MS-Office365-Filtering-Correlation-Id: fe3f8a6b-757f-40a0-4de2-08dcd331d744
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MH9jeTAmvf2jPWiEfetjED0+xHjc5XCSQFyTDJ0KiyHtdeJFYZd8Lx2eNQt1?=
 =?us-ascii?Q?Sn8sJ8Ro807vsu39Ezrrt+Tiv+2LMq8iKTOR5Lps9r3fkAFO+GWATHuTNkny?=
 =?us-ascii?Q?rPOhvZF/oOwXkSPGA9fQKEH0uGz+mV6W2bQ2JjXNcjs/CG/zpFjey86SkdSh?=
 =?us-ascii?Q?sIfsG+khHB7I1UXe48xMvBv/cNtfPtjGI8F1TQHRxrRJi/OlAn4gOvzbbxWr?=
 =?us-ascii?Q?guu6Ec3DCQdI1sewhHD0wWTFYTnXo7Yv3/HCSGKaZ7dinu2lPD65OrQY023x?=
 =?us-ascii?Q?xuzxMHfYj6QDoG5nfVdxzRq/7keJ2gGIh88/XuAg+GU2yH+JeBxd/SfSnWeV?=
 =?us-ascii?Q?3y/5eftl4NlRd+hu0GTHHYFGPPyXpaUXu6Db4qssDCWYwLMG+hADIXjmV5yx?=
 =?us-ascii?Q?USXPxkIqhZBafDrO0rZ1Qg5Zw40h3z7Ni9XetdnRZJR+QoeCILp7odPSffIW?=
 =?us-ascii?Q?QXqGyihLY97C5a/WpLKPVyZhxNEVfTwxvFgy2RD/GHht4eZbip7ZzMNb6Xea?=
 =?us-ascii?Q?32PngkrO2Im3TYn6rgx7HYMhIbwOQ3hJZbAzWZkrCK2Qmr9Lk3pkA05Em7Ws?=
 =?us-ascii?Q?tGvD9PhQuflKs3yf+QuuT2QP1xVaUQSPeH5kVFbBf50sx9oGIZnoBs/GPnxw?=
 =?us-ascii?Q?I+KkkMli8cBa/SivX97SujudUCltc2fpaGL/PtQjudPJkVhq336rUkL4X5GL?=
 =?us-ascii?Q?RZpqMeD/SBqwwALSz5sBlZwGNcTxKYei+npPq+dxyUmfBdi+ScSPbhNCDf2F?=
 =?us-ascii?Q?Z3dBElE81xsH4yKhsMKWngKjn42CYqzJQ9WRcgZcTd2ugAsqPNSNVPwk91TA?=
 =?us-ascii?Q?/KzvMp7V8TLhGfxQlSXc4jgCBVxAtaJfal+8q/k0bzFsZ/x7h20JuedW3l2i?=
 =?us-ascii?Q?mV3uMpSIobvE8St0oT0+spZZLOaqKI/1Ov8QJORpkcd+eUEuqdg9ukW4VOsH?=
 =?us-ascii?Q?/EJplCwV4bNwJgrPty0DKO7ky9Db2hJj5TIpvlLotP82KU/Iy77h5JRQHlQl?=
 =?us-ascii?Q?sf6KsEWBHk6TUdRPQ6DKwTOcc56YDaVgOsXKlnmL+Bf+c09kRBh6eo6DHEv3?=
 =?us-ascii?Q?oliOlm4hdgp9C5C2NTz7CKV4bFTIqihKymZBkQmHcuIRlUx8FmJ+FDGv9S80?=
 =?us-ascii?Q?q/LGKf1Zyffg9VzWKIyAJZjYzZsBEj6xJc8bzHuTv8DjGuf4/DoUP1UQpZE+?=
 =?us-ascii?Q?945EjvsFnEI9GxBm6acT78Ez+YPtzZGxqgJLKEXK3n4laoMrrsybkoUafkRz?=
 =?us-ascii?Q?yMd5orHDaJO6cnshfkHubY3vkByA7oUWkmG1WzvH+8zSuQnfkd78hgHvL7Ub?=
 =?us-ascii?Q?4rVzWkjqWp/xuLT79NtJvuZ/GWkv3Uj+wn0nbEab0ndOqzj/9TD+/o5YCYrA?=
 =?us-ascii?Q?7M7fKFU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LeKwaBKOpxgFIj0LpiQXMXtI37rCEk5RDsSO7tPhyGC8e4KnZE46d/g/QyYI?=
 =?us-ascii?Q?+H1ilWlzjcdOKsO5YWUCVBjy4PLBjul+ZcQZ6pSveopkgivOkrcaYIKzmUAN?=
 =?us-ascii?Q?JRziZMUzykOpy1fbSgxV0ZInsURRG+mKpxIJDYyuvRv4v0YxUK/Qcv/mSD/7?=
 =?us-ascii?Q?xKLgzGkhpEMERNrkggV8Rp0IBRl5YHaIVlb96rh2SGVYStESv4+MKjXrWd9E?=
 =?us-ascii?Q?sZc3N6GNhaPuvEQ8dxAH5OYan4BAyXU2gts+c3I7lmhcmKuPYpIuyyyKqf92?=
 =?us-ascii?Q?EfZ55TKR0vIApWpJpnj42iSHTZj9y7ZFSHsGxq0BkeCWhSPDvkiK8eL85GYn?=
 =?us-ascii?Q?7dyQf6ccfbWyG8T2fAb5WUcd2MnYtEgvvOBUQLnWH6Yy+NBSGNjXKyUGcm6U?=
 =?us-ascii?Q?2RHGc0wdPLZBrffy0PN6mWulkj32pnNrj2p8LzHkFpw1HhfuyYloSJsxBg2q?=
 =?us-ascii?Q?aZcyK9w3LpHCjfVN+WYBRd++sgr8pTsdpjEosvN/KlmepFdw0rgN2c4OXL0V?=
 =?us-ascii?Q?iIU/dP7EzrzwnaYFC6kt9eg1ElETSIa2Xv4c7AEr8qeC7b9StK3T7s1jwhjp?=
 =?us-ascii?Q?COK45alJXxFCf96UBIZrnGPbtdgqG8J3hILuT7NMtxBvC33SIdvTFwz84gPK?=
 =?us-ascii?Q?72YQhM9Jpf/yQwWNeD4EvNB0vPh/DKlXkggG2P0ujUWvOA5a8FV956OOXNet?=
 =?us-ascii?Q?ttD4hCP2vqe6sIFB4mZ8gcXdiNPjwipZ8zikVK9mzvh4J9JUbdIEJoEz1loa?=
 =?us-ascii?Q?lT6kxLJl0R2p+qYLa9Z2YqjlIuFVxx6Np9A3fvKUb6uAbwPGBt/jQlPcGfSd?=
 =?us-ascii?Q?Pya1G8u86ogESkkhf9hY8jhoBbGkpVzNuIM4lbVIiY/tfLU0JDwrEwgJH6FF?=
 =?us-ascii?Q?+72KtkoZEp3NwQRW8P0qhvoajrWcRRR8UG3tnA75QTmtOmtQX/xd67Fl/i82?=
 =?us-ascii?Q?EYHOYXOks9wMg5cwn8/LYhdFQ6JnRNdrrMZt96Rr5PCMqwEsokj0JPgL82YS?=
 =?us-ascii?Q?pbPuEJWUJj8jZra5y3NxI7mtRS2Nah6m22CdOqN1OpXezUQuLZkws7KdgA7j?=
 =?us-ascii?Q?n7E0rQhQacvuTV6v5ZIklJtny1vO0J307J0gfq51j9bIxdRSES6zaJkTm1RN?=
 =?us-ascii?Q?Iv4PRDPPht4/9naYNtNfBSJeqGGlT49hr21rZdf0hslUS5CJx1C4QBI95fMq?=
 =?us-ascii?Q?5qpws5n/kiJXOQ+GCybzLGHkfAy6k9O2G8xv5jpAn+KC9ZqNAfYjFh05qBus?=
 =?us-ascii?Q?ENIonLoHSHdmDjKc9eysjtk6Pa3Q8Wp0pbgnsWP7756/AhuMeswXe6ALThBN?=
 =?us-ascii?Q?X5EacW9Qdh6fEaS/nvBoz+92kT7DyLUkCz+DIZFzL26vAfHFAfPcmKLBsJWg?=
 =?us-ascii?Q?tujve+ZySvqVMGOw1zGzHpdqfyKYG698Gh/nXD79swYhZ8SNdySf6I9dR5qG?=
 =?us-ascii?Q?TeEqA1C86s4DyxWbceaMTOlJFVN4/WAxB6/JwHWdD8aoSuSvVPPWe2v1U4e8?=
 =?us-ascii?Q?CYU+bxLNF9tGmoqVNNuRB242KOqpnvfkgWD9aISUcIxCiUiJ8u5700PW+Vye?=
 =?us-ascii?Q?DCmOnRvnVuPPEZ0Um7oUZrktWgcx4ls6lXj81bM9o5f6tFkY5Ep4tZAwazDh?=
 =?us-ascii?Q?ww=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fe3f8a6b-757f-40a0-4de2-08dcd331d744
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2024 13:50:19.9464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +PJQO65wDo9guGXv9ELSiUbi15Y9dhzSkkuRDuy47h2OhoFHzheFVEzZg0HKVXzU4vW6KBfdPioPEHyZApV3kg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8512
X-OriginatorOrg: intel.com
X-Spam-Score: -1.4 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello, kernel test robot noticed "xfstests.generic.091.fail"
 on: commit: 5c8764f8679e659c5cb295af7d32279002d13735 ("f2fs: fix to force
 buffered IO on inline_data inode")
 https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git
 master Content analysis details:   (-1.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.198.163.7 listed in list.dnswl.org]
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 1.2 SUBJ_LACKS_WORDS       Subject is not short yet lacks words
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sokDi-0001Rd-Tt
Subject: [f2fs-dev] [linus:master] [f2fs] 5c8764f867:
 xfstests.generic.091.fail
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
 linux-f2fs-devel@lists.sourceforge.net, Barry Song <v-songbaohua@oppo.com>,
 oliver.sang@intel.com, oe-lkp@lists.linux.dev,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



Hello,

kernel test robot noticed "xfstests.generic.091.fail" on:

commit: 5c8764f8679e659c5cb295af7d32279002d13735 ("f2fs: fix to force buffered IO on inline_data inode")
https://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git master

in testcase: xfstests
version: xfstests-x86_64-b1465280-1_20240909
with following parameters:

	disk: 4HDD
	fs: f2fs
	test: generic-091



compiler: gcc-12
test machine: 8 threads Intel(R) Core(TM) i7-6700 CPU @ 3.40GHz (Skylake) with 28G memory

(please refer to attached dmesg/kmsg for entire log/backtrace)




If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202409122131.d6e2f8c1-oliver.sang@intel.com

2024-09-11 03:13:26 export TEST_DIR=/fs/sda1
2024-09-11 03:13:26 export TEST_DEV=/dev/sda1
2024-09-11 03:13:26 export FSTYP=f2fs
2024-09-11 03:13:26 export SCRATCH_MNT=/fs/scratch
2024-09-11 03:13:26 mkdir /fs/scratch -p
2024-09-11 03:13:26 export SCRATCH_DEV=/dev/sda4
2024-09-11 03:13:26 export MKFS_OPTIONS="-f"
2024-09-11 03:13:27 echo generic/091
2024-09-11 03:13:27 ./check generic/091
FSTYP         -- f2fs
PLATFORM      -- Linux/x86_64 lkp-skl-d01 6.10.0-rc3-00027-g5c8764f8679e #1 SMP PREEMPT_DYNAMIC Wed Sep 11 10:37:47 CST 2024
MKFS_OPTIONS  -- -f /dev/sda4
MOUNT_OPTIONS -- -o acl,user_xattr /dev/sda4 /fs/scratch

generic/091       [failed, exit status 1]- output mismatch (see /lkp/benchmarks/xfstests/results//generic/091.out.bad)
    --- tests/generic/091.out	2024-09-09 16:31:23.000000000 +0000
    +++ /lkp/benchmarks/xfstests/results//generic/091.out.bad	2024-09-11 03:14:07.468026185 +0000
    @@ -1,7 +1,55 @@
     QA output created by 091
     fsx -N 10000 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z -R -W
    -fsx -N 10000 -o 8192 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z -R -W
    -fsx -N 10000 -o 32768 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z -R -W
    -fsx -N 10000 -o 8192 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z -R -W
    -fsx -N 10000 -o 32768 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z -R -W
    -fsx -N 10000 -o 128000 -l 500000 -r PSIZE -t BSIZE -w BSIZE -Z -W
    ...
    (Run 'diff -u /lkp/benchmarks/xfstests/tests/generic/091.out /lkp/benchmarks/xfstests/results//generic/091.out.bad'  to see the entire diff)
Ran: generic/091
Failures: generic/091
Failed 1 of 1 tests




The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20240912/202409122131.d6e2f8c1-oliver.sang@intel.com



-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
