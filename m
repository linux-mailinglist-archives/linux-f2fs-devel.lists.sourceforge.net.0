Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C4587141DD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 May 2023 04:08:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q3SIj-0003Og-Nu;
	Mon, 29 May 2023 02:08:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1q3SIh-0003ON-L4
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 May 2023 02:08:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3G8+uiDrbckIv8h1mWbhrzMoneuA8FhW8Y/LsK8APeg=; b=mdW0QIzxegc370GBgBlzaVrmQg
 5ALUbkLBDwAcSACX7rLtVfZ+u4LFTdJrnLVHHGkc7CKD5ci2mEF6noey3sAarib36NBz9WR9LgbDp
 coHqddlGeS187gzYtOXoBY91jNGAT9XJ00q0NlaHiNNyfGIesWgxdq66PaQk9FUSKszo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3G8+uiDrbckIv8h1mWbhrzMoneuA8FhW8Y/LsK8APeg=; b=h
 5+BAdxO4JpBGbYLb8WlL+Qy9Ur9liA9DNxi7Z/ml5NcasLMmTQtSVt0rLPawDlNDAqJ8ZVbs4bC+F
 RbEH+EorVezJTxJSACIPLoTUCADWSWt79bYZ5KeOHe+gdFObx1ZbrlcJV83mTyVVNezDfVypI5hPq
 VSB3WxMplttqMrxY=;
Received: from mail-psaapc01on2049.outbound.protection.outlook.com
 ([40.107.255.49] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q3SIb-0001xi-Ev for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 May 2023 02:08:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Wq1ypVN/ZKJdL2lBX9HUuApZSYEIUCmBw48UagutCh/cQ/OWdb8EympNiNLlcLh1xAx32VgSFWT18A/CNx/6jQskY7cp0hvhdo/cj7F7uqC5oZ5JUVN7mZ8FJflxamXObP6cZIILa8Y5YhaXcsjyqYCTYA6itLcjgZRrOZPWG8DNS9MpGbVQ7wQLCA/7tIa9i9hFnDgkegG0wuxPlwawMORrjGYvHwsUqQU0lofzejOsqnYfbd4G8Ue8EfDk++r0ijsWIGxqYWTp/T5DzUEHAloLYsgKefM1XFO3lr/8jKh9NjXW7YUUWB+9l/6SXS+uBvTI0b9c33AE+RriV2Vdqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3G8+uiDrbckIv8h1mWbhrzMoneuA8FhW8Y/LsK8APeg=;
 b=lrUU/Ztyeyua1o/4noQLr+oSIGgFUqNeWw3ToxLwO2O+WNyu2YAC2Z5/x+pYDIBY2AFjPxQ02dvrSRVZbHTyNKMYQhOtv7pK80S+iW9WTD9D95e8QHXq8irek/Mya1V+MpIcEYWRVff96ghifPEK5AiFzAMSQ/VIURpelAPdbRfC2On398vswQT2cfOrk0S0GpCaPeYo0+DGUkS/Dq7oHa4tElmcj1Kv8XsSpeKH/OJ4TxSp76GL/qhxCPNovhiQ7722MKGNHCR1kXRrjBRkiU5/8D6/JZ3iFQQH9W2D3wCLc0s7LxOlmf7nNdxOwsBC62TPpaEeI9istC+Aj9u4AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3G8+uiDrbckIv8h1mWbhrzMoneuA8FhW8Y/LsK8APeg=;
 b=vVoOzHBmkqaofF1KJnOjwTAy2/X26sHui8MnCJdYUtonSYpBxZ5N7ftxywcX801Q0SxYzVk7SpuQI+EJKSN3S4aLfqp4ntpKwQjFaOCngiR9Qty5nEGFkBQFYX79FfjwKZdtgekrM3AQTPXNdm/HIWlBB5SiNQ1peZWHCb1405A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6) by
 SI2PR02MB4617.apcprd02.prod.outlook.com (2603:1096:4:ec::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6455.18; Mon, 29 May 2023 01:35:28 +0000
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::1bc4:fbb5:b757:83ee]) by SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::1bc4:fbb5:b757:83ee%5]) with mapi id 15.20.6455.020; Mon, 29 May 2023
 01:35:28 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 29 May 2023 09:35:00 +0800
