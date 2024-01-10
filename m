Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 52870829600
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jan 2024 10:14:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rNUfI-0005G8-B2;
	Wed, 10 Jan 2024 09:14:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1rNUfG-0005Fv-Tk
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jan 2024 09:14:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rtbclN8Jy24/ACtT2+yCilA0LOK9Ph27zza71V9+Ruc=; b=gH40BUwdGxuNvt6/3tjGery7AD
 qcd6dfzFkzs16qncD/7PjYAjIFR9wPAfvt6Zzv1VJ2qQE5O2Zux545SqoGazOp5LfKScZU7fVlimB
 874V2sJivfdkRQSER4pOptQU7pZuWx5NMHDkplhDs2yXoa0swJSiBVGq3j/PuGW1Ilko=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rtbclN8Jy24/ACtT2+yCilA0LOK9Ph27zza71V9+Ruc=; b=Y
 QTUimJ/dQHKuA/Jf9wA15v+AcnlPi+pAbZbjSduUCK6Kpcn0YX7E5dXJMXbFJBfRtcow+5e+ClrW7
 k1EY1VOKEDDBqvEjz8iDgHMRL8+oZrrLKK3uqrHFJmCemsm5cU5kFwix2x6eHKqEppkYdvsiOCi+m
 rXf04nRx5Q7NVrrg=;
Received: from mail-tyzapc01on2120.outbound.protection.outlook.com
 ([40.107.117.120] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rNUfF-0008It-7a for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jan 2024 09:14:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cTW+Nmz+wb70zlX/Fh/mT5Z3P3MApywBN0z0NpQB9Xkl+07aVJW7Mia6Ck9PjNXGMCUjHcGGAdf/KQm1jkFg/pri88za2kx5MYtG6gONWTd5pw8OymW/s+GYay1WDEnNenvDEPwSjZSoCYnoG6eHlJkCDDssvVC+4ySeCdi/jQk4VIgUe1EOm9StRO/TgnWM69ZalFwO5NDrD//A9P3l1Xbd1A3pORW5fey7ULtwHntVXZDkxmQJ5eg8t+bL0HndSKmGigs6RfvPKbrLNfQ3CZ1Ou6mJ0I7Opmqh7+1oXT1OZmKqfzulMcRiFCMkPrLVlol7JwMkiTmvtnAjKtpOcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rtbclN8Jy24/ACtT2+yCilA0LOK9Ph27zza71V9+Ruc=;
 b=QJodKA8/zb1fLOGJ77ViPOYWGTye6eN9lkkakt4OCsuzN5bqaNNRNcJqIAfmM9MsRh4ODZcDkESmxbHSxDBrMJd8odqWTXkLRa4ez2L9SmzUClpV6wEKlh4uBa69u3GZHjJczTkY8VeeWPpHotPTbrVka5lEwzMMVNh+r3ouwNxk8WqJGFsbsYrTIRbmDOmNuzzUa2aAokWkbaBBqJrYKPBopuGtQkFFMSiT7IZxP6KlYLRg5XIbnGMcLTtlTHS2hNleO0lEMyK0xQZANNzWbQ6zBU4r1ni5dN8g0Bgj9aIviz/4d4Tso4uwzs159gjkWzLcMjmsJoyYlK7gp9Rxdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rtbclN8Jy24/ACtT2+yCilA0LOK9Ph27zza71V9+Ruc=;
 b=TUsp0rqacNh+zEm1J/BC2/gYwLQZv9k8c2O/EUcO17bbE3NpAe9MAq+Jt6UQWWSvmI3eouugZPHlxpDBeHBAVSHR/ibhrnssRy9PmXggmtApcit11ONu78qEOu3jFqeXb82J0n8HQBQViPsRGVhOB2HStfRBQ45JxqNRxsGHYucQsQOfTSH59nEKhhXVRKIvnWta9v9rRvbpTT0dHn8E/skzo3rFuuzfsjd7NwxEyTwxdYZGxyeNQyjalYo3VSdr3xpZWBIVBK0cI/IZDFixCb6Qo9yLjfYkcw8rc+eV1+89SLxubuCqfEgTc4ONrBJDFJJabJto9VJww+HaHye5Rg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by JH0PR06MB7082.apcprd06.prod.outlook.com (2603:1096:990:68::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 08:59:44 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::6e05:7a08:4656:761f]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::6e05:7a08:4656:761f%4]) with mapi id 15.20.7159.020; Wed, 10 Jan 2024
 08:59:44 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Wed, 10 Jan 2024 02:10:08 -0700
