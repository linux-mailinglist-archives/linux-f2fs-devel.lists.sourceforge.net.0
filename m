Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE60708134
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 May 2023 14:26:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pzciW-0000by-TV;
	Thu, 18 May 2023 12:26:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1pzciT-0000br-RV
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 May 2023 12:26:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0DF05FgWJXBXgpYnx8sdvv7SZjlEbbzJ2UOq4Gu/dPQ=; b=G3UkB6L5c9aOnF5dr7NiW4IifZ
 AaV1bv/vQMgmHW6m4wRzYk2/0xhea5dkbVbaVhXxlxt6WXa7fs3j4A5C4ma9UnwSxXLqdh7SFUJcX
 7VAPzoO7qr3Y0BnHKIibwUhjBU5jFfeUm8Yo2G3Gy89wtuqqvA8y/IzDmbtsLf0rb2n4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0DF05FgWJXBXgpYnx8sdvv7SZjlEbbzJ2UOq4Gu/dPQ=; b=l
 feOwVC78ezMnttFhVY3eVI1sVKQ+TG/AE3ltn97R6tI43kDyQmMCAQSVH//6X3mPij6pqTq5wZTj3
 kOldl1c53TxZ0IBYoUUcQnYOPrIXYDqEcyNn9ya2S5XZHAbkf8V6lOOrUNxuNnc3sAv246GL8Eo4C
 U3u9h20tOVuK3MiA=;
Received: from mail-psaapc01on2138.outbound.protection.outlook.com
 ([40.107.255.138] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pzciQ-00CL4q-NG for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 May 2023 12:26:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GuEE8hPNyppu/hNOzTt4GoptK0OiZ52KB61RisFv6YrA/Vk+wpw8chi7eaIjS9E3FR0Q3DZ09m5NBoHW9Wviuc8a09cTMi841UodsxVy9zDvCcUH5bEGSCoTC0vXRNIFrwq6eMZvLitDCxcsbhh3W3h3N9SWXXZ1L1iR83JXE7ymzOiAU3dNBhue/mVQc7vAzjK7kvUYfBes85dlqqN0AEZqYe1IIsd9PnONycgP9T61bULw+mmiDH9si3SQwlpjknxtpIXQCO/hClcIEak99ha2sZzMfdmDSwkTunoIN8ehbTRA8RO/Nk7t9GHWFq6VjBs3ecR6tCnLnZ7d+2w8Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0DF05FgWJXBXgpYnx8sdvv7SZjlEbbzJ2UOq4Gu/dPQ=;
 b=k9ByGiNDLeTHjktcozCqeVNNnCW+vCgqexCXr9fnJlS+tV1WDgEXUyUUtoLsOq84eQvgHHl5RnsW4xv3nxZt5TrBYatu5/7QYyNexG76MIs7wksQCKqpyJHpTR0yQQgEXf0G96VhzPASmzNjhDYQwOhmN/c5YDSs9bljWqSdZY3Wv3gdPtzTJbc3RwhXYH0tD4jRUg1YNu4oWCBKojFODvDIo7wjmnhaKwcVIz8EE3W9/LhpQyeg9vY/Pomn+yBWZc8CPUwBlAHEOtJR2N0FOy8Yi4UjkLIQgwY8S7Yydv1+Zng3hfcp0gCrfR6EIxN2GyNLWHshb2SFW/iE3I3Urw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0DF05FgWJXBXgpYnx8sdvv7SZjlEbbzJ2UOq4Gu/dPQ=;
 b=bbD4lSH+7n3TAMiPCEtaH0fsx45M4V1PjZungD3WVwNmOAqCER3pVZ34uk0IHCZJfkP5hKaEvRcnTJA9jkiSQdqkuBxCTVVr9x3fd6UUh5gANxZMJc5Zx3GBnOqgjrpdu0cxU8eHpe1EO5d+DbW4KoUs2m3ff5NqFn8tYGrLZWzOm5wbVFvu6171hI8mM7cefP+/O5vMIhh2vmFxVhNBUEvwgq9taLCUp4/LRE+pMDdeVcgPD+lx7d18mfqtGZhXsDtwu5XASk+dKgEssX4fGXDyBZd96DUlMP+q1FMzDfNVTFtpMM0GDlDGI4SL4jnu+gKZwileBunarWbqEQGd3A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com (2603:1096:404:fb::23)
 by KL1PR0601MB5631.apcprd06.prod.outlook.com (2603:1096:820:c3::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.17; Thu, 18 May
 2023 12:26:34 +0000
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::a567:9fc1:447f:c912]) by TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::a567:9fc1:447f:c912%4]) with mapi id 15.20.6387.032; Thu, 18 May 2023
 12:26:33 +0000
