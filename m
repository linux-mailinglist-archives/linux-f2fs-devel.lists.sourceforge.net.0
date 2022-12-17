Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BB1664F912
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 17 Dec 2022 14:23:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p6XAN-0003AT-SG;
	Sat, 17 Dec 2022 13:23:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p6XAM-0003AF-9R
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 17 Dec 2022 13:23:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T01FLlvot8KFP/EdWuLwIjr+8r83pvS733pFF3hHAME=; b=LeGVeYtws1mgipAP1Qexw+sYd0
 kOI1X2JFIz3P4/xcXc6OmU6iCCjbTDhtgJFYRZVHk8ucPgUrRHbkYuTwgCkw489DfdnV7LUr0DI7l
 YwTUdhtRAl6VGDM5cFjXS7sDSPPg3AJOWjlG8q1d7pz8zFYneaNRHtY9JgHTe9ZsVXLA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=T01FLlvot8KFP/EdWuLwIjr+8r83pvS733pFF3hHAME=; b=c
 2KfeGDG3qFBJO/AuATmKmz8pNQwHBNd2w8Jr6P+UJKhg2q693VYO/tE++ViDb7FLgirlIMcjtl4nj
 oz33VKUSCBrdS8UNfgGzBNQB1Mcg0K/O5Cv11PY0RGZ3v8N5x1/LvKG3RbEwQzpL3b+DU2cgyYcn0
 Q5+N5PgqElCLdhSE=;
