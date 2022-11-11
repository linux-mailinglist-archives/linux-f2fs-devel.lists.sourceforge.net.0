Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A19EE625832
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Nov 2022 11:25:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1otRDt-0005dh-Iz;
	Fri, 11 Nov 2022 10:25:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1otRDS-0005cq-2Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Nov 2022 10:24:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ffos0/zYHGurDgmO9NUd5jUgkWs+Vhq7VDzZxBNU4Vk=; b=IwIUNNDi7ExKK76JJtbPSqXkCM
 htu7adWlaIXxfJpeVIYtNvUSDPUQSwqfOH8P5MWmZ3ftDh6fNMB09s3QVH1TuemELigfA6DbOTgIZ
 /wnmcmzgGrEkPeBHhwD1BHWFgj7LVYIg/05xcM9+yTtfAMJrM1E5oarSIntBqmW+RgLg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ffos0/zYHGurDgmO9NUd5jUgkWs+Vhq7VDzZxBNU4Vk=; b=Y
 nBJokaz7GWv2PaPURfIehAwekW/bgKCsa7KTqbtz4qfR3FXN/BUPmyHQa19zrarmob2dlay5/u1nE
 ppPpWE+YS8pePAs7whz4jaoUTmlsMtCyglLSRIFpEahLyi3rY1A0rv7f3BzQa9pgBe08guYOSmSsX
 q3/6LuKj8hJ5Zpmc=;
Received: from mail-psaapc01on2067.outbound.protection.outlook.com
 ([40.107.255.67] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1otRDQ-0007ed-HB for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Nov 2022 10:24:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EbyGjDTc8yR5Od+5oekXdBQ+Bx7CJ4ud0gc5B8pSD0UPpOOhHl/F+nXkHROOSXJGGfbSn+8d+U7xDXZGNKjtLAoy7nE/arUI30CWToz4BDhLhqzXRhhjrUXpnkQuHbIKHiofJpGYdJC7AVXQ5vVDHX/STxHykqNXpeaifQyMmq2hPZMWMpychGXJDiO1+06W/DfpU8Ana1c3Q0dGF9+zUlz713ePIlrGBgS/8AywI6Ge/ve7HcliYj9lN1vcwCdAhCJUJMO+AaCfaIcdQkvHy6UUuI2V45yLpjQaV26N0waciAy4EHqPWgkpMX7oF44F/M+3wkTqyavghyT4QjcP6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffos0/zYHGurDgmO9NUd5jUgkWs+Vhq7VDzZxBNU4Vk=;
 b=JoCcTg7AtTkKXYCH4kjj5/YkDNZtubmH0DbZgIb7SUV4m7/Uir6EF42+euizYQ5moYsvzAw3oRfKberQWjOgtM5Z34OXukYvFW8+Soz/PAmZDRd1kWY3wUnznI/bVVCboSkR6coyXoZR2UNf6To9GQ12LCQKeoMMNriClX6DYLO9wUN1DQlcDpsZ/vaPHu1suUFAtRSEN3VAppW0/HJhiUDku4bHjJ+mGa2vG0Hz8aG/RLIfoO99hgd9SqVpRhSe0fvJ4RgfKXCeduEbH4ADZ9fHqFYDCiR1llUzlM8HnPOLT77y69fmKGiBXFrZeF7STTFVGnG7Let6AczhVFWLGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffos0/zYHGurDgmO9NUd5jUgkWs+Vhq7VDzZxBNU4Vk=;
 b=QpTkgwn6rI5p9Xj4rRAj6N3sd4KVCp6hTNNy6SA+JwzA5SyCI5xmsYWyVGMHKGNZMEImzbFyu77A3duQCJmBPuwjNE8iZLUSLApmKrsZSqj7S0+fPucVVvEWkKC6XDcNn2qUmrQKF2JNtKKkqYCHaYoZXKZuTnqccfntRHvN/4g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6) by
 SG2PR02MB5901.apcprd02.prod.outlook.com (2603:1096:4:1d2::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.27; Fri, 11 Nov 2022 10:08:56 +0000
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::2954:8e56:dcd1:452c]) by SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::2954:8e56:dcd1:452c%3]) with mapi id 15.20.5813.013; Fri, 11 Nov 2022
 10:08:56 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 11 Nov 2022 18:08:29 +0800
