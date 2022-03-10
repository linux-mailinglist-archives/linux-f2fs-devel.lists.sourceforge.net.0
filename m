Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5384D4205
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Mar 2022 08:49:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nSDXs-0002FX-Qu; Thu, 10 Mar 2022 07:49:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1nSDXr-0002FR-Av
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Mar 2022 07:49:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ppuosv98ypDk5VmwFqCU41/2nCuEn6pZvDm2z3lk8xk=; b=TojzjNhVJDAoPhdNevnSYaFMfs
 iSRQeWVRLVZJP+AliRt6mYWTDaOXltTJ3hMG/wgiZZHAkbi4xDkUGdnTlVxlh37Xd+/c4nmIhi6ks
 zuy+svINjwnwLqYX4lUeehbENm+pbkvs3vlssHt+5JFmYElvMmHSJaX1z9DxEluL/lEA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ppuosv98ypDk5VmwFqCU41/2nCuEn6pZvDm2z3lk8xk=; b=d
 V2zjt2M0VV2AAOg1AdW56Ksa0Mj6irZHmjkNN76e3k2JJxp7cvcVCButYUCdlXjmHMwDR0Bljv//7
 niJ92wbQeamXrQWQ6rWOFmfEHLks7FKcW6Na7/cPym4EdxlSKCdK/9jqn0xCGZprHTVCcP/AtIzpJ
 AQnzOEatZfSEmMfc=;
Received: from mail-psaapc01on2115.outbound.protection.outlook.com
 ([40.107.255.115] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nSDXm-00AeEd-IA
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 10 Mar 2022 07:49:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Je/ZMpJD4Gak9HKRIFzPh3W9dV3qGGLaRYaCh7pD9f0sHDnprqLoEr6tQKmk00Zef+iTN42azN2eu+G52/YUsQWA+PqB0Ip32T0r2V/1q0KM/l8UHgCalaO8nSQjdr4sih3Be9Gb3UH3yz5IhToKVlvX5mv9Rh6Uqzh+VKcsr8Ov5XPzH5Io8K8f/ARkT+YhWjQxsK0bSv8CgSzsWaZrBge+yEx5HPanydXCDrDDpdCKbyrgFJTto57CmTG8WcptjKp5DRhDYuMUrRSj0SgyZn6N6HiD7H95otwJufZAsUHyu4M2uaPnxsw5cwRlZ7v/6b/fJW2j/O8PwOI+HN+KzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppuosv98ypDk5VmwFqCU41/2nCuEn6pZvDm2z3lk8xk=;
 b=OZ9d1At6bExJqZ9SVYmp/1HK3qWTkGMflcB0bWIn4X7P8vKU0K5cfXB4xY6YYdt1N+HZMHGMMZrvfDclJ05NoYqmXjdoqJ1tck1K/2Nk2yg07nYsX4s4vYTmw90CYpTMYqAsisHHjx8Dtskdf5xXK77Xng0ko1bd0rgT+JJDgA/SJOD8BaLJOozXLbUh1jY3AZJRrrctkDZcoU2m0yMuvqkweFLV9GRlJ6JFnt7UWI2h6847hRt/w65ISi2ZAxdejFXQyuEldq/Sq61et8iD+ng9hMmt6VL6qKoyn83b+fgeM6BWsP8haPD+ZybKlN8+we/FdtbU6DiT2p+9u/TBdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppuosv98ypDk5VmwFqCU41/2nCuEn6pZvDm2z3lk8xk=;
 b=QTFnJCgqqIyLefxRgO1+mhuD0ducC9p7kFsRUvlQZS0fOoGo+BKG7js0eTSi7Rm+2E374q22TeTZyL/wgevez1sP4AX+b4T1QLEdan/aHDo7+Z5tKey9f0SK/N9fCArKp6RaiFtGoqip02MJD8fiCWWjoJkXt1O6kIN+YyHF/yE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by PU1PR06MB2357.apcprd06.prod.outlook.com (2603:1096:803:30::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.16; Thu, 10 Mar
 2022 07:33:23 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::1168:21dd:36ff:be89]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::1168:21dd:36ff:be89%7]) with mapi id 15.20.5061.022; Thu, 10 Mar 2022
 07:33:23 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 10 Mar 2022 15:33:12 +0800