Received: from mail-tyzapc01on2107.outbound.protection.outlook.com
 ([40.107.117.107] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p6XAC-0001KG-PW for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 17 Dec 2022 13:23:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aovMQLnIpGmP7yKR8gs+U1UJ4JMamZ8+7zRWDn2I459NMgXoLaQzlw/JeqFyZB7kb5Mt85J5D0jJPBu9PdsFixybCl6tvIFgB7A/6aSZhDw10PgV6jdVunGA1kIs6f2A7cGfgv+CzL8tbu6KSTYe2vVbAc8gTQqf+LwZKxpAw+PFiykc2IcnIQx0dv+gvCWOhXOlZxvu9/wqkwSvrLhQhXqV5JggQ9Oy48m1uqbwJWkpUfX2pWo5S2+mhNXPf7RiyWEm6d6XQ6qCK6asyklnssjaCKhK0mRaWzm19+TfUxjJUbRYj+XlGYmlQZ9YYzcOBWpZrJpfKf7867ZR0pkSeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T01FLlvot8KFP/EdWuLwIjr+8r83pvS733pFF3hHAME=;
 b=eB2eiiF8x435+s0XADcOZkhQvsnj0urOBbY5zo1XNTW47XnD6yZSWch69UZsc23gQ5yiRwk++DNCLmI8JFmRgcQPGgK/1mxL8yzemwMYQoXsJp8SqLGzvqBFFtVlwDuowZzWuXwB7q9jxD1ydOOB1fnKUoBwyG471FBlRph0mHtfbqgBsODPq9xdsN1QOu+JUBrmzVWe/chrSfmN4MQ6mJzSVtbkNOkQyBQzQetb5+UjjEQmxJYHAOXWz9vxFyCp3CWdqWb1SRq6845RMYFYEjBhDoQd71pDe2UV0GLp1F1A7ZaNhIVff3zMzRFFmdFPh8iytJT9XD7fBkT4w4tetw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T01FLlvot8KFP/EdWuLwIjr+8r83pvS733pFF3hHAME=;
 b=oT7qZDH7i3/xnUDbTMVNzyHvLiPaI2F15kl9/MlhAL5ddl1giqhCm21H7rcsGPQszcQ8P4nxN7oh1/58l8vm+iSQY9PlLpe5jjm/ULBGSUSUgfsyUOPDjl6C4YD1vuDzHGYJPeZjMS/lbAD9ZcWEit1P5kA7BXmHowLm+Fqr28Xfd71/7qCsw2fjg9JhjqVq/T+lF+yltkUix8b6WhSofrGE108jsp/iteUDdPpFWZYK16APn4Jz+hwE3OPf6sCCF9mxXvUjzg0PsSIbWPr/fTS6imNdMWDG3n70yQrrb4FAcRgvX8hbaoNE9lTnS2rSjcbS7afJ/d30se8Rx2fXFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4378.apcprd06.prod.outlook.com (2603:1096:4:15a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Sat, 17 Dec
 2022 13:23:30 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5924.016; Sat, 17 Dec 2022
 13:23:30 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat, 17 Dec 2022 21:23:18 +0800
Message-Id: <20221217132318.37718-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR01CA0040.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::14) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4378:EE_
X-MS-Office365-Filtering-Correlation-Id: d146f434-24a3-4bbe-4e21-08dae031e373
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HsifdJbhR5Z8W9SXQBM3PySQSNSfGwFCSwSWXKuU9rOMOXv6M6FJ4QLOzUsjNpqYxAsfMbF8/zhj5ilUcbfIyyT/nf3d8HobrxTzkiNuDdNgzB5zd6qdY4LCS4lBFvoOIuHq86GzNLc3TdH6UjNUqwig88jtyHOvH7um6//gzPevrHYgxN8BjYMAGhZaljNaASJLvwVHdQJ4ChPleVuihISfnQBjSYDo4NOy2mnjPKnGuTaMFn0ooePrQbs60AYh3JMZ3cGp5Ql9w71ZdJbyU+w4jiXKrclkH4AM+zLyPc5XofqR9ZTQC0PMViszd1AR0EVmT+WbY1VX13cCBxw03Ijawx5O58x2gIojJ6UMU0dzCYtZnT7pZ5jWp5rpX9orwYw+JX1hKdxhqQzWiQm/+twpi1GtpPYe0Gs8X0yCPsSW3s2ojJsnxWbY5bETf3Ju0ALhJOMN+v51V4LaZq1uhumD4BsFh99Nt+Hr521bkvOQk4etHp+NSCFrqBm1fO1Seq221/VLhmFMklHzcfYhpWqrJVfPWKkYR3rErYAnaDEH/M3A+0mSEpff9hPzWq7MOwBmsYB8sHBxaS5mLEFWgWKDXSaUH/fK77edYllriXgt9NfHU82h9mwMpPbn8kbK2+FM0061MeAUI4C0nSBRZSo6BN5XTJ1/V054WfYFMzPTNcnK8wgKegzoidT5O6eG7i9B/bOheINtkrpoEpqbbg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(451199015)(66476007)(86362001)(316002)(66556008)(66946007)(38350700002)(1076003)(8676002)(4326008)(38100700002)(2616005)(36756003)(30864003)(2906002)(5660300002)(83380400001)(41300700001)(8936002)(6506007)(52116002)(6486002)(478600001)(26005)(186003)(6512007)(6666004)(107886003)(559001)(579004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j55zFMj9K5Ymlq5d/3tdRRpPQ/T2mK2pIf/JJXUV7GbR7rSSX436ZodXjRz5?=
 =?us-ascii?Q?zXTK5V2ZG5OWKers6aDpBlhXHMbRmgesyGbFHRIgKvuu3EknVJkwqMf0RCFm?=
 =?us-ascii?Q?rko39lB6mKVbTsR923MwNjdjxZ2s8jNvoXYlJa5f2H+Pdfj3XViW+C6tnP8M?=
 =?us-ascii?Q?2J/kfIQU7GipyXXGsM+5RA8P1N+oOVHDs1Y91X6qSW8CqqeLaBoQxCWW8HqL?=
 =?us-ascii?Q?uKStMAP14K1l6OgkWQw+VL+QwDSrAV0MmhR66gOl423yqQPoFuSl9jpl7+aS?=
 =?us-ascii?Q?zQVwxAeFJJJBhdD2PgwBbBNWmVMTQld7M0o7Wyg1HFWo62mxSCLgkqkievS5?=
 =?us-ascii?Q?t59r7ctsUEqKCIGplQxa5Lf82tCLBWpKRXXH5LqbcLIhP76f7FJb/RcdJufx?=
 =?us-ascii?Q?7ez8kOw62eVR8m0uj3n+AYdzH5MpFNyEZWseI+kjJyF/kNFVBwP3NtE0EXMP?=
 =?us-ascii?Q?xU/lsPUjSsdozgeWUnYpJval2PdQ5U7D5aPghTsjag/JTQ4OhfUVyDMYmW+p?=
 =?us-ascii?Q?S0/NmHYMJmlByTtl34DZk2+oFoS0t4X4z0RQLcZnOBLdFKnTUIyALB801GXc?=
 =?us-ascii?Q?jMIhTshV9n/TqRKQlqIKNGLhMaIPnglB4ySJxPOE4yuxm1LsrHP5w1b9PXL2?=
 =?us-ascii?Q?3C9g+huHUgOombXhp8eYft0KmSH/bKsESbsz4Kq17nGB+n8eQZCtiRW9YA4x?=
 =?us-ascii?Q?x2pFlMJIEF7UjUIt29xqbgBbDkQQiaiyXRjju5R/mJ4qBvoINaUljW4Ctaaw?=
 =?us-ascii?Q?BNoZ//DoEICOQUUD4lAEuW2Xlv4/OTGhQIM3JBpWGdbkkjA2fmkzKKCvpgK1?=
 =?us-ascii?Q?jtMX6Z85UopjU8AricvTlon3HVDKGwaxSBmuuFIGJHRoIIA0Wevv3Qy/b8WS?=
 =?us-ascii?Q?ClfcTY3Wkc3zyJhHg0LW5m8e4fYRxLciEnNr2thmwUC4tO6CbGoXyrw5MSQN?=
 =?us-ascii?Q?l5b76uaxqNIvrYPXRNEdQKSGjUqQ0gDPkXf2acyPxx140fhcA0xvKmPl2pIC?=
 =?us-ascii?Q?TdV5JLjpsDrKXdeX1q7fGjCUN/GIqZdbm/x1EXDvBp8bSPahVLpv/Qp8DSun?=
 =?us-ascii?Q?TQtutinMQqHrAdbqc75PGHiioU0+fgyB1XYgMW1Id3yhqPkX6sZjqdRi6UDx?=
 =?us-ascii?Q?QJGr/G2P2WUSw+do2erUCzGEvoeYjgZ692lnWlX9xtyjVo0wJ2Oh9ZtZo+Iq?=
 =?us-ascii?Q?JtgJfH8f2Hm8oATLda+bUfSdGofEUodNDkxkyYB7Lu8+f5e5LVUpXwWpqKTP?=
 =?us-ascii?Q?psEN1G8mPv29cCoMhRuZWj+g0TuXkid7PB8+OGMme6S2pi9D+GdSqEFwPQjj?=
 =?us-ascii?Q?Sbf1BMyyLJ1eLqPUXlsCYaJfvX8eUsuiCBI2hQ/tF6w86Xgu6lFnk7ngWljJ?=
 =?us-ascii?Q?ahulzJAiS3p0IFQykDxOS/DVvwqMqGEW2wBbTqYf3QD9mXrmLttZvyPFP/8/?=
 =?us-ascii?Q?TyTUd+wDSY8QSesSvJgGiiFtZIGmz/AdiziOC/9cy8Wk2yUhXP1dR4tCSGK6?=
 =?us-ascii?Q?jEaBm1+Za5QDsCU33onjxSvTp61LlN1RcxP41lWWs2JkSpQ3w+uptOsE23Z3?=
 =?us-ascii?Q?BG0yTJb0lxqYRXGv8Z+You3SMDjEno6WCoXpiIDz?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d146f434-24a3-4bbe-4e21-08dae031e373
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2022 13:23:30.3956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0wF24rDgucy1OVyLgzQxMGhITJt5Y3emud9SvplZoibZCi8yPoZiCacgUxkgJf0f6vZxjqwP7j+WRZhoaAamLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4378
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch moves discard related code from segment.c into
 discard.c since discard is independent feature, and it's better to maintain
 them in separated place. There is no functionality change. Signed-off-by:
 Yangtao Li <frank.li@vivo.com> --- fs/f2fs/Makefile | 2 +- fs/f2fs/discard.c
 | 1271 +++++++++++++++++++++++++++++++++++++++++++++ fs/f2fs/f2fs.h | 37
 +- fs/f2fs/segment.c | 1268 +------ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.107 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.107 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1p6XAC-0001KG-PW
Subject: [f2fs-dev] [PATCH] f2fs: maintain discard in separated file
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
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch moves discard related code from segment.c into discard.c
since discard is independent feature, and it's better to maintain
them in separated place.

There is no functionality change.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/Makefile  |    2 +-
 fs/f2fs/discard.c | 1271 +++++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/f2fs.h    |   37 +-
 fs/f2fs/segment.c | 1268 +-------------------------------------------
 4 files changed, 1317 insertions(+), 1261 deletions(-)
 create mode 100644 fs/f2fs/discard.c

diff --git a/fs/f2fs/Makefile b/fs/f2fs/Makefile
index 8a7322d229e4..3d2874633db0 100644
--- a/fs/f2fs/Makefile
+++ b/fs/f2fs/Makefile
@@ -3,7 +3,7 @@ obj-$(CONFIG_F2FS_FS) += f2fs.o
 
 f2fs-y		:= dir.o file.o inode.o namei.o hash.o super.o inline.o
 f2fs-y		+= checkpoint.o gc.o data.o node.o segment.o recovery.o
-f2fs-y		+= shrinker.o extent_cache.o sysfs.o
+f2fs-y		+= shrinker.o extent_cache.o sysfs.o discard.o
 f2fs-$(CONFIG_F2FS_STAT_FS) += debug.o
 f2fs-$(CONFIG_F2FS_FS_XATTR) += xattr.o
 f2fs-$(CONFIG_F2FS_FS_POSIX_ACL) += acl.o
diff --git a/fs/f2fs/discard.c b/fs/f2fs/discard.c
new file mode 100644
index 000000000000..794f88fc729d
--- /dev/null
+++ b/fs/f2fs/discard.c
@@ -0,0 +1,1271 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * f2fs discard support
+ *
+ * Copyright (c) 2022 Vivo Communication Technology Co.,Ltd.
+ * Author: Yangtao Li <frank.li@vivo.com>
+ */
+
+#include <linux/f2fs_fs.h>
+#include <linux/freezer.h>
+#include <linux/kthread.h>
+
+#include "f2fs.h"
+#include "segment.h"
+#include "node.h"
+#include "iostat.h"
+#include <trace/events/f2fs.h>
+
+static struct kmem_cache *discard_entry_slab;
+static struct kmem_cache *discard_cmd_slab;
+
+static struct discard_cmd *__create_discard_cmd(struct f2fs_sb_info *sbi,
+		struct block_device *bdev, block_t lstart,
+		block_t start, block_t len)
+{
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+	struct list_head *pend_list;
+	struct discard_cmd *dc;
+
+	f2fs_bug_on(sbi, !len);
+
+	pend_list = &dcc->pend_list[plist_idx(len)];
+
+	dc = f2fs_kmem_cache_alloc(discard_cmd_slab, GFP_NOFS, true, NULL);
+	INIT_LIST_HEAD(&dc->list);
+	dc->bdev = bdev;
+	dc->lstart = lstart;
+	dc->start = start;
+	dc->len = len;
+	dc->ref = 0;
+	dc->state = D_PREP;
+	dc->queued = 0;
+	dc->error = 0;
+	init_completion(&dc->wait);
+	list_add_tail(&dc->list, pend_list);
+	spin_lock_init(&dc->lock);
+	dc->bio_ref = 0;
+	atomic_inc(&dcc->discard_cmd_cnt);
+	dcc->undiscard_blks += len;
+
+	return dc;
+}
+
+static struct discard_cmd *__attach_discard_cmd(struct f2fs_sb_info *sbi,
+				struct block_device *bdev, block_t lstart,
+				block_t start, block_t len,
+				struct rb_node *parent, struct rb_node **p,
+				bool leftmost)
+{
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+	struct discard_cmd *dc;
+
+	dc = __create_discard_cmd(sbi, bdev, lstart, start, len);
+
+	rb_link_node(&dc->rb_node, parent, p);
+	rb_insert_color_cached(&dc->rb_node, &dcc->root, leftmost);
+
+	return dc;
+}
+
+static void __detach_discard_cmd(struct discard_cmd_control *dcc,
+							struct discard_cmd *dc)
+{
+	if (dc->state == D_DONE)
+		atomic_sub(dc->queued, &dcc->queued_discard);
+
+	list_del(&dc->list);
+	rb_erase_cached(&dc->rb_node, &dcc->root);
+	dcc->undiscard_blks -= dc->len;
+
+	kmem_cache_free(discard_cmd_slab, dc);
+
+	atomic_dec(&dcc->discard_cmd_cnt);
+}
+
+static void __remove_discard_cmd(struct f2fs_sb_info *sbi,
+							struct discard_cmd *dc)
+{
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+	unsigned long flags;
+
+	trace_f2fs_remove_discard(dc->bdev, dc->start, dc->len);
+
+	spin_lock_irqsave(&dc->lock, flags);
+	if (dc->bio_ref) {
+		spin_unlock_irqrestore(&dc->lock, flags);
+		return;
+	}
+	spin_unlock_irqrestore(&dc->lock, flags);
+
+	f2fs_bug_on(sbi, dc->ref);
+
+	if (dc->error == -EOPNOTSUPP)
+		dc->error = 0;
+
+	if (dc->error)
+		printk_ratelimited(
+			"%sF2FS-fs (%s): Issue discard(%u, %u, %u) failed, ret: %d",
+			KERN_INFO, sbi->sb->s_id,
+			dc->lstart, dc->start, dc->len, dc->error);
+	__detach_discard_cmd(dcc, dc);
+}
+
+static void f2fs_submit_discard_endio(struct bio *bio)
+{
+	struct discard_cmd *dc = (struct discard_cmd *)bio->bi_private;
+	unsigned long flags;
+
+	spin_lock_irqsave(&dc->lock, flags);
+	if (!dc->error)
+		dc->error = blk_status_to_errno(bio->bi_status);
+	dc->bio_ref--;
+	if (!dc->bio_ref && dc->state == D_SUBMIT) {
+		dc->state = D_DONE;
+		complete_all(&dc->wait);
+	}
+	spin_unlock_irqrestore(&dc->lock, flags);
+	bio_put(bio);
+}
+
+static void __init_discard_policy(struct f2fs_sb_info *sbi,
+				struct discard_policy *dpolicy,
+				int discard_type, unsigned int granularity)
+{
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+
+	/* common policy */
+	dpolicy->type = discard_type;
+	dpolicy->sync = true;
+	dpolicy->ordered = false;
+	dpolicy->granularity = granularity;
+
+	dpolicy->max_requests = dcc->max_discard_request;
+	dpolicy->io_aware_gran = MAX_PLIST_NUM;
+	dpolicy->timeout = false;
+
+	if (discard_type == DPOLICY_BG) {
+		dpolicy->min_interval = dcc->min_discard_issue_time;
+		dpolicy->mid_interval = dcc->mid_discard_issue_time;
+		dpolicy->max_interval = dcc->max_discard_issue_time;
+		dpolicy->io_aware = true;
+		dpolicy->sync = false;
+		dpolicy->ordered = true;
+		if (utilization(sbi) > dcc->discard_urgent_util) {
+			dpolicy->granularity = MIN_DISCARD_GRANULARITY;
+			if (atomic_read(&dcc->discard_cmd_cnt))
+				dpolicy->max_interval =
+					dcc->min_discard_issue_time;
+		}
+	} else if (discard_type == DPOLICY_FORCE) {
+		dpolicy->min_interval = dcc->min_discard_issue_time;
+		dpolicy->mid_interval = dcc->mid_discard_issue_time;
+		dpolicy->max_interval = dcc->max_discard_issue_time;
+		dpolicy->io_aware = false;
+	} else if (discard_type == DPOLICY_FSTRIM) {
+		dpolicy->io_aware = false;
+	} else if (discard_type == DPOLICY_UMOUNT) {
+		dpolicy->io_aware = false;
+		/* we need to issue all to keep CP_TRIMMED_FLAG */
+		dpolicy->granularity = MIN_DISCARD_GRANULARITY;
+		dpolicy->timeout = true;
+	}
+}
+
+static void __update_discard_tree_range(struct f2fs_sb_info *sbi,
+				struct block_device *bdev, block_t lstart,
+				block_t start, block_t len);
+/* this function is copied from blkdev_issue_discard from block/blk-lib.c */
+static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
+						struct discard_policy *dpolicy,
+						struct discard_cmd *dc,
+						unsigned int *issued)
+{
+	struct block_device *bdev = dc->bdev;
+	unsigned int max_discard_blocks =
+			SECTOR_TO_BLOCK(bdev_max_discard_sectors(bdev));
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+	struct list_head *wait_list = (dpolicy->type == DPOLICY_FSTRIM) ?
+					&(dcc->fstrim_list) : &(dcc->wait_list);
+	blk_opf_t flag = dpolicy->sync ? REQ_SYNC : 0;
+	block_t lstart, start, len, total_len;
+	int err = 0;
+
+	if (dc->state != D_PREP)
+		return 0;
+
+	if (is_sbi_flag_set(sbi, SBI_NEED_FSCK))
+		return 0;
+
+	trace_f2fs_issue_discard(bdev, dc->start, dc->len);
+
+	lstart = dc->lstart;
+	start = dc->start;
+	len = dc->len;
+	total_len = len;
+
+	dc->len = 0;
+
+	while (total_len && *issued < dpolicy->max_requests && !err) {
+		struct bio *bio = NULL;
+		unsigned long flags;
+		bool last = true;
+
+		if (len > max_discard_blocks) {
+			len = max_discard_blocks;
+			last = false;
+		}
+
+		(*issued)++;
+		if (*issued == dpolicy->max_requests)
+			last = true;
+
+		dc->len += len;
+
+		if (time_to_inject(sbi, FAULT_DISCARD)) {
+			f2fs_show_injection_info(sbi, FAULT_DISCARD);
+			err = -EIO;
+		} else {
+			err = __blkdev_issue_discard(bdev,
+					SECTOR_FROM_BLOCK(start),
+					SECTOR_FROM_BLOCK(len),
+					GFP_NOFS, &bio);
+		}
+		if (err) {
+			spin_lock_irqsave(&dc->lock, flags);
+			if (dc->state == D_PARTIAL)
+				dc->state = D_SUBMIT;
+			spin_unlock_irqrestore(&dc->lock, flags);
+
+			break;
+		}
+
+		f2fs_bug_on(sbi, !bio);
+
+		/*
+		 * should keep before submission to avoid D_DONE
+		 * right away
+		 */
+		spin_lock_irqsave(&dc->lock, flags);
+		if (last)
+			dc->state = D_SUBMIT;
+		else
+			dc->state = D_PARTIAL;
+		dc->bio_ref++;
+		spin_unlock_irqrestore(&dc->lock, flags);
+
+		atomic_inc(&dcc->queued_discard);
+		dc->queued++;
+		list_move_tail(&dc->list, wait_list);
+
+		/* sanity check on discard range */
+		__check_sit_bitmap(sbi, lstart, lstart + len);
+
+		bio->bi_private = dc;
+		bio->bi_end_io = f2fs_submit_discard_endio;
+		bio->bi_opf |= flag;
+		submit_bio(bio);
+
+		atomic_inc(&dcc->issued_discard);
+
+		f2fs_update_iostat(sbi, NULL, FS_DISCARD, len * F2FS_BLKSIZE);
+
+		lstart += len;
+		start += len;
+		total_len -= len;
+		len = total_len;
+	}
+
+	if (!err && len) {
+		dcc->undiscard_blks -= len;
+		__update_discard_tree_range(sbi, bdev, lstart, start, len);
+	}
+	return err;
+}
+
+static void __insert_discard_tree(struct f2fs_sb_info *sbi,
+				struct block_device *bdev, block_t lstart,
+				block_t start, block_t len,
+				struct rb_node **insert_p,
+				struct rb_node *insert_parent)
+{
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+	struct rb_node **p;
+	struct rb_node *parent = NULL;
+	bool leftmost = true;
+
+	if (insert_p && insert_parent) {
+		parent = insert_parent;
+		p = insert_p;
+		goto do_insert;
+	}
+
+	p = f2fs_lookup_rb_tree_for_insert(sbi, &dcc->root, &parent,
+							lstart, &leftmost);
+do_insert:
+	__attach_discard_cmd(sbi, bdev, lstart, start, len, parent,
+								p, leftmost);
+}
+
+static void __relocate_discard_cmd(struct discard_cmd_control *dcc,
+						struct discard_cmd *dc)
+{
+	list_move_tail(&dc->list, &dcc->pend_list[plist_idx(dc->len)]);
+}
+
+static void __punch_discard_cmd(struct f2fs_sb_info *sbi,
+				struct discard_cmd *dc, block_t blkaddr)
+{
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+	struct discard_info di = dc->di;
+	bool modified = false;
+
+	if (dc->state == D_DONE || dc->len == 1) {
+		__remove_discard_cmd(sbi, dc);
+		return;
+	}
+
+	dcc->undiscard_blks -= di.len;
+
+	if (blkaddr > di.lstart) {
+		dc->len = blkaddr - dc->lstart;
+		dcc->undiscard_blks += dc->len;
+		__relocate_discard_cmd(dcc, dc);
+		modified = true;
+	}
+
+	if (blkaddr < di.lstart + di.len - 1) {
+		if (modified) {
+			__insert_discard_tree(sbi, dc->bdev, blkaddr + 1,
+					di.start + blkaddr + 1 - di.lstart,
+					di.lstart + di.len - 1 - blkaddr,
+					NULL, NULL);
+		} else {
+			dc->lstart++;
+			dc->len--;
+			dc->start++;
+			dcc->undiscard_blks += dc->len;
+			__relocate_discard_cmd(dcc, dc);
+		}
+	}
+}
+
+static void __update_discard_tree_range(struct f2fs_sb_info *sbi,
+				struct block_device *bdev, block_t lstart,
+				block_t start, block_t len)
+{
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+	struct discard_cmd *prev_dc = NULL, *next_dc = NULL;
+	struct discard_cmd *dc;
+	struct discard_info di = {0};
+	struct rb_node **insert_p = NULL, *insert_parent = NULL;
+	unsigned int max_discard_blocks =
+			SECTOR_TO_BLOCK(bdev_max_discard_sectors(bdev));
+	block_t end = lstart + len;
+
+	dc = (struct discard_cmd *)f2fs_lookup_rb_tree_ret(&dcc->root,
+					NULL, lstart,
+					(struct rb_entry **)&prev_dc,
+					(struct rb_entry **)&next_dc,
+					&insert_p, &insert_parent, true, NULL);
+	if (dc)
+		prev_dc = dc;
+
+	if (!prev_dc) {
+		di.lstart = lstart;
+		di.len = next_dc ? next_dc->lstart - lstart : len;
+		di.len = min(di.len, len);
+		di.start = start;
+	}
+
+	while (1) {
+		struct rb_node *node;
+		bool merged = false;
+		struct discard_cmd *tdc = NULL;
+
+		if (prev_dc) {
+			di.lstart = prev_dc->lstart + prev_dc->len;
+			if (di.lstart < lstart)
+				di.lstart = lstart;
+			if (di.lstart >= end)
+				break;
+
+			if (!next_dc || next_dc->lstart > end)
+				di.len = end - di.lstart;
+			else
+				di.len = next_dc->lstart - di.lstart;
+			di.start = start + di.lstart - lstart;
+		}
+
+		if (!di.len)
+			goto next;
+
+		if (prev_dc && prev_dc->state == D_PREP &&
+			prev_dc->bdev == bdev &&
+			__is_discard_back_mergeable(&di, &prev_dc->di,
+							max_discard_blocks)) {
+			prev_dc->di.len += di.len;
+			dcc->undiscard_blks += di.len;
+			__relocate_discard_cmd(dcc, prev_dc);
+			di = prev_dc->di;
+			tdc = prev_dc;
+			merged = true;
+		}
+
+		if (next_dc && next_dc->state == D_PREP &&
+			next_dc->bdev == bdev &&
+			__is_discard_front_mergeable(&di, &next_dc->di,
+							max_discard_blocks)) {
+			next_dc->di.lstart = di.lstart;
+			next_dc->di.len += di.len;
+			next_dc->di.start = di.start;
+			dcc->undiscard_blks += di.len;
+			__relocate_discard_cmd(dcc, next_dc);
+			if (tdc)
+				__remove_discard_cmd(sbi, tdc);
+			merged = true;
+		}
+
+		if (!merged) {
+			__insert_discard_tree(sbi, bdev, di.lstart, di.start,
+							di.len, NULL, NULL);
+		}
+ next:
+		prev_dc = next_dc;
+		if (!prev_dc)
+			break;
+
+		node = rb_next(&prev_dc->rb_node);
+		next_dc = rb_entry_safe(node, struct discard_cmd, rb_node);
+	}
+}
+
+static void __queue_discard_cmd(struct f2fs_sb_info *sbi,
+		struct block_device *bdev, block_t blkstart, block_t blklen)
+{
+	block_t lblkstart = blkstart;
+
+	if (!f2fs_bdev_support_discard(bdev))
+		return;
+
+	trace_f2fs_queue_discard(bdev, blkstart, blklen);
+
+	if (f2fs_is_multi_device(sbi)) {
+		int devi = f2fs_target_device_index(sbi, blkstart);
+
+		blkstart -= FDEV(devi).start_blk;
+	}
+	mutex_lock(&SM_I(sbi)->dcc_info->cmd_lock);
+	__update_discard_tree_range(sbi, bdev, lblkstart, blkstart, blklen);
+	mutex_unlock(&SM_I(sbi)->dcc_info->cmd_lock);
+}
+
+static unsigned int __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
+					struct discard_policy *dpolicy)
+{
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+	struct discard_cmd *prev_dc = NULL, *next_dc = NULL;
+	struct rb_node **insert_p = NULL, *insert_parent = NULL;
+	struct discard_cmd *dc;
+	struct blk_plug plug;
+	unsigned int pos = dcc->next_pos;
+	unsigned int issued = 0;
+	bool io_interrupted = false;
+
+	mutex_lock(&dcc->cmd_lock);
+	dc = (struct discard_cmd *)f2fs_lookup_rb_tree_ret(&dcc->root,
+					NULL, pos,
+					(struct rb_entry **)&prev_dc,
+					(struct rb_entry **)&next_dc,
+					&insert_p, &insert_parent, true, NULL);
+	if (!dc)
+		dc = next_dc;
+
+	blk_start_plug(&plug);
+
+	while (dc) {
+		struct rb_node *node;
+		int err = 0;
+
+		if (dc->state != D_PREP)
+			goto next;
+
+		if (dpolicy->io_aware && !is_idle(sbi, DISCARD_TIME)) {
+			io_interrupted = true;
+			break;
+		}
+
+		dcc->next_pos = dc->lstart + dc->len;
+		err = __submit_discard_cmd(sbi, dpolicy, dc, &issued);
+
+		if (issued >= dpolicy->max_requests)
+			break;
+next:
+		node = rb_next(&dc->rb_node);
+		if (err)
+			__remove_discard_cmd(sbi, dc);
+		dc = rb_entry_safe(node, struct discard_cmd, rb_node);
+	}
+
+	blk_finish_plug(&plug);
+
+	if (!dc)
+		dcc->next_pos = 0;
+
+	mutex_unlock(&dcc->cmd_lock);
+
+	if (!issued && io_interrupted)
+		issued = -1;
+
+	return issued;
+}
+
+static unsigned int __wait_all_discard_cmd(struct f2fs_sb_info *sbi,
+					struct discard_policy *dpolicy);
+
+static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
+					struct discard_policy *dpolicy)
+{
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+	struct list_head *pend_list;
+	struct discard_cmd *dc, *tmp;
+	struct blk_plug plug;
+	int i, issued;
+	bool io_interrupted = false;
+
+	if (dpolicy->timeout)
+		f2fs_update_time(sbi, UMOUNT_DISCARD_TIMEOUT);
+
+retry:
+	issued = 0;
+	for (i = MAX_PLIST_NUM - 1; i >= 0; i--) {
+		if (dpolicy->timeout &&
+				f2fs_time_over(sbi, UMOUNT_DISCARD_TIMEOUT))
+			break;
+
+		if (i + 1 < dpolicy->granularity)
+			break;
+
+		if (i + 1 < dcc->max_ordered_discard && dpolicy->ordered)
+			return __issue_discard_cmd_orderly(sbi, dpolicy);
+
+		pend_list = &dcc->pend_list[i];
+
+		mutex_lock(&dcc->cmd_lock);
+		if (list_empty(pend_list))
+			goto next;
+		if (unlikely(dcc->rbtree_check))
+			f2fs_bug_on(sbi, !f2fs_check_rb_tree_consistence(sbi,
+							&dcc->root, false));
+		blk_start_plug(&plug);
+		list_for_each_entry_safe(dc, tmp, pend_list, list) {
+			f2fs_bug_on(sbi, dc->state != D_PREP);
+
+			if (dpolicy->timeout &&
+				f2fs_time_over(sbi, UMOUNT_DISCARD_TIMEOUT))
+				break;
+
+			if (dpolicy->io_aware && i < dpolicy->io_aware_gran &&
+						!is_idle(sbi, DISCARD_TIME)) {
+				io_interrupted = true;
+				break;
+			}
+
+			__submit_discard_cmd(sbi, dpolicy, dc, &issued);
+
+			if (issued >= dpolicy->max_requests)
+				break;
+		}
+		blk_finish_plug(&plug);
+next:
+		mutex_unlock(&dcc->cmd_lock);
+
+		if (issued >= dpolicy->max_requests || io_interrupted)
+			break;
+	}
+
+	if (dpolicy->type == DPOLICY_UMOUNT && issued) {
+		__wait_all_discard_cmd(sbi, dpolicy);
+		goto retry;
+	}
+
+	if (!issued && io_interrupted)
+		issued = -1;
+
+	return issued;
+}
+
+static bool __drop_discard_cmd(struct f2fs_sb_info *sbi)
+{
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+	struct list_head *pend_list;
+	struct discard_cmd *dc, *tmp;
+	int i;
+	bool dropped = false;
+
+	mutex_lock(&dcc->cmd_lock);
+	for (i = MAX_PLIST_NUM - 1; i >= 0; i--) {
+		pend_list = &dcc->pend_list[i];
+		list_for_each_entry_safe(dc, tmp, pend_list, list) {
+			f2fs_bug_on(sbi, dc->state != D_PREP);
+			__remove_discard_cmd(sbi, dc);
+			dropped = true;
+		}
+	}
+	mutex_unlock(&dcc->cmd_lock);
+
+	return dropped;
+}
+
+void f2fs_drop_discard_cmd(struct f2fs_sb_info *sbi)
+{
+	__drop_discard_cmd(sbi);
+}
+
+static unsigned int __wait_one_discard_bio(struct f2fs_sb_info *sbi,
+							struct discard_cmd *dc)
+{
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+	unsigned int len = 0;
+
+	wait_for_completion_io(&dc->wait);
+	mutex_lock(&dcc->cmd_lock);
+	f2fs_bug_on(sbi, dc->state != D_DONE);
+	dc->ref--;
+	if (!dc->ref) {
+		if (!dc->error)
+			len = dc->len;
+		__remove_discard_cmd(sbi, dc);
+	}
+	mutex_unlock(&dcc->cmd_lock);
+
+	return len;
+}
+
+static unsigned int __wait_discard_cmd_range(struct f2fs_sb_info *sbi,
+						struct discard_policy *dpolicy,
+						block_t start, block_t end)
+{
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+	struct list_head *wait_list = (dpolicy->type == DPOLICY_FSTRIM) ?
+					&(dcc->fstrim_list) : &(dcc->wait_list);
+	struct discard_cmd *dc = NULL, *iter, *tmp;
+	unsigned int trimmed = 0;
+
+next:
+	dc = NULL;
+
+	mutex_lock(&dcc->cmd_lock);
+	list_for_each_entry_safe(iter, tmp, wait_list, list) {
+		if (iter->lstart + iter->len <= start || end <= iter->lstart)
+			continue;
+		if (iter->len < dpolicy->granularity)
+			continue;
+		if (iter->state == D_DONE && !iter->ref) {
+			wait_for_completion_io(&iter->wait);
+			if (!iter->error)
+				trimmed += iter->len;
+			__remove_discard_cmd(sbi, iter);
+		} else {
+			iter->ref++;
+			dc = iter;
+			break;
+		}
+	}
+	mutex_unlock(&dcc->cmd_lock);
+
+	if (dc) {
+		trimmed += __wait_one_discard_bio(sbi, dc);
+		goto next;
+	}
+
+	return trimmed;
+}
+
+static unsigned int __wait_all_discard_cmd(struct f2fs_sb_info *sbi,
+						struct discard_policy *dpolicy)
+{
+	struct discard_policy dp;
+	unsigned int discard_blks;
+
+	if (dpolicy)
+		return __wait_discard_cmd_range(sbi, dpolicy, 0, UINT_MAX);
+
+	/* wait all */
+	__init_discard_policy(sbi, &dp, DPOLICY_FSTRIM, 1);
+	discard_blks = __wait_discard_cmd_range(sbi, &dp, 0, UINT_MAX);
+	__init_discard_policy(sbi, &dp, DPOLICY_UMOUNT, 1);
+	discard_blks += __wait_discard_cmd_range(sbi, &dp, 0, UINT_MAX);
+
+	return discard_blks;
+}
+
+/* This should be covered by global mutex, &sit_i->sentry_lock */
+void f2fs_wait_discard_bio(struct f2fs_sb_info *sbi, block_t blkaddr)
+{
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+	struct discard_cmd *dc;
+	bool need_wait = false;
+
+	mutex_lock(&dcc->cmd_lock);
+	dc = (struct discard_cmd *)f2fs_lookup_rb_tree(&dcc->root,
+							NULL, blkaddr);
+	if (dc) {
+		if (dc->state == D_PREP) {
+			__punch_discard_cmd(sbi, dc, blkaddr);
+		} else {
+			dc->ref++;
+			need_wait = true;
+		}
+	}
+	mutex_unlock(&dcc->cmd_lock);
+
+	if (need_wait)
+		__wait_one_discard_bio(sbi, dc);
+}
+
+void f2fs_stop_discard_thread(struct f2fs_sb_info *sbi)
+{
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+
+	if (dcc && dcc->f2fs_issue_discard) {
+		struct task_struct *discard_thread = dcc->f2fs_issue_discard;
+
+		dcc->f2fs_issue_discard = NULL;
+		kthread_stop(discard_thread);
+	}
+}
+
+/* This comes from f2fs_put_super */
+bool f2fs_issue_discard_timeout(struct f2fs_sb_info *sbi)
+{
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+	struct discard_policy dpolicy;
+	bool dropped;
+
+	if (!atomic_read(&dcc->discard_cmd_cnt))
+		return false;
+
+	__init_discard_policy(sbi, &dpolicy, DPOLICY_UMOUNT,
+					dcc->discard_granularity);
+	__issue_discard_cmd(sbi, &dpolicy);
+	dropped = __drop_discard_cmd(sbi);
+
+	/* just to make sure there is no pending discard commands */
+	__wait_all_discard_cmd(sbi, NULL);
+
+	f2fs_bug_on(sbi, atomic_read(&dcc->discard_cmd_cnt));
+	return dropped;
+}
+
+static int issue_discard_thread(void *data)
+{
+	struct f2fs_sb_info *sbi = data;
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+	wait_queue_head_t *q = &dcc->discard_wait_queue;
+	struct discard_policy dpolicy;
+	unsigned int wait_ms = dcc->min_discard_issue_time;
+	int issued;
+
+	set_freezable();
+
+	do {
+		wait_event_interruptible_timeout(*q,
+				kthread_should_stop() || freezing(current) ||
+				dcc->discard_wake,
+				msecs_to_jiffies(wait_ms));
+
+		if (sbi->gc_mode == GC_URGENT_HIGH ||
+			!f2fs_available_free_memory(sbi, DISCARD_CACHE))
+			__init_discard_policy(sbi, &dpolicy, DPOLICY_FORCE, 1);
+		else
+			__init_discard_policy(sbi, &dpolicy, DPOLICY_BG,
+						dcc->discard_granularity);
+
+		if (dcc->discard_wake)
+			dcc->discard_wake = 0;
+
+		/* clean up pending candidates before going to sleep */
+		if (atomic_read(&dcc->queued_discard))
+			__wait_all_discard_cmd(sbi, NULL);
+
+		if (try_to_freeze())
+			continue;
+		if (f2fs_readonly(sbi->sb))
+			continue;
+		if (kthread_should_stop())
+			return 0;
+		if (is_sbi_flag_set(sbi, SBI_NEED_FSCK) ||
+			!atomic_read(&dcc->discard_cmd_cnt)) {
+			wait_ms = dpolicy.max_interval;
+			continue;
+		}
+
+		sb_start_intwrite(sbi->sb);
+
+		issued = __issue_discard_cmd(sbi, &dpolicy);
+		if (issued > 0) {
+			__wait_all_discard_cmd(sbi, &dpolicy);
+			wait_ms = dpolicy.min_interval;
+		} else if (issued == -1) {
+			wait_ms = f2fs_time_to_wait(sbi, DISCARD_TIME);
+			if (!wait_ms)
+				wait_ms = dpolicy.mid_interval;
+		} else {
+			wait_ms = dpolicy.max_interval;
+		}
+		if (!atomic_read(&dcc->discard_cmd_cnt))
+			wait_ms = dpolicy.max_interval;
+
+		sb_end_intwrite(sbi->sb);
+
+	} while (!kthread_should_stop());
+	return 0;
+}
+
+int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
+					struct block_device *bdev, block_t blkstart, block_t blklen)
+{
+#ifdef CONFIG_BLK_DEV_ZONED
+	sector_t sector, nr_sects;
+	block_t lblkstart = blkstart;
+	int devi = 0;
+
+	if (f2fs_is_multi_device(sbi)) {
+		devi = f2fs_target_device_index(sbi, blkstart);
+		if (blkstart < FDEV(devi).start_blk ||
+		    blkstart > FDEV(devi).end_blk) {
+			f2fs_err(sbi, "Invalid block %x", blkstart);
+			return -EIO;
+		}
+		blkstart -= FDEV(devi).start_blk;
+	}
+
+	/* For sequential zones, reset the zone write pointer */
+	if (f2fs_blkz_is_seq(sbi, devi, blkstart)) {
+		sector = SECTOR_FROM_BLOCK(blkstart);
+		nr_sects = SECTOR_FROM_BLOCK(blklen);
+
+		if (sector & (bdev_zone_sectors(bdev) - 1) ||
+				nr_sects != bdev_zone_sectors(bdev)) {
+			f2fs_err(sbi, "(%d) %s: Unaligned zone reset attempted (block %x + %x)",
+				 devi, sbi->s_ndevs ? FDEV(devi).path : "",
+				 blkstart, blklen);
+			return -EIO;
+		}
+		trace_f2fs_issue_reset_zone(bdev, blkstart);
+		return blkdev_zone_mgmt(bdev, REQ_OP_ZONE_RESET,
+					sector, nr_sects, GFP_NOFS);
+	}
+
+	/* For conventional zones, use regular discard if supported */
+	__queue_discard_cmd(sbi, bdev, lblkstart, blklen);
+#endif
+	return 0;
+}
+
+static int __issue_discard_async(struct f2fs_sb_info *sbi,
+		struct block_device *bdev, block_t blkstart, block_t blklen)
+{
+#ifdef CONFIG_BLK_DEV_ZONED
+	if (f2fs_sb_has_blkzoned(sbi) && bdev_is_zoned(bdev))
+		return __f2fs_issue_discard_zone(sbi, bdev, blkstart, blklen);
+#endif
+	__queue_discard_cmd(sbi, bdev, blkstart, blklen);
+	return 0;
+}
+
+int f2fs_issue_discard(struct f2fs_sb_info *sbi,
+						block_t blkstart, block_t blklen)
+{
+	sector_t start = blkstart, len = 0;
+	struct block_device *bdev;
+	struct seg_entry *se;
+	unsigned int offset;
+	block_t i;
+	int err = 0;
+
+	bdev = f2fs_target_device(sbi, blkstart, NULL);
+
+	for (i = blkstart; i < blkstart + blklen; i++, len++) {
+		if (i != start) {
+			struct block_device *bdev2 =
+				f2fs_target_device(sbi, i, NULL);
+
+			if (bdev2 != bdev) {
+				err = __issue_discard_async(sbi, bdev,
+						start, len);
+				if (err)
+					return err;
+				bdev = bdev2;
+				start = i;
+				len = 0;
+			}
+		}
+
+		se = get_seg_entry(sbi, GET_SEGNO(sbi, i));
+		offset = GET_BLKOFF_FROM_SEG0(sbi, i);
+
+		if (f2fs_block_unit_discard(sbi) &&
+				!f2fs_test_and_set_bit(offset, se->discard_map))
+			sbi->discard_blks--;
+	}
+
+	if (len)
+		err = __issue_discard_async(sbi, bdev, start, len);
+	return err;
+}
+
+bool add_discard_addrs(struct f2fs_sb_info *sbi, struct cp_control *cpc,
+						bool check_only)
+{
+	int entries = SIT_VBLOCK_MAP_SIZE / sizeof(unsigned long);
+	int max_blocks = sbi->blocks_per_seg;
+	struct seg_entry *se = get_seg_entry(sbi, cpc->trim_start);
+	unsigned long *cur_map = (unsigned long *)se->cur_valid_map;
+	unsigned long *ckpt_map = (unsigned long *)se->ckpt_valid_map;
+	unsigned long *discard_map = (unsigned long *)se->discard_map;
+	unsigned long *dmap = SIT_I(sbi)->tmp_map;
+	unsigned int start = 0, end = -1;
+	bool force = (cpc->reason & CP_DISCARD);
+	struct discard_entry *de = NULL;
+	struct list_head *head = &SM_I(sbi)->dcc_info->entry_list;
+	int i;
+
+	if (se->valid_blocks == max_blocks || !f2fs_hw_support_discard(sbi) ||
+			!f2fs_block_unit_discard(sbi))
+		return false;
+
+	if (!force) {
+		if (!f2fs_realtime_discard_enable(sbi) || !se->valid_blocks ||
+			SM_I(sbi)->dcc_info->nr_discards >=
+				SM_I(sbi)->dcc_info->max_discards)
+			return false;
+	}
+
+	/* SIT_VBLOCK_MAP_SIZE should be multiple of sizeof(unsigned long) */
+	for (i = 0; i < entries; i++)
+		dmap[i] = force ? ~ckpt_map[i] & ~discard_map[i] :
+				(cur_map[i] ^ ckpt_map[i]) & ckpt_map[i];
+
+	while (force || SM_I(sbi)->dcc_info->nr_discards <=
+				SM_I(sbi)->dcc_info->max_discards) {
+		start = __find_rev_next_bit(dmap, max_blocks, end + 1);
+		if (start >= max_blocks)
+			break;
+
+		end = __find_rev_next_zero_bit(dmap, max_blocks, start + 1);
+		if (force && start && end != max_blocks
+					&& (end - start) < cpc->trim_minlen)
+			continue;
+
+		if (check_only)
+			return true;
+
+		if (!de) {
+			de = f2fs_kmem_cache_alloc(discard_entry_slab,
+						GFP_F2FS_ZERO, true, NULL);
+			de->start_blkaddr = START_BLOCK(sbi, cpc->trim_start);
+			list_add_tail(&de->list, head);
+		}
+
+		for (i = start; i < end; i++)
+			__set_bit_le(i, (void *)de->discard_map);
+
+		SM_I(sbi)->dcc_info->nr_discards += end - start;
+	}
+	return false;
+}
+
+void release_discard_addr(struct discard_entry *entry)
+{
+	list_del(&entry->list);
+	kmem_cache_free(discard_entry_slab, entry);
+}
+
+void f2fs_release_discard_addrs(struct f2fs_sb_info *sbi)
+{
+	struct list_head *head = &(SM_I(sbi)->dcc_info->entry_list);
+	struct discard_entry *entry, *this;
+
+	/* drop caches */
+	list_for_each_entry_safe(entry, this, head, list)
+		release_discard_addr(entry);
+}
+
+int f2fs_start_discard_thread(struct f2fs_sb_info *sbi)
+{
+	dev_t dev = sbi->sb->s_bdev->bd_dev;
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+	int err = 0;
+
+	if (!f2fs_realtime_discard_enable(sbi))
+		return 0;
+
+	dcc->f2fs_issue_discard = kthread_run(issue_discard_thread, sbi,
+				"f2fs_discard-%u:%u", MAJOR(dev), MINOR(dev));
+	if (IS_ERR(dcc->f2fs_issue_discard)) {
+		err = PTR_ERR(dcc->f2fs_issue_discard);
+		dcc->f2fs_issue_discard = NULL;
+	}
+
+	return err;
+}
+
+int create_discard_cmd_control(struct f2fs_sb_info *sbi)
+{
+	struct discard_cmd_control *dcc;
+	int err = 0, i;
+
+	if (SM_I(sbi)->dcc_info) {
+		dcc = SM_I(sbi)->dcc_info;
+		goto init_thread;
+	}
+
+	dcc = f2fs_kzalloc(sbi, sizeof(struct discard_cmd_control), GFP_KERNEL);
+	if (!dcc)
+		return -ENOMEM;
+
+	dcc->discard_granularity = DEFAULT_DISCARD_GRANULARITY;
+	dcc->max_ordered_discard = DEFAULT_MAX_ORDERED_DISCARD_GRANULARITY;
+	if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SEGMENT)
+		dcc->discard_granularity = sbi->blocks_per_seg;
+	else if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SECTION)
+		dcc->discard_granularity = BLKS_PER_SEC(sbi);
+
+	INIT_LIST_HEAD(&dcc->entry_list);
+	for (i = 0; i < MAX_PLIST_NUM; i++)
+		INIT_LIST_HEAD(&dcc->pend_list[i]);
+	INIT_LIST_HEAD(&dcc->wait_list);
+	INIT_LIST_HEAD(&dcc->fstrim_list);
+	mutex_init(&dcc->cmd_lock);
+	atomic_set(&dcc->issued_discard, 0);
+	atomic_set(&dcc->queued_discard, 0);
+	atomic_set(&dcc->discard_cmd_cnt, 0);
+	dcc->nr_discards = 0;
+	dcc->max_discards = MAIN_SEGS(sbi) << sbi->log_blocks_per_seg;
+	dcc->max_discard_request = DEF_MAX_DISCARD_REQUEST;
+	dcc->min_discard_issue_time = DEF_MIN_DISCARD_ISSUE_TIME;
+	dcc->mid_discard_issue_time = DEF_MID_DISCARD_ISSUE_TIME;
+	dcc->max_discard_issue_time = DEF_MAX_DISCARD_ISSUE_TIME;
+	dcc->discard_urgent_util = DEF_DISCARD_URGENT_UTIL;
+	dcc->undiscard_blks = 0;
+	dcc->next_pos = 0;
+	dcc->root = RB_ROOT_CACHED;
+	dcc->rbtree_check = false;
+
+	init_waitqueue_head(&dcc->discard_wait_queue);
+	SM_I(sbi)->dcc_info = dcc;
+init_thread:
+	err = f2fs_start_discard_thread(sbi);
+	if (err) {
+		kfree(dcc);
+		SM_I(sbi)->dcc_info = NULL;
+	}
+
+	return err;
+}
+
+void destroy_discard_cmd_control(struct f2fs_sb_info *sbi)
+{
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+
+	if (!dcc)
+		return;
+
+	f2fs_stop_discard_thread(sbi);
+
+	/*
+	 * Recovery can cache discard commands, so in error path of
+	 * fill_super(), it needs to give a chance to handle them.
+	 */
+	f2fs_issue_discard_timeout(sbi);
+
+	kfree(dcc);
+	SM_I(sbi)->dcc_info = NULL;
+}
+
+bool f2fs_exist_trim_candidates(struct f2fs_sb_info *sbi,
+						struct cp_control *cpc)
+{
+	__u64 trim_start = cpc->trim_start;
+	bool has_candidate = false;
+
+	down_write(&SIT_I(sbi)->sentry_lock);
+	for (; cpc->trim_start <= cpc->trim_end; cpc->trim_start++) {
+		if (add_discard_addrs(sbi, cpc, true)) {
+			has_candidate = true;
+			break;
+		}
+	}
+	up_write(&SIT_I(sbi)->sentry_lock);
+
+	cpc->trim_start = trim_start;
+	return has_candidate;
+}
+
+static unsigned int __issue_discard_cmd_range(struct f2fs_sb_info *sbi,
+					struct discard_policy *dpolicy,
+					unsigned int start, unsigned int end)
+{
+	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
+	struct discard_cmd *prev_dc = NULL, *next_dc = NULL;
+	struct rb_node **insert_p = NULL, *insert_parent = NULL;
+	struct discard_cmd *dc;
+	struct blk_plug plug;
+	int issued;
+	unsigned int trimmed = 0;
+
+next:
+	issued = 0;
+
+	mutex_lock(&dcc->cmd_lock);
+	if (unlikely(dcc->rbtree_check))
+		f2fs_bug_on(sbi, !f2fs_check_rb_tree_consistence(sbi,
+							&dcc->root, false));
+
+	dc = (struct discard_cmd *)f2fs_lookup_rb_tree_ret(&dcc->root,
+					NULL, start,
+					(struct rb_entry **)&prev_dc,
+					(struct rb_entry **)&next_dc,
+					&insert_p, &insert_parent, true, NULL);
+	if (!dc)
+		dc = next_dc;
+
+	blk_start_plug(&plug);
+
+	while (dc && dc->lstart <= end) {
+		struct rb_node *node;
+		int err = 0;
+
+		if (dc->len < dpolicy->granularity)
+			goto skip;
+
+		if (dc->state != D_PREP) {
+			list_move_tail(&dc->list, &dcc->fstrim_list);
+			goto skip;
+		}
+
+		err = __submit_discard_cmd(sbi, dpolicy, dc, &issued);
+
+		if (issued >= dpolicy->max_requests) {
+			start = dc->lstart + dc->len;
+
+			if (err)
+				__remove_discard_cmd(sbi, dc);
+
+			blk_finish_plug(&plug);
+			mutex_unlock(&dcc->cmd_lock);
+			trimmed += __wait_all_discard_cmd(sbi, NULL);
+			f2fs_io_schedule_timeout(DEFAULT_IO_TIMEOUT);
+			goto next;
+		}
+skip:
+		node = rb_next(&dc->rb_node);
+		if (err)
+			__remove_discard_cmd(sbi, dc);
+		dc = rb_entry_safe(node, struct discard_cmd, rb_node);
+
+		if (fatal_signal_pending(current))
+			break;
+	}
+
+	blk_finish_plug(&plug);
+	mutex_unlock(&dcc->cmd_lock);
+
+	return trimmed;
+}
+
+int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range)
+{
+	__u64 start = F2FS_BYTES_TO_BLK(range->start);
+	__u64 end = start + F2FS_BYTES_TO_BLK(range->len) - 1;
+	unsigned int start_segno, end_segno;
+	block_t start_block, end_block;
+	struct cp_control cpc;
+	struct discard_policy dpolicy;
+	unsigned long long trimmed = 0;
+	int err = 0;
+	bool need_align = f2fs_lfs_mode(sbi) && __is_large_section(sbi);
+
+	if (start >= MAX_BLKADDR(sbi) || range->len < sbi->blocksize)
+		return -EINVAL;
+
+	if (end < MAIN_BLKADDR(sbi))
+		goto out;
+
+	if (is_sbi_flag_set(sbi, SBI_NEED_FSCK)) {
+		f2fs_warn(sbi, "Found FS corruption, run fsck to fix.");
+		return -EFSCORRUPTED;
+	}
+
+	/* start/end segment number in main_area */
+	start_segno = (start <= MAIN_BLKADDR(sbi)) ? 0 : GET_SEGNO(sbi, start);
+	end_segno = (end >= MAX_BLKADDR(sbi)) ? MAIN_SEGS(sbi) - 1 :
+						GET_SEGNO(sbi, end);
+	if (need_align) {
+		start_segno = rounddown(start_segno, sbi->segs_per_sec);
+		end_segno = roundup(end_segno + 1, sbi->segs_per_sec) - 1;
+	}
+
+	cpc.reason = CP_DISCARD;
+	cpc.trim_minlen = max_t(__u64, 1, F2FS_BYTES_TO_BLK(range->minlen));
+	cpc.trim_start = start_segno;
+	cpc.trim_end = end_segno;
+
+	if (sbi->discard_blks == 0)
+		goto out;
+
+	f2fs_down_write(&sbi->gc_lock);
+	err = f2fs_write_checkpoint(sbi, &cpc);
+	f2fs_up_write(&sbi->gc_lock);
+	if (err)
+		goto out;
+
+	/*
+	 * We filed discard candidates, but actually we don't need to wait for
+	 * all of them, since they'll be issued in idle time along with runtime
+	 * discard option. User configuration looks like using runtime discard
+	 * or periodic fstrim instead of it.
+	 */
+	if (f2fs_realtime_discard_enable(sbi))
+		goto out;
+
+	start_block = START_BLOCK(sbi, start_segno);
+	end_block = START_BLOCK(sbi, end_segno + 1);
+
+	__init_discard_policy(sbi, &dpolicy, DPOLICY_FSTRIM, cpc.trim_minlen);
+	trimmed = __issue_discard_cmd_range(sbi, &dpolicy,
+					start_block, end_block);
+
+	trimmed += __wait_discard_cmd_range(sbi, &dpolicy,
+					start_block, end_block);
+out:
+	if (!err)
+		range->len = F2FS_BLK_TO_BYTES(trimmed);
+	return err;
+}
+
+int __init f2fs_create_discard_caches(void)
+{
+	discard_entry_slab = f2fs_kmem_cache_create("f2fs_discard_entry",
+			sizeof(struct discard_entry));
+	if (!discard_entry_slab)
+		return -ENOMEM;
+
+	discard_cmd_slab = f2fs_kmem_cache_create("f2fs_discard_cmd",
+		sizeof(struct discard_cmd));
+	if (!discard_cmd_slab)
+		goto destroy_discard_entry;
+	return 0;
+
+destroy_discard_entry:
+	kmem_cache_destroy(discard_entry_slab);
+	return -ENOMEM;
+}
+
+void f2fs_destroy_discard_caches(void)
+{
+	kmem_cache_destroy(discard_cmd_slab);
+	kmem_cache_destroy(discard_entry_slab);
+}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 4035dab1f570..1df9dd9bb400 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3638,9 +3638,38 @@ void f2fs_destroy_node_manager(struct f2fs_sb_info *sbi);
 int __init f2fs_create_node_manager_caches(void);
 void f2fs_destroy_node_manager_caches(void);
 
