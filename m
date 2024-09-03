Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E300C969805
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2024 10:57:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slPLj-0001HU-Nc;
	Tue, 03 Sep 2024 08:57:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1slPLi-0001H7-4F
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 08:57:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4fI4xqj9AK+cyUPbm9hBvT+ojMH7CRydVKcnjsmQTb8=; b=NRKCBop8rtZ3+RcK9fgHxR4PBi
 Qq3RCq6DwQRLm/bzRxFytxNTRMxM6pQ3TdzObSdi4wnC5zwrcQyiYjEeVbN5jBxen0lHTkkI2O7u0
 i8E4plJ+ek2qqO1TvmAFkcdvS6T5epItlTjS4HGpa9FejdwQeLDfAgs+U0qal9m3iVaU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4fI4xqj9AK+cyUPbm9hBvT+ojMH7CRydVKcnjsmQTb8=; b=QnpNDl6D5Fx+XUc+PKtge49VgZ
 4sq6Oj+lRvw/Y/jJj1D3OB7CkpHo1/sxAemzZNHEPu1BcHp/8Q4UptH255GsuVfuPDb0NFHRWzk8G
 nmfnv7xsEdCVWY/MHWqLpc5NCPaQGsc46bVHe8qXyrud+djM2KvkTLZIxhc7QCNuJLUU=;
