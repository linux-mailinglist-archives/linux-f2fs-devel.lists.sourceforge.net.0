Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8CBE766D96
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jul 2023 14:48:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qPMtn-0002kZ-3W;
	Fri, 28 Jul 2023 12:48:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <simon.horman@corigine.com>) id 1qPMtj-0002kN-P0
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jul 2023 12:48:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:In-Reply-To:Content-Type:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Xzzfw+scYK/2YqjGbTNey54nczLq8zQJMyRBqxq/QfQ=; b=WdxnpuMBWtHLLtwkUVxRZAF0Hx
 tahYOjlNF3eTDpqJvIfAAW8rfEK4SKRnoZJ3fN4rxdVluy7SpwigdN22eNnibkjlEN8kpxzkh1C1I
 ZTa5u9XGwA//Az+Tnh4hW1dRY1IP5f7kUs2t2ZHvz0g9ziuycHlKYuCLIYwckBkBIViA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:In-Reply-To:Content-Type:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Xzzfw+scYK/2YqjGbTNey54nczLq8zQJMyRBqxq/QfQ=; b=bkGe2yjXC9QV8m7xRNGbtCq9aL
 eS9RhJWmltE4vS8uUJ33ZxX4hIERBzHUggCPqvDn8vzQdXTnYcJfAqlMbWkJBx/oY4ItAz1F+hMM5
 JkPkBdD7Gj6jVf4rBgRaF/U4qr5GAlyPnP+fxNUz/kvOA8D/L0fb1KxTVD8Jj28zdd7o=;