+/*
+ * discard.c
+ */
+int f2fs_issue_discard(struct f2fs_sb_info *sbi,
+					block_t blkstart, block_t blklen);
+bool f2fs_issue_discard_timeout(struct f2fs_sb_info *sbi);
+void f2fs_drop_discard_cmd(struct f2fs_sb_info *sbi);
+int create_discard_cmd_control(struct f2fs_sb_info *sbi);
+void destroy_discard_cmd_control(struct f2fs_sb_info *sbi);
+int f2fs_start_discard_thread(struct f2fs_sb_info *sbi);
+void f2fs_stop_discard_thread(struct f2fs_sb_info *sbi);
+int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range);
+bool f2fs_exist_trim_candidates(struct f2fs_sb_info *sbi,
+					struct cp_control *cpc);
+void f2fs_wait_discard_bio(struct f2fs_sb_info *sbi, block_t blkaddr);
+bool add_discard_addrs(struct f2fs_sb_info *sbi, struct cp_control *cpc,
+					bool check_only);
+void release_discard_addr(struct discard_entry *entry);
+void f2fs_release_discard_addrs(struct f2fs_sb_info *sbi);
+int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
+			struct block_device *bdev, block_t blkstart, block_t blklen);
+int __init f2fs_create_discard_caches(void);
+void f2fs_destroy_discard_caches(void);
+
 /*
  * segment.c
  */