Message-Id: <20220310073312.206465-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: HK2PR0401CA0012.apcprd04.prod.outlook.com
 (2603:1096:202:2::22) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8339591-604d-4901-7df5-08da0268422b
X-MS-TrafficTypeDiagnostic: PU1PR06MB2357:EE_
X-Microsoft-Antispam-PRVS: <PU1PR06MB2357D4F255B519E6909CA79CBB0B9@PU1PR06MB2357.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: OEJI9KHeDFMQ4V7yESRPbLbCJXu+1oE0vHJuclKrnz17bpbx/U/72WvN14iMCBGMnd8hGHNkOuMjSWZ/ihpQ4sa2/+bkolkZbtt/c2WXclVlWitam8S5jivvDK/sAOCMnrOQHUr+lCSqqwYrNFeqvQOp3F1eUc/QDuUGJ310/UMIXIkLhVowLJbD0CPJp3iQHcYXVBrMK5n0b1WxnUanD1L+CGwGW23cZ2w1CokvWTGOpCz6D47rZt1pnes9Tc8f27JG5O2zmGC16MgS/3RL26s0ixNjVrdaQuRZFJzyDkzIczEq4a5JgdFgGlo9GbEPuoYw1noPQu22hqFdbnnOECnlFwzSQwZVM48zA/6Zefg2yT576QD9CwYtSpA5n8UYIYRqRUI9BiPc/Cf6UsIjcNqBa8Ue+0ot2UoZM2a56BynfJ+3ZWAwgc7KREds4pGSX/kgBgOeeMdR8F8CIlHO346JSUaxGK37NkzoxSfh9anAFkF6/0mU2G7PeoPCo36plUDeyDl64+9B4/ulSnSR6xtFHiw8QQP6hvfW1CMML2vOIFfMPvwHdOp1BDpgvx7DTiqG3JKLjQNM5QoUqbwg6JVh/Z5oQfXNTu56s/9zzhxb+cB3xdbWuGnB5CdX+Tix
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(2906002)(6506007)(38100700002)(1076003)(186003)(107886003)(2616005)(316002)(66556008)(26005)(6512007)(6666004)(52116002)(508600001)(38350700002)(6486002)(86362001)(83380400001)(5660300002)(36756003)(8676002)(4326008)(8936002)(66946007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: rfAGyuHgs7rQ7ouKGWHdM832NxSZU60rO9QxbQgyCsmbgLqXWIaxjeZ6PH1EavxC0vIIhTe2GAU9J8hvwCdkbqKXlPQ73pFaM/b0/OlnwsjGE/JOGL7rdh6/6i+5D5MHydypAuhJ+zGCuBVwnboXdefBP2fDzCZQ0NeOn64Qka2fvqVpuGaxsTJwd21jT5yTZPJguAWyuKEDiNGa7roX54dxlIZcdxrKHHlIWcW4l+RuSQgvOJc1WYMnfphnSuFdx2MXIEmHyCBLEddwWOHDLPJd2jUQ81ksbXRbZ3vDN49momEn93cdIriYZtGIURQkcyYfCxBHtHBfOPwk8VCtylTMbiWSsJTkjZ9hFDtuAvT/b8fDSzLRGqJPWO3iLxFLSZTny2oees/3t3l8xm1E7PNkYZb8PhVNi/eKRZSaZJ5qf6F70DAD2ip11gi99fyd
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8339591-604d-4901-7df5-08da0268422b
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2022 07:33:23.7758 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ucq3nkViREbxbXycnB3fYetoCuh6q3CpfoElpONePr2tdrYZFkwlNUMwW77DoFsoOz1LKzsrznXDc+lH3s3Hrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PU1PR06MB2357
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
 no trust [40.107.255.115 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.115 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nSDXm-00AeEd-IA
Subject: [f2fs-dev] [PATCH v2] f2fs: fix compressed file start atomic write
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

The root cause is, after commit 7eab7a696827 ("f2fs: compress: remove
unneeded read when rewrite whole cluster"), in step 2, f2fs_write_begin()
only set target page dirty, and in f2fs_commit_inmem_pages(), we will write
partial raw pages into compressed cluster, result in corrupting compressed
cluster layout.

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Fixes: 7eab7a696827 ("f2fs: compress: remove unneeded read when rewrite
whole cluster")
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
