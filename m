Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC51E6D574D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 05:49:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjXfX-0008UP-US;
	Tue, 04 Apr 2023 03:49:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pjXfW-0008UI-6S
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 03:49:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VGTyht8d4piCA3uU7IMLkGaOcewaX1OcfUAdWZNPagE=; b=b/01lQk/cJyBKLmAMPlbPczSKH
 DjPK1xlDkpYuDIU6BXP7Y1zypvQDdqWjNIEEs36pJl+2udojeRPlq+DJwlYhbtGcWm5lon1VcBHMe
 5CNHEdpW+PjRyI49eYZcGmZZFKv7iwQQpWReznpYnTu6mzMggchltkkjFVhVBjl0f+no=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VGTyht8d4piCA3uU7IMLkGaOcewaX1OcfUAdWZNPagE=; b=c
 CWHY8Qj6LcqxqwftOirxD+Zct1snDCXa8QJRPscokQNl0dkEnni8YEGqoXlD3Hj/uhhJQkJWvUlUg
 CjFcaVTri9qLQyV11BQTxahj1JIp13sMr++8ogWCQSFjYWSt1SPGkMTYFpmz/DY+iFxCeGs4i67OR
 Kup2lumsU5JJRUW0=;
Received: from mail-psaapc01on2129.outbound.protection.outlook.com
 ([40.107.255.129] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjXfQ-0006uK-Fs for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 03:49:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UXCi/8eiRrBXFAJBUiMpahcrbPPEFmmflcLZAwhuni3WTsGncIC9bGIUtii85cmVS9HNkacNDFTPr5OgdhnPQ9O09lMdMa0IU3YcCArylH/WX+91pbn92xKrp9AVskEv7WMbMrEiwp8ZDT13ZgRPcW/ayEDD1g3pVwZlCX3knyFYKq6neWe8Ssna+0OBdVWYdbDv8/PJUU8LvjotTnY20NPuEqgb83+7fnk8k2fjyIVz/PQh7mJ2SAhitCZgkpcEfnmE/pSynTdNUza5W0L/JecV1iqcxH47uw8iFOk05xHR0QnzXhBtwm0QHZEr+n0fVVlPTU3SQo/dqtafruCYYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VGTyht8d4piCA3uU7IMLkGaOcewaX1OcfUAdWZNPagE=;
 b=cmTo5sjTS8L12NlBgaIHBFkiIV6GApYkhHv2T/OK+WA/b8bg4fRfgiZnI/CaevYKvo9TDir+Drj0rXWpS9cagkAblEZafZVCFH/JTJgf5xCduJpbNHHPgoP3FECjLS9c3qr52UYy1aQh9lmQClfgefgDwDKUgF1O52UyoQf3MkpZue9fH98cElOHjXKApwV+Czj+lbnci/lQ4g2iUf9jxRYGajm9Ky8vG0z1nGwsSuqLV4SQc8vOK4DpbS+9xgdZexZBNCwL7DukYmB2iojuGT9FTUOHx+mVMWJIyMKR/zaNHM4iPmvZ06LLqdLlpId2R/XQhFNVa1v9HAJSqxY6oQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VGTyht8d4piCA3uU7IMLkGaOcewaX1OcfUAdWZNPagE=;
 b=p2X7lPaqyq2VeS7yaysBPxCp8m/gNnTZv5+WUoagSI9Mz5O7ZnudYzqHGZD0YKm13y7XEAwiDk1OfhM+3CgufClaseJhl4BHqflzUvZf+cu2lx9fdb8iXQMwDjxmTsxLzoIMho4aVX5p/X95U/he3lJhLZ+yuZ3w3RmGsyRTQ+3JvI5YqRcC2yc3ROaSKmoyi6TopAzCNNbroH7jj4m1UsMJMgbs4/iBO7T4yj0OCL173Nc/gjD2LdBjtyIxOR2e/cQgRKeylsl50D7gkiBcefVUs771wH37YpRh6LMHS22tyaSBrn65cPKAxNtq6gBk04JtOA8NincStQy89+D9WA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PSAPR06MB4038.apcprd06.prod.outlook.com (2603:1096:301:2a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.34; Tue, 4 Apr
 2023 03:48:57 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c%6]) with mapi id 15.20.6254.028; Tue, 4 Apr 2023
 03:48:57 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue,  4 Apr 2023 11:48:47 +0800