+void __check_sit_bitmap(struct f2fs_sb_info *sbi, block_t start, block_t end);
+unsigned long __find_rev_next_bit(const unsigned long *addr,
+			unsigned long size, unsigned long offset);
+unsigned long __find_rev_next_zero_bit(const unsigned long *addr,
+			unsigned long size, unsigned long offset);
 bool f2fs_need_SSR(struct f2fs_sb_info *sbi);
 int f2fs_commit_atomic_write(struct inode *inode);
 void f2fs_abort_atomic_write(struct inode *inode, bool clean);
@@ -3652,16 +3681,11 @@ int f2fs_flush_device_cache(struct f2fs_sb_info *sbi);
 void f2fs_destroy_flush_cmd_control(struct f2fs_sb_info *sbi, bool free);
 void f2fs_invalidate_blocks(struct f2fs_sb_info *sbi, block_t addr);
 bool f2fs_is_checkpointed_data(struct f2fs_sb_info *sbi, block_t blkaddr);
-int f2fs_start_discard_thread(struct f2fs_sb_info *sbi);
-void f2fs_drop_discard_cmd(struct f2fs_sb_info *sbi);
-void f2fs_stop_discard_thread(struct f2fs_sb_info *sbi);
-bool f2fs_issue_discard_timeout(struct f2fs_sb_info *sbi);
 void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 					struct cp_control *cpc);
 void f2fs_dirty_to_prefree(struct f2fs_sb_info *sbi);
 block_t f2fs_get_unusable_blocks(struct f2fs_sb_info *sbi);
 int f2fs_disable_cp_again(struct f2fs_sb_info *sbi, block_t unusable);
