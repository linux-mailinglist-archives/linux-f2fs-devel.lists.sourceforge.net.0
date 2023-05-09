Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 25C426FC34F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 May 2023 11:57:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pwK6A-0001Vi-7h;
	Tue, 09 May 2023 09:57:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pwK68-0001Vb-PH
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 May 2023 09:57:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=F/t+i2j+kVdvYLFav+22gZBD0CWgejaaUXH4Ec/omx8=; b=FZhGVU/91684yY4jinHTY7Hckv
 n/tgOH2IodHOfj3X5kiDgXNxLCIJeIiS0leFsOymKjO9ZV/Ktb+am6HHIe7HtlUIz4ZzuQsxvvJOp
 IqG3QV9C0ijFrCaXCUYVvmNS9DpJJGtpVysRJE5ZQeYx09c2SGGeYqjj2ZvdXZgshTqE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=F/t+i2j+kVdvYLFav+22gZBD0CWgejaaUXH4Ec/omx8=; b=hKMZQTDkPLYNjtd9rkalzjzJpM
 44HyBOHTjniiDfR6Cm/j5QfWATPWBoUFG9W0FGnYSPj5elIgrK44+9C6mLl09jcxvvvJnpPhS9p1F
 CEMqVEfDqIwN7qTn6EepiHpeLK8I6w1ByalYxAHmhUvZaQCeypcn6rT4hEf8zYxNKMNE=;
Received: from mail-sgaapc01on2107.outbound.protection.outlook.com
 ([40.107.215.107] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pwK68-0002HH-GY for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 May 2023 09:57:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iyD2VunX31+4+V4jGo0g0dAJoi+ldvGV9GX4xoKEbbm2oDwO+6cjbBHV16RuG4EWUk142aba+ZBvI/tQ0svKL2ctDPdhI1XIwEBxHx2mAoEd8L+CNoIhnLDE//dDAPp+VSwVCWbktKnmvspsiWLwI63vYBbocU5O3FEp8Fv3honhfKqKTuLq9bgFTvFVhVlhkNDrcW6cw40u/gjoOgRXcLBx4ICjZQYD5Wg2Q7b7NCYWo65IEdnIGE3mehpWyELh1xGnYGeleitSx9dN0RBeUOuUN2+YdleAmrTeQS6IynmrEGZ/uu1PwT1a9DhkU6cfcnvUHwHiHd84450hZUWSBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F/t+i2j+kVdvYLFav+22gZBD0CWgejaaUXH4Ec/omx8=;
 b=e9BVXvIh+VoMtzBFghz7Fq16M7GoYJPLV/5HADM7NPx7Jd153FYiuALA4RZ8JjW59r2UeUWV4mHF4jY5ujxfCNp+QF3Cf0cjhdNIogo3G0irGzDf2hP9SRsEmdzjNfcbGt6Ejzegz1o4s9DpZr98tvw6215AsK0pTnWbbrKcBePJqhH+p9Fp6BVQV0C38rQGOlnDZ4NhhC+JuKAuz7VhyCcpNb+61M1DaQDIlP3Y3FbALTPT4mezk+gkXErf8c6QAMd72ZHdUsQk7md4uKIjQZmg41jZLl3K0jdqQkuYcxp7/jLEpj2T9UXqqS3g8rUnvpOgxukCHXNGkb8QidjRRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F/t+i2j+kVdvYLFav+22gZBD0CWgejaaUXH4Ec/omx8=;
 b=XVH9L1acvykGXBnIHReVTrpoySYCFh+2zIWX0wIDyajBxcto/5ZQ75yI8ioEXMNz/uHn5nfTHSZ+pWnOgayyC0HpS5IF4VI2t7j49reQzT8d6ZlZZuhqc3nt1iLbRakZAK3r6+MusJMSf3WuDZDXaK8qWIA+BQBMTDa0+Q7xIRmUyQBRWYgmCT28I7q/pwvA/qynSLoDfKGqhzTISZMu8mW7iNvEi+hm+Td36RTNMU607sAXwuD9FJHef3VOHo4Cu4Xud2tPwSGDuP33HrSNgAJHx3XMV4ex8amjMpQ142ym8FZ6Vv5Zq6FtBwJ22FhQkVBtrw1p2eP83XivIo9Gnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6130.apcprd06.prod.outlook.com (2603:1096:101:db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6363.33; Tue, 9 May
 2023 09:57:24 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%3]) with mapi id 15.20.6363.033; Tue, 9 May 2023
 09:57:24 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue,  9 May 2023 17:57:06 +0800
