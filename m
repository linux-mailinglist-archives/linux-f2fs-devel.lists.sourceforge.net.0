Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C260A6A034A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 Feb 2023 08:32:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pV660-0002AQ-Ee;
	Thu, 23 Feb 2023 07:32:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pV65y-0002AI-QS
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Feb 2023 07:32:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=faW3HhIAR1MlfDaocGw3VLd9DV5LRNDAzL7XApSVfW0=; b=SRsS45SkBiSJn1WdK2+2/6cHmD
 +Wiufct/AwFmqLFyddZJlF5Jm9WEnMeSYF4/oW6OQJUEg0apUgs9oxA0DxpuZc6gsCfK4ch7EoKHO
 6rKKXZ6+2CXax0ihnlMlHVGC86h8DpFpfynwqjRlRLXnlVTlprUKrw3IUmzq5UvaDKnU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=faW3HhIAR1MlfDaocGw3VLd9DV5LRNDAzL7XApSVfW0=; b=m
 /jp1P3oae75SV8ZzncMeoOUD1vcborlscicQRK1XAb+9+9DyyMtLG8ZPcggq1EcYsDCiSPExWE+mf
 woscXesl+I6KSm+X01xvQtsACAWv/EZiV/yL4cr4xYrYLleCK91vz/yM5LuuIatmsVoIpd5vtl3gn
 zq1UwJTqhCC/ZexE=;
Received: from mail-psaapc01on2136.outbound.protection.outlook.com
 ([40.107.255.136] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pV65u-00EGWd-9Q for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 Feb 2023 07:32:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CLf+SLD6FWo5Q7JeAD19sPtS/PFBif8GwUbE+zjB5CMD5YFInEt8B4+FIw0Frk0QtgIHet8z//onKTOkDgUQQDx73uBYI11J0el9WqqMh+B3btuWcjiVxCZT1NF8b31iE/MklMjiqCK8hzNTX3cz4PgD+ZTMTQlQiv6vT7Qcv9h6NdN25HfHZNewRNUmSUV7Tejr4NcgPbCelvkWtwVJfsUqwn12isBg7Qetsw6SHN0clw0CICRqAsz8KFJmMR6OK31qa1pH81NM5TsuYcnfKwJkvuVNS1yV+cxJpQoEMGJwGULlzDPIulNuWWZxzWBhrX9QgwJPP76cW78/prmOJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=faW3HhIAR1MlfDaocGw3VLd9DV5LRNDAzL7XApSVfW0=;
 b=P3YC4cUtGVNxGLC2uICMGS9qnRj/E8wjF5aXh9gpxwfe4FUBWkXt8wvqxa1S3okDMLQJ7qwdhjUemyAfquCeDEW9UmvbTxSS9y+TfVgr+j110lr3cJZe5hWotzQg3+lxC3eJqqLQTPWX/XreYxKyXCzfAQDg/gvYxgV3vZ3sI9pg/p4xtEavHeuhyOIl9tBQvhoUu+e7cOXYJ9OnOvCAVx7JUTv0J5F/ujRv43Sef1QThWUDr/D9jaLPy4gCDgGW70l14Juh2Qw1gbiP3EjKqjUlE2ruifH4cc3EnTFITBKn2xFW96S1xiHqY2yewc6CNmPCNu//i2SCyPY+MFF6XQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=faW3HhIAR1MlfDaocGw3VLd9DV5LRNDAzL7XApSVfW0=;
 b=Co9UnSWkq9LC/xoGvrEFD4map7w2+CEtjzLobzY+YJT+a0DyuZ5XsUB4cfctZVeYOGsDtlav6M4+Vn79x8QK7EvcHLNTsKX/M1iIakQhp+XDq9GMCMj307S8XWP/bBA4M+htDs0pMk87t3ipG1hujJd9NcCOY4jhqlovi/7jq++jhYBx45SYtaVd6PRjsQWZA1bWpyxn4iSE4xqA5evGW0EcQrOW/uDl8w1rYqOY4u0NyO7KRTrRIJ9xxFmjOO0vZ3tgX1d+JAsQdz1bjBSQhKJBLbkHVirgVt/eoWvPo78uBclbhN1n8PKTQ12FCyQsFdyWCo98JEH1hDp+SWxA2g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by SEZPR06MB5024.apcprd06.prod.outlook.com (2603:1096:101:46::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.14; Thu, 23 Feb
 2023 07:32:35 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::a2c6:4a08:7779:5190]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::a2c6:4a08:7779:5190%4]) with mapi id 15.20.6134.019; Thu, 23 Feb 2023
 07:32:35 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 23 Feb 2023 15:32:22 +0800
