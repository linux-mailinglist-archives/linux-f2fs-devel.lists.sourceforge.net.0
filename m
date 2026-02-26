Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EMN6EQbQoGmTmwQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 23:58:14 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 687461B0A8E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Feb 2026 23:58:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BE1uOwNFHdL3PhGnxXOAaQuDUYL0e9IjZcGIQli8VTI=; b=JtAvudnJJsJF7OW1AAdjyJhg1g
	sSX1LMSGFNqj5ouFW55Oh/YN3lWytPSxXneSBnIycJalXslV9eX8b5gBaZco7wynltUDB5sMtU5YM
	ToHUBtKDK9R3e4zVT/cPbLp0R5l/pKh5hsqvhpg8Oh53z7CZSSw8rGx7f1fWw8tBNeHo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vvkJ5-0008M6-Gw;
	Thu, 26 Feb 2026 22:58:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ziy@nvidia.com>) id 1vvkJ3-0008Lo-Nc
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Feb 2026 22:58:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gOi1EIFkJ7ECXU61MxsO5+tWC3MJtJIuzyVIOTl3yHg=; b=loEdJTbKqMk7kagrs8n/702LQ4
 374vZwK32gYbcEAhpsvfOiTwF9Ou70OHboFWU0nSrqHwF0843rdjs9laRXamhnQ8Kb56Il7yPhzvr
 lRnlgnCjTPB5xTtEiPURUfJeNIXtJ4XFbKWw/qOf8nMAOsG6ryIW5c7UBvuF5ly5ZRiA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:References:In-Reply-To:Message-ID:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gOi1EIFkJ7ECXU61MxsO5+tWC3MJtJIuzyVIOTl3yHg=; b=I5iVc/6n7cEg75GA4chc8b23dL
 fMq66bE4Y3eCRptQTG5p4jZj99O1X27JWpuYRumgNRwwnweRRS5zYlUaZQ8HWKBfNOeIo8eKVQscG
 4DEW/tiY0ma6fG2rxRHjIPRuIIVGvvoNSO4wogEQvxz+VnhQFdQl21fYOolN3eMEO8KY=;
Received: from mail-northcentralusazon11013064.outbound.protection.outlook.com
 ([40.107.201.64] helo=CH4PR04CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vvkJ4-0001LT-3K for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Feb 2026 22:58:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lhavha2spCmaEND6NI+XyjF3qRGJef8GJDsDQD2uienfPqQeoFWMvFQ6FM16nl+N9ZvYq76eB0Jfp8fSzMHMP2S18qgsaWmBBKdUSCRdHvIG/yVUFjqDp+lr5V17tN92jmvvpq9fcd5qu0bXL8KYUWbmk99tS7G/plLOJ5rlJvihhyEplZHd3XsppWtU4AtpSBCRsz/r6gbvszBJoQMqmc/uzXCDDVC/C41SmW64yb5lPUkq39ZGB+lC+N+S4tVAvhiRLzez7WCGBR+t8KvpCwar0eVv/o+ygNDB0iN/l+NCH0cPnn+ORjHREnfRWpLt7YBZxubIEEV1SZbLcFvhoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gOi1EIFkJ7ECXU61MxsO5+tWC3MJtJIuzyVIOTl3yHg=;
 b=IZP6PBGSwN6NjcWjXWp8ByCWaEC4h22T/aUi9ZTLLyWVP72T91/H3lDoVpg3cuIYilXqRl9bpxGRzUlP10yoXMUAY8Ddp+UixffYdlqVUU4k/6XreHQBtjwGgyNofCshFBpAOsyxlp/hUztRFEYNnOjehRATHwHDTx/kAF96WcCRtAgpTdzP/w3FNkyC2WXefH9Gz3HX4fJpO0vxHbiXYOf9Ih3oOo5BACCo9RnohBiEgaqXz5/2Gj7ENOfJH2Wu805lpZd9w1yFkzFtj1qnQ6WKNVzryi5i4bEF7UcvVpLZWcl9vXPubFe1rzn2UHE/Dz7iwiTphHx3L9HMCbYP7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gOi1EIFkJ7ECXU61MxsO5+tWC3MJtJIuzyVIOTl3yHg=;
 b=fYoTxuivX5pUUs/qP6hIr748UgigF/btXqxTN0UurqztypEIznpPZvfXCJIRYBIRDorfDCBz239SksEZBOmoK0f1ytjxzChA6c9NPYfwCkXyEhG2KvQZ2vedlz1l61zgXcFDmq3WJsKXVFa1IOEd4G9KvCc6+C94XIRyMxMi0I2qex2tu7ApOr3ftaT0Q8sPPS2cpdSTgHOtNbE+1GfNTDfrYKZd3qzFwOOhEVoeAKqplpFV3RIbHIL/mIdyG5NBw+9bto57YqwVZe+XXEZ5Vqge+J0AFkoYRqvr2/M8uUTweNBAXerNbICbEN8gACB7TSctRqB6eh44C8mLpuVajw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS7PR12MB9473.namprd12.prod.outlook.com (2603:10b6:8:252::5) by
 CH2PR12MB4311.namprd12.prod.outlook.com (2603:10b6:610:a8::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.11; Thu, 26 Feb 2026 21:23:19 +0000
Received: from DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2]) by DS7PR12MB9473.namprd12.prod.outlook.com
 ([fe80::f01d:73d2:2dda:c7b2%4]) with mapi id 15.20.9654.014; Thu, 26 Feb 2026
 21:23:18 +0000