Received: from mail-tyzapc01on2080.outbound.protection.outlook.com
 ([40.107.117.80] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slPLh-0001dm-Fq for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 08:57:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OvRzFdBvcthkvjg/Hqhq4q9mjuCjZTD6pNUF+orxPGhTX1buweJZReBAJsF5zpMAzOY7WXancBmfIXrk0kwadZyxHIkjYa+Lo925sOMrWe90+KtPLfEgdwgmJfIdgwKzhnjk6ujt0+PDGwNpi7XnrGmeAvDkOLNiT5eSzDjERp0j19Uf7Wh/39kxwk/rkg/pNndQbf90pkpLgeHTOxc3bGiEy4QYNB7v+yWZJiaCRtP0RuhBcMYK3UntljJ+MilNgNHc2q/6kPFadfIKWekrMu7nToSO7IjhSCMD/FZtVJtyVDwJHtJYLjBvA1pGFdVSs464MB+WPEnI0Zw4UOgwQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4fI4xqj9AK+cyUPbm9hBvT+ojMH7CRydVKcnjsmQTb8=;
 b=pDEM08qsEcjtmLyMIh+MOlj8XIGuXBgXiKTRarJUg5fsbeEoph5+MZXh/lm8KuW/OxKAWKbQrz25XeggVVcLFWjU4WD/S5wkrVJCNb2HN3hLdEo19A0AEt7wjSu8tgUYTWI8ECcxojRVoaJsFVNcEi/VTeUCQ9h7NZaXOQ3jdMC2wXIsFCo+FHMlUf/3zD5QDEVSv+1eOG3J9578JILnp2sIM6XPxex/sroHxlr4XWmTagweQdscIRdGntvIhwDv4kY2He2NSJ8/DGFJiwdBSV7c3dRMnAEkG0dnuTzykQx09zXd73tgLyIseeSmksiPZm7dlLQPEfVJ0xTwAg5pWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4fI4xqj9AK+cyUPbm9hBvT+ojMH7CRydVKcnjsmQTb8=;
 b=SD2tgbvBKOcZo4RPbFuvCwXBF0DKcr9Sh5QjPjXzmA/yvTPzMui2HkLRsA/6rnAt7oP7NqdhHclt43gysHz3kQy1fCjbKkklkTmCUX7kT0cExaTbGyvqb5r5XzVOdqsK+kptz1q+0wOo9huimR9X1lg8IBKCkmZj9ZV+ZCvCPIaW95hJIoI+syUTOXufnjYsct/VuYtOYlqtKxxHBHrknK9FvECIQLstF8pvcnVQO59OBzsi0cQlDqln8xhq40JDT4pJCVgfbwwi/mm2erJ4sXu9IMF6VfnujwT/ksLAPkHyWXBAN8zHLlDqw3oIGC/c3Yff38hN69RIVETkVTQ53g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by SEZPR06MB6253.apcprd06.prod.outlook.com (2603:1096:101:e6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 08:41:00 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 08:41:00 +0000
To: linux-kernel@vger.kernel.org
Date: Tue,  3 Sep 2024 02:54:54 -0600
Message-Id: <cd12b5914d848976e40c920f8fc47a74c2f80fcb.1725334811.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1725334811.git.bo.wu@vivo.com>
References: <cover.1725334811.git.bo.wu@vivo.com>
X-ClientProxiedBy: SI2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:194::12) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|SEZPR06MB6253:EE_
X-MS-Office365-Filtering-Correlation-Id: e72af517-adfc-47a5-54ce-08dccbf42326
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yKDhJe7wlVra0y0x8MpSwEJ7jhUgJM+af0soqdHpformwCj//xwJiCs1aJO9?=
 =?us-ascii?Q?nIAxMRO3wv9LRNsZeTlT1aowU0w6OuwWdW7okqUoUlNk60KclAqQhPvCNFws?=
 =?us-ascii?Q?kfchNT88DHFGdaYJHwj7FjccuFkn0xagNnI5fDqzu/kXN937NdtRClzOf+9H?=
 =?us-ascii?Q?Mi6UScR3qYSXmv+S58FKNdssfmf1myELdcP3zveV7jtLfK97QeUJPEAz/XzS?=
 =?us-ascii?Q?0xp21YcC9n4zV7uwQr7MKYSjHapdM0c8KHQksemvDikQEenr+ieyBJs5pFvI?=
 =?us-ascii?Q?bYIgP1OaCJpbAHLkXMlYyzyypQJKXRy0yHvnjdidEchF3/qfocdq+R4nd7U+?=
 =?us-ascii?Q?MhtNWiozLReMrGKaod1MITros9aqFQ6dhWCbPMLHi8uV+5NypJuPADeDNwiC?=
 =?us-ascii?Q?ijwB0GMtxvemAjqpx+PqQw954fJQyBMRveVQw5TKgAtSn5R6Lc85FzaNdf53?=
 =?us-ascii?Q?OyXYBzUYVG/yDVTT+Zn9tAc/ZAodnYAZRtesW79Nn18hrI8mcx1+Xet62j0Y?=
 =?us-ascii?Q?I/4jlm7zY02ZTLt3/wOUfhWh1XLBdoAsA6HgHvMjugG/+jeSDx0wlq+e7UlV?=
 =?us-ascii?Q?KnM5K7Zyrue+/qvWRdyOV+hB72xbetKkk3CmSywHqC+Iv7Ob4GYaZ5VMqHhm?=
 =?us-ascii?Q?ieoyspguepSiLH9LJ4pJXHinLTcghO8KW3/eUjKbJj982g9sjvnWzgPjaV4C?=
 =?us-ascii?Q?BAunJzHhU77jXcf1/3Wc4eIEH4xPrF4yaoeRgbvvTPof0e8iYHMftTg5Z/Dd?=
 =?us-ascii?Q?OWmbQg3hzHhvog5tLecebvhUTiwjGYqAkL6aEe7JaY1BoaTaDVcT0Oh3k28m?=
 =?us-ascii?Q?oRX7PvxzoOHAe563HtsohWdBHyNLXIwG7uyUxb6ljkkKZ6KeIVYs+c/WM2ec?=
 =?us-ascii?Q?Qm4ru/29pXYMZ1GX4dUGYcGUSsM+R1WOO9J9wkKshjGiKa5CawbT359K6tlN?=
 =?us-ascii?Q?O+sb6fq5hVFk/5SGlQgZ4wIUmb3OXdCRXsjgwrXPoVCVlRUwz5nx5skIQtzi?=
 =?us-ascii?Q?4spbM/knS5Ieu6RbnWYRBgv+HhL2z6mH/4nUbpXDzWou+rC2msa/yRLVDYRd?=
 =?us-ascii?Q?sw8rhorBaQrx5WS2B4x61G8Wt117r1Xc4i/XmXJhwm93HVeX3eYP6H0QtPe/?=
 =?us-ascii?Q?gA7PlIjT8z/dfsCG5qdcqATm0+xPOEvKdNhzrU5kosdoO5SyHNMMcTk7i0vp?=
 =?us-ascii?Q?4Jgh+g57buuYcgoucmIBFBuYnz5c8MNO6nkg9oOC4wWUivner+e4UfoiYfet?=
 =?us-ascii?Q?SWPt9KEcRWG1wp12PAb8t6UGGgMSSx/TfwjSOkCWp3ChDBO+DRBcnA/diEN+?=
 =?us-ascii?Q?5PNMU45oU65olTM97W8CUVZnmQBvzAgU13ZovGEliRBN468EBIf5fXu2qW7K?=
 =?us-ascii?Q?/IjPtpql4OvuZL7RE0fpDTkOTshMN30vUI8fKwkzccDK0yQDXA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yvTUa/Ry+Ya4i97Sufo6OcTgN9cGnMEY3ivH1d41CAU7V0kGWSNfTWu1wcgo?=
 =?us-ascii?Q?yPdrOYF8NI0YifmQX2/sJ/N2PLzK3eiHqo2khDfrlw14aMGxwsgLCpV4cZVq?=
 =?us-ascii?Q?QnUTxzO52/zb9xmXHicHW3wrqkRnbWQJ+OXfagMOXg9Vo9PJ2JbZckl4h7R4?=
 =?us-ascii?Q?XlQMdgUEmrO4cUA7lQI8vx4B67SkYODTJZlOvSLRYhEKe3b2jlv32AsgMY91?=
 =?us-ascii?Q?kD9rrLgAiSskzG1OEOwPcr5dED5mQRDG0+7+ylQE1Wo1AsX1IEOOlbnlnYC1?=
 =?us-ascii?Q?kHbqgBGGl2HDbm5GoKyBrgLdy907bAw3xwKtPaDNzwepxTrxCKL1rPDta3OJ?=
 =?us-ascii?Q?f21wSjWc96DJnqUmUwEsgzGMPqD3wKyMnysi27eGlk+iChkx1fXCdqdzquXA?=
 =?us-ascii?Q?JjpQD1S8tUXK3bbw5CGfroJkb9xc8fncsu0H6MX9W3Rf40KD8Z5YlXFCdKHC?=
 =?us-ascii?Q?5RgY4sILv3OOM1iKbDBRkmL4VjNaqfDDTlG1K6dpNk73TSiOo3frddgrypAL?=
 =?us-ascii?Q?AcbGfBSWCoaHO8JyMjxYg0iLw9PATpdcibQrN+Z8mJfuHG0ZRBNiQe+he4ls?=
 =?us-ascii?Q?QJt/dQOeOd37eSBTF3Tk5Jg2FkIy/jyju8TUtHNed/op6CaGwqKjSwFS+dGL?=
 =?us-ascii?Q?m5zzt9eHEmUVm1/CmDRXRRfHCdmYoy3Hdex/0BJvnDEZkna/MZz5wA9bAtMG?=
 =?us-ascii?Q?XWo1WHLYiz5CL0Hk88nF91bf9qv7YoDKDLizVm0cSAqyYd3NRf1shWgKfIXw?=
 =?us-ascii?Q?79ZYXFMxvlHAG0WqRZ5YKLI8lALdsns3CcBAdVpRT967/PximSl60teAO1Jf?=
 =?us-ascii?Q?YZzq2l1ZtjqMwRWbsYzXnJoY/hYh9K1/J3TNEfW0YDgkvWf0vxS91GCy4Wio?=
 =?us-ascii?Q?fZIS9cWhgczu6e3/HL8Y8zehKnwdnQQ8peb0THexFKrLbXV5KW/lIl6HFMAT?=
 =?us-ascii?Q?czbeYXLQG055lbR0qJNT9QS0/V5Np6QyTJxuQqr3IzLDQgYRdCIJQLZCZB63?=
 =?us-ascii?Q?amd0FZK6RUidigHtM6+oJaDPzcUZjvd22uMqYYGwdpifzeWW5FwWVFbLokiQ?=
 =?us-ascii?Q?/pZTj+Ft34NoIOYjDmGs3JQbZnmUSUOGcN099SuVtDcLqInOfHfRgOaOKTgw?=
 =?us-ascii?Q?/8mM2CwSzpWQMmZXoIRdbPM65U6lBM6zUYW0AmcTIrnojJ/xol28mCFADyoG?=
 =?us-ascii?Q?mWvfiQ74dD0Q1nxwuFWZP+L/xHpDmLPNSd0w3NxdiiAYA0aDilkaqq29msW9?=
 =?us-ascii?Q?w7Li+17D4exL7qp66lcl1xt8KLseRsI0jm1IB0vgKankSNgcJajfIlU4i1dj?=
 =?us-ascii?Q?aYQu0n1Nhf/2rF4CIKSDvmfXqYfPo2LeII7pj+D0Bml6RZPNKvq4MSmBTrDl?=
 =?us-ascii?Q?ds2hAhBy1oqIQjDJBSdM1tcVa+ZhkVGPP0Ua4j5T8Rf54B1hAUnsTQh4NKnm?=
 =?us-ascii?Q?nPTCfbckbbbbZ14wRxxbCpZvzLHfhPOe4ClMlR5ILZ2pc0e2uRyol+zviE5E?=
 =?us-ascii?Q?gPlXtHS4aA9OpSiM0byh0xqEAdNYgkB6yhEt7HsXrSGd3amJsTXe1Z7ksTKM?=
 =?us-ascii?Q?D94OXHPrVfjS5TVP6TZ7IYdijjCcsumlR2RsNvoK?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e72af517-adfc-47a5-54ce-08dccbf42326
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 08:41:00.3225 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N3NnmjS+7yHCfCdIdtBt2RIyazDKeHEsTU6weDPgvBbd8qeoYF79R7kO25Nb2NKQ5QEi9vx5R8BcG2nDY6UMzg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6253
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Quota files have a different write path and are incompatible
 with inlined inodes (whether data or tail inlined). To simplify the process,
 inlining is disabled for quota files here. Signed-off-by: Wu Bo
 <bo.wu@vivo.com>
 --- fs/f2fs/data.c | 9 +++++++++ fs/f2fs/super.c | 10 ++++++++++ 2 files
 changed, 19 insertions(+) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.80 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1slPLh-0001dm-Fq
Subject: [f2fs-dev] [PATCH 10/13] f2fs: avoid inlining quota files
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: Wu Bo <wubo.oduw@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Wu Bo <bo.wu@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Quota files have a different write path and are incompatible with
inlined inodes (whether data or tail inlined). To simplify the process,
inlining is disabled for quota files here.

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/data.c  |  9 +++++++++
 fs/f2fs/super.c | 10 ++++++++++
 2 files changed, 19 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 275c5739993e..6d7b6074763f 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3641,6 +3641,15 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 			goto fail;
 	}
 
+	if (IS_NOQUOTA(inode)) {
+		err = f2fs_convert_inline_inode(inode);
+		if (err)
+			goto fail;
+		err = f2fs_convert_inline_tail(inode);
+		if (err)
+			goto fail;
+	}
+
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	if (f2fs_compressed_file(inode)) {
 		int ret;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index d4ec32ba6cad..0f54c055f053 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2807,6 +2807,14 @@ static int f2fs_quota_enable(struct super_block *sb, int type, int format_id,
 		return PTR_ERR(qf_inode);
 	}
 
+	err = f2fs_convert_inline_inode(qf_inode);
+	if (err)
+		goto out;
+
+	err = f2fs_convert_inline_tail(qf_inode);
+	if (err)
+		goto out;
+
 	/* Don't account quota for quota files to avoid recursion */
 	inode_lock(qf_inode);
 	qf_inode->i_flags |= S_NOQUOTA;
@@ -2818,6 +2826,8 @@ static int f2fs_quota_enable(struct super_block *sb, int type, int format_id,
 	inode_unlock(qf_inode);
 
 	err = dquot_load_quota_inode(qf_inode, type, format_id, flags);
+
+out:
 	iput(qf_inode);
 	return err;
 }
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
