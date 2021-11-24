Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DB7445B6F9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Nov 2021 09:56:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mpo4N-0004qQ-Nu; Wed, 24 Nov 2021 08:55:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1mpo4E-0004pg-UP
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Nov 2021 08:55:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WemCalX+7EDBOMcWPhBM2/bNeLH6FpIj4URthbedI2o=; b=lpFDIidE8+PSe03xTyob/MkRbB
 x15iTbcsP7EeXgNWi7K3Z5BBQGrS4Zd75wHXKnDSWk+6AmabUb5ujtWiINMD2IkWWOSy3FtWqtFSV
 M5UpwiylCiybBtjQfFIkgw64JpFbpSbgz1yU+TdkwRGv4Dp0qSOfaTQ4EBEyYZIpu8xM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WemCalX+7EDBOMcWPhBM2/bNeLH6FpIj4URthbedI2o=; b=a
 bFSBb+cCtUAz1JskC9rJwwkJsaVJeftjTco16K0AVuXyDVjtqMPCm3jIfeNlpHSiUfqxDnyRa3onL
 l0PYA2xNa5s8c1z6afg0L3fD1IvhGA17aRbURifUxgz4LIRrskDgFH4l5JQwYPCy3rC8QzuJ7jLDu
 oMQFcSUl1AayXtaI=;
Received: from mail-psaapc01on2098.outbound.protection.outlook.com
 ([40.107.255.98] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mpo4B-0002Rn-ML
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 24 Nov 2021 08:55:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KdplMLXUXQdz3LwPlXlKsxW0Bs2+Os6z4spg/50tCSGnC3qANxFdl6iY6GNyyWjaQEIlx42h9+b+k8aS5sgiqszIb6w55A+WQqbsqImA1s9eu+lDHqdD30cEhfbrkIPIxrTJaO3a+z93166BtO3as2Y7vA+6kA0bGDXTcISxWPTQnsucQ7dRtk9ir58gl1mIA82kVw+89XXLBMcxY/O3MnMz0lhergUuep7H1tTqwWn2DkOKoHkhPPKMHFVMdT52hTUuRCFPSs+H7k62WgtKvERA4nDxYKBk6MwKHUFPoU/m7u0viCWJnW8v2Au3nwy3I8X2HvYLy9heHqDgJ34sHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WemCalX+7EDBOMcWPhBM2/bNeLH6FpIj4URthbedI2o=;
 b=QPiEnuj9mOBMJDm3gs07YRZ+lo+FXwDZrRz1EkftWtMpOz6+NgL+CqV9XrYY/tOsi6l2Rj1gtCmQ6Ul0e0roUodsB2rjZpvSx3t9sYwCJTXZn3FMNC9xaQDlURL2sSAPMS7SlcLZfWfIf5wws0cFVycoWtJmIz4DZcUBXnqwq6dVM5G3AW7GyF4/Njs7wdefdTnjzgIjVFaH/xa1+VbHyNsDJhff1A6vB7DTN3+Yht6O9l9YN/ddZl1zEFzJUoHxWiL9XZx1m2rW0VaNF/W+J4VhIuujBQFFo2t9R83SJq23IyHrXdZzO392s+iTyHodV7wSlSHT4oZ4cyv9PZGR6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WemCalX+7EDBOMcWPhBM2/bNeLH6FpIj4URthbedI2o=;
 b=on66rCC0bFjPOq7Xwd0bZ23JbBgG8P3kNIY+K9/FD/WgBz4hNNAz2qx5AQ7niUYFzub9qlrPdrbG9sYtpDCsQ8QErTFsXdHKN8PmgWWOh2y2i9D7rkj39ZyIfV0bDFkAHgQfcYc3w2y8QOxYi+4WXDZKqsCx2fVQ1f7b+IjfX9Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB4014.apcprd06.prod.outlook.com (2603:1096:400:7::14)
 by TYZPR06MB4368.apcprd06.prod.outlook.com (2603:1096:400:8c::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 08:39:39 +0000
Received: from TYZPR06MB4014.apcprd06.prod.outlook.com
 ([fe80::3c35:1800:9c1f:265d]) by TYZPR06MB4014.apcprd06.prod.outlook.com
 ([fe80::3c35:1800:9c1f:265d%5]) with mapi id 15.20.4734.020; Wed, 24 Nov 2021
 08:39:39 +0000
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 24 Nov 2021 16:39:28 +0800
Message-Id: <20211124083929.259433-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: SG2PR01CA0155.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::35) To TYZPR06MB4014.apcprd06.prod.outlook.com
 (2603:1096:400:7::14)
MIME-Version: 1.0
Received: from comdg01144017.vivo.xyz (203.90.234.88) by
 SG2PR01CA0155.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::35) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4713.19 via Frontend
 Transport; Wed, 24 Nov 2021 08:39:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87e8138a-1c34-49ba-2574-08d9af25f3cb
