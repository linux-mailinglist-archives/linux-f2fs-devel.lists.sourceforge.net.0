Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E8FA86864AD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  1 Feb 2023 11:47:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pNAeJ-0008Dh-Vr;
	Wed, 01 Feb 2023 10:47:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pNAeI-0008DS-RF
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Feb 2023 10:47:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KPyTYX9pfICMCmGZ/dAaZ6ciO8KsKYGijlvpf3fxz24=; b=GlgKTFdTvXA9mGSxkxM9njNg/L
 bk7A+48sVTDGbaN9YVhSnlOJG/Ui+L5UINVc9hg8CcEHCULwcBEJtLsHHQvVLN5e+tHpKTR5ckBee
 2E/x8Nk6gNI4HV7240wdaQE+QC+wnP0HHFINXsLr5VwSrGHK8JfISQB9jG8UuoECVAwY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KPyTYX9pfICMCmGZ/dAaZ6ciO8KsKYGijlvpf3fxz24=; b=h
 jnJHmNgi4JOi9xTg50AKEuHMvs8eC7IE9ReLe+pUlAyGpk9iiQuwull+gQPItc5bM9CALibccBp88
 mqolOKbahSsIjuZ2/LKB5z19GA9f72dGCKkaWMCDZmG60wvI+TFYUYgypLWSyiZFjtQDFbfzog/X/
 ecUY2SJ4Ntsmns74=;