To: Tal Zussman <tz2294@columbia.edu>
Date: Thu, 26 Feb 2026 16:23:03 -0500
X-Mailer: MailMate (2.0r6290)
Message-ID: <2A496638-5119-4339-92CA-B1948B766FE6@nvidia.com>
In-Reply-To: <20260225-pagevec_cleanup-v2-2-716868cc2d11@columbia.edu>
References: <20260225-pagevec_cleanup-v2-0-716868cc2d11@columbia.edu>
 <20260225-pagevec_cleanup-v2-2-716868cc2d11@columbia.edu>
X-ClientProxiedBy: SJ2PR07CA0023.namprd07.prod.outlook.com
 (2603:10b6:a03:505::9) To DS7PR12MB9473.namprd12.prod.outlook.com
 (2603:10b6:8:252::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS7PR12MB9473:EE_|CH2PR12MB4311:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b114121-06bd-4b3e-6ee0-08de757d42e2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: BU62UA8ycRgdBhvEL9hpFgYsyQNFS0YhgNdTSOo6PDYG1mJssu4DhtgD3QfyEb3+Ya8OcwRb/p9ZizSSGOOQw9VC6R95KtGRM2PHGJ0a0RFq8A5yTEutExmhuydAOxKuecQq5Frql9NtnR0syFn+IyEngQJQdqi8rsyTrdaklxQQyKclYHxI4b5BanR+o4ks2lwFVuc8Lr4Mm5KqLen46y5zVCoyqFeXlLjFH7XC6ti8yoAhDzYB9F8N1CuPArsxc4PbyuCB28p1L+mRCyYrzV1KoBsE4DUCe1tbdMfUKi1Nr5WMn0/8/LTg9nlwrPe94C5PDbkIsX5FKPnlQnceiJbDui46jkLdVsKKQVoktuZ/332B9vrFyUCtUx88x066kt9yc0mCYK+qr2aW4fA3aqZ8OBv1GdVyQq5XkgvGPUC2ock4h7V8IBDw3BbEgxybliX7dnKgfIShleA+p7JNzJ7kJyQBr92t68ENe057KMWPSzpAE3OHxihp9ds0xoveHOlG+7nbNRpVQziSmQxpSiZT/dggQVofwXUlEZ5d37+nnXmwLNBNMU45tC5XLAjnimoLP0Q4qITNDLoEsv4x3Pbbq/a7Sop281Z2avJCdIl+bEB25diqwuVki/Y6PF7JeO8n1jGgzqGCVB0i04xv9Y3ogbm3ug5f292Fv6w+DVGkHaupsKd9bN9shkgbSbBqsk4u0xYkrUoT/a+pbx3hWD3pitR+lg5gOayDbZTRFnI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR12MB9473.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DteN/GYAg3knNpZxujGeliaF3KUd+qtIUwFeJNu+goAvyt9tglTAe++lhRdW?=
 =?us-ascii?Q?brDEwQiOW1NCA1yBCpzofAeOmqm9FPp+S+/Vhc8yeIYHVPyQ8Q4ZTjK6yAor?=
 =?us-ascii?Q?iCeEHjH71rGju8+7ComogvW41OJOe0wr/OBtgh7UX+eiqFS/AIZu5bcgVJIj?=
 =?us-ascii?Q?qLwmZr6vUlsDUfTwrab/32PVpmqKDkGM8ATjrKOMmXrnT/ztOKpvlGSwsuRy?=
 =?us-ascii?Q?jUi/p92PwkbeqRU2HaQd75c5TYMPvq7NczmV/F6/TRkbxDxCoUHNa71xZtY4?=
 =?us-ascii?Q?II2FeGDapTBI1GE7s1BK7m4+FM67HsYCoXLJbqiUqNLmyjqLyPx8C7mxAH0N?=
 =?us-ascii?Q?kRHM0YVt3Jo45t6fz2Im7VaaCT8oDKYuuBHg64GSEnrO6l78miSNjeaAH11q?=
 =?us-ascii?Q?LQweb2H7ruZag6xyfJW0NzQVK8PPSWsRPtsvqVuOYVqWSlLeEvO+5roiTgQl?=
 =?us-ascii?Q?6dwSAydZ9RsS9bvgY+nUg9d/Ie+7Vscwkt1FgUr0yN4Wh+Z57idVvD9p75/5?=
 =?us-ascii?Q?qfGOANdO21o+/RlvSIUK05FH+14Inobs6O+g1qAa1M41bnjsBRulSIA2ZxFx?=
 =?us-ascii?Q?jo6JEkpN9zdiXeH5q1GIav3dg7F/WuGljQVAQsEu2cv+pAoxWJK15MODdlxf?=
 =?us-ascii?Q?JbNYfBLI2Yu8lSbebh3Rnprrw63ByH9ni5d7SusJCjWBBY3PvRkatrwo4bn6?=
 =?us-ascii?Q?4U37+PPQBPbhTmJ8/nimIZNR89FQxYHlD9mIDt9vcJnieKoDQg2i46sxvtmj?=
 =?us-ascii?Q?QkSxKyr//ZyP6gtOEcsimEAtTHko42Ma9QRqzp8QdrwY/P+EFrAWwcDRyzKl?=
 =?us-ascii?Q?NByXxAYqAu3cEJiuU1bYgTMn+SfdKDq3KcwKWSbTS6QiKIz7FZpFMWFWWeYc?=
 =?us-ascii?Q?dB+cflncsktJNuqqpIFj3ssW1cYBidj5zxa1yrmxuplzuF5nP+/Oc4TUS65P?=
 =?us-ascii?Q?LsDNZuEUXCjxeAxnEGGsnZHXTZqNHga2rB02m5sH0E3Xb0rDvdHwDZNOjd+p?=
 =?us-ascii?Q?7hfyexuC3+rX3ixl2tmTYwYryheRx3A+eW9FwOiB1XJbYGWieV0b1/FPAwFc?=
 =?us-ascii?Q?037C0yzdLZN9LdgkWC2FYLIgy+YSf+4OkEU5OfewjOL7xWbFE2+87Js8jDjG?=
 =?us-ascii?Q?TH+K03kcsfoIo8evM7Hs4aUA0LYMzAsQbQCr6QrA7G6N0RQyEDNnOvbAXJeh?=
 =?us-ascii?Q?eR/qqenwInEMkEZLkFb68uaPzLmKwvqGkuPAp32P4swVQkWUqyEJRiNIVjH3?=
 =?us-ascii?Q?ADNz2kQRq2qUBj+a4vyfjJzyKblIhxnx3Y6AHG7XF5RiUPy8H9EKxI4hVpvq?=
 =?us-ascii?Q?wZekOCK43KSOAAWR3SJwBAPDIlOJS2RtemIzmQV+N7keJ02z0GHCTznF14MH?=
 =?us-ascii?Q?yiB8MY9CS8XDhzMWBD/mLgp4enZdZcRCx/3gE7n1jdev+05/B6l7mDys4/xH?=
 =?us-ascii?Q?vJl78FxCtK0belo1QwexqviqDHR6VGgE3BvhCSpdjUqPqUInClhSXNqewKQ3?=
 =?us-ascii?Q?mstL5gXKDzTVwu2+bFGIgDeGMm5ZJb4pu9h/SMAAYRgGo6LQFWq+ayc/rFDX?=
 =?us-ascii?Q?pN98uM/coPOw35wtCFmfmuZ8wVzvje69aFh0sl6/NQ1gSW6sg7+zstYnCdoo?=
 =?us-ascii?Q?XhjiPYHaqwmHOQyd/8V5KtbWoH2u7BCvjmCIr5BhtvJk+R/SMKdWHY3QPoU1?=
 =?us-ascii?Q?YDCDbRtX8Ht/v9iuP4HaKC1pGMlLnau/UbUkjcGubHzoUDpu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b114121-06bd-4b3e-6ee0-08de757d42e2
X-MS-Exchange-CrossTenant-AuthSource: DS7PR12MB9473.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Feb 2026 21:23:18.7973 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vwkPr3EKXn/HguwGcKVEamSWpgQ+EEF0wI+tO53qGpIRVaCsjamiaFHbeAHutHMu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4311
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 25 Feb 2026, at 18:44, Tal Zussman wrote: > Remove unused
 pagevec.h includes from .c files. These were found with > the following
 command:
 > > grep -rl '#include.*pagevec\.h' --include='*.c' | while read f; do >
 grep -qE 'PAGEVEC_SIZE|folio_b [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.201.64 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vvkJ4-0001LT-3K
Subject: Re: [f2fs-dev] [PATCH v2 2/4] Remove unncessary pagevec.h includes
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
From: Zi Yan via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zi Yan <ziy@nvidia.com>
Cc: nvdimm@lists.linux.dev, Paulo Alcantara <pc@manguebit.org>,
 "Darrick J. Wong" <djwong@kernel.org>, dri-devel@lists.freedesktop.org,
 ceph-devel@vger.kernel.org, linux-xfs@vger.kernel.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Brendan Jackman <jackmanb@google.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 Shyam Prasad N <sprasad@microsoft.com>, Chris Li <chrisl@kernel.org>,
 John Hubbard <jhubbard@nvidia.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 David Hildenbrand <david@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 Chuck Lever <chuck.lever@oracle.com>, linux-fsdevel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Trond Myklebust <trondmy@kernel.org>, samba-technical@lists.samba.org,
 Simona Vetter <simona@ffwll.ch>, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, Vlastimil Babka <vbabka@kernel.org>,
 Hugh Dickins <hughd@google.com>, Olga Kornievskaia <okorniev@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, ocfs2-devel@lists.linux.dev,
 Jani Nikula <jani.nikula@linux.intel.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Barry Song <baohua@kernel.org>, Kairui Song <kasong@tencent.com>,
 Theodore Ts'o <tytso@mit.edu>, Muchun Song <muchun.song@linux.dev>,
 linux-f2fs-devel@lists.sourceforge.net, Anna Schumaker <anna@kernel.org>,
 Alex Markuze <amarkuze@redhat.com>, Kemeng Shi <shikemeng@huaweicloud.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Peter Xu <peterx@redhat.com>, Chris Mason <clm@fb.com>,
 Pedro Falcato <pfalcato@suse.de>, Marc Dionne <marc.dionne@auristor.com>,
 linux-afs@lists.infradead.org, Baoquan He <bhe@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, Viacheslav Dubeyko <slava@dubeyko.com>,
 NeilBrown <neil@brown.name>, Ilya Dryomov <idryomov@gmail.com>,
 linux-ext4@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, cgroups@vger.kernel.org,
 Shakeel Butt <shakeel.butt@linux.dev>, Dan Williams <dan.j.williams@intel.com>,
 Oscar Salvador <osalvador@suse.de>, gfs2@lists.linux.dev,
 linux-nfs@vger.kernel.org, Nhat Pham <nphamcs@gmail.com>, linux-mm@kvack.org,
 Jeff Layton <jlayton@kernel.org>, Steve French <sfrench@samba.org>,
 netfs@lists.linux.dev, Mike Rapoport <rppt@kernel.org>,
 Michal Hocko <mhocko@suse.com>, Jan Kara <jack@suse.cz>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Qi Zheng <zhengqi.arch@bytedance.com>, Yuanchu Xie <yuanchu@google.com>,
 David Howells <dhowells@redhat.com>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>, David Airlie <airlied@gmail.com>,
 Andreas Gruenbacher <agruenba@redhat.com>, Mark Fasheh <mark@fasheh.com>,
 Dai Ngo <Dai.Ngo@oracle.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Axel Rasmussen <axelrasmussen@google.com>, Jann Horn <jannh@google.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Tom Talpey <tom@talpey.com>,
 Bharath SM <bharathsm@microsoft.com>, David Sterba <dsterba@suse.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, Wei Xu <weixugc@google.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Johannes Weiner <hannes@cmpxchg.org>,
 linux-btrfs@vger.kernel.org, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tz2294@columbia.edu,m:nvdimm@lists.linux.dev,m:pc@manguebit.org,m:djwong@kernel.org,m:dri-devel@lists.freedesktop.org,m:ceph-devel@vger.kernel.org,m:linux-xfs@vger.kernel.org,m:lorenzo.stoakes@oracle.com,m:jackmanb@google.com,m:tursulin@ursulin.net,m:sprasad@microsoft.com,m:chrisl@kernel.org,m:jhubbard@nvidia.com,m:viro@zeniv.linux.org.uk,m:ronniesahlberg@gmail.com,m:david@kernel.org,m:surenb@google.com,m:brauner@kernel.org,m:linux-kernel@vger.kernel.org,m:chuck.lever@oracle.com,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:trondmy@kernel.org,m:samba-technical@lists.samba.org,m:simona@ffwll.ch,m:linux-cifs@vger.kernel.org,m:linux-nilfs@vger.kernel.org,m:vbabka@kernel.org,m:hughd@google.com,m:okorniev@redhat.com,m:mripard@kernel.org,m:ocfs2-devel@lists.linux.dev,m:jani.nikula@linux.intel.com,m:jaegeuk@kernel.org,m:baohua@kernel.org,m:kasong@tencent.com,m:tytso@mit.edu,m:muchun.song@linux.dev,m:linux-f2fs-devel@lists.sourceforge.net,m:anna@ker
 nel.org,m:amarkuze@redhat.com,m:shikemeng@huaweicloud.com,m:joonas.lahtinen@linux.intel.com,m:peterx@redhat.com,m:clm@fb.com,m:pfalcato@suse.de,m:marc.dionne@auristor.com,m:linux-afs@lists.infradead.org,m:bhe@redhat.com,m:willy@infradead.org,m:slava@dubeyko.com,m:neil@brown.name,m:idryomov@gmail.com,m:linux-ext4@vger.kernel.org,m:intel-gfx@lists.freedesktop.org,m:baolin.wang@linux.alibaba.com,m:rodrigo.vivi@intel.com,m:cgroups@vger.kernel.org,m:shakeel.butt@linux.dev,m:dan.j.williams@intel.com,m:osalvador@suse.de,m:gfs2@lists.linux.dev,m:linux-nfs@vger.kernel.org,m:nphamcs@gmail.com,m:linux-mm@kvack.org,m:jlayton@kernel.org,m:sfrench@samba.org,m:netfs@lists.linux.dev,m:rppt@kernel.org,m:mhocko@suse.com,m:jack@suse.cz,m:roman.gushchin@linux.dev,m:zhengqi.arch@bytedance.com,m:yuanchu@google.com,m:dhowells@redhat.com,m:joseph.qi@linux.alibaba.com,m:adilger.kernel@dilger.ca,m:airlied@gmail.com,m:agruenba@redhat.com,m:mark@fasheh.com,m:Dai.Ngo@oracle.com,m:jgg@ziepe.ca,m:axelrasmussen@go
 ogle.com,m:jannh@google.com,m:maarten.lankhorst@linux.intel.com,m:Liam.Howlett@oracle.com,m:tom@talpey.com,m:bharathsm@microsoft.com,m:dsterba@suse.com,m:konishi.ryusuke@gmail.com,m:weixugc@google.com,m:tzimmermann@suse.de,m:hannes@cmpxchg.org,m:linux-btrfs@vger.kernel.org,m:jlbec@evilplan.org,s:lists@lfdr.de];
	FREEMAIL_CC(0.00)[lists.linux.dev,manguebit.org,kernel.org,lists.freedesktop.org,vger.kernel.org,oracle.com,google.com,ursulin.net,microsoft.com,nvidia.com,zeniv.linux.org.uk,gmail.com,linux-foundation.org,lists.samba.org,ffwll.ch,redhat.com,linux.intel.com,tencent.com,mit.edu,linux.dev,lists.sourceforge.net,huaweicloud.com,fb.com,suse.de,auristor.com,lists.infradead.org,infradead.org,dubeyko.com,brown.name,linux.alibaba.com,intel.com,kvack.org,samba.org,suse.com,suse.cz,bytedance.com,dilger.ca,fasheh.com,ziepe.ca,talpey.com,cmpxchg.org,evilplan.org];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,Nvidia.com:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[95];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,Nvidia.com:s=selector2];
	NEURAL_HAM(-0.00)[-0.949];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[ziy@nvidia.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim,nvidia.com:mid,nvidia.com:email,nvidia.com:replyto]
