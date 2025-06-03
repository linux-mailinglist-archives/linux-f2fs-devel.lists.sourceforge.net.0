Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D619ACC93B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Jun 2025 16:37:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:In-Reply-To:Message-ID:To:From:Date:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=WbIPZaXB4nMYmXVxId3Ni6KzrR89i18ULd7dfnf6w7k=; b=c6MAF74q7SDZf+q+MbqzC5W3ow
	JSFSR8DpamsHpJ00QKHNMPwQI6kQkGGwWPOld/E1js5XlonJ+cPrXai4c0Pu6UVuT9azopCXVbkIj
	yDQdAvWcO7X3eKTkH8B66RHhpjHiodc2FEEeyzMEiwh8nWq49bxGLP7gbP2u0j1DIMZA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uMSln-0006tO-Vy;
	Tue, 03 Jun 2025 14:37:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <oliver.sang@intel.com>) id 1uMSlf-0006tA-QL
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Jun 2025 14:37:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:In-Reply-To:Content-Transfer-Encoding:
 Content-Type:Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PdLZvEEqyI7uB7bKNa6K3994ocaHDWXmNdM0U8VC3JQ=; b=gtKLN7R8uOv2Bg8pkzQJWSIcnG
 y7vo6wb0pkLfI51S0SkNOsvkdbZRSyjg1AEFFndSnvRJHlRvIXqdM4kT1B0ZH26amHfs+3p7j7UTm
 Wl9d7mcOb+mCKoUCrCkdjtwhTjbDUma2w1dDpeYVoEjpsy5SIDfaon+kS79a9WM3Xy00=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:In-Reply-To:Content-Transfer-Encoding:Content-Type:
 Message-ID:Subject:CC:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PdLZvEEqyI7uB7bKNa6K3994ocaHDWXmNdM0U8VC3JQ=; b=U0wAi72CGGbLqk5ecAeQEfFGHk
 aJ+aUEXbAESsAAF5ugdjxEqmToBj48D9i+/wMPDUF5F1xa47LR8BlLRxhqMpRxHRN61dZ5JSnInFw
 p1HmU6XMMop+J9oacKKn+GWYBTnUBXWOjrteT/YYUM8cR/31KAkz7p1aB97DSXnLlSuI=;
Received: from mgamail.intel.com ([192.198.163.11])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uMSla-0006MG-PL for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Jun 2025 14:37:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1748961447; x=1780497447;
 h=date:from:to:cc:subject:message-id:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=SB6izXRrXNRjTD0uH/ZPmZ1hC17M8jD7wzrCA/cLmmE=;
 b=kwy3/unMax6b/VcNOpAPxqWusHoh8IbQcLcsRNbgy10k4Yf+vZ5VGnip
 4XE2pTEDci/2nuUcPTEs7izqwXC8oGyMvXM4b0R0VwRUmImMfxu3wNf/x
 lOtj6cWY2kl2uB5npDWaYPVDHCvI0gvv5GNYDSQJac8NjTgcQudWgTL3v
 xQkgxQfkgpzUjZceBPnVfqIWJc4/oahMzMIydqjPWkc17TMhGRH7l+Bgd
 to7EbIsX1j/eR8nbXS/D1hSCx3tV3FQRDTMkr9c1oP3NzYpTF+GrJy/9X
 y75ZLZnQtsInpQcDb5lNLV5hN8tUcfk+SmoYYWBAuKYMCYddhVkeaLox7 w==;
X-CSE-ConnectionGUID: 8CJ8DvDjQbWjnF0OmRxXIw==
X-CSE-MsgGUID: 8vXcvyB2SZWBj3LtKaDmaA==
X-IronPort-AV: E=McAfee;i="6700,10204,11453"; a="61624842"
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="61624842"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 07:37:15 -0700
X-CSE-ConnectionGUID: cWQohDc9SLmvWVerC0Q3jw==
X-CSE-MsgGUID: 3UTAYI+7RCah1MsSQfdDXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,206,1744095600"; d="scan'208";a="145371197"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jun 2025 07:37:16 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 3 Jun 2025 07:37:14 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 3 Jun 2025 07:37:14 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (40.107.244.44)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 3 Jun 2025 07:37:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I9epFdrdQe7FLIDs3ZNAHJgW4v2JkRO/eDtbcDl+BhRgX/bu/mjsHvXkibJ3asu2HK9L9GQsfHtxN1UxmbT2JlD5dqgIFGuIFuxr27b8Sx8yHwlromwMQFdXNFAmnQNXtOfuOoRsQtndsngv2eRjNo0F0D7px+c7K0vaStqUii5LFL61c6bP4KRx4a26S804iBPh+yCUYYy4XGnULSfGYrijBw0MkjYEUSxUIlv1q1jf7Dpg+1pm0KHmqeAD0xbAkjMMHCFwor8LsKbPdRSWFmFNqRyN9qaE/FY2e4f5CLIihBHmNe6C/2jET7ss6uMZdAJEuncf5PCRHBYTiJnBEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xr1FOkyq/NaYZyPFxJuck+hANw2u6GU5OHoqG1NiXBA=;
 b=xhl4ISUpBUKm7uv2m98Hs6+URMmu7SG5jPuMkMxjbjHtfLAYo64Im2mzFiYEUv4YpFNbdYni5hghkQdHaHRsFBN+qLliJ6HSO0q6XxkCbSZa4dAAb1QfqRBcj69EacIjL3vqHwWhDQTRnxjzKdNPTYoWZv0kKGMZ/cFG724Hs89T8FQx9Abd5pCnr2FEvPlPQuPf8dOSDDU1e/BvuMm4iT4WjiRZXj8K3P6T+Sk6gioU3vnKRd9VggbKdHmdXQ5rs30zH4ONjy8gQ8wB+eBwBbxYbS37UNvQJ31bKEC6KrFg9Xk7eYoksglYfnwX564uyMdz6NHnR0hLTwjcAJJCUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV3PR11MB8603.namprd11.prod.outlook.com (2603:10b6:408:1b6::9)
 by DS4PPFE396822D5.namprd11.prod.outlook.com (2603:10b6:f:fc02::59)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Tue, 3 Jun
 2025 14:36:29 +0000