To: chao@kernel.org
Date: Thu, 18 May 2023 20:26:21 +0800
Message-Id: <20230518122621.62041-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SG2PR04CA0204.apcprd04.prod.outlook.com
 (2603:1096:4:187::16) To TY2PR06MB3342.apcprd06.prod.outlook.com
 (2603:1096:404:fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR06MB3342:EE_|KL1PR0601MB5631:EE_
X-MS-Office365-Filtering-Correlation-Id: 73c1b014-6d25-42c1-8a74-08db579b1dda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Z1s10hu+qONqsE6F4MUNJX1CTdaXisqU+ev0vF1Dy1M88YiMHGOsPH/Jm9vki2akFGzg2N3pJu1AAeQJENWnltTV+tLXQfdLmsYwaTydTZ3f4LTvmn6omr36AY42HW1P+l3jCz9ApViIjUk7bTfZ++yEYuQatJZ3eWbFB5q1mn/Eoe/nFTiKzrTb3EEq89FifcGjs8Xjz1XXryS7Et+wYKyUwGlDDr1BPMVTY+WTMyWY9QkRAOKguGH8XTv3moMDdtb5pIAats7fKxnpVekmvQq7BLvkNyDxxzKHrQXgAZi0YgPt8LPK+4Ud0g6hYQmf+jh/HB8HySKFYR2P3g7mV9eycuJGL+UjMrDKPGqJ8Z4tyTuYc57yapY6BzKaFIV2dyIJkCoRZBNYyclmwyDZ9xINRRep8YgsNoDGBQmzB55dc7PTDKAOzGMuZFZIbbtq3Nw4S0nA/kXcVap2msDbl6lO6TnmM9hkqTFSu0AHNuemAs8p40ls+3Q09Sj8kk9MUPCDjuFDKqWkXV+Ay8tKoj1FFr03Y2QQFZ47X5wVnTJWWuqwDTfCUkp6kTYUFxZF6L0225awW4yxiOpITBJTl6T2KhkpuGWZDa/oiim3ZU88AsX7cuVr6S/w3YQ/1i+S
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3342.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(136003)(39860400002)(366004)(376002)(346002)(451199021)(8936002)(5660300002)(83380400001)(107886003)(186003)(26005)(6506007)(2616005)(1076003)(86362001)(6512007)(38100700002)(38350700002)(8676002)(6666004)(41300700001)(6486002)(6916009)(52116002)(316002)(36756003)(66476007)(478600001)(4326008)(66556008)(66946007)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Zpghs6pA44+YGPpq3YaOYQk2SduEU9+PIZ4qmzKLhiufWLUSA36wLah80hBw?=
 =?us-ascii?Q?Ay98NF292jFmEtrJ9YjfQJqnf0IZ6PlmnWiaU+1UoujdwIIUSA37XweyEJTu?=
 =?us-ascii?Q?qvEFhkJ/7GzXtMfYGyJrbxdWaZTy+c0xywB7sxEnh7Hprgy+v50+apYi8mIx?=
 =?us-ascii?Q?Xbo5f8KzZTbX3ZEoUKUm/9Zn+SEo8rgvTjK+NuBFwUwEAe9EL7dXrTXLKayq?=
 =?us-ascii?Q?4Kl2c3aN0nC3zD9L3NpcsBKcM7A0wni9K64NG2VTyvEvQaFvwOMkThj9g2eZ?=
 =?us-ascii?Q?zjQcuSRYj+y4AmiLh7xNcsvQVWNEDa+FtkGD7CC3pVD7UMog27Mc8oRPoVI4?=
 =?us-ascii?Q?MqI0hVp13mrb5LzC5K5tae33jTVHC8sqUJJLHXkAlUyS7k/Vu0/CSZ1WdCuo?=
 =?us-ascii?Q?0goYy5XgfF/fLqZAiaeLYNG3d+ZpaXB5Acd9kCJbB6ZNIpW01aGekleXCQ8/?=
 =?us-ascii?Q?AuzCbTvsxctVcQshbZbOmXV6WkhRo4almh8EzKU/Cs5G/KziBCDq/dN6fUjK?=
 =?us-ascii?Q?VEeobPUrzdQSR/Yg2sFuzcdOu3EiH6hEe/wvso9r6PBXtpYOKGOaLM7Mh2UY?=
 =?us-ascii?Q?sJTThYn3GHtuR6+ObUuO4glVckZjG5xCgr6bHxBftNoSKAItvLVd7fuLvx7F?=
 =?us-ascii?Q?VhkAnNDpEkv6WrSJahFvikjEGpnRgL6HTHyL1c5tC3+UPxP73rD9CRDj1fh1?=
 =?us-ascii?Q?v0GVDSsNpWdtxQoG8aORZnTUJ0uYq95UcOehTZ3TPK8kTcsAeIReO/LiXgyK?=
 =?us-ascii?Q?kdUBg4YUL0evA3vDPZn9j0cxDgsdQbOyzJNc1vNkayiYQQzRprWKlf11kPN+?=
 =?us-ascii?Q?EiFrDDdJgxADf75p+VXjyHfRk+q/pEhPnvvSsGZsC1WS3NtYpGRveQmJmIoR?=
 =?us-ascii?Q?VmYkHI/32/VmvUWCMy3Zy0IkuuVDqWRZ9Cs6ucN3Hw5Jgxr5DXtXhQ9ai7xI?=
 =?us-ascii?Q?lyRHFvI3cQrBS5yZVYKMPpZHN/fWHv7uJzIqYoObzfE7r7gJ7+JpkjsRArdS?=
 =?us-ascii?Q?HwglL6pn5rT+Q4pyp+sNp+Zg6dJOy06Ys6aJZbKVZZA8yjeg710AwOoQ+2ny?=
 =?us-ascii?Q?jqnijjWpz5ROFsmzVKWYwsQr0Xtqjl0I2OHTkho2G/ITJR5W+bqA9MPWiuii?=
 =?us-ascii?Q?TAriUdP8ulnMOMUVH/JxDcRH5WdjpVLmcLfNfkT17dc0SVU1mFqRWmuctC/f?=
 =?us-ascii?Q?h1TKQY6T0B5zSngvbp0SbZHgR5HB+4Du1OfpxTohGVN5DBFWwlaMyTLh+bAm?=
 =?us-ascii?Q?cQD93dzCr65aBgZStqGjOpE2Iql+En6qsh9Lev9j4ci4HtBQtthfkTEWkXSP?=
 =?us-ascii?Q?AfVqGEff2qVfDeHxMwRBYFqzkQF4nMG04Vfwuj+cxsWNrjseCwhxm5B2g/fy?=
 =?us-ascii?Q?X3henPBcS64jXmI90uLYsaktSxOzVRl5yATl1MCf4izkbsKv0u7AmTdR/S9u?=
 =?us-ascii?Q?om3rk+kOXGQQ75EIT/LvaOG4Ej6Za+dnt1U5in8ONndZuIlxcyyCpbXPUkJz?=
 =?us-ascii?Q?jaRvpS7JVQyjbJNG1AJ9HoLJM3Ib8Hu3QT/fwTruQ2CxX6Wi2ga1ZpN6tyQy?=
 =?us-ascii?Q?vGlTzrN6fFCMSYFa245B1P9P5lzi3yHRlggKcogM?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73c1b014-6d25-42c1-8a74-08db579b1dda
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3342.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2023 12:26:33.7638 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m2XxtF0J6aJ1gE3UCSzP1SSLnPgqaF2L9LEjC0qZsqIHKojqnvgno09tzUFMMz4vIWABXadPjPtKk+1/rUziig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5631
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: find_fsync_inode() detect the looped node chain by comparing
 the loop counter with free blocks. While it may take tens of seconds to quit
 when the free blocks are large enough. We can use Floyd's cycl [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.138 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.138 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pzciQ-00CL4q-NG
Subject: [f2fs-dev] [PATCH v5] fsck.f2fs: Detect and fix looped node chain
 efficiently
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Chunhai Guo <guochunhai@vivo.com>, frank.li@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

find_fsync_inode() detect the looped node chain by comparing the loop
counter with free blocks. While it may take tens of seconds to quit when
the free blocks are large enough. We can use Floyd's cycle detection
algorithm to make the detection more efficient, and fix the issue by
filling a NULL address in the last node of the chain.

Below is the log we encounter on a 256GB UFS storage and it takes about
25 seconds to detect looped node chain. After changing the algorithm, it
takes about 20ms to finish the same job.

    [   10.822904] fsck.f2fs: Info: version timestamp cur: 17, prev: 430
    [   10.822949] fsck.f2fs: [update_superblock: 762] Info: Done to
update superblock
    [   10.822953] fsck.f2fs: Info: superblock features = 1499 :
encrypt verity extra_attr project_quota quota_ino casefold
    [   10.822956] fsck.f2fs: Info: superblock encrypt level = 0, salt =
00000000000000000000000000000000
    [   10.822960] fsck.f2fs: Info: total FS sectors = 59249811 (231444
MB)
    [   35.852827] fsck.f2fs:	detect looped node chain,
blkaddr:1114802, next:1114803
    [   35.852842] fsck.f2fs: [f2fs_do_mount:3846] record_fsync_data
failed
    [   35.856106] fsck.f2fs: fsck.f2fs terminated by exit(255)

Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
---
v4 -> v5 : Use IS_INODE() to make the code more clear.
v3 -> v4 : Set c.bug_on with ASSERT_MSG() when issue is detected and fix
	it only if c.fix_on is 1.
v2 -> v3 : Write inode with write_inode() to avoid chksum being broken.
v1 -> v2 : Fix looped node chain directly after it is detected.
---
 fsck/mount.c | 128 +++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 110 insertions(+), 18 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index df0314d57caf..c98b7ba00b21 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -3394,22 +3394,91 @@ static void destroy_fsync_dnodes(struct list_head *head)
 		del_fsync_inode(entry);
 }
 
