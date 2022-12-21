Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D8A2A652BF8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Dec 2022 04:59:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p7qGo-0000Ii-Tz;
	Wed, 21 Dec 2022 03:59:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p7qGn-0000Ia-OP
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 03:59:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Tk2s5Ce69kwncWgydqDmcqdx+TvyplnR1ES2G5zEGTI=; b=hFMO7CXv/NjNDomZkIW4CUSFX2
 Ft2MS8rIgNN4eObvtWY0GcgPr+nLThsBTMtPSsfJIBOSvilGf4uqfoY226OpHOX7hhQl1AtxXVFAs
 NVSVYjx7Qv0I61u7Cznmg2IgToZpXgre/FkBgUFRFLOr+6xYdhlDfbjz0vUQ0qpexeQ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Tk2s5Ce69kwncWgydqDmcqdx+TvyplnR1ES2G5zEGTI=; b=kH9twKInMhOv79aIPiGbG37E9e
 wZqt3ehJ466+PtFA+TQB6STMOdISR0GtEmOILhu+3Of0eq8n7oh74EfCvLLpAyEeGGBU3tQ05Kvxh
 ku9dXxkvljh8vwg4fHF3fu9LewCzyVo4XNIV9P0ZBropfXVkthC9o5BdKMOeD3ddZmO0=;
