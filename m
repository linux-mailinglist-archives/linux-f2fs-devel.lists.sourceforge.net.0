Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D0C4DD26A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Mar 2022 02:24:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nV1Lp-0002Pi-Db; Fri, 18 Mar 2022 01:24:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1nV1Lo-0002Pc-JG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Mar 2022 01:24:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Bz62cBBsSHYestj6DLUv1+1/yZE9OQD9PljR/3duzt4=; b=CMO0R9iJ7ZG2vpSXtvsVFYKC8S
 snkEnFO2xey0ni9lkhjRQpleCAxl+tmxq1NhI4Xc0GjvD4zMo5gVuLcT3DypAwRIm3lD33wY9QZMA
 o1bmovOI0UESU6giaW6M7QyOhSwYl8F2cvPemJAdnQjstNPBjDoDCtOx15m9pCf1golY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Bz62cBBsSHYestj6DLUv1+1/yZE9OQD9PljR/3duzt4=; b=P
 5dvxZM6eoMfhzD+Z5ypqGkU0Apws+CbefFC0xWRFjlvtLQif8Bu+eqAEMIZIthCGvIxUUDG5ZoIMF
 oKpn9UoYwRsF36Rbfj60PNi01cuo3yrciOfwEqz1+RCDd9DL95Gad3FDVD250A4D0oU0UI1gzZvyS
 Wvbgqt1mdiq+sHus=;
Received: from mail-psaapc01on2093.outbound.protection.outlook.com
 ([40.107.255.93] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nV1Lg-002UaR-TP
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Mar 2022 01:24:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iotH1YB/+p8V/FrSQ/HFj6axSOjN5qT0tMrHLnvOLuI5WR81SBOG5zC7jjDZxqztAJuozF0Zu9N8Pk1speEptzBsMJMjehOfnDHOuAveRZYuKvjzK1qGacie6di3ER1Fn17z2H7K/sbPzd90AZfVYif5JvWR2vmdPWSqz5WUPA0v8eOgvYrNIwdfN0h23h78wAy5ysjiXkRrQurhvJxLA5peEWtKYymyqmyiCVs7vFdvBMHanFWT2N5TthD4rV2FTF6qKa90mNbGZdBjWUCAzThKISSRRuoBg8Ga8R/6BcFBemWpn8c6wDkJThgNkFCHRKfAnOd3cLymhfE30Q7V+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bz62cBBsSHYestj6DLUv1+1/yZE9OQD9PljR/3duzt4=;
 b=YkOU4iJG0223e3yMvbAPEey1Lt0pFu8K6MPBNddpHRBKiUC7v+V7Sr1gIPGdbMDHvFDN+RbRjN/Fqv4/UH0Ufr1UfuAlp+Zn+Izzja90qWU3aYkJ7Z0qYSZCFEsLuAKvMMIgrKLx7DZ6vJm934U5ToKhtY2PvA48AgOnkOhGEoNsdQswcoUzyxpGFzQ0slLES7chdLjPbf+K/z6MaiFrvLv+5mN3d0LQ9JlVLqlco+Ma6NvA4Zsb4Wno125mR09Txqjbba2eoB5Kp001UNsg+PiKX8oXbUPpex+ykdteDw56RFLJLDje9FjhPpsXmJh1pZ04reTIAwiuWt6b9Asc0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bz62cBBsSHYestj6DLUv1+1/yZE9OQD9PljR/3duzt4=;
 b=dKcM89LUyW1xJTDnVOvJH6oiw/22fArppGjs4XYf84qHlhslZWkDjVSOLnzBgYEXtz9rnGdVfRWwmnfK14IoPVR8pXlj9HZ9EMvXNUc8hqp5UjPGVnEbe8gy4mOmswwxq94D6CPxzYf8dsceqEs5XaiJiM+47o/6UKb/jGdq7ZM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by TY2PR06MB3309.apcprd06.prod.outlook.com (2603:1096:404:106::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5061.26; Fri, 18 Mar
 2022 01:24:02 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::1168:21dd:36ff:be89]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::1168:21dd:36ff:be89%8]) with mapi id 15.20.5081.018; Fri, 18 Mar 2022
 01:24:02 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 18 Mar 2022 09:23:04 +0800
