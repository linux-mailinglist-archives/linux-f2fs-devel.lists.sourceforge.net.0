Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE1C4DC29C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 17 Mar 2022 10:26:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nUmP3-0004OE-AP; Thu, 17 Mar 2022 09:26:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1nUmP1-0004O8-Jm
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Mar 2022 09:26:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WgZ4aMb8TSJiJ1o6IHhU9Hw0qZ01MMqa1ax1GVcSVWg=; b=GLgPkTmlYShDvn0yMwn4Vtky5i
 zVWxzB2bcISF7LsAYA/zpZmARu+I0+hE2CViOHEWgE+Zw7Zx2DjiQr1u5wpR7+2dWpdKBYdIqVKYP
 wCwH1TLXdMkY5d3Y1XyyyNRTqvCDkhUf9wDiTIY8NbykKyT1sinuEhWVw1HDfbPu/Km0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WgZ4aMb8TSJiJ1o6IHhU9Hw0qZ01MMqa1ax1GVcSVWg=; b=f
 qDacshZwNI9C6QYLFPxqn4EnAE47VBujkCo7aLwqVaX3TctU+ZPuobcaymkI9AB7sCVhK07ETiTID
 Mo8oJ9tznpoGhv2XiH+7ZfIzKNA8+U/Jx17kznsrpstKtjCVKkBP11kHVYnjqlLrXuVizLeNGz+Cj
 T/FhKNb5y17IpJR8=;
Received: from mail-sgaapc01on2094.outbound.protection.outlook.com
 ([40.107.215.94] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nUmOW-0008Gz-GA
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 17 Mar 2022 09:26:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UtfXEbIQ6iK5e1keEMWCeQcxOo9Yaf6Vq0j2uHZFQB13XskuKOl9KF58ScXTstwZ52E9SgHou7uYEGsIkjjplNJb/QYuxvAS2+3/UQOov2ND4usNs4MreMTl9hxEv3C+g1nGqK0X/vF19jirvHAGbEcPf4qZ5Ie5PMmoM2FYGPPe3VReVr0lSDve6ZVtOF1+02O1/Yea3PPBJbZsZKwfJeL1ih1KGXIryn/pblZicFNXme2JN4hZ0XV+SYkCPCJjIX3S3KxJBEiU/a/NkVH2ubSZtrQxH/Jt+mGx2gpYAT449wm2XV+8Yx+Pk3rVqBEyjV/suQpkaAda0s/uXYEgfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WgZ4aMb8TSJiJ1o6IHhU9Hw0qZ01MMqa1ax1GVcSVWg=;
 b=fbdaW/xaQwYXOlyFCyh7vwefUb8k9C6q/wvgJUXAYkMhiW/IYuoM+FWIdx3sLgnKlE7t59G4PHdwO4dgt8jn9Azi4mr6bSnCBDQA1r4FCSoSxnOtO8dmscuPrIQBHzafHFnMcwDetEBNJuxDMj0DqJiOzpTykXQWsM4GB9QJy7g1sT6lJtKP30mpbDiLvkE0Pk75dWdF55Le8mwiWCVogHg3BILPQWyKBIfITdKDB1hABw3BFBBJXmSA484dg5AGaPGYMR6TFM/uuMj2zMgSgD1NX8m1bTZNdgZjVb6kZYV50ba9YmAcbuRAtCPzw/ZDW/9+EpnJZPGYRvkXgcrF8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WgZ4aMb8TSJiJ1o6IHhU9Hw0qZ01MMqa1ax1GVcSVWg=;
 b=el8s3zeBR1o4JsOoYcbnwzv1uLA53qVo+1iXyga+7GFHSUncvj3AElc1h9INkKkx5J55HyrHBM4/U3L59rkVUi1E0aslcdJ1PieEo8loeKwYVyB5dv+MmnmV0bNlvnWv8BDBragX7/7hzIQvtQfKkflju+vndxNs6GWcHbNm7n0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by SG2PR06MB3306.apcprd06.prod.outlook.com (2603:1096:4:96::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5081.17; Thu, 17 Mar
 2022 09:24:00 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::1168:21dd:36ff:be89]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::1168:21dd:36ff:be89%8]) with mapi id 15.20.5081.014; Thu, 17 Mar 2022
 09:24:00 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 17 Mar 2022 17:23:45 +0800
Message-Id: <20220317092345.171775-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: SG2PR02CA0026.apcprd02.prod.outlook.com
 (2603:1096:3:18::14) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d18aaad1-2692-4a0b-eeb6-08da07f7dec6