Message-Id: <20230529013502.2230810-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To SI2PR02MB5148.apcprd02.prod.outlook.com
 (2603:1096:4:153::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5148:EE_|SI2PR02MB4617:EE_
X-MS-Office365-Filtering-Correlation-Id: efe1bbf7-1258-412d-39a0-08db5fe4fb4a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fg3bhp2wYy0XfjXs6HBP8yCJqWBKGv+7jxXTUFajroZpcUCotuVX+jZzQc8akDDvLhw8xqvRC9/0DZfDPscSv+21i081rQZF8MEN5YgOIt78GCavCwzI3EXv32wL+j3+rBzQvcjMTQsQ2R5v6BdnfQgapT4KvN5iXJUnUJbwl/Lz5c5ghXfIbyoPblsWMyu+MjaLEBmOVxlZnbK9tOI/wl2IPFpQPxOiEoRRWcAYfE1g0EtGHwQUGM/c3H1exiS9iZTFmAMWoBIeZ/vkcAU4DscHX7Ng799nSbLMrB13Asr44L4c8DIrspJAYDyu02XcMxQ/9ACqtYrv+D/pw66WMH93jZWdwMAQVfeCy2ysEv7uDzH/JqxEQmHkbPaW+R0lWAZ1tyPs1seKR6m3hBB1WLWY6NbX5DP+lHK/OZN+O20gF14K5LclW3qVMqY425HhzeTwbulJR0+i6pIaH2cbD0yk8sHYDYFPm8rsW0HiKeQkNQNnDR4M6vCAbRxHOCzkuwmUAz1Ysq1EYB47816ZDgF+CXiRVF3qQu/v1HBrSXtUSuMoSeHdgczvXKj0oGIi3H+n3CT5+6VlkNcnK+sHxHrIpsVvzn/5dYUJxvVma0+YZeMHhBWDyTAsZwtLTRCG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5148.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(451199021)(2616005)(186003)(83380400001)(2906002)(30864003)(4326008)(5660300002)(26005)(1076003)(6506007)(6512007)(36756003)(86362001)(107886003)(478600001)(8676002)(8936002)(66946007)(66556008)(66476007)(6666004)(316002)(38100700002)(38350700002)(41300700001)(6486002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qs0qflQuH2FnZ0FHLyNBH+kPz4KwcINEXLtK7BEqaPspKzXMuO3+ocJCcnLm?=
 =?us-ascii?Q?BwZTvMGX2WNM3tenb4Ve+YD6TDT7SAR5YmSxoPxx9hCDqiD3wVAHLHwiujfl?=
 =?us-ascii?Q?b2NAiqFdFiW+i2MXZiWyMUUta9vJjkkhYxLv//LVKqBbsk4xthDwJoV5CGAA?=
 =?us-ascii?Q?mHy75wNCUT1OCLGRfBqEVLV8hRA1dV1jjJCQYY/XK38UAvKbyL1YfSYOXT29?=
 =?us-ascii?Q?4PpzlhMzZ73RkaeJFSBwYw9TP5vzzdfd1KMnKc/5rv2Uow3Cv9CCJTPbiGF6?=
 =?us-ascii?Q?xHkasL5vhyFvbvkeku3YozC0kEeMH0iENEpVDXdtKbq4sOKrAi8jcyGBy44Z?=
 =?us-ascii?Q?NmbBK7ANHSC1COC+vfKiwAbMXrhDA8N8dx00KdapZ5wkSjHs/wWxdkT77XkR?=
 =?us-ascii?Q?4S7QWj2ko9lRYjWxLQaplcmwK5o5tiRL4ecNn9oDFdHhXNy2mSYktPbKBx8E?=
 =?us-ascii?Q?vW0pIdxtS8BeFYHNzk15EjJBl7PpQFpwzwnxGv8cuM4jrwGXBOdCQRDv/xPD?=
 =?us-ascii?Q?AzZYL/vULVe3auuVejeXVGnIyvqYTWaCFobe/qDQjTlVXmqDMjxfM/+4Z08y?=
 =?us-ascii?Q?CYYKkhsGzjiP6dIrSHwCb/+ni+aa72rSLgPjf1GFQA0EFPa9rDXWHnA4g8Ha?=
 =?us-ascii?Q?UBV/pifZTZZmNpTcItzftDzNADTW2RSOARHm6Df+HwAuZLkeUA/DxURRA7cO?=
 =?us-ascii?Q?791vyGc2WDdBKcEyaKEhm6L2wADiWEiAyIFkVm/3P0x3DHGcqU45dJ7hsulC?=
 =?us-ascii?Q?f9x7n9ovc9dQWkryqKZus25xbLQftKSDwtHhdjG0HtUaHSzgiqfK5xfuSWET?=
 =?us-ascii?Q?eVKZgZg9Ebfvh9nrINEBPQA6Ahf7toy7GJlklXP8V1psPyNqVqMT7mrvyCON?=
 =?us-ascii?Q?ntqjhAgVTaGJesVHqiKmcUc9x7dFg2tr5wAp+Tln/vYol5Lkw/IxEnM/KYqv?=
 =?us-ascii?Q?gQC/J30Jy2i6Wa2ZGN4ZM4JFKWv0vSQUbBLiEhEtptB6mEw5pI8M1d7LCQBn?=
 =?us-ascii?Q?iTEWcnFSXkRCnooHGcn5WhF1u4fDkDITdDxd6ggD7NC8PHKuyVXlNegpj8Np?=
 =?us-ascii?Q?vJvf94sFKvVAUnS3iB/Cwhi66PSrzENlD1RvfZvJ7GJDMmk4PeEfcNVqwslC?=
 =?us-ascii?Q?+KkMABb1nJrGrrElJQBoC4XLqfPzHHKf1wLZjhGUr4hRuy8XBykfhRTS5TiX?=
 =?us-ascii?Q?1omf1UBQ+uhTFIlZHyQruU8m1jNXolWgIYEzvi96b8uNTytBv4DlsKN1L/GD?=
 =?us-ascii?Q?yHUmXoqlfCaVvOB1AVRdAVCNouv3yN8TFIPB23hMphrXYv2+1S+nLhxGADfk?=
 =?us-ascii?Q?9wHaSQQ+DE9tt42nyi1NMXI79nFFdS52lSdgO1Yhd08l0brjjixR6+oaKkMj?=
 =?us-ascii?Q?TnivRbbomHa/9JyGkPlb24RjFJ9UqLLmBh99V9MhESsecOoCrjhA7tyExEBY?=
 =?us-ascii?Q?nRGaN+CEdSmmi0I2KmVeu3/9TmkDnEMA3rHiSlPS4+l9rm2wGxnxmhPcDTVx?=
 =?us-ascii?Q?tQMDr1ZITEN5pjRayAJEfcyDqXCIQy8IxWTqyPTNCIhOCdVMmnB5kjmTwUuF?=
 =?us-ascii?Q?XCoxagANyT8wr/FOTQ05wUT1UzbkIZeiwbpsrOwY?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: efe1bbf7-1258-412d-39a0-08db5fe4fb4a
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5148.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2023 01:35:27.8911 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: omJxw3AKxsjEPqL4BOou3+HJVyG44OrTQr8t/1uWK5kQRMxZ7wmDI0J2PZ2XX1HSBhTxw+fqC9xQ/5/lAH0AOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR02MB4617
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch introduces two ioctls: * f2fs_ioc_get_extra_attr
 * f2fs_ioc_set_extra_attr to get or modify values in extra attribute area.
 The argument of these two ioctls is `struct f2fs_extra_attr', which has three
 members: * field: indicates which field in extra attribute area is handled
 * attr: value or userspace pointer * attr_size: [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.49 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.49 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q3SIb-0001xi-Ev
Subject: [f2fs-dev] [PATCH] f2fs: add f2fs_ioc_[get|set]_extra_attr
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch introduces two ioctls:
  * f2fs_ioc_get_extra_attr
  * f2fs_ioc_set_extra_attr
to get or modify values in extra attribute area.

The argument of these two ioctls is `struct f2fs_extra_attr', which has
three members:
  * field: indicates which field in extra attribute area is handled
  * attr: value or userspace pointer
  * attr_size: size of `attr'

The `field' member could help extend functionality of these two ioctls
without modify or add new interfaces, if more fields are added into
extra attributes ares in the feture.

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fs/f2fs/f2fs.h            |   2 +
 fs/f2fs/file.c            | 289 ++++++++++++++++++++++++++++++++++++--
 fs/f2fs/inode.c           |  21 +++
 fs/f2fs/super.c           |   2 +-
 fs/f2fs/xattr.h           |   1 +
 include/uapi/linux/f2fs.h |  35 +++++
 6 files changed, 337 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index faa27f41f39d4..08e8527734df5 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3475,6 +3475,8 @@ int f2fs_pin_file_control(struct inode *inode, bool inc);
 void f2fs_set_inode_flags(struct inode *inode);
 bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct page *page);
 void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct page *page);
