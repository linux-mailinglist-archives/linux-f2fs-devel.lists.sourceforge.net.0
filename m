Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE57F706894
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 May 2023 14:48:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pzGZo-0007Ow-Rr;
	Wed, 17 May 2023 12:48:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1pzGZm-0007Oo-9k
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 12:48:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DSgSpXwIXGcnki1tpfUv0O36lB+39nMzEGtTYj4RtlY=; b=aAzfmObPKRPFr+4PjH/I4ZuDn1
 kLGC7RVgni8Eie9LPEkCM+xSXHG1wjkCQBqlJT6geH3ufaAw3rp57Qjg4JfbJGe4h2STel8iaoBcI
 AT/gZ5+CUtjoZ09Wrj76bq51AGxuqbtnAVzeXtZHNpln9a9hVnAQQ+T9pF6JsfA9kDTA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DSgSpXwIXGcnki1tpfUv0O36lB+39nMzEGtTYj4RtlY=; b=b
 CrQUvUBvP93+X1Klj8nls0Pj75bkQ59Z/hjxuKLHnbbkqd82h76rYIVsUZ0lUdBde95IPJOg7j8bk
 cgA4gWlAfxz7hzZUkMMERyq2cebo042JutuJCDxiZttmFpnyRjTzinbBbSFZOS9mdW6EPhmGg6dTp
 w5j7McQMYgqkv6O0=;
Received: from mail-sgaapc01on2139.outbound.protection.outlook.com
 ([40.107.215.139] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pzGZg-00B3on-W2 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 May 2023 12:48:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h3lOw/SMr+12gD/wBJiFYLOGXNIdMLbXwxHNl2wv+u0rc+2yp9j6M6JzQ72fraNJ0Xm7P9adSg8efz17JNySrbT8IVisLrC3bFwEEbiP0oTlYvX8TvcSV+xUftVMokOfVLt0K8mEZkGqeXlOhY44k6toJ+s4vW0yc8tsWJ2VB/enJntcxxFB6HhMzZfhBabJD0flkZDDY9QrKvjVruKZG7mjUJjYOgkISM/7oLFEeZtHx2pZJoFE3gZKPguavP7IRPXeCKtb2AM1x1hKbFNeAyzZGIA7tgWP4GNcJWj+1Uswg2FjNH//ViAMvLM95SCsLeLT4625+s18fhHELD0kAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DSgSpXwIXGcnki1tpfUv0O36lB+39nMzEGtTYj4RtlY=;
 b=fd5eMHl/RchmD5LldSQPR3eLCy45GFcTJ0XIEYX77tXFFX8yPtVry1UjO62SqfEQIwI/mhDo+2Wf10xGp1FZvUtkBZQgC+FQWPZgPcu3sLI9/3SOkmoPevoRN6KGmTsrSmzCDnhSjaV8ygsdf3Ev+mXijLtN4kC+f5BGnHwVJaKJ3nFyV/G34Ely2G//83la8j71OXBok8JHyP49NEyoD/wNJ7GSNX/dv8Ux3fmiNloMQ5lzVouK8oIaQPBFDzuykVCrEzY8uAEIz25wq3ODs2aA+z5YkTm/owOS1VLk0jYl9ADyNkWzwJ4Dc+NlqH9ZmMojd/9HfC8LJNcwFc+svg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DSgSpXwIXGcnki1tpfUv0O36lB+39nMzEGtTYj4RtlY=;
 b=h47foT+0iZIyppiyIZOjzlwA+k/b0j3TK974hBdMqnxNcyQciN93w7kssrzEzJPfrXRvm2HxyQCLBK19SQ31E2y+3rUZtjQPWHS0Prg6R3WlF9AT5K+kJgKrcVbgqnZfK6Wn4fCoa2q8Wq5tqEgv9P6DgGpKfcq7gQImMUQzO3wd/Pb+EhZZ2NtKbmb4vFqVDEdZfMN9EmCud0i9VXzBUeGMCFllgPCguYdcPsOx8fMMPedqt5nqkyA5st+E+T5oLKunDi3Uc/NsexP8FLkrCjkh03TErVwrIy9GDPzVhMbpg5w7eMCFM6MTtaw0rFIpmTYhlaKgLHSdUWQ/5SjXAw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com (2603:1096:404:fb::23)
 by SI2PR06MB4092.apcprd06.prod.outlook.com (2603:1096:4:f2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.16; Wed, 17 May
 2023 12:48:04 +0000
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::a567:9fc1:447f:c912]) by TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::a567:9fc1:447f:c912%4]) with mapi id 15.20.6387.032; Wed, 17 May 2023
 12:48:04 +0000