Received: from LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c]) by LV3PR11MB8603.namprd11.prod.outlook.com
 ([fe80::4622:29cf:32b:7e5c%3]) with mapi id 15.20.8792.034; Tue, 3 Jun 2025
 14:36:29 +0000
Date: Tue, 3 Jun 2025 22:36:11 +0800
From: kernel test robot <oliver.sang@intel.com>
To: Kundan Kumar <kundan.kumar@samsung.com>
Message-ID: <202506032246.89ddc1a2-lkp@intel.com>
Content-Disposition: inline
In-Reply-To: <20250529111504.89912-14-kundan.kumar@samsung.com>
X-ClientProxiedBy: SI2PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::15) To LV3PR11MB8603.namprd11.prod.outlook.com
 (2603:10b6:408:1b6::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR11MB8603:EE_|DS4PPFE396822D5:EE_
X-MS-Office365-Filtering-Correlation-Id: d5f80507-d390-4f80-b7a3-08dda2ac0707
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?ss94mxFKqwG3NFpJtNlN2KdRpnFWPswzGkM6rVxfKFlYuQSUsnraWZxMN/?=
 =?iso-8859-1?Q?mwy8Z6Bx3+fnhsLAt90c0lqjqle9tEHE42J4TyMEQ8o0M8QtZIhdbE6CR1?=
 =?iso-8859-1?Q?i+/IhE0W2toDgjH2XvMYbbR+u61T2ACFtU5xYpHRqKEGD5LxFfYl7jscy8?=
 =?iso-8859-1?Q?8NZAQ1BiZc6v5FpdJKHIODarSaRr9hBDlze7FSR4fSgUF5pp5wXbZJgI2l?=
 =?iso-8859-1?Q?Vvwl/ST4sBUCKVDQsIyuS6ar1M121cePOOCl+JLe7WBeV6FyY9vLZ7rnXS?=
 =?iso-8859-1?Q?mlIfGSgtzceHV8doE2jtiQx1UMmwBnCzJMVJNWwIbX9vRC28/VQABAfxm+?=
 =?iso-8859-1?Q?BOHChnshtdxWchazLndNaqDjGMGtA2Q0BEDbfxgnLR0vi3NhTpfXODUQ3b?=
 =?iso-8859-1?Q?qnQHnEkDnyXGtRip8NY6Vb9a5QLCbgcM9S0l+hzCYTictA6V7VYHzBz3UK?=
 =?iso-8859-1?Q?gCu6rZS3NYlwCGSDoy8pFBqkYsBcrzKXhPImoE+BH1r+YqBMQmLTmTj2IO?=
 =?iso-8859-1?Q?yy6EsCr2lIVIgE3671FMFwzI2VbG0a6PkTJEUdkrD7jyzyj6GB5Iu5VdKL?=
 =?iso-8859-1?Q?IJmPh4JYpSQjVbvqbKJhxWeFEg8JgCCyOZTLny46kcz0NLk2g8vO+5MO0e?=
 =?iso-8859-1?Q?7bOm1KNUR8OXThaHI+J/IyBkzylZjBZSIRnwunsO5OqlqG/hYMoFXPrx06?=
 =?iso-8859-1?Q?M7JC5XJyzqyw/HNty73PfC3ZZoxHMYP7/ybKMJT6iT2ovqdxI45f3s1Jfc?=
 =?iso-8859-1?Q?fsa2rP10g8We1wwmv6Ry0Hg9Rl0NfwN0vvGcUdFHlrznQvV2uF1wYbkHBl?=
 =?iso-8859-1?Q?A0uKolKBHVtifBMQJXUnSBtrHGUDGOBrtsaHzvxkTK0gXbW6N749cKdWnP?=
 =?iso-8859-1?Q?XBWBSTqo5tJJSwSJdrKpLsc8wUVuVapc83wsk5SMxu3Mqd++jWc/ef8byv?=
 =?iso-8859-1?Q?0At4/I+AiQ3mfcHkQ2wuluXDWQYLOSE+4zur8EExoR5jf8bdf28MFq/CFz?=
 =?iso-8859-1?Q?qwLW5bw4kDKfyg3EzPddm7nB44sIJT3Juba/UZh8ZrORcK1eNkmNu7+vq4?=
 =?iso-8859-1?Q?l+VUwXm6B+LXFm6hd867dlkphB+G7ovqt78//h3BjGQqzWkLUgHgC9+XTp?=
 =?iso-8859-1?Q?7LO2or2o5MKGP5YFzo3ywuX1AMrusDOlFr0Eg1d/labsq/jpqjypd3+aTM?=
 =?iso-8859-1?Q?VXzgpDAGPI9dv9c/0sNMu1ckP0pBg5NY8GnSAGnqDiWRy9jpCXxhtWZ+s0?=
 =?iso-8859-1?Q?XTjN7lbwzDY7WQvcJvPIeZXa48e9sKU1xTzYvT615MIjvZ2a2D289VzrnI?=
 =?iso-8859-1?Q?Zn6J+2IdXYM/WTsRE3Kg36Q+jsaEuRrLNRzanHqqQbNXCqKfWzIV5SjueA?=
 =?iso-8859-1?Q?d7O68GPSEA/O0sLalkQ8gjxyWovyFI/D+MkeqsC2RE7fQZmfXBADE754Y6?=
 =?iso-8859-1?Q?AIY5Yu1vSq9YAf56?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR11MB8603.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?9R30gCGHw9zKOVgxN0KNZknvuq+jjHAwunBmB9Ril68NIJvUWsAKx7vOKE?=
 =?iso-8859-1?Q?WooPgdopd2dXnzjXn3udvZeEpP73mfB2ZiSH6RrGdxO7Q7Qm+/5YSiNjzz?=
 =?iso-8859-1?Q?OwBxuD+aczd3ZazZkVnLttMrzcNhSx8m+kJce2GZmIKraUfWpikf7jtbhD?=
 =?iso-8859-1?Q?Vzei64gHys6zM50JKSQT7ll4HnEDlL/XgXfequkhqdTvKD9/i38hvVe3M7?=
 =?iso-8859-1?Q?ENQXY+K1K5Y6VNngrB+SVksYLqUBXOXyRQMF5YfAVm0C0V5ijIeomAIA+/?=
 =?iso-8859-1?Q?6neCcGykxznP/CLKligdK5Guft5sEbVcsqd9uzD7XBQU6bvok9TQUJzuHj?=
 =?iso-8859-1?Q?FE43mi9Dg8VhnwC0nBR0+aHxiPXsZw9eRA0U8ue3PXiz0ivSXm1UsrjpvU?=
 =?iso-8859-1?Q?zS4bCWh2qh5GZ72CrhxulT6BuHZW3b+He99jwp0oTawZQr6ELPD1WJEZ6h?=
 =?iso-8859-1?Q?go4kl6et36RY5g1iqjm9G83mthKvCLtvf/BW6GZz5YcIgAs+5lmXolB1ZH?=
 =?iso-8859-1?Q?oh3JtJPKNwFtnhp1CuqOyJ1TQlafG8EqohpzpNkDSg1w0nufw8elMv+G2w?=
 =?iso-8859-1?Q?FB5e8XkNbW9mcR2HZxzmBqhESBak2GJzsG4FozHA2oXW6pf6doVDdKCaws?=
 =?iso-8859-1?Q?V2JwYUpTV0aR/Bq2YzAVjGnN7bYWE4DdcE7Oj2OgvMU3zbqFpqOLLzrMN/?=
 =?iso-8859-1?Q?IBNrRDqkUFIjZw8H48KCnXYw2hSDYp8dollX2E1go5h4BOiZUGTtiDPQtl?=
 =?iso-8859-1?Q?lplveHEtkZ+p+Mw/hQbUYDg076XP4vPM2b8Z/3UMYDETtMU2plnjU7KFVF?=
 =?iso-8859-1?Q?QSOhk2mirs8rWBagWTKyfXRRbZ6hiwF3TLySRo0zuv9ODcYa8P62Gd31lG?=
 =?iso-8859-1?Q?KEgrYt7yBn0iOkeztH3NNSc1nHoerRSYgiyAXPwqdoCnK50HAB8EKqUrtk?=
 =?iso-8859-1?Q?bDwQ3zzPgb+V1o+2CAVRg8hnmAFwas6OR3f/oIvuMeLcF+7HFCqxg7BaZU?=
 =?iso-8859-1?Q?om6u0sYboc8t9u/fceWD4WlE6Dqd6CWPa28g8svarIQ+E+4N3rvltP+ZcP?=
 =?iso-8859-1?Q?Yi3GuEaYJ6bLDm1VYORM3k64SDDOoyNfFXlYBWKOw8RdspIWpQ/hRcNRyw?=
 =?iso-8859-1?Q?gL8zMmpJJnIuJVYdQW6U2g5jUIx/FpURn2vovtl+f/nWtfdfw5fTpAPUR/?=
 =?iso-8859-1?Q?76nbViTvb6utCr7cQ+bFky3SwA2XubCNVRaPKaxwE6xUHh2EpydwNG7+xj?=
 =?iso-8859-1?Q?n2wFp9vZiFtxF9sp9Pqvf/lol4KqNDywWW6m3E8AS2zB2ALXaknnJGqFS9?=
 =?iso-8859-1?Q?vJcy+ErDXdJ+QOq8Gksvp29k67isYhzHlg4nSqe3StUSoly3yi29LiAHYk?=
 =?iso-8859-1?Q?lXRijuwWf5r6H6kdN2DegJ+73XsIPBnB7o9R7//daAF5BYZ2BPxY0jgsSf?=
 =?iso-8859-1?Q?sL9ZNXd50sFykyQgjidw5GLn0DKiUPLhb7/s8oCYVCTxAIPY0VY5XWJsRU?=
 =?iso-8859-1?Q?Gi+maJD11SG+Qj5Xh7qm2/cTXx5vhVA8R7ZCevPCnpniQcOHRUZVzs9FLE?=
 =?iso-8859-1?Q?58Ure6yDmLSEENMRCdC2YB6tey9zmJbAiS2d8sDz1Qpr3BbPe7rKgDia+p?=
 =?iso-8859-1?Q?8JZwj/Zli5vH+PmBptNEGvIJeivJgpxzy5m17bVm1r1U8xP9zZ7sYc/w?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f80507-d390-4f80-b7a3-08dda2ac0707
X-MS-Exchange-CrossTenant-AuthSource: LV3PR11MB8603.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2025 14:36:29.7279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aryGxCzScZMhjCUIwaQnNklm1+XG84bEj9ZvghpQDEvhG6htiCFRqnhvAd8if1Iq0nL7ZEEbqafeeOVvwnGvXg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFE396822D5
X-OriginatorOrg: intel.com
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 kernel test robot noticed a 53.9% improvement of fsmark.files_per_sec
 on: commit: 2850eee23dbc4ff9878d88625b1f84965eefcce6 ("[PATCH 13/13]
 writeback:
 set the num of writeback contexts to number of online cpus") url:
 https://github.com/intel-lab-lkp/linux/commits/Kundan-Kuma
 [...] Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [192.198.163.11 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [192.198.163.11 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [192.198.163.11 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [192.198.163.11 listed in wl.mailspike.net]
 0.0 T_SPF_TEMPERROR        SPF: test of record failed (temperror)
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uMSla-0006MG-PL
Subject: Re: [f2fs-dev] [PATCH 13/13] writeback: set the num of writeback
 contexts to number of online cpus
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
Cc: ritesh.list@gmail.com, jack@suse.cz, djwong@kernel.org, amir73il@gmail.com,
 david@fromorbit.com, gfs2@lists.linux.dev, linux-mm@kvack.org,
 Kundan Kumar <kundan.kumar@samsung.com>, clm@meta.com, hch@lst.de,
 dave@stgolabs.net, lkp@intel.com, miklos@szeredi.hu, gost.dev@samsung.com,
 willy@infradead.org, p.raghav@samsung.com, Anuj Gupta <anuj20.g@samsung.com>,
 linux-nfs@vger.kernel.org, da.gomez@samsung.com, linux-fsdevel@vger.kernel.org,
 viro@zeniv.linux.org.uk, jaegeuk@kernel.org, agruenba@redhat.com,
 axboe@kernel.dk, brauner@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 mcgrof@kernel.org, oliver.sang@intel.com, anna@kernel.org,
 oe-lkp@lists.linux.dev, akpm@linux-foundation.org, trondmy@kernel.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



Hello,

kernel test robot noticed a 53.9% improvement of fsmark.files_per_sec on:


commit: 2850eee23dbc4ff9878d88625b1f84965eefcce6 ("[PATCH 13/13] writeback:=
 set the num of writeback contexts to number of online cpus")
url: https://github.com/intel-lab-lkp/linux/commits/Kundan-Kumar/writeback-=
add-infra-for-parallel-writeback/20250529-193523
base: https://git.kernel.org/cgit/linux/kernel/git/vfs/vfs.git vfs.all
patch link: https://lore.kernel.org/all/20250529111504.89912-14-kundan.kuma=
r@samsung.com/
patch subject: [PATCH 13/13] writeback: set the num of writeback contexts t=
o number of online cpus

testcase: fsmark
config: x86_64-rhel-9.4
compiler: gcc-12
test machine: 192 threads 4 sockets Intel(R) Xeon(R) Platinum 9242 CPU @ 2.=
30GHz (Cascade Lake) with 176G memory
parameters:

	iterations: 1x
	nr_threads: 32t
	disk: 1SSD
	fs: ext4
	filesize: 16MB
	test_size: 60G
	sync_method: NoSync
	nr_directories: 16d
	nr_files_per_directory: 256fpd
	cpufreq_governor: performance


In addition to that, the commit also has significant impact on the followin=
g tests:

+------------------+-------------------------------------------------------=
-----------------------------------------+
| testcase: change | filebench: filebench.sum_operations/s 4.3% improvement=
                                         |
| test machine     | 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 C=
PU @ 2.60GHz (Ice Lake) with 128G memory |
| test parameters  | cpufreq_governor=3Dperformance                        =
                                           |
|                  | disk=3D1HDD                                           =
                                           |
|                  | fs=3Dxfs                                              =
                                           |
|                  | test=3Dfivestreamwrite.f                              =
                                           |
+------------------+-------------------------------------------------------=
-----------------------------------------+




Details are as below:
---------------------------------------------------------------------------=
----------------------->


The kernel config and materials to reproduce are available at:
https://download.01.org/0day-ci/archive/20250603/202506032246.89ddc1a2-lkp@=
intel.com

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/disk/filesize/fs/iterations/kconfig/nr_directorie=
s/nr_files_per_directory/nr_threads/rootfs/sync_method/tbox_group/test_size=
/testcase:
  gcc-12/performance/1SSD/16MB/ext4/1x/x86_64-rhel-9.4/16d/256fpd/32t/debia=
n-12-x86_64-20240206.cgz/NoSync/lkp-csl-2sp10/60G/fsmark

commit: =

  a2dadb7ea8 ("nfs: add support in nfs to handle multiple writeback context=
s")
  2850eee23d ("writeback: set the num of writeback contexts to number of on=
line cpus")

a2dadb7ea862d5c1 2850eee23dbc4ff9878d88625b1 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

   1641480           +13.3%    1860148 =B1  2%  cpuidle..usage
    302.00 =B1  8%     +14.1%     344.67 =B1  7%  perf-c2c.HITM.remote
     24963 =B1  4%     -13.3%      21647 =B1  6%  uptime.idle
     91.64           -22.2%      71.26 =B1  7%  iostat.cpu.idle
      7.34 =B1  4%    +275.7%      27.59 =B1 19%  iostat.cpu.iowait
      0.46 =B1141%      +2.2        2.63 =B1 66%  perf-profile.calltrace.cy=
cles-pp.setlocale
      0.46 =B1141%      +2.2        2.63 =B1 66%  perf-profile.children.cyc=
les-pp.setlocale
    194019            -7.5%     179552        fsmark.app_overhead
    108.10 =B1  8%     +53.9%     166.40 =B1 10%  fsmark.files_per_sec
     43295 =B1  7%     +35.8%      58787 =B1  5%  fsmark.time.voluntary_con=
text_switches
  19970922           -10.5%   17867270 =B1  2%  meminfo.Dirty
    493817           +13.1%     558422        meminfo.SUnreclaim
    141708         +1439.0%    2180863 =B1 14%  meminfo.Writeback
   4993428           -10.3%    4480219 =B1  2%  proc-vmstat.nr_dirty
     34285            +5.8%      36262        proc-vmstat.nr_kernel_stack
    123504           +13.1%     139636        proc-vmstat.nr_slab_unreclaim=
able
     36381 =B1  4%   +1403.0%     546810 =B1 14%  proc-vmstat.nr_writeback
     91.54           -22.1%      71.32 =B1  7%  vmstat.cpu.id
      7.22 =B1  4%    +280.4%      27.47 =B1 19%  vmstat.cpu.wa
     14.58 =B1  4%    +537.4%      92.92 =B1  8%  vmstat.procs.b
      6140 =B1  2%     +90.1%      11673 =B1  9%  vmstat.system.cs
     91.46           -20.9       70.56 =B1  7%  mpstat.cpu.all.idle%
      7.52 =B1  4%     +20.8       28.29 =B1 19%  mpstat.cpu.all.iowait%
      0.12 =B1  7%      +0.0        0.14 =B1  7%  mpstat.cpu.all.irq%
      0.35 =B1  6%      +0.1        0.43 =B1  5%  mpstat.cpu.all.sys%
     11.24 =B1  8%     +20.7%      13.56 =B1  3%  mpstat.max_utilization_pct
     34947 =B1  5%     +14.3%      39928 =B1  4%  numa-vmstat.node0.nr_slab=
_unreclaimable
      9001 =B1 14%   +1553.7%     148860 =B1 19%  numa-vmstat.node0.nr_writ=
eback
   1329092 =B1  4%     -20.9%    1051569 =B1  9%  numa-vmstat.node1.nr_dirty
     10019 =B1  7%   +1490.0%     159311 =B1 14%  numa-vmstat.node1.nr_writ=
eback
   2808522 =B1  8%     -17.7%    2310216 =B1  2%  numa-vmstat.node2.nr_file=
_pages
   2638799 =B1  3%     -12.7%    2304024 =B1  2%  numa-vmstat.node2.nr_inac=
tive_file
      7810 =B1  9%   +1035.8%      88707 =B1 16%  numa-vmstat.node2.nr_writ=
eback
   2638797 =B1  3%     -12.7%    2304025 =B1  2%  numa-vmstat.node2.nr_zone=
_inactive_file
     29952 =B1  3%     +13.4%      33964 =B1  4%  numa-vmstat.node3.nr_slab=
_unreclaimable
     10686 =B1  9%   +1351.3%     155091 =B1 12%  numa-vmstat.node3.nr_writ=
eback
    139656 =B1  5%     +14.2%     159539 =B1  4%  numa-meminfo.node0.SUnrec=
laim
     35586 =B1 13%   +1565.8%     592799 =B1 18%  numa-meminfo.node0.Writeb=
ack
   5304285 =B1  4%     -20.8%    4198452 =B1 10%  numa-meminfo.node1.Dirty
     40011 =B1  5%   +1484.2%     633862 =B1 14%  numa-meminfo.node1.Writeb=
ack
  11211668 =B1  7%     -17.7%    9222157 =B1  2%  numa-meminfo.node2.FilePa=
ges
  10532776 =B1  3%     -12.7%    9197387 =B1  2%  numa-meminfo.node2.Inacti=
ve
  10532776 =B1  3%     -12.7%    9197387 =B1  2%  numa-meminfo.node2.Inacti=
ve(file)
  12378624 =B1  7%     -15.0%   10520827 =B1  2%  numa-meminfo.node2.MemUsed
     29574 =B1  9%   +1087.0%     351055 =B1 16%  numa-meminfo.node2.Writeb=
ack
    119679 =B1  3%     +13.4%     135718 =B1  4%  numa-meminfo.node3.SUnrec=
laim
     41446 =B1 10%   +1380.1%     613443 =B1 11%  numa-meminfo.node3.Writeb=
ack
     23.38 =B1  2%      -6.7       16.72        perf-stat.i.cache-miss-rate%
  38590732 =B1  3%     +53.9%   59394561 =B1  5%  perf-stat.i.cache-referen=
ces
      5973 =B1  2%     +96.3%      11729 =B1 10%  perf-stat.i.context-switc=
hes
      0.92            +7.4%       0.99        perf-stat.i.cpi
 7.023e+09 =B1  3%     +12.5%  7.898e+09 =B1  4%  perf-stat.i.cpu-cycles
    237.41 =B1  2%    +393.6%       1171 =B1 20%  perf-stat.i.cpu-migrations
      1035 =B1  3%      +9.3%       1132 =B1  4%  perf-stat.i.cycles-betwee=
n-cache-misses
      1.15            -5.7%       1.09        perf-stat.i.ipc
     25.41 =B1  2%      -7.4       18.03 =B1  2%  perf-stat.overall.cache-m=
iss-rate%
      0.94            +7.2%       1.01        perf-stat.overall.cpi
      1.06            -6.8%       0.99        perf-stat.overall.ipc
  38042801 =B1  3%     +54.0%   58576659 =B1  5%  perf-stat.ps.cache-refere=
nces
      5897 =B1  2%     +96.3%      11577 =B1 10%  perf-stat.ps.context-swit=
ches
 6.925e+09 =B1  3%     +12.4%  7.787e+09 =B1  4%  perf-stat.ps.cpu-cycles
    234.11 =B1  2%    +394.2%       1156 =B1 20%  perf-stat.ps.cpu-migratio=
ns
 5.892e+11            +1.4%  5.977e+11        perf-stat.total.instructions
      0.08 =B1  6%     -36.2%       0.05 =B1 33%  perf-sched.sch_delay.avg.=
ms.__cond_resched.__alloc_frozen_pages_noprof.alloc_pages_mpol.folio_alloc_=
noprof.__filemap_get_folio
      0.01 =B1 73%    +159.8%       0.04 =B1 13%  perf-sched.sch_delay.avg.=
ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.07 =B1 10%     -33.0%       0.05 =B1 44%  perf-sched.sch_delay.avg.=
ms.devkmsg_read.vfs_read.ksys_read.do_syscall_64
      0.01 =B1 73%    +695.6%       0.09 =B1 25%  perf-sched.sch_delay.avg.=
ms.io_schedule.blk_mq_get_tag.__blk_mq_alloc_requests.blk_mq_submit_bio
      0.03 =B1 30%     -45.4%       0.02 =B1 24%  perf-sched.sch_delay.avg.=
ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
      0.06 =B1 21%    -100.0%       0.00        perf-sched.sch_delay.avg.ms=
.kjournald2.kthread.ret_from_fork.ret_from_fork_asm
      0.05 =B1 45%    +305.0%       0.19 =B1 66%  perf-sched.sch_delay.avg.=
ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.01 =B1210%   +8303.3%       0.85 =B1183%  perf-sched.sch_delay.max.=
ms.__cond_resched.down_write.mpage_map_and_submit_extent.ext4_do_writepages=
.ext4_writepages
      0.05 =B1 49%     +92.4%       0.10 =B1 35%  perf-sched.sch_delay.max.=
ms.__cond_resched.process_one_work.worker_thread.kthread.ret_from_fork
      0.03 =B1 76%    +165.2%       0.07 =B1 28%  perf-sched.sch_delay.max.=
ms.__cond_resched.stop_one_cpu.sched_exec.bprm_execve.part
      0.07 =B1 46%  +83423.5%      59.86 =B1146%  perf-sched.sch_delay.max.=
ms.io_schedule.blk_mq_get_tag.__blk_mq_alloc_requests.blk_mq_submit_bio
      0.06 =B1 21%    -100.0%       0.00        perf-sched.sch_delay.max.ms=
.kjournald2.kthread.ret_from_fork.ret_from_fork_asm
      0.09 =B1  7%     +19.7%       0.10 =B1  8%  perf-sched.sch_delay.max.=
ms.rcu_gp_kthread.kthread.ret_from_fork.ret_from_fork_asm
      0.10 =B1 13%   +3587.7%       3.60 =B1172%  perf-sched.sch_delay.max.=
ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
     18911          +109.0%      39526 =B1 25%  perf-sched.total_wait_and_d=
elay.count.ms
      4.42 =B1 25%     +77.8%       7.86 =B1 15%  perf-sched.wait_and_delay=
.avg.ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowe=
d_ptr.__sched_setaffinity
    150.39 =B1  6%     -14.9%     127.97 =B1  8%  perf-sched.wait_and_delay=
.avg.ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
      8.03 =B1 89%     -74.5%       2.05 =B1143%  perf-sched.wait_and_delay=
.avg.ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.24 =B1  8%   +2018.4%      26.26 =B1 26%  perf-sched.wait_and_delay=
.avg.ms.io_schedule.blk_mq_get_tag.__blk_mq_alloc_requests.blk_mq_submit_bio
      0.83 =B1  2%    -100.0%       0.00        perf-sched.wait_and_delay.a=
vg.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_c=
lone
     86.14 =B1  9%     +33.0%     114.52 =B1  7%  perf-sched.wait_and_delay=
.avg.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1047 =B1  6%      -8.2%     960.83        perf-sched.wait_and_delay.c=
ount.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_p=
tr.__sched_setaffinity
    171.50 =B1  7%     -69.1%      53.00 =B1141%  perf-sched.wait_and_delay=
.count.do_task_dead.do_exit.do_group_exit.__x64_sys_exit_group.x64_sys_call
    162.50 =B1  7%     -69.3%      49.83 =B1141%  perf-sched.wait_and_delay=
.count.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
      3635 =B1  6%    +451.1%      20036 =B1 35%  perf-sched.wait_and_delay=
.count.io_schedule.blk_mq_get_tag.__blk_mq_alloc_requests.blk_mq_submit_bio
     26.33 =B1  5%     -12.7%      23.00 =B1  2%  perf-sched.wait_and_delay=
.count.schedule_hrtimeout_range_clock.poll_schedule_timeout.constprop.0.do_=
poll
    116.17          -100.0%       0.00        perf-sched.wait_and_delay.cou=
nt.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_clone
      3938 =B1 21%     -66.2%       1332 =B1 60%  perf-sched.wait_and_delay=
.count.schedule_timeout.io_schedule_timeout.balance_dirty_pages.balance_dir=
ty_pages_ratelimited_flags
      4831 =B1  5%    +102.8%       9799 =B1 23%  perf-sched.wait_and_delay=
.count.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     87.47 =B1 20%    +823.3%     807.60 =B1141%  perf-sched.wait_and_delay=
.max.ms.io_schedule.blk_mq_get_tag.__blk_mq_alloc_requests.blk_mq_submit_bio
      2.81 =B1  4%    -100.0%       0.00        perf-sched.wait_and_delay.m=
ax.ms.schedule_timeout.__wait_for_common.wait_for_completion_state.kernel_c=
lone
     77.99 =B1 13%   +2082.7%       1702 =B1 73%  perf-sched.wait_and_delay=
.max.ms.schedule_timeout.io_schedule_timeout.balance_dirty_pages.balance_di=
rty_pages_ratelimited_flags
    396.00 =B1 16%     -34.0%     261.22 =B1 33%  perf-sched.wait_and_delay=
.max.ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread
      3.89 =B1 18%    +100.6%       7.81 =B1 15%  perf-sched.wait_time.avg.=
ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr=
.__sched_setaffinity
      0.13 =B1157%  +2.1e+05%     271.76 =B1126%  perf-sched.wait_time.avg.=
ms.__cond_resched.down_write.mpage_map_and_submit_extent.ext4_do_writepages=
.ext4_writepages
    150.37 =B1  6%     -15.2%     127.52 =B1  8%  perf-sched.wait_time.avg.=
ms.anon_pipe_read.fifo_pipe_read.vfs_read.ksys_read
      1.23 =B1  8%   +2030.8%      26.17 =B1 26%  perf-sched.wait_time.avg.=
ms.io_schedule.blk_mq_get_tag.__blk_mq_alloc_requests.blk_mq_submit_bio
     31.17 =B1 50%    -100.0%       0.00        perf-sched.wait_time.avg.ms=
.kjournald2.kthread.ret_from_fork.ret_from_fork_asm
     86.09 =B1  9%     +32.8%     114.34 =B1  7%  perf-sched.wait_time.avg.=
ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      1086 =B1 17%    +309.4%       4449 =B1 26%  perf-sched.wait_time.max.=
ms.__cond_resched.__wait_for_common.affine_move_task.__set_cpus_allowed_ptr=
.__sched_setaffinity
      0.17 =B1142%  +7.2e+05%       1196 =B1119%  perf-sched.wait_time.max.=
ms.__cond_resched.down_write.mpage_map_and_submit_extent.ext4_do_writepages=
.ext4_writepages
      7.27 =B1 45%   +1259.6%      98.80 =B1139%  perf-sched.wait_time.max.=
ms.__cond_resched.process_one_work.worker_thread.kthread.ret_from_fork
    262.77 =B1113%    +316.1%       1093 =B1 52%  perf-sched.wait_time.max.=
ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
     87.45 =B1 20%    +823.5%     807.53 =B1141%  perf-sched.wait_time.max.=
ms.io_schedule.blk_mq_get_tag.__blk_mq_alloc_requests.blk_mq_submit_bio
      0.04 =B1 30%    +992.0%       0.43 =B1 92%  perf-sched.wait_time.max.=
ms.irqentry_exit_to_user_mode.asm_sysvec_reschedule_ipi.[unknown]
     31.17 =B1 50%    -100.0%       0.00        perf-sched.wait_time.max.ms=
.kjournald2.kthread.ret_from_fork.ret_from_fork_asm
     75.85 =B1 16%   +2144.2%       1702 =B1 73%  perf-sched.wait_time.max.=
ms.schedule_timeout.io_schedule_timeout.balance_dirty_pages.balance_dirty_p=
ages_ratelimited_flags
    395.95 =B1 16%     -34.0%     261.15 =B1 33%  perf-sched.wait_time.max.=
ms.schedule_timeout.rcu_gp_fqs_loop.rcu_gp_kthread.kthread


***************************************************************************=
************************
lkp-icl-2sp6: 128 threads 2 sockets Intel(R) Xeon(R) Platinum 8358 CPU @ 2.=
60GHz (Ice Lake) with 128G memory
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
compiler/cpufreq_governor/disk/fs/kconfig/rootfs/tbox_group/test/testcase:
  gcc-12/performance/1HDD/xfs/x86_64-rhel-9.4/debian-12-x86_64-20240206.cgz=
/lkp-icl-2sp6/fivestreamwrite.f/filebench

commit: =

  a2dadb7ea8 ("nfs: add support in nfs to handle multiple writeback context=
s")
  2850eee23d ("writeback: set the num of writeback contexts to number of on=
line cpus")

a2dadb7ea862d5c1 2850eee23dbc4ff9878d88625b1 =

---------------- --------------------------- =

         %stddev     %change         %stddev
             \          |                \  =

      2.06 =B1  3%      +1.5        3.58        mpstat.cpu.all.iowait%
   8388855 =B1  5%     +17.7%    9875928 =B1  5%  numa-meminfo.node0.Dirty
      0.02 =B1  5%     +48.0%       0.03 =B1  3%  sched_debug.cpu.nr_uninte=
rruptible.avg
      2.70           +72.6%       4.65        vmstat.procs.b
     97.67            -1.5%      96.17        iostat.cpu.idle
      2.04 =B1  3%     +73.9%       3.55        iostat.cpu.iowait
   2094449 =B1  5%     +17.8%    2468063 =B1  5%  numa-vmstat.node0.nr_dirty
   2113170 =B1  5%     +17.7%    2487005 =B1  5%  numa-vmstat.node0.nr_zone=
_write_pending
      6.99 =B1  3%      +0.5        7.48 =B1  2%  perf-stat.i.cache-miss-ra=
te%
      1.82            +3.2%       1.88        perf-stat.i.cpi
      0.64            -2.0%       0.62        perf-stat.i.ipc
      2.88 =B1  5%      +9.5%       3.15 =B1  4%  perf-stat.overall.MPKI
    464.45            +4.3%     484.58        filebench.sum_bytes_mb/s
     27873            +4.3%      29084        filebench.sum_operations
    464.51            +4.3%     484.66        filebench.sum_operations/s
     10.76            -4.2%      10.31        filebench.sum_time_ms/op
    464.67            +4.3%     484.67        filebench.sum_writes/s
  57175040            +4.2%   59565397        filebench.time.file_system_ou=
tputs
   7146880            +4.2%    7445674        proc-vmstat.nr_dirtied
   4412053            +9.1%    4815253        proc-vmstat.nr_dirty
   7485090            +5.0%    7855964        proc-vmstat.nr_file_pages
  24899858            -1.5%   24530112        proc-vmstat.nr_free_pages
  24705120            -1.5%   24343672        proc-vmstat.nr_free_pages_blo=
cks
   6573042            +5.6%    6943969        proc-vmstat.nr_inactive_file
     34473 =B1  3%      +7.5%      37072        proc-vmstat.nr_writeback
   6573042            +5.6%    6943969        proc-vmstat.nr_zone_inactive_=
file
   4446526            +9.1%    4852325        proc-vmstat.nr_zone_write_pen=
ding
   7963041            +3.8%    8262916        proc-vmstat.pgalloc_normal
      0.02 =B1 10%     +45.0%       0.03 =B1  5%  perf-sched.sch_delay.avg.=
ms.do_wait.kernel_wait4.do_syscall_64.entry_SYSCALL_64_after_hwframe
    317.88 =B1166%    -100.0%       0.08 =B1 60%  perf-sched.sch_delay.avg.=
ms.kthreadd.ret_from_fork.ret_from_fork_asm
    474.99 =B1141%    -100.0%       0.10 =B1 49%  perf-sched.sch_delay.max.=
ms.kthreadd.ret_from_fork.ret_from_fork_asm
     17.87 =B1 13%    +125.8%      40.36 =B1  4%  perf-sched.wait_and_delay=
.avg.ms.io_schedule.blk_mq_get_tag.__blk_mq_alloc_requests.blk_mq_submit_bio
     47.75           +19.8%      57.20 =B1  5%  perf-sched.wait_and_delay.a=
vg.ms.schedule_timeout.io_schedule_timeout.balance_dirty_pages.balance_dirt=
y_pages_ratelimited_flags
    517.00           -17.2%     427.83 =B1  5%  perf-sched.wait_and_delay.c=
ount.schedule_timeout.io_schedule_timeout.balance_dirty_pages.balance_dirty=
_pages_ratelimited_flags
     54.05 =B1  2%    +253.0%     190.80 =B1 18%  perf-sched.wait_and_delay=
.max.ms.schedule_timeout.io_schedule_timeout.balance_dirty_pages.balance_di=
rty_pages_ratelimited_flags
      4286 =B1  4%      -8.8%       3909 =B1  8%  perf-sched.wait_and_delay=
.max.ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
     17.77 =B1 13%    +126.0%      40.16 =B1  4%  perf-sched.wait_time.avg.=
ms.io_schedule.blk_mq_get_tag.__blk_mq_alloc_requests.blk_mq_submit_bio
     47.63           +19.8%      57.06 =B1  5%  perf-sched.wait_time.avg.ms=
.schedule_timeout.io_schedule_timeout.balance_dirty_pages.balance_dirty_pag=
es_ratelimited_flags
     53.95 =B1  2%    +253.5%     190.70 =B1 18%  perf-sched.wait_time.max.=
ms.schedule_timeout.io_schedule_timeout.balance_dirty_pages.balance_dirty_p=
ages_ratelimited_flags
      4285 =B1  4%      -8.9%       3906 =B1  7%  perf-sched.wait_time.max.=
ms.worker_thread.kthread.ret_from_fork.ret_from_fork_asm
      0.77 =B1 15%      -0.3        0.43 =B1 72%  perf-profile.calltrace.cy=
cles-pp.enqueue_task.ttwu_do_activate.sched_ttwu_pending.__flush_smp_call_f=
unction_queue.flush_smp_call_function_queue
      1.76 =B1  9%      -0.3        1.44 =B1  8%  perf-profile.calltrace.cy=
cles-pp.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_after_hwframe
      1.73 =B1 10%      -0.3        1.43 =B1  8%  perf-profile.calltrace.cy=
cles-pp.do_sys_openat2.__x64_sys_openat.do_syscall_64.entry_SYSCALL_64_afte=
r_hwframe
      0.85 =B1 12%      -0.2        0.66 =B1 14%  perf-profile.calltrace.cy=
cles-pp.__pick_next_task.__schedule.schedule_idle.do_idle.cpu_startup_entry
      4.74 =B1  6%      -0.6        4.17 =B1  9%  perf-profile.children.cyc=
les-pp.__handle_mm_fault
      4.92 =B1  6%      -0.6        4.36 =B1  9%  perf-profile.children.cyc=
les-pp.handle_mm_fault
      2.85 =B1  5%      -0.5        2.34 =B1  8%  perf-profile.children.cyc=
les-pp.enqueue_task
      2.60 =B1  4%      -0.4        2.15 =B1  8%  perf-profile.children.cyc=
les-pp.enqueue_task_fair
      2.58 =B1  6%      -0.4        2.22 =B1  8%  perf-profile.children.cyc=
les-pp.do_pte_missing
      2.04 =B1  9%      -0.3        1.70 =B1 10%  perf-profile.children.cyc=
les-pp.do_read_fault
      1.88 =B1  5%      -0.3        1.56 =B1  7%  perf-profile.children.cyc=
les-pp.ttwu_do_activate
      1.85 =B1 10%      -0.3        1.58 =B1 12%  perf-profile.children.cyc=
les-pp.filemap_map_pages
      1.20 =B1  8%      -0.2        0.98 =B1  9%  perf-profile.children.cyc=
les-pp.__flush_smp_call_function_queue
      0.49 =B1 23%      -0.2        0.29 =B1 23%  perf-profile.children.cyc=
les-pp.set_next_task_fair
      0.38 =B1 32%      -0.2        0.20 =B1 39%  perf-profile.children.cyc=
les-pp.strnlen_user
      0.44 =B1 28%      -0.2        0.26 =B1 27%  perf-profile.children.cyc=
les-pp.set_next_entity
      0.70 =B1  7%      -0.2        0.52 =B1  7%  perf-profile.children.cyc=
les-pp.folios_put_refs
      0.22 =B1 20%      -0.1        0.15 =B1 27%  perf-profile.children.cyc=
les-pp.try_charge_memcg
      0.02 =B1141%      +0.1        0.08 =B1 44%  perf-profile.children.cyc=
les-pp.__blk_mq_alloc_driver_tag
      0.09 =B1 59%      +0.1        0.18 =B1 21%  perf-profile.children.cyc=
les-pp.irq_work_tick
      0.26 =B1 22%      +0.2        0.41 =B1 13%  perf-profile.children.cyc=
les-pp.cpu_stop_queue_work
      0.34 =B1 31%      +0.2        0.57 =B1 27%  perf-profile.children.cyc=
les-pp.perf_event_mmap_event
      2.68 =B1 10%      +0.4        3.10 =B1 12%  perf-profile.children.cyc=
les-pp.sched_balance_domains
      0.38 =B1 32%      -0.2        0.19 =B1 44%  perf-profile.self.cycles-=
pp.strnlen_user
      0.02 =B1141%      +0.1        0.08 =B1 44%  perf-profile.self.cycles-=
pp.ahci_single_level_irq_intr
      0.22 =B1 36%      +0.2        0.43 =B1 21%  perf-profile.self.cycles-=
pp.sched_balance_rq
      0.36 =B1 41%      +0.3        0.66 =B1 18%  perf-profile.self.cycles-=
pp._find_next_and_bit





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
