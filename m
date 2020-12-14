Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 879942D9246
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Dec 2020 05:30:03 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kofUh-000504-MW; Mon, 14 Dec 2020 04:29:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <guoweichao@oppo.com>) id 1kofUg-0004zx-DI
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 14 Dec 2020 04:29:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fU5X1BM+qu4MBrnRgwHh6bUvZf+Ri25ZdfcfmR2ltWI=; b=HtLPFfeKO+D8npaBxlCeDmFIbq
 6kXKs9Zp7/kKgVmvEGSxk1bLl9vT3uH707AQ7IASlYNAvL/B+EvDOzUvU8nV2igEPcjfsLyjA+r8C
 ZbA0oJiEd543Y3ETFD336RCdMKX1O+K3GBsX+Am6C7kRSUb/py2eglHUUicxkzpkMmXk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Message-Id:Date:Subject:Cc:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fU5X1BM+qu4MBrnRgwHh6bUvZf+Ri25ZdfcfmR2ltWI=; b=h
 e5e3sFU1NB/EIWitaAyHRg7rorcX/NVeDxxWN//EYJADV1cGw8KAgD1gkjYfkBfG9PeSPSQtcqO/0
 zpJrkA618B7ue9Rrt00Bd73VJzmkZqYXmMP8RRKTQzKdIrI7sTM1ibPnsBL0Gd+HY06kX9Y0Q9mFl
 90vu2URJAOJpu7Hc=;
