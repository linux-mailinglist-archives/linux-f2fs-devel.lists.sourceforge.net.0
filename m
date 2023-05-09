Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28F016FC350
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 May 2023 11:57:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pwK67-0002hY-Vn;
	Tue, 09 May 2023 09:57:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pwK65-0002hQ-Qq
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 May 2023 09:57:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ciyak4ApemOiGcAYqhdzZj7ZzKBroG9JAocEbmxXWn0=; b=gFbDEnKTzBV7Dm0we+38TbyAOQ
 LaQ1IXHw8O8bJjQYLAq8HC+CYtErwx6uwoiPyN9NIR20JHO0gbe/YvzDfMKRK1mmJSPQXvEM7ZDfz
 7l9QFcetAZh8aHLXt9Y/Q2fIOSljw/2bVZXZW9UN0nETu+L/B1G92AFshOrJ2aV0orHU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Ciyak4ApemOiGcAYqhdzZj7ZzKBroG9JAocEbmxXWn0=; b=i
 lUGOK9RRGZVUbgCvBRS1sm+9OsgC/V7woPzGTPUCH6lR4zsK8hvK4lNjs0ISk3eXH2mU+jmk3eZiI
 0mlaTaZ3szybKMvKYM6GIpUadpIoKcP1UBX9Y/L4XkKjXvRTZpEEZiN1YPJVT2BNhFO8gU9x0ghSu
 mUl+9TDlV4gqiAOc=;