Message-Id: <20240110091009.138206-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SGXP274CA0014.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::26)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|JH0PR06MB7082:EE_
X-MS-Office365-Filtering-Correlation-Id: ff5213ad-b0de-4aa6-2798-08dc11ba7d11
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Znhj9+JQOgwLzmuiaggT6lxyrCF/kIwhGAy2MMA/p6B7ilcf2oCe4pEbGoPrW/6QhoNqVMMrS+y0QARmrBAbVmjKxa+DdbL+L1snHv1ThMgkPKwxie5jwVOkrrTmqbQk713NTog0Y3HfBgXhAv7cnZWUJ5qh5jKR+5j3/y993usdNX4qlxNHKp6DAr+P7adCQfNr+2lB09CKR1acaYS5A6yJ99e74KaB7gGV4V68inQswj/NJ+edxO0ZTWrOw+QThQ0daHmU4tCQVzhQggviUj66vIcIgqLfIQkApwazHv+FW5m53RDmv6TeuLrFDNSU6jxmGy4o9cJxh9oqfoRTs6LF8WYk2hShZqpgfIscotkU89e0NXr13OVPxdQmvRfv1gBLTbAGrCqb5vRp21Dtcv+xilRoxU+mixBwDSt6rJIUcah2SyRqINTwaQh3E78jUSb71AsRmm8Q0g5TktjOgAhp3KtweEwNmlEJHmnwF0OW1cOXZ0FJ1E5H5pG37Dkb8ZWZG8F9Ek+J+qFrZSS7J4zk6YuJqhfs7Mqen2k4b23ZMWShP8Al8BygnJXklSdvt5sL8huUjl+6ygBOp9wUGH8lL8+P4625kEZ5+6Ma0OGyYSQ357Vfcb0e4KBIADrZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(39860400002)(136003)(346002)(396003)(376002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(478600001)(66556008)(83380400001)(66476007)(66946007)(52116002)(6506007)(6512007)(6666004)(41300700001)(36756003)(6486002)(26005)(1076003)(110136005)(316002)(2616005)(38100700002)(4326008)(8936002)(8676002)(5660300002)(86362001)(38350700005)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ExB0O7UiGYOexeUc1UP3VVxJDC9FfAIgrtEfdcmfdwBtTT5suAH6vwwOB110?=
 =?us-ascii?Q?Tvt97l9syXiLtgWkJ5r+kefFGnm/dXvzq37XNJB0XUNpc0LRfAtx5to+Cjgq?=
 =?us-ascii?Q?xyOa8s55BPeqQVQrHMzoIUxX5V9uN3+Z/uzspeJjtPhfOzb0T6GlTasWZLlG?=
 =?us-ascii?Q?QAo0C9uofd69KMpHkV/4sIPvwpYNYdN09YK2OC3wwhbWwsQ6wjasIaOo8mXA?=
 =?us-ascii?Q?l2W9iiAwsV0wK2lVql+9utY55h//WRLKbBzE0a794a/639p9EjSFm8Zp2w49?=
 =?us-ascii?Q?l80/u/aI4hGEjJZjU3m/pjr7JK2GJ+oU6Y0Pn+3oW0Vz94OMpzNCcEnVc9QC?=
 =?us-ascii?Q?MaSuctBkQj2fSKTCzdbMm0p4ou4pOIT5ffWa5qagRZ6K9kzELh9jLJtXUO5a?=
 =?us-ascii?Q?3qCe+okbmiNuf0rIOLXd3OcIzDUhzxhHNCgs1EMLlBIIA+lMkgmf8nEZRpw+?=
 =?us-ascii?Q?l68m2SYYECKnBIZLUIVXDbfqz8zBtbicYh6h18Aqu+S0sLOJNhK+fa5NF0wB?=
 =?us-ascii?Q?CcQi+jcakx1fSuyb7Q2pUtFOSAoJMG4yByBOGgRnwQgfO1QhpTQFea3QWo5j?=
 =?us-ascii?Q?p1rQ3+YL8ZHJ3VIaz6foPl148uuaXyJu+HzZKjed7qemVK+1y1NI0isdPf6w?=
 =?us-ascii?Q?XfKbQ+6lHVu2Pe18fr4R13osM1DH1P7kS7xFRY/MykidqTusBo0fYjehX4Qq?=
 =?us-ascii?Q?LHh09IRJUl2nHmdqKxazHdtU4REwDM83ial/G+4cVW+XlJtaAYScs8D6KPf2?=
 =?us-ascii?Q?dBpfvQAW63czXctmRF8tdVqnL6JG4ggA6mf1FNo2kGtierfsxeCG2K0jn9oG?=
 =?us-ascii?Q?8Qu5r3Ll1YXWqOoTkH6IoiuvluGCxn2vEcC2Pcv+duT56fcgQ/y3OL7bYjcV?=
 =?us-ascii?Q?SwLUAz4jkGW02jRiXC4RH6sZn1XC4UIcDP+VKRfXw6ANz+RGOSW4Ji0hLJ1O?=
 =?us-ascii?Q?2lhqM1SFUxhPJ2EXUKKZ7EPVGY3fbzNNAItvXBSfLthXLDsjFCHRWZLIHyOR?=
 =?us-ascii?Q?PMcIHCdwUhdodTYQmr9D/hi046MqsvTcaJKR8jq8chjHxcAjj62pywglxA5L?=
 =?us-ascii?Q?mZu/TwU7heGRjVgfllFLBDZkx1MyUvcCClQ5mvw/8pl3tf6TANMdQduk/iiv?=
 =?us-ascii?Q?/Yd9XK4bQRGxFGnUfOa9doiTQEKp7laI4twP+SMBBwJMaeKC1CdnosF6R5hE?=
 =?us-ascii?Q?hHjy+q9vf34RFZqhK4MVm6npUa6DsmGyRy4USjE3JOyctybVcyTyW2pryR2D?=
 =?us-ascii?Q?6oF2nkBTjYBM0+lB6MhwLdZrry+p8O4xykTKr3QrqeSLZPg9ARyM9ZOQhK9X?=
 =?us-ascii?Q?Due+5+gAdweJyHYpJ4o9eo8yrsjHzCabTTzniC1drIsvmW4RDsD0XhK0hHyl?=
 =?us-ascii?Q?gtlVhP8ObytdUy0WjEwrWsRe+rZ3ue9DA8NN5IwCPbU9mkUFNgxrNXcK6gSy?=
 =?us-ascii?Q?T5fu1+dJA7/jK06e8Wuvyb4uEUnmk5oK7DoMta5LLoT7XTor8nhAqOYYL0E4?=
 =?us-ascii?Q?An7p+R0viWOYhbDJ4J0vEsCYCXhr6+NmDoAz4ELN4NAFDTxvIABbfscfsA7J?=
 =?us-ascii?Q?XfkSSW9px3scdGsXHtL0kFETgZuzZSoWMi7ACXlr?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff5213ad-b0de-4aa6-2798-08dc11ba7d11
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 08:59:44.2226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7Uk4b9zyKh/l+PbkWONBMJgkLd6WwzchsO50g21Y79LrhMz+BZC2/NpqTq7sdxCAg7frls/zYSp/6SeJVuag7w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7082
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Reserve blocks on released compress inode while writing, so
 compressed files with released space are allowed to be rewritten.
 Signed-off-by:
 Yangtao Li <frank.li@vivo.com> --- fs/f2fs/file.c | 86
 ++++++++++++++++++++++++++++++
 1 file changed, 51 insertions(+), 35 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.120 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.120 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rNUfF-0008It-7a
Subject: [f2fs-dev] [PATCH] f2fs: compress: reserve blocks on released
 compress inode while writing
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Reserve blocks on released compress inode while writing, so
compressed files with released space are allowed to be rewritten.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/file.c | 86 ++++++++++++++++++++++++++++++--------------------
 1 file changed, 51 insertions(+), 35 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 15dabeac4690..749b5af17141 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3612,39 +3612,15 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
 	return reserved_blocks;
 }
 
