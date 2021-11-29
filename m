Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 025B6460C93
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Nov 2021 03:14:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mrWBN-0001xP-JK; Mon, 29 Nov 2021 02:14:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1mrWBL-0001xJ-Jd
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Nov 2021 02:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SylPzuA84JNHkLs4Z10gR2ytt1bbvuCKqoMOOnCVqB8=; b=m30Ars084o/Dx8GVspidpwRBIY
 JhRYcW6uFLFcjJeU7dXPMtVEkdihKlO5YYmgJsDtSvIzyzlpwOhqTFv/lwhbYzvBnTyKhMaCU0amh
 WPn4MzNff2uZcO9SNZZa/2RDES+An9iqyTBUQBq+fBQzAmCob8fJPpCmzBz4Qm0oT7ag=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SylPzuA84JNHkLs4Z10gR2ytt1bbvuCKqoMOOnCVqB8=; b=RgFaOdsArVqp2OTo8YEQOReE5V
 jTTw6taxukYc1dkuQgCP8CWxIYNXeCfqH+4f+fUHHvQZ7ruwwccowqpdPu6IaEFS9N+49E/OqcnYb
 K+8naZnA1FxfZ3Jmrx9VyAbNO9aVaC+0Bq1BwC0+PBl636WtB3uri8v7jbhJROkeCW9Y=;
Received: from mail-eopbgr1300101.outbound.protection.outlook.com
 ([40.107.130.101] helo=APC01-HK2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mrWBL-0001Kz-Uk
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Nov 2021 02:14:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=E0+/Co8xssEg1bPplTZqeJJ7bv037WfDEm0yLpWkaTQidfJLdQYX9Y6E70nIanbGLV9p1cKq2FOuyID4IGc6TTDrTLVbHFXagUPd3P827ywNUAsDd+v534eZH2/VJiNzRUQMLA042oYv2wUXAxt6uVPNFnweaSpJ/29TcSyMph2WRhmtATHy95/1jUVHxo5xXt6e2j764ELYVPW7ZQlqHfKAIO3lx8QT+AP8zuEa1rwC4QWXuX8rPqXDnnEvZ6oIJT340/k3xbtXQS1tf3NJg7+JAWnaBcWnB6nIW01T6ap7tbi3YtHsZjKq4jsdHL0VhSqxGYO3nCTycL3586yYDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SylPzuA84JNHkLs4Z10gR2ytt1bbvuCKqoMOOnCVqB8=;
 b=lMRY1y4+vilUL27ZYwOS844dPd72droj3IUBPwScNCelcg5b1V2T7QZlNAcFiKwkhQsmMY/nMr3UnlzXvi9VaGIGBzr5QGXJUSdBx3iicToqv8PnrrcduEcaX2H8kGz3Qif0xGjpPFON/O6CBtJI2jG1YPO3Hkc5M4F9L+S70bllL4fFZR+xzd422UvKMcEqiXy7Jtp0kP2+tYczkjBDEMkd7HHtUnS6knxSsjoA2UPo13R1YAPauQDyPgkkWZZQTNVlbxs7KyHfXlUuUE3IFYU4azkMltrDDBVBfWsU7u0/+E9ga1ArFtlYUWPAoZT7UhTywqIl/s5JuHHY+b977w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SylPzuA84JNHkLs4Z10gR2ytt1bbvuCKqoMOOnCVqB8=;
 b=Fg5+cSOxuD00ceBti6v6Qfdy1VUCW7DccflPOK4GXZ71bXtQ6KdQWfgIH3pjt4BJgl4JDmYeC9eg3bV8Qd9BuqWyZ7vL+9046bjNrFH4CALKNJnY3ml4wpy54+rlBv5MLe5eDNeiAv5KWAaEA+xrHTpXr0FdgXQVH7T8AKEYUvM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB3767.apcprd06.prod.outlook.com (2603:1096:820:17::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Mon, 29 Nov
 2021 02:13:53 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::2598:abcb:1fca:a01a%5]) with mapi id 15.20.4734.024; Mon, 29 Nov 2021
 02:13:53 +0000
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 29 Nov 2021 10:13:41 +0800
Message-Id: <20211129021341.162422-2-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211129021341.162422-1-changfengnan@vivo.com>
References: <20211129021341.162422-1-changfengnan@vivo.com>
X-ClientProxiedBy: HK2PR06CA0017.apcprd06.prod.outlook.com
 (2603:1096:202:2e::29) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
Received: from comdg01144017.vivo.xyz (203.90.234.88) by
 HK2PR06CA0017.apcprd06.prod.outlook.com (2603:1096:202:2e::29) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4734.20 via Frontend Transport; Mon, 29 Nov 2021 02:13:51 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d662252-648f-42f3-af5a-08d9b2dde32c