Message-Id: <20230223073222.81702-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR01CA0179.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::35) To TYZPR06MB5275.apcprd06.prod.outlook.com
 (2603:1096:400:1f5::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5275:EE_|SEZPR06MB5024:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e477709-417b-4102-928d-08db157021a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EpPkTFJNKEIemfMkr+89hlVVcnxlLZ/7BzrydEkDZYkn9v2W897cTbo87CD3n13PD0WjuCEKZIC57kP5b+bRgZViUXh/NCvI4nn4KVcd8uXt7AXloUEuiawZ1r0PIjJ4ijg0490qwdPuwH3nV9o0ZdPwjD/ucqwWs98wl7X6VCBhFviXRfWN4qa4UqeS4k0WVraqt2vHQkCP5OeWbiKEISD5Euu6LS0a7OkwQlU6CvRE5mXvpTr1EobcS0wCDuZeQvXYbkR0BUyrc8oM1j/2UCZq4QNFB+Lfi56ZxUWIUOL7x3WyN4cVyZPXhkj+ikfrMILVbbAcs+dHD+BXLk8Stf+Ftv/IAbisdwkpJBvimhtXMUTHtj3TOWVk0sMAoZP9ga1SKxZPh0IwownBGvpRv7oNmiGGSAKhifZjnCmMHlwhK87UbmKXPN8t6+LE5o3CwqWNAlfhK9DBWTQZnoYEr91wcFvZMfFpWK3tNfZ1mpPCWxqooqZSg6J1PyKH/DYjlnypNERsIE9rXxNqCFQi0aN+L3mFIWqJh4Nbeg5Uap+a/8xmP+okx/MVuuYr8K33yPRVnCHxHrt42cV7ZZRmuFuellJFSNxnfZSrqiqR3mZamqTbWApgC6dZ9UYYFsUU9IrxcHhzacIH1SPL4ExGjjWlgk7uvPieXtdmTUjf/MWTaZBpEGuHGKQZ1PVs6HbWrsVNMaQ/xC/czrP8rOakKQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB5275.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(366004)(396003)(39860400002)(376002)(346002)(451199018)(4326008)(8676002)(36756003)(6506007)(38100700002)(66556008)(66476007)(1076003)(186003)(26005)(6512007)(107886003)(478600001)(8936002)(52116002)(41300700001)(316002)(86362001)(83380400001)(6486002)(5660300002)(66946007)(6666004)(38350700002)(2906002)(15650500001)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7pKH/lS/CxR06suh3HjAoawPKxQLWbZgdM/F1Kh3Rkcj2YhinSmmKk5uLdoj?=
 =?us-ascii?Q?k7gfprztKE6+RhllCsnBd1s8cbtuKEmnSba9i/uqjoJWUJdAJym0jak6KzSx?=
 =?us-ascii?Q?e+JpzS8pkIn01Ai4e59AuczaqSSA2NTzNVDz/ulSNs3FKaU5ZsXcui1R2bEL?=
 =?us-ascii?Q?ft50YuYL4GfHiMIha3gZWcPeCnTyQivgrUbYhrVizE+dAb6FHap6y91YrDEG?=
 =?us-ascii?Q?hi2iUHpkY0jeZWNMxdusVu7tLXZuegcPu5qMGNG5nxaauuohjCOPLh/rRn8z?=
 =?us-ascii?Q?A0b701l1gKQNjEahJCy6LwU7M1ytBa+4Kbj7H5uljPfeT9A2TQHgLnF2INqN?=
 =?us-ascii?Q?2P+pfh6IjL6j59T3UK9kxYXYUZBsFEysIO1HxNJoK70Uwv/SkXAxv9fQIs+Z?=
 =?us-ascii?Q?8lrs0+FTmfHzJ2HXVYrRWfa7nvZbq0w/jpL1Zzu6BLZZucyK33eEhhkzx6xV?=
 =?us-ascii?Q?lU43ymlNcy0cWko4HR2tjqna9GUWRarcPmgyQbCj8IMaMTcfFKePvxTobVkH?=
 =?us-ascii?Q?jgL3NG3cnNlMbfVOLMae70vdtdsiyDYqpNTme6BcVFkxRsvTOmhvADzGvPwV?=
 =?us-ascii?Q?W8oYAN/zECbyDyJBaRIwAHQtK7+YrbvPqPmZXbk/GuS8O8BLHxJGZVhmJ6nY?=
 =?us-ascii?Q?oQyAxb7SbW9+E5RjmrRQ4S1fqHn2nsGzZvCqQwT9qPsL55i4GSm5qRm57qm9?=
 =?us-ascii?Q?H2G9+4EJNKjenxFTESOjkb3Y2jFm0hp8ZD30+h/APiS3uCOeH5Y122UGN0uu?=
 =?us-ascii?Q?D3DKzT7nfpQWEiv7wth0U/9XyA6NCJvACk9pFct7erw4OKJpijIKy+cw/h38?=
 =?us-ascii?Q?pw/7Vq2/SjdOwWeEMFuHnTsIv0PtCKNHFofc4++3gHXjE4oely5QlaTt/FLx?=
 =?us-ascii?Q?L35LMLwDanvjVGDVeXStGoX9FSvy4Pmx7WXdnbpK183Wrrc2M/Zi6e/3r3XH?=
 =?us-ascii?Q?hqbnBzZ/HkfIWlVtOVragZ/qdYbfgzVd92lOwDlQ30cLgacelX0t+Yuj9Q45?=
 =?us-ascii?Q?hQRGdm87DR00VXso2afhbNVClu4D70xGVdbv+ujoQ+cAmU5szDLR2yXs4yEi?=
 =?us-ascii?Q?jhkAqB/xbZ9HCpAj6uO/kzRU6Gdpu+CYk/817dreDebOH2HzBz3kK4fsQN90?=
 =?us-ascii?Q?SF40LOnLRMbvGvVicISXhFn4lQnSYdDhGf1Cd6KP4qWd/f2YZrHu1jUwQM7f?=
 =?us-ascii?Q?cGsd9PC0hupzzlzmn82HL5OhgPEKbthSILcsdUzD65O7OQeKOGNQ826cooHk?=
 =?us-ascii?Q?rWCTtKx3ojdm2jHnEGSCN7cPo4F2gzhKtVjjLinytmkGayyrj5ZoSjml9OrZ?=
 =?us-ascii?Q?86aIflKxuCE9nzqWgXZqGhTJmFB1YWhmccuRkY4zE389Ij9f8yfWHRe8NGsm?=
 =?us-ascii?Q?Mv+WvOwSWcg8hie8HLMi1oQjEdXx1rGnoXWglhYkqQfGyy0YTwggAM8z28Qy?=
 =?us-ascii?Q?IeDg/U2NOp5/Sdo9NA+zHQ2Lz8DMLpQAsPHwegBmBApuoVBcOqUJauakJXbh?=
 =?us-ascii?Q?cicwA8cONlAEyp7UFMWOnz+pPGcoWg/yoGJSNt6hl/ecJKUfJ7LWXa+Wxz3u?=
 =?us-ascii?Q?T8ABezaxzS4Fu+IGSi2j+Bw2/Ez9pCrxvMHZMy1t?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e477709-417b-4102-928d-08db157021a9
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2023 07:32:35.0369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eFOjdYUPWNIBQ4P2xh2EJ2K0Nok43z57mq1djmA6MxYHp384GIiz7tHahzS6tvfJ1BRH8lHkWZ4bflkPCZqFIA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5024
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  We should check quota file ino before enable quota, and not
 only 0. BTW fix following check error: WARNING: Do not crash the kernel unless
 it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if
 feasible) instead of BUG() or variants. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.136 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.136 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pV65u-00EGWd-9Q