X-MS-TrafficTypeDiagnostic: TYZPR06MB4368:
X-Microsoft-Antispam-PRVS: <TYZPR06MB43682A747034F68FA1B632B9BB619@TYZPR06MB4368.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3044;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eC8oi6acxQMoqBwJVbcIQ2SZ6RYZ1h7ECoZ4s1TiZNfzukeVdHFcwcZg5YeOVclz2AYtnfjKh+1UAnu0n5SSKoYhYvKm3Zvl1AJFIuq1MSJ5yi1VOh7rDFgWwGSjxHlyqWPX+ilPXWOPJkazzlQdg8BfV897kWtRdr+dFy8e5dX6aK7QKJJ/oLeCoLpuZ0RntfxB1Yt/Stveq9aFARGUBaRzUH9Q1uNYP4rZ3tKojVLNGPydOSuZJjLXFwM5t2xtQlPvXzWW/LG281Vby5djKnGc7HhQaFF4RYifA3ctkJo9/WCbnJOEIK/bmaH0EwRnQPh5VfhyGmf2Rd9Tca5wn0YDJ77XFJMcvsU2spfEQHkl4x6zUNGmVbDNdat3jCZTWCDMKYnQia33xkrQ+rQH0kb2SvKDdX7ahb3xteeMf/WThTMrdjgT4pK5oHIXUl/bH97BMiQgp/upjkVBUuGEzzbSfvlJ9hrxxsW/pl5z8qkRwXuRbiyq5UhON0vNfBXZVVjq5iQ2/DuhZxGZxBY5MHLi9YRQfa5AbMJQTBm4hAZft8qUdb50T7/55bZEQi3pG/YE3CHMx515rGU4qAMi8fVIXlzM6UCAmqpktm/7Z5qd0Pu1pytCnnDaYCQqJIsd8lTia6rluXhyRyn4c0hYhVj70EYVS38qVFiMu+Y6fQ+KLP6/6PfJFuvr8hNduXC4mXINNdIj4Qv4BmTNQ7qpjpQa2CFzWTSsimo/0pRIFH4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB4014.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(8936002)(6506007)(66946007)(86362001)(6666004)(36756003)(8676002)(4326008)(1076003)(2906002)(83380400001)(6486002)(508600001)(5660300002)(38100700002)(38350700002)(26005)(186003)(316002)(2616005)(956004)(6512007)(4744005)(66556008)(66476007)(52116002)(107886003)(182500001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fLVQO3v2pYCi6HmqbghmB+VuEe3jX1awe8VQCpaSlsjgD8TF7U+zMNNeIvkg?=
 =?us-ascii?Q?GS25U0KtSSojRd8489JvwAa3oY4ch13kPzjQgR8qeY3QDwAEjpxq5el29yoQ?=
 =?us-ascii?Q?hMLbubOZiC6niCl0TUUMe3stFEXYCk/sIRPcc9HQXFpLvtyJ7z/ylgFU7CWP?=
 =?us-ascii?Q?3wZqqL4r2o4O25A9yrfmMBZv6LMkJGCPqtYHTOc/65zfLwZ1F1YDKwusrt9w?=
 =?us-ascii?Q?lRhcKKYlLdDmb79VbKYuct5SZH9fOu29S6rWxSX5mvf/02chNcERrlm8y1hH?=
 =?us-ascii?Q?0SddPa3LZUQ5uvBs133zLkTgxhGQ/EC0HklYzq6jYMoHQgSPbX5n9BNPeGnG?=
 =?us-ascii?Q?hQ/ExVKOLQulEF04P6lOPzZ2sDoXxQiqMcmZFsmM9dTr1URi6TliAi3l+SAa?=
 =?us-ascii?Q?ZMDiLAoqHJAqFGE5DhbBAefMuC5jOCmhrNbUs6n5YjfrE8uxhqO6NHrBwH94?=
 =?us-ascii?Q?K/5tgaqsOJDKiLOx5m5i4hTWA4phTOch2/Sgv7csRiD41i1Rt9mb1nUyFqft?=
 =?us-ascii?Q?TSsl5jehA2NvY9OahG3ZcGAffYypkQbwVtPsi0GoszZ+Ijy8YAbSOJztbRMA?=
 =?us-ascii?Q?BqzaYF8RjcnYnHFCODmQYFFuUlayzJ/2okPTaYmxTUZcjkIt0sp1FXn3EZOz?=
 =?us-ascii?Q?cAw4dnEmRVvOxZtkW1H4aGngORnbTY6xFtO/dJ2VckoeyzIouY2QilrnGyqn?=
 =?us-ascii?Q?pgHSrgbIAV34G5tgnNQSaojcfpVjBYrSSLroF15mrjsMCAJaxOBS6dzFLu/H?=
 =?us-ascii?Q?BN5dxKegfjPYW6/O/kPm5YjflkRdQmDvPc7Vqy6CHjwW7oYQ3rfl9QriN85B?=
 =?us-ascii?Q?TtPmvsvMb1n+kR+aozkTlGKaumOGEOXtElGXio1JmTGMK1wq8krMgj7A6G4a?=
 =?us-ascii?Q?TOjewjQ9pQk+uxnMfSolY3x5zRlHnYdK8iIK9+LNM8g4VhHmeZtgtGEFBRU1?=
 =?us-ascii?Q?dXYnCak/fDdUDtkVXJno0ppiFkZ+va1oq7FO2Y6otcR2emORsGgvqdymyCse?=
 =?us-ascii?Q?4C0Ql0WSlBuaz+SGLJXwttULOvz7Spdc3DcGHg6xw+ppwX2gHukgWRL27aiY?=
 =?us-ascii?Q?ag7BEWbvI7tWoltLg/c70SwlnBWN7ZgTxvx1sNm46kGYfW70znV6gwQ4AECU?=
 =?us-ascii?Q?UFqK0Ec09RjNU+nTBUzgmr6rnq8vogB0WGNsJ36j+hGkJw0LoG1LH6ch77U2?=
 =?us-ascii?Q?Hws362dJ7GwSq7D4GNvgxW1CSNlJupORnlhDSYespVr3KXL87NjDHl+lD1X9?=
 =?us-ascii?Q?qWAcZenNmvhT9Worqx2v5wq9f8yffaXbft5qDoK5c3piOclrDAe8s1zv3adn?=
 =?us-ascii?Q?7+Nik9hNKgLchH8Bm9qH4yOF0IIGyvYNDSQU+2zoUppvqNILs5QfBG9Ef0DY?=
 =?us-ascii?Q?h7Df3QbN056PYZ6Qkrgq6P6rRm5QsZJPIzHRS605D2aUxBcRv2rO8uYJfATa?=
 =?us-ascii?Q?vfPUZ8Dy9GzrIAI/Bfu5CQlpwbvUEwVyc9F5AqiI0AArnDAofjwi4HFMMHOD?=
 =?us-ascii?Q?C+DDOv/Uz/RgCRZ2EZQ5lxxs2O9Q8NKM03XzgDM+7b5szKX60YDZE+h8019a?=
 =?us-ascii?Q?gLdpM8j0ZBgzHdEume7TBXxnU5CT4MASVuNXQLeypJBu3S0ZtKKvRAoxhLZZ?=
 =?us-ascii?Q?QFzY3CxEYyn678Ft4q03nJI=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87e8138a-1c34-49ba-2574-08d9af25f3cb
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB4014.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 08:39:39.0156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +tGSEmp/r0VR6ZMPHwCm/+DH9ftgoJRQ2Ks5HC9svDXKjCNFD/71O8/eGm/lBlmWU76+wE9MCLjjSMXl68WBpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4368
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Since compress inode not a regular file,
 generic_error_remove_page
 in f2fs_invalidate_compress_pages will always be failed, set compress inode
 as a regular file to fix it. Signed-off-by: Fengnan Chang
 <changfengnan@vivo.com>
 --- fs/f2fs/inode.c | 1 + 1 file changed, 1 insertion(+) 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.98 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1mpo4B-0002Rn-ML
Subject: [f2fs-dev] [PATCH 1/2] f2fs: fix remove page failed in invalidate
 compress pages
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

Since compress inode not a regular file, generic_error_remove_page in
f2fs_invalidate_compress_pages will always be failed, set compress
inode as a regular file to fix it.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/inode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 0f8b2df3e1e0..7ea76784efcc 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -516,6 +516,7 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
 	} else if (ino == F2FS_COMPRESS_INO(sbi)) {
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 		inode->i_mapping->a_ops = &f2fs_compress_aops;
+		inode->i_mode |= S_IFREG;
 #endif
 		mapping_set_gfp_mask(inode->i_mapping,
 			GFP_NOFS | __GFP_HIGHMEM | __GFP_MOVABLE);
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
