Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A90370F584
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 May 2023 13:42:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q1mst-0007AT-UG;
	Wed, 24 May 2023 11:42:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hanqi@vivo.com>) id 1q1mss-0007AM-5V
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 May 2023 11:42:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LDPB60qnAsGtdLjHbrjnEpWwkuDDha+scDL5xys3n6o=; b=HjoniJ2K8TW5k8Rg7iWXlcEzoG
 mGR1vujtJMR7vmA7vnc2ceIt+ykZRYxhd4PF7g9zW29mwH87MvSiKF5ZaTqiW8gImz73yJb5+Y215
 s7+OeZ7CCttfT0O1CEMZ9dRlS7gonX7b2o55JO6b1LmAgFy0/FDSFQv0j/5VrMI7W5vQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LDPB60qnAsGtdLjHbrjnEpWwkuDDha+scDL5xys3n6o=; b=R
 nf5h4jLiJuk5UbQz4KT26W6odR/dFFu+hGuU+++xdVp5Zm+FoOoQFJ3nfJXX5wJYHGInme6/qoO0w
 +FHVwBO92fmDiLLP90Xk2748Yl241PBvRDcTSuXdm7QymgoJUdRNX8w5du+1vC1byuGPe3YBFdvhk
 f7NifOWpHBrHlsV8=;