Message-Id: <20220318012304.230736-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: SG2PR01CA0191.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::6) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aa8ea96f-20bf-4d01-1d54-08da087dfc1d
X-MS-TrafficTypeDiagnostic: TY2PR06MB3309:EE_
X-Microsoft-Antispam-PRVS: <TY2PR06MB330978E8FD676A759D79A40ABB139@TY2PR06MB3309.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bYzLPncuIm4u5BIImDRkiwfcJdhKXD8R1l+uNKF0dLIi2MVp5iO+llVQVjdmN0RJrEM2Twg0Nc1rDNWG0c8lHqA9CRV5c6iR3WH9Hr57G9rWxo6cZfKgGGcDVHAaSHBAlHfsOtvyaSBvjpd0BAwQt2Beih4wRbpr7YzqtGQnyN7RxdcIy0MxCpTk4Y6V+6PSgvH1KeVS8ewmIM0guCSAzRJ4poxu2DtYTZ/Crwyj6Vg8bGZmq/zCEeZbwd8nEGJwXKKAXI+KOh97B3nwlENcpfPriofHyLWP+g+2NvzSyxjcRsYdQCDgqhNiFkn7XOyx7Cjqhvg+HRf5+1xgb+816z5Wm48jHgD75WHUXl9c+Gr59IyHqCXjNV8HC21PEEOWQXAAt5lI0Qno5Ro/PRY8bykXL//jxAh3+MSu8MozBh3GSxZ6n3Zvh8eCmMzM1/LSjllcA3n6DCN+r98sGh/hwp4MfvHzB+U+/NYzb2CNu+weyVWrB7F8lBsgghPvnu0+NuzWapocKfIkSgKQyzyC1sIip8Hq6oHUGmIUz/O5sxW+wodzBNGCocZ7ZvS6czOVM1nYFSzdWsTVExt1aygCxEFnFhm7U+U4eCNdUJrbir9hiI4dmo60fp7rA5Nf6vYKkAC/BgVyZ/DZZ80EJagSvy2O8PuwIOirk8LBiW9vaygtbTcyM97o0+ch7hldJFZd+g4QWSGWG50ac/KckWnGsw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(2616005)(86362001)(2906002)(36756003)(6506007)(52116002)(1076003)(54906003)(6512007)(316002)(38350700002)(38100700002)(4326008)(66946007)(66476007)(66556008)(6486002)(5660300002)(508600001)(8936002)(83380400001)(26005)(186003)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eN7wUR9iIyG/k+sCnO8SjVY3Q/JvaU2vvfVwNdaG4icBynPZzfkaVkeq5OUG?=
 =?us-ascii?Q?GXdATp6+23Mu+zc6qpPBS2tKbtAGnujFIE4RhQuNE+kL7B3i+bkr4Gd3u1u8?=
 =?us-ascii?Q?0F92eSzq2GmigBZHgK4lTDPOAkBAV5435KxN0DQqJE+eNV6+aZ269WOwgf7b?=
 =?us-ascii?Q?ducKEZu8YkVY+AHAdgSjEB+VJAH95QCNePpov8tB7Um6g/PILGhuB7wr9NxM?=
 =?us-ascii?Q?o+l1oK9y/5clFdSjPPqstlMofslZmm8fBdsCa3s7rsJ3XVU7M3PsfLlAwGlG?=
 =?us-ascii?Q?klSAyDJvxRlbKXnOr57exZ/PWQfNinbQlBoFI/OigSOL18RWmxC280fBp+zU?=
 =?us-ascii?Q?7w2s6IYfWUa8eV8yNxMwerZGitbHotfqOmaEvcrcFiN/DzJpJb7ZLhWW2zhl?=
 =?us-ascii?Q?PiVB08hhWXJlKUXWc9fmO7b5ROuQiCehqIJtaj+M+UICE322H6hKN1+XHj3t?=
 =?us-ascii?Q?Vqf1Ex/56tDnnqRipLUthqIroMrQsWMZkAWZcUpWhlIjCJcm8No0EZUXowGb?=
 =?us-ascii?Q?3gEQsfKpcuGN1K0+CcJTHVO4JPn1k22sQ7ztpu36iKcdFAnGpjEaVp0kR1ah?=
 =?us-ascii?Q?mlcY+MExQmrecYJ5YshCmJ9T5Xb3bYbLLjTWMgUKc2NAzeCda7Jws56oTb4P?=
 =?us-ascii?Q?gHQ+NQNF2vJiY9YxON/6HTH0kJ6tJ0q/N6lDmO2ywPfsyJuYmllA3PFxYlbH?=
 =?us-ascii?Q?xskfQVDanyAvoJQnw6sZ2d0CXiZ9pO002QSurO+6uZ2PWrQOFX7Jw3jo46LZ?=
 =?us-ascii?Q?whQw4PYcb+15rYi3jbUTOHdAYdsxAoMG6j/glC6XsG3ySxW4zyCBftVgy6Yh?=
 =?us-ascii?Q?xZaN95lQQmmjv7fQ2cBF0SLyWBSnnwToonxgiUQecvNEx+Kz33fa4/GzYU7e?=
 =?us-ascii?Q?xZHnuEF6/QelQzp73t4hlcHxmO8Pep2K6AtTxluFv/1ZXf2GMCLGUbSWnLKu?=
 =?us-ascii?Q?+xOJ41gVKR+5C+uxz3i+D4GMKEKZxJ5J0cMRbQ288yunLz0Btav3znshLnLj?=
 =?us-ascii?Q?7bX+4b24WMfAAdF+8cXk6YjG/aN0ccoYWjyhdyGNGWewA7g+cIS+XOosoAIt?=
 =?us-ascii?Q?HJztrp9PoFTH7WBgLi9nuJcezsoMd1cRwzpukuHGSs/Xi/fqXclG3yzjClxv?=
 =?us-ascii?Q?A7gdLxT6zPSL07xb/N2nPNymY3gfo0+DwiQqz4tfJpsjijtnWPoaXbNETA7b?=
 =?us-ascii?Q?qcyw7aS6Y4uKRa65Bch8MQ5eal5VqQKsJv5DGIui+7qgp66sLdSEYDOvCcnc?=
 =?us-ascii?Q?uneNpCjPIbS9mRY4rCx+J7bR/fyU04Ple7LuuKWVHXjct2Nm0ku9XQQb4FCa?=
 =?us-ascii?Q?mSrZeLteL1pvFB/djUWR5JQnOvwXP0TNz7ILArk8fnIdmEQDxc2WA45Bg7wr?=
 =?us-ascii?Q?O+/BYndYw8ffZ24AUgCjWST3FUmzoehNCexdelGZQItOWfqmbdvG9C6yqseM?=
 =?us-ascii?Q?On41aSUpVAmlq4oGAp6bs5+yHcDfOW9N?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aa8ea96f-20bf-4d01-1d54-08da087dfc1d
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2022 01:24:02.3015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zx5Y7DmMv2WlHmpPNtERVVSYz6XDYOHzxg9+TAVdGd9Dtiu7xqBbR6dXwPcm3Ghm9DjAFrJs2bhKhapqD1Jk4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY2PR06MB3309
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
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.93 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.93 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nV1Lg-002UaR-TP
Subject: [f2fs-dev] [PATCH v5] f2fs: fix compressed file start atomic write
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
Fixes: 7eab7a696827 ("f2fs: compress: remove unneeded read when rewrite whole cluster")
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
