Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BD3F6D0A7E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Mar 2023 17:53:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1phub4-0004Z1-N0;
	Thu, 30 Mar 2023 15:53:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1phub3-0004Yv-Jm
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Mar 2023 15:53:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=D5GnJ5XgGnJGhMgT4ne+3mtU9fx/t9qTuiA3Re2+zpQ=; b=Vbto+98D9XeRSGa4v1ztaRjO9D
 p0w1nQkkPXFbKWxBXit39gcfHTYSVzqfc6CPi0ANTX87wlB6TeLkZMHgeyOelDO0OrIBtVgYcjJWN
 dO2o1NLW6wScsbbb0dFSj2StrBQakFCELgn/MQABMlkBM43KcnSJ86rdnCGN7wUzf5Bg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=D5GnJ5XgGnJGhMgT4ne+3mtU9fx/t9qTuiA3Re2+zpQ=; b=k
 547RJ5uK03IOHE+2Z49TnKlZJYA8a7xHZQ1Tp21c9zIolNoqb0Eva6RMx42rSu2VXYeuo/Zd5Lr4U
 q7BTLbORz0GBFsNns84e50HxmZDOzHUwT25W4DxEK0KjgBDgBlKqHFYmtN/M02S/u6zGRO+ktlzc3
 qD3mfeEeTgdQI55I=;
