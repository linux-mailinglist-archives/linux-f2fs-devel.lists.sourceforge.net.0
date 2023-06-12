Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F2A272B59D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jun 2023 05:02:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8Xp5-0002Uc-SS;
	Mon, 12 Jun 2023 03:02:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1q8Xoz-0002To-UU
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 03:02:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yG4NaiIwJDVRa91GbUkjytPpX0qB5PkhDezBZEAmJxM=; b=f9rfUtNHIwne3HKciYGf8XobjP
 yTRRErnbfBSSH2jg9KOTw7S6AS4e4TsUklPmPxD9uNXEZ9CTsIPjPhYXyH/7sEsUm4thU0RWXGojA
 MTkCFeW0b4r+qHzaxsxubbxFZAbVSSK9XuEwsfkB9Rq65ArrqWqX7r3Nt9Ruo6/GnG/I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yG4NaiIwJDVRa91GbUkjytPpX0qB5PkhDezBZEAmJxM=; b=lAB4lOUvcP0YQJAZmfirBlr7Tg
 774AuD55XXiYFI1SC406FgcTAaavH9OvaudWFeyxcEx6HujLjvk4VuGnYVq9htd/I7bIl+DNs6ISG
 9ieJWHgC09P8T2Vo+4yrDr5uEdXnNrZoNubfiBbyMldzLB3EtVdr/L3VuLDBOC/9wE5k=;
Received: from mail-tyzapc01on2071.outbound.protection.outlook.com
 ([40.107.117.71] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8Xon-0007se-BR for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jun 2023 03:02:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oHywBGUK7RtIahJCVitMtgTRZxuq62SBfPfc4ljyg3HBynRACDy4vXyvxv550BHwXv9163vfKxO167HV87KQghhZ+qQYrSe5KlnGF3mhySvRl6qKdTSjwb2Kxvia48QlGicN30LOUICSh35140bHeS3x+nIcjJIuPE56MN7p4sju/ZUOiS3KxIEipOrm/DPHqsgYV9B/fEbmzD+90s2eVH93HK1yrOQhL484GnsqdbqdiPpnDe5FMF3662pwTKp6HRmyvYJoDDzFjaECk0e/fTWTV+jfclVKCVTr6JoBLBb62hN8bIqIEoTY+NvfbBCzqtgCaZSKteSVel5WiaoIag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yG4NaiIwJDVRa91GbUkjytPpX0qB5PkhDezBZEAmJxM=;
 b=iWV5rSI+YaCh9WHVyT1BMXoMPqiAbFD0mutn2RVgrl+Nhnzr9u+9CQWAKTS+aycslXVuGbmYTIBZKKK4MO8hyMxH2fq9NLlQu2MuGlQWp4EZqer50WXkRVuNDY24y/DDy070+212TBCPGaYEpkbVOarQr95uoP7zuwenqekyICEXzV2bEsEEZ2HIZX8EdjqtdolZermbNAl+9PyjMmXD/vUukjyV0JOCk5im4pR8a2yJIiyMQJNlU6u/EqDNScNDU/wcLRJz5E01PXsH7rCkTGWMucitRQRx9/Ln5dKsWb12i61ADJyvA/ReK6WwV/nme62GYu0dNXWXjSCO82ruMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yG4NaiIwJDVRa91GbUkjytPpX0qB5PkhDezBZEAmJxM=;
 b=ZlpEdXJZxSA+P7zmhq6IrKNTAw1XaAeKs74eS3ncErV8WBklXjMALn4mF7tsprdTMh4+l/T9AZh4wRY/Y3MlTl3ClvQoWtfNiwbRTxk0/qXG/Ae7jNmIKmiRxYhHLKXWgEJpop9N4PAdWJ9ZXNyE/XAj1238pulgBtjC67df52g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6) by
 KL1PR02MB6259.apcprd02.prod.outlook.com (2603:1096:820:dc::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6500.21; Mon, 12 Jun 2023 03:01:46 +0000
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::6297:13a6:41f1:e471]) by SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::6297:13a6:41f1:e471%6]) with mapi id 15.20.6500.020; Mon, 12 Jun 2023
 03:01:46 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 12 Jun 2023 11:01:17 +0800