+int f2fs_inode_chksum_get(struct f2fs_sb_info *sbi, struct inode *inode,
+			u32 *chksum);
 struct inode *f2fs_iget(struct super_block *sb, unsigned long ino);
 struct inode *f2fs_iget_retry(struct super_block *sb, unsigned long ino);
 int f2fs_try_to_free_nats(struct f2fs_sb_info *sbi, int nr_shrink);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 78aa8cff4b41d..cdb192faf7c36 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -25,6 +25,8 @@
 #include <linux/fileattr.h>
 #include <linux/fadvise.h>
 #include <linux/iomap.h>
+#include <linux/lz4.h>
+#include <linux/zstd.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -3376,10 +3378,12 @@ static int f2fs_ioc_setfslabel(struct file *filp, unsigned long arg)
 	return err;
 }
 
-static int f2fs_get_compress_blocks(struct file *filp, unsigned long arg)
+static int f2fs_get_compress_blocks(struct file *filp, unsigned int attr_size)
 {
 	struct inode *inode = file_inode(filp);
-	__u64 blocks;
+
+	if (attr_size != sizeof(__u64))
+		return -EINVAL;
 
 	if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
 		return -EOPNOTSUPP;
@@ -3387,7 +3391,14 @@ static int f2fs_get_compress_blocks(struct file *filp, unsigned long arg)
 	if (!f2fs_compressed_file(inode))
 		return -EINVAL;
 
-	blocks = atomic_read(&F2FS_I(inode)->i_compr_blocks);
+	return atomic_read(&F2FS_I(inode)->i_compr_blocks);
+}
+
+static int f2fs_ioc_get_compress_blocks(struct file *filp, unsigned long arg)
+{
+	__u64 blocks;
+
+	blocks = f2fs_get_compress_blocks(filp, sizeof(blocks));
 	return put_user(blocks, (u64 __user *)arg);
 }
 
