Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B531A81C399
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Dec 2023 04:45:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rGWTX-0004OB-4J;
	Fri, 22 Dec 2023 03:45:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng1@oppo.com>) id 1rGWTV-0004O4-MP
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Dec 2023 03:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ImJjE4UqnnmNoTdmMLbraQ0HRQtkg22QiCOm23XHxdE=; b=CVkWDYF1Ncaf/zzyvFzlj8ypMz
 CgpkIFaeBJ+mMuRG5CS7VscJqnWa2FhC1o8Juy4T4nn650WNqZZXiVwfPkA0hPLKrGj2izsXn0YeE
 QiFeCooJFgY2wxPM4zSOodSwy62bDpjnMCuCW5YH287CcTEryaQNxNYL2nPbr+XABOBw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ImJjE4UqnnmNoTdmMLbraQ0HRQtkg22QiCOm23XHxdE=; b=Q
 jC6eWoR6dRsjyDwPnQ1JLie1qQx5lz8AP0dt+ASYAeSLo05DDCDrs0LT/2m+leoPv+jb4Ez7lV3+r
 zgydEM7JEj+EhrgYZ+v5IIlMfIshnkD9Fz3KWWpumdws5jyLdzNYos9BfAbXw8Ose6alBi58sZAk4
 KkcIQbUdOi8pcNrM=;