Received: from mail-tyzapc01on2049.outbound.protection.outlook.com
 ([40.107.117.49] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1phuav-009quV-W2 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Mar 2023 15:53:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kz6BwLgWmRoyXQq80DYUDtNIRW+IcS4LvXBolQVN+8sKKx3fxlGbSWB90NTwwe4jfOqu6R2QoSdM8ffi7eiZRFBtntq8rlqhoX67D+O8Rr+x0v41uRVWgnMDznqvBeiY1SZOb8AQ2JyAVE6aHpSvaN2IOFqgXKOsUkxbP4vqiysd4josDGRhcwIhGFOEOrVkKQqaMwB5b8YfKfHpT5sKVycWvG23EGwn7Hec/5eGzmazYlbUTR5QnMflU42E2F98LEMGh32MCSHrc3Su9KOEQiBskV+jyoGit6xqJICtTd1XWVWvOxQ09l5sW7VuneUUPq42/hpJ5khIrpXsC+t0DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D5GnJ5XgGnJGhMgT4ne+3mtU9fx/t9qTuiA3Re2+zpQ=;
 b=X3EoRqypKOqeoId2wApzkocsYYAarI9ySZ04l5lP3c1FYDrF0D9iRs3TgnH6OyGC7CfKVrW/FIRtyhsqheAkjZM/DdWfCoqziZqP+Z6cuaRNk/I470QU8aTdGpSzb7T6dMeZlwoYcf6DDWxMm6cmBODhgGngBSqj2gCHaMQI43X/Aob2OiFwWSq0AcumOUVHYwPzhwTFwG2DeMEtwTZs5PXt+I2ZlN8/6kmuPmPoTUK/WIGrATSbwucS38u0nIbYnQjrHT/wIQnbBvE2RB8OQ7Y0boGJSW6hXP3jTwH/ABtPNnqp4CCTFDJhcRR75CjCEYNDQx7B7CrgE+4u7FjVOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D5GnJ5XgGnJGhMgT4ne+3mtU9fx/t9qTuiA3Re2+zpQ=;
 b=qPWRbfqfWpLzHDljTqrEQyKNASVAtorY5MxVqV5ERw1NciMC1Zb/z/71mkexEMLPylG5mAWpfIGxw0wk2D0gdCpsdKEaw0Srb19dH0qIQLG66ZjHWQKMN6UkPV2ROdT1hfJD3xZrNjOuCmTxF/u+VPAbCZwZI8eHwVdsMcmvG4w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6) by
 SEZPR02MB5663.apcprd02.prod.outlook.com (2603:1096:101:4f::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.22; Thu, 30 Mar 2023 15:37:42 +0000
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::9a8c:cd43:d810:b523]) by SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::9a8c:cd43:d810:b523%3]) with mapi id 15.20.6254.021; Thu, 30 Mar 2023
 15:37:41 +0000
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 30 Mar 2023 23:37:19 +0800
Message-Id: <20230330153719.3085164-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SG2PR02CA0104.apcprd02.prod.outlook.com
 (2603:1096:4:92::20) To SI2PR02MB5148.apcprd02.prod.outlook.com
 (2603:1096:4:153::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5148:EE_|SEZPR02MB5663:EE_
X-MS-Office365-Filtering-Correlation-Id: 14f6b3fb-deed-4350-547f-08db3134b329
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NikSk3lUGm94LuojxBmSsrZQeVrEX+aneJPwUNCSiTzUj6LmgQsif14543jWmS6SgEOBxU2GJgOKt+Dnecf9BHnN3iIsFEEz1pQy9xy8PM+0J3x51TL4sMnaU2SASC2ptw48bxvQXZDJnL1WNtGg8S1nfXyqw1+hJMj0s8/xOJE9UbefZOmpT/v6rDQ8OP9XmhC2zjCMK6ttN3ypQtO8UH5qoUjXbCzZ9QE6cMfhQSukHIu01TpRo+n+ybFd017XViL1lqdEXOpFXNy/HOxNoJpTiq1yiSfkr8uoGuoaNpR5PbAxru5FM/70isSvmU1ErvkgA33AQYLrQU84By3g5FKWb58QoyJKnZxFQFW4boiKDP6Ld//6uXA82iRltARUCVvFKqhzXanfLq9XavwofsR8kQuZVSEkuur8TOuuwvIY4pIdYssymqrMEVAj8QdpKrQ1WmzgtbOw5aslc3HtwOYT0Dio1ZW6MtoRnQjEYxwNV48BXGzwweFxIDkkBoc8aPHy4uc4n2wIpXmbjftiW6gWifhPe2c2en4f4pQjEEFpBHAfCfxjmOBEXpP5LAujEVIwdP0cY/rIkd8CLoWCMdZhZdbOFJrs9uPha350REU8i4LH/R0NOkkctntvNJIM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5148.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(396003)(376002)(346002)(136003)(39860400002)(451199021)(2616005)(107886003)(26005)(83380400001)(86362001)(1076003)(186003)(6512007)(6506007)(38100700002)(38350700002)(316002)(8676002)(8936002)(41300700001)(6666004)(6486002)(478600001)(36756003)(5660300002)(52116002)(4326008)(66556008)(66946007)(66476007)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dPda5ank+fQg7wQWrGrYkhyAFB4ED5HeV6xD3O5iaiGyOnDd4/kjs03bB6yp?=
 =?us-ascii?Q?Sp4z586lWzSPIwHhtPhie7ESX5MBxW8MnZHIp1J8WTYAQxXVPSc47Arj/tur?=
 =?us-ascii?Q?S4GwT/oHXp/ehGFP1gR3HvHsaP18drYO8mn0RMTkZXugbYnNhIRMKGI+3+Gp?=
 =?us-ascii?Q?OKx1u6JqRwPE5xpDqPFIjzBQALUOIrUaj8CZpBFdVZgF2aJw5TANlkryr3Xz?=
 =?us-ascii?Q?FU+Qd8DhV4bOwkPWx9pni2lKjp6O6FcK9jBitgj4UQNBJMaw1uziytNv0e/v?=
 =?us-ascii?Q?UuyJSGrOAH6g06hg6oy/TBv65toHi9Tj7AUEa6XaDJK3vuSDUwY4hC5vhEIA?=
 =?us-ascii?Q?puBvK5wPEmjm8E0qJEnCkPblLyqCnOgM2bPYF1CWTc9qsJjM03bJPGmRO3QB?=
 =?us-ascii?Q?BqtEfMUiwcLhrKS+32n1jrn+Lgbh77hNSvQHhzcSosU9dtHzprIC3Rk9bVx1?=
 =?us-ascii?Q?nUgOcqrV8DBHkkndPW3YX0wgiywxH5C0tNjvgZIccLbjGIqQX+K9sLmrJO+O?=
 =?us-ascii?Q?UjbpvQ/h4gdQ8n/z0nji+s9f/59h7YcuwZ6dU/i4g6TuEIwh08n+VZjyxQ2b?=
 =?us-ascii?Q?TwesAJR3oppSsLUcE1jkn69Emwo9ogBFiijuFjpqblDKWpSv4yZ3+t8TdcEM?=
 =?us-ascii?Q?jtw4FdQ9bTxfNF6G/K2SG0PKhP0QPGAycRpCPWIsOXWRdfrNyNfuttEL7TQy?=
 =?us-ascii?Q?v/4AZ47zT3Z7AdlNPHHZ/3ZpP69hsurgMuUjTSS1UPHpH1rkGkcJaEGkuKKr?=
 =?us-ascii?Q?t0EioX3AdcidcAY4+Mo5VhkBMsASQw+VxE6BGmf9JRiYzHJ+4ZXBdNDoOhal?=
 =?us-ascii?Q?1azWyiFfLsRtkzNDjGn83JMwpgdnQfFpkh7uDqMWLeq09oZKdTK2K3qXMIeJ?=
 =?us-ascii?Q?LT1dkCwlNlewLTZJvAYfJAH+99JMaszAyvtXl5gcoYxJbIOB/Lktymisz+1X?=
 =?us-ascii?Q?OIpfXL2/RXH6Mj39/Jgb6bJK3mtKk/rVHzOWeGX753VYaWwD3geXaE+aM+ji?=
 =?us-ascii?Q?Z3vfD8uMt2Ajml8y8zLV0eQJ530IwqarFoAKnE8kdl0rBCsLB313s9iKhXkg?=
 =?us-ascii?Q?rqImTdRLWRsviABYX30T/cWuKw3jLPHjkpby+PeuHQmNClrTGJUEJQ4q6fiR?=
 =?us-ascii?Q?4tAQX3Sc/wM+aDHPorq2BJMpo3DzXNQXukXz4A0nPZ2EMHyasulBtI9ocEbR?=
 =?us-ascii?Q?zB8/Y9XmnTZ2++5b+wANKJIPbWokwGKEPw+s/E90GCKVK/xTE/6glJFyBoBA?=
 =?us-ascii?Q?mtZKrYE48s3t2206VheFgy91zbmLE7E6Oc+HgqkhMagUxPJrEBWyK7acCN+c?=
 =?us-ascii?Q?7i+HGkr0UHcELNbfk4RxW7K1DUVvUFKFOD7OROI6ojSKOwYMjI5d3WDZOAJx?=
 =?us-ascii?Q?qkSHFA6byQam6ctie7j839v71NYfxdc+ckgYfm3AGmA0LCYLVJz8jEpjkZVN?=
 =?us-ascii?Q?j4hOmj11Xk99+lM5J6zqcyyWvNtm/kjdSZQlxfOe82NlcxWgSIvGofDStn1l?=
 =?us-ascii?Q?+Amqehncg1pUgsGcrV8NKygQWUWlOTlZa/nbbRNJ2+vgqgzA25M8WpdRGLW/?=
 =?us-ascii?Q?Pp6NW5g978LKyslM8yO02SS9XJzVvW1mndyPTRJr?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 14f6b3fb-deed-4350-547f-08db3134b329
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5148.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 15:37:41.8932 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0f3tCewMOrHa6bdLU/ib5YLPZQzhInS3Nd8K/p6dYDcYYGXKV06Woh9JAKviebzDp5/kexQD+YQoBbVhAV9Xag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB5663
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch adds `level` in `struct f2fs_compr_option` to
 allow
 ioctl setting compression level. The first byte of original f2fs_compr_option
 indicates which algorithm is used. While the new f2fs_compr_option splits
 the first byte into two parts: * the MBS 4 bits indicate the version * the
 LBS 4 [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.49 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.49 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1phuav-009quV-W2
Subject: [f2fs-dev] [RFC PATCH] f2fs: expand f2fs_compr_option to allow
 ioctl setting compression level
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
From: Sheng Yong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sheng Yong <shengyong@oppo.com>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch adds `level` in `struct f2fs_compr_option` to allow ioctl
setting compression level.

The first byte of original f2fs_compr_option indicates which algorithm
is used. While the new f2fs_compr_option splits the first byte into two
parts:
  * the MBS 4 bits indicate the version
  * the LBS 4 bits indicate the algorithm

The original f2fs_compr_option is renamed to f2fs_compr_option_base,
which is used to calculate ioctl command. For now, the version could
be 0 or 1.

When getting and setting compression option, the first byte should be
copied from userspace in advance to get the version. Then copy the
whole option according to version size.

The new f2fs_compr_option could be compatible with old userspace tool:
    Old tool does not set the MSB 4 bits, which keep all 0. F2FS
    detects option is version 0, and will not return or set level.

But if new tool is used on old F2FS:
    New tool sets the MSB 4 bits to 1, get_option could return V0
    values, but set_option will fail.

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fs/f2fs/file.c            | 41 ++++++++++++++++++++++++++++++++++-----
 include/uapi/linux/f2fs.h | 39 ++++++++++++++++++++++++++++++++++---
 2 files changed, 72 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 14e9a20e68df3..909da18208d76 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3904,10 +3904,27 @@ static int f2fs_ioc_get_compress_option(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
 	struct f2fs_comp_option option;
+	__u8 ver;
+	size_t copt_sz;
 
 	if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
 		return -EOPNOTSUPP;
 
+	if (copy_from_user(&option.value, (__u8 __user *)arg, 1))
+		return -EFAULT;
+
+	ver = COPTION_VERSION(option.value);
+	copt_sz = COPTION_SIZE(ver);
+	if (copt_sz == UINT_MAX) {
+		/*
+		 * In order to be compatible with old version option, whose
+		 * algorithm is not initialized, the V0 option is returned
+		 * instead of error.
+		 */
+		ver = F2FS_COPTION_V0;
+		copt_sz = COPTION_SIZE(ver);
+	}
+
 	inode_lock_shared(inode);
 
 	if (!f2fs_compressed_file(inode)) {
@@ -3915,13 +3932,14 @@ static int f2fs_ioc_get_compress_option(struct file *filp, unsigned long arg)
 		return -ENODATA;
 	}
 
-	option.algorithm = F2FS_I(inode)->i_compress_algorithm;
+	option.value = COPTION_VALUE(ver, F2FS_I(inode)->i_compress_algorithm);
 	option.log_cluster_size = F2FS_I(inode)->i_log_cluster_size;
+	option.level = F2FS_I(inode)->i_compress_level;
 
 	inode_unlock_shared(inode);
 
 	if (copy_to_user((struct f2fs_comp_option __user *)arg, &option,
-				sizeof(option)))
+				copt_sz))
 		return -EFAULT;
 
 	return 0;
@@ -3932,6 +3950,8 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
 	struct inode *inode = file_inode(filp);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct f2fs_comp_option option;
+	__u8 ver, alg;
+	size_t copt_sz;
 	int ret = 0;
 
 	if (!f2fs_sb_has_compression(sbi))
@@ -3940,14 +3960,23 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
 	if (!(filp->f_mode & FMODE_WRITE))
 		return -EBADF;
 
+	if (copy_from_user(&option.value, (__u8 __user *)arg, 1))
+		return -EFAULT;
+
+	ver = COPTION_VERSION(option.value);
+	alg = COPTION_ALGORITHM(option.value);
+	copt_sz = COPTION_SIZE(ver);
+	if (copt_sz == UINT_MAX)
+		return -EFAULT;
+
 	if (copy_from_user(&option, (struct f2fs_comp_option __user *)arg,
-				sizeof(option)))
+				copt_sz))
 		return -EFAULT;
 
 	if (!f2fs_compressed_file(inode) ||
 			option.log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
 			option.log_cluster_size > MAX_COMPRESS_LOG_SIZE ||
-			option.algorithm >= COMPRESS_MAX)
+			alg >= COMPRESS_MAX)
 		return -EINVAL;
 
 	file_start_write(filp);