-static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
+static int f2fs_reserve_file(struct inode *inode, unsigned int *blocks)
 {
-	struct inode *inode = file_inode(filp);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	pgoff_t page_idx = 0, last_idx;
 	unsigned int reserved_blocks = 0;
 	int ret;
 
-	if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
-		return -EOPNOTSUPP;
-
-	if (!f2fs_compressed_file(inode))
-		return -EINVAL;
-
-	if (f2fs_readonly(sbi->sb))
-		return -EROFS;
-
-	ret = mnt_want_write_file(filp);
-	if (ret)
-		return ret;
-
-	if (atomic_read(&F2FS_I(inode)->i_compr_blocks))
-		goto out;
-
 	f2fs_balance_fs(F2FS_I_SB(inode), true);
 
-	inode_lock(inode);
-
-	if (!is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
-		ret = -EINVAL;
-		goto unlock_inode;
-	}
-
 	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	filemap_invalidate_lock(inode->i_mapping);
 
@@ -3688,14 +3664,8 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 		clear_inode_flag(inode, FI_COMPRESS_RELEASED);
 		inode->i_ctime = current_time(inode);
 		f2fs_mark_inode_dirty_sync(inode, true);
-	}
-unlock_inode:
-	inode_unlock(inode);
-out:
-	mnt_drop_write_file(filp);
-
-	if (ret >= 0) {
-		ret = put_user(reserved_blocks, (u64 __user *)arg);
+		if (blocks)
+			*blocks = reserved_blocks;
 	} else if (reserved_blocks &&
 			atomic_read(&F2FS_I(inode)->i_compr_blocks)) {
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
@@ -3710,6 +3680,49 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 	return ret;
 }
 
