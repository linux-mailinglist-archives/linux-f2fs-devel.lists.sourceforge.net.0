Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C42B468781D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Feb 2023 10:01:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pNVTV-00055C-VQ;
	Thu, 02 Feb 2023 09:01:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pNVTU-00054v-BF
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 09:01:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LW1+Ze3NqqDTCu8HklofMvGC2oZQl6Z4sxl8RHXoCHs=; b=DUME/E2ewehXsa++SWtoVsgXOq
 ygBO02zS3aWKAQ+RBk+QL0YLrlol5BOm98Da+HCY+b3DjncUWg9Q7IZCzu/jtcoOei3Sq2a6z6krS
 2NQsTKmZF4UQgLM7VKwU15jC90t5reAYfYk4f3WQ1DEsHv3cLbLfxO1qPUzCmaatgNQk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LW1+Ze3NqqDTCu8HklofMvGC2oZQl6Z4sxl8RHXoCHs=; b=OnlCLBqV2La6RUWrAZw8gw6GdB
 bvfpZn9SED5WJph5iX6Ln1HJtM3xfazLSHXfVPj1O4kCi/q68RoE+BYPDyHXVdr8yUNqLJDCYKRU1
 e1tFnD+QUlfDo35Vc4QWBp/5HkqYuBF0kVtH4Lqf6sTu4fCObjCSOvx1k8/o9H6wVMt8=;