Message-Id: <20221111100830.953733-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: TYAPR01CA0135.jpnprd01.prod.outlook.com
 (2603:1096:404:2d::27) To SI2PR02MB5148.apcprd02.prod.outlook.com
 (2603:1096:4:153::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5148:EE_|SG2PR02MB5901:EE_
X-MS-Office365-Filtering-Correlation-Id: c80cbf0b-b008-44ed-b9b1-08dac3ccbeb2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vLma93glbT3V4aUZYG+Yqurs9nk3DvwvbIkXP3CSLtbRFCDql6u8M0lycGb2NZQgczVWnvWXhislAz3jbg7UEaUqxsM8DvcFryMYgl1itqDUSwSn8CIho64eH2ZvRBs4HYlFYlIkXV+TiX6T7JGhNCOqrhoyvv69EANkVPE+61Db4nv5D6wAb6ziaJKdHL67R2IKqvIJm07jGaXISd36XRvyKSCFb/3nLTwn0I0ISERdT67Gt0WVGoP6NwBIp+yQbf9IWR4dNVdAzQR41HjXtsKGQ1bbEuV2CL7mrPPzZoHBHhAl/xuJplEcTMQqLSMv8ht0ckIpghzEWhskRMAv1so7Sq2JOweX+sBaq7gaceX8Pb+Uxe9sYNg67kA4ssq+jqxrmUuQubXRF8QCfDo1AugKRhBgfJD74a8bAWj07NkxD+gg2H3FsCSeguS1TS7jJqYNsT6rZzNsrQC3xm1gkqluOpwgnfJct+P0Nwed8hEFo7SpiVldfunSY4hrTAM+FZjBbLpV5qNiJs5ax9wGCwUPE8HXCKQdS/lAuryOMH139QkcHaPHZYSGFF+3FxPX9RtpNY/81FTehBSz47kBNAxLDoh/RXjmItHJZo4a8gX5/upvp9gOG+AQku51XeZ5tyVHfhmj4PYGdICW1l3YTtlBn4dFbdJHcW8FEI+UFMX2wf5P0j61Kga8jO9A6RQc2LydtoXguD3nTPiyHhVQVkHizyjGEaYGlpCUZxpsSy4ykz+jam40EIWGNq13jUQI
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5148.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(366004)(346002)(136003)(396003)(451199015)(36756003)(38350700002)(6512007)(83380400001)(86362001)(478600001)(6486002)(186003)(2906002)(38100700002)(1076003)(52116002)(26005)(6506007)(8936002)(4326008)(107886003)(66946007)(5660300002)(6666004)(316002)(66556008)(41300700001)(2616005)(66476007)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TNr7BtdM/EkOZlm+N5Ydf9/pMz1F7G4zXHmDLmnsTL4SjTcvsrTyUMUD/MUW?=
 =?us-ascii?Q?Qi7+oh1N9EL/XfyteglnJX1ucYBO6rjK1lIOJjkl4ct3UkOObYiFu6qMQeu4?=
 =?us-ascii?Q?hm2RCDj9jd7aTPiW1JeRIO8ZO3pAqHpWjxf5/jqQDpOOBoGoG+5z1o1plPd+?=
 =?us-ascii?Q?ILhRc7T+NzIEwh1zKQHDn3Wxx3XY43JaMN3+9oG7cPpfw6HNFfklyaWc4i3e?=
 =?us-ascii?Q?Mh8Rlqvp8M47A2tpnshZtF7rvKNpwpKsCAh7vkSMuO0vo+ztLKjGTHxQW0m6?=
 =?us-ascii?Q?xb4hOy2rwddYLlglbTNveY5rvQEyb8T5roBxpX2cXVM+bMUb1UtOUIhaUn44?=
 =?us-ascii?Q?HbYciIh7bDqxIG96Dnv9vGYQ1MV/1SXiQrg0XXF14IgmHy4x29WMJgSCMJvG?=
 =?us-ascii?Q?EbfTR5/jvMHwbIpQALT4sY0+4jYnhVzdonwy3XH61rddwGMXpylmu0TU5ReN?=
 =?us-ascii?Q?AIJ0HuYf+GVIqUF++uEXoREnIfFGk2AMdC57xS7OymkuymXa2fn9JMDM9DNx?=
 =?us-ascii?Q?eadG1YD4WeRmk1FH/atmY/30drSRaVYMCt+Vf+gAab8QHlKr47OSCGiVL3Nu?=
 =?us-ascii?Q?vYBIDvl4a2/eRObGXGJisKpLHlpZgPDcmkr8qNjdi3FnMo8lMo0OFJ/X1Ip+?=
 =?us-ascii?Q?PcDAMFJ2c75hJkjBUVHxANlRvwJfPGeIKxEPGzTFbD1FTlO0ju65lJ7Nt3hl?=
 =?us-ascii?Q?tdPfJAGz0Ix65emwsNp6jHdnX+i4hSf9Z71A/a5TZUiNb+JqcNnYZqDGDVYI?=
 =?us-ascii?Q?jkDQ4hO2TKxcAxRAWuqnYc02cvrecHLU2/E0VsAy1CH04ANobkcet109jqaZ?=
 =?us-ascii?Q?F1VTOJgNeOAeC00hPAb3AM91+WEBRvhWb6VKHZTIWz+wlKV/ZpS6aL+Ip5UU?=
 =?us-ascii?Q?46QE5tmTcuiZFOrA9v4wgpZTplNSpwhbbke+cLtOSafNXXEcAuw4kTkHrQ4F?=
 =?us-ascii?Q?DFDs9bNwi2stJn5AIWQUuBhgt9QhSStiw8fVyE0WSpPyuagxEQIDTi1+xzUd?=
 =?us-ascii?Q?cdh8qZLNg8PeTGxkxl36Eh/SoJfyRTBhczGBYiCq2z/26nA96ICphgb0onxw?=
 =?us-ascii?Q?xHDJU1PSktbi22yvuKbiLrtxH/aqVH6YwViMG0P8NK0jIoFvad/rpDo1PLQo?=
 =?us-ascii?Q?WZfGP/5RpeIJOQTgvcv7kbIEAhPi9w1WDh1EXotLpWNI3W3bQcTrRZuxITRZ?=
 =?us-ascii?Q?lQ0QEmqsU92RqcdonU9bbWAWrpae/HxW8LrKutyj6xq5o52nh2V5yTBIQbTg?=
 =?us-ascii?Q?dqMsxfP80gYf1FAVGUCQiibxT5Q1KQEQAH3msA1301iGLZw49kj82RcU/MDZ?=
 =?us-ascii?Q?AkB9yCFRLTbeGjnTOK0MBCGQ+uuckTi7ozLO68nE5MEQXN5iO6Rbn2V3MGvn?=
 =?us-ascii?Q?jAYsiYwQ0NmkLQl6bksjqvGFFa1XCR+ClV868Z5iNmzm0tCzx0JDQssGfvNn?=
 =?us-ascii?Q?iamiD46YxTNd20zEE0+YEvQOHww8EZxlQyKovF5bHQpWjVITfrWX6t5FzD2s?=
 =?us-ascii?Q?SHS1ztrMhP4uhJt2+93x+qRX1iJJlLZjbqTS40pUny72JHfHjXngFeWdaqnr?=
 =?us-ascii?Q?QZkGl5xgrmkEok0JqnaiD3III5y7M8o91iYtnZeg?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c80cbf0b-b008-44ed-b9b1-08dac3ccbeb2
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5148.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2022 10:08:56.8662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0D3k/01lkudxfA06Q2b1iVRBhDNSO4rL7dY7stqHBk2NV2+x6ikthZMoNdrin+Y2/agVgpOWJSh4Ie9HhhZi/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR02MB5901
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If compress_extension is set,
 and a newly created file matches
 the extension, the file could be marked as compression file. However, if
 inline_data is also enabled, there is no chance to check its ext [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.67 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.67 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1otRDQ-0007ed-HB
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: fix to enable compress for newly
 created file if extension matches
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

If compress_extension is set, and a newly created file matches the
extension, the file could be marked as compression file. However,
if inline_data is also enabled, there is no chance to check its
extension since f2fs_should_compress() always returns false.

This patch moves set_compress_inode(), which do extension check, in
f2fs_should_compress() to check extensions before setting inline
data flag.

Fixes: 7165841d578e ("f2fs: fix to check inline_data during compressed inode conversion")
Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fs/f2fs/namei.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

---
v1->v2: add filename parameter for f2fs_new_inode, and move
        set_compress_inode into f2fs_new_inode

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index e104409c3a0e5..36e251f438568 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -22,8 +22,12 @@
 #include "acl.h"
 #include <trace/events/f2fs.h>
 
+static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
+						const unsigned char *name);
+
 static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
-						struct inode *dir, umode_t mode)
+						struct inode *dir, umode_t mode,
+						const char *name)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dir);
 	nid_t ino;