X-MS-TrafficTypeDiagnostic: KL1PR0601MB3767:
X-Microsoft-Antispam-PRVS: <KL1PR0601MB3767E29B9DF044A25AB657E1BB669@KL1PR0601MB3767.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:169;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BrIREXV45/9Uh446YDoLFGW0u+xl9FkdAaR6FXfbDwOGxNfZLf7B2znnRwzR6fNJDu1ESbpCYTvMTyLcwJmGf5JHl6JX1CtuamD0JUvTA81DmG81q5Y7asgMfmmILnRcXpKfyx5ysvs4fdrAUlon4oY4bJys8a5ZJ04GzmQ86Yn108K9xzkRmQR6S16zCJaM2h8vweDmj4v7kpfI4sv3iP5xMQkEpj15z/UdR2XRYJv6azRAI4kAP9h7QN3k2HIinlynYbyozMw3BTKgyZSApeKnl3fLCxAKlq0n9gR+GEqbipUZ/i674r4QQCAkJoHxxS9X93L/5tBl5/s21pdMF4MdWo5T8JJXU9XVmCdefrnxNxsVl8gKRow+SEaily5AwH3fXOWmGtLI9d8Sb3Kj8JF/xwzVM6cYUKwpfWDuYfns1n51sRY7sMdbV/DBeZnyV2VGBjmZKheussiPVHNB74b+AvUUvGIIwbxPthR3+X3aN5FxfAf5SWCBUziLrXIIvhxfXgn9w2yDLx51vt/J+WukGgeSry5IkZDKahwjngL7tpJh5j8nkDNy9j+nRycERWwPBB3Wtk4qzdBWbLgn+j63IxehJZQ8sprA0gIjK1AUWIwOqv6nqIgOUCOXaLesRXzdtTgFhslNTsQmQPU38vfl8JI8ac4CmTNuGfczbBRyC0ot0VUUEsGsdOCXiLUZfiziY2Vsta+OBb8rsNG5juDrML2d0Bk9S7JkajwJTqU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(316002)(6512007)(6486002)(36756003)(83380400001)(2616005)(956004)(186003)(107886003)(26005)(38350700002)(6506007)(52116002)(38100700002)(2906002)(4326008)(8936002)(86362001)(66556008)(66946007)(66476007)(1076003)(5660300002)(8676002)(508600001)(182500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7cOy9Kb5JhHMx9jdilxEuuRfH11hScqkzPxTSvefjqBb3FJn4B65bOcG5zeh?=
 =?us-ascii?Q?at6k+gUG0ff7OIeaMT/mCtLTb8PExSex2XHa+usmmvw7c5by5rJLGZ6Oa/f2?=
 =?us-ascii?Q?GBMVm04HuRPxt+HesKX08E6uoWgIoltvhBshitqdYp+0TQC34JznaFDrWVe9?=
 =?us-ascii?Q?unS7YVeUyiIszEJAgWpSG4XYPi5wISHaIIZWvbouhp7QZk1Jh86oP+++Y3ag?=
 =?us-ascii?Q?/KsmQTmZw5TO4uJpWP7H2NCl30g1fgJvdQ4VXuo6x/OUARG8AJfxhv6tQ0KI?=
 =?us-ascii?Q?BXK9FPAkyglDOcSo/1wV23HaTAuBwR1UljJxXS9/JwGPoCUAhz0zPKQryUvh?=
 =?us-ascii?Q?XXJhLIQmTpMO/Ue6cDVdb/C6OrFg/cznPya23DjySsAYMwJRM37UYhL0xi0K?=
 =?us-ascii?Q?qkUpAzx2N6i/ZZTquequUW74czLy42XzcixnjyML7UUS/qM7SWBuAjI+jEth?=
 =?us-ascii?Q?Ly1FL1lLx0zpEVnXosz2neAfBrTevEei2tV8661Q2kzivl37sBKgOkFsKsTF?=
 =?us-ascii?Q?7nQGScj0BVRm4TyudaUwyOQVx7cojmWaqhQ80m5auaJtCO3IM/sK6cwLF8F7?=
 =?us-ascii?Q?5rzvklAv8UD/bH3ceJ0AMEjDJw8IdaKH+F1tfwgMJjdrHHWnKjoJAfpuxzo9?=
 =?us-ascii?Q?RJOk59wQc/bn//C9/RGhWk7xQH0mT/83h9eJS8GlIxM0Fn2KngSf92RVienW?=
 =?us-ascii?Q?w6dM9XYigc+R55swTy8pQJqHmR9vjKJ5BBdrZcLUvTMeyv9hRVxmGVGK8OEu?=
 =?us-ascii?Q?/cCo7Jxuzhzq0J6LlFMJUUE8MjGqTW9i//ov8+TnRhgDzcL5hW5Zz3Lk6FPS?=
 =?us-ascii?Q?tOf16TOdR8iPYFjmizZ+CBxjuowI3ID1QYw9v3jLqf3HgH6RSLWLXB885lJq?=
 =?us-ascii?Q?OeLAvdy4bOD4CmVH6MiHRQND3maW94WH/WqDHjauX06ivMgz0B4YaKQkBWtf?=
 =?us-ascii?Q?YiHsgtzAM2W9pJCZUbbJlJWldqXKkdNz7aiJpnM5OG9xGAQWjyRhJyQpORGN?=
 =?us-ascii?Q?VCRK5kgOfgxk8mIU2ORjm9QjAfxknURrvNdV12mp+Uc36SU88l7jZAalynLk?=
 =?us-ascii?Q?3Q6y8JPAv0qLaItuySY/lm1XxK7QgW4wNWfDDMArZ+kMZPyZ4P19Z+2U6BCc?=
 =?us-ascii?Q?Kg3W7oOOU16ubRj2oy3IieYLqCeWehhpE9FrLN3NwiEAPQzgJxK9mSu3C3UJ?=
 =?us-ascii?Q?suG0wmNg436+OjhfVrgaPXvfH29VYLKrQOoMnbUS5Gn5UAdhpp+GrJPoC7IP?=
 =?us-ascii?Q?viZktnDH/nowm4UXHALHU12dTpa0Tf+BHi8bqZbdBethPH7JMS1GnXlmFFNm?=
 =?us-ascii?Q?eb+/oJGJ/08x+ZL+k0u97G0ARaKjK9LWw6V5WZTUb52/Wilni/nrqqEEH9tz?=
 =?us-ascii?Q?Wl4E82RHYXFxeB15Cw4jihXPW55Z6hZNe8qp/YHV4kyc2QCBFgXjWxt1aEuc?=
 =?us-ascii?Q?L0c0xal/sJaPaRX8tctvH2a1Ygh8ifJkWNkIx/Y1pWB67lOx6R9ZuoIv+aFl?=
 =?us-ascii?Q?EOlpVNxZvK+UcRhmpVI/CxFWnho+w25VJ1OyTjbkPQx1AttPCXy3jMSvWWah?=
 =?us-ascii?Q?4Ts25UI++JriVavGrIMUPVAGb+Hb/i84v9w06kmRmG4JQeYG7kOlAiLq/JWc?=
 =?us-ascii?Q?1p2otZa8D+xbkFl8RxhHDrw=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d662252-648f-42f3-af5a-08d9b2dde32c
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2021 02:13:52.1037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: itQ2Hythz6PzERrdEm5ChdsuQEWWbqpniK4Pcyo7CFQVvCxkXpgTC/qgNhBSCg8sc2FpFhu5IlEn9BexMBa8+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3767
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Previously, compressed page cache drop when clean page cache,
 but POSIX_FADV_DONTNEED can't clean compressed page cache because raw page
 don't have private data, and won't call f2fs_invalidate_compres [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.130.101 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.130.101 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1mrWBL-0001Kz-Uk
Subject: [f2fs-dev] [PATCH v3 2/2] f2fs: support POSIX_FADV_DONTNEED drop
 compressed page cache
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
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Previously, compressed page cache drop when clean page cache, but
POSIX_FADV_DONTNEED can't clean compressed page cache because raw page
don't have private data, and won't call f2fs_invalidate_compress_pages.
This commit call f2fs_invalidate_compress_pages() directly in
f2fs_file_fadvise() for POSIX_FADV_DONTNEED case.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/file.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 32c0bd545c5c..20f44cc8dfd1 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4677,12 +4677,12 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 static int f2fs_file_fadvise(struct file *filp, loff_t offset, loff_t len,
 		int advice)
 {
-	struct inode *inode;
 	struct address_space *mapping;
 	struct backing_dev_info *bdi;
+	struct inode *inode = file_inode(filp);
+	int err;
 
 	if (advice == POSIX_FADV_SEQUENTIAL) {
-		inode = file_inode(filp);
 		if (S_ISFIFO(inode->i_mode))
 			return -ESPIPE;
 
@@ -4699,7 +4699,13 @@ static int f2fs_file_fadvise(struct file *filp, loff_t offset, loff_t len,
 		return 0;
 	}
 
-	return generic_fadvise(filp, offset, len, advice);
+	err = generic_fadvise(filp, offset, len, advice);
+	if (!err && advice == POSIX_FADV_DONTNEED &&
+		test_opt(F2FS_I_SB(inode), COMPRESS_CACHE) &&
+		f2fs_compressed_file(inode))
+		f2fs_invalidate_compress_pages(F2FS_I_SB(inode), inode->i_ino);
+
+	return err;
 }
 
 #ifdef CONFIG_COMPAT
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