+static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
+{
+	struct inode *inode = file_inode(filp);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	unsigned int reserved_blocks = 0;
+	int ret;
+
+	if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
+		return -EOPNOTSUPP;
+
+	if (!f2fs_compressed_file(inode))
+		return -EINVAL;
+
+	if (f2fs_readonly(sbi->sb))
+		return -EROFS;
+
+	ret = mnt_want_write_file(filp);
+	if (ret)
+		return ret;
+
+	if (atomic_read(&F2FS_I(inode)->i_compr_blocks))
+		goto out;
+
+	inode_lock(inode);
+
+	if (!is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
+		ret = -EINVAL;
+		goto unlock_inode;
+	}
+
+	ret = f2fs_reserve_file(inode, &reserved_blocks);
+
+unlock_inode:
+	inode_unlock(inode);
+out:
+	mnt_drop_write_file(filp);
+
+	if (ret >= 0)
+		ret = put_user(reserved_blocks, (u64 __user *)arg);
+
+	return ret;
+}
+
 static int f2fs_secure_erase(struct block_device *bdev, struct inode *inode,
 		pgoff_t off, block_t block, block_t len, u32 flags)
 {
@@ -4412,8 +4425,11 @@ static ssize_t f2fs_write_checks(struct kiocb *iocb, struct iov_iter *from)
 	if (IS_IMMUTABLE(inode))
 		return -EPERM;
 
-	if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED))
-		return -EPERM;
+	if (is_inode_flag_set(inode, FI_COMPRESS_RELEASED)) {
+		err = f2fs_reserve_file(inode, NULL);
+		if (err < 0)
+			return err;
+	}
 
 	count = generic_write_checks(iocb, from);
 	if (count <= 0)
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