@@ -119,6 +123,8 @@ static struct inode *f2fs_new_inode(struct user_namespace *mnt_userns,
 		if ((F2FS_I(dir)->i_flags & F2FS_COMPR_FL) &&
 					f2fs_may_compress(inode))
 			set_compress_context(inode);
+		if (name)
+			set_compress_inode(sbi, inode, name);
 	}
 
 	/* Should enable inline_data after compression set */
@@ -293,8 +299,7 @@ static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
 	unsigned char noext_cnt = F2FS_OPTION(sbi).nocompress_ext_cnt;
 	int i, cold_count, hot_count;
 
-	if (!f2fs_sb_has_compression(sbi) ||
-			F2FS_I(inode)->i_flags & F2FS_NOCOMP_FL ||
+	if (F2FS_I(inode)->i_flags & F2FS_NOCOMP_FL ||
 			!f2fs_may_compress(inode) ||
 			(!ext_cnt && !noext_cnt))
 		return;
@@ -326,10 +331,6 @@ static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
 	for (i = 0; i < ext_cnt; i++) {
 		if (!is_extension_exist(name, ext[i], false))
 			continue;
-
-		/* Do not use inline_data with compression */
-		stat_dec_inline_inode(inode);
-		clear_inode_flag(inode, FI_INLINE_DATA);
 		set_compress_context(inode);
 		return;
 	}
@@ -352,15 +353,13 @@ static int f2fs_create(struct user_namespace *mnt_userns, struct inode *dir,
 	if (err)
 		return err;
 
-	inode = f2fs_new_inode(mnt_userns, dir, mode);
+	inode = f2fs_new_inode(mnt_userns, dir, mode, dentry->d_name.name);
 	if (IS_ERR(inode))
 		return PTR_ERR(inode);
 
 	if (!test_opt(sbi, DISABLE_EXT_IDENTIFY))
 		set_file_temperature(sbi, inode, dentry->d_name.name);
 
-	set_compress_inode(sbi, inode, dentry->d_name.name);
-
 	inode->i_op = &f2fs_file_inode_operations;
 	inode->i_fop = &f2fs_file_operations;
 	inode->i_mapping->a_ops = &f2fs_dblock_aops;
@@ -689,7 +688,7 @@ static int f2fs_symlink(struct user_namespace *mnt_userns, struct inode *dir,
 	if (err)
 		return err;
 
-	inode = f2fs_new_inode(mnt_userns, dir, S_IFLNK | S_IRWXUGO);
+	inode = f2fs_new_inode(mnt_userns, dir, S_IFLNK | S_IRWXUGO, NULL);
 	if (IS_ERR(inode))
 		return PTR_ERR(inode);
 
@@ -760,7 +759,7 @@ static int f2fs_mkdir(struct user_namespace *mnt_userns, struct inode *dir,
 	if (err)
 		return err;
 
-	inode = f2fs_new_inode(mnt_userns, dir, S_IFDIR | mode);
+	inode = f2fs_new_inode(mnt_userns, dir, S_IFDIR | mode, NULL);
 	if (IS_ERR(inode))
 		return PTR_ERR(inode);
 
@@ -817,7 +816,7 @@ static int f2fs_mknod(struct user_namespace *mnt_userns, struct inode *dir,
 	if (err)
 		return err;
 
-	inode = f2fs_new_inode(mnt_userns, dir, mode);
+	inode = f2fs_new_inode(mnt_userns, dir, mode, NULL);
 	if (IS_ERR(inode))
 		return PTR_ERR(inode);
 
@@ -856,7 +855,7 @@ static int __f2fs_tmpfile(struct user_namespace *mnt_userns, struct inode *dir,
 	if (err)
 		return err;
 
-	inode = f2fs_new_inode(mnt_userns, dir, mode);
+	inode = f2fs_new_inode(mnt_userns, dir, mode, NULL);
 	if (IS_ERR(inode))
 		return PTR_ERR(inode);
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