Received: from mail-sgaapc01on2139.outbound.protection.outlook.com
 ([40.107.215.139] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pNAeD-0001DZ-Nj for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 01 Feb 2023 10:47:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cO4VO2m52/HBVeSXzp60ZueolPQ5LR+En6XcwHUfOnPv91ITaeXTJv66qTXqTPb2XZsASJZ0jVRGuHV0AhVgFoTAueofKHx5R+74yUJwIlMlGz4/cCTcipT9MkuB0mfUQKhEQeZVvDoo4Mqv8ut/5F7K1+UEKtUjWVTJC/tNB1BXl7hAMf4AoumDhwIk5DeElGsSE8EgNPIyUqNmKfx+xWTGXcTDB9z8RcOwQ+nwMYFw11Vy8bi4izxzOOPT+ryYRgFzqO3UQL/XwKBvlydFHx4Qjx5blPLVDLeViFLvM3w9pigAHYu0Omcwui1BNnun752saubM22OyL3RX8gWIjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KPyTYX9pfICMCmGZ/dAaZ6ciO8KsKYGijlvpf3fxz24=;
 b=DtPo7tREK3TCnvKpmOm+tb7cN+BaB8WFOJosStuQz00dZ/mJO2CFtw6HDokth2tMuaodmd2cGRlFt7OvPHVsnw993IkcJ8WisQmysIFsAmOU0mNMEeTu9ZKVk93HmnDh9fkLjTVkEyspb9LsPZSTTa2NsTAG/e5ssL9d3mywsXz1Hy8yjx1iRCd4wJkFg7X5I8Pjzy8c/03wIszv6O5nQnhdpJp+3zK0UNUDR9Q/DG45alLXK/ZM1WKISGHxDVLhkA8OsUrlmy4HUN1sc2RC8YCoWXNc1Fvgz9d/fe2VwWERvjxUWk7QrQC+voOFV3l6MEaIyqBU7WVJvhtB1P/Dvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPyTYX9pfICMCmGZ/dAaZ6ciO8KsKYGijlvpf3fxz24=;
 b=HJKJ8poziEae5fk+xkJfya5xAFyaEhbd/+JnKGVuqjty+A0IRGYtLmzTHvGlhTRQxvXIqvn2AZf3vsRLR5DpH2VVo4Dtc3oe3Xi5D/Os6Iomfl4MC80MAi0TSRHoLHEkUYvS629CdsVm9Wy3BN3q1FD9mAkd7AcRH2iFLl2sTAhu65Zij821n8IqzXQtDXIeA54TB39bM+Ljwl+Hm5y5atSgXS21SOkYCjzDwCZKKbL7+GIUznlui6kms00v4LjIDXruLwgzudQeU0RnN4Az1ljAjfuuUngD2KEV5ZPZWro7FOfeC7/2m0o3gVJB7nw7mlgYG6yZg1eS3L6g0122hA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5282.apcprd06.prod.outlook.com (2603:1096:400:207::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.20; Wed, 1 Feb
 2023 10:47:15 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6064.022; Wed, 1 Feb 2023
 10:47:15 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed,  1 Feb 2023 18:47:02 +0800
Message-Id: <20230201104703.31008-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:4:197::19) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5282:EE_
X-MS-Office365-Filtering-Correlation-Id: 8c51dbb8-245e-4969-9f14-08db0441ae8c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q50NQ6nHw7L75pjEBfmdy+94sI16uXQ28VNVPOZ4ikVenQ/DpyprNxjvg9g/U5uwF9CnsURhLPqQJT5qviuu0hbu1+mokb+ZKFa2gSs8tLl1Ctc44g1ip7N+n9qHKuzaRM7vIi8djvk8VGmm+JIw90t+7DOxGmm6sT9ffx94/F0XwxOuvCwhOc0Bk4pDDQ8JwZGtfvaUZxYSP5vgrC6QrViw5JZOUjeFe0y5Shw/F+hUM9TPEJIVId652ErQTkrSIwS+tjPi6DrXdL8FleY2ontuOJsT02HsocEdwrnoETwu6fJSi2QZBWKSLzaMhLoxi1i8ExURWyTTKPkiA31t5ShexI62quN4bhDFi1zSaHBiJhJ0x1nDknoUuNSSi5nUnoj4yzETLC5glNo4cBjpnTnfvc1Mi9bM3WNer6vmRhuMbTtwalqwWhgHN0zGKgBo8AZ9LI3W9+JcgAd43Vut9ho4VbfIsOnlI3tiQPdFeLrM7XCXpCtgTDcuQ60QOm8WOovRwFm9Nk2LXBeI74ONTJAQFCBJ+tFpWOd9pU2NFPwLYn+ThENhCzI+sDBSJVbF5zslyn7RJc3Nb6O6jWg077hBZTGnRLj+PbSVApxULsrqmVfq3Splez5wdgOfzDbYTZsw77HivUeBRERIia2MRnIrdWYBEdpHOLa8/eGHs7ib6/iHjnYHt/dZXyHfwTGon219xeppHgq+0a0CV8Dycw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(396003)(346002)(366004)(39860400002)(451199018)(41300700001)(66476007)(4326008)(8676002)(8936002)(66946007)(316002)(66556008)(6666004)(5660300002)(6486002)(54906003)(83380400001)(36756003)(26005)(1076003)(52116002)(6512007)(478600001)(186003)(6506007)(2906002)(2616005)(86362001)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x0d5tmUOXs90MdphStrT2Kr95Yg0fihG1TnT6XKvO+oXvpoFVToGkWxj+9bY?=
 =?us-ascii?Q?BusgBblDoLFw5324fQzgLj0SGKc5vFhBc2czg2cMGWYmSgMd0DF7SFOlEUzJ?=
 =?us-ascii?Q?9IBQ9XxDI52W89ijdH2a/9AD9H0ceMFi2pSUPI8TVw4D3XLjfYF8U3agpqFZ?=
 =?us-ascii?Q?UI3JwjoGpC+9Z1PaQt+AoWPD0NNEcmmeojlZNJsSy7QeBZbD33mOyRlqWt9M?=
 =?us-ascii?Q?V7TjkBBzPgP5qN5r/Bjn/qPME6YnHELq+jLl1eNUZcGm3ED3RdeVwsR/o53g?=
 =?us-ascii?Q?KrYvjZrZu3g5yaGehfH510VpkdDYZVGA0HjO6moCRFBpxyN3BB87yNncECcd?=
 =?us-ascii?Q?9W+iWtcMYrIXZdDHkACv14GJbvqY8PZjaxxc40t6DvGnVd0fgS+/i4OcxAL3?=
 =?us-ascii?Q?AzqXSbVcagL5RkVlFP0Osj0EtiCbbRj8SPanh0zrQSnGruenog+gxP7AfCLm?=
 =?us-ascii?Q?6vAyJF0/CY+RvS629V6RRr4e6zMZT/2GPThqLTrorUZts3tozXwVHfu4CHft?=
 =?us-ascii?Q?A6tCjHiy5wscxR4LVu2vQHX4lKdhnzhokf5aRlI3fVSbmGgdz9EqkH6FIpYJ?=
 =?us-ascii?Q?Ucv7e/JzdGj0x6u5htPjaMDWM093WSYmZlCOfT52MzQ6o2M1zHvcYQV8E+lR?=
 =?us-ascii?Q?iSUCcTz583FERdEtwBB6+CoQU6VXXnG05wTH3PYcjakpp9lA+zx6cI5Alcys?=
 =?us-ascii?Q?/LX2bnOE09hW72Kck572QszVQxluGwxaOMK248toUMq3UB/rWkDHK3zJAwYP?=
 =?us-ascii?Q?U1NmXc9722Gs1e1wHm2fp35Tgu47LL1zmWgyKxjVxdk3K2VZFO6UbCsnMjrN?=
 =?us-ascii?Q?5vA/ljZmqVIL0mc0Gq1/yQ0/HXgIu+o5ZUkeRFO8RISQeUyaDylr0vNWLTOU?=
 =?us-ascii?Q?L12LYOomsYfpfvwil+VyUAn2maY3hXnZe+fYqCY2c7BGE6hy5G3bjFbAuCFM?=
 =?us-ascii?Q?xJGDcCCYVdy6X3viCByTti9/2utEyPHlsE7jdILFSowNGhf4R9syde5bNUPY?=
 =?us-ascii?Q?CU5X4zlLavEjnbl70Iq0rEsSpwSiYi9pIORTSQU2F1DQNE5m+is5XVIz8pl8?=
 =?us-ascii?Q?6ddACUnCio1KdIUdlQskTiUobZIgRug6xfAWYAO3N3kXwWqjjAEdUzS/YRNC?=
 =?us-ascii?Q?gWJVFuev7IqyGvnnThxkHFiNbqb5lpNa4JHjO+XPbSmtVLZg49oMcM1cPcuW?=
 =?us-ascii?Q?s/8BCTik/Jcmsv8WIlZqGECa1tpidEj2EHir1i7PzZ8z7X9wMdMvn6DGOqAp?=
 =?us-ascii?Q?+WNC2RO9ZO2kQTHBQO0e9bl60ijrL6HhIXhLXbbrR5tM2zuxFGrxW59UhOME?=
 =?us-ascii?Q?jvQ2EuGmKMPe4MTZZYU0W+stZnMEF/EpEcTFe5Um9bs3SdGBbq+COk7Vm17T?=
 =?us-ascii?Q?gSB8CCoE+p6iUXbb7aNmxYL4FwID/UH9F7F3ye3BYru7g6zupyVG4ARN2Ydd?=
 =?us-ascii?Q?awi1366qLvRxk7bijhFvf1szofGE9k1oUSPQKlpyG8mjRVfHAs4MwNo3M45i?=
 =?us-ascii?Q?ueSLmYstIR2DXOa95tGkX9KeZJJztPLM/9QQOw8Hnja+OCiu7vPU3uH+52qr?=
 =?us-ascii?Q?46z/TSDAOiV4iQ+BcEBptQcQ4XN02/LXOyjAPnxZ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8c51dbb8-245e-4969-9f14-08db0441ae8c
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Feb 2023 10:47:15.3718 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cpYgRudgqHMJR+VcltNuVUlzFmAj1k1hvFKBzstBgHDfx3xXiaukxR1Khj/qQSPPZ7agNqmuiwtsAG+1yz2LZg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5282
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Convert to use iostat_lat_type as parameter instead of raw
 number. BTW, move NUM_PREALLOC_IOSTAT_CTXS to the header file,
 adjust iostat_lat[{0, 1, 2}]
 to iostat_lat[{READ_IO,WRITE_SYNC_IO,WRITE_ASYNC_IO [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.139 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.139 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pNAeD-0001DZ-Nj
Subject: [f2fs-dev] [PATCH v4 1/2] f2fs: use iostat_lat_type directly as a
 parameter in the iostat_update_and_unbind_ctx()
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
Cc: kernel test robot <lkp@intel.com>, Yangtao Li <frank.li@vivo.com>,
 Dan Carpenter <error27@gmail.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Convert to use iostat_lat_type as parameter instead of raw number.
BTW, move NUM_PREALLOC_IOSTAT_CTXS to the header file, adjust
iostat_lat[{0,1,2}] to iostat_lat[{READ_IO,WRITE_SYNC_IO,WRITE_ASYNC_IO}]
in tracepoint function, and rename iotype to page_type to match the definition.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v4:
-adjust iostat_lat[] in tracepoint function
 fs/f2fs/data.c              |  4 +--
 fs/f2fs/iostat.c            | 39 +++++++++++----------------
 fs/f2fs/iostat.h            | 19 ++++++-------
 include/trace/events/f2fs.h | 54 ++++++++++++++++++-------------------
 4 files changed, 55 insertions(+), 61 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 754841bce389..86fc28adc970 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -292,7 +292,7 @@ static void f2fs_read_end_io(struct bio *bio)
 	struct bio_post_read_ctx *ctx;
 	bool intask = in_task();
 
-	iostat_update_and_unbind_ctx(bio, 0);
+	iostat_update_and_unbind_ctx(bio, READ_IO);
 	ctx = bio->bi_private;
 
 	if (time_to_inject(sbi, FAULT_READ_IO))
@@ -330,7 +330,7 @@ static void f2fs_write_end_io(struct bio *bio)
 	struct bio_vec *bvec;
 	struct bvec_iter_all iter_all;
 
-	iostat_update_and_unbind_ctx(bio, 1);
+	iostat_update_and_unbind_ctx(bio, bio->bi_opf & REQ_SYNC ? WRITE_SYNC_IO : WRITE_ASYNC_IO);
 	sbi = bio->bi_private;
 
 	if (time_to_inject(sbi, FAULT_WRITE_IO))
diff --git a/fs/f2fs/iostat.c b/fs/f2fs/iostat.c
index 96637756eae8..c767a2e7d5a9 100644
--- a/fs/f2fs/iostat.c
+++ b/fs/f2fs/iostat.c
@@ -14,7 +14,6 @@
 #include "iostat.h"
 #include <trace/events/f2fs.h>
 
-#define NUM_PREALLOC_IOSTAT_CTXS	128
 static struct kmem_cache *bio_iostat_ctx_cache;
 static mempool_t *bio_iostat_ctx_pool;
 
@@ -210,53 +209,47 @@ void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
 }
 
 static inline void __update_iostat_latency(struct bio_iostat_ctx *iostat_ctx,
-				int rw, bool is_sync)
+				enum iostat_lat_type lat_type)
 {
 	unsigned long ts_diff;
-	unsigned int iotype = iostat_ctx->type;
+	unsigned int page_type = iostat_ctx->type;
 	struct f2fs_sb_info *sbi = iostat_ctx->sbi;
 	struct iostat_lat_info *io_lat = sbi->iostat_io_lat;
-	int idx;
 	unsigned long flags;
 
 	if (!sbi->iostat_enable)
 		return;
 
 	ts_diff = jiffies - iostat_ctx->submit_ts;
-	if (iotype == META_FLUSH) {
-		iotype = META;
-	} else if (iotype >= NR_PAGE_TYPE) {
-		f2fs_warn(sbi, "%s: %d over NR_PAGE_TYPE", __func__, iotype);
+	if (page_type == META_FLUSH) {
+		page_type = META;
+	} else if (page_type >= NR_PAGE_TYPE) {
+		f2fs_warn(sbi, "%s: %d over NR_PAGE_TYPE", __func__, page_type);
 		return;
 	}
 
-	if (rw == 0) {
-		idx = READ_IO;
-	} else {
-		if (is_sync)
-			idx = WRITE_SYNC_IO;
-		else
-			idx = WRITE_ASYNC_IO;
+	if (lat_type >= MAX_IO_TYPE) {
+		f2fs_warn(sbi, "%s: %d over MAX_IO_TYPE", __func__, lat_type);
+		return;
 	}
 
 	spin_lock_irqsave(&sbi->iostat_lat_lock, flags);
-	io_lat->sum_lat[idx][iotype] += ts_diff;
-	io_lat->bio_cnt[idx][iotype]++;
-	if (ts_diff > io_lat->peak_lat[idx][iotype])
-		io_lat->peak_lat[idx][iotype] = ts_diff;
+	io_lat->sum_lat[lat_type][page_type] += ts_diff;
+	io_lat->bio_cnt[lat_type][page_type]++;
+	if (ts_diff > io_lat->peak_lat[lat_type][page_type])
+		io_lat->peak_lat[lat_type][page_type] = ts_diff;
 	spin_unlock_irqrestore(&sbi->iostat_lat_lock, flags);
 }
 
-void iostat_update_and_unbind_ctx(struct bio *bio, int rw)
+void iostat_update_and_unbind_ctx(struct bio *bio, enum iostat_lat_type lat_type)
 {
 	struct bio_iostat_ctx *iostat_ctx = bio->bi_private;
-	bool is_sync = bio->bi_opf & REQ_SYNC;
 
-	if (rw == 0)
+	if (lat_type == READ_IO)
 		bio->bi_private = iostat_ctx->post_read_ctx;
 	else
 		bio->bi_private = iostat_ctx->sbi;
-	__update_iostat_latency(iostat_ctx, rw, is_sync);
+	__update_iostat_latency(iostat_ctx, lat_type);
 	mempool_free(iostat_ctx, bio_iostat_ctx_pool);
 }
 
diff --git a/fs/f2fs/iostat.h b/fs/f2fs/iostat.h
index 2c048307b6e0..1f827a2fe6b2 100644
--- a/fs/f2fs/iostat.h
+++ b/fs/f2fs/iostat.h
@@ -8,20 +8,21 @@
 
 struct bio_post_read_ctx;
 
+enum iostat_lat_type {
+	READ_IO = 0,
+	WRITE_SYNC_IO,
+	WRITE_ASYNC_IO,
+	MAX_IO_TYPE,
+};
+
 #ifdef CONFIG_F2FS_IOSTAT
 
+#define NUM_PREALLOC_IOSTAT_CTXS	128
 #define DEFAULT_IOSTAT_PERIOD_MS	3000
 #define MIN_IOSTAT_PERIOD_MS		100
 /* maximum period of iostat tracing is 1 day */
 #define MAX_IOSTAT_PERIOD_MS		8640000
 
-enum {
-	READ_IO,
-	WRITE_SYNC_IO,
-	WRITE_ASYNC_IO,
-	MAX_IO_TYPE,
-};
-
 struct iostat_lat_info {
 	unsigned long sum_lat[MAX_IO_TYPE][NR_PAGE_TYPE];	/* sum of io latencies */
 	unsigned long peak_lat[MAX_IO_TYPE][NR_PAGE_TYPE];	/* peak io latency */
@@ -57,7 +58,7 @@ static inline struct bio_post_read_ctx *get_post_read_ctx(struct bio *bio)
 	return iostat_ctx->post_read_ctx;
 }
 
-extern void iostat_update_and_unbind_ctx(struct bio *bio, int rw);
+extern void iostat_update_and_unbind_ctx(struct bio *bio, enum iostat_lat_type type);
 extern void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
 		struct bio *bio, struct bio_post_read_ctx *ctx);
 extern int f2fs_init_iostat_processing(void);
@@ -67,7 +68,7 @@ extern void f2fs_destroy_iostat(struct f2fs_sb_info *sbi);
 #else
 static inline void f2fs_update_iostat(struct f2fs_sb_info *sbi, struct inode *inode,
 		enum iostat_type type, unsigned long long io_bytes) {}
-static inline void iostat_update_and_unbind_ctx(struct bio *bio, int rw) {}
+static inline void iostat_update_and_unbind_ctx(struct bio *bio, enum iostat_lat_type type) {}
 static inline void iostat_alloc_and_bind_ctx(struct f2fs_sb_info *sbi,
 		struct bio *bio, struct bio_post_read_ctx *ctx) {}
 static inline void iostat_update_submit_ctx(struct bio *bio,
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index fe6bcf5f917d..1322d34a5dfc 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -2082,33 +2082,33 @@ TRACE_EVENT(f2fs_iostat_latency,
 
 	TP_fast_assign(
 		__entry->dev		= sbi->sb->s_dev;
-		__entry->d_rd_peak	= iostat_lat[0][DATA].peak_lat;
-		__entry->d_rd_avg	= iostat_lat[0][DATA].avg_lat;
-		__entry->d_rd_cnt	= iostat_lat[0][DATA].cnt;
-		__entry->n_rd_peak	= iostat_lat[0][NODE].peak_lat;
-		__entry->n_rd_avg	= iostat_lat[0][NODE].avg_lat;
-		__entry->n_rd_cnt	= iostat_lat[0][NODE].cnt;
-		__entry->m_rd_peak	= iostat_lat[0][META].peak_lat;
-		__entry->m_rd_avg	= iostat_lat[0][META].avg_lat;
-		__entry->m_rd_cnt	= iostat_lat[0][META].cnt;
-		__entry->d_wr_s_peak	= iostat_lat[1][DATA].peak_lat;
-		__entry->d_wr_s_avg	= iostat_lat[1][DATA].avg_lat;
-		__entry->d_wr_s_cnt	= iostat_lat[1][DATA].cnt;
-		__entry->n_wr_s_peak	= iostat_lat[1][NODE].peak_lat;
-		__entry->n_wr_s_avg	= iostat_lat[1][NODE].avg_lat;
-		__entry->n_wr_s_cnt	= iostat_lat[1][NODE].cnt;
-		__entry->m_wr_s_peak	= iostat_lat[1][META].peak_lat;
-		__entry->m_wr_s_avg	= iostat_lat[1][META].avg_lat;
-		__entry->m_wr_s_cnt	= iostat_lat[1][META].cnt;
-		__entry->d_wr_as_peak	= iostat_lat[2][DATA].peak_lat;
-		__entry->d_wr_as_avg	= iostat_lat[2][DATA].avg_lat;
-		__entry->d_wr_as_cnt	= iostat_lat[2][DATA].cnt;
-		__entry->n_wr_as_peak	= iostat_lat[2][NODE].peak_lat;
-		__entry->n_wr_as_avg	= iostat_lat[2][NODE].avg_lat;
-		__entry->n_wr_as_cnt	= iostat_lat[2][NODE].cnt;
-		__entry->m_wr_as_peak	= iostat_lat[2][META].peak_lat;
-		__entry->m_wr_as_avg	= iostat_lat[2][META].avg_lat;
-		__entry->m_wr_as_cnt	= iostat_lat[2][META].cnt;
+		__entry->d_rd_peak	= iostat_lat[READ_IO][DATA].peak_lat;
+		__entry->d_rd_avg	= iostat_lat[READ_IO][DATA].avg_lat;
+		__entry->d_rd_cnt	= iostat_lat[READ_IO][DATA].cnt;
+		__entry->n_rd_peak	= iostat_lat[READ_IO][NODE].peak_lat;
+		__entry->n_rd_avg	= iostat_lat[READ_IO][NODE].avg_lat;
+		__entry->n_rd_cnt	= iostat_lat[READ_IO][NODE].cnt;
+		__entry->m_rd_peak	= iostat_lat[READ_IO][META].peak_lat;
+		__entry->m_rd_avg	= iostat_lat[READ_IO][META].avg_lat;
+		__entry->m_rd_cnt	= iostat_lat[READ_IO][META].cnt;
+		__entry->d_wr_s_peak	= iostat_lat[WRITE_SYNC_IO][DATA].peak_lat;
+		__entry->d_wr_s_avg	= iostat_lat[WRITE_SYNC_IO][DATA].avg_lat;
+		__entry->d_wr_s_cnt	= iostat_lat[WRITE_SYNC_IO][DATA].cnt;
+		__entry->n_wr_s_peak	= iostat_lat[WRITE_SYNC_IO][NODE].peak_lat;
+		__entry->n_wr_s_avg	= iostat_lat[WRITE_SYNC_IO][NODE].avg_lat;
+		__entry->n_wr_s_cnt	= iostat_lat[WRITE_SYNC_IO][NODE].cnt;
+		__entry->m_wr_s_peak	= iostat_lat[WRITE_SYNC_IO][META].peak_lat;
+		__entry->m_wr_s_avg	= iostat_lat[WRITE_SYNC_IO][META].avg_lat;
+		__entry->m_wr_s_cnt	= iostat_lat[WRITE_SYNC_IO][META].cnt;
+		__entry->d_wr_as_peak	= iostat_lat[WRITE_ASYNC_IO][DATA].peak_lat;
+		__entry->d_wr_as_avg	= iostat_lat[WRITE_ASYNC_IO][DATA].avg_lat;
+		__entry->d_wr_as_cnt	= iostat_lat[WRITE_ASYNC_IO][DATA].cnt;
+		__entry->n_wr_as_peak	= iostat_lat[WRITE_ASYNC_IO][NODE].peak_lat;
+		__entry->n_wr_as_avg	= iostat_lat[WRITE_ASYNC_IO][NODE].avg_lat;
+		__entry->n_wr_as_cnt	= iostat_lat[WRITE_ASYNC_IO][NODE].cnt;
+		__entry->m_wr_as_peak	= iostat_lat[WRITE_ASYNC_IO][META].peak_lat;
+		__entry->m_wr_as_avg	= iostat_lat[WRITE_ASYNC_IO][META].avg_lat;
+		__entry->m_wr_as_cnt	= iostat_lat[WRITE_ASYNC_IO][META].cnt;
 	),
 
 	TP_printk("dev = (%d,%d), "
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
