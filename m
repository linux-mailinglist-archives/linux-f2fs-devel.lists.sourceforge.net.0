Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B43444D2C41
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Mar 2022 10:37:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nRslO-0005r0-VE; Wed, 09 Mar 2022 09:37:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1nRslM-0005qu-E7
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Mar 2022 09:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tQJ8k7As4vs0wbQw6l2E5OaEmJQ8Eb857nER6AHisic=; b=kncrzN77EVccg3N49kNFJSVnBW
 Z+l3oh9SXRctuN7NEh2Ho2n84h6LkbxUVoBw0sbMD5CaAa1kitCVyw7n+JD6Lxji1C1EFjzzFBS6B
 M5xJ7QUw1nlQJen4PA+K3x9NgDBXqSnlohoRr9jQq719TQRkTsu8WVqrfUaWz3Rt17ks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=tQJ8k7As4vs0wbQw6l2E5OaEmJQ8Eb857nER6AHisic=; b=Y
 ylbzhTCrz1VXmhgNHoIvHlwj6QUjiVfiSkuSY2EHa1fSUDawsPiu1jjWOIYNdbrK1bMAvwdX2Q/WZ
 HVgL2qIm4QIOAnHv5+t3BfSX5vaEcEGED4ArZQOmlTO+A1P3w2UORXHbszA8VT0V60gG4LZKrp+U6
 Qjjx4TTqcz2LKBMs=;
Received: from mail-sgaapc01on2092.outbound.protection.outlook.com
 ([40.107.215.92] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nRslH-0003VV-Lb
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Mar 2022 09:37:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YrZ3d5Ho5pZVKgaqr5fgyIAZNEK9y0IBtszgqzoULw9VcbOwJRDzaFzEn1t44ngROtT5ghDU7IzgjyzVsp6UMpRx5jCNAr7dQHK5SaesOaeWYbqWykQj0kE1wCHXQPKSvlZX8/PjTHv0ggxWPAvEos1l/E95WD629ONixN4iViDIBbRCi1+KxA2mbUcuXHYC20aR2Wj9B47o7EESy9Z3pC8AWxVcMFsCG6QF3PsLffYh1gfZNBZVnGRXzzu0/X1MNbqi/LDL0WMISoXUmEzrUcwU57k4FHPsc1p/IEJkrKv4pqoKVydoB3nVu1Akq71REay/BQ6ZdLgQ6xDYOPG3bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tQJ8k7As4vs0wbQw6l2E5OaEmJQ8Eb857nER6AHisic=;
 b=HOHZYoK4B1Nmwn+UIYQLzarvvTjUH2EUI9P7TyT3HxK32QGfYi1Ddmnu3hIVnCMDNoFZJIsips1oODkjM2js5qih4aw9MKLOr3L6z2nA/9VHiopa+sd8aj7YRzjB/7SpOL9I3Zf3nGJUiKbfcJOTfyu4NSC5MQT2cbHSzb8WmPa8LcRX3EIBXc4ElqNer4xiY3QHVFnZFtbevcQ8Ld1vDlClBJYlBaKN80mA9DyHwfKkx97IbIbNDDQCdqTY/HaN1jNTx5afJ/qP7HC0+U3bzlekoYH4EyKjyAJoF0niw5FPRVb3Igs92zo7HhrK1AemMjqLRVKO5lRsQi0lKejwjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tQJ8k7As4vs0wbQw6l2E5OaEmJQ8Eb857nER6AHisic=;
 b=TcSxmW6XfF/6OLCjDPhonNE7budiqEVy1u5ovFgzZnKF+WUKc4MkUA8WcUFG9N1G1bgAEK8RC0E9cNoIaYy2MeW7LmpqxisKIzp3KHGfG/tykDgdBTDK1OA2c9i2MgwcyDf9dl+96AKNwg7VKnAYSQ7gp0Bcur8Nv3LDtxosL2A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by HK0PR06MB2962.apcprd06.prod.outlook.com (2603:1096:203:81::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Wed, 9 Mar
 2022 09:37:29 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::1168:21dd:36ff:be89]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::1168:21dd:36ff:be89%8]) with mapi id 15.20.5038.029; Wed, 9 Mar 2022
 09:37:29 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed,  9 Mar 2022 17:37:21 +0800
Message-Id: <20220309093721.68497-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: HK0PR03CA0119.apcprd03.prod.outlook.com
 (2603:1096:203:b0::35) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a361806-ddd7-4fea-e4e2-08da01b06dab