Received: from mail-sgaapc01on2093.outbound.protection.outlook.com
 ([40.107.215.93] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pNVTR-008JWC-0b for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Feb 2023 09:01:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NfVxBn/IJmCaCxFSh0iYlVZ0b3hzcIbZwuEshZ6d0GRIAiTh46YjzDp5v6g+Ij5ZkXdylJGTtfn+8km9yCDXLhRZ7w57YGM/UQb9WsdGxTl1l82LXlxAxI6ymU+VnyQ0lKcwR8mpBxoPivYFJXYlvAh475KhyXlCW2V06+8NFYr+mjyF0VJDga9Nocppovmn+3N4PbcL6MnKXM4vldpH/tkxayPSWh7KJ240ni+AJI2MXsr34ICyR9wIk20rJvQNjlRXUlkRKup+3/9/RAaPTmVOgnoUFtlorhhWmOW6qMWC5jT5eVmo1wCVqh4xNGhALSnQm3kWuUm6ijYiKwvQiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LW1+Ze3NqqDTCu8HklofMvGC2oZQl6Z4sxl8RHXoCHs=;
 b=CmUj6f6WC8bPlGC8EE2EG1+zpQbK84qgUbJBEAMpgyOfAwvdBQ1H0HB1NRz86gDuH5BvuqelWv/5e3t/umGH2MZSGLM71GsFfXBhPH1sANcudKq9qE1SGKrN5H5d8gs8NfYj+Tun/akxaIHKe+tmnCrCykMj0VF8WEFCdRDuCbXd9zObq+/kmpBJ5Y7rLtG8HNgG5dykLqsUwLCKKUvY1xqA5XE9X5EjCexT2pxtGGqr/nYFvb0xTaXdR7zQi456QKV/676xJ9yyKGGjlzSH/M/PehtH8/QzMLMUtWIGn9HtBjbDZHNLKDL34Rr0zwdgt9hFv7cGgIPdhQvi9IltUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LW1+Ze3NqqDTCu8HklofMvGC2oZQl6Z4sxl8RHXoCHs=;
 b=a787ekXWp7HSgFmU1kBInxajuFyTQkRyJogVgX1HNGXus6vh/KBSlhaIoIXVi1anDRryb4uECG6i8O8j9VfPx9O4PGCf6D9rCt3UwU92mT2ofopWERN4YQel1yeqyIBmvEEFHpivtxtDk1k1XE4oQJtiQKOkt3rC+2bmS+Bx8C3tM2eb6a4Bkh4tqp/+Ll/m0WQESyEI3sqgqUBpLcjeklcKs5UqBeh97RzkcJCP4+ngCwJgEEjm31ynw9uUJUtBilYSPGCxU+lFUfAtwl9EgXJtgFRaNuxthXHabf/VkJdS4mjzDjtCDAnCShb6ohjWI9t1OTU0mSwMlyT0XBbP0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5633.apcprd06.prod.outlook.com (2603:1096:400:279::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.21; Thu, 2 Feb
 2023 09:01:32 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6064.022; Thu, 2 Feb 2023
 09:01:32 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu,  2 Feb 2023 17:01:24 +0800
Message-Id: <20230202090124.68518-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <c179d808-66ee-a4b5-b3f1-91ba336a68ca@kernel.org>
References: <c179d808-66ee-a4b5-b3f1-91ba336a68ca@kernel.org>
X-ClientProxiedBy: TY2PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:404:56::21) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5633:EE_
X-MS-Office365-Filtering-Correlation-Id: 76d9837b-9c42-4033-21be-08db04fc1422
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Lm8hPmBqt6AmhhsAG2XWrXN/s5FQihk+OX4Q3wTq+9XNWHrRWHYlYMV6vpT/vb7BpIv1WX201+UxGbq15GAeBrS6EgdnhsoMbanmW2Rj+vY/fgvH19AXFzjxw3aPp1knlwCoiPKzg0awyKiiUZbVG8eQlIvtVxEGQa2RFQ9pnwCu4qb67nT0rL9WrVQGbGPDC5Qy9wTChmd84WWn8XgDfzFU1duSSlSf8Yxo1oGpGCRMOeEcrzDFmp7DQerg+/dbL5lA+t036QiOEORP0ycPyrL4NBEky6oI2BRR+xjKwaqhDVYWAnuuuDpfDiH7x3ISLtWa3nOQcxgptdnhKXCRYof6U0kwLXOaHghN15hAlBOA+fVNVBGXwMpIAZ+86jGUYKfcs9UpWmaSR8AckRQPNgtlz0XEP2278Vga2JCxiOxYr8AwqfHtg9WQr6PZcydsCkxmeHExO75x6I328wtX1N+7BatlzoSenVH++q5tuBKQSXfk8DlOkrst3Xp1KcUh88N+2dY0cPZUq7LhbB6y3FDcFfSnGt1Ap+R7moEe8/HmmHpnzJ1lKAZAFQKTr/XsRIaEKmjMwm3KOfaUNf10m1y/9PjIgh+lKg5tvIwb9ozcnoidivoNq0O0W+VmURcUz+nQdTlEPJd39x60NdM9Dwu7aCVDlYXOYQNVH0Oh9cz/WWtjRBsmeF9sgaPSYhKcnaQAPU7xEBfFLfsPJAcSzQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(366004)(396003)(346002)(376002)(136003)(451199018)(86362001)(36756003)(38100700002)(4744005)(38350700002)(52116002)(2906002)(8936002)(41300700001)(5660300002)(316002)(2616005)(66946007)(8676002)(4326008)(6486002)(1076003)(66476007)(6666004)(478600001)(26005)(66556008)(6512007)(186003)(6506007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?c3GWgmN+Yi3zv2PRTchsj3h9KRTF4IOx/2yz9BzC/PFfTofRo4XrVyPDghta?=
 =?us-ascii?Q?zd8RBJsyIbrkDagSqc93mtpHP3aKg9nuzontXEEm4v4N4g20PrdZd0VaI1js?=
 =?us-ascii?Q?wAWGyna6Jor3yXQGN3ApioBP/Jk8xnyhfh/zwImq3GULjXychnwHOfUCeWoF?=
 =?us-ascii?Q?jKEFh837AcE1XPuHyY+G96mXPyp7tPVMrqDfzWrJrOElMGPxnJzvytmc4/yd?=
 =?us-ascii?Q?q+3T5XohlDA+Bg/yveZ9Vb6XUP2XNJ5A4w7tm0FE6YvEN3QUH8n/orIW5YTo?=
 =?us-ascii?Q?+8kIcBGT4oT5mpcMmbIsF4AavW5hlnSPCRbBYzcZYG4dDQRjdef5Uc9/MOk4?=
 =?us-ascii?Q?Boj4YPpae5FGQuk+xz9CjSZgSeI8fNwnEHz6ek2M5RZFhe7rMEAt+KsDKs8T?=
 =?us-ascii?Q?Dp0JNcNNxIugNMYjWm9X4iuJBPWHHkva2ZxChOHFojhhuShLUZ9b+gF0nYty?=
 =?us-ascii?Q?blUy6SDmrA5VcUFtdSybRlZaLbH4rzEAykoltZOYeRVxks02ps/bfQfoOxMD?=
 =?us-ascii?Q?hOSuYjTeEuysU/ZV/6y7T3Ov1+9FpIoqch0/uK6HmiHYkK33ALqugXuYTgyn?=
 =?us-ascii?Q?duD0OAx1fNDK5MbldT5qcTchEKrCIaoh6QEdkeCsJPH7qztb8wIs5NUKgpCf?=
 =?us-ascii?Q?j0+MeLdSOrnw6/Hn8rR904lQhbcgCbZDSnvQCT80AyIqr43RYLRNKVqivVuI?=
 =?us-ascii?Q?boa4WhF9KQlYWU15lfXDHxGK+IR9FwvTHh4hy7BLj4KV201TmEPif+Lcg40G?=
 =?us-ascii?Q?UT6N7Ko2I7Ct6SiCLkJ8U4lYnUS5911Ysv9Ko/HDz/VzebUOaUcbAFu7GiK6?=
 =?us-ascii?Q?4tVnFGp/AwFkzWc+nUOVAONaoxCFgb1p47U62p9GsjpXe1NTMKNiS1HoOesR?=
 =?us-ascii?Q?apoc+pOI6OeqKm+aMJ9JWhyjmHyO+5/hS3QrfgAzn2Q7U6KtCWq9MJsRtsEo?=
 =?us-ascii?Q?+P8cSH7wXqhiVltKkeCCDzvwGKDNp8OXCglxm3JBjjp9HWNZ25kujLG9aF2/?=
 =?us-ascii?Q?VvSxveMiCmiSbo0NYWn2FphB3q2NhEVXs3F12l2KtkPgQVhJ9zTBcog4Iegd?=
 =?us-ascii?Q?YVxdrA4DUFBwXN8OZnU6LxZh/w13Mg9424fjQfq2iD1rGkYXun5UOGcDe2Fk?=
 =?us-ascii?Q?HT/bVl57r9ImH4DqLYEeOwJERpTWy7j1lYNrL9SsenOas0Nr9hHiHGnkVyfI?=
 =?us-ascii?Q?FBiAix4rt8h3bg5ZycF8mmEpyT5/i2wG1E7G2BpXc7xWeCC+yxBHhoDOA1BP?=
 =?us-ascii?Q?Oig8hHpOlk26JuLCgTYw5qwgBWWEHQnOgZR0ZITFUR96IZOmThZy/91vZD7k?=
 =?us-ascii?Q?rGZtl60JLej9VjSdzRBWC+5HDYfIjSBS1MsiJZeS2JA1M1/ScxYneTpj22YJ?=
 =?us-ascii?Q?TFHiCHXbw9aA0rLi2v0+zpotWd9Yb8YFn2ohiIIGb1RJg6/+tDIZT1ftUajs?=
 =?us-ascii?Q?8ELfDxywHdF8hydZiXPLvod8VSnnFVzBcsWzxKSvY9MNeiT5UdLnwaGdafR5?=
 =?us-ascii?Q?BLq96mTkC2wnj0HBe4r6R2IJGKroCQeprBssl0UOKgEQhp62065s8kgyoDOE?=
 =?us-ascii?Q?HKZvIVtDcdnfZ58Jz5iY78BcRxKQo4HIEPf1aFFB?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 76d9837b-9c42-4033-21be-08db04fc1422
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 09:01:32.1308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xqARvXh4LAZAAbrPjDJLJvxdv1l5SXITsCPhKayiqzSi3bsWk9MirlUR2QyUuXx12jzpQQRNrQjP1dR9zd18Hw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5633
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > It looks using union may simply the implementation, but
 readability of new structure > becomes worse, since this structure will be
 exposed to user as an uapi interface, I > guess we'd better to cons [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.93 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.93 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pNVTR-008JWC-0b
Subject: Re: [f2fs-dev] f2fs: add F2FS_IOC_SET_COMPRESS_OPTION_V2 ioctl
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

> It looks using union may simply the implementation, but readability of new structure
> becomes worse, since this structure will be exposed to user as an uapi interface, I
> guess we'd better to consider more about its readability, thought?

How about use the following structure?

struct f2fs_comp_option_v2 {
	__u8 algorithm;
	__u8 log_cluster_size;
	__u8 compress_level;
};

For the F2FS_IOC_SET_COMPRESS_OPTION_V2 command, algorithm, log_cluster_size
and compress_level can be controlled.

For compress file checksum, let's add a pair of ioctl controls?

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