Message-Id: <20230404034847.26667-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: TYAPR01CA0020.jpnprd01.prod.outlook.com (2603:1096:404::32)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PSAPR06MB4038:EE_
X-MS-Office365-Filtering-Correlation-Id: d153d160-601b-4e62-0fdc-08db34bf84c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /xDaiij+wAg39YibZJpj8i5p3jrQNIARJmpQRTN46LAwOy/mZEOxYa+/iPSQfUvxJ+5/4EcA1jbg5XcZGQoSek8UmPzm1X31O4LSLiJu9L+Yeauo3jkcrad+TzEKf3bfLq7fLgUfRkcqyagYc86uL+Dmztb0rohorvTKEAXE1tOyxL1vd/+NgUTjwCD6yUtVjwl817mnCSQle4I8NiRs2VldJ5W3JnIwoaba8pVyDjvajxXp77Wyd8slpWPWAOIBGqcMuMK/Yl31xquS9qPbYWvN0ICzhTeSWLuWBNNeMAAZ5nBTegefk0OXAF/A7UDYSDzl3i5L/lcVVSZBlM7AOdfU3LVvfZ8OMy2bBeRdmdHM6EiZab4vsZJLb0sK8jQM0kvgGqSKxuG04+4hyXMV03iCHz/LKWRC6I7C81Hokiq6qgrnZKqFeUfU5ak5z/wkSGvqrllsdzQSf/ryA16EWK01URYVHBaqU77rElRs2VtqVDjM+x7zQMsm/2j062CV5ltUClRVtmGGr9SK9sWI4aDgBR622EUGujmdLu5MZZAuJ/IyrsFikG4+h6SEaoflZs+4p19A/eAvHCnbn3hA+E3QfSzS5biZcH7BSWtFPsBtlH+FOkPuEqra9x//oM+u
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(366004)(39860400002)(376002)(136003)(451199021)(83380400001)(5660300002)(8676002)(38350700002)(66476007)(2906002)(66946007)(66556008)(38100700002)(6486002)(41300700001)(4326008)(316002)(2616005)(8936002)(86362001)(478600001)(107886003)(6666004)(6512007)(1076003)(26005)(6506007)(36756003)(186003)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?P6lnQViyE4V5RqgmWwRnoIkUXO4ezACDOXVb/ANrJIcaP2jjtakVm5Z9nFvM?=
 =?us-ascii?Q?aE6sUxIjRRH/BPowmaLApxFo1f6paehbYkZt0P2NV8oEpZfuND9Wl75RTX64?=
 =?us-ascii?Q?iaUVXidWvKbRiRFZfZGqINbm12ovyCLxj/x4GmkWh2pzXlMvYidvG1uzmgRb?=
 =?us-ascii?Q?qv+j4HqusGJ6Louhval3TzZTBxlTJQ4rzZji+I3TjghT0kLMXAXAN6Cdu0Qx?=
 =?us-ascii?Q?mDVIWaRhF7aIWmFX1bCDB8Juggv0V6wC+bxBhgdLwQ4Escx+ysV71AzBTh3z?=
 =?us-ascii?Q?jPKK1FMh32bs2L1HIYF+i4XhZRK2RXOsN6IxJb9Ch3Sb4tEf0Jn0uTw+ETlA?=
 =?us-ascii?Q?N9w0IC1qAL/uCQfk15sd61Slw1Q/IDJQ/ZF6p73ficyJ2y/wU3C2G9Gsq1MV?=
 =?us-ascii?Q?iZFzYxqUldSumXlVjxmFKfjtku1JbYiy+uzX7xMATQ1RDWVFfKajbKqgkFDx?=
 =?us-ascii?Q?jSvXobkvY/3FBZmR3gzNUTHeRZCFw61QsfCCgwMyFry/ZWI5eD76zXNaAUhO?=
 =?us-ascii?Q?p7lNL+VEopaf/HFCHOQ+wecM0oWsHKFHOv12l3mi+VfICScEsNa0tL4MTnIj?=
 =?us-ascii?Q?g3II2YbErII5K1nKy3WtMq1JuOA/WC5lcQit2yf5osz08O97jgmyb5LOxKa3?=
 =?us-ascii?Q?TVPxoCPs0Diut8LFPuT2n6sJbN78IFgNGRRKjM+IqMno+c//3SX8frq/N6Gx?=
 =?us-ascii?Q?gZ3wQZ8cn8tQGXA4P/BkZ9TMMOoBdg7LNmVGof1YD42oq2VKuyvcxaWZ07+3?=
 =?us-ascii?Q?c1T4YSrSwLe0LwVp32dxSr7fWw+q88x5buECEpZwswBzRe/FaL2tX7xlfFkU?=
 =?us-ascii?Q?aPs7Qu7AROjY/VHUbOGQaBKbuMz4sGeXQw10xqKCOIhP+Cs0nZXhMERG99aD?=
 =?us-ascii?Q?jEpHRCALcZ0qpmF5SmLZEwTXoFUNb2jRZLk71mkeJigtMoAZguZpLyS42kKs?=
 =?us-ascii?Q?IKhuidVUNG/6Cl/K58KlGMCEeeK6lDI+ob1tTkJIH8iaX0dgBRifkoKNSHwc?=
 =?us-ascii?Q?oNSL5LjZ445P0wvpeiyJ6LeQd5Qvoputz2X5Mq1gISh5McWU9zCn07CEcFSF?=
 =?us-ascii?Q?qGISghjJPjqE9NEtdycyKOmtyTLS+Oc42fe3b/VSgGtNyeTR9tfotIKZsWbq?=
 =?us-ascii?Q?gxh5eMFd0K5ONC0OWLMltTV1b++KZIbX49GUVgMsMEM5J/IkZk6wLoK3Mx2m?=
 =?us-ascii?Q?+8SXQNAZIMF2NZ7AQNj/nY1i0HJbWQxs4t9vBW4wTYDV1lYrVqnhO28gG7VZ?=
 =?us-ascii?Q?6XqXOtql/dJ3qzrxR+QVbbgbwqRbMOYsP0v9p71fF9ZjuhvtBbfIOW/o6Tsn?=
 =?us-ascii?Q?xUzggn4VSQotSfHpkLUqmf5Rv48UHi+QUiIaezRDgQ521PDcEng1IriZ0/X1?=
 =?us-ascii?Q?KbpbWYtdSdEpQhmy+9JD8OS+yJOpcT09wXYU7cZJkQxBksItGUrka1G+A1UC?=
 =?us-ascii?Q?Z2UC+Z5xrkHfZNfd7DTj0ERDls/eJUsPGXy6M9mwy752eoUdJfO2jtnqzJ+U?=
 =?us-ascii?Q?PMEy3DMrCxheflQm9OLhwHHf2vcVAAo/7XZZKnyMkGrEKfIjIcLCLYyZO/k9?=
 =?us-ascii?Q?+aHq1h2ZxywwBLQlDj0OPmsvYnCQ1xHBjXGG69CT?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d153d160-601b-4e62-0fdc-08db34bf84c8
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2023 03:48:57.5980 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GmSAMxSjtqHiOGgQ2xcFrzgkjFWbx71oy/Ux/3s2ol5NQUVxsfPGlmKPHjtn8mcvHxvK+fpkqsdrAp6Esymf9g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4038
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Commit 3fde13f817e2 ("f2fs: compress: support compress
 level")
 forgot to do basic compress level check, let's add it. Signed-off-by: Yangtao
 Li <frank.li@vivo.com> --- v2: -convert to zstd_max_clevel() fs/f2fs/inode.c
 | 96 ++++++++++++++++++++++++++++++++++ 1 file changed, 67 insertions(+),
 29 deletion [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.129 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.129 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pjXfQ-0006uK-Fs
Subject: [f2fs-dev] [PATCH v2] f2fs: add sanity compress level check for
 compressed file
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

Commit 3fde13f817e2 ("f2fs: compress: support compress level")
forgot to do basic compress level check, let's add it.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v2:
-convert to zstd_max_clevel()
 fs/f2fs/inode.c | 96 ++++++++++++++++++++++++++++++++++---------------
 1 file changed, 67 insertions(+), 29 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index bb5b365a195d..e6f45a7a079d 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -10,6 +10,8 @@
 #include <linux/buffer_head.h>
 #include <linux/writeback.h>
 #include <linux/sched/mm.h>
+#include <linux/lz4.h>
+#include <linux/zstd.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -202,6 +204,69 @@ void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct page *page)
 	ri->i_inode_checksum = cpu_to_le32(f2fs_inode_chksum(sbi, page));
 }
 
+static bool sanity_check_compress_inode(struct inode *inode,
+			struct f2fs_inode *ri)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	unsigned char compress_level;
+
+	if (ri->i_compress_algorithm >= COMPRESS_MAX) {
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		f2fs_warn(sbi,
+			"%s: inode (ino=%lx) has unsupported compress algorithm: %u, run fsck to fix",
+			__func__, inode->i_ino, ri->i_compress_algorithm);
+		return false;
+	}
+	if (le64_to_cpu(ri->i_compr_blocks) >
+			SECTOR_TO_BLOCK(inode->i_blocks)) {
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		f2fs_warn(sbi,
+			"%s: inode (ino=%lx) has inconsistent i_compr_blocks:%llu, i_blocks:%llu, run fsck to fix",
+			__func__, inode->i_ino, le64_to_cpu(ri->i_compr_blocks),
+			SECTOR_TO_BLOCK(inode->i_blocks));
+		return false;
+	}
+	if (ri->i_log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
+		ri->i_log_cluster_size > MAX_COMPRESS_LOG_SIZE) {
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
+		f2fs_warn(sbi,
+			"%s: inode (ino=%lx) has unsupported log cluster size: %u, run fsck to fix",
+			__func__, inode->i_ino, ri->i_log_cluster_size);
+		return false;
+	}
+
+	compress_level = le16_to_cpu(ri->i_compress_flag) >>
+				COMPRESS_LEVEL_OFFSET;
+	switch (ri->i_compress_algorithm) {
+	case COMPRESS_LZO:
+	case COMPRESS_LZORLE:
+		if (compress_level)
+			goto err;
+		break;
+	case COMPRESS_LZ4:
+		if ((compress_level && compress_level < LZ4HC_MIN_CLEVEL) ||
+				compress_level > LZ4HC_MAX_CLEVEL)
+			goto err;
+		break;
+	case COMPRESS_ZSTD:
+#ifdef CONFIG_F2FS_FS_ZSTD
+		if (!compress_level || compress_level > zstd_max_clevel())
+			goto err;
+#endif
+		break;
+	default:
+		goto err;
+	}
+
+	return true;
+
+err:
+	set_sbi_flag(sbi, SBI_NEED_FSCK);
+	f2fs_warn(sbi, "%s: inode (ino=%lx) has unsupported compress level: %u, run fsck to fix",
+		  __func__, inode->i_ino, compress_level);
+	return false;
+}
+
 static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