Received: from mail-sgaapc01on2124.outbound.protection.outlook.com
 ([40.107.215.124] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p7qGm-00048G-0A for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 03:59:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S0cWNTSKxruhTSzpY9eaXyTZwuItYg2O4c9RfNA/+fftVFNnsD0toyCG4zTF11RcfB5uiTX2dpIOfJjlB+zape6HLYitKQBkGZ792UNuB1CgtGyMaM3fGZ1xG/S1bBX5FkY2Oi2MD+AevEr2NNUpNBQ51W62h6IqYAMdfnaQggSwBGdpDGd4EX2T9qQ7PXtPn/5/YRj0acLZgO0l831wxa+9nL/JPWnFsK7bZ6hVuiqd/7p8ThOSd5ujlJUKZxT38cEByu1v8T0Aw5MwbW17kuoxBhDpu9eGG0vfIIrVmCyC+EKMfwPUnsADSiZn7bHDWNfmDx/3YwZPzUnwm58snA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tk2s5Ce69kwncWgydqDmcqdx+TvyplnR1ES2G5zEGTI=;
 b=hklmXryNoefxOljPlnqXX2gMCfxDhpOONSi8jSbge8v71Wjh1QJ6oKMCVng9FMStdWwDVLNzdAvwCWSN0RsZ4UlcnTir/gKRiqWENzpxpbobBwFMkKjV3VyfV5WGzm5H0GqyrQS649ANFzeyzsaGOrRQFoGCgA8RKEJxwgsqX1XkZgGXvIYgd6W+MhSqhxUYpcpUKNxnufan7AGNc7d9cvjkCfHDjYDM1kyeNyZsn0oe9iqse2E75NBrAT8r2ys4QB7T/z+12ISzGKguj5E3nl8hGsYukUYY6PGdTL2tnECECsFb3VIBFPz2BGfYl9+Qg3ODWLQfgq/nrfjGB+L6YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tk2s5Ce69kwncWgydqDmcqdx+TvyplnR1ES2G5zEGTI=;
 b=HTX1XKs/Tz3FTA1YeWen1Nh1MWPnC8DO8OnNw9o8iWRoE2ok7RcKASaSOwgtWcSYn5EXOav8X5nY6xpkQhXpf6UfgvvBgm11YQBZWqiYbeKQbVST/YEjQj5ndnv3rRoRJcV6ksLvGM4bW7Y6V8lso+O0PGJ3Ho+hyXmWBUgLbLbLXUN92YpV/H9/7tMCkOji+HAvAr8eewQxj2ch2oaq+5FWy48nhOBCJBZ/f938YQNkZmd72hzKIRBKa8YMeCeT2ptILxrBjXb8jtB+S/bvSBra4SxjgbHRvUNqX7juNXjpDhlEuwdvvJNA1TomIcV1NzNPOuIFuPoHUaOTSIDoIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5379.apcprd06.prod.outlook.com (2603:1096:400:216::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Wed, 21 Dec
 2022 03:59:40 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5924.016; Wed, 21 Dec 2022
 03:59:40 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 21 Dec 2022 11:59:31 +0800
Message-Id: <20221221035931.41027-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221220115602.6715-1-chao@kernel.org>
References: <20221220115602.6715-1-chao@kernel.org>
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5379:EE_
X-MS-Office365-Filtering-Correlation-Id: ec92d730-d407-4e82-0562-08dae307c8c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Tlh1TTbGHPLNYE0vf8B782Kzfw39EkmBYwwjEueYRYC+kxKMizM0yb8XK4p7hoL7gKz+0R/HXOM3f0Ez0gM8AD6aJ8pXiIttV5g8kbEUzFEhF3VaUrgldjScjKougHMLtal2NE/0P9oJjS/nFirD8+O46XIIXJdOxl/qIAl/UVsOxwVvwaCSYN5aA8kh+Ags2Cio44bjoOb9nZfLwpjbBvHZuO7JpTJ7rMSIvmJOqYyx63h65rht5WGJhMIGzmXMkvjycBXXyckCwsxknQZgTNTAJuzL97lH2+y8pLNVUFLeySHcG/Xc7RbxpXWSUozpomCdlUXzPmPW+if4XlHjKvmGR8R5j08ecotlYHTMuXuqMsPYAYCLxdxijFt2ffOqefSscrrx+7JaJAhm25BCs958JgU0A5Syw54xIJzz9GQwk3GvIiQ8ojOrtr9xude7s68fVLfczVJe7Kg7VGoE5fieaWLXPGLWEOhBTtMd8sRYZjCzCnfhWR2KrWpkZZzG1+UK5Z5cVAYCOizaeKJLCjreDpDIEqRz60+vrFxXOgd+sR8Niamp1zfsN64ovE+mkt9oL6Nyuao4BuLVijnLZH+4IVxiuHrnbNMuf+kAHabckJrnBtA2Ascp965wPXFaI6jY3+H11Rb+rbvWJop21Ks2nDUHl0eaJ0QnoD43SrQZvm69KopfAWGLA1WpfLrzafBc9WwGlSj+I+JPeoXxzg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(136003)(396003)(366004)(39860400002)(451199015)(86362001)(36756003)(558084003)(38350700002)(83380400001)(6506007)(1076003)(2616005)(38100700002)(6512007)(26005)(186003)(4326008)(478600001)(6486002)(66476007)(6666004)(66556008)(8676002)(66946007)(316002)(52116002)(41300700001)(5660300002)(2906002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cMghAT0dMk9JhIqbyS21eudGHTYjtlYfNFsBEyx5b4GQEyKsZx6ewDIUMSf6?=
 =?us-ascii?Q?sqGT4PUrVJSEiobVwg8JPD4sNVfw8L/ZOkY+4nMkzkTuLkYz1qMnP0oh79P/?=
 =?us-ascii?Q?yUpKhzUSlzPNH3TmlH6FCmdezMwgb2BY/Xco9P3qQQdEqs2jAgCMqa3qQrjc?=
 =?us-ascii?Q?kBhuVKPWxA/9BP4jT8t7Jig454Dcc4KYXdJ29+0lpb4CckgOS9izBN40GdQS?=
 =?us-ascii?Q?32dLlqNfhcB5/6qz6zsjkm+w02q9DwcsznGdJVmuCfN9Y2eHzQ0+jlkz3AGG?=
 =?us-ascii?Q?/FhtajSS5dKYRWN00VDaA/GCpbfcfnrpdnXPeAVM+rf1QWJ2ru5h3Ifn8Fzt?=
 =?us-ascii?Q?Uy2rEieOq+akaP1ApI5Zp8WxG8Isuz/2tW2klofXx2phcMjYxGDY/2P1TWGF?=
 =?us-ascii?Q?5ZDoT8jADLwKdwTtDWm+woNY1crUbXP84Kn9MapN+DIVkNp3Urfp1tcBem2F?=
 =?us-ascii?Q?g68cys/QQSmhv2d9Bx2Vv8dHzDkJYTuSuJxUSM6899XIGeLxhWI3ieOeZZEp?=
 =?us-ascii?Q?waOrf7wQhDaB2QjiOLJg/eFnG0/yBNUWOq1uKL8GE56zZoP3gkTQAWo1qQaX?=
 =?us-ascii?Q?Ro4pR8AVhTdvdNkDBqPnyeokfa+CjSGsUzAXhA/E+DKPARaClIIOA55+bkjy?=
 =?us-ascii?Q?EXLIXlhwqfIOl8yuIHUz2Np093QMVTaBbq7oPqr8Cv2UXsU8pbgOSW1siZld?=
 =?us-ascii?Q?BV5k2nZGYO4SSJzFajp4SfYN+bCRXJI6K7CLxKX/nyoVSHf9j8Bqo93ENssD?=
 =?us-ascii?Q?AMYoDM36X0O0UXBNfn/e/F6Euv2FEQWFiad3B3sAY9wAoWzOlT8jS1WiylaY?=
 =?us-ascii?Q?SP5JUBXpMwwahmxLlNA9MTyyy44kRPzbdRZdRs6svH/xkMG6D2Y2wiD8K68A?=
 =?us-ascii?Q?ga1LO9Tc9KG5DC/6er+2OoMblmpXkHI/ilU7uRXtjzeNbigXMoRKslOwqqid?=
 =?us-ascii?Q?hE0/Q2DCvODtzNSYvBiA1a1qhuMAQS66wqpJF3B3SC9JqAZGU7n8/I162anL?=
 =?us-ascii?Q?Raay8ZeV1QNg6V9cuLD6KM50OoobQJueNEYzb6N0wIEZkh6/PTuR7onJkMls?=
 =?us-ascii?Q?zP1nUQmRUygOqAiUcL2+FpMWE3ZeDvYH5HsZQaiZjIU8XSnzGUW2DcaXXAqB?=
 =?us-ascii?Q?kPGf2t+P0Z3bxbvWcBDd1UL22bPe8RAtC9arvUtxNBdsJIUehny6E+ZgP2wG?=
 =?us-ascii?Q?o13V+WpCQetQSTUNzzIm/uas90TiBSSUTkxuaeNAwurdOTcHP2nsTeZREFie?=
 =?us-ascii?Q?Rs8ZHRf71el0MXiPFF1EmeXOdu4ftFJR4Siik330iQMJZ40R+Cum95VYItC0?=
 =?us-ascii?Q?ClsjzwGyB4YYzRpN/d60k8i1zhTIp45w4lwlr4xhkUcwXQ+WaHh7dWiO5Xyh?=
 =?us-ascii?Q?fCdOE7RRAh9UKFUJCuwYc4QQEgpGDP9JAGiui7gbyoLNssK6u5d8VK3lNliq?=
 =?us-ascii?Q?u6pkUznWKpBV8LDWHaR0ueqdGGV0DqbY70mAvgfW+tGr5H56e0QqJssK7d/V?=
 =?us-ascii?Q?Wyqo7WqJrTHEc7dPFtjTl+62lrhnJGO2zuVBUpyTMyCLmKDMcXx06FDiwzQr?=
 =?us-ascii?Q?Pmnn9YtQchISNcyryidZShUTRi5hR8FsimF7u5vl?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec92d730-d407-4e82-0562-08dae307c8c7
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2022 03:59:40.2233 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bbbmiyt1O/XpRestYNIfX8J1l7j8s27g05o8IwQsbstS464W/Wy+X0ui2pOrM22kHjwjnRRmmumBtXb7SmMnhg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5379
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > PAGE_PRIVATE_GET_FUNC(reference, REF_RESOURCE);
 > PAGE_PRIVATE_CLEAR_FUNC(reference,
 REF_RESOURCE); Delete those two too? 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.124 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.124 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 0.8 UPPERCASE_50_75        message body is 50-75% uppercase
X-Headers-End: 1p7qGm-00048G-0A
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove unused PAGE_PRIVATE_ATOMIC_WRITE
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

>  PAGE_PRIVATE_GET_FUNC(reference, REF_RESOURCE);
 
>  PAGE_PRIVATE_CLEAR_FUNC(reference, REF_RESOURCE);

Delete those two too?

Otherwise, looks good to me.

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