+static int find_node_blk_fast(struct f2fs_sb_info *sbi, block_t *blkaddr_fast,
+		struct f2fs_node *node_blk_fast, bool *is_detecting)
+{
+	int i, err;
+
+	for (i = 0; i < 2; i++) {
+		if (!f2fs_is_valid_blkaddr(sbi, *blkaddr_fast, META_POR)) {
+			*is_detecting = false;
+			return 0;
+		}
+
+		err = dev_read_block(node_blk_fast, *blkaddr_fast);
+		if (err)
+			return err;
+
+		if (!is_recoverable_dnode(sbi, node_blk_fast)) {
+			*is_detecting = false;
+			return 0;
+		}
+
+		*blkaddr_fast = next_blkaddr_of_node(node_blk_fast);
+	}
+
+	return 0;
+}
+
+static int loop_node_chain_fix(struct f2fs_sb_info *sbi,
+		block_t blkaddr_fast, struct f2fs_node *node_blk_fast,
+		block_t blkaddr, struct f2fs_node *node_blk)
+{
+	block_t blkaddr_entry, blkaddr_tmp;
+	int err;
+
+	/* find the entry point of the looped node chain */
+	while (blkaddr_fast != blkaddr) {
+		err = dev_read_block(node_blk_fast, blkaddr_fast);
+		if (err)
+			return err;
+		blkaddr_fast = next_blkaddr_of_node(node_blk_fast);
+
+		err = dev_read_block(node_blk, blkaddr);
+		if (err)
+			return err;
+		blkaddr = next_blkaddr_of_node(node_blk);
+	}
+	blkaddr_entry = blkaddr;
+
+	/* find the last node of the chain */
+	do {
+		blkaddr_tmp = blkaddr;
+		err = dev_read_block(node_blk, blkaddr);
+		if (err)
+			return err;
+		blkaddr = next_blkaddr_of_node(node_blk);
+	} while (blkaddr != blkaddr_entry);
+
+	/* fix the blkaddr of last node with NULL_ADDR. */
+	node_blk->footer.next_blkaddr = NULL_ADDR;
+	if (IS_INODE(node_blk))
+		err = write_inode(node_blk, blkaddr_tmp);
+	else
+		err = dev_write_block(node_blk, blkaddr_tmp);
+	if (!err)
+		FIX_MSG("Fix looped node chain on blkaddr %u\n",
+				blkaddr_tmp);
+	return err;
+}
+
 static int find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
 {
 	struct curseg_info *curseg;
-	struct f2fs_node *node_blk;
-	block_t blkaddr;
-	unsigned int loop_cnt = 0;
-	unsigned int free_blocks = MAIN_SEGS(sbi) * sbi->blocks_per_seg -
-						sbi->total_valid_block_count;
+	struct f2fs_node *node_blk, *node_blk_fast;
+	block_t blkaddr, blkaddr_fast;
+	bool is_detecting = true;
 	int err = 0;
 
+	node_blk = calloc(F2FS_BLKSIZE, 1);
+	node_blk_fast = calloc(F2FS_BLKSIZE, 1);
+	ASSERT(node_blk && node_blk_fast);
+
+retry:
 	/* get node pages in the current segment */
 	curseg = CURSEG_I(sbi, CURSEG_WARM_NODE);
 	blkaddr = NEXT_FREE_BLKADDR(sbi, curseg);
-
-	node_blk = calloc(F2FS_BLKSIZE, 1);
-	ASSERT(node_blk);
+	blkaddr_fast = blkaddr;
 
 	while (1) {
 		struct fsync_inode_entry *entry;
@@ -3440,19 +3509,42 @@ static int find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
 		if (IS_INODE(node_blk) && is_dent_dnode(node_blk))
 			entry->last_dentry = blkaddr;
 next:
-		/* sanity check in order to detect looped node chain */
-		if (++loop_cnt >= free_blocks ||
-			blkaddr == next_blkaddr_of_node(node_blk)) {
-			MSG(0, "\tdetect looped node chain, blkaddr:%u, next:%u\n",
-				    blkaddr,
-				    next_blkaddr_of_node(node_blk));
-			err = -1;
-			break;
-		}
-
 		blkaddr = next_blkaddr_of_node(node_blk);
+
+		/* sanity check to detect looped node chain with Floyd's cycle
+		 * detection algorithm
+		 */
+		if (is_detecting) {
+			err = find_node_blk_fast(sbi, &blkaddr_fast,
+					node_blk_fast, &is_detecting);
+			if (err)
+				break;
+
+			if (blkaddr_fast != blkaddr)
+				continue;
+
+			ASSERT_MSG("\tdetect looped node chain, blkaddr:%u\n",
+					blkaddr);
+
+			if (!c.fix_on) {
+				err = -1;
+				break;
+			}
+
+			err = loop_node_chain_fix(sbi,
+					NEXT_FREE_BLKADDR(sbi, curseg),
+					node_blk_fast, blkaddr, node_blk);
+			if (err)
+				break;
+
+			/* After fixing the looped node chain, retry agian. */
+			is_detecting = false;
+			destroy_fsync_dnodes(head);
+			goto retry;
+		}
 	}
 
+	free(node_blk_fast);
 	free(node_blk);
 	return err;
 }
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