X-Rspamd-Queue-Id: 687461B0A8E
X-Rspamd-Action: no action

On 25 Feb 2026, at 18:44, Tal Zussman wrote:

> Remove unused pagevec.h includes from .c files. These were found with
> the following command:
>
>   grep -rl '#include.*pagevec\.h' --include='*.c' | while read f; do
>   	grep -qE 'PAGEVEC_SIZE|folio_batch' "$f" || echo "$f"
>   done
>
> There are probably more removal candidates in .h files, but those are
> more complex to analyze.
>
> Signed-off-by: Tal Zussman <tz2294@columbia.edu>
> ---
>  fs/afs/write.c                   | 1 -
>  fs/dax.c                         | 1 -
>  fs/ext4/file.c                   | 1 -
>  fs/ext4/page-io.c                | 1 -
>  fs/ext4/readpage.c               | 1 -
>  fs/f2fs/file.c                   | 1 -
>  fs/mpage.c                       | 1 -
>  fs/netfs/buffered_write.c        | 1 -
>  fs/nfs/blocklayout/blocklayout.c | 1 -
>  fs/nfs/dir.c                     | 1 -
>  fs/ocfs2/refcounttree.c          | 1 -
>  fs/smb/client/connect.c          | 1 -
>  fs/smb/client/file.c             | 1 -
>  13 files changed, 13 deletions(-)
>

Acked-by: Zi Yan <ziy@nvidia.com>

Best Regards,
Yan, Zi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