Received: from mail-sgaapc01on2043.outbound.protection.outlook.com
 ([40.107.215.43] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rGWTQ-0002mp-O6 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Dec 2023 03:45:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=igtr6qEK/HPHbhJmBbgiCOmhXV8/ZbjRB7xb9QehJalfGb6kr7n1/j5Prvh4lVMoPZbbs59rz9LUTcs4h3Uq08Mt1q7Bz97JEJgacPS7HsFbMLH/EpkIUDSa0ACc6PePSX2gFWuHsWMtfJxVueMeN6TlS4KWczii/2mJZrmcBDYzjBskJF4ndUM2FUcJlj4A9rvhMqkkiFlsNKYN7YM9zXH7CCbaUT3ucwOa3BYk2y/V7Ijp7aweJWvfeuEPn5CX9Xp67xvDQZ337zRz0FsRK3Z9Llo7QbRmJ+ZKmYRBtL2RdVVk4RC+zxpIU2C0JfX4wyStiru4fPX4VHRG8/HvGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ImJjE4UqnnmNoTdmMLbraQ0HRQtkg22QiCOm23XHxdE=;
 b=iZpHYyAQ7PsnKyZ9YCyEYr8E5cBDXzMR0PIR16hEYXn/dtQCLc9vPM5cibsNn3V7CAAZyybyQX3I4PqKb0qoB2agyji8GfmxWu9d3BdWlYOKPi16f2XxYouP8Gr9epL4VbhDrqqy8rb9ZoX0MceYjrXxdNcWPr597ko1CxK0+oqoi6n6+zwAmlXtA+dGnNMdin8Wwz3yZObcc0NF/iSsvC19xSGfGbddxapGbw+v2IthFDV1singjmyRxnqDJ4B7qeEJSnWNUtRxEyPO8jMVmxv7WQWuHvJYNZ9KxFNNqAuhAG8yIH3cAbmp/pmlp+dIpz8zruATcnYaAfflLy7bjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ImJjE4UqnnmNoTdmMLbraQ0HRQtkg22QiCOm23XHxdE=;
 b=ktayja9vNhqEYjbru1sps1h+o47Tsf3vmzSuY3gIGrDfFA1X/GqTfLclYS+EYnpx9pY66odcA0AUSEyTD9qgT5LSOqhVAYb2J4G/d97Vi/1lchJ0bUJZ0m8g9wD20oG/6b1Py0vx+xtxOeXZSXJ9K+hOKuxOCquLFvqCOnEbVZc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from PSAPR02MB4727.apcprd02.prod.outlook.com (2603:1096:301:90::7)
 by PSAPR02MB4678.apcprd02.prod.outlook.com (2603:1096:301:41::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7113.21; Fri, 22 Dec
 2023 03:29:49 +0000
Received: from PSAPR02MB4727.apcprd02.prod.outlook.com
 ([fe80::f4:dbf7:9c0c:5388]) by PSAPR02MB4727.apcprd02.prod.outlook.com
 ([fe80::f4:dbf7:9c0c:5388%4]) with mapi id 15.20.7113.019; Fri, 22 Dec 2023
 03:29:49 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Fri, 22 Dec 2023 11:29:00 +0800
Message-Id: <20231222032901.3861649-1-yangyongpeng1@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: SG2P153CA0043.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::12)
 To PSAPR02MB4727.apcprd02.prod.outlook.com
 (2603:1096:301:90::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR02MB4727:EE_|PSAPR02MB4678:EE_
X-MS-Office365-Filtering-Correlation-Id: cd7d4d03-b466-49db-1362-08dc029e4083
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wnLIvfzGQjM5VCN51lA1Nf7zKVFdb9VDPpRl+sLUHvctYGbI92o6Bjsd+cFey0QALMoWWsTs2RXjiYWwDBB6b6eUiA9N+0oogAWq3X9JesUvo5irV4uT9nby87feaLlKItQdlzV3uQl8HH/baTZgwY1KXppwRHoXadEPhRCXw0NcBfGphxLlAA8ypNRqBlWQMDAGL5/DZ0pFI6J2W3Spwl+0UQJeJNs462tWX5CkAUMBdwXCW3v9WHb3ny4EyZ9XlIMo4q1fJlOcFZTlQIZP+9rIR+nn/LFGA3YEoVg45QA9gdjtfWd9b3UACZ36iiHR/FX+hudxGYDHx6+O3kKpwj0l+lRCIXstiko7soY3GT0UClSLM38WH+yV9Z9rMLPLCn7VzW0HWnYAvRWzfqFx1QAXhweXUbnPeRnbLFZbuz/FTjO3zH/M+BxwLlrb5e0WS3cimFhk+0YzhV4jfq6Ui1MQOVFup2VYOxf1w6uw6h5V0ilJB3iX87ye1yrFwXOFPiqFDFbitEKGtg3hdrIkPzTgGtW8OrxI2zLsS7TErcEIunLVGlQaIXoaz1AkPpFpvWkbiaZnftMRnbCdD8N/xj0Aaj6gwMzh9skv26hhQSJ8z+we0SJQjjq/V4J008zz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR02MB4727.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(346002)(39860400002)(376002)(396003)(136003)(230922051799003)(64100799003)(186009)(451199024)(1800799012)(26005)(83380400001)(86362001)(41300700001)(38100700002)(6486002)(5660300002)(8936002)(4326008)(8676002)(110136005)(316002)(66476007)(66556008)(66946007)(6512007)(2616005)(107886003)(1076003)(478600001)(6506007)(52116002)(6666004)(2906002)(36756003)(38350700005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YznLkgiC3UN8lNCOfYP4oIFKgk3zmRSgj63F5/m99Uh+cvDFywOtqCgsoKJG?=
 =?us-ascii?Q?LVa4ikn13xygGsNXHiO8OLVWbgtvM3YTIfjyTrTLvHzfG/+K7ZR0bvO4SJjn?=
 =?us-ascii?Q?D30FPohxJCkN9vA9jsGPkZT43RNJosDiFN0RVFt7oG8B0iDl9pcjDr6Nmcyu?=
 =?us-ascii?Q?fqmOsjK98fY12Z73HicvseUJ9iO+T0734JD0N6sHNutk7N6n64QiDFtaRw3x?=
 =?us-ascii?Q?luTPhc7yKWZ8VwasnB5LKsPJiPSY3D3KntsnjEyxdBY62xjikuXmKO6z5ZPE?=
 =?us-ascii?Q?09oy2aC3tOtMY0+H4g/CuVMQd7PDTQnvPNj9nlMToG3U8hppNvGoVQ4ow3IB?=
 =?us-ascii?Q?6KZE0lDlepxY2QJJj0eZv8+U2ddQW312mm2Hdqki83FnNDbMXk7kEswfo/TQ?=
 =?us-ascii?Q?Z2l34Z+fSwm/7q6o3K+1dvtFdo8NHRwrLvD2AtYGHDUJ1GtnGle0hY1QDPzX?=
 =?us-ascii?Q?ND4fo2etY/5Tp60xjBi+XoZZNAhw20Tg1x7yB2eXJ85iLJugGn+hHosDSvii?=
 =?us-ascii?Q?akjyLjG2liRiLoycjGjC3GqId/bcwv/zjhLOg4ZEhQCU2yrDvgOJ0VECc1ry?=
 =?us-ascii?Q?ia+DOyzeigL7VIka2KTo4TzsADEuWbl18iLLyRF9yF9Qb/VlvVvjTxu9zvYa?=
 =?us-ascii?Q?pFAAVTKPyTnYARqTsPLwiwL8m0za1enga+d0CTK4+WORFGwkFy/730ByVWqA?=
 =?us-ascii?Q?1ps0PRcNtqOCkHI4y8HrRa04BYx7iIs67yeszva9dYMQ7/oP9SpwbiYju5E4?=
 =?us-ascii?Q?i5lIjKVgNAsBrOE6FfLSV9zs5Qs5pQ5RfAyfoXiCgXkllSxERJQGHz0PQuK5?=
 =?us-ascii?Q?qETU3yC7C/YpnlsHaQk/UOFfbAO0OQm6XWCdginatkWyCDW8HfIDpuvIwCs8?=
 =?us-ascii?Q?AoX1M9Z8sVnd9fKFEH4t73zFkB4z2QcxSlpCQVpVkf2JYQTKi17KS1+eMYGE?=
 =?us-ascii?Q?mY9eUTLmeqZ23nzPD5jlD1O8O2qE6vScAslCA+AGum/Is0cnczUIRIpB2auw?=
 =?us-ascii?Q?drdOQCmD/+rwT+DbrzBs9m7cTzvJsx7UZNbRUTBvbhn7zaEiTEqYnlV5RA/g?=
 =?us-ascii?Q?xamd9So/qEyQM5F7OYpvvRUUFYculgRXs7XcO4YZk8xoJcbwDWFeLDSqtDWL?=
 =?us-ascii?Q?C2U6MY+zS3E0AR8UnDhvq7aiVALXNRVeAHI5wrl3Yt3OZOf4szoGwfs2Pg8e?=
 =?us-ascii?Q?k9LRVqrTwNY5ZtHpDtVumSFCApZQRsilgp6vAw/Ub+H90VO8T9XQYCjNFz+c?=
 =?us-ascii?Q?LX4HdRbVDXQ5bLbOkdUzFyn0AoF0pzappZ8ZeHr1alaDOW0iTR8cYcRFLT0L?=
 =?us-ascii?Q?J1UCwsxmzmTVML2EIevMRG2h6eEKF+/OTFcHnRDuYSLLfA1KG9Invefk7K2g?=
 =?us-ascii?Q?r/OXkcQZ2/rsHeeNkDekaHciHm4m6PSrVaZsq3uGEPBK18HChFHiqAn82fya?=
 =?us-ascii?Q?Kq93p1XhiakOvEGi15cVwA1sx4Cey6aLLa3e4CFMbDHG530XHZIIOexp+RgJ?=
 =?us-ascii?Q?vPUsParc2urg09oRQbFJv1A54TPQFSfRAewSOEg9kPUf7QUtVEgN1wdRxd5U?=
 =?us-ascii?Q?W15oDr2aW7c3i6tCB7A2Hp99B+VvLXZr2gMyehoq4rZMbKOull0B4G6LZH0V?=
 =?us-ascii?Q?pA=3D=3D?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd7d4d03-b466-49db-1362-08dc029e4083
X-MS-Exchange-CrossTenant-AuthSource: PSAPR02MB4727.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2023 03:29:49.3118 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: i+fbt1H4LC0JsPoNdOKqG6Lhr70iPjqBKPZzwCCUyMxjgdSTXEr0juTCIT7xR6Urk0MX6I5KTT0BJNllEA1GFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR02MB4678
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The {struct f2fs_sb_info}->dir_level can be modified through
 the sysfs interface, but its value range is not limited. If the value exceeds
 MAX_DIR_HASH_DEPTH and the mount options include "noinline_de [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.43 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.43 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rGWTQ-0002mp-O6
Subject: [f2fs-dev] [PATCH 1/2] f2fs: Constrain the modification range of
 dir_level in the sysfs
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
From: Yongpeng Yang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yongpeng Yang <yangyongpeng1@oppo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The {struct f2fs_sb_info}->dir_level can be modified through the sysfs
interface, but its value range is not limited. If the value exceeds
MAX_DIR_HASH_DEPTH and the mount options include "noinline_dentry",
the following error will occur:
[root@fedora ~]# mount -o noinline_dentry /dev/sdb  /mnt/sdb/
[root@fedora ~]# echo 128 > /sys/fs/f2fs/sdb/dir_level
[root@fedora ~]# cd /mnt/sdb/
[root@fedora sdb]# mkdir test
[root@fedora sdb]# cd test/
[root@fedora test]# mkdir test
mkdir: cannot create directory 'test': Argument list too long

Signed-off-by: Yongpeng Yang <yangyongpeng1@oppo.com>
---
 fs/f2fs/sysfs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 7099ffa57299..8c8424b05fc7 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -741,6 +741,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "dir_level")) {
+		if (t > MAX_DIR_HASH_DEPTH)
+			return -EINVAL;
+		sbi->dir_level = t;
+		return count;
+	}
+
 	*ui = (unsigned int)t;
 
 	return count;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