X-MS-TrafficTypeDiagnostic: HK0PR06MB2962:EE_
X-Microsoft-Antispam-PRVS: <HK0PR06MB296285A7A762394C3974736DBB0A9@HK0PR06MB2962.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kmMWvhECQ1DqRsdZYhBzrrv6fvd3XY7c5sCa9cvgLdBzGJHi40hCS6txTA5MQrGb9kPTbL3N/isKJKoU4/c518+o5zkPkhG6QDv9de5TlMz5pJHgEyXojQXsC1wSDYZzFvUHOhCChGbhvCKUDyiTJ/nCLiLtQpmGM17kzHe+L2lpW65pvPhGZKcniM6cQSsAjP6xojhSs9W8HJwkZe5hNsIFE4qZLvTPgWlB1A5iZNEfSHdsJ4VjkDD74qkc41yrUN1EKAyWqkxp+WvKrtlziOU1dKzlZZ7gQLTiOYkq3plQw9l3yDngDg66Uno2vWYvVeSrS3i8nfGTZXz7OR7aBoGzu/9NRzMvGgTYLaPtk5eAmlJ8cdN9ALKXfNMkJRhtxeNG+RN+9DHnmA1zTAe4CyIZZ5NnUmFJ6zVzdH/2QE/4Kpu8nqT/aNzDowuRJeKGEQX6F7pFDeFwb6ggYOqMA9ahyJDBNMUzlDb3HQmzJsdOlOSbPHE+1z2Z/l03S3SWsDNu1G7y8QEwBX0FBXcjY+gaVgG9rrwTBUukml/OoKK+uf8iB4wAP+Fy4/gNRbEl1WeLNkypJYtY8tdskS6IcKopaun3MvlI07JEYSs03NAFUR4rUWc9cwyJIRzzjmX8eWvGWGckLRwqAggkE3AJ5QQ1i67k/UsVm2tJXoT4xU2AlmvNdxcg7R7qPF0GNoFejpeE/4RL2IfMYbRUQGQjAA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(83380400001)(2906002)(6486002)(6506007)(36756003)(1076003)(26005)(2616005)(186003)(6512007)(6666004)(52116002)(107886003)(86362001)(508600001)(4326008)(66556008)(8936002)(66476007)(66946007)(38100700002)(38350700002)(5660300002)(8676002)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?o3EOyzIELVJ3S72EBfGTaKLCix/lHp/u6t5r7LL1s/vf4FdO01meC7B+rtXj?=
 =?us-ascii?Q?0izI3hGdf84Q65dPo5WnBoH/QSsKExg7i54bpuLPoMkX5ouWJ5WI3CHXWfoW?=
 =?us-ascii?Q?SsvBTGllh35gMq9XEnpFqiVqbnlKymWQWylnr6iUhn/Dn4YR5seq3Aezso3s?=
 =?us-ascii?Q?q2Rk79yg3NoZbcOXQXtZ0FR2vkk5LftVlcnSgW1saj/hhYjJoe1A8TTcFAvN?=
 =?us-ascii?Q?rgxtiodIXKuY+M3vcgel89y+oTSzc4JSto1lj1B/wbrzl69abOsO0hTlBDhm?=
 =?us-ascii?Q?vVU55k8iJQSx+upZ883SBAQ7vfgY04EkBhF0ZV6j9e5CDIoWbLSyvJgevzpa?=
 =?us-ascii?Q?EcjhH3exdVew1TlLQc6oc26gCvHW9QlcFBYV5n6ERskAOBwWDob5b1r4uR9N?=
 =?us-ascii?Q?tGOfE9XJyzaX8rSqS12QRpjbG+9j+X2K0km/1vf2Y/cta5cjsxYWdFWPLFgN?=
 =?us-ascii?Q?gc/p/xYBxXQfeLNhqvvsyrLNJM1kPa6LOTehQgVT7akPh5K9qI3Iof6+EqMK?=
 =?us-ascii?Q?xz5ELNVUi2F3PQSuRZvSLEPila5q405mddJIGRKIgoTJ4a0wLDmjMAfrr+2U?=
 =?us-ascii?Q?AMOn+rlzRjgo/1kKfOFOO4WcdVYQXHrupltAB4AswQxcSMeNzGqHSg5CjYXc?=
 =?us-ascii?Q?mZZfuMH123pvCIMpiay1k29yKB+1YiMJJry1w+PitXcC9YOb7yyq7Xg5k/uB?=
 =?us-ascii?Q?sog+RYiRnRBoCA6icPYFdcQTzeTcMlrtfQfWBN5Lrz6Nb7zKYC1TZ0HHP5cz?=
 =?us-ascii?Q?806xAiCwMURYksdoHBy2pJ/J/mGi0YC0q+EvZYwECKcdnbw8vU6wZbQOR0e9?=
 =?us-ascii?Q?EWGP2/YVZP+1IgczEFuqZxkmbL5osKgTEdBRomw+Y3Yg1KaLylvuS90pLyEm?=
 =?us-ascii?Q?vE6t/pRLu2RlcqOVWvvDF06kgaCzClgDQsuquhpAS7VktZp/8OOav48pb2wY?=
 =?us-ascii?Q?CKazR4TnDGrd+8RXxxzTtidD7PHNRrb+xodGK+VG0RAdRPn0L1nTZQEA07fd?=
 =?us-ascii?Q?IQQiirmXt9fr8xr3HxSm7wyiSXOhxnPpSUeRVZt6N8bgWHz1czSG+C0mrTHJ?=
 =?us-ascii?Q?wWqMS1gHDhlnR8M6DS8+zof2oo8a8+cqFb92gug9kJ2mwrng59XmfNriozgD?=
 =?us-ascii?Q?HuUwwIkZ+9g21EhVU7Ln4vGUPb85cEANhP/Cg8bL2qs4sQLEvD/1IsKapIUM?=
 =?us-ascii?Q?QVqwdHikkIjkJ5gJJXUMthaPtyN/dnNUlTCTq4lrYh35vE8si9em3ITCuSdq?=
 =?us-ascii?Q?Cc1FKHIcXzDaodFYRtcuXCxvyE9QkupkvibXmifFSBv365m3oLwOsdgpt/Yy?=
 =?us-ascii?Q?dpS8OuVtBdGkhQ7IxlQiMiXrVimnfEdq/6iBB/BIevL2ecL6Di5rxO1ubpzp?=
 =?us-ascii?Q?3n2AEZO7/OhJZMtCkX8oFAAb5DFJyocE9sYzPsrth+laXnNEvs1r9I1NRp0X?=
 =?us-ascii?Q?CojwAriJaN8/+/jCZT3Ja4QO1Ctq/k83BCjA1fn7AAvcale7WUVu6dy+wb8n?=
 =?us-ascii?Q?gyTgKioDlIiVqfWY8x9zvUXe9erP9bsl59tr2m9PQEmdXdjAlaYDZa3OPowm?=
 =?us-ascii?Q?52t1yxngEBSHp4XnwXaMY8oQjD9FlTOFsTgs4oSR5oa78FFXbyaiV4CccbhO?=
 =?us-ascii?Q?SlntoJ11PXGq4v4YjFgjhpo=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a361806-ddd7-4fea-e4e2-08da01b06dab
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2022 09:37:29.3606 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gFusfTNDtKCClQAZnqGNWt41gKPc94Wq8Nw142tBg5pCHnTL91SbjM1wtrjrbh7CS0kD4+dW2R/tcjtRWhYeHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR06MB2962
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
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
 no trust [40.107.215.92 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.92 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nRslH-0003VV-Lb
Subject: [f2fs-dev] [PATCH] f2fs: fix compressed file start atomic write may
 cause data corruption
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
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
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

And before f2fs: compress: remove unneeded read when rewrite whole cluster,
even Step 2 is not right, but whole cluster will mark dirty in write_begin,
and whole cluster will be rewrite as no-compressed cluster, so it's ok.

Fixes: 4c8ff7095bef (f2fs: support data compression)
Fixes: 7eab7a696827 (f2fs: compress: remove unneeded read when rewrite whole
cluster)
Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/data.c | 2 +-
 fs/f2fs/file.c | 3 ++-
 2 files changed, 3 insertions(+), 2 deletions(-)

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
index cfdc41f87f5d..2a07568ee61e 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2009,7 +2009,8 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)

 	inode_lock(inode);

-	f2fs_disable_compressed_file(inode);
+	if (!f2fs_disable_compressed_file(inode))
+		return -EINVAL;

 	if (f2fs_is_atomic_file(inode)) {
 		if (is_inode_flag_set(inode, FI_ATOMIC_REVOKE_REQUEST))
--
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
