Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E0A98ABB437
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 May 2025 06:51:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:To:From:Date:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YckOOyPFrVTPIewFa2AAR8Wm9e2K5dRh+a8mAI5TCSg=; b=K9FdJpqw57trwjhdJOx9KgXBAb
	DX8hjFEBNtjPrjbj06loAGGaUaK9Zgg0f+maJsN4v5Fi+kHtI2ySZb7Ynn36cbiaL6jprqFS4niPR
	9xnVgLkuvX6mwbao8sifr4lCTTs1ekrbULRq6xeCzJ5LBJWoH2PDFuqmCLaq3U3zF3NU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uGsSl-0008PX-63;
	Mon, 19 May 2025 04:50:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <oliver.sang@intel.com>) id 1uGsSj-0008PQ-5E
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 May 2025 04:50:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0XMYpFdujNrblD6GhuohZnh5UPafZSsSuM+BU3yXjMk=; b=HS0X1kLp0zI8ukOT5agbghC6ia
 0w+XpYlwMICKIVsCeUiJloLEeNP0pUUwBuKmZQ/qYQasetps8HpbyG3ktO3t+TMslGjO6aj9EgaTm
 CC9QMM/vLNSxDXnXuSPl59T+nK8q/nwjU4Xz81ncexAtZF1NpnlSPAh8xnA8DeJLvqYQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Subject:CC
 :To:From:Date:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0XMYpFdujNrblD6GhuohZnh5UPafZSsSuM+BU3yXjMk=; b=G
 VrMUpNGZ9CcVIj5MKYgNWOmueINeNwgxQwBceXhZA7u2Pyrc/ih0HOL5Q396TYVIZBKxVrVaO0iAj
 YYQ9aQLl3tv48QDarirBItWxkvRw3XlS/q1gZH/bZg6YAz8smlsygyNlg64I6vG20g9YMfKN+VSSZ
 6tMhlZtYgNTF6SmQ=;
Received: from mgamail.intel.com ([198.175.65.13])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uGsSe-0005M3-Tt for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 May 2025 04:50:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747630249; x=1779166249;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:mime-version;
 bh=dqcjn+/8R67lrTk3c7rghO83CQLTDO5/lO1dzP3n9hg=;
 b=CROlmVnA+GLll7kLMNuE2lYMXSUJRmz/PCVMLWSjjNPgc+Rty5dYRv3a
 p2Szjoit6ysXB4vIMrI97zzPfSqOC4wLeMQXrg7np2r13HFdgk12+KmcZ
 /XGsTlSdH6Zx3ikFtPDW3xSCienPg7BRCS48wVEgAsdmImIkjwB1DxBof
 ivMsM348YEjrPaxz9liDp48U6Wj1PUWKqK61NOQFkQgxrQgcRafgLBwrH
 UTjldk6CvKWD3TVN0jczoY0TiNuIvQIyzEOUX2968TLvTCt44Y3yEX1hS
 xURNunyoBKJYAY+dKgKxNmDldr8WUrwzuuhEBRz6+bdckUUleSPUQ5HGq Q==;