Received: from mail-eopbgr1310041.outbound.protection.outlook.com
 ([40.107.131.41] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kofUS-00D9RD-3j
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 14 Dec 2020 04:29:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WOZuFBobWGt7qOhYxHWgO9aUc9zVjO01MPWgYAY6zm0vvguVuVS86utxLanJxf9wUfx2BW0r/zH8qlY3vLZzI9IU9fQSwWQSLJoDppjcBuiYzD22DmuH+sY5a1aJ0GzDuSTojv4hOOnJgHmRWN7EXXZKH+UGjB4DrhlvDNW3+YtlAtnGGdR2PmG9KF4ABpGsdYryqmHTU2KG6G/BLH01q0UhL0dCfxC5A7+6JdhwBlI4RNltca5/Y6Mw42qWvI6n1vQWWUoApWd42c3Tx3SGjOsfI8t9eaYtrSE/7mo0bLOsNc6/AYyoJFUlGEvr6p9XlsvRagkL5qeO6Ud3EIcFnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fU5X1BM+qu4MBrnRgwHh6bUvZf+Ri25ZdfcfmR2ltWI=;
 b=QgTTECJM6SjKF2/ZF7LeEd6Puka50w71isjmqBII4O/94dNhQiciGUVUOFozO++bXT5zvyw7tC31/FMGikMGY1rrHaqdvyvCEfmblF7kaGsfZrJpymJlIisqd9+vVzyMX6PAfKuhq1JByIpv4F5PDsMhtzWGKeGq8Yg6f+OsGDE9IrzITi3EonVH8ppn6QI4KDBC2MY7/HEAeJ0NAVYWiYOtcBVjaXSQvxdnIBBrwaE/Ho139w9TaIaX2amJypP/rKEKhOn99nMHPbmJpPjZ0xzLKnupThgNu46WkYGI3RELXuw1NPz4OF5UeYNdLYx48Dj/Zd/hKW5Gbqr/Gzec2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oppoglobal.onmicrosoft.com; s=selector1-oppoglobal-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fU5X1BM+qu4MBrnRgwHh6bUvZf+Ri25ZdfcfmR2ltWI=;
 b=DPNikAk5VL14vB9UCB2ji0vICjQFFwaubl0dnWW3xWiYNHmz+pJDouwzYn8dDhW61UMpRDYa0DlQgaA82rMdRlJx2o0AZB+zp7QxVpvBND4i3juQ6ZHFrFfL7MNOss3kd4ZQ/AbpGwqv2KN4PjPM7bkUZvvNUGiky5D9votBjw4=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oppo.com;
Received: from HK0PR02MB2690.apcprd02.prod.outlook.com (2603:1096:203:6e::12)
 by HK0PR02MB2817.apcprd02.prod.outlook.com (2603:1096:203:6a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3654.12; Mon, 14 Dec
 2020 03:55:08 +0000
Received: from HK0PR02MB2690.apcprd02.prod.outlook.com
 ([fe80::d5a6:bc00:7ae0:f691]) by HK0PR02MB2690.apcprd02.prod.outlook.com
 ([fe80::d5a6:bc00:7ae0:f691%3]) with mapi id 15.20.3654.023; Mon, 14 Dec 2020
 03:55:07 +0000
From: Weichao Guo <guoweichao@oppo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 14 Dec 2020 11:54:53 +0800
Message-Id: <1607918093-204-1-git-send-email-guoweichao@oppo.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [58.252.5.68]
X-ClientProxiedBy: HK2PR04CA0059.apcprd04.prod.outlook.com
 (2603:1096:202:14::27) To HK0PR02MB2690.apcprd02.prod.outlook.com
 (2603:1096:203:6e::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from N80263842.adc.com (58.252.5.68) by
 HK2PR04CA0059.apcprd04.prod.outlook.com (2603:1096:202:14::27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3654.12 via Frontend Transport; Mon, 14 Dec 2020 03:55:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4fb51a06-7bba-43da-0d4f-08d89fe40c36
X-MS-TrafficTypeDiagnostic: HK0PR02MB2817:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HK0PR02MB2817E9881EC8ED124C8F0E71B6C70@HK0PR02MB2817.apcprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IDTi3c+Wxts4t91Bfu4jwZ3Fy5KDXEwzdMJQg5chhwdj+FZZEQu0ZCt5xDwwLfMHpAclXCKVg3Lt1BB83UKezCgz5+EUixCKeAuIADy3ZfJsjJbv9yYMdTbxdQ8velN9XeSedVbIm6b3kaOwzRSa/xjzwjReTdhpCK7/6t1k3QqGHajryOXKm6TBXjth0KHtWJUFKWfADqKVZzweI7ZAzYgUsGbOqhymezAm8iU/uZy8DMMoCc36zO9HLBU6ocjyg1R9TSGNFlLuszypxTRjxJGKA/+VCorzdx3Oi/3TyWxWLKwf9GZDTblW8ZHLNnKRhp4J4lnxy3JRMJI9qY4Ahg+7UHh9rMjc7wFvomiJ/8vSWeuslVFRcSCTtZbHFFPG
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR02MB2690.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(8676002)(54906003)(6666004)(6506007)(36756003)(2616005)(83380400001)(4744005)(478600001)(107886003)(66946007)(956004)(86362001)(26005)(6486002)(2906002)(316002)(16526019)(66476007)(5660300002)(52116002)(6512007)(66556008)(186003)(8936002)(4326008)(11606006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?4H+jYPjXtfbUJj8/Zuhc2kVnFM+2HUlEH7DLiEyVtf5A4l7qT/p9SDt45Lo3?=
 =?us-ascii?Q?sp+cpzp9mj83mlB/KIMCz/j85nBNxdVV+iS0ZcQUx8j8NZtovL66hyIwGtiI?=
 =?us-ascii?Q?EuSdx90ZCFcQJATQEjZj37mZy0dCwgubQJnpMmdBYqmaATNY1PP58t+VNIuI?=
 =?us-ascii?Q?rR58rf+0vXBL3c+oieZfL8D2Rvehl45GgULEllr/rirOt+UgAAWGvViErPtU?=
 =?us-ascii?Q?0mNCInAldVZKhu5PElrEzIKdvqYNl688p6LZUuC9os4cdR0VW7e3d2SeavFX?=
 =?us-ascii?Q?lglc0Uqw93Z35pjXkcT28f0qlw7pcNxm3TYA2jskktmmCnWEzxf7V53Ik1ep?=
 =?us-ascii?Q?xAD6QajhU9c6jOvEn43W3KBwRlfvWJ3Q91BArh1jy2Sq3tKaH5VdHWogYbvq?=
 =?us-ascii?Q?0t2pZz3dlMspqM0tIUpNNWI4fuRC/eVr2mZOCqBLSXtqG+8byZecLIClvfSd?=
 =?us-ascii?Q?AR99BVYJOeBsa5flAsc70fR7uH1yEWegz3pJmaIKOxopVKCpB8TOD9uG0NgU?=
 =?us-ascii?Q?KeikXZlobyBgMOGL+Kd0Y4S8VFuwU9B9ZvNUQN1uj+BsJOCpnk8j8Xh7MOgw?=
 =?us-ascii?Q?9m+KOMMvLNg4h44RDQ2G/eECkE/RcBOTUQk0fre0UWrzw3ndL+TXifhQhB8B?=
 =?us-ascii?Q?gZkYCqU08ghM46Ewm+odw32DgRKps5RDyC0M/AruC870nWo4kSKsRy185lW/?=
 =?us-ascii?Q?nC5VL/Pw6WCo5jTEr1V4T22ECaniv4Bq4BETZZ8872PUJCHY15ZxBgwqIRDm?=
 =?us-ascii?Q?x5jCMZnt+pDOS2JLpXYe4Xcrvr9BwK3AginNWZd5sWeDZJAQMTtXughRzi02?=
 =?us-ascii?Q?5blHul2rjSDnisl1wMASOcB6py9q4MR1uNXXiYPESDoNe31gR1MW9GYj1J4Q?=
 =?us-ascii?Q?fBzuQoy3kLEfjD307xVnH3/KJOJF8ZJdVmBcWXPj4RvD9eu1n44yLV+KaZFR?=
 =?us-ascii?Q?IWWMTM0UkuLy64LTRMTxVu0d4/f7lzCghrWLrWJ5ikQ4aUNO+WZbzzto+3Qe?=
 =?us-ascii?Q?puJk?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-AuthSource: HK0PR02MB2690.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Dec 2020 03:55:07.8224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fb51a06-7bba-43da-0d4f-08d89fe40c36
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZ0MYG/4lFZvnXUgGNsvVwbXYQRSM1BvGiAvzNFgdhZoq9JwFKkf9dQV6NxumgZunwjjUeCdq7AwNJixNUxHVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK0PR02MB2817
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.131.41 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1kofUS-00D9RD-3j
Subject: [f2fs-dev] [PATCH] f2fs: fix to set inode->i_mode correctly for
 posix_acl_update_mode
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
Cc: Bin Shu <shubin@oppo.com>, fh@oppo.com,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We should update the ~S_IRWXUGO part of inode->i_mode in __setattr_copy,
because posix_acl_update_mode updates mode based on inode->i_mode,
which finally overwrites the ~S_IRWXUGO part of i_acl_mode with old i_mode.

Testcase to reproduce this bug:
0. adduser abc
1. mkfs.f2fs /dev/sdd
2. mount -t f2fs /dev/sdd /mnt/f2fs
3. mkdir /mnt/f2fs/test
4. setfacl -m u:abc:r /mnt/f2fs/test
5. chmod +s /mnt/f2fs/test

Signed-off-by: Weichao Guo <guoweichao@oppo.com>
Signed-off-by: Bin Shu <shubin@oppo.com>
---
 fs/f2fs/file.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 16ea10f..4d355f9 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -850,6 +850,7 @@ static void __setattr_copy(struct inode *inode, const struct iattr *attr)
 
 		if (!in_group_p(inode->i_gid) && !capable(CAP_FSETID))
 			mode &= ~S_ISGID;
+		inode->i_mode = (inode->i_mode & S_IRWXUGO) | (mode & ~S_IRWXUGO);
 		set_acl_inode(inode, mode);
 	}
 }
-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