Message-Id: <20230509095706.17844-4-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230509095706.17844-1-frank.li@vivo.com>
References: <20230509095706.17844-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR04CA0017.apcprd04.prod.outlook.com
 (2603:1096:4:197::15) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB6130:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e3d83b6-4057-4691-1bdb-08db5073c9b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2vfbsW5fugn5rMFE7QDF14WOQ41z44eWp0cb/k9dAln/kFMaWabadEsBVXvCw70L7KOdyE+mo6zxyMMh3L9QiL7csdlgI3mBISeQcKUcBIvZa4xUEQ16Y4HKv5k7r/ND0Hp+QB9bPrz7L+G5uqGnhj0iXg4EyiO6HN99pTVKlsC/fXiaX7XTHVMmjD8r3IpSgmAgEXlxbJP8D3+IsHdZvREEnO08CmPwNHxvkdssQfafcrYDPv6DDU6rdczPwB+rGuIa331scPw8ogbCEEYlnp339+MIT66N876nSK8eCUJlF0P4sJ0WWJihR5b6dRjFCefkSzlJ7t5d7CZJe7k2AquNKScR3R5ffnkIG+BYFO11RoYk2T9Ngpexlc7/1mF9U4yhhgcGZTfJ6bdd3cp1LvJQ7nWU4SIa1U7N6A51LWt0uE/uPJXu4leO253s0FvLC32r6wSdoGmlt3W6TX0FVrsIkYPSRyuW0P2J2KsAypuq0q3oKfwYmc3uJjIap8LIZv1OfZ92nHZK6NoX7O73C1pHnR/FS+RI2m6v5qFuLJoWsk5kQj+SqzqLT5SpKh8WCOTwcfHvuQ3pePm3WVWo9ULCg+Tk9kgFeGGc4hfFyhE=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(451199021)(6486002)(83380400001)(316002)(66946007)(66476007)(66556008)(4326008)(478600001)(6666004)(52116002)(2616005)(6506007)(6512007)(1076003)(26005)(107886003)(186003)(2906002)(86362001)(4744005)(36756003)(41300700001)(5660300002)(8676002)(8936002)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?schJyaQIXg92eYU+aMpoJFw1MvFb6UwOcE+6CJhthvlRnN9TsS2DK91V9iXV?=
 =?us-ascii?Q?EzyI7ZNIyS1cFG+2+CJUSfPbeoKkH74HttScjpoeVbHWwWBKsMAioNQ8yLwh?=
 =?us-ascii?Q?P7Gde+3ukBSr7RdatbMG9+SL/bPDhEdesNAyqD0r/xYrM6pvRUA1hokHJ4t4?=
 =?us-ascii?Q?GqyCqFykcZY37GGWOKbMrd9mBW2QMaDJaZSG+hXwgQNvwmESdPHqikR3eZHO?=
 =?us-ascii?Q?12/TBTAPaFLAHi4QTJO1A/irKOGtdPJcp48Q1XKPeVN9UdyjH+COPprs+G8K?=
 =?us-ascii?Q?01z4qcdreoMjfOzoW15fp4FFrgwacSt6Hb2UOmWcRBvXSfiF7j91v6mUXa9r?=
 =?us-ascii?Q?/3rnoNXVSevDMAEmgvys5XtGnx5zpsbMjcgvA2x78LXf/s3uIf3lnJvRozxd?=
 =?us-ascii?Q?nxH2ohWeOy8hxSn2j1PPVxac0UY311B1OETTZu5euXdGwC2bP7JsmCqmi6/1?=
 =?us-ascii?Q?xrsQkXPvywWz5dcy3HpKQCYx9uAPVopfvlY/gxWCqXxv+B2zQY6AiAheJYOP?=
 =?us-ascii?Q?1idlIwOu0GklDDXr4qFdo0++liYj15Oe7eAxlFMARpzDYNK+atlTabhfhtuI?=
 =?us-ascii?Q?2BP+iMU8hCl2YT2mGTE0BYnKlYKEtm9gwSxFaDN6vLSJTvCkm0wm//El9UJE?=
 =?us-ascii?Q?1aD7qDFIYQwGEDW5MS747kc+HrCG1eEBj4vl49HotWDDehWECpNr3qqgImbf?=
 =?us-ascii?Q?W9EVgOZ1R13cAURG/AOcGzYxvDfM0MPon6+RknewNV5qOqvEEaInWO2iyyg6?=
 =?us-ascii?Q?yoBw/D/eGqfOc55Xab89tF6ErJbRFE0/UUAsK7nmIJOahI34Xrp9D8K77h57?=
 =?us-ascii?Q?WCXPP9TBeZQLO55zZFQrt8Co0173sU441/BUBpUGLdUSQaPTMI88nIuxfu4u?=
 =?us-ascii?Q?cJTxmaAVhFErgI93J4PBmQIEqR+gNDqWH5s0u0MAqLLDpHQRJ4TPWWtfXbi3?=
 =?us-ascii?Q?5ebL3ygLzAqKgpg58mQ4jZzPCdOFQ7vGAaZy+vAfDx0gGJ2wFCCd7d7P5nuJ?=
 =?us-ascii?Q?/LPCmu7Sa1c8uuKHffd4b6KroxQgHjeJSciDibkSSDhe8RVVPeRwjQbHk4/n?=
 =?us-ascii?Q?Slbl20TSSUVlbCIddlClaEF5ako/AMG/OZqo/xoUc00yOvqrHewCXZ4Z0KzK?=
 =?us-ascii?Q?1kBr+BNbsyENX6kYlD7XKUf3VmcJu5Oa4aINUO73NE8v14uXTuspmUvn48KL?=
 =?us-ascii?Q?Gar5lxZ8YZruHr6hyLvS6TvrTJzPc+JStE05cwNsKyXWoCPGtFQBuwq5UmhB?=
 =?us-ascii?Q?y+pY/HqcjFwihm8M6MTEBqrTdsvLc2JHjaGOZLmco14ildkrG4hpmEXkEjXL?=
 =?us-ascii?Q?rf4ph6BNEOSlmYFBvZQWdROTUdVB2KJ5pVFHMDClOkUZ5DxtzHxt2OfNhxOC?=
 =?us-ascii?Q?HLCkS4FUIGqhEDQfY37Fi+gPSNdKULYgPWYj9jTRyHteVgFXQNwnApxpyCRR?=
 =?us-ascii?Q?0XUhZL4qHltkVAvSDQja9xe5SBFWXqjfqbwGthDVTkbblZ79Z/pAdKqvl5t6?=
 =?us-ascii?Q?9EOmIisuV1qkY/zQ1nFa1CZyHOBJt43oVPeigcAJOMswSrNH+0PICPLJrPHT?=
 =?us-ascii?Q?X3JlR+q2LfETv5y5Uz/tqnsD8pdpnsmvNn5M1tuJ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e3d83b6-4057-4691-1bdb-08db5073c9b9
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 May 2023 09:57:24.0822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +o/nLCsPX7LU6eUOVYbJGZpf5InMkKqmFFJ8Y8EN1ga4MBUVd7yWt2CBoCb1AFhmB/c5DUQ2N9emSJooMFW9qQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6130
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  For judging the inode flag state,
 the inode lock must be held.
 Fixes: c75488fb4d82 ("f2fs: introduce F2FS_IOC_RESERVE_COMPRESS_BLOCKS")
 Signed-off-by: Yangtao Li <frank.li@vivo.com> --- fs/f2fs/file.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.107 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.107 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pwK68-0002HH-GY
Subject: [f2fs-dev] [PATCH 4/4] f2fs: move the conditional statement to hold
 the inode lock in f2fs_reserve_compress_blocks()
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

For judging the inode flag state, the inode lock must be held.

Fixes: c75488fb4d82 ("f2fs: introduce F2FS_IOC_RESERVE_COMPRESS_BLOCKS")
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/file.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 32dc9a250a36..0959cc3e6394 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3641,9 +3641,6 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 	if (!f2fs_sb_has_compression(sbi))
 		return -EOPNOTSUPP;
 
-	if (!f2fs_compressed_file(inode))
-		return -EINVAL;
-
 	if (f2fs_readonly(sbi->sb))
 		return -EROFS;
 
@@ -3658,6 +3655,11 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 
 	inode_lock(inode);
 
+	if (!f2fs_compressed_file(inode)) {
+		ret = -EINVAL;
+		goto unlock_inode;
+	}
+
 	if (!is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
 		ret = -EINVAL;
 		goto unlock_inode;
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
