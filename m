Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ED00D607E5B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Oct 2022 20:39:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1olwv4-00046B-Ce;
	Fri, 21 Oct 2022 18:38:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1olwv1-000462-1C
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 18:38:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QXDv+YXFosw2fWAKFtHiAv4uJen+//GC3ZPUMcMiEhE=; b=gmBq9SbCOVVEWqUaszYD+9Xrlp
 nr9qIxoKGVPz6I3cXLrazqPKYg059MLl9aIN6t0VcsnqW0axRYcd45FiTIS2n7Txr7Y9FoC5wrPPB
 GIBqjWBXKjpLh7goGiR9MR4fSi9rNfGMjySg+2b7oG4qWHICC+NBKaJnSui086PSMfN4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QXDv+YXFosw2fWAKFtHiAv4uJen+//GC3ZPUMcMiEhE=; b=dzXU85pQPjxBnwKEbcaEbu3+7Z
 Z7HZD/FwJPt7Dbe/zHUXd1TmMdAx8WxMiT8EwftopX+lAgd9RDn2TTB5ZdxKYIBhKUS8SDIwy9KXf
 OpfxhyckIyS0l+V4c5XrmPszplBc33/AvcOmpABW3itwdxlHx0mkaijB44tSdnvF/F44=;
Received: from mail-tyzapc01on2131.outbound.protection.outlook.com
 ([40.107.117.131] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olwuu-0004qr-QU for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 18:38:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YErfffnK9FcS5q4zYs7esLo8UJlFiS08PFmdq6I/C1ShXMBjVHNadEg6AGbCfQ2mVwUUsSsOeIW/s16hPDko41bZSTIRH72S4pgiP04pnxsmc52ydLYuXr2KuiSQp4z8pzRLnBguiFBJlypyK6NJYvAtWt8WUz9DQ5XfcUgFwfpn2D1wZX4k/nh1o/14Lmhym2Cy5VpRvVAJknpIhxtp8ZpLZ2USDYiBk4ruLCuJB7SduJ19uZlyaqEI+xdKOrAqGfd2eESvMaKhCo2K9o2Ljob9b+CPF/nqtWbpQB7t0T2kmSuQ/Tt1XUH6xG6ixigmumiyPj1ShuVKcQwB9LwAGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QXDv+YXFosw2fWAKFtHiAv4uJen+//GC3ZPUMcMiEhE=;
 b=F0S3msS/3RGU2ruW+7w/y+UesUfrvNPmYrPR/PcnD6qVvKbtmXAgwWCEhLuAl9awHzeq3DGTI2msFj1eU2x4CZiZIifOfyjmhhdQboDtX8fGBQvc+JWXBy+SPYzFOF1ZJ07fLUjxz7MmegJrTvEx39uvrhMwqxjmF0VedY6v+7Wi1EmaZtihYOKTRRrA7pWJWMDlJ2ZhoIcygj/Wir9BaQaIYHJDm2EdbIcskK40O8UCRG19nofba3VkHKv1uC0z8T46RRYgRHQrn3ZYGDS++Iqou2cQ+1royvWYMO99HX07yku3HsuX9E7XqhspsHrpb0mlskK9KC5HMZMyTqJpTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QXDv+YXFosw2fWAKFtHiAv4uJen+//GC3ZPUMcMiEhE=;
 b=dgK88fsnggDiHuVY0KGX8jMqm2PXFGKC1oDYNKUdXzmLrz9kdAfByb7LFJipFOQ8zng7YsAuBilhnfKzXk57cOSpU7QUxVNeEPyJbnW5s6V0igMXSLeEYFes27maCjNnN7haNdnqM7jgPtNSia25YyMDIG+i9RBp2QOyGds0gGIVGe36SVzDRXfALd3HCEPXsMbBZx+uLGe5qPnme3QjNa8ENxdTki7fMzZ2lrUyKfNzf9ZW7KNqKTWNPxI+pFRUk1PTW8/9Z/ngzbvLpe2eBJ1L3QkDlDmHzQRv/XAjTlOpGKQWv+zbWdS4Frko7EjeWcnOBApqJ98l9P++tBnRtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PUZPR06MB6223.apcprd06.prod.outlook.com (2603:1096:301:107::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 21 Oct
 2022 18:38:40 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd%3]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 18:38:40 +0000
To: chao@kernel.org
Date: Sat, 22 Oct 2022 02:38:07 +0800
Message-Id: <20221021183807.18640-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <b578c945-f695-d505-1e97-fcfbcef6e670@kernel.org>
References: <b578c945-f695-d505-1e97-fcfbcef6e670@kernel.org>
X-ClientProxiedBy: SI1PR02CA0059.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::19) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PUZPR06MB6223:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a6e6dd0-3751-4516-c894-08dab393795f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9kb4TfZ84T/mwiykihtNyLtkfiv7N0Z1MR/1F8jYakixQbyuCDkoDj8/3kn4Z9JU9wPKcBE0HDQXE3fo3lxebE0qGKBPoVuVELEeKrzQ/Kua0/i5vWJvWIuN2IkdVpF5njm8GBNOC7zxtbIeX4YKXunE3MrfnHGVsmJ8kKe3jfASE0lg/hCKImi/EsU++8VVY3YzRgzU2uo+sVjaF9YrRjnCPGlyVQlVOoJAUU6UhuZ+yC3KS0I6oFNwTleuJvZzqokONJjaz5VVQco2OYmsJaLqb9fhrWbp42VPWf69p647C8tQJANFzm1LzzQCZQSf9YZgYePD09JmzLuIk7vowEnvVM6sI9d0Kbv+WBgUoIVczKetF8y3xzrb5yKFH3zIVg72KFRuk5XzHoIsXOpg7tvMbW8Ph8ZQ9Iko8GhBxoOefHld4aq9jzWpKz9gMDvXcaLc5ZtkPAgJWDevfIHbXFby6RYB8wqwlg8Q39UFQDX4MD8IpTShoBZ5W/xYlLt+1pri9PUrrFxaNzgYR/2GTWM3QFN3d3NdapIQcFAkPmhqaKU5S8+Pv7XDVdhDex7A1oaCmAtTWkmMFNA9HKjQBExsRmwWXm5OAZY5HQ8t0gg8P9R5+cMdXQxSZHL3ujtdLcUtuDVcmmRlfw9hOcGFTV1dM7GKsEYTXmMfPluY43iaqudw5LUZwMUIrBrBrobr2DziY722AvvCzGkj2RknWXMFNYGlaIUmjg3QXrKL+15NgAE3bmjRFDRAPkViTcEnIBz2HYgsoH2VEZY52D6fZg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(396003)(366004)(376002)(39860400002)(451199015)(6486002)(6506007)(6666004)(107886003)(186003)(52116002)(6512007)(26005)(478600001)(2906002)(1076003)(2616005)(4270600006)(6916009)(66476007)(316002)(8676002)(66946007)(66556008)(4326008)(8936002)(41300700001)(86362001)(5660300002)(38100700002)(38350700002)(19618925003)(36756003)(558084003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mvYrpZzaKPxLQKa0/Kbl7EJk/RElF0P9eXA+a0n9gjzxWgxHXkdslImC8IyQ?=
 =?us-ascii?Q?HEBWKlxN3TyeMUIW0+frXNDFS9nzpkuzIrMddxHpKBeqOCw6Zw+6W6b3JcLi?=
 =?us-ascii?Q?KxNUIFFtWi4zbktiKn9jF+47XgcgAdoh4s6AvvMLOerzOu7L/+MOuccSB4ol?=
 =?us-ascii?Q?Vlbpr/giE0+xu3PBwtuKHmz50Jb41yz5Cuj4M9MbsED8p0DNiBpQ+xf4vbKE?=
 =?us-ascii?Q?BaC/Rcr92t2yB9kSgD+JosHdrnAsizEBjYr0G9H6oLH79wiPQjXD1jn42YJp?=
 =?us-ascii?Q?heod7+OKeUwFNy1klx+3ynLWtMyZ/8iGm+C6970KXBN4Qkdk0ZXY3uJBZdyT?=
 =?us-ascii?Q?Jcg9vUnJ7wAHiFC7EQTl0+uPpWNQxyHK9xPfiuVz+382kFAocU5y34qOJubP?=
 =?us-ascii?Q?J0iLFtw2xR5ASv2LbINUaHZif95KYsYLImh7zWKx/aE+0ryfz3lVMWu9pDFL?=
 =?us-ascii?Q?jIfscAQfhGy2SiAeBCBUAT1+EzGet0FPxr0EVGQlOVh0cSZYZ6eyyKQcQQVC?=
 =?us-ascii?Q?ERzPPW8ZnGFBKzm1OYVzcJVq9HDrgY71xx99zzFuPpzIL8fQxi6BYu7nK6zV?=
 =?us-ascii?Q?XrxZA2SJKZFTDG9vL0j3KzVJCMlHyhHES14V9spQMy9PcYN2r5RWdB1ocrzW?=
 =?us-ascii?Q?r2l5AgF5+f/LMVQbNlnksXpawb4fyj7B91+sV46wsojq5YlQRVGX6x2MtRgC?=
 =?us-ascii?Q?uzIPKq0VYGjg0BMrPoeJn69fqCVtdNKcKOJg8uv3jpNO5dkrz3M+bTnGwM56?=
 =?us-ascii?Q?TUmbnVgnUomx7NAXsWz3HPhybPXEwcX8ZAXxo2NoJdLb8ATje/gc8NUIid1R?=
 =?us-ascii?Q?AnqPvficpJRX6tuDWChudqGRCZxm/rp0m//ko32XwJKz8AgvV1zwBFvPZ8QQ?=
 =?us-ascii?Q?b74wMOWuH+pZxjMoA+8LNGtZC4oBW42so1hMCJJp9A7bodZadDb/Jbo4kn49?=
 =?us-ascii?Q?//Imwh0RWsFiFxRDJKb0sW/bkJDeKz8yzFfVlsl1eIZslFTQCU6EJybrStOf?=
 =?us-ascii?Q?gcsQbPmUpE7lIggte6hf8d2WPZ8q/54e5NaOMBlNpL6ulOi2sYwBptpRRjAB?=
 =?us-ascii?Q?O06KJP5qJQSrdY9qsuGyamylmu0zbfucuKt5Em6efGtpV4td2HkYBSrmrjN4?=
 =?us-ascii?Q?gGtQpEUAZCoYkcrXidzcZsGnla99tykpZwo+Io1vsME07asNWOKXQeuRuzDk?=
 =?us-ascii?Q?NM56/ADI4uj/hts+HjqsIHKt6vtv5+ZH3RjONA3nHboyAzsTqyXeZwYWaRQw?=
 =?us-ascii?Q?LI4CHZsvrqVDDuTPrxiXRA8B7sFRu7XR60ghW3TOxFkRElH4TMBvq1r5jrv0?=
 =?us-ascii?Q?DOY7Jt1TgNOcalz6K2jU4pmKFB3V9AqNp0XWN6Jf4wdnrBbQOaiyB8KwnS/d?=
 =?us-ascii?Q?7jZYOTM6U6KGz7/ME80BeakVnnolDtNcYfUfqPcJstKWDmsjvRPxgeXo1r79?=
 =?us-ascii?Q?vfodO1GvbhpJCLfCjninsfM4KqcuQ797iIb9uX85ur/gOe9wHOAHhMhF6aAi?=
 =?us-ascii?Q?+G/dGqfTMs3bYLlhPXbQe6Z4gRwzKG8U5imEQAs/OJaY08YdGr8LrVyKMmCX?=
 =?us-ascii?Q?jwwQKlE3I6EgOrLoGZ1O6qeG81jyt4HYpoZrjWIi?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a6e6dd0-3751-4516-c894-08dab393795f
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 18:38:40.8126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Wiu64ZbPmHHLMH4Cj4dOJXStNQ1q4bSVC/hjmBW9LXNwg1lHbWAlm652zOVT+4wXWU0lQPF+F1j/mAZvaT6ppQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB6223
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Tested-by: Yangtao Li <frank.li@vivo.com> Thanks, 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.131 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.131 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1olwuu-0004qr-QU
Subject: Re: [f2fs-dev] [PATCH] f2fs: let's avoid to get cp_rwsem twice by
 f2fs_evict_inode by d_invalidate
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
From: Yangtao Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yangtao Li <frank.li@vivo.com>
Cc: jaegeuk@kernel.org, Yangtao Li <frank.li@vivo.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Tested-by: Yangtao Li <frank.li@vivo.com>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