@@ -3905,10 +3916,14 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
 	return ret;
 }
 
-static int f2fs_ioc_get_compress_option(struct file *filp, unsigned long arg)
+static int f2fs_get_compress_option_v2(struct file *filp,
+				       unsigned long attr, __u16 *attr_size)
 {
 	struct inode *inode = file_inode(filp);
-	struct f2fs_comp_option option;
+	struct f2fs_comp_option_v2 option;
+
+	if (sizeof(option) < *attr_size)
+		*attr_size = sizeof(option);
 
 	if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
 		return -EOPNOTSUPP;
@@ -3922,31 +3937,42 @@ static int f2fs_ioc_get_compress_option(struct file *filp, unsigned long arg)
 
 	option.algorithm = F2FS_I(inode)->i_compress_algorithm;
 	option.log_cluster_size = F2FS_I(inode)->i_log_cluster_size;
+	option.level = F2FS_I(inode)->i_compress_level;
+	option.flag = F2FS_I(inode)->i_compress_flag;
 
 	inode_unlock_shared(inode);
 
-	if (copy_to_user((struct f2fs_comp_option __user *)arg, &option,
-				sizeof(option)))
+	if (copy_to_user((void __user *)attr, &option, *attr_size))
 		return -EFAULT;
 
 	return 0;
 }
 