-void f2fs_release_discard_addrs(struct f2fs_sb_info *sbi);
 int f2fs_npages_for_summary_flush(struct f2fs_sb_info *sbi, bool for_ra);
 bool f2fs_segment_has_free_slot(struct f2fs_sb_info *sbi, int segno);
 void f2fs_init_inmem_curseg(struct f2fs_sb_info *sbi);
@@ -3673,9 +3697,6 @@ void f2fs_allocate_segment_for_resize(struct f2fs_sb_info *sbi, int type,
 					unsigned int start, unsigned int end);
 void f2fs_allocate_new_section(struct f2fs_sb_info *sbi, int type, bool force);
 void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi);
-int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range);
-bool f2fs_exist_trim_candidates(struct f2fs_sb_info *sbi,
-					struct cp_control *cpc);
 struct page *f2fs_get_sum_page(struct f2fs_sb_info *sbi, unsigned int segno);
 void f2fs_update_meta_page(struct f2fs_sb_info *sbi, void *src,
 					block_t blk_addr);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 25ddea478fc1..b1b4d8e21365 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -27,8 +27,6 @@
 
 #define __reverse_ffz(x) __reverse_ffs(~(x))
 
-static struct kmem_cache *discard_entry_slab;
-static struct kmem_cache *discard_cmd_slab;
 static struct kmem_cache *sit_entry_set_slab;
 static struct kmem_cache *revoke_entry_slab;
 
@@ -95,8 +93,8 @@ static inline unsigned long __reverse_ffs(unsigned long word)
  *   f2fs_set_bit(0, bitmap) => 1000 0000
  *   f2fs_set_bit(7, bitmap) => 0000 0001
  */