Received: from mail-psaapc01on2108.outbound.protection.outlook.com
 ([40.107.255.108] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q1mso-001Iv6-LV for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 May 2023 11:42:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dyIgxJo40a2wRzUNybSdByExNwz7MOOV0QmGydBS0dlnIPzIXz6eP3rTcNEoLzHi0g2ADgG7qSyo7KbbX7O5o9UEDX3/+9pdZLV2k7Ve0Bve5TrJEC58LKWj1NJWFa0qRlnGBk3BKKA5eITuPiCTYky2flCYYrDdPAycGqQVNK7+GqyT8XFxkdelL92s+p3H27FYEip30o9PH6TcDTWtvjJvfFMvF/DnbQ/9dS58UfiEv95xnr3ogGLDv5utX01U3dZwJBx8d9y2PnyGdAttTMx/ZlGvhnxdluRmQxT9U+352oSBZO4GSeiULCx6j6a9l8SOUhYvvNMIL4sKWnognw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LDPB60qnAsGtdLjHbrjnEpWwkuDDha+scDL5xys3n6o=;
 b=D9kRzFeR2UVUDpfKFOQzepKYkYXThHkXs7XYm/n1SKU3I0i9rTFLSIk5uSwhDCtAt5wL7XR+GiZTyS8TKn78cKPf21xIRd3T4ToWyWUTjov/5cPv+wTJ32IxfqTT97Kcf9GGqTgQponOy2YrVqCPgQprmXjrmz79C8WKwuvPumBrkAl04XM6dz9/km4pIZRvSBef70Nxj2ZFyUEgjTuCIWw+RkVUfSCqG2AJo5RFetBrb3A9E+AJreFd/YfJlXjaFAMwXIlZIh2Ow9GNqWpLEwnv7hzFy2pAhU1jvXl4P7isowhbDgHXPHn1NVDbp0crd0fDhwacldxVJzhcvM0qQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LDPB60qnAsGtdLjHbrjnEpWwkuDDha+scDL5xys3n6o=;
 b=PzMZrr8x0JFDJSLhpwbxSWA33Nz6ArhOdKMvDPWj4WxOSuGu6CeJyaJ1fnXjLMCcKKVCXC3+bMrGB4OttQzb9TI7BaSGbypOk22Jpiz4EhK1UAJmNGQJ0Ap0Ww7jX0G7tG896ZSf8jgwj51QqFoJE09FYJCnZiEHoToGp67VcyQsqkI390bgEq3m0fciu6pN/hE2SJYptkyOZ7N4VBO7R08sMG2Vg5jxdfHMg7HnY5qzyqk8qDy1SOR6fbkD1IWQTPl0fsEX2BEX001u7S5K/4S9gD+DqMDEkxkcE7Rc9IcVDGkKA+uodlk7ON9s/RbpscmPXNx94awMIigS+ALyEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3227.apcprd06.prod.outlook.com (2603:1096:100:3f::10)
 by TYUPR06MB6079.apcprd06.prod.outlook.com (2603:1096:400:347::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Wed, 24 May
 2023 11:42:15 +0000
Received: from SL2PR06MB3227.apcprd06.prod.outlook.com
 ([fe80::9990:c35e:45dc:a76f]) by SL2PR06MB3227.apcprd06.prod.outlook.com
 ([fe80::9990:c35e:45dc:a76f%6]) with mapi id 15.20.6411.029; Wed, 24 May 2023
 11:42:14 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 24 May 2023 19:41:59 +0800
Message-Id: <20230524114159.8999-1-hanqi@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SI2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:4:195::16) To SL2PR06MB3227.apcprd06.prod.outlook.com
 (2603:1096:100:3f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2PR06MB3227:EE_|TYUPR06MB6079:EE_
X-MS-Office365-Filtering-Correlation-Id: 51de8b13-a18f-48bc-ca18-08db5c4beb0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0PHomqFu1UwzGe+/jbIWih3/WAX+nkyqSr5pvDJCY61vBRHR9mBNuuKRmpztspKgx8Y/fUhUIbjYacTeZxgvZ7bUYeqUtsGcc6GlFOvRrgPkkyBsoCZomMDoVZg5rh0tyf+U4kP1Ox2BGao/uEbhT4P1NR4gMhpTcfkwTMWp7gMBA7TarjMryFXb0KX1lrkO3t7aTNdZ4Wh54HywSUz/b+qvBLkGZaF8jfEPThfvgPFwQXTpq7OrK6WEZmzFibsSo4nRAKciHpWQWvqQ7UGRmwMNRTysakifOXM9RTiHS4RxPMa5IrdnMrdHXH0tpuiVsJqnSo1jUY6hn21su8Mosm/U456Y0bo7wuNxmbcpkf4DYfup5iXoMB0y13vqvRirSD6/iJl1hvdcZNqyqKuYT6R06nZZ3oNsmCGQ0RZA2PCGaRIhXEil46XORw/RLtSN4Ik008sO9FSGcE/IDjWfjoO4R7J96yth4qEqG5d0+AsGA8/MGdAN8Hd86uJNBdc+zYDvk0Pq5P8sx0UCD9yM//jww18sFTUY3V/Xwdatp3C50lOe7f2w6VBfGXyIqPkTBfHYsZx0WVVa/RTI66g4UrdkrW8vuTCeNcbG8lhmHoQOnFhgou9SyxC/vzmPtQ/N
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3227.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(366004)(396003)(376002)(39860400002)(346002)(451199021)(38100700002)(6486002)(41300700001)(52116002)(478600001)(316002)(4326008)(86362001)(6666004)(66946007)(66556008)(66476007)(5660300002)(8936002)(8676002)(38350700002)(2906002)(107886003)(1076003)(26005)(6512007)(6506007)(186003)(83380400001)(2616005)(36756003)(4744005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lxyU28GXWTB+aLgU+8feDpUFTcmLXzFxsof6VuVGCnzjR7Z9XaJMcQEZ9m9G?=
 =?us-ascii?Q?vr7rlg95CvmWP46MkuNhBW+d0aOpePJHaPSi0GZb0bkFa9O7kwv2aTA8pHTH?=
 =?us-ascii?Q?DJ7NkQeu0RgBdVXciermo5nOCTkKlMR1sRq6+/8Q8VGXknmHwLSv7uQ/e8C4?=
 =?us-ascii?Q?7ySi2CXb5SXsABdwNdlXYyV5f9Tg+fel8oDEQIFsGO80WkxsmJthh2s6RE3a?=
 =?us-ascii?Q?tJvMVCakLfZs8VXJmEiN+QAR7xcoh4BaZY/4oU6BshIeYuhEGqJ+ICOrWmEG?=
 =?us-ascii?Q?xksum/qo2lM83t23jNVM5dJcdO+QPvI+ufJPOWQKYkz6yKFCZaEL6mDgnAPl?=
 =?us-ascii?Q?W8vBqryF0qD7utxtLsuGwWPCxrTfpH+qEbiLfhqjNG4+km7eNmoLc/7awSNd?=
 =?us-ascii?Q?W11jXmY60ShhYIDqc6xg4dO4Ho+gTDLTBGogM3zlfT3qjWoYfbL4sAkJH6bZ?=
 =?us-ascii?Q?XBB7RZ8a7RdO4YDHvRWJUMOmXpOHz4jofaDfXeEW8WYHLCCYKMLOpbBWuWxm?=
 =?us-ascii?Q?8a/QyB0/26rpGWJ6nZubSYUDtBcjz6JMFxH/Vgzy1xmuVnW1aYxfc2coTxDl?=
 =?us-ascii?Q?fb/UnXkv0ST+VspfqV9PGTlLxbdSGwQaNgVR/sX2ll5FImUsTcLh0WPzrChw?=
 =?us-ascii?Q?5kP+PumOf0hGgWkDuGDn7XTj6YBBdAVzjRgXcu5SgmIGjxm/VREpUIWEbKwZ?=
 =?us-ascii?Q?OXmMibTM9RYf60fB3vGiCMghnbI26wf5LzVuA5T3VvWaN060WfyXBAL1F3+x?=
 =?us-ascii?Q?wwvreRX9hGqmq85wkvNwJMeHgu2GH8Z0+ye8uQP8kJaN1jufUpfxQbjyW4Ar?=
 =?us-ascii?Q?1xtM5PkxHJmJedFm8av5Xtr84nXU1Z25nWGb/wWnxYE/zN27/DffTXhOKLVB?=
 =?us-ascii?Q?dm9tF5UrheyUhr62+cjk28NY7rZ1ldoFx3RzCoUs3chky0EvVmV6+mPungHf?=
 =?us-ascii?Q?NWUFWU1Tt2I+vnJB1vd4yba5mx354bAxWW7DXXmxC3kst8xyccb2XIKWCR2Z?=
 =?us-ascii?Q?GF6brutMGmE/NVIG/du+c0buHVSDp8n3ybVZDSdhmXbkOuLXg0jomAoSO5jB?=
 =?us-ascii?Q?lMlro8pTlzCNFiZZmg9Im0WFw+zyxDcGXHEoks8wj/0FeqSNmek3chhkHZGm?=
 =?us-ascii?Q?HRbbwAXARE936QHJIyz69UWiK4YaBsWapjSmOJGnhXZt1JJh6lM3thtprjq3?=
 =?us-ascii?Q?Mm39KJyBWg0/kHOA5WglUYfeq73ZpubbyBPigmMITJ5cy3bGn+/VA/HEX8gq?=
 =?us-ascii?Q?IJCSM0jTGww9wz4AWz7E9I8XVWPTYycWwzWmqnbJXoUJu44k3aKY5n+XFFyc?=
 =?us-ascii?Q?MW9aR9Ai/WE+I/rcKYZRgMZqPYqSM+vKn4YvsVs32YckKy/PjD6wb8y7EUbM?=
 =?us-ascii?Q?D7DLF9HD9irCaj3zk9HcbrsRoUR9P1LySD/R7DKiM9VEsKO8KEAEYkhJX9dZ?=
 =?us-ascii?Q?BU2p2rUCUZI5i2xMdn6uxLO1RmB8QiHH/e5SZTaZQvdBwdPEa6GmEMGuubNZ?=
 =?us-ascii?Q?zjlSk4tGfE/4rMltk0pEDutDCrFKjUsWoJ0uoa1JP18AhlUGBqtyGcDWYpd1?=
 =?us-ascii?Q?jtR2IaMzn+zxLuzifpLiiAH89Ye36EayN4ZosQc5?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51de8b13-a18f-48bc-ca18-08db5c4beb0d
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3227.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 11:42:14.3129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Il22ncSA2qiEekmF08qPuuKkMZtgDUoAKbzzPQVx3T4fJsTmqtFwK3C6LN+Ia72mvb6bgKTJz53XJ/g+xuKJ3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6079
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Allow to compress mmap files in commit e3c548323d32 ("f2fs:
 let's allow compression for mmap files"). However, we cannot set the compress
 option to the mmap file. To keep the same concept in both comp [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.108 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.108 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q1mso-001Iv6-LV
Subject: [f2fs-dev] [PATCH] f2fs: allows setting compress option to files
 which marked with FI_MMAP_FILE
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
From: Qi Han via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Qi Han <hanqi@vivo.com>
Cc: Qi Han <hanqi@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Allow to compress mmap files in commit e3c548323d32 ("f2fs: let's
allow compression for mmap files"). However, we cannot set the
compress option to the mmap file. To keep the same concept in both
compress_modes, f2fs_ioc_set_compress_option should also allow it.

Let's remove checking mmap files in f2fs_ioc_set_compress_option so
that we can set compress option to the mmap files.

Signed-off-by: Qi Han <hanqi@vivo.com>
---
 fs/f2fs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 5ac53d2627d2..3a97b753a074 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3957,7 +3957,7 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
 	file_start_write(filp);
 	inode_lock(inode);
 
-	if (f2fs_is_mmap_file(inode) || get_dirty_pages(inode)) {
+	if (get_dirty_pages(inode)) {
 		ret = -EBUSY;
 		goto out;
 	}
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