To: chao@kernel.org
Date: Wed, 17 May 2023 20:46:00 +0800
Message-Id: <20230517124600.66160-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SI2PR01CA0028.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::21) To TY2PR06MB3342.apcprd06.prod.outlook.com
 (2603:1096:404:fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR06MB3342:EE_|SI2PR06MB4092:EE_
X-MS-Office365-Filtering-Correlation-Id: e27294ce-cc32-41f9-3533-08db56d4f48d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RA4EtzTGp2EGd8tJ7KeGhoH02V452Wlx6N/4ArzU0rDZWBrmg1PFmZy/vM6xEJuyDEMjt7hLCtdBvpIggs+siY9hk2jbnd1DWLsnknvYfqypgnAE5eeEOpznR+/v/J/pserifyDj4OzNUaBqLhugeYrk3Xh1oyVVIsxBP9nlThMuiEv6gehmjqJ6f1QUNqHsO0HkTmzry8odBJ9CvVhwSKhiOFacPawh1AXd67sdg/XNa6eAVWWM0IzJMgN3NLyldDmugU7IXIh3sgQSzQV6BKIj5IjfWg4pvP75tHO4ds5sLhm146FFoXVwd44VLHk5YgJzPJ6dQdcsankSNMKcgMCNMc9e8YcEJ1EqyW7q9wb13FaMkQSJm1eQwSkEVh3Dq0hwS78upGAJW/mO9oH0QalY+iiGJdD+WKo8HoTP5M8wmkwsWNJaA4aFdJ0rfsviAeGHeAtF8MrNP8wtFBWEwsqTcx+dSudfFM2odhAAw/Koq/turHPf7BuIYCz/JW/G5GNL6BKYe8IfXouML87NMcavjHMO9F9lhhL2lB/y6LSXTO1m7o4ojQYmsMEl25zx3pL82WTM9JcWpwrGox6ArjY8q6Zm4+Qpv3vBC1x2Rnw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3342.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(366004)(136003)(396003)(39860400002)(346002)(451199021)(2906002)(8936002)(5660300002)(8676002)(41300700001)(66556008)(66946007)(4326008)(36756003)(6916009)(316002)(66476007)(478600001)(6666004)(6486002)(52116002)(2616005)(186003)(86362001)(107886003)(83380400001)(26005)(1076003)(6506007)(6512007)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X10KUL+2i71XLL9tt2WZ/UOSouTr7Dbw/vRthSXX9nkSGAT52+b2BbkJR3OU?=
 =?us-ascii?Q?0HBrcnVV1gFaFraW85nDLNU55oDdTnYGRThBkQ35iEvRvejSZuhdeTOsRTZm?=
 =?us-ascii?Q?YWxcK2fxyy08+L6s1yT0snGlzrF2E7KDsvwS2/EfXbMM0zxTzjrr/fLc3WUw?=
 =?us-ascii?Q?m/AVItD4PJJGQnRxUEkYS6DnydMMesw/jq549WABNh6jQbymAKUCqHU17I4/?=
 =?us-ascii?Q?C9Oc1toalsD5LUAffkZ+epZKnaNsGpMCtlj5mXW69yN7F7Pm2lEng0aDmtCj?=
 =?us-ascii?Q?cSHJT8Hst9LZIE3fwCLErUy03t+z0x+JMDZWQqiYYrEFj0ZxA5LRGOuvu8ho?=
 =?us-ascii?Q?ZKeb1Ru6zoS5eB/2iX2/0L2NFTObw0YOyRmReGfA2t/5c7dra6nNKURo3nVJ?=
 =?us-ascii?Q?BfoCqSLwaycuRpPe3nNQITaUu1G5r+O+ez1+KGQ/BrBhEbogUSU6xokXZB+D?=
 =?us-ascii?Q?CAZd0t25RDvsJvjIk1gFcaPwYIBZYbwquB8VxPyxbFYvzpNIlieO4vN8mFxY?=
 =?us-ascii?Q?GIdmdgXfQORulRz7kz5MiXWEw3vbkoxseD9Rv6qJwcQ87BOXZS1koiQuZl29?=
 =?us-ascii?Q?vIfHMIvlgnLvB/V0XXpfmQQdjV+Mxn7TGwjLnfRFxCy0AmofGz4KWSYK/U56?=
 =?us-ascii?Q?tG4U6xxUwGd5Z9BCS2hh0Cq0d0L1kv3fXuaGrbjl1Za1EUar3NnkJq2nJ3aC?=
 =?us-ascii?Q?skpA3wwWDW4MuRXg7irnZ77X5IRkOTIT24Th6LfDTyoNnWp/ubzI7N0YabLp?=
 =?us-ascii?Q?K3DHWr70ocXmD6tT6qr2mE3Cl33HcJQFDnUKkiykNbNbwhz17G93b0C7kb2Q?=
 =?us-ascii?Q?NAL3rw1Osvf3DBJo/iFpOg2YjoLkq0fFXtjnCgQfdIHqpypPqY/RUi1ScUx2?=
 =?us-ascii?Q?f+VgB3waWa3C/DXgb5LxLOxlzRqhngZqDmfj2l/P134EaJ8kKFLPPXQdHJ5j?=
 =?us-ascii?Q?pJilwWm/7xkmjjdb4BlanXu0rYTghJjQuYEg61CjRBoS8/Dg72XWEDj4AAy4?=
 =?us-ascii?Q?PG22BZDfNfGJkszsW6zYZgC4HPwLgP3PVt5dUBEuFWh8pCS1PiFQBXatgpFw?=
 =?us-ascii?Q?a4Tv1uwslTaQH2GZhzdi4CtjPaunlPjF9AC19MN2zQBdemsBo/hqyzsFiEbp?=
 =?us-ascii?Q?jVBTSyOVEjloseFUM9JfxdfVOLYOpy1bUTjAIx4r7xhTWajJb7OedaOx5ITy?=
 =?us-ascii?Q?uSjM00/JhMgi8WFQd6P2qaoga02EPG7Q58KeTLDfrtlTvnbbz72vIpMpY6AD?=
 =?us-ascii?Q?0PvnwMi1EGLOhPQSM76ZSmXjon7Fgzv5zF1hkpE6oE9KZL9dPVyJ2iGbDolr?=
 =?us-ascii?Q?acgzzbwj8ShA8kdqXGUwxjrI45Dk3XNVpasEusTscY2DlUpx7XE3A47OzIBt?=
 =?us-ascii?Q?YeZVM1XxcbM9xxIEDEIunB/PBJycdux+6w5b87xJ99Ng+RW2o+UqjkICLwqq?=
 =?us-ascii?Q?eJSbD7Y6Gc/Uz2q7L2GjveAatMJDSwlQ9aB+EoIcSkOfxtWOLhgx0I0w7qBs?=
 =?us-ascii?Q?5rhPsu1XpIOLvefDFcpuBLhcg4LKL28L1GDuLaWjxbGmJbZbvzS+NUG44nFd?=
 =?us-ascii?Q?Faf6D61vZPfXZQLIRU3n4LNCoEXeiNvGyUoqdKyP?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e27294ce-cc32-41f9-3533-08db56d4f48d
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3342.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2023 12:48:04.1887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OexMlHSwZaOvEUMvhJViOoo736LmJTPLobi7zHPhEFEKCBrW5+gfzj5AgqKGp8gkXHwzuiAhNLm/k49BcBTMlg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4092
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
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
 no trust [40.107.215.139 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.139 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1pzGZg-00B3on-W2
Subject: [f2fs-dev] [PATCH v3] fsck.f2fs: Detect and fix looped node chain
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
algorithm to make the detection more efficient, and fix the issue in the
last node of the chain.

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
 fsck/mount.c | 123 +++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 105 insertions(+), 18 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index df0314d57caf..f89c44c3c00b 100644
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
+	if (node_blk->footer.nid == node_blk->footer.ino)
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
@@ -3440,19 +3509,37 @@ static int find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
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
+			MSG(0, "\tdetect looped node chain, blkaddr:%u\n",
+					blkaddr);
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