-static unsigned long __find_rev_next_bit(const unsigned long *addr,
-			unsigned long size, unsigned long offset)
+unsigned long __find_rev_next_bit(const unsigned long *addr,
+				unsigned long size, unsigned long offset)
 {
 	const unsigned long *p = addr + BIT_WORD(offset);
 	unsigned long result = size;
@@ -131,8 +129,8 @@ static unsigned long __find_rev_next_bit(const unsigned long *addr,
 	return result - size + __reverse_ffs(tmp);
 }
 
-static unsigned long __find_rev_next_zero_bit(const unsigned long *addr,
-			unsigned long size, unsigned long offset)
+unsigned long __find_rev_next_zero_bit(const unsigned long *addr,
+					unsigned long size, unsigned long offset)
 {
 	const unsigned long *p = addr + BIT_WORD(offset);
 	unsigned long result = size;
@@ -911,117 +909,7 @@ static unsigned int get_free_segment(struct f2fs_sb_info *sbi)
 	return NULL_SEGNO;
 }
 
-static struct discard_cmd *__create_discard_cmd(struct f2fs_sb_info *sbi,
-		struct block_device *bdev, block_t lstart,
-		block_t start, block_t len)
-{
-	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
-	struct list_head *pend_list;
-	struct discard_cmd *dc;
-
-	f2fs_bug_on(sbi, !len);
-
-	pend_list = &dcc->pend_list[plist_idx(len)];
-
-	dc = f2fs_kmem_cache_alloc(discard_cmd_slab, GFP_NOFS, true, NULL);
-	INIT_LIST_HEAD(&dc->list);
-	dc->bdev = bdev;
-	dc->lstart = lstart;
-	dc->start = start;
-	dc->len = len;
-	dc->ref = 0;
-	dc->state = D_PREP;
-	dc->queued = 0;
-	dc->error = 0;
-	init_completion(&dc->wait);
-	list_add_tail(&dc->list, pend_list);
-	spin_lock_init(&dc->lock);
-	dc->bio_ref = 0;
-	atomic_inc(&dcc->discard_cmd_cnt);
-	dcc->undiscard_blks += len;
-
-	return dc;
-}
-
-static struct discard_cmd *__attach_discard_cmd(struct f2fs_sb_info *sbi,
-				struct block_device *bdev, block_t lstart,
-				block_t start, block_t len,
-				struct rb_node *parent, struct rb_node **p,
-				bool leftmost)
-{
-	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
-	struct discard_cmd *dc;
-
-	dc = __create_discard_cmd(sbi, bdev, lstart, start, len);
-
-	rb_link_node(&dc->rb_node, parent, p);
-	rb_insert_color_cached(&dc->rb_node, &dcc->root, leftmost);
-
-	return dc;
-}
-
-static void __detach_discard_cmd(struct discard_cmd_control *dcc,
-							struct discard_cmd *dc)
-{
-	if (dc->state == D_DONE)
-		atomic_sub(dc->queued, &dcc->queued_discard);
-
-	list_del(&dc->list);
-	rb_erase_cached(&dc->rb_node, &dcc->root);
-	dcc->undiscard_blks -= dc->len;
-
-	kmem_cache_free(discard_cmd_slab, dc);
-
-	atomic_dec(&dcc->discard_cmd_cnt);
-}
-
-static void __remove_discard_cmd(struct f2fs_sb_info *sbi,
-							struct discard_cmd *dc)
-{
-	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
-	unsigned long flags;
-
-	trace_f2fs_remove_discard(dc->bdev, dc->start, dc->len);
-
-	spin_lock_irqsave(&dc->lock, flags);
-	if (dc->bio_ref) {
-		spin_unlock_irqrestore(&dc->lock, flags);
-		return;
-	}
-	spin_unlock_irqrestore(&dc->lock, flags);
-
-	f2fs_bug_on(sbi, dc->ref);
-
-	if (dc->error == -EOPNOTSUPP)
-		dc->error = 0;
-
-	if (dc->error)
-		printk_ratelimited(
-			"%sF2FS-fs (%s): Issue discard(%u, %u, %u) failed, ret: %d",
-			KERN_INFO, sbi->sb->s_id,
-			dc->lstart, dc->start, dc->len, dc->error);
-	__detach_discard_cmd(dcc, dc);
-}
-
-static void f2fs_submit_discard_endio(struct bio *bio)
-{
-	struct discard_cmd *dc = (struct discard_cmd *)bio->bi_private;
-	unsigned long flags;
-
-	spin_lock_irqsave(&dc->lock, flags);
-	if (!dc->error)
-		dc->error = blk_status_to_errno(bio->bi_status);
-	dc->bio_ref--;
-	if (!dc->bio_ref && dc->state == D_SUBMIT) {
-		dc->state = D_DONE;
-		complete_all(&dc->wait);
-	}
-	spin_unlock_irqrestore(&dc->lock, flags);
-	bio_put(bio);
-}
-
-static void __check_sit_bitmap(struct f2fs_sb_info *sbi,
-				block_t start, block_t end)
+void __check_sit_bitmap(struct f2fs_sb_info *sbi, block_t start, block_t end)
 {
 #ifdef CONFIG_F2FS_CHECK_FS
 	struct seg_entry *sentry;
@@ -1047,870 +935,6 @@ static void __check_sit_bitmap(struct f2fs_sb_info *sbi,
 #endif
 }
 
-static void __init_discard_policy(struct f2fs_sb_info *sbi,
-				struct discard_policy *dpolicy,
-				int discard_type, unsigned int granularity)
-{
-	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
-
-	/* common policy */
-	dpolicy->type = discard_type;
-	dpolicy->sync = true;
-	dpolicy->ordered = false;
-	dpolicy->granularity = granularity;
-
-	dpolicy->max_requests = dcc->max_discard_request;
-	dpolicy->io_aware_gran = MAX_PLIST_NUM;
-	dpolicy->timeout = false;
-
-	if (discard_type == DPOLICY_BG) {
-		dpolicy->min_interval = dcc->min_discard_issue_time;
-		dpolicy->mid_interval = dcc->mid_discard_issue_time;
-		dpolicy->max_interval = dcc->max_discard_issue_time;
-		dpolicy->io_aware = true;
-		dpolicy->sync = false;
-		dpolicy->ordered = true;
-		if (utilization(sbi) > dcc->discard_urgent_util) {
-			dpolicy->granularity = MIN_DISCARD_GRANULARITY;
-			if (atomic_read(&dcc->discard_cmd_cnt))
-				dpolicy->max_interval =
-					dcc->min_discard_issue_time;
-		}
-	} else if (discard_type == DPOLICY_FORCE) {
-		dpolicy->min_interval = dcc->min_discard_issue_time;
-		dpolicy->mid_interval = dcc->mid_discard_issue_time;
-		dpolicy->max_interval = dcc->max_discard_issue_time;
-		dpolicy->io_aware = false;
-	} else if (discard_type == DPOLICY_FSTRIM) {
-		dpolicy->io_aware = false;
-	} else if (discard_type == DPOLICY_UMOUNT) {
-		dpolicy->io_aware = false;
-		/* we need to issue all to keep CP_TRIMMED_FLAG */
-		dpolicy->granularity = MIN_DISCARD_GRANULARITY;
-		dpolicy->timeout = true;
-	}
-}
-
-static void __update_discard_tree_range(struct f2fs_sb_info *sbi,
-				struct block_device *bdev, block_t lstart,
-				block_t start, block_t len);
-/* this function is copied from blkdev_issue_discard from block/blk-lib.c */
-static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
-						struct discard_policy *dpolicy,
-						struct discard_cmd *dc,
-						unsigned int *issued)
-{
-	struct block_device *bdev = dc->bdev;
-	unsigned int max_discard_blocks =
-			SECTOR_TO_BLOCK(bdev_max_discard_sectors(bdev));
-	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
-	struct list_head *wait_list = (dpolicy->type == DPOLICY_FSTRIM) ?
-					&(dcc->fstrim_list) : &(dcc->wait_list);
-	blk_opf_t flag = dpolicy->sync ? REQ_SYNC : 0;
-	block_t lstart, start, len, total_len;
-	int err = 0;
-
-	if (dc->state != D_PREP)
-		return 0;
-
-	if (is_sbi_flag_set(sbi, SBI_NEED_FSCK))
-		return 0;
-
-	trace_f2fs_issue_discard(bdev, dc->start, dc->len);
-
-	lstart = dc->lstart;
-	start = dc->start;
-	len = dc->len;
-	total_len = len;
-
-	dc->len = 0;
-
-	while (total_len && *issued < dpolicy->max_requests && !err) {
-		struct bio *bio = NULL;
-		unsigned long flags;
-		bool last = true;
-
-		if (len > max_discard_blocks) {
-			len = max_discard_blocks;
-			last = false;
-		}
-
-		(*issued)++;
-		if (*issued == dpolicy->max_requests)
-			last = true;
-
-		dc->len += len;
-
-		if (time_to_inject(sbi, FAULT_DISCARD)) {
-			f2fs_show_injection_info(sbi, FAULT_DISCARD);
-			err = -EIO;
-		} else {
-			err = __blkdev_issue_discard(bdev,
-					SECTOR_FROM_BLOCK(start),
-					SECTOR_FROM_BLOCK(len),
-					GFP_NOFS, &bio);
-		}
-		if (err) {
-			spin_lock_irqsave(&dc->lock, flags);
-			if (dc->state == D_PARTIAL)
-				dc->state = D_SUBMIT;
-			spin_unlock_irqrestore(&dc->lock, flags);
-
-			break;
-		}
-
-		f2fs_bug_on(sbi, !bio);
-
-		/*
-		 * should keep before submission to avoid D_DONE
-		 * right away
-		 */
-		spin_lock_irqsave(&dc->lock, flags);
-		if (last)
-			dc->state = D_SUBMIT;
-		else
-			dc->state = D_PARTIAL;
-		dc->bio_ref++;
-		spin_unlock_irqrestore(&dc->lock, flags);
-
-		atomic_inc(&dcc->queued_discard);
-		dc->queued++;
-		list_move_tail(&dc->list, wait_list);
-
-		/* sanity check on discard range */
-		__check_sit_bitmap(sbi, lstart, lstart + len);
-
-		bio->bi_private = dc;
-		bio->bi_end_io = f2fs_submit_discard_endio;
-		bio->bi_opf |= flag;
-		submit_bio(bio);
-
-		atomic_inc(&dcc->issued_discard);
-
-		f2fs_update_iostat(sbi, NULL, FS_DISCARD, len * F2FS_BLKSIZE);
-
-		lstart += len;
-		start += len;
-		total_len -= len;
-		len = total_len;
-	}
-
-	if (!err && len) {
-		dcc->undiscard_blks -= len;
-		__update_discard_tree_range(sbi, bdev, lstart, start, len);
-	}
-	return err;
-}
-
-static void __insert_discard_tree(struct f2fs_sb_info *sbi,
-				struct block_device *bdev, block_t lstart,
-				block_t start, block_t len,
-				struct rb_node **insert_p,
-				struct rb_node *insert_parent)
-{
-	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
-	struct rb_node **p;
-	struct rb_node *parent = NULL;
-	bool leftmost = true;
-
-	if (insert_p && insert_parent) {
-		parent = insert_parent;
-		p = insert_p;
-		goto do_insert;
-	}
-
-	p = f2fs_lookup_rb_tree_for_insert(sbi, &dcc->root, &parent,
-							lstart, &leftmost);
-do_insert:
-	__attach_discard_cmd(sbi, bdev, lstart, start, len, parent,
-								p, leftmost);
-}
-
-static void __relocate_discard_cmd(struct discard_cmd_control *dcc,
-						struct discard_cmd *dc)
-{
-	list_move_tail(&dc->list, &dcc->pend_list[plist_idx(dc->len)]);
-}
-
-static void __punch_discard_cmd(struct f2fs_sb_info *sbi,
-				struct discard_cmd *dc, block_t blkaddr)
-{
-	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
-	struct discard_info di = dc->di;
-	bool modified = false;
-
-	if (dc->state == D_DONE || dc->len == 1) {
-		__remove_discard_cmd(sbi, dc);
-		return;
-	}
-
-	dcc->undiscard_blks -= di.len;
-
-	if (blkaddr > di.lstart) {
-		dc->len = blkaddr - dc->lstart;
-		dcc->undiscard_blks += dc->len;
-		__relocate_discard_cmd(dcc, dc);
-		modified = true;
-	}
-
-	if (blkaddr < di.lstart + di.len - 1) {
-		if (modified) {
-			__insert_discard_tree(sbi, dc->bdev, blkaddr + 1,
-					di.start + blkaddr + 1 - di.lstart,
-					di.lstart + di.len - 1 - blkaddr,
-					NULL, NULL);
-		} else {
-			dc->lstart++;
-			dc->len--;
-			dc->start++;
-			dcc->undiscard_blks += dc->len;
-			__relocate_discard_cmd(dcc, dc);
-		}
-	}
-}
-
-static void __update_discard_tree_range(struct f2fs_sb_info *sbi,
-				struct block_device *bdev, block_t lstart,
-				block_t start, block_t len)
-{
-	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
-	struct discard_cmd *prev_dc = NULL, *next_dc = NULL;
-	struct discard_cmd *dc;
-	struct discard_info di = {0};
-	struct rb_node **insert_p = NULL, *insert_parent = NULL;
-	unsigned int max_discard_blocks =
-			SECTOR_TO_BLOCK(bdev_max_discard_sectors(bdev));
-	block_t end = lstart + len;
-
-	dc = (struct discard_cmd *)f2fs_lookup_rb_tree_ret(&dcc->root,
-					NULL, lstart,
-					(struct rb_entry **)&prev_dc,
-					(struct rb_entry **)&next_dc,
-					&insert_p, &insert_parent, true, NULL);
-	if (dc)
-		prev_dc = dc;
-
-	if (!prev_dc) {
-		di.lstart = lstart;
-		di.len = next_dc ? next_dc->lstart - lstart : len;
-		di.len = min(di.len, len);
-		di.start = start;
-	}
-
-	while (1) {
-		struct rb_node *node;
-		bool merged = false;
-		struct discard_cmd *tdc = NULL;
-
-		if (prev_dc) {
-			di.lstart = prev_dc->lstart + prev_dc->len;
-			if (di.lstart < lstart)
-				di.lstart = lstart;
-			if (di.lstart >= end)
-				break;
-
-			if (!next_dc || next_dc->lstart > end)
-				di.len = end - di.lstart;
-			else
-				di.len = next_dc->lstart - di.lstart;
-			di.start = start + di.lstart - lstart;
-		}
-
-		if (!di.len)
-			goto next;
-
-		if (prev_dc && prev_dc->state == D_PREP &&
-			prev_dc->bdev == bdev &&
-			__is_discard_back_mergeable(&di, &prev_dc->di,
-							max_discard_blocks)) {
-			prev_dc->di.len += di.len;
-			dcc->undiscard_blks += di.len;
-			__relocate_discard_cmd(dcc, prev_dc);
-			di = prev_dc->di;
-			tdc = prev_dc;
-			merged = true;
-		}
-
-		if (next_dc && next_dc->state == D_PREP &&
-			next_dc->bdev == bdev &&
-			__is_discard_front_mergeable(&di, &next_dc->di,
-							max_discard_blocks)) {
-			next_dc->di.lstart = di.lstart;
-			next_dc->di.len += di.len;
-			next_dc->di.start = di.start;
-			dcc->undiscard_blks += di.len;
-			__relocate_discard_cmd(dcc, next_dc);
-			if (tdc)
-				__remove_discard_cmd(sbi, tdc);
-			merged = true;
-		}
-
-		if (!merged) {
-			__insert_discard_tree(sbi, bdev, di.lstart, di.start,
-							di.len, NULL, NULL);
-		}
- next:
-		prev_dc = next_dc;
-		if (!prev_dc)
-			break;
-
-		node = rb_next(&prev_dc->rb_node);
-		next_dc = rb_entry_safe(node, struct discard_cmd, rb_node);
-	}
-}
-
-static void __queue_discard_cmd(struct f2fs_sb_info *sbi,
-		struct block_device *bdev, block_t blkstart, block_t blklen)
-{
-	block_t lblkstart = blkstart;
-
-	if (!f2fs_bdev_support_discard(bdev))
-		return;
-
-	trace_f2fs_queue_discard(bdev, blkstart, blklen);
-
-	if (f2fs_is_multi_device(sbi)) {
-		int devi = f2fs_target_device_index(sbi, blkstart);
-
-		blkstart -= FDEV(devi).start_blk;
-	}
-	mutex_lock(&SM_I(sbi)->dcc_info->cmd_lock);
-	__update_discard_tree_range(sbi, bdev, lblkstart, blkstart, blklen);
-	mutex_unlock(&SM_I(sbi)->dcc_info->cmd_lock);
-}
-
-static unsigned int __issue_discard_cmd_orderly(struct f2fs_sb_info *sbi,
-					struct discard_policy *dpolicy)
-{
-	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
-	struct discard_cmd *prev_dc = NULL, *next_dc = NULL;
-	struct rb_node **insert_p = NULL, *insert_parent = NULL;
-	struct discard_cmd *dc;
-	struct blk_plug plug;
-	unsigned int pos = dcc->next_pos;
-	unsigned int issued = 0;
-	bool io_interrupted = false;
-
-	mutex_lock(&dcc->cmd_lock);
-	dc = (struct discard_cmd *)f2fs_lookup_rb_tree_ret(&dcc->root,
-					NULL, pos,
-					(struct rb_entry **)&prev_dc,
-					(struct rb_entry **)&next_dc,
-					&insert_p, &insert_parent, true, NULL);
-	if (!dc)
-		dc = next_dc;
-
-	blk_start_plug(&plug);
-
-	while (dc) {
-		struct rb_node *node;
-		int err = 0;
-
-		if (dc->state != D_PREP)
-			goto next;
-
-		if (dpolicy->io_aware && !is_idle(sbi, DISCARD_TIME)) {
-			io_interrupted = true;
-			break;
-		}
-
-		dcc->next_pos = dc->lstart + dc->len;
-		err = __submit_discard_cmd(sbi, dpolicy, dc, &issued);
-
-		if (issued >= dpolicy->max_requests)
-			break;
-next:
-		node = rb_next(&dc->rb_node);
-		if (err)
-			__remove_discard_cmd(sbi, dc);
-		dc = rb_entry_safe(node, struct discard_cmd, rb_node);
-	}
-
-	blk_finish_plug(&plug);
-
-	if (!dc)
-		dcc->next_pos = 0;
-
-	mutex_unlock(&dcc->cmd_lock);
-
-	if (!issued && io_interrupted)
-		issued = -1;
-
-	return issued;
-}
-static unsigned int __wait_all_discard_cmd(struct f2fs_sb_info *sbi,
-					struct discard_policy *dpolicy);
-
-static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
-					struct discard_policy *dpolicy)
-{
-	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
-	struct list_head *pend_list;
-	struct discard_cmd *dc, *tmp;
-	struct blk_plug plug;
-	int i, issued;
-	bool io_interrupted = false;
-
-	if (dpolicy->timeout)
-		f2fs_update_time(sbi, UMOUNT_DISCARD_TIMEOUT);
-
-retry:
-	issued = 0;
-	for (i = MAX_PLIST_NUM - 1; i >= 0; i--) {
-		if (dpolicy->timeout &&
-				f2fs_time_over(sbi, UMOUNT_DISCARD_TIMEOUT))
-			break;
-
-		if (i + 1 < dpolicy->granularity)
-			break;
-
-		if (i + 1 < dcc->max_ordered_discard && dpolicy->ordered)
-			return __issue_discard_cmd_orderly(sbi, dpolicy);
-
-		pend_list = &dcc->pend_list[i];
-
-		mutex_lock(&dcc->cmd_lock);
-		if (list_empty(pend_list))
-			goto next;
-		if (unlikely(dcc->rbtree_check))
-			f2fs_bug_on(sbi, !f2fs_check_rb_tree_consistence(sbi,
-							&dcc->root, false));
-		blk_start_plug(&plug);
-		list_for_each_entry_safe(dc, tmp, pend_list, list) {
-			f2fs_bug_on(sbi, dc->state != D_PREP);
-
-			if (dpolicy->timeout &&
-				f2fs_time_over(sbi, UMOUNT_DISCARD_TIMEOUT))
-				break;
-
-			if (dpolicy->io_aware && i < dpolicy->io_aware_gran &&
-						!is_idle(sbi, DISCARD_TIME)) {
-				io_interrupted = true;
-				break;
-			}
-
-			__submit_discard_cmd(sbi, dpolicy, dc, &issued);
-
-			if (issued >= dpolicy->max_requests)
-				break;
-		}
-		blk_finish_plug(&plug);
-next:
-		mutex_unlock(&dcc->cmd_lock);
-
-		if (issued >= dpolicy->max_requests || io_interrupted)
-			break;
-	}
-
-	if (dpolicy->type == DPOLICY_UMOUNT && issued) {
-		__wait_all_discard_cmd(sbi, dpolicy);
-		goto retry;
-	}
-
-	if (!issued && io_interrupted)
-		issued = -1;
-
-	return issued;
-}
-
-static bool __drop_discard_cmd(struct f2fs_sb_info *sbi)
-{
-	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
-	struct list_head *pend_list;
-	struct discard_cmd *dc, *tmp;
-	int i;
-	bool dropped = false;
-
-	mutex_lock(&dcc->cmd_lock);
-	for (i = MAX_PLIST_NUM - 1; i >= 0; i--) {
-		pend_list = &dcc->pend_list[i];
-		list_for_each_entry_safe(dc, tmp, pend_list, list) {
-			f2fs_bug_on(sbi, dc->state != D_PREP);
-			__remove_discard_cmd(sbi, dc);
-			dropped = true;
-		}
-	}
-	mutex_unlock(&dcc->cmd_lock);
-
-	return dropped;
-}
-
-void f2fs_drop_discard_cmd(struct f2fs_sb_info *sbi)
-{
-	__drop_discard_cmd(sbi);
-}
-
-static unsigned int __wait_one_discard_bio(struct f2fs_sb_info *sbi,
-							struct discard_cmd *dc)
-{
-	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
-	unsigned int len = 0;
-
-	wait_for_completion_io(&dc->wait);
-	mutex_lock(&dcc->cmd_lock);
-	f2fs_bug_on(sbi, dc->state != D_DONE);
-	dc->ref--;
-	if (!dc->ref) {
-		if (!dc->error)
-			len = dc->len;
-		__remove_discard_cmd(sbi, dc);
-	}
-	mutex_unlock(&dcc->cmd_lock);
-
-	return len;
-}
-
-static unsigned int __wait_discard_cmd_range(struct f2fs_sb_info *sbi,
-						struct discard_policy *dpolicy,
-						block_t start, block_t end)
-{
-	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
-	struct list_head *wait_list = (dpolicy->type == DPOLICY_FSTRIM) ?
-					&(dcc->fstrim_list) : &(dcc->wait_list);
-	struct discard_cmd *dc = NULL, *iter, *tmp;
-	unsigned int trimmed = 0;
-
-next:
-	dc = NULL;
-
-	mutex_lock(&dcc->cmd_lock);
-	list_for_each_entry_safe(iter, tmp, wait_list, list) {
-		if (iter->lstart + iter->len <= start || end <= iter->lstart)
-			continue;
-		if (iter->len < dpolicy->granularity)
-			continue;
-		if (iter->state == D_DONE && !iter->ref) {
-			wait_for_completion_io(&iter->wait);
-			if (!iter->error)
-				trimmed += iter->len;
-			__remove_discard_cmd(sbi, iter);
-		} else {
-			iter->ref++;
-			dc = iter;
-			break;
-		}
-	}
-	mutex_unlock(&dcc->cmd_lock);
-
-	if (dc) {
-		trimmed += __wait_one_discard_bio(sbi, dc);
-		goto next;
-	}
-
-	return trimmed;
-}
-
-static unsigned int __wait_all_discard_cmd(struct f2fs_sb_info *sbi,
-						struct discard_policy *dpolicy)
-{
-	struct discard_policy dp;
-	unsigned int discard_blks;
-
-	if (dpolicy)
-		return __wait_discard_cmd_range(sbi, dpolicy, 0, UINT_MAX);
-
-	/* wait all */
-	__init_discard_policy(sbi, &dp, DPOLICY_FSTRIM, 1);
-	discard_blks = __wait_discard_cmd_range(sbi, &dp, 0, UINT_MAX);
-	__init_discard_policy(sbi, &dp, DPOLICY_UMOUNT, 1);
-	discard_blks += __wait_discard_cmd_range(sbi, &dp, 0, UINT_MAX);
-
-	return discard_blks;
-}
-
-/* This should be covered by global mutex, &sit_i->sentry_lock */
-static void f2fs_wait_discard_bio(struct f2fs_sb_info *sbi, block_t blkaddr)
-{
-	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
-	struct discard_cmd *dc;
-	bool need_wait = false;
-
-	mutex_lock(&dcc->cmd_lock);
-	dc = (struct discard_cmd *)f2fs_lookup_rb_tree(&dcc->root,
-							NULL, blkaddr);
-	if (dc) {
-		if (dc->state == D_PREP) {
-			__punch_discard_cmd(sbi, dc, blkaddr);
-		} else {
-			dc->ref++;
-			need_wait = true;
-		}
-	}
-	mutex_unlock(&dcc->cmd_lock);
-
-	if (need_wait)
-		__wait_one_discard_bio(sbi, dc);
-}
-
-void f2fs_stop_discard_thread(struct f2fs_sb_info *sbi)
-{
-	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
-
-	if (dcc && dcc->f2fs_issue_discard) {
-		struct task_struct *discard_thread = dcc->f2fs_issue_discard;
-
-		dcc->f2fs_issue_discard = NULL;
-		kthread_stop(discard_thread);
-	}
-}
-
-/* This comes from f2fs_put_super */
-bool f2fs_issue_discard_timeout(struct f2fs_sb_info *sbi)
-{
-	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
-	struct discard_policy dpolicy;
-	bool dropped;
-
-	if (!atomic_read(&dcc->discard_cmd_cnt))
-		return false;
-
-	__init_discard_policy(sbi, &dpolicy, DPOLICY_UMOUNT,
-					dcc->discard_granularity);
-	__issue_discard_cmd(sbi, &dpolicy);
-	dropped = __drop_discard_cmd(sbi);
-
-	/* just to make sure there is no pending discard commands */
-	__wait_all_discard_cmd(sbi, NULL);
-
-	f2fs_bug_on(sbi, atomic_read(&dcc->discard_cmd_cnt));
-	return dropped;
-}
-
-static int issue_discard_thread(void *data)
-{
-	struct f2fs_sb_info *sbi = data;
-	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
-	wait_queue_head_t *q = &dcc->discard_wait_queue;
-	struct discard_policy dpolicy;
-	unsigned int wait_ms = dcc->min_discard_issue_time;
-	int issued;
-
-	set_freezable();
-
-	do {
-		wait_event_interruptible_timeout(*q,
-				kthread_should_stop() || freezing(current) ||
-				dcc->discard_wake,
-				msecs_to_jiffies(wait_ms));
-
-		if (sbi->gc_mode == GC_URGENT_HIGH ||
-			!f2fs_available_free_memory(sbi, DISCARD_CACHE))
-			__init_discard_policy(sbi, &dpolicy, DPOLICY_FORCE, 1);
-		else
-			__init_discard_policy(sbi, &dpolicy, DPOLICY_BG,
-						dcc->discard_granularity);
-
-		if (dcc->discard_wake)
-			dcc->discard_wake = 0;
-
-		/* clean up pending candidates before going to sleep */
-		if (atomic_read(&dcc->queued_discard))
-			__wait_all_discard_cmd(sbi, NULL);
-
-		if (try_to_freeze())
-			continue;
-		if (f2fs_readonly(sbi->sb))
-			continue;
-		if (kthread_should_stop())
-			return 0;
-		if (is_sbi_flag_set(sbi, SBI_NEED_FSCK) ||
-			!atomic_read(&dcc->discard_cmd_cnt)) {
-			wait_ms = dpolicy.max_interval;
-			continue;
-		}
-
-		sb_start_intwrite(sbi->sb);
-
-		issued = __issue_discard_cmd(sbi, &dpolicy);
-		if (issued > 0) {
-			__wait_all_discard_cmd(sbi, &dpolicy);
-			wait_ms = dpolicy.min_interval;
-		} else if (issued == -1) {
-			wait_ms = f2fs_time_to_wait(sbi, DISCARD_TIME);
-			if (!wait_ms)
-				wait_ms = dpolicy.mid_interval;
-		} else {
-			wait_ms = dpolicy.max_interval;
-		}
-		if (!atomic_read(&dcc->discard_cmd_cnt))
-			wait_ms = dpolicy.max_interval;
-
-		sb_end_intwrite(sbi->sb);
-
-	} while (!kthread_should_stop());
-	return 0;
-}
-
-#ifdef CONFIG_BLK_DEV_ZONED
-static int __f2fs_issue_discard_zone(struct f2fs_sb_info *sbi,
-		struct block_device *bdev, block_t blkstart, block_t blklen)
-{
-	sector_t sector, nr_sects;
-	block_t lblkstart = blkstart;
-	int devi = 0;
-
-	if (f2fs_is_multi_device(sbi)) {
-		devi = f2fs_target_device_index(sbi, blkstart);
-		if (blkstart < FDEV(devi).start_blk ||
-		    blkstart > FDEV(devi).end_blk) {
-			f2fs_err(sbi, "Invalid block %x", blkstart);
-			return -EIO;
-		}
-		blkstart -= FDEV(devi).start_blk;
-	}
-
-	/* For sequential zones, reset the zone write pointer */
-	if (f2fs_blkz_is_seq(sbi, devi, blkstart)) {
-		sector = SECTOR_FROM_BLOCK(blkstart);
-		nr_sects = SECTOR_FROM_BLOCK(blklen);
-
-		if (sector & (bdev_zone_sectors(bdev) - 1) ||
-				nr_sects != bdev_zone_sectors(bdev)) {
-			f2fs_err(sbi, "(%d) %s: Unaligned zone reset attempted (block %x + %x)",
-				 devi, sbi->s_ndevs ? FDEV(devi).path : "",
-				 blkstart, blklen);
-			return -EIO;
-		}
-		trace_f2fs_issue_reset_zone(bdev, blkstart);
-		return blkdev_zone_mgmt(bdev, REQ_OP_ZONE_RESET,
-					sector, nr_sects, GFP_NOFS);
-	}
-
-	/* For conventional zones, use regular discard if supported */
-	__queue_discard_cmd(sbi, bdev, lblkstart, blklen);
-	return 0;
-}
-#endif
-
-static int __issue_discard_async(struct f2fs_sb_info *sbi,
-		struct block_device *bdev, block_t blkstart, block_t blklen)
-{
-#ifdef CONFIG_BLK_DEV_ZONED
-	if (f2fs_sb_has_blkzoned(sbi) && bdev_is_zoned(bdev))
-		return __f2fs_issue_discard_zone(sbi, bdev, blkstart, blklen);
-#endif
-	__queue_discard_cmd(sbi, bdev, blkstart, blklen);
-	return 0;
-}
-
-static int f2fs_issue_discard(struct f2fs_sb_info *sbi,
-				block_t blkstart, block_t blklen)
-{
-	sector_t start = blkstart, len = 0;
-	struct block_device *bdev;
-	struct seg_entry *se;
-	unsigned int offset;
-	block_t i;
-	int err = 0;
-
-	bdev = f2fs_target_device(sbi, blkstart, NULL);
-
-	for (i = blkstart; i < blkstart + blklen; i++, len++) {
-		if (i != start) {
-			struct block_device *bdev2 =
-				f2fs_target_device(sbi, i, NULL);
-
-			if (bdev2 != bdev) {
-				err = __issue_discard_async(sbi, bdev,
-						start, len);
-				if (err)
-					return err;
-				bdev = bdev2;
-				start = i;
-				len = 0;
-			}
-		}
-
-		se = get_seg_entry(sbi, GET_SEGNO(sbi, i));
-		offset = GET_BLKOFF_FROM_SEG0(sbi, i);
-
-		if (f2fs_block_unit_discard(sbi) &&
-				!f2fs_test_and_set_bit(offset, se->discard_map))
-			sbi->discard_blks--;
-	}
-
-	if (len)
-		err = __issue_discard_async(sbi, bdev, start, len);
-	return err;
-}
-
-static bool add_discard_addrs(struct f2fs_sb_info *sbi, struct cp_control *cpc,
-							bool check_only)
-{
-	int entries = SIT_VBLOCK_MAP_SIZE / sizeof(unsigned long);
-	int max_blocks = sbi->blocks_per_seg;
-	struct seg_entry *se = get_seg_entry(sbi, cpc->trim_start);
-	unsigned long *cur_map = (unsigned long *)se->cur_valid_map;
-	unsigned long *ckpt_map = (unsigned long *)se->ckpt_valid_map;
-	unsigned long *discard_map = (unsigned long *)se->discard_map;
-	unsigned long *dmap = SIT_I(sbi)->tmp_map;
-	unsigned int start = 0, end = -1;
-	bool force = (cpc->reason & CP_DISCARD);
-	struct discard_entry *de = NULL;
-	struct list_head *head = &SM_I(sbi)->dcc_info->entry_list;
-	int i;
-
-	if (se->valid_blocks == max_blocks || !f2fs_hw_support_discard(sbi) ||
-			!f2fs_block_unit_discard(sbi))
-		return false;
-
-	if (!force) {
-		if (!f2fs_realtime_discard_enable(sbi) || !se->valid_blocks ||
-			SM_I(sbi)->dcc_info->nr_discards >=
-				SM_I(sbi)->dcc_info->max_discards)
-			return false;
-	}
-
-	/* SIT_VBLOCK_MAP_SIZE should be multiple of sizeof(unsigned long) */
-	for (i = 0; i < entries; i++)
-		dmap[i] = force ? ~ckpt_map[i] & ~discard_map[i] :
-				(cur_map[i] ^ ckpt_map[i]) & ckpt_map[i];
-
-	while (force || SM_I(sbi)->dcc_info->nr_discards <=
-				SM_I(sbi)->dcc_info->max_discards) {
-		start = __find_rev_next_bit(dmap, max_blocks, end + 1);
-		if (start >= max_blocks)
-			break;
-
-		end = __find_rev_next_zero_bit(dmap, max_blocks, start + 1);
-		if (force && start && end != max_blocks
-					&& (end - start) < cpc->trim_minlen)
-			continue;
-
-		if (check_only)
-			return true;
-
-		if (!de) {
-			de = f2fs_kmem_cache_alloc(discard_entry_slab,
-						GFP_F2FS_ZERO, true, NULL);
-			de->start_blkaddr = START_BLOCK(sbi, cpc->trim_start);
-			list_add_tail(&de->list, head);
-		}
-
-		for (i = start; i < end; i++)
-			__set_bit_le(i, (void *)de->discard_map);
-
-		SM_I(sbi)->dcc_info->nr_discards += end - start;
-	}
-	return false;
-}
-
-static void release_discard_addr(struct discard_entry *entry)
-{
-	list_del(&entry->list);
-	kmem_cache_free(discard_entry_slab, entry);
-}
-
-void f2fs_release_discard_addrs(struct f2fs_sb_info *sbi)
-{
-	struct list_head *head = &(SM_I(sbi)->dcc_info->entry_list);
-	struct discard_entry *entry, *this;
-
-	/* drop caches */
-	list_for_each_entry_safe(entry, this, head, list)
-		release_discard_addr(entry);
-}
-
 /*
  * Should call f2fs_clear_prefree_segments after checkpoint is done.
  */