-static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
+static int f2fs_ioc_get_compress_option(struct file *filp, unsigned long arg)
+{
+	__u16 size = sizeof(struct f2fs_comp_option);
+
+	return f2fs_get_compress_option_v2(filp, arg, &size);
+}
+
+static int f2fs_set_compress_option_v2(struct file *filp,
+				       unsigned long attr, __u16 *attr_size)
 {
 	struct inode *inode = file_inode(filp);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	struct f2fs_comp_option option;
+	struct f2fs_comp_option_v2 option;
 	int ret = 0;
 
+	if (sizeof(option) < *attr_size)
+		*attr_size = sizeof(option);
+
 	if (!f2fs_sb_has_compression(sbi))
 		return -EOPNOTSUPP;
 
 	if (!(filp->f_mode & FMODE_WRITE))
 		return -EBADF;
 
-	if (copy_from_user(&option, (struct f2fs_comp_option __user *)arg,
-				sizeof(option)))
+	if (copy_from_user(&option, (void __user *)attr, *attr_size))
 		return -EFAULT;
 
 	if (!f2fs_compressed_file(inode) ||
@@ -3955,6 +3981,28 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
 			option.algorithm >= COMPRESS_MAX)
 		return -EINVAL;
 
+	if (*attr_size == sizeof(struct f2fs_comp_option_v2)) {
+		if (option.level != 0) {
+			switch (option.algorithm) {
+			case COMPRESS_LZO:
+			case COMPRESS_LZORLE:
+				return -EINVAL;
+			case COMPRESS_LZ4:
+				if (option.level < LZ4HC_MIN_CLEVEL ||
+				    option.level > LZ4HC_MAX_CLEVEL)
+					return -EINVAL;
+				break;
+			case COMPRESS_ZSTD:
+				if (option.level > zstd_max_clevel())
+					return -EINVAL;
+				break;
+			}
+		}
+
+		if (option.flag > BIT(COMPRESS_MAX_FLAG) - 1)
+			return -EINVAL;
+	}
+
 	file_start_write(filp);
 	inode_lock(inode);
 
@@ -3971,6 +4019,10 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
 	F2FS_I(inode)->i_compress_algorithm = option.algorithm;
 	F2FS_I(inode)->i_log_cluster_size = option.log_cluster_size;
 	F2FS_I(inode)->i_cluster_size = BIT(option.log_cluster_size);
+	if (*attr_size == sizeof(struct f2fs_comp_option_v2)) {
+		F2FS_I(inode)->i_compress_level = option.level;
+		F2FS_I(inode)->i_compress_flag = option.flag;
+	}
 	f2fs_mark_inode_dirty_sync(inode, true);
 
 	if (!f2fs_is_compress_backend_ready(inode))
@@ -3983,6 +4035,13 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
 	return ret;
 }
 
+static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
+{
+	__u16 size = sizeof(struct f2fs_comp_option);
+
+	return f2fs_set_compress_option_v2(filp, arg, &size);
+}
+
 static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
 {
 	DEFINE_READAHEAD(ractl, NULL, NULL, inode->i_mapping, page_idx);
@@ -4168,6 +4227,208 @@ static int f2fs_ioc_compress_file(struct file *filp)
 	return ret;
 }
 