@@ -3963,9 +3992,11 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
 		goto out;
 	}
 
-	F2FS_I(inode)->i_compress_algorithm = option.algorithm;
+	F2FS_I(inode)->i_compress_algorithm = alg;
 	F2FS_I(inode)->i_log_cluster_size = option.log_cluster_size;
 	F2FS_I(inode)->i_cluster_size = BIT(option.log_cluster_size);
+	if (ver == F2FS_COPTION_V1)
+		F2FS_I(inode)->i_compress_level = option.level;
 	f2fs_mark_inode_dirty_sync(inode, true);
 
 	if (!f2fs_is_compress_backend_ready(inode))
diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
index 955d440be1046..940cf46174357 100644
--- a/include/uapi/linux/f2fs.h
+++ b/include/uapi/linux/f2fs.h
@@ -37,9 +37,9 @@
 #define F2FS_IOC_SEC_TRIM_FILE		_IOW(F2FS_IOCTL_MAGIC, 20,	\
 						struct f2fs_sectrim_range)
 #define F2FS_IOC_GET_COMPRESS_OPTION	_IOR(F2FS_IOCTL_MAGIC, 21,	\
-						struct f2fs_comp_option)
+						struct f2fs_comp_option_base)
 #define F2FS_IOC_SET_COMPRESS_OPTION	_IOW(F2FS_IOCTL_MAGIC, 22,	\