@@ -2033,98 +1057,6 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 	wake_up_discard_thread(sbi, false);
 }
 
-int f2fs_start_discard_thread(struct f2fs_sb_info *sbi)
-{
-	dev_t dev = sbi->sb->s_bdev->bd_dev;
-	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
-	int err = 0;
-
-	if (!f2fs_realtime_discard_enable(sbi))
-		return 0;
-
-	dcc->f2fs_issue_discard = kthread_run(issue_discard_thread, sbi,
-				"f2fs_discard-%u:%u", MAJOR(dev), MINOR(dev));
-	if (IS_ERR(dcc->f2fs_issue_discard)) {
-		err = PTR_ERR(dcc->f2fs_issue_discard);
-		dcc->f2fs_issue_discard = NULL;
-	}
-
-	return err;
-}
-
-static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
-{
-	struct discard_cmd_control *dcc;
-	int err = 0, i;
-
-	if (SM_I(sbi)->dcc_info) {
-		dcc = SM_I(sbi)->dcc_info;
-		goto init_thread;
-	}
-
-	dcc = f2fs_kzalloc(sbi, sizeof(struct discard_cmd_control), GFP_KERNEL);
-	if (!dcc)
-		return -ENOMEM;
-
-	dcc->discard_granularity = DEFAULT_DISCARD_GRANULARITY;
-	dcc->max_ordered_discard = DEFAULT_MAX_ORDERED_DISCARD_GRANULARITY;
-	if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SEGMENT)
-		dcc->discard_granularity = sbi->blocks_per_seg;
-	else if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SECTION)
-		dcc->discard_granularity = BLKS_PER_SEC(sbi);
-
-	INIT_LIST_HEAD(&dcc->entry_list);
-	for (i = 0; i < MAX_PLIST_NUM; i++)
-		INIT_LIST_HEAD(&dcc->pend_list[i]);
-	INIT_LIST_HEAD(&dcc->wait_list);
-	INIT_LIST_HEAD(&dcc->fstrim_list);
-	mutex_init(&dcc->cmd_lock);
-	atomic_set(&dcc->issued_discard, 0);
-	atomic_set(&dcc->queued_discard, 0);
-	atomic_set(&dcc->discard_cmd_cnt, 0);
-	dcc->nr_discards = 0;
-	dcc->max_discards = MAIN_SEGS(sbi) << sbi->log_blocks_per_seg;
-	dcc->max_discard_request = DEF_MAX_DISCARD_REQUEST;
-	dcc->min_discard_issue_time = DEF_MIN_DISCARD_ISSUE_TIME;
-	dcc->mid_discard_issue_time = DEF_MID_DISCARD_ISSUE_TIME;
-	dcc->max_discard_issue_time = DEF_MAX_DISCARD_ISSUE_TIME;
-	dcc->discard_urgent_util = DEF_DISCARD_URGENT_UTIL;
-	dcc->undiscard_blks = 0;
-	dcc->next_pos = 0;
-	dcc->root = RB_ROOT_CACHED;
-	dcc->rbtree_check = false;
-
-	init_waitqueue_head(&dcc->discard_wait_queue);
-	SM_I(sbi)->dcc_info = dcc;
-init_thread:
-	err = f2fs_start_discard_thread(sbi);
-	if (err) {
-		kfree(dcc);
-		SM_I(sbi)->dcc_info = NULL;
-	}
-
-	return err;
-}
-
-static void destroy_discard_cmd_control(struct f2fs_sb_info *sbi)
-{
-	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
-
-	if (!dcc)
-		return;
-
-	f2fs_stop_discard_thread(sbi);
-
-	/*
-	 * Recovery can cache discard commands, so in error path of
-	 * fill_super(), it needs to give a chance to handle them.
-	 */
-	f2fs_issue_discard_timeout(sbi);
-
-	kfree(dcc);
-	SM_I(sbi)->dcc_info = NULL;
-}
-
 static bool __mark_sit_entry_dirty(struct f2fs_sb_info *sbi, unsigned int segno)
 {
 	struct sit_info *sit_i = SIT_I(sbi);
@@ -2953,167 +1885,6 @@ void f2fs_allocate_new_segments(struct f2fs_sb_info *sbi)
 	f2fs_up_read(&SM_I(sbi)->curseg_lock);
 }
 