X-CSE-ConnectionGUID: 8eX7yuUySVSzI8mh4SpLVw==
X-CSE-MsgGUID: t+6vFKb/R5ifys/p/rGG9w==
X-IronPort-AV: E=McAfee;i="6700,10204,11437"; a="60545079"
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="60545079"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2025 21:50:38 -0700
X-CSE-ConnectionGUID: R1wvr1zkRlCtx3lXGAWjXQ==
X-CSE-MsgGUID: xkqw3guDSQ21waDnCHCplg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,300,1739865600"; d="scan'208";a="139668351"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2025 21:50:36 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 18 May 2025 21:50:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 18 May 2025 21:50:35 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.170)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Sun, 18 May 2025 21:50:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AbxdlbOF4Ajfyjx+peubYI0QBoERq6F1WoXqSBFjMV+ERItrjUnOk9dhYHugjTWMEJJ9+2oAW62w1ONHEBfpRNzz5XZRG36ch1BZITSDOFnKfJCVVG4ozHbmPFIKOZrh3y3LFVLM2gVB5LJVaG4tDwhxu34SebLZlFiJNOia7JgqI4I8xxeRcvQsylIKGHgdIDM0ngK2pSnFd5d/32EQiXeaXUgRWFgNkDwDJ43wu5y2TMP9VoGi4QwIiKs+ugkhJC2pJMJG22p3Ki7NW6njb940Fgp/U/L5CrkUKSFLoA5L3aKpW5XGo/f+duJkmLsdGsaa1rZVMgolI0P4yocdqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y8JxSKCc/xdcCWvk5fEkcoZ8Zygf+5b64mT/0g9m8j4=;
 b=yGNu20nOOuCVwyj1S1SfEOm7Jg5txh6VR86QX4+O1qozqW8keluUhoo0l2HiiFduQZMUupwbs8SJZSKnOxBUN6kuLb8XjZDRxh0R+4EtsYw3l1M81uP+ZQbOI69QchPJrw9dAHPHxlh3tM5114MhoY3mhV+MXzeOlJfM2RxngVBVOZDvrUVboQsyRkcTzOMD8P58P+1UicW8XdbAkEiSrm/T8tnLU7OB4593hPnI6iKaSA3RLwooevvUccbgZHY78qSWaoiZkemkGx42aKUXDmfPLPRl+WRCbye06q4uQp0giB2IdnzeeOIWwOJGZD5CsZ8FgKwgjEhltCUGcZTVSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by MN6PR11MB8148.namprd11.prod.outlook.com (2603:10b6:208:472::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Mon, 19 May
 2025 04:50:13 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%5]) with mapi id 15.20.8746.030; Mon, 19 May 2025
 04:50:13 +0000
Date: Mon, 19 May 2025 12:50:03 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Christian Brauner <brauner@kernel.org>
Message-ID: <202505191143.59950d28-lkp@intel.com>
Content-Disposition: inline
X-ClientProxiedBy: SG2PR04CA0213.apcprd04.prod.outlook.com
 (2603:1096:4:187::11) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|MN6PR11MB8148:EE_