-						struct f2fs_comp_option)
+						struct f2fs_comp_option_base)
 #define F2FS_IOC_DECOMPRESS_FILE	_IO(F2FS_IOCTL_MAGIC, 23)
 #define F2FS_IOC_COMPRESS_FILE		_IO(F2FS_IOCTL_MAGIC, 24)
 #define F2FS_IOC_START_ATOMIC_REPLACE	_IO(F2FS_IOCTL_MAGIC, 25)
@@ -91,9 +91,42 @@ struct f2fs_sectrim_range {
 	__u64 flags;
 };
 
-struct f2fs_comp_option {
+#define F2FS_COPTION_V0	0
+#define F2FS_COPTION_V1	1
+
+#define COPTION_VER_SHIFT	4
+#define COPTION_VER_MASK	(~((1 << COPTION_VER_SHIFT) - 1))
+
+struct f2fs_comp_option_base {
 	__u8 algorithm;
 	__u8 log_cluster_size;
 };
 
+struct f2fs_comp_option {
+	union {
+		struct f2fs_comp_option_base base;
+		struct {
+			__u8 value; // MSB 4 bit is version, LSB 4 bit is algorithm
+			__u8 log_cluster_size;
+		};
+	};
+	__u8 level;
+};
+
+#define COPTION_VERSION(val) ((val) >> COPTION_VER_SHIFT)
+#define COPTION_ALGORITHM(val) ((val) & ((1 << COPTION_VER_SHIFT) - 1))
+#define COPTION_VALUE(ver, alg) (((__u8)(ver) << COPTION_VER_SHIFT) | (__u8)(alg))
+#define COPTION_SIZE(ver) ({					\
+	size_t sz = UINT_MAX;					\
+	switch (ver) {						\
+	case F2FS_COPTION_V0:					\
+		sz = offsetof(struct f2fs_comp_option, level);	\
+		break;						\
+	case F2FS_COPTION_V1:					\
+		sz = sizeof(struct f2fs_comp_option);		\
+		break;						\
+	}							\
+	sz;							\
+})
+
 #endif /* _UAPI_LINUX_F2FS_H */
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
