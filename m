Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE8476ECFE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Aug 2023 16:45:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRZZc-0007i7-9E;
	Thu, 03 Aug 2023 14:45:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1qRZZb-0007i0-4X
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Aug 2023 14:45:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iFMBYkEDzC1w2shl6aIRitvnMPydXIJ0m9kpt/GFyCA=; b=YYsN3YRMecbisKdo+f77i1XQfG
 mU84L4neJIBK3ZAe8Xcbv52NKuvzFlVk0ALzObIU206aQpxK71+eTVPyUH4juVEJjJ0ReaJIUZzVV
 ZuKpld3BXCBfZi7Qo7LcehD/quU6DRnhEzibmQcWNuqZL8AYqnmJURSkLt0cVyIa13EM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iFMBYkEDzC1w2shl6aIRitvnMPydXIJ0m9kpt/GFyCA=; b=S
 /GWeSJELwcEnIJ2yKo+oFKjwPMQhRtv9HtMKCLJJsenWHKY4wVFl+5M74lnBpbPckwIcdoekuB4Vz
 k1h/oP0YHR1AQQ+XhPsrQDPjnLUUIGMujlXLv2YwXd01SfNguoFpqubap1Rmkz4IEd55CvCWJU/nO
 6lqsH6nhqCQT//wY=;
Received: from mail-sgaapc01on2122.outbound.protection.outlook.com
 ([40.107.215.122] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qRZZb-00C2rf-5s for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Aug 2023 14:45:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O6a7Cl0BlnuJTK2kX8pRt5dwAghzwWjj5FiqFjnLCPUiHCjuVDKfJ60v1fgpcn4OJzFRFDKA5o0bRiYQYq0ohmYa4OCcT2o6pK83WpYYrKE+fkiHK7WbNBeKzaGSwBXO8c7GPnS/0lUs1OK7BG40omTj0LnaXFTQ7ZEJ1ioAjDqAtGXA7NcoKY1jO9KjDnjA/tFr8JYTf6kyjmAiESwcsd6uBfwdhKtK+sDzq2QkC6dO3/9VeKTr+WFUYrVUzzj3dNxobJ7oKP9kR472TdPCDbYFr6Eqz7mfwTHAxQc3nCbD80r/LfOykXKCoqDC90eqxDCAkg/Eiskr1qSH/q5F4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iFMBYkEDzC1w2shl6aIRitvnMPydXIJ0m9kpt/GFyCA=;
 b=HH81JYTAVBd5506qkko73ZlasrwjAb5kZ5cgq7dGNu3HhcLHBQcy2OP8IRtii5BduVqQOx/xV4DmleFGLm9ht95L4lTTDCcbPTTeSxXJ4Di1Vatm3YhHA8y40S9RMk8p+JFl0eIhnQ2rANEzd2ZsXOStUcx/1rnxnHjF/tuKfuP/0UvFdTUZmJXACKgkzRKcBK9ZMNj32X1CvxgJVZRoTl8MJZtpdUjowbXZ1K+UnYDO6xUsLddH0M8Jy3fZ5aKMoRY2hQTvZw5SsVdJgkpGCBSXiqZaN+n7d+hcfK5Q9yENl7QPvKy0pntEgo/UXd5tflfP2bGuPzUNBG/Js/bEiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iFMBYkEDzC1w2shl6aIRitvnMPydXIJ0m9kpt/GFyCA=;
 b=ZJQxOl7C24E/SiHiyPlRBchHagoAQ3J9zi64wJKzhxEtoLkqy9c+ZOrxf4hRwKHQOAh5F3oeLKQCLz6wWV9yVeG+VByoYAE7bBVQE0LufbiaR3BdRypLSvznQPvPuyT3ZhhQ0rMqrrHWmnPRpzZ/dqeXY5LbvSnUCmhTkpMTI9KHhHMMTxaX5nipxc7TfA1TQIcnbtSKAcMxvnpTPXC1fyVtp536wvBd/33dZ9wy99d5LHqZ/UstkX/H3RTrmOqSXvlsJT2GWYEw6QnclJAZIH2AHLuEBk8htGHiH/Y9giLGVsqRXeuL/s1kKbM0B66pwSPmt7afBhjEaHd9sYZakQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com (2603:1096:404:fb::23)
 by SG2PR06MB5035.apcprd06.prod.outlook.com (2603:1096:4:1c6::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.47; Thu, 3 Aug
 2023 14:29:02 +0000
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::9df2:1896:b020:b51a]) by TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::9df2:1896:b020:b51a%5]) with mapi id 15.20.6631.046; Thu, 3 Aug 2023
 14:29:02 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Thu,  3 Aug 2023 22:28:42 +0800