X-MS-TrafficTypeDiagnostic: SG2PR06MB3306:EE_
X-Microsoft-Antispam-PRVS: <SG2PR06MB33063E04EB57F969B6EDE566BB129@SG2PR06MB3306.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9Gx2yzIo7Ad9r+TwhL0BKw/0/dCiHcGytbpDSRoSu30a6ppqdQrmp+g5L8jnGUkkuj9wyk9GdMzfqswVBPqSC1dxr6uu3pvvGaKEhxtQPud2VNnZsjYkKRNr6BBGUdJq0RzfnSbu04M4I9AkMA1vLzgYAfdwDWBvaclLfIuKlxV4jd1qiyKecrsZ0Uq9N7pWOFtptMk3DHlMjszlk0nFzQWmFSW1I0kus3+9N4agzS7Bm/QFRmXzypadGadFuQSXMuSft221Sw3Vbu9NkUmIhQ+FK/NcqnqW6aRc1Vh8gTz579/DhiOKgxeSrv6Ru1BRvkIPVGh3Csw5ns0xkPLj9UzSM0l7V74oHxRKYZEIWdfMNyz89QN/2P00kJd8rLnKxqEWNXzPHxn8JXUk6ChLzQ/osxVLIS++WzJdlevhX0sq44YKfxO+85iUzziRd4lcd4Jf2C0JeeJXpVFWRdS+LUgXulU9+zJOVI890UomggDVB/ztYdomIR2Pd67bN25qdd0Cm+5F0FuFa2sLfLIvN+tzJWxi4sB8gh0qWkrGGy2XGeDdTE86/ulksPoWQfPwupe90OFzXABn+qs9dNZSJs25/gUG+JA5jLjXeY45BUAzb5yJBM4eVK9jX0sA5eeTMorM2luZ/a+NFZHjQijwX9pVN/6gmWFZV+SG42rE+SvbcJ10SV1v2uhIjZQITlabWQM7R2Tqwi0rqg1bIRpDcQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6512007)(8936002)(2906002)(52116002)(6486002)(6666004)(5660300002)(86362001)(508600001)(6506007)(54906003)(8676002)(186003)(26005)(66476007)(66556008)(66946007)(4326008)(38100700002)(38350700002)(83380400001)(36756003)(316002)(1076003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wij5f83SSFbKVv/AREWU2k/N67vjcVcJH9HDvUoClzygtNoIJDZl9gGuc6rG?=
 =?us-ascii?Q?ENCllQ1vrm0eRVOVfeyfd/n6P4tKScMXkH5sZcLgXTN5S4ob3R+4KE4lxDJb?=
 =?us-ascii?Q?vNeaPSC5/9Dy7Nlbfe3sy0ZPQ94b3ewy9uOGsj/HTnCx2Kq4eqCySm9k3p7k?=
 =?us-ascii?Q?1DwkYLASv2b+Kv1iD1dwwx68K6hrFhf6NTaLjDQJ0Jw+p0ewPNcxTfosIZs1?=
 =?us-ascii?Q?pywi/MqsTxl9lXwUuSGO93mYq36VWb2dBBuwfMS/aPdy/z1uk+oDk80aBqeB?=
 =?us-ascii?Q?4AUo2KMbxgoCH80OPzJLgLlDFtl/8x8b0y9N48cVSKqW14WyRFo7cywGk7/N?=
 =?us-ascii?Q?cIrkmvWvtvrK6HRCpqUcAhfNc8NjACArf/Gh00s8dyvlomCnOHlsoLCZdz5Q?=
 =?us-ascii?Q?ipNVjKCuL6VV+XbNvV7MvolHcn/8BG8Oo0l44K4ZqlVCl6cpgt+BDwZun/zv?=
 =?us-ascii?Q?D6wq9cPwfp3auETM3eQsTDYh2/1MPCtEPrQu/x8A8lNZnEq8Fpt5ZbAoot+n?=
 =?us-ascii?Q?XqrutSnoHs/cHlCmgKe8KzJxYmb2PhnUWVNt0qiKe3ewWo/lIkqaKDqK+4Zx?=
 =?us-ascii?Q?JlxBbgGUNKjMYjWfAUtkc9Z089fuDAvqoexsnnbckLSaFQLkBJ0yhmhVnZqU?=
 =?us-ascii?Q?MeQJJcp6bQnAMG48V+MZH+1IbffyyE+QMYaM+uBnlwxQF2HFjuOZlHFR14Es?=
 =?us-ascii?Q?rUUOIJ+I4rl/6lk0axPkn4WHdJyclnTteoQCYRwFPr6X+OhP5DgLmgHdAe7q?=
 =?us-ascii?Q?wXhBFwaYnnYoO6FzCI9yANAOghOqRigeIasy0H85lQZElJ9FTM3F2KSk2Eu8?=
 =?us-ascii?Q?7M9zhJsGbgvv+hiP1w+dmaFMRVphmrAdwVuUJuG91aM/rszP+M9y6HzQM+PG?=
 =?us-ascii?Q?4Mlr2tXpYeohlzeIdhyKk80Vt3tnfKmIwhXDXNHnf30X1SfXArVW6kMARu2V?=
 =?us-ascii?Q?TDUP2bqJ4kM84Z0gv97E/pjyp1nEtxwHCF5rrKmZ3ZRpoujKMli3+L9/ZQIG?=
 =?us-ascii?Q?OrMU+0iMcQkIrPj9Tqrd9mzk38knnf/dEEccOd1dYQJ+fditR/8XC0oSFXzi?=
 =?us-ascii?Q?juIFe8hGZgGPK/5Hdr/nayIbRwXrBxLXewmmElkSzjY+/CYdPDRbfh1ya66D?=
 =?us-ascii?Q?HlSqvMXCtAh4Hmcz2FIJ/FZvH/xoPXj6vBMEZnoI44DoU4QW/Mo1yekQIVmv?=
 =?us-ascii?Q?+RIYtB2GNSAKYGc0hz1LG9oLtiTkcbNPmJa5wVcrZNiqJpKf1RQagxYvy+Wf?=
 =?us-ascii?Q?z3jGSyFG4GwtM1NQ6mCo0IeaA3p33FUqP0jnuceKdcZqLXKRTgxO5gzKeRj3?=
 =?us-ascii?Q?Ls0U5t6kQrNeOnoQDpvuqx+NS5XFXZ5ot1/3TsIH+mJSZGQo+lBZxc+sHXPJ?=
 =?us-ascii?Q?D43f7DR6QyWbkF1zbRjyW/2pHOQvhkje1kzOHLotowTCh0igL2YqOlNMI6YN?=
 =?us-ascii?Q?V6YJNqjNTYWFvqaRWmx74qXjXGozAIaW?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d18aaad1-2692-4a0b-eeb6-08da07f7dec6
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2022 09:24:00.5054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yGDZHtMTE4h085MbmQOUq9FEH8v6SOFdXLmI8DQjhXGcxAoCcIHmnu9rwkgMrMdZZwcR02ix2UsvKRuAlJEXpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB3306
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When compressed file has blocks, f2fs_ioc_start_atomic_write
 will succeed, but compressed flag will be remained in inode. If write partial
 compreseed cluster and commit atomic write will cause data co [...] 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.94 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.94 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nUmOW-0008Gz-GA
Subject: [f2fs-dev] [PATCH v4] f2fs: fix compressed file start atomic write
 may cause data corruption
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
From: Fengnan Chang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Fengnan Chang <changfengnan@vivo.com>
Cc: Dan Carpenter <dan.carpenter@oracle.com>, kernel test robot <lkp@intel.com>,
 Fengnan Chang <changfengnan@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When compressed file has blocks, f2fs_ioc_start_atomic_write will succeed,
but compressed flag will be remained in inode. If write partial compreseed
cluster and commit atomic write will cause data corruption.

This is the reproduction process:
Step 1:
create a compressed file ,write 64K data , call fsync(), then the blocks
are write as compressed cluster.
Step2:
iotcl(F2FS_IOC_START_ATOMIC_WRITE)  --- this should be fail, but not.
write page 0 and page 3.
iotcl(F2FS_IOC_COMMIT_ATOMIC_WRITE)  -- page 0 and 3 write as normal file,
Step3:
drop cache.
read page 0-4   -- Since page 0 has a valid block address, read as
non-compressed cluster, page 1 and 2 will be filled with compressed data
or zero.

The root cause is, after commit 7eab7a696827 ("f2fs: compress: remove
unneeded read when rewrite whole cluster"), in step 2, f2fs_write_begin()
only set target page dirty, and in f2fs_commit_inmem_pages(), we will write
partial raw pages into compressed cluster, result in corrupting compressed
cluster layout.

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Fixes: 7eab7a696827 ("f2fs: compress: remove unneeded read when rewrite whole
cluster")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/data.c | 2 +-
 fs/f2fs/file.c | 5 ++++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b09f401f8960..5675af1b6916 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3363,7 +3363,7 @@ static int f2fs_write_begin(struct file *file, struct address_space *mapping,
 
 		*fsdata = NULL;
 
-		if (len == PAGE_SIZE)
+		if (len == PAGE_SIZE && !(f2fs_is_atomic_file(inode)))
 			goto repeat;
 
 		ret = f2fs_prepare_compress_overwrite(inode, pagep,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 7049be29bc2e..68ddf4c7ca64 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2009,7 +2009,10 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 
 	inode_lock(inode);
 
-	f2fs_disable_compressed_file(inode);
+	if (!f2fs_disable_compressed_file(inode)) {
+		ret = -EINVAL;
+		goto out;
+	}
 
 	if (f2fs_is_atomic_file(inode)) {
 		if (is_inode_flag_set(inode, FI_ATOMIC_REVOKE_REQUEST))
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