Message-Id: <20230612030121.2393541-3-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230612030121.2393541-1-shengyong@oppo.com>
References: <20230612030121.2393541-1-shengyong@oppo.com>
X-ClientProxiedBy: SI1PR02CA0029.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::20) To SI2PR02MB5148.apcprd02.prod.outlook.com
 (2603:1096:4:153::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5148:EE_|KL1PR02MB6259:EE_
X-MS-Office365-Filtering-Correlation-Id: ee3d659b-a27b-4415-8a83-08db6af15b5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5x6AMKJbDVweatTajHefXK3uD/csCXbk23plknNb/SJsddH6Kb5Ki4D+gXmz895DCeYu75ZNNlSAFor1B1ngsZqs/hWeep+9XS4HeVAzr5d/clcPbwqAeVn9Qh44PnXfankRclPar/7++U4+dfIMjX6Froo/HRlFlb1dN5GPp8zs0vLgjwG3Cdg4cAh1e8agacpEPbhlgk6/UGaFFtKrHrtwAiHEJDT2RGoGxOEnEkjCyIcInUg0e/BNfbtKiagcnFDN6r1SFrCHzL+IFbuzILgnE+Dl+hebLxc+OmzrEnViQNVcSPgsDRP+W8Lrlra37mK7e+54uQyDzaw1VMziY3/WrTbYpibHnq71BYFpR0zSTl7XoE9hVGzwkbPGejPRqSYBjdu91V7CcaskLqOEYlltiKtEKeychCVDfHjVHAwiPwAzWbch2JFT7GeLqRzrP3xc+kUVj1nfj+vAHdqQNiaybvl7uW8hViTwynVy469+q2c0MDbOPnY1sORd5QSO7z4Suoxl8Q4+/IFj8dGkslNZKuoG580BPhubvNseyShkCTsXfZdLIZn0yeRTfnnF3J9JRIQoWBWe07jkR1XKbyDtmrLPBLw/++/dwLnaeoNe32iZ+Oyji2tK0aQ8/G8Y
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5148.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(366004)(376002)(396003)(136003)(451199021)(66476007)(66556008)(8936002)(5660300002)(8676002)(36756003)(66946007)(4326008)(478600001)(6666004)(41300700001)(52116002)(6486002)(316002)(38100700002)(38350700002)(6512007)(6506007)(1076003)(26005)(186003)(2906002)(107886003)(2616005)(86362001)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DUlp9yiDqy1Tn20fL2JCARYWAH6lmKYKBcdK6ePhMe0z+ctliDbCdj/o07yw?=
 =?us-ascii?Q?6AkB+TsymsXNi3OaQf7mNmqThVkXBsJRWUnBtRYpThg3G9AgajfyMyvJO1L0?=
 =?us-ascii?Q?QzTrv4NDkeo+aw7K7sz3psXxgl+DUDDralHUaLEE58ycsAiVwilrLg7cNX3x?=
 =?us-ascii?Q?FhiisZ/yez9q2JHGsKA0V56Cn2C9Otyyx5aWk4WFnkqYM6FzT33uBLb4+p5z?=
 =?us-ascii?Q?D0vMaQRVGgx32tXjgBMR/Xj0XZAqwDEWpF85zBBUPK3mTPHzBLBtIwj8E/ay?=
 =?us-ascii?Q?VUYIq0/g3sha3DxpqaOOTq7E8R1Nm1LLrUg+dac6QM8lHTwUbxtBsQmRruUO?=
 =?us-ascii?Q?kOOkhqCTkfnVbr6vEmAwGiO6nfk5gnFVobTHb8PLfV4IaeCVvRdoiW6jAfHb?=
 =?us-ascii?Q?/KBiIAnH9q6ItZC56+j9rKldn1lTxdxULI32G9jRFjis8XTUSLV3Yt4mPvHL?=
 =?us-ascii?Q?a4SQUqSJspihWtLxmEtBNAWCVwTlYBof1Tlu/GrX08S6vXFAe9uktEwd5wM4?=
 =?us-ascii?Q?ILyIDPExQ6IdtcVGOoIzhWq3ihjFUgqmfXs9NcsJl3uJgg7PgjXuqvxH8RBx?=
 =?us-ascii?Q?rz0WKTpu9cUIQytNI+iUw2X0Yd2oTdvbKswezI8DxNTwsyeEZrHyuznK27a4?=
 =?us-ascii?Q?mdr0Jsx74jQWKjpBkkLoAtkREDUTUvovKWaugnZoNgXeD91QadY2C4C3iV4u?=
 =?us-ascii?Q?ObJ2JqCzvwT1vqoKubi34hp8qRc/aU5re4aNo+0eVLm1Djm4LmHK8dvWCE99?=
 =?us-ascii?Q?yZK64cNs7UDwVgkCVvue94f2QK6PNha1oviFxmBnk9dg4LeLOabc9PljsuIB?=
 =?us-ascii?Q?1K2UcZu9A+YIcL0z9cHeEYrs/yAHZRKhGb/EZI1RDrt0cE5WGJ0C6VDb9sFe?=
 =?us-ascii?Q?3fCCJx31YZ1QUCKHmm+q6fniEpFgomccYa/LhGOCRfcbokgtT+SVEPeB+vsG?=
 =?us-ascii?Q?ktVVX47/f23femfBNMJa64FGenOG4cvajLVa0mDyUxKweWy2aXiugwdYS9qR?=
 =?us-ascii?Q?yB18Sa0evUpd3pTxRp2WLpQHNTisvxVcOaxPTf8rPhSUdjNqKfEsArOLI+1g?=
 =?us-ascii?Q?yyUWP61pQUwj3Sd5W1WjUtFM5CvL7QXvDTvo2arr0rAY1Tg5TdfDREplNpHQ?=
 =?us-ascii?Q?e8ncIWzTp1Y/CG9fI9UeZCKpExhpXD5T1tuYAQQ/XligAd6LaK2RENhCvSe+?=
 =?us-ascii?Q?+NV+on5TmvSiQJV8Ib9/Q2E/KpuWi9zE32N6X1ip+nqheWh05CrbhDo1NtBi?=
 =?us-ascii?Q?0GMnXieGO6o/EJ/Odl4F29T4jGYDmZK/xLo4/Z99lJQXNZZJG4XSeUx5sbo3?=
 =?us-ascii?Q?DOLcnIflq8eTJaH2peqj4WGo+FmbBANyMpxfdeJCAurxOcnpaCVVJb7aeKRs?=
 =?us-ascii?Q?Xs8Ifd7u4raNcPHNc3xavsEc6vQGvliWT0CDpqXP7bMD/tW0YjVEvcARbgKO?=
 =?us-ascii?Q?3GtFqqS3OrPzmQV7Qftfo0LXVs2hXTDsLHZ6L/BHaO9UpyLMj2+VsY4BochT?=
 =?us-ascii?Q?SzJ2BVwnN+85jgWrOc2j2hixTH3r+euYt2lXG+GJvGYT4lLsgcFSPVUzi2b3?=
 =?us-ascii?Q?r+qeANz6k5t2T7nqpBqBrEECGPcCVL6WKFEiYpYl?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee3d659b-a27b-4415-8a83-08db6af15b5e
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5148.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jun 2023 03:01:46.0237 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rP1XJo4UT6OPywRqHJTJf8wg9uRpZGidI8pUhWGjaNnpInRbvTYP3WR+6XaNhrhU0sqKslHEL2mwUEc4L1OyGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB6259
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Sheng Yong <shengyong@oppo.com> ---
 fs/f2fs/super.c
 | 2 +- fs/f2fs/xattr.h | 1 + 2 files changed, 2 insertions(+), 1 deletion(-)
 diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c index
 023981824d240..d7630f6dcbd62
 100644 --- a/fs/f2fs/super.c +++ b/fs/f2fs/super.c @@ -1361,7 +1361,7 @@
 static int parse_options(struct super_block * [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.71 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.71 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q8Xon-0007se-BR
Subject: [f2fs-dev] [PATCH v4 2/6] f2fs: cleanup MIN_INLINE_XATTR_SIZE
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
Cc: ebiggers@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fs/f2fs/super.c | 2 +-
 fs/f2fs/xattr.h | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 023981824d240..d7630f6dcbd62 100644
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
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