-bool f2fs_exist_trim_candidates(struct f2fs_sb_info *sbi,
-						struct cp_control *cpc)
-{
-	__u64 trim_start = cpc->trim_start;
-	bool has_candidate = false;
-
-	down_write(&SIT_I(sbi)->sentry_lock);
-	for (; cpc->trim_start <= cpc->trim_end; cpc->trim_start++) {
-		if (add_discard_addrs(sbi, cpc, true)) {
-			has_candidate = true;
-			break;
-		}
-	}
-	up_write(&SIT_I(sbi)->sentry_lock);
-
-	cpc->trim_start = trim_start;
-	return has_candidate;
-}
-
-static unsigned int __issue_discard_cmd_range(struct f2fs_sb_info *sbi,
-					struct discard_policy *dpolicy,
-					unsigned int start, unsigned int end)
-{
-	struct discard_cmd_control *dcc = SM_I(sbi)->dcc_info;
-	struct discard_cmd *prev_dc = NULL, *next_dc = NULL;
-	struct rb_node **insert_p = NULL, *insert_parent = NULL;
-	struct discard_cmd *dc;
-	struct blk_plug plug;
-	int issued;
-	unsigned int trimmed = 0;
-
-next:
-	issued = 0;
-
-	mutex_lock(&dcc->cmd_lock);
-	if (unlikely(dcc->rbtree_check))
-		f2fs_bug_on(sbi, !f2fs_check_rb_tree_consistence(sbi,
-							&dcc->root, false));
-
-	dc = (struct discard_cmd *)f2fs_lookup_rb_tree_ret(&dcc->root,
-					NULL, start,
-					(struct rb_entry **)&prev_dc,
-					(struct rb_entry **)&next_dc,
-					&insert_p, &insert_parent, true, NULL);
-	if (!dc)
-		dc = next_dc;
-
-	blk_start_plug(&plug);
-
-	while (dc && dc->lstart <= end) {
-		struct rb_node *node;
-		int err = 0;
-
-		if (dc->len < dpolicy->granularity)
-			goto skip;
-
-		if (dc->state != D_PREP) {
-			list_move_tail(&dc->list, &dcc->fstrim_list);
-			goto skip;
-		}
-
-		err = __submit_discard_cmd(sbi, dpolicy, dc, &issued);
-
-		if (issued >= dpolicy->max_requests) {
-			start = dc->lstart + dc->len;
-
-			if (err)
-				__remove_discard_cmd(sbi, dc);
-
-			blk_finish_plug(&plug);
-			mutex_unlock(&dcc->cmd_lock);
-			trimmed += __wait_all_discard_cmd(sbi, NULL);
-			f2fs_io_schedule_timeout(DEFAULT_IO_TIMEOUT);
-			goto next;
-		}
-skip:
-		node = rb_next(&dc->rb_node);
-		if (err)
-			__remove_discard_cmd(sbi, dc);
-		dc = rb_entry_safe(node, struct discard_cmd, rb_node);
-
-		if (fatal_signal_pending(current))
-			break;
-	}
-
-	blk_finish_plug(&plug);
-	mutex_unlock(&dcc->cmd_lock);
-
-	return trimmed;
-}
-
-int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range)
-{
-	__u64 start = F2FS_BYTES_TO_BLK(range->start);
-	__u64 end = start + F2FS_BYTES_TO_BLK(range->len) - 1;
-	unsigned int start_segno, end_segno;
-	block_t start_block, end_block;
-	struct cp_control cpc;
-	struct discard_policy dpolicy;
-	unsigned long long trimmed = 0;
-	int err = 0;
-	bool need_align = f2fs_lfs_mode(sbi) && __is_large_section(sbi);
-
-	if (start >= MAX_BLKADDR(sbi) || range->len < sbi->blocksize)
-		return -EINVAL;
-
-	if (end < MAIN_BLKADDR(sbi))
-		goto out;
-
-	if (is_sbi_flag_set(sbi, SBI_NEED_FSCK)) {
-		f2fs_warn(sbi, "Found FS corruption, run fsck to fix.");
-		return -EFSCORRUPTED;
-	}
-
-	/* start/end segment number in main_area */
-	start_segno = (start <= MAIN_BLKADDR(sbi)) ? 0 : GET_SEGNO(sbi, start);
-	end_segno = (end >= MAX_BLKADDR(sbi)) ? MAIN_SEGS(sbi) - 1 :
-						GET_SEGNO(sbi, end);
-	if (need_align) {
-		start_segno = rounddown(start_segno, sbi->segs_per_sec);
-		end_segno = roundup(end_segno + 1, sbi->segs_per_sec) - 1;
-	}
-
-	cpc.reason = CP_DISCARD;
-	cpc.trim_minlen = max_t(__u64, 1, F2FS_BYTES_TO_BLK(range->minlen));
-	cpc.trim_start = start_segno;
-	cpc.trim_end = end_segno;
-
-	if (sbi->discard_blks == 0)
-		goto out;
-
-	f2fs_down_write(&sbi->gc_lock);
-	err = f2fs_write_checkpoint(sbi, &cpc);
-	f2fs_up_write(&sbi->gc_lock);
-	if (err)
-		goto out;
-
-	/*
-	 * We filed discard candidates, but actually we don't need to wait for
-	 * all of them, since they'll be issued in idle time along with runtime
-	 * discard option. User configuration looks like using runtime discard
-	 * or periodic fstrim instead of it.
-	 */
-	if (f2fs_realtime_discard_enable(sbi))
-		goto out;
-
-	start_block = START_BLOCK(sbi, start_segno);
-	end_block = START_BLOCK(sbi, end_segno + 1);
-
-	__init_discard_policy(sbi, &dpolicy, DPOLICY_FSTRIM, cpc.trim_minlen);
-	trimmed = __issue_discard_cmd_range(sbi, &dpolicy,
-					start_block, end_block);
-
-	trimmed += __wait_discard_cmd_range(sbi, &dpolicy,
-					start_block, end_block);
-out:
-	if (!err)
-		range->len = F2FS_BLK_TO_BYTES(trimmed);
-	return err;
-}
-
 static bool __has_curseg_space(struct f2fs_sb_info *sbi,
 					struct curseg_info *curseg)
 {
@@ -5287,41 +4058,34 @@ void f2fs_destroy_segment_manager(struct f2fs_sb_info *sbi)
 
 int __init f2fs_create_segment_manager_caches(void)
 {
-	discard_entry_slab = f2fs_kmem_cache_create("f2fs_discard_entry",
-			sizeof(struct discard_entry));
-	if (!discard_entry_slab)
-		goto fail;
-
-	discard_cmd_slab = f2fs_kmem_cache_create("f2fs_discard_cmd",
-			sizeof(struct discard_cmd));
-	if (!discard_cmd_slab)
-		goto destroy_discard_entry;
+	int ret;
 
 	sit_entry_set_slab = f2fs_kmem_cache_create("f2fs_sit_entry_set",
 			sizeof(struct sit_entry_set));
 	if (!sit_entry_set_slab)
-		goto destroy_discard_cmd;
+		return -ENOMEM;
 
 	revoke_entry_slab = f2fs_kmem_cache_create("f2fs_revoke_entry",
 			sizeof(struct revoke_entry));
 	if (!revoke_entry_slab)
 		goto destroy_sit_entry_set;
-	return 0;
 
+	ret = f2fs_create_discard_caches();
+	if (ret)
+		goto destroy_revoke_entry;
+
+	return ret;
+
+destroy_revoke_entry:
+	kmem_cache_destroy(revoke_entry_slab);
 destroy_sit_entry_set:
 	kmem_cache_destroy(sit_entry_set_slab);
-destroy_discard_cmd:
-	kmem_cache_destroy(discard_cmd_slab);
-destroy_discard_entry:
-	kmem_cache_destroy(discard_entry_slab);
-fail:
 	return -ENOMEM;
 }
 
 void f2fs_destroy_segment_manager_caches(void)
 {
+	f2fs_destroy_discard_caches();
 	kmem_cache_destroy(sit_entry_set_slab);
-	kmem_cache_destroy(discard_cmd_slab);
-	kmem_cache_destroy(discard_entry_slab);
 	kmem_cache_destroy(revoke_entry_slab);
 }
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