@@ -286,35 +351,8 @@ static bool sanity_check_inode(struct inode *inode, struct page *node_page)
 	if (f2fs_has_extra_attr(inode) && f2fs_sb_has_compression(sbi) &&
 			fi->i_flags & F2FS_COMPR_FL &&
 			F2FS_FITS_IN_INODE(ri, fi->i_extra_isize,
-						i_log_cluster_size)) {
-		if (ri->i_compress_algorithm >= COMPRESS_MAX) {
-			set_sbi_flag(sbi, SBI_NEED_FSCK);
-			f2fs_warn(sbi, "%s: inode (ino=%lx) has unsupported "
-				"compress algorithm: %u, run fsck to fix",
-				  __func__, inode->i_ino,
-				  ri->i_compress_algorithm);
-			return false;
-		}
-		if (le64_to_cpu(ri->i_compr_blocks) >
-				SECTOR_TO_BLOCK(inode->i_blocks)) {
-			set_sbi_flag(sbi, SBI_NEED_FSCK);
-			f2fs_warn(sbi, "%s: inode (ino=%lx) has inconsistent "
-				"i_compr_blocks:%llu, i_blocks:%llu, run fsck to fix",
-				  __func__, inode->i_ino,
-				  le64_to_cpu(ri->i_compr_blocks),
-				  SECTOR_TO_BLOCK(inode->i_blocks));
-			return false;
-		}
-		if (ri->i_log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
-			ri->i_log_cluster_size > MAX_COMPRESS_LOG_SIZE) {
-			set_sbi_flag(sbi, SBI_NEED_FSCK);
-			f2fs_warn(sbi, "%s: inode (ino=%lx) has unsupported "
-				"log cluster size: %u, run fsck to fix",
-				  __func__, inode->i_ino,
-				  ri->i_log_cluster_size);
-			return false;
-		}
-	}
+						i_log_cluster_size))
+		return sanity_check_compress_inode(inode, ri);
 
 	return true;
 }
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