+static bool extra_attr_fits_in_inode(struct inode *inode, int field)
+{
+	struct f2fs_inode_info *fi = F2FS_I(inode);
+	struct f2fs_inode *ri;
+
+	switch (field) {
+	case F2FS_EXTRA_ATTR_TOTAL_SIZE:
+	case F2FS_EXTRA_ATTR_ISIZE:
+	case F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE:
+		return true;
+	case F2FS_EXTRA_ATTR_PROJID:
+		if (!F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_projid))
+			return false;
+		return true;
+	case F2FS_EXTRA_ATTR_INODE_CHKSUM:
+		if (!F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_inode_checksum))
+			return false;
+		return true;
+	case F2FS_EXTRA_ATTR_CRTIME:
+		if (!F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_crtime))
+			return false;
+		return true;
+	case F2FS_EXTRA_ATTR_COMPR_BLOCKS:
+	case F2FS_EXTRA_ATTR_COMPR_OPTION:
+		if (!F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_compr_blocks))
+			return false;
+		return true;
+	default:
+		BUG_ON(1);
+		return false;
+	}
+}
+
+static int f2fs_ioc_get_extra_attr(struct file *filp, unsigned long arg)
+{
+	struct inode *inode = file_inode(filp);
+	struct f2fs_inode_info *fi = F2FS_I(inode);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_extra_attr attr;
+	u32 chksum;
+	int ret = 0;
+
+	if (!f2fs_has_extra_attr(inode))
+		return -EOPNOTSUPP;
+
+	if (copy_from_user(&attr, (void __user *)arg, sizeof(attr)))
+		return -EFAULT;
+
+	if (attr.field >= F2FS_EXTRA_ATTR_MAX)
+		return -EINVAL;
+
+	if (!extra_attr_fits_in_inode(inode, attr.field))
+		return -EOPNOTSUPP;
+
+	switch (attr.field) {
+	case F2FS_EXTRA_ATTR_TOTAL_SIZE:
+		attr.attr = F2FS_TOTAL_EXTRA_ATTR_SIZE;
+		break;
+	case F2FS_EXTRA_ATTR_ISIZE:
+		attr.attr = fi->i_extra_isize;
+		break;
+	case F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE:
+		if (!f2fs_has_inline_xattr(inode))
+			return -EOPNOTSUPP;
+		attr.attr = get_inline_xattr_addrs(inode);
+		break;
+	case F2FS_EXTRA_ATTR_PROJID:
+		if (!f2fs_sb_has_project_quota(F2FS_I_SB(inode)))
+			return -EOPNOTSUPP;
+		attr.attr = from_kprojid(&init_user_ns, fi->i_projid);
+		break;
+	case F2FS_EXTRA_ATTR_INODE_CHKSUM:
+		ret = f2fs_inode_chksum_get(sbi, inode, &chksum);
+		if (ret)
+			return ret;
+		attr.attr = chksum;
+		break;
+	case F2FS_EXTRA_ATTR_CRTIME:
+		if (!f2fs_sb_has_inode_crtime(sbi))
+			return -EOPNOTSUPP;
+		if (attr.attr_size == sizeof(struct timespec64)) {
+			if (put_timespec64(&fi->i_crtime,
+					   (void __user *)attr.attr))
+				return -EFAULT;
+		} else if (attr.attr_size == sizeof(struct old_timespec32)) {
+			if (put_old_timespec32(&fi->i_crtime,
+					       (void __user *)attr.attr))
+				return -EFAULT;
+		} else {
+			return -EINVAL;
+		}
+		break;
+	case F2FS_EXTRA_ATTR_COMPR_BLOCKS:
+		ret = f2fs_get_compress_blocks(filp, attr.attr_size);
+		attr.attr = ret;
+		break;
+	case F2FS_EXTRA_ATTR_COMPR_OPTION:
+		ret = f2fs_get_compress_option_v2(filp, attr.attr,
+						  &attr.attr_size);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	if (ret < 0)
+		return ret;
+
+	if (copy_to_user((void __user *)arg, &attr, sizeof(attr)))
+		return -EFAULT;
+
+	return 0;
+}
+
+static int f2fs_ioc_set_extra_attr(struct file *filp, unsigned long arg)
+{
+	struct inode *inode = file_inode(filp);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_extra_attr attr;
+	struct page *ipage;
+	void *inline_addr;
+	int ret;
+
+	if (!f2fs_has_extra_attr(inode))
+		return -EOPNOTSUPP;
+
+	if (copy_from_user(&attr, (void __user *)arg, sizeof(attr)))
+		return -EFAULT;
+
+	if (attr.field >= F2FS_EXTRA_ATTR_MAX)
+		return -EINVAL;
+
+	if (!extra_attr_fits_in_inode(inode, attr.field))
+		return -EOPNOTSUPP;
+
+	switch (attr.field) {
+	case F2FS_EXTRA_ATTR_TOTAL_SIZE:
+	case F2FS_EXTRA_ATTR_ISIZE:
+	case F2FS_EXTRA_ATTR_PROJID:
+	case F2FS_EXTRA_ATTR_INODE_CHKSUM:
+	case F2FS_EXTRA_ATTR_CRTIME:
+	case F2FS_EXTRA_ATTR_COMPR_BLOCKS:
+		/* read only attribtues */
+		return -EOPNOTSUPP;
+	case F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE:
+		if (!f2fs_sb_has_flexible_inline_xattr(sbi) ||
+		    !f2fs_has_inline_xattr(inode))
+			return -EOPNOTSUPP;
+		if (attr.attr < MIN_INLINE_XATTR_SIZE ||
+		    attr.attr > MAX_INLINE_XATTR_SIZE)
+			return -EINVAL;
+		inode_lock(inode);
+		f2fs_lock_op(sbi);
+		f2fs_down_write(&F2FS_I(inode)->i_xattr_sem);
+		if (i_size_read(inode) || F2FS_I(inode)->i_xattr_nid) {
+			/*
+			 * it is not allowed to set this field if the inode
+			 * has data or xattr node
+			 */
+			ret = -EFBIG;
+			goto xattr_out_unlock;
+		}
+		ipage = f2fs_get_node_page(sbi, inode->i_ino);
+		if (IS_ERR(ipage)) {
+			ret = PTR_ERR(ipage);
+			goto xattr_out_unlock;
+		}
+		inline_addr = inline_xattr_addr(inode, ipage);
+		if (!IS_XATTR_LAST_ENTRY(XATTR_FIRST_ENTRY(inline_addr))) {
+			ret = -EFBIG;
+		} else {
+			struct f2fs_xattr_header *hdr;
+			struct f2fs_xattr_entry *ent;
+
+			F2FS_I(inode)->i_inline_xattr_size = (int)attr.attr;
+			inline_addr = inline_xattr_addr(inode, ipage);
+			hdr = XATTR_HDR(inline_addr);
+			ent = XATTR_FIRST_ENTRY(inline_addr);
+			hdr->h_magic = cpu_to_le32(F2FS_XATTR_MAGIC);
+			hdr->h_refcount = cpu_to_le32(1);
+			memset(ent, 0, attr.attr - sizeof(*hdr));
+			set_page_dirty(ipage);
+			ret = 0;
+		}
+		f2fs_put_page(ipage, 1);
+xattr_out_unlock:
+		f2fs_up_write(&F2FS_I(inode)->i_xattr_sem);
+		f2fs_unlock_op(sbi);
+		inode_unlock(inode);
+		if (!ret)
+			f2fs_balance_fs(sbi, true);
+		break;
+	case F2FS_EXTRA_ATTR_COMPR_OPTION:
+		ret = f2fs_set_compress_option_v2(filp, attr.attr,
+						  &attr.attr_size);
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return ret;
+}
+
 static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	switch (cmd) {
@@ -4239,7 +4500,7 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	case FS_IOC_SETFSLABEL:
 		return f2fs_ioc_setfslabel(filp, arg);
 	case F2FS_IOC_GET_COMPRESS_BLOCKS:
-		return f2fs_get_compress_blocks(filp, arg);
+		return f2fs_ioc_get_compress_blocks(filp, arg);
 	case F2FS_IOC_RELEASE_COMPRESS_BLOCKS:
 		return f2fs_release_compress_blocks(filp, arg);
 	case F2FS_IOC_RESERVE_COMPRESS_BLOCKS:
@@ -4254,6 +4515,10 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return f2fs_ioc_decompress_file(filp);
 	case F2FS_IOC_COMPRESS_FILE:
 		return f2fs_ioc_compress_file(filp);
+	case F2FS_IOC_GET_EXTRA_ATTR:
+		return f2fs_ioc_get_extra_attr(filp, arg);
+	case F2FS_IOC_SET_EXTRA_ATTR:
+		return f2fs_ioc_set_extra_attr(filp, arg);
 	default:
 		return -ENOTTY;
 	}
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 0a17484443299..aef9c1fd37dca 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -204,6 +204,27 @@ void f2fs_inode_chksum_set(struct f2fs_sb_info *sbi, struct page *page)
 	ri->i_inode_checksum = cpu_to_le32(f2fs_inode_chksum(sbi, page));
 }
 
+int f2fs_inode_chksum_get(struct f2fs_sb_info *sbi,
+			  struct inode *inode, u32 *chksum)
+{
+	struct page *ipage;
+	struct f2fs_inode_info *fi = F2FS_I(inode);
+	struct f2fs_inode *ri;
+
+	if (!f2fs_sb_has_inode_chksum(sbi) ||
+	    !f2fs_has_extra_attr(inode) ||
+	    !F2FS_FITS_IN_INODE(ri, fi->i_extra_isize, i_inode_checksum))
+		return -EOPNOTSUPP;
+
+	ipage = f2fs_get_node_page(sbi, inode->i_ino);
+	if (IS_ERR(ipage))
+		return PTR_ERR(ipage);
+
+	*chksum = f2fs_inode_chksum(sbi, ipage);
+	f2fs_put_page(ipage, true);
+	return 0;
+}
+
 static bool sanity_check_compress_inode(struct inode *inode,
 			struct f2fs_inode *ri)
 {
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 374c990810ead..64adaec4e98e0 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1361,7 +1361,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			return -EINVAL;
 		}
 
-		min_size = sizeof(struct f2fs_xattr_header) / sizeof(__le32);
+		min_size = MIN_INLINE_XATTR_SIZE;
 		max_size = MAX_INLINE_XATTR_SIZE;
 
 		if (F2FS_OPTION(sbi).inline_xattr_size < min_size ||
diff --git a/fs/f2fs/xattr.h b/fs/f2fs/xattr.h
index 416d652774a33..b1811c392e6f1 100644
--- a/fs/f2fs/xattr.h
+++ b/fs/f2fs/xattr.h
@@ -83,6 +83,7 @@ struct f2fs_xattr_entry {
 				sizeof(struct f2fs_xattr_header) -	\
 				sizeof(struct f2fs_xattr_entry))
 
+#define MIN_INLINE_XATTR_SIZE (sizeof(struct f2fs_xattr_header) / sizeof(__le32))
 #define MAX_INLINE_XATTR_SIZE						\
 			(DEF_ADDRS_PER_INODE -				\
 			F2FS_TOTAL_EXTRA_ATTR_SIZE / sizeof(__le32) -	\
diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
index 955d440be1046..a8fdaa22c7bda 100644
--- a/include/uapi/linux/f2fs.h
+++ b/include/uapi/linux/f2fs.h
@@ -44,6 +44,11 @@
 #define F2FS_IOC_COMPRESS_FILE		_IO(F2FS_IOCTL_MAGIC, 24)
 #define F2FS_IOC_START_ATOMIC_REPLACE	_IO(F2FS_IOCTL_MAGIC, 25)
 
+#define F2FS_IOC_GET_EXTRA_ATTR		_IOR(F2FS_IOCTL_MAGIC, 26,	\
+						struct f2fs_extra_attr)
+#define F2FS_IOC_SET_EXTRA_ATTR		_IOW(F2FS_IOCTL_MAGIC, 27,	\
+						struct f2fs_extra_attr)
+
 /*
  * should be same as XFS_IOC_GOINGDOWN.
  * Flags for going down operation used by FS_IOC_GOINGDOWN
@@ -96,4 +101,34 @@ struct f2fs_comp_option {
 	__u8 log_cluster_size;
 };
 
+struct f2fs_comp_option_v2 {
+	__u8 algorithm;
+	__u8 log_cluster_size;
+	__u8 level;
+	__u8 flag;
+};
+
+enum {
+	F2FS_EXTRA_ATTR_TOTAL_SIZE,		/* ro, size of extra attr area */
+	F2FS_EXTRA_ATTR_ISIZE,			/* ro, i_extra_isize */
+	F2FS_EXTRA_ATTR_INLINE_XATTR_SIZE,	/* rw, i_inline_xattr_size */
+	F2FS_EXTRA_ATTR_PROJID,			/* ro, i_projid */
+	F2FS_EXTRA_ATTR_INODE_CHKSUM,		/* ro, i_inode_chksum */
+	F2FS_EXTRA_ATTR_CRTIME,			/* ro, i_crtime, i_crtime_nsec */
+	F2FS_EXTRA_ATTR_COMPR_BLOCKS,		/* ro, i_compr_blocks */
+	F2FS_EXTRA_ATTR_COMPR_OPTION,		/* rw, i_compress_algorithm,
+						 * i_log_cluster_size,
+						 * i_compress_flag
+						 */
+	F2FS_EXTRA_ATTR_MAX,
+};
+
+struct f2fs_extra_attr {
+	__u8 field;		/* F2FS_EXTRA_ATTR_* */
+	__u8 rsvd1;
+	__u16 attr_size;	/* size of @attr */
+	__u32 rsvd2;
+	__u64 attr;		/* attr value or pointer */
+};
+
 #endif /* _UAPI_LINUX_F2FS_H */
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