Received: from mail-dm6nam11on2096.outbound.protection.outlook.com
 ([40.107.223.96] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qPMtd-005ViL-Ng for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jul 2023 12:48:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Er101cT5uk/XHBCznY2/k5+cLhGAuB8Sy/3p36aspkiBQKoCWu3HtiJtIrZQYankv+nTRukViGhN3M05D8Z01dAHS3fucSm/+G5DWnHEzUUU3ZdEjS+/dan14HS35xHtm24q1+cp3l1UzgDIm5sbdGINS8oe5/cya2HR8tDeX5JzbozDROgyllffH2aNY3HI8hw2KvpcV8OYhSnuzGpRVzVPMWdVxyXsYBdQSn7VSIvMttxuHezvwa6W0ImL/Nvrq4cvqrOPvIuP4wdE1mErbNkD7+FpDRN7NK2uTgVMFwwmmFDQBe3PR0MhBW3ZyUIG8EKcnHxS1NpID5P66r//CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xzzfw+scYK/2YqjGbTNey54nczLq8zQJMyRBqxq/QfQ=;
 b=e9CmfzXHEXu/9hc9x5N4Qmka3ZfXjWLVicc8cx4Ws1NNSoNWSFYoRJHDGBiEgyVcKyagA9/Sc+/lCBnRV7oMLJNtO1SffSMZ8FwLJ4T7BqsvqEaqb6nc66RrATBoXJaSutEYfcAJOHQEzNV3nuhv6VWYRMsXFLDUWoybG/p0iv4eVqikZ3uOUqVg6Qamd6/uPIcTh0wgtpUaXIs9cQZMK0DwEHs+i34XA9b5O1Ma1vBcWIxl48rgymzI0ghEornysoiAev0mBueaPupTegFSwvAWDcgc/B16fkcjzJfns6T2pezqSNMWX0YsSMeSH9mMpwnNaBh4kGlqcgr4zXxdFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=corigine.com; dmarc=pass action=none header.from=corigine.com;
 dkim=pass header.d=corigine.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=corigine.onmicrosoft.com; s=selector2-corigine-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xzzfw+scYK/2YqjGbTNey54nczLq8zQJMyRBqxq/QfQ=;
 b=mL9AyN/fBcV+ui4AnBqPDcnT4Rfvs0aXlWohtRd2EWGfLctbaco+RyhPEOVmM1LC7k0xh10ZdY9/lH1R+IIdz5iL2xHceOtIwm2Ywkg8/mr6gB4jbKKymAgCpJfqXDw+3aZmvekIXFVJaMG8QzSh/9Y2+gcThGyNxfHSLP2lNGg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=corigine.com;
Received: from PH0PR13MB4842.namprd13.prod.outlook.com (2603:10b6:510:78::6)
 by CO3PR13MB5752.namprd13.prod.outlook.com (2603:10b6:303:164::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.33; Fri, 28 Jul
 2023 12:17:35 +0000
Received: from PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d]) by PH0PR13MB4842.namprd13.prod.outlook.com
 ([fe80::fde7:9821:f2d9:101d%7]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 12:17:35 +0000
Date: Fri, 28 Jul 2023 14:17:23 +0200
From: Simon Horman <simon.horman@corigine.com>
To: Qi Zheng <zhengqi.arch@bytedance.com>
Message-ID: <ZMOx0y+wdHEATDho@corigine.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
 <20230727080502.77895-6-zhengqi.arch@bytedance.com>
Content-Disposition: inline
In-Reply-To: <20230727080502.77895-6-zhengqi.arch@bytedance.com>
X-ClientProxiedBy: AS4P190CA0065.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:20b:656::10) To PH0PR13MB4842.namprd13.prod.outlook.com
 (2603:10b6:510:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR13MB4842:EE_|CO3PR13MB5752:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fa1c089-2344-4b06-3624-08db8f649f2e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j0Mc3eF+DP2LxDOozLRyyeIKECVLGRQIlIrdEFb9GZyo19Z8jeFLDt/bCDbFSf8N0UgLcZ5nANCSfFPp9ph0OUTRm7F2bEGtxXu0ZMmYHB++UDEI/qt4sQIsHpj+LQqg6gGfURY4hT2IDCWGw6Ybqs5E7pgqpJs4J/nInIqn9VFU5CgQ+GK35/ZyTVoe6qWgCri0ck8ovO1iCvPMl6pQY1O5aEK2fI+4PMy9h3gUmAn1qC8GUFYKGFd4nIODUjceb9/B+WqmJi70ci7KBpycck/dYE/oE/fSNvWH87L2EN/RSEwJk4PFsx+XLA/x2ei5z3yj6T2zjDIjyD3Tat8vFp7m6b/5G97rY5DcrR5bpBvN1ryBFxovF049q1oBmHR1y7JP7MnntYWy7a2vGVlaH8cxiuhFvjFImRVlPHL7jFTnBxTs4DERfppx6DRLuWoyS8O4un5AQcw6WdKHT5UELpX36pMqwNA+j9Lbq5wh+3whyO46TZ2AhZlYvDlKlv7kTBixlXGW0fX6p3Xifb3vwnkvHoPd+UmsM9xZCOzMyPnlNSvXgvaF2p9+YayAMBmddGwNQoAsFRS9MKI4K1hSr40LZzFN4IAgjQ9J2S041xn/JxtQtD3rgjJxgmntTaofdMkuJGANvA4JO5mZkvQzhMrAXXqvJEOmaFoTF7J+yac=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR13MB4842.namprd13.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(136003)(39840400004)(376002)(396003)(346002)(451199021)(6512007)(478600001)(38100700002)(66946007)(8936002)(5660300002)(8676002)(66476007)(4326008)(6916009)(2616005)(41300700001)(66556008)(316002)(186003)(83380400001)(6666004)(6486002)(6506007)(86362001)(2906002)(7416002)(44832011)(7406005)(36756003)(67856001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hPOsWUyNfuPgdO7KGPoxy8ksAiev8ZQ1mx/yK17hREAs80+Bp/61g+ypXcBT?=
 =?us-ascii?Q?HRu9jj6Qg9t07l3KXDplFpMfQmItUDmp/Rl49c3/yUZM8HLSVEUOfoYJFdhK?=
 =?us-ascii?Q?fSIgaNpvoQXryHYMgHOanbyxDsp2IMAM6Iww3QBkSbl730EEjBs5gxcDmCBb?=
 =?us-ascii?Q?QU1V3uoMqgXFhC9JWnnqZp0aSbsHbu4zyZTUWyLGqTYI6pmieGdUW+8LkwcJ?=
 =?us-ascii?Q?T0GkZ4g8qlRo4jk+l6xQ02skBq3BqXWvBLVBQRtkCmtFKTWh610fwMxsVkoM?=
 =?us-ascii?Q?Gnf1thqRe/k1tAWbVMF/a2+G6R558nSRbYsvwdfjoHnDY28X/sYjDBssYr/q?=
 =?us-ascii?Q?Fl6V7TlPdnX6ywkUx5QWinxcmi8lKgaJNWdDfDu8wspT9jG0cJH0gQIv8Cex?=
 =?us-ascii?Q?cNhBeOU3ZulAAFO34xSBp6jb7eFge1AhhnnJZIBgJ9hh24EkK39dXWvylKlQ?=
 =?us-ascii?Q?1ktLIUVF5yMuV2Vmvd4TziJI/G+7EgoKWYvFlDgX7ABke4nbRWeHbG1dmjGp?=
 =?us-ascii?Q?7x5Zw8PVMIwKgAsHbCNrvEO06CmHCJ8AK/tIKMjp9T9xZi65K/IJ05WsKAuj?=
 =?us-ascii?Q?Qxr+kkU/EkZ4MWrTGeAGpaQZQGgh0h8UttK3ddqpmeHbsrx7bDjMbskRnWJp?=
 =?us-ascii?Q?rZ1C0HmN3hiOwYzCPuGdDiZMr7t98q9NV65gQ/SHiXGpM6OCy0OKTkSOSIH1?=
 =?us-ascii?Q?V7Et5iOjOIWdAwR598SHY6uUul9gU5PLOnE30G/jnDxc7wFZUZJMBWyq8BLd?=
 =?us-ascii?Q?rfdzv008lWuhfWDgCaiiB492XTgsC2nNrDNWe29D47eQpQ7OuJIdthMJCJZx?=
 =?us-ascii?Q?l2b/Zb5/I6p5bjCx0Q4WanQW6fBtQG12r7Yr7GEf1W1aFoeQprvePdMpArft?=
 =?us-ascii?Q?pdbQ0CR0h3XJO4+2uuuWmNajIA4qboVi0YBp+K7rQ8PLx6xS+mFQXOiI4Hoa?=
 =?us-ascii?Q?v502tXURqyFypRcDKv6AIFRJQ6JhFLxbbuXNsFzLiWtdAx+kU4nwt6iqJ7Yn?=
 =?us-ascii?Q?LhZkjIdd3zSfy/4HixYBTehrS52N44jF827Sh3vdaRtSQYMGr/Ezf8kqDUuG?=
 =?us-ascii?Q?y8G3exbJVKS4cLtpL4Ae0oq2lWyJ6uZ3msnMmUROXYeb+8uClJ6zkgDbdoNR?=
 =?us-ascii?Q?bWMHaZTumykYTjazZdHf8vwaUSWqjBfQYE3BA2HsxCns+aaaxAVro0VuntZB?=
 =?us-ascii?Q?gDASa2H6OUzdubnVa+jZ6ZNxQZEkLclBxmbs3xg4jWiFrHt0nmYg+BCOrJTT?=
 =?us-ascii?Q?B+X7yNNw5UizQNg6XjkKzmt3cUpuw7upYP9vz23zka7o2TO4MTsfcRopjPdM?=
 =?us-ascii?Q?Kd2qtjL8Yj5ZTL6bJI+IEDTIgXkj6+W0ErfOvDGVyFIPud8PIhk2Vs9NCwbI?=
 =?us-ascii?Q?jrHvmo7xrbGGkVITjitLJ15ofnoW7jlUEZMtIr45BECVNAskC2eroDIELfbh?=
 =?us-ascii?Q?drKPUw6+OUS8C/sferQ8mAXHxjVFmphteP7aP7p50cbQF/4fiuKXqxV+BS5f?=
 =?us-ascii?Q?HRsARsK+VfL9529UpcyCv5oQHYnC+JR6JGkWgnOGhw9GJX+T6zjmEhXAFSlG?=
 =?us-ascii?Q?sjiaqZOwyEuD14aXMfYytHlpYjb63AL5QMCw/26rpqFaI0q0wW+Monr3okit?=
 =?us-ascii?Q?gXo9kiB3+KBcH9Z/XZprsS/Ue0QmWLJ6Uegfo/4/Hd6o8wkg8oTMbd8yz3WX?=
 =?us-ascii?Q?HVhI7w=3D=3D?=
X-OriginatorOrg: corigine.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fa1c089-2344-4b06-3624-08db8f649f2e
X-MS-Exchange-CrossTenant-AuthSource: PH0PR13MB4842.namprd13.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2023 12:17:35.2229 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: fe128f2c-073b-4c20-818e-7246a585940c
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iZe55KImseJDEXyvSQcePinFJYyerifPEHQDYs0bVw2T5jNObZA26ORFCKwaaGDVoaLdpiLFCL17f5WTZYMy0/KrkxWVzjRme/VzT17S8OY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO3PR13MB5752
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jul 27, 2023 at 04:04:18PM +0800, Qi Zheng wrote:
 > Currently, the shrinker instances can be divided into the following three
 > types: > > a) global shrinker instance statically defined in the [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.223.96 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.223.96 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qPMtd-005ViL-Ng
Subject: Re: [f2fs-dev] [PATCH v3 05/49] mm: shrinker: add infrastructure
 for dynamically allocating shrinker
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
Cc: kvm@vger.kernel.org, djwong@kernel.org, roman.gushchin@linux.dev,
 david@fromorbit.com, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, cel@kernel.org,
 x86@kernel.org, steven.price@arm.com, cluster-devel@redhat.com,
 xen-devel@lists.xenproject.org, linux-ext4@vger.kernel.org, paulmck@kernel.org,
 linux-arm-msm@vger.kernel.org, linux-nfs@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, yujie.liu@intel.com, vbabka@suse.cz,
 linux-raid@vger.kernel.org, brauner@kernel.org, tytso@mit.edu,
 gregkh@linuxfoundation.org, muchun.song@linux.dev,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, senozhatsky@chromium.org, netdev@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org, tkhai@ya.ru
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 27, 2023 at 04:04:18PM +0800, Qi Zheng wrote:
> Currently, the shrinker instances can be divided into the following three
> types:
> 
> a) global shrinker instance statically defined in the kernel, such as
>    workingset_shadow_shrinker.
> 
> b) global shrinker instance statically defined in the kernel modules, such
>    as mmu_shrinker in x86.
> 
> c) shrinker instance embedded in other structures.
> 
> For case a, the memory of shrinker instance is never freed. For case b,
> the memory of shrinker instance will be freed after synchronize_rcu() when
> the module is unloaded. For case c, the memory of shrinker instance will
> be freed along with the structure it is embedded in.
> 
> In preparation for implementing lockless slab shrink, we need to
> dynamically allocate those shrinker instances in case c, then the memory
> can be dynamically freed alone by calling kfree_rcu().
> 
> So this commit adds the following new APIs for dynamically allocating
> shrinker, and add a private_data field to struct shrinker to record and
> get the original embedded structure.
> 
> 1. shrinker_alloc()
> 
> Used to allocate shrinker instance itself and related memory, it will
> return a pointer to the shrinker instance on success and NULL on failure.
> 
> 2. shrinker_register()
> 
> Used to register the shrinker instance, which is same as the current
> register_shrinker_prepared().
> 
> 3. shrinker_free()
> 
> Used to unregister (if needed) and free the shrinker instance.
> 
> In order to simplify shrinker-related APIs and make shrinker more
> independent of other kernel mechanisms, subsequent submissions will use
> the above API to convert all shrinkers (including case a and b) to
> dynamically allocated, and then remove all existing APIs.
> 
> This will also have another advantage mentioned by Dave Chinner:
> 
> ```
> The other advantage of this is that it will break all the existing
> out of tree code and third party modules using the old API and will
> no longer work with a kernel using lockless slab shrinkers. They
> need to break (both at the source and binary levels) to stop bad
> things from happening due to using uncoverted shrinkers in the new

nit: uncoverted -> unconverted

> setup.
> ```
> 
> Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>

...

> diff --git a/mm/shrinker_debug.c b/mm/shrinker_debug.c
> index f1becfd45853..506257585408 100644
> --- a/mm/shrinker_debug.c
> +++ b/mm/shrinker_debug.c
> @@ -191,6 +191,20 @@ int shrinker_debugfs_add(struct shrinker *shrinker)
>  	return 0;
>  }
>  
> +int shrinker_debugfs_name_alloc(struct shrinker *shrinker, const char *fmt,
> +				va_list ap)
> +{
> +	shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
> +
> +	return shrinker->name ? 0 : -ENOMEM;
> +}
> +
> +void shrinker_debugfs_name_free(struct shrinker *shrinker)
> +{
> +	kfree_const(shrinker->name);
> +	shrinker->name = NULL;
> +}
> +

These functions have no prototype in this file,
perhaps internal.h should be included?

>  int shrinker_debugfs_rename(struct shrinker *shrinker, const char *fmt, ...)
>  {
>  	struct dentry *entry;

...


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