X-MS-Office365-Filtering-Correlation-Id: 889608df-4ff6-480f-3953-08dd9690a456
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?UqEnb++mYanJczJ8bTrFqx/ZuTOv+MtAMhItoS8gnwsnDPObviGUjjS8h8?=
 =?iso-8859-1?Q?j+f4N+HINNocr1mwb4icx9W10sNkT2+8G9WOeixF2nPd14pbE9zTf681nl?=
 =?iso-8859-1?Q?Dr70yKdGzJCg2DO9q452FWdMlK8crUugbi8AmcW/Clkor+uJ3KkYOGPGK5?=
 =?iso-8859-1?Q?FnA4198sVJLQNPIvGaFW9YufVorUjutGjWj5igjC9AM9lFs8wki86JwBQu?=
 =?iso-8859-1?Q?xsGAuqYQQ9pi1F+u0qsmZZZD8F3m2c4inqu4AJpLpShjxD1r2royAvd9Ki?=
 =?iso-8859-1?Q?yTZcMHa6tckPsO3qDdib0dS2ouo/LGz7TaYkAzNL7B2LKbg12TT834CxtV?=
 =?iso-8859-1?Q?qJ0IzALqVmm40bHfLNfSKYP+xNG0gNRwk2KMQsinnfOU90ijgHL1VA593v?=
 =?iso-8859-1?Q?wUozl8INbBuF8dXCr+qZbSvSiQ6BOvm2HWipOdwMlgZ8mKn/YI777gxlOt?=
 =?iso-8859-1?Q?V1DLbRV0AGKmZzLQCjdpPfM3ocTkvK0X/970kJsa5vtUNE2CiI461CFEu+?=
 =?iso-8859-1?Q?35jhp8QTbKVatEsfzA/5jGS7R9rRoi4cF/tgqu+gpr49hi/xr1/Ifw5ORN?=
 =?iso-8859-1?Q?jHcdmYdtlB869mAuFV4ZRJmdkt79SwNClVukalRHSSpytHY0I2eK5NiuJ5?=
 =?iso-8859-1?Q?k263sgCcfarVmDhepGif85U3/74sODIEJiuJdRgiHFbWbPjom3lVFsqWtD?=
 =?iso-8859-1?Q?Temmb5fsPLmm0iYPcz/Zxp9gARidPVIqf8TZlfJZJq+XPkoeLOZyYMO0cE?=
 =?iso-8859-1?Q?Ijhbu8VrmB5DI0OjAa9554dXP+G1bRX1ctBqeo5EtmHTH31Rf8l8B0ufCH?=
 =?iso-8859-1?Q?k4ooqDWS54Xxfy9iZWS0eAHiT71hmgkDUgXofQXHUoNw+w4sSpLdahixgI?=
 =?iso-8859-1?Q?+5yWyw8EvJNO/gmsiFs+skKzHKORoXZ3WtJ3ploX2jqjM390ChEE6vcdc7?=
 =?iso-8859-1?Q?ZwwYv8pzNf3oHon2G4MPa6FHDp0LU98Mf/eSV3DZjFzKiNl1tFYYrghy3J?=
 =?iso-8859-1?Q?oElwQtaMcTlnhrGWcONgus4Q72lZ8QEja+fTB5baOqdJ0XMzLBi1XhnmRz?=
 =?iso-8859-1?Q?0ogokCbnVQrhmEAhjscgEtL3CN5ax167+fJ2Rml2knPatDW6w9UEBJkAq1?=
 =?iso-8859-1?Q?1/0PxdslY7ZzFuXuK0vO+GlbzBCyDnhM6H0LRWI18/isELhZ4v+8Pqh72u?=
 =?iso-8859-1?Q?diPddt9RRo/Y8HbwUy884w9cQnr4Imm0ZikRC0jcta606WU+xcpA1YZTEH?=
 =?iso-8859-1?Q?d7CQkTiUC+tO3wysXiGEGFSygCKMzp5IaRzdotU1hdlpiptSDVs+jsCJ78?=
 =?iso-8859-1?Q?GF4xiLjUCrAh6VlYFF/E8/pbQss/pPKS1wycgF/StiKo+xzYqGgntdhP2u?=
 =?iso-8859-1?Q?WSAtRDORNz3OaSuxzAGbCOo1tLnHE7bRN9dLoSQpuAZoGVsjtlznQ4oJAx?=
 =?iso-8859-1?Q?eVgw7jqbFWyX8L03?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?FmuPnJJR9jDn/dvlkypwSX6hV9fE6kOvIO4qIuAqRJFucpsh4jD8Zk40Qs?=
 =?iso-8859-1?Q?4YqH/GLPgTzToYNw3NdH5oipHHP2bt5fkRbVEaBAXhE0+sz53NuLkwP4S4?=
 =?iso-8859-1?Q?7g+1yOZKEIvhcqvbsN4hg1cK0FfWEdCr32oYdYKzQ62OsClhaWTVsvpAvx?=
 =?iso-8859-1?Q?mAr3ALWk2JPbhaXDHfbWvL9nfPXlR8rW5TV37lelcgNvHrLsG3GJzZ4sli?=
 =?iso-8859-1?Q?PmuHN5Cu1EGyJw30r8O9D45XZyPgfObQ3CVdi2xcFJG+2DBxwApAuT+0YI?=
 =?iso-8859-1?Q?ktJMaB048yXCZ1wbDeooFCaEFut6kCUpZJ1RY8J6qVmizhO76aNdmnnhcl?=
 =?iso-8859-1?Q?iK3mF/PRjOhbelLz/Wdzp5iH6sx7I3fhijXKBjC/BHd81jR4mCE4CqA9ip?=
 =?iso-8859-1?Q?gIhbE4LoHUTk4ApNYF2Cr1jUzj8oCDvROG627i/fxkY7fVquvMrW3k1jXd?=
 =?iso-8859-1?Q?jtRmGR50ecGC5YT3Q6lGjh6vyQzxzocOC4D8yUxo4xSdeDY0Q+JLRyYyU7?=
 =?iso-8859-1?Q?60HeT/3SunsvE11jsI//rxPRjQhos8NbBuR6XctlrIY4CBhS3bBLNDr4zs?=
 =?iso-8859-1?Q?3rgow48jd3SxjgPgctC26P2/dkmBvJlUTmGVo4vrVhUojTDvbY5IAGsmmy?=
 =?iso-8859-1?Q?P5xEcKP4v0GmhjlSCpzKK0QDQLM4xXD3nRmsYw14I3Wf7TjsymdOl86mUx?=
 =?iso-8859-1?Q?8SljgyH6B3k4rsbykTzvVVxtq+RNJCNsJwATak1T3zOFv53jY4ee3rgRP5?=
 =?iso-8859-1?Q?OQ3eVfgygJK/q5wKl39zK0gYXSOXEW/Ih0C93sWjkN6jGehHC1jXlyuyw6?=
 =?iso-8859-1?Q?5mjyseb7k8WnRTsCZLbtx+UaKkSqDOhm2/L9LUZo+reVqzYIfh7IEZENC5?=
 =?iso-8859-1?Q?Raqr0TtX/T2NH4zNFB1jdb5TBqg0qXEvnG9DSrN95VqTtSM7dw3nN826io?=
 =?iso-8859-1?Q?XdVHiRe5i6jS/rHDNjFup5/o8eDbsCzNesMgiMrnUYQwzwsQhJJw5C5TMA?=
 =?iso-8859-1?Q?IkWJm3WqdQc6z3f0yk6WgKsyx0iHAWypgWsiFmpkXuUG/ycsBuBwx7SwIo?=
 =?iso-8859-1?Q?+8gubpORXaZ0/3VS6Uurmx9uvEnCsHs67WDwOT2zV6ZCcV7ae/uCWAeBbO?=
 =?iso-8859-1?Q?MiYJiyf0+aaZVLaic1jDL9OMv2FombAjCW2WaMj+oJ45maACYiJOvlST9w?=
 =?iso-8859-1?Q?fATcI5SMbF8aZDj1hL91uomDodLb95WCwsuJjfu6b/l1ipLofL07dYgWY4?=
 =?iso-8859-1?Q?sXzOtk1ctShyPCoo7tjUU1InfEcPKqbCoT9OVQq4ryOwxDo86cL/UwcYwR?=
 =?iso-8859-1?Q?Of6BMyZHfslcrCF+pCqCigUH7eC4bvxhuodGe6h/FpB8B0pGp4t7GZLK4q?=
 =?iso-8859-1?Q?BBayOYBNSIgQtpXC5jH68S4oOvVappnL1e2Jvkn2fw/NBxeJZOWmeqjLwk?=
 =?iso-8859-1?Q?TKzqrsl9Si29z6BF0BlozTTtQUS1nxI0VvPqHFqbeWVSU9ZrcJeoQ6RJ+x?=
 =?iso-8859-1?Q?KSalwe+pJSRLY57sM20/4fbvOBT7SWH7z+9+ptIr7KlyShNTcqJQOcjqbU?=
 =?iso-8859-1?Q?QKm1ClR9vPfvA6ab0dRmZfzlruoGdIiKBuyDEOeBau+Vy14skYmNCSK+Rz?=
 =?iso-8859-1?Q?PgB++rnRn5juiKBDSfkfXeZsq1ZzE5K9I7sRCnxrHz1yHM69m6rGZ5yA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 889608df-4ff6-480f-3953-08dd9690a456
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2025 04:50:13.4367 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: q2cMwH6Vy6rZQ6s+YWwderO1SLPzgmMUtkEyYuJkIqkSsDtAHgeTyqImCmbyNHGcB3x+nZmmfXgVH81YsgBGkw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8148
X-OriginatorOrg: intel.com
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 kernel test robot noticed a 23.3% regression of
 stress-ng.unlink.unlink_calls_per_sec
 on: commit: 1af3331764b9356fadc4652af77bbbc97f3d7f78 ("super: add filesystem
 freezing helpers for suspend and hibernate")
 https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git
 master Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.175.65.13 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [198.175.65.13 listed in sa-trusted.bondedsender.org]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.175.65.13 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uGsSe-0005M3-Tt
Subject: [f2fs-dev] [linux-next:master] [super] 1af3331764:
 stress-ng.unlink.unlink_calls_per_sec 23.3% regression
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
Cc: linux-xfs@vger.kernel.org, Jan Kara <jack@suse.cz>, lkp@intel.com,
 linux-f2fs-devel@lists.sourceforge.net, gfs2@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-security-module@vger.kernel.org,
 oliver.sang@intel.com, oe-lkp@lists.linux.dev
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



Hello,

kernel test robot noticed a 23.3% regression of stress-ng.unlink.unlink_cal=
ls_per_sec on:


commit: 1af3331764b9356fadc4652af77bbbc97f3d7f78 ("super: add filesystem fr=
eezing helpers for suspend and hibernate")
https://git.kernel.org/cgit/linux/kernel/git/next/linux-next.git master

[test failed on linux-next/master 8566fc3b96539e3235909d6bdda198e1282beaed]

testcase: stress-ng
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 64 threads 2 sockets Intel(R) Xeon(R) Gold 6346 CPU @ 3.10GHz=
 (Ice Lake) with 256G memory
parameters:

	nr_threads: 100%
	testtime: 60s
	test: unlink
	cpufreq_governor: performance




If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <oliver.sang@intel.com>
| Closes: https://lore.kernel.org/oe-lkp/202505191143.59950d28-lkp@intel.com


Details are as below:
---------------------------------------------------------------------------=
----------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250519/202505191143.59950d28-lkp@=
intel.com

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/kconfig/nr_threads/rootfs/tbox_group/test/testcas=
e/testtime:
  gcc-12/performance/x86_64-rhel-9.4/100%/debian-12-x86_64-20240206.cgz/lkp=
-icl-2sp8/unlink/stress-ng/60s

commit: =

  62a2175ddf ("gfs2: pass through holder from the VFS for freeze/thaw")
  1af3331764 ("super: add filesystem freezing helpers for suspend and hiber=
nate")

62a2175ddf7e7294 1af3331764b9356fadc4652af77 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

     22349 =B1  2%      +6.5%      23809        vmstat.system.cs
    159467            +2.1%     162851        vmstat.system.in
     67494           +12.8%      76141 =B1 20%  proc-vmstat.nr_shmem
   1367488            -2.8%    1329138        proc-vmstat.nr_slab_reclaimab=
le
    541527            -1.8%     531651        proc-vmstat.nr_slab_unreclaim=
able
    316736           +17.4%     371828        stress-ng.time.voluntary_cont=
ext_switches
     47192            +1.4%      47854        stress-ng.unlink.ops
    712.42            +1.8%     725.38        stress-ng.unlink.ops_per_sec
     12343           -23.3%       9464        stress-ng.unlink.unlink_calls=
_per_sec
 1.376e+10            -1.5%  1.355e+10        perf-stat.i.branch-instructio=
ns
     50.73            -1.6       49.16        perf-stat.i.cache-miss-rate%
 2.702e+08            +3.7%  2.802e+08        perf-stat.i.cache-references
     23174 =B1  2%      +6.2%      24600        perf-stat.i.context-switches
      1565           +16.8%       1828        perf-stat.i.cpu-migrations
 6.418e+10            -1.5%  6.321e+10        perf-stat.i.instructions
      0.29            -1.5%       0.29        perf-stat.i.ipc
      2.11            +1.9%       2.15        perf-stat.overall.MPKI
     50.08            -1.6       48.47        perf-stat.overall.cache-miss-=
rate%
      3.52            +1.5%       3.58        perf-stat.overall.cpi
      0.28            -1.5%       0.28        perf-stat.overall.ipc
 1.356e+10            -1.5%  1.336e+10        perf-stat.ps.branch-instructi=
ons
 2.664e+08            +3.7%  2.763e+08        perf-stat.ps.cache-references
     22843 =B1  2%      +6.2%      24252        perf-stat.ps.context-switch=
es
      1544           +16.8%       1803        perf-stat.ps.cpu-migrations
 6.328e+10            -1.5%  6.233e+10        perf-stat.ps.instructions
 4.344e+12            -1.8%  4.268e+12        perf-stat.total.instructions
      7.93 =B1  3%     -20.9%       6.27 =B1  8%  perf-sched.sch_delay.avg.=
ms.__cond_resched.__dentry_kill.dput.lookup_one_qstr_excl.do_unlinkat
      5.39 =B1  2%     -24.0%       4.10 =B1  3%  perf-sched.sch_delay.avg.=
ms.__cond_resched.dput.do_unlinkat.__x64_sys_unlink.do_syscall_64
      7.22 =B1  5%     -14.8%       6.15 =B1  3%  perf-sched.sch_delay.avg.=
ms.__cond_resched.kmem_cache_alloc_lru_noprof.__d_alloc.d_alloc.lookup_one_=
qstr_excl
      7.73 =B1  3%      -8.9%       7.04        perf-sched.sch_delay.avg.ms=
.__cond_resched.mnt_want_write.do_unlinkat.__x64_sys_unlink.do_syscall_64
      0.73 =B1  5%     -22.1%       0.57 =B1  8%  perf-sched.sch_delay.avg.=
ms.smpboot_thread_fn.kthread.ret_from_fork.ret_from_fork_asm
      6.43 =B1  2%     -14.6%       5.49 =B1  3%  perf-sched.sch_delay.avg.=
ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[=
unknown]
     15.68 =B1 18%     +25.0%      19.60 =B1  9%  perf-sched.sch_delay.max.=
ms.__cond_resched.down_read.unmap_mapping_range.simple_setattr.notify_change
     24.13 =B1 10%     +44.0%      34.75 =B1 23%  perf-sched.sch_delay.max.=
ms.__cond_resched.down_write.do_truncate.do_open.path_openat
     11.91 =B1  2%     -22.2%       9.26 =B1  3%  perf-sched.wait_and_delay=
.avg.ms.__cond_resched.dput.do_unlinkat.__x64_sys_unlink.do_syscall_64
     71.98 =B1 14%     -30.4%      50.09 =B1 15%  perf-sched.wait_and_delay=
.avg.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
     14.94 =B1  5%     -14.2%      12.82 =B1  3%  perf-sched.wait_and_delay=
.avg.ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwfr=
ame.[unknown]
     27151           -18.5%      22138        perf-sched.wait_and_delay.cou=
nt.__cond_resched.__dentry_kill.dput.__fput.__x64_sys_close
      1001 =B1  2%     +77.4%       1776 =B1  2%  perf-sched.wait_and_delay=
.count.__cond_resched.down_write.vfs_unlink.do_unlinkat.__x64_sys_unlink
      2584 =B1  2%     +19.3%       3082 =B1  3%  perf-sched.wait_and_delay=
.count.__cond_resched.dput.do_unlinkat.__x64_sys_unlink.do_syscall_64
      1046 =B1  2%     -21.0%     826.67 =B1  3%  perf-sched.wait_and_delay=
.count.__cond_resched.dput.lookup_one_qstr_excl.do_unlinkat.__x64_sys_unlink
     30647           -14.9%      26094        perf-sched.wait_and_delay.cou=
nt.__cond_resched.dput.open_last_lookups.path_openat.do_filp_open
    802.83 =B1  3%     +94.0%       1557 =B1  3%  perf-sched.wait_and_delay=
.count.__cond_resched.dput.simple_unlink.vfs_unlink.do_unlinkat
      2993           +83.0%       5479 =B1  2%  perf-sched.wait_and_delay.c=
ount.__cond_resched.dput.terminate_walk.path_openat.do_filp_open
      1952 =B1  2%     +19.9%       2341        perf-sched.wait_and_delay.c=
ount.__cond_resched.kmem_cache_alloc_lru_noprof.alloc_inode.new_inode.ramfs=
_get_inode
      1026 =B1  2%     +59.1%       1632 =B1  2%  perf-sched.wait_and_delay=
.count.__cond_resched.kmem_cache_alloc_noprof.security_inode_alloc.inode_in=
it_always_gfp.alloc_inode
      1831 =B1  2%     +70.4%       3120        perf-sched.wait_and_delay.c=
ount.__cond_resched.mnt_want_write.do_unlinkat.__x64_sys_unlink.do_syscall_=
64
      1932 =B1  2%     +38.5%       2677 =B1  2%  perf-sched.wait_and_delay=
.count.__cond_resched.mnt_want_write.open_last_lookups.path_openat.do_filp_=
open
    612.17 =B1 15%     +45.3%     889.33 =B1 19%  perf-sched.wait_and_delay=
.count.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
      7589 =B1  2%     +21.7%       9237 =B1  2%  perf-sched.wait_and_delay=
.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.do_un=
linkat
      3569 =B1  2%     +20.4%       4299 =B1  2%  perf-sched.wait_and_delay=
.count.schedule_preempt_disabled.rwsem_down_write_slowpath.down_write.filen=
ame_create
      6.52 =B1  2%     -20.8%       5.16 =B1  3%  perf-sched.wait_time.avg.=
ms.__cond_resched.dput.do_unlinkat.__x64_sys_unlink.do_syscall_64
     71.91 =B1 14%     -30.4%      50.04 =B1 15%  perf-sched.wait_time.avg.=
ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
      8.52 =B1  7%     -13.9%       7.33 =B1  3%  perf-sched.wait_time.avg.=
ms.syscall_exit_to_user_mode.do_syscall_64.entry_SYSCALL_64_after_hwframe.[=
unknown]
     23.62 =B1  9%     +26.8%      29.96 =B1  8%  perf-sched.wait_time.max.=
ms.__cond_resched.down_read.unmap_mapping_range.truncate_pagecache.simple_s=
etattr




Disclaimer:
Results have been estimated based on internal Intel analysis and are provid=
ed
for informational purposes only. Any difference in system hardware or softw=
are
design or configuration may affect actual performance.


-- =

0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