Subject: [f2fs-dev] [PATCH] f2fs: fix to check quota inums
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

We should check quota file ino before enable quota, and not only 0.

BTW fix following check error:

WARNING: Do not crash the kernel unless it is absolutely
unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible)
instead of BUG() or variants.

Fixes: ea6767337f86 ("f2fs: support quota sys files")
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/super.c | 54 ++++++++++++++++++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 18 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index aa55dc12aff2..c7e0639892e2 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2652,22 +2652,40 @@ int f2fs_enable_quota_files(struct f2fs_sb_info *sbi, bool rdonly)
 	return enabled;
 }
 
+static inline bool f2fs_check_quota_inum(int type, unsigned long qf_inum)
+{
+	switch (type) {
+	case USRQUOTA:
+		return qf_inum == 4;
+	case GRPQUOTA:
+		return qf_inum == 5;
+	case PRJQUOTA:
+		return qf_inum == 6;
+	default:
+		return false;
+	}
+}
+
 static int f2fs_quota_enable(struct super_block *sb, int type, int format_id,
 			     unsigned int flags)
 {
+	struct f2fs_sb_info *sbi = F2FS_SB(sb);
 	struct inode *qf_inode;
 	unsigned long qf_inum;
 	int err;
 
-	BUG_ON(!f2fs_sb_has_quota_ino(F2FS_SB(sb)));
+	f2fs_bug_on(sbi, !f2fs_sb_has_quota_ino(sbi));
 
 	qf_inum = f2fs_qf_ino(sb, type);
-	if (!qf_inum)
-		return -EPERM;
+	if (!f2fs_check_quota_inum(type, qf_inum)) {
+		f2fs_err(sbi, "Bad quota inum: %lu, type: %d",
+				qf_inum, type);
+		return -EFSCORRUPTED;
+	}
 
 	qf_inode = f2fs_iget(sb, qf_inum);
 	if (IS_ERR(qf_inode)) {
-		f2fs_err(F2FS_SB(sb), "Bad quota inode %u:%lu", type, qf_inum);
+		f2fs_err(sbi, "Bad quota inode %u:%lu", type, qf_inum);
 		return PTR_ERR(qf_inode);
 	}
 
@@ -2682,7 +2700,7 @@ static int f2fs_enable_quotas(struct super_block *sb)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
 	int type, err = 0;
-	unsigned long qf_inum;
+	char count = MAXQUOTAS;
 	bool quota_mopt[MAXQUOTAS] = {
 		test_opt(sbi, USRQUOTA),
 		test_opt(sbi, GRPQUOTA),
@@ -2696,21 +2714,21 @@ static int f2fs_enable_quotas(struct super_block *sb)
 
 	sb_dqopt(sb)->flags |= DQUOT_QUOTA_SYS_FILE;
 
-	for (type = 0; type < MAXQUOTAS; type++) {
-		qf_inum = f2fs_qf_ino(sb, type);
-		if (qf_inum) {
-			err = f2fs_quota_enable(sb, type, QFMT_VFS_V1,
+	if (!f2fs_sb_has_project_quota(sbi))
+		count--;
+
+	for (type = 0; type < count; type++) {
+		err = f2fs_quota_enable(sb, type, QFMT_VFS_V1,
 				DQUOT_USAGE_ENABLED |
 				(quota_mopt[type] ? DQUOT_LIMITS_ENABLED : 0));
-			if (err) {
-				f2fs_err(sbi, "Failed to enable quota tracking (type=%d, err=%d). Please run fsck to fix.",
-					 type, err);
-				for (type--; type >= 0; type--)
-					dquot_quota_off(sb, type);
-				set_sbi_flag(F2FS_SB(sb),
-						SBI_QUOTA_NEED_REPAIR);
-				return err;
-			}
+		if (err) {
+			f2fs_err(sbi, "Failed to enable quota tracking (type=%d, err=%d). Please run fsck to fix.",
+				 type, err);
+			for (type--; type >= 0; type--)
+				dquot_quota_off(sb, type);
+			set_sbi_flag(F2FS_SB(sb),
+					SBI_QUOTA_NEED_REPAIR);
+			return err;
 		}
 	}
 	return 0;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