Received: from mail-sgaapc01on2107.outbound.protection.outlook.com
 ([40.107.215.107] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pwK63-0002HH-U3 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 May 2023 09:57:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sq+qFWuNWEQBQvFy3CcUgfbVuQSIv4jJzW2f576cy3D9N/+TkW4h/q8MP8GkbdYgPjfVZdoT4B45r32Otf3os57b5kRHML0/isyoPhN9KnmjcmQWmbBzR3bnPqnN3xjKbV2a3aVvPCOESh6FZg50i9FErkuTlAvLJckU+QZUjF23vmZrcSDJMOiTx/CN1/kvOI07reWvVnmCHVbfLhtBRQ2fKrRvXv5X7B9Y5iGpUdaOIEJ/QFOflBcUqKLel3sL+OloafVX+of+d18rMinC4x1jjRRkNEb8g0fzzXHQn3bso50CggdHWNKPdJ1MGrqyuH0GP3n/9FpHWVBbKVAdcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ciyak4ApemOiGcAYqhdzZj7ZzKBroG9JAocEbmxXWn0=;
 b=I5TsMZdjLymrHjM9RFJ0RddAcFE0LFHJFrmsFWWS1wOgav6gSf32wu3+Porpro+w+qCWH+13csGxTL4SukXYB82Q9N0lgTLGItUvT+CvxdcU9MwG9kL5+lMnzT03/rX5qs9sbwZ6nj0DzEcwW8rYJ32ZaCfH7iIV4GThHPZHD9hEwd10wY4A6Jwz/3EjwGMBsXDt12H64bIWfLgriHpK7/5+vCJWF/K5uzv3GWgKKHvTbCP1Pk2kUKjbKOBKpUYkCCF0tXA6uDGzO92v/SogAhvWOm6Thdhn14gbrQQJwKLbpfvhYp697bs4xbAecr7oXdH/Wv6MnNR1i8nBAH8xAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ciyak4ApemOiGcAYqhdzZj7ZzKBroG9JAocEbmxXWn0=;
 b=LhboLZJiiKE654Cqllo5dHACjMqaEhtmZz4sDgGquc4hkPrxJv4Xf/rkTC37izovVAxYMeoJ3mGUydoaGIKP9w6MNEINS50NOyGFaXhjo4GTwGBPgsy8+K2qtUtYo0oXcxLQ0Zn7ltXSfhwAgetO9NcBB+htdeQmvFQdGiPhG1GGWBHJQGRV2IpjU6QZdYWdC9tI1M8W1l2W79r5NwfiOMKKZvWNUaO7CcNRI0X0rCjP6Zyk0Ju7y2D+N5cjeWu9L341ytw0sh/Fzz5ACIsbjuNZeRN3c1YG0xFXyI/x+PTh5UQ/JCB5sC4f70dfn5HInPDlFunYYGw018S6F6/WsA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6130.apcprd06.prod.outlook.com (2603:1096:101:db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 09:57:18 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%3]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 09:57:18 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue,  9 May 2023 17:57:03 +0800
Message-Id: <20230509095706.17844-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: 1487afe6-a0c3-49d3-3b56-08db5073c5fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 1yZAKTXTaPLt9jt5/Rjgay0t4Exuvr7XR+YWbZ+LKHt/2JXL5TJBLOByru+QamP/5YRR1YFxpRr4dqcD3rZ1Nim+vJ2mcVHSDZj87WfAg1IMEHEVTMViccfCCJEdyXtPURfkStVjV/8nE7LdGYTxbn5FMTCDQhNi42ZRZLPGEl5RSxJUh22J6zXGWdGfzbaAOu9akqgrwApuw2Fb7NLtyqBRJVH+ogSXFClICxFbgcuW4sa8/j06txZZ53SgfDpVCapIAIZaAkzmry25ZWIW65foYW1+csR4AWR8FbvAw7QvfLs14jwYn5yq5x0OmrH+87sZv9d1LPkzArf0gHrNJbPgeZLaer5bpDBIe7tvIX5nDICX28g490AK2qzHdpQxPPcnoiQKe2DfHr+eg0d494NTPJVa8I3vjFlZLZLEifrq6JslvPOru4o/Ta0Qe9cbbtTYg82Gsst+LerZX4XltIXaGU5ugeSr36fTOFTAwfAfwtMg8xf35FDDbRT4QtEP7BoCZ53zhAm7+fbE/ur0GXjPGt+aBZ2yFRSYWYnlO07Ode/NPCqnYV1RuAlO6kEaZzt8HjCkotq/P84NNWmv2YMRGjDitijnExzrwEZqU/A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(451199021)(6486002)(83380400001)(316002)(66946007)(66476007)(66556008)(4326008)(478600001)(6666004)(52116002)(2616005)(6506007)(6512007)(1076003)(26005)(107886003)(186003)(2906002)(86362001)(36756003)(41300700001)(5660300002)(8676002)(8936002)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KG251XEDqWAwpwIrilUHKd36dPcuFVswOyVSAsLbMHHePsUzqYJlcUgPg5XL?=
 =?us-ascii?Q?Wv00JQlq3xZ24gH9DR1f1yOiZr+s2LMxuDz4HlYZvDapaYtp9FMVJ8/VB3/P?=
 =?us-ascii?Q?r7z5PA7z6h2tyaEXWTdQSwSKLHaBmFifqlHKbxXPGSce7Jw17w+ggNq6CKJq?=
 =?us-ascii?Q?JA/du/2G4uvJPPTx5GQ0eFeVOoXBXMb3RlKlFBYbYekAm9gN9ID7hBHM4+FX?=
 =?us-ascii?Q?lFwQ4wpQlBO+dAKkql+/72CiALHEuYR6DqGRI1jm9MqeR0IA4q4DBIUFNFXB?=
 =?us-ascii?Q?YtEolFHgOXWkKqfGF6cbuDZFFN0jSXBB8WWhoCNgoX6MYpLpv9sTe+9FFT6m?=
 =?us-ascii?Q?+cRhhT40JmqiclVRuxrzXYHM/u62g8wwo97oURUgRKzEcuEPRTph3R99IbIe?=
 =?us-ascii?Q?x4SofTx3LQ781VTchHqZyTZ3OMHtOClHumBJP7+oxA/YX82RIl6/94P3lnR8?=
 =?us-ascii?Q?eS7Z+kXIme78nycVhgP2pUOJthU7VLqCRf8ocHVSYoqsu3Rk3Mg2G4GEgfts?=
 =?us-ascii?Q?MuG27EBhhB9+k3ggMrnjaB5MrWgRTxrY6udJroMVnyuUVfare6y2xeFxqJYO?=
 =?us-ascii?Q?jvVhdrgLfAfDP7Oh7dCDsRZY4jYTSOPxaguePZys5BdR2FJFDR6LJ9tZ3Ew5?=
 =?us-ascii?Q?kuosKpZMcXxUXL177VxtMhRja/rN2PIvRI3KSZGWkPxrIEha/ai8nDfw2dyR?=
 =?us-ascii?Q?ZnPsQm5n7AfpforV5OYy1tVU0JNVwWsdJJx2sslUQbopHUDPadid+sOeAWHY?=
 =?us-ascii?Q?0on5dO21kqXhLmwX28ayPSv31SddDciSdxFIvuq496qc/pX2z4NAWUoH2VrW?=
 =?us-ascii?Q?qiQesZegFSICiDJ9dLbPbxSynsH4Z1c7ZtiS9TRIq1IQKRkx+J/bENV/x7se?=
 =?us-ascii?Q?BKMgDjD40eweas8LH7j0gqYksns795byeutwT9OIlg2mBtbGPyXvn0ovtXu/?=
 =?us-ascii?Q?9JuBpPvl3omQ87Bx4g/aVHw6Kqne8bZ3IvngeLGzpakSOtqCu+4/DU9dw9k6?=
 =?us-ascii?Q?WAr5psOvaa+FpVAnX/9YJyoPpG2qEiSoc5F14Uy9om2p/kYBzM+4cNBC/EaS?=
 =?us-ascii?Q?23YkUd1mx70jStb1OkAGZKgz42JL0RczFXHtEQDdVUvqbmP2y8RE7bDw9sqq?=
 =?us-ascii?Q?IK5nPQV0fvi9oitDshxa9ioFmHTMW1hypOyt+j1EYxBqTR2L8rV5OekRSSNE?=
 =?us-ascii?Q?QPQ3cSyf+S38j5V/bSVGlwpWsMYHLkpj7wikGfLUVOwJsYOK7e+/yxKlez1C?=
 =?us-ascii?Q?nBGVqNWOe4Zn6hLLPczpBRKNRgnayNhEQvOfIMISED7zxZseNIfcDOpFoBjE?=
 =?us-ascii?Q?W/riK1DM4d70PnLhINi6qw1rzFqYPuXntuYi+2NMO6YNCu1pU+gAHruCIdxZ?=
 =?us-ascii?Q?m55n/W9Vdd69abn7SEQj0vfo4Bkcq6lqxpCaF41MGwtcRjGKejhWtRTgr5Tg?=
 =?us-ascii?Q?Is/Nc2/Fr6wydF92np3OsaQhYK7/dEhojsMJiI+OZ6YNCUu4SyfsGde0BC/R?=
 =?us-ascii?Q?GI56DZtEkksiQX+g7fShYbzIGnKEQlqV21M8V6FRjTH1Z3yWUjQARWc+xC/Q?=
 =?us-ascii?Q?TU/iKyZ6JspmigygrswDQ590Tw9WtQa6Cph6vqMk?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1487afe6-a0c3-49d3-3b56-08db5073c5fd
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 09:57:18.1483 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0rjJCbHO8V6pibiP8z4k7qbBgLWCO4H7/nYJOdP4yVxNTfkVbocYHICghTMdtTPoxABohW1NfDhKG4V/tYelCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6130
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: F2FS_I_SB(inode) is redundant. Signed-off-by: Yangtao Li
 <frank.li@vivo.com>
 --- fs/f2fs/file.c | 12 ++++++------ 1 file changed, 6 insertions(+),
 6 deletions(-)
 diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c index 0dbbcb406d3f..6f8936ec689c
 100644 --- a/fs/f2fs/file.c +++ b/fs/f2fs/file.c @@ -3466, 7 +3466, 7 @@ static
 int f2fs_release_compress_blocks(struct file [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.107 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.107 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pwK63-0002HH-U3
Subject: [f2fs-dev] [PATCH 1/4] f2fs: convert to use sbi directly
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

F2FS_I_SB(inode) is redundant.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/file.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 0dbbcb406d3f..6f8936ec689c 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3466,7 +3466,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 	int ret;
 	int writecount;
 
-	if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
+	if (!f2fs_sb_has_compression(sbi))
 		return -EOPNOTSUPP;
 
 	if (!f2fs_compressed_file(inode))
@@ -3479,7 +3479,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 	if (ret)
 		return ret;
 
-	f2fs_balance_fs(F2FS_I_SB(inode), true);
+	f2fs_balance_fs(sbi, true);
 
 	inode_lock(inode);
 
@@ -3636,7 +3636,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 	unsigned int reserved_blocks = 0;
 	int ret;
 
-	if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
+	if (!f2fs_sb_has_compression(sbi))
 		return -EOPNOTSUPP;
 
 	if (!f2fs_compressed_file(inode))
@@ -3652,7 +3652,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 	if (atomic_read(&F2FS_I(inode)->i_compr_blocks))
 		goto out;
 
-	f2fs_balance_fs(F2FS_I_SB(inode), true);
+	f2fs_balance_fs(sbi, true);
 
 	inode_lock(inode);
 
@@ -4046,7 +4046,7 @@ static int f2fs_ioc_decompress_file(struct file *filp)
 	if (!f2fs_compressed_file(inode))
 		return -EINVAL;
 
-	f2fs_balance_fs(F2FS_I_SB(inode), true);
+	f2fs_balance_fs(sbi, true);
 
 	file_start_write(filp);
 	inode_lock(inode);
@@ -4121,7 +4121,7 @@ static int f2fs_ioc_compress_file(struct file *filp)
 	if (!f2fs_compressed_file(inode))
 		return -EINVAL;
 
-	f2fs_balance_fs(F2FS_I_SB(inode), true);
+	f2fs_balance_fs(sbi, true);
 
 	file_start_write(filp);
 	inode_lock(inode);
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