Message-Id: <20230803142842.29062-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SI2P153CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::20) To TY2PR06MB3342.apcprd06.prod.outlook.com
 (2603:1096:404:fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR06MB3342:EE_|SG2PR06MB5035:EE_
X-MS-Office365-Filtering-Correlation-Id: d3bfbe1e-afbd-457b-4a54-08db942dfb84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qW+P+UD3mKfmj83u5AwwVyEdcEcjvReM4KnbhjK/M+Q5TzCcq8XPNJO5wbrGk8qfGpGcYCJQOq+bE0f2PpB3KzJmTcZwx4c9pmm8ePi9CogX9yk892F9VyqGpIkAepPgnLmL8Urujo1oWBtdoUG3zvS8kj8xk3V+gtTFbkXswJFFXNe7ZExf0VaXwnGdPCLKIMtjct0hCpgAr2fTLtGEiClXg/WKdnd0t3eIcnwbUg3ge1kEdEGfvtvrevq/cfvcDMqsL78cxK8dcY8YFGW8Y6mQ/mCIbdl78mt5btBSFDfWvaUp8k7G7ZA1Sae21r/Xe7jNEvk7eYICVj6z34JubnTp91WwUH6IHFvjsppxFeXOQBUPD/ksTkWiWndCuXYulxt9dsMDNy9fWbpRKGjR0om/VOZXdkyvMwtV4Q4seyhWoCh+fYRlLxXCtwzR6x8hTgmu+vymYAp10v/kV1RDSP78T3aK+QpV9n7+OolnEATKVrh/3Bms1waniDGVh/i1uTIvsOWq9vi48Nen7IfcxnTRsTwuEluroydtD+DsDaCRA2oCfrsUR0PNtKG01ViaBBBMbaEuKWBkz3qgVsYMmldkhhFt5xZDtthoEQJ9o+pYMzFstJee3CJkiLbXsXoj
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3342.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(451199021)(107886003)(5660300002)(8936002)(8676002)(41300700001)(66556008)(66946007)(66476007)(4326008)(316002)(2906002)(52116002)(6486002)(6666004)(6512007)(478600001)(38350700002)(83380400001)(86362001)(38100700002)(2616005)(26005)(1076003)(6506007)(36756003)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qhs0iBF7FUX6ER2aez9aOjew2ix9D4EUwM147y+RP+MSvKk0AQkCBWRQ+gj8?=
 =?us-ascii?Q?ITN93N5aW9Ux+103/5e9IcpmRWmTaqOi5q/1ynrDcWqVpOPlVWE0AfgvmCsc?=
 =?us-ascii?Q?gAakxV5qcFlRMdCFXYPjtJ3FGJEhnN5v+UhsoRHL3qzdf+AocRwST/HgaTJt?=
 =?us-ascii?Q?LLmCbvwGc1QEo7dr2nyOwdQkhWvYpVaYWurhnsXVq+JoLWc4oB/EACZ/+3x4?=
 =?us-ascii?Q?1wWrQDoI4NHJLhDDZvCfEpaDW5dW9qbeWCq+F/RtPn0m5zKy+VgaUqX/pQkj?=
 =?us-ascii?Q?ukquBd1atds5GORdD+fwqorAmlq2iagIGUShqiqX88nv36/GJgwqpdvoCe2r?=
 =?us-ascii?Q?wPq4DEOGeuplrulGcXZWdDgPACaYzFz0UOUIgLZARCIJMUKwtVcswNv6OIaq?=
 =?us-ascii?Q?UfzigaNH6oKnY0zECvI+gsQBv/5UUQiu3e+Y6R//JNPBLf2eHYiKU4wnHUNI?=
 =?us-ascii?Q?1ufOJixnGthy9vtmOL02uyZOJfbJ6eCCvlrY+Dj47cTrRPT4PwhjN4MGRgKK?=
 =?us-ascii?Q?KZYp3XL9Q6X5m5rmaWuARvhwPgnB8yYtvb8L/eJ4JdL9jM57H9J2tFLi67MF?=
 =?us-ascii?Q?iCenCiWBNVZxHJBQewYmmnMV9ybXZDtsZbVLbEvvR1MKmY7nlfp3NvLm4VbE?=
 =?us-ascii?Q?vxvv2yax1oKHVgbsmRZOgCYFD53aZ967DnxKdRa/yITrwCkEFG6QwYuIP0D+?=
 =?us-ascii?Q?QoAPh65jQCGNdHkp77+C3gp0JK/J034DzHAK9dTWXA3ysadGRRfzXwUuQog9?=
 =?us-ascii?Q?8ewMBiMDqSBfFhERx+nDA5hJlEQtuCVurpxJURfybPOwjy58l+p6Cq2uO02f?=
 =?us-ascii?Q?z6wO4688J2aZ8MN8+c4JhuhKtfrqM2A9vFaifItrtUGwrLhoed4WL+higB27?=
 =?us-ascii?Q?DsAkVjffTmWJwztZyLZBeDtEMxxH82I1iAQ53aHsQJjzFlCsNvG4jdE9ptBB?=
 =?us-ascii?Q?d1ziXCBiyVCp7NdrsIINHHkteTxq5loR3jGWU0a14LovtsEWzRRdsUAjlbix?=
 =?us-ascii?Q?cUOoIe0nPE5uqolr1NBx5rJJSie/2bYrS7xW0JgTTuHtwocfktlPY3/RIYQo?=
 =?us-ascii?Q?XGZBaxnjk2AjfhMhbgAgr9myO3V1/G+RQqCaA9a33J7QyJvpkbgND2R/+cjY?=
 =?us-ascii?Q?tXuYB3RcKsYdeM+mcgx2dHR2toR2o4asyFLsQo8wCj9j95japcK/wRoCLxMo?=
 =?us-ascii?Q?LD5SRUChm5K3WcmWOONVp1SQXRFX1PxYm3Ne1YPmEDRZ9f99EDDgosedNDSx?=
 =?us-ascii?Q?0DWZqdLVG7uS8haVz7WZBAJBr1RvVCHghsZA8Z3T9fP+kvvATIUiG+pnhcdW?=
 =?us-ascii?Q?ZsOhSpE8Xv/rm06iS+ZvvP/1RRD44Y/MvF8FsnfJxBdWDoRflefSjT46HNOq?=
 =?us-ascii?Q?DgwFsDTSomq7FU8sAfmnLWo8QzyiiqOw6oy3nAgu7W+LOZQnFMIao6gfThmV?=
 =?us-ascii?Q?ympLVbBcs0SLoljfa4XdR2v4fdvIolRCz+7XIknZ1glTuloImWj6iwo3D38/?=
 =?us-ascii?Q?PHNnxlRVvQ7zBQq90tokX+CquY4fWLlw9q2ivMoJDuh+iykcWI/xRD+mfXqR?=
 =?us-ascii?Q?AYSu+l+0jDKeHqqnbv+t9whWP5xK8oHN5G42cqiA?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3bfbe1e-afbd-457b-4a54-08db942dfb84
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3342.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Aug 2023 14:29:01.9364 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pmWGmu2Rrb8+6EfkRX+EZGk/W8JuEKuBxp3ldapYKkUNaTmOG97VPiUJyyVsKahMgozCNqWN9sC9fctKfpkTHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5035
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Now f2fs support four block allocation modes: lfs, adaptive, 
 fragment:segment, fragment:block. Only lfs mode is allowed with zoned block
 device feature. Signed-off-by: Chunhai Guo <guochunhai@vivo.com> ---
 fs/f2fs/super.c
 | 10 +++++----- 1 file changed, 5 insertions(+), 5 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.122 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.122 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qRZZb-00C2rf-5s
Subject: [f2fs-dev] [PATCH v2] f2fs: Only lfs mode is allowed with zoned
 block device feature
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
From: Chunhai Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chunhai Guo <guochunhai@vivo.com>
Cc: Chunhai Guo <guochunhai@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Now f2fs support four block allocation modes: lfs, adaptive,
fragment:segment, fragment:block. Only lfs mode is allowed with zoned block
device feature.

Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
---
 fs/f2fs/super.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 30883beb750a..26add77f9062 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -862,11 +862,6 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			if (!name)
 				return -ENOMEM;
 			if (!strcmp(name, "adaptive")) {
-				if (f2fs_sb_has_blkzoned(sbi)) {
-					f2fs_warn(sbi, "adaptive mode is not allowed with zoned block device feature");
-					kfree(name);
-					return -EINVAL;
-				}
 				F2FS_OPTION(sbi).fs_mode = FS_MODE_ADAPTIVE;
 			} else if (!strcmp(name, "lfs")) {
 				F2FS_OPTION(sbi).fs_mode = FS_MODE_LFS;
@@ -1331,6 +1326,11 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			F2FS_OPTION(sbi).discard_unit =
 					DISCARD_UNIT_SECTION;
 		}
+
+		if (F2FS_OPTION(sbi).fs_mode != FS_MODE_LFS) {
+			f2fs_info(sbi, "Only lfs mode is allowed with zoned block device feature");
+			return -EINVAL;
+		}
 #else
 		f2fs_err(sbi, "Zoned block device support is not enabled");
 		return -EINVAL;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
