Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 459B17050B0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 May 2023 16:28:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pyvee-0000RS-0j;
	Tue, 16 May 2023 14:27:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1pyvec-0000RK-1I
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 May 2023 14:27:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lmBZXw29Ai809OkLuO+7LxaX9EvZHQPwxWSnq+/3ABo=; b=KTr+FzaUB75u+TBcO8kDL4LzG/
 epXBaCtRu2Kr7QBx6fij77S+fTAQMPuLrsArllUrzN9k4xQudVAji7gAaGKw4x8WjPVlLpqaibQxg
 lddgkbvEXAEj0Y2fmq3XPvT8UAdgdvrssDhlkZD4mtCgyLaEzTZWrwSrxGvQ5T9xf+sM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lmBZXw29Ai809OkLuO+7LxaX9EvZHQPwxWSnq+/3ABo=; b=I
 +7sac+S0qIkqthlEum4NbJVkhlyaV3xCb8G80mwgmvJ2h1r2ujQhmvqfrn0jrMixiG2F1TR6BCOvW
 0HQxfXqpbco4BoGyRylnZ/yS2RGevqwVPoE2dxJXCCy0oNzk6tWpZBzEjsHAhO5ww5Skvogd/gdjY
 1mMjoK8Nby/KWX7c=;
Received: from mail-tyzapc01on2128.outbound.protection.outlook.com
 ([40.107.117.128] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pyveZ-0004AG-4N for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 May 2023 14:27:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B7IsaW5sRMwL+QdyVoBgzikTufxAhjFUyNV/SjtJFvYfuB+X6FDat/WfZIN3vKVzn8fgYnfQdOz+wmLDqDMPYCMRhapPeIJ5h44I5RvA+n1enFXY7Otuj0gWE2ztg7vtaxCoMphM/m5+ZprnzhC04kQTqWLTlhO2C2u/t/lhNna2P70VX9EBC4RQOQCg7ILcJnWHvyw7yWHbpa3HP68cIzzgL6zQgQnDnlUJpmciSTDNK96u1C+b5WKLW9TrfAOO7sW4hbDdMoqgqfboKdNzaL4fJXm6/74im0BtUply6Vkln4qRj6QN705vAeh7+gOWZ5Td1NvovcdH5ipYMd3u+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lmBZXw29Ai809OkLuO+7LxaX9EvZHQPwxWSnq+/3ABo=;
 b=TT2lIKwlY/pTiu6Rv+Xm/mvuJ1e1g+wTbbiSDBKDQ4Ny5+eMJlKKRG/FpvYrR7hYn+kSa3HYlELviFn8pCuqsfQPks4btebba19AQMkwXp5JMTpuVaUe1U3TwHKEHEX3ZrJQSiLFB0oQjIgm9ZJ+zhxwi2a7lzLqSxIKNbcNzYgS0B63e9VRA/JrrHqTIbWDudQbh2P4dtn/yXYPwwnVg6jRBa+3c4pJfhxkyzcLCTWR+kCNuoOtjbLQHzSs7dLnOD9fZyg88EQCrv7B0kChwURNT4FpoNZ8c5C38lsz0/z+nf8wZV4mZf/IcY2Xm7OcalE/mP18bGTzL6YgG+S21w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lmBZXw29Ai809OkLuO+7LxaX9EvZHQPwxWSnq+/3ABo=;
 b=LI6/zif9RuDZeg+PoBmM9iYWJZdPKJF9aLghotWOU7iJQAA45iJR+YO9zu7kZJeLiwwNvIA4f+uygEckvIy/zEHv5gpJeQhx0WPnMGaOtqF/90OUJkzk9/MBag3FjczKKB5J25nUCiir34qiiZG0xjK2UnpJ4SitNijxs9r8vawd/xd4reLv3EHbU5IEARGemFuFDjHxvf1om3SmQo29oDS8FM3sLJ4SbKkxqNZ/mDuNL+fXuOc6zeMimKtKtDqQ6BgzqFc1FeTXitqM+iBLrwh3vgr0HqFYq28rrT69M/tNyb9+M99PQD7vEEq9F1NRfQHD/cuF18mvvJggFi2DpA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com (2603:1096:404:fb::23)
 by SEZPR06MB6569.apcprd06.prod.outlook.com (2603:1096:101:189::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6387.34; Tue, 16 May
 2023 14:27:32 +0000
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::a567:9fc1:447f:c912]) by TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::a567:9fc1:447f:c912%4]) with mapi id 15.20.6387.032; Tue, 16 May 2023
 14:27:32 +0000
To: chao@kernel.org
Date: Tue, 16 May 2023 22:27:22 +0800
Message-Id: <20230516142722.18931-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SI1PR02CA0039.apcprd02.prod.outlook.com
 (2603:1096:4:1f6::9) To TY2PR06MB3342.apcprd06.prod.outlook.com
 (2603:1096:404:fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR06MB3342:EE_|SEZPR06MB6569:EE_
X-MS-Office365-Filtering-Correlation-Id: dbed9f04-d386-4d9c-2f0d-08db5619af85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vz1HfDtS9xsneNkTXr4bla4+cvQHSXIKUXO57eXdTnfrpE2XVGDdv6N77owTtMTfyq+zevyzPBN/QnOvOXP7DyyDx9b/XiHI44HxZjNQRk7QoK+dU4RPvYfjsQqjGPQrr3Oiu5pc1/S56bC1r43TwJwws8rvPgie8XD4XZpexFfcaQYMVIRntYffQjD5QBbFzrzsa42gOhc8+FtuKGD7xFCUjLN4PnuxpvJ+P55i8hKbMRw3f6SvMNMEe7RokoV5U/rhVFnhAAYuswwhmyxNDvaOB7jMQwHIBedToIkJtuCmKJx9rgFq5F2mgR6nw326TYhaIWr/1+AfuzmmlIF8BvOL1Dpja8IUhB/U2ijqF7UfWsfB3tRrDUxBQhl7tBYfSTIgqXCxlLsrg6RuVlB/i3uPLOsoov/xP1rjrFpk62S9L1AtQJ/oH/jC0SxLlZp3AiEBQMcj/y84SMoZCdrJjOf43aZsooi6whT+ZM1snF1yybai7O3GpsD4YAAZxzlimXVAEc0cXUnHM8G6WwrUrzGDs/5i878/9Cm+O/FWQtgScR3WzvTpFGPqQhLmFXsG2rTiLdjhzYb/QCsZAsRF/at8ho3QXlFVs6tfZSzcuqI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3342.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(346002)(136003)(396003)(39860400002)(366004)(451199021)(83380400001)(478600001)(52116002)(6486002)(6666004)(2616005)(6512007)(6506007)(1076003)(26005)(107886003)(186003)(2906002)(36756003)(4326008)(38350700002)(38100700002)(66476007)(66556008)(66946007)(6916009)(41300700001)(5660300002)(8676002)(8936002)(316002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gcSBxOHdx34Jmmlv3BUxkVk/vuSUkv/gwLwvxKlYRmr7+RvjQ+TUqMj3eE6O?=
 =?us-ascii?Q?5+bPFyCuB62yIyKMCOP/edHDBeotNa6pW9R0AgRaA2V81KLENvrjFiioQzMs?=
 =?us-ascii?Q?oVJKQk69wCv002v9w1s2bYqgdwPshrWsKCFGmiT6wvgBY4lVdiXBrK7dh0fJ?=
 =?us-ascii?Q?0QPxbhVbelw2+Yob9z7W2fjyPTuuB/STBdBRB7Nryzo7hIs3bV+cU+2HmfXK?=
 =?us-ascii?Q?O0pjq/79aVyrnyVylj9af0uxwMmYTUBVkhqHODzHdU0fxgVFn/FRS8mHFUvR?=
 =?us-ascii?Q?Rss3nPyL6nbszReBvXm0SaZAGtL7im3t2y1k2LWcKpm7sTi6j6Q80OMNRPdK?=
 =?us-ascii?Q?Tg0BWK2lKBW+7eofM0B6Rz7uW3k/31MxXORxjdex+J4jTF9Q6vOqMBKoFI7M?=
 =?us-ascii?Q?kiaMmSeePTE6xr2MHvbZOZJCaH12JP2FMb48K2qTgK3N7o7aw80nkXJ+rhYM?=
 =?us-ascii?Q?Vvbd3g1EtVjzUkyXHk2eHi5zawvF80xf9Yl0WEwLsHZlWnzxzAhCyvb/EXyH?=
 =?us-ascii?Q?4HwUeXBJx05UMkydKjgFvqJd3MMpKR5vrfP4R96zzdt3nSTr3TWbKJzXBW9U?=
 =?us-ascii?Q?+oJ+oulanDbE0H0hDk7wQvuJixnLC6hktvBcWSpGAjvRVEWv4jU8s7Aa5MV2?=
 =?us-ascii?Q?Addd9M7AkxeKaT2m5cmL0gEnm6CBGz1V3OP56mLlHXyud2z0uFw1qFdBdq5m?=
 =?us-ascii?Q?79Enlh9k8txD0ZmjIQjaIAUaNfTBPs63YH6q1/uc238jTVbwzdzN+YXP/wEQ?=
 =?us-ascii?Q?02sYQ/obXxmhyT508U6/TU1dKHQGQaJ1L51nde5aJlJYepD0FHXXLIZFEkRi?=
 =?us-ascii?Q?kOTN3Lr8DetDwMnkQUlw9LlPzWA34KMS2TceVS8a9K5xRwuCASTR4SkmhDn9?=
 =?us-ascii?Q?Pq12O4Se+1bYFxFSqB390g04CgTMg0zsTwok2t6cjJokTmMeTjjf29fQKWTz?=
 =?us-ascii?Q?UYnRBuMKdTowxI1W54VPm0IPTlW3WyxCX/c/GhN3TdG7y/f1HVhHZcsuuWDD?=
 =?us-ascii?Q?L47QUHwbQeeoJYF9NO3TH9/oyPOerKemjgFpmSMmrmuHmQQgwOhPkMaE5Ttk?=
 =?us-ascii?Q?alpf4qABwDGhel2kxEyV9pngm/UpOiL4cvxyiGBUJFqsduJ9kBOIayzbZBdD?=
 =?us-ascii?Q?aqcnEJ6IpXkd4bBg4ocoF4A3cmUsEps4G/m705KJQXZw6PrbgSIziH4e3cAO?=
 =?us-ascii?Q?p0kGMdaPbXPciqbHIQpy2xXrZpkJ1PBCDRj5gN6O9EJU7VWz0Rd9ARjjIDLp?=
 =?us-ascii?Q?qiGbHGSxYuz8PLNrEboQrH8y00tTxF4TWd6u/fdvFnjKcXFObC9Ut07q7pUp?=
 =?us-ascii?Q?i07DqWPSFlXi3RaIgt2e6v43zIBwUarL7QawwlARMo2RH3+mYRba2xTXWSHA?=
 =?us-ascii?Q?mM1vcl47OWsJQRlKZQJ1B9jw5IytasmDlmDSt/Be2vG96dLOb71dXO9AkPh6?=
 =?us-ascii?Q?DJzxb+ee3kSQV+8xNXRvOBkGg8ACDeJ8iz3dQi0jhpmcIAcoyeTshDUj4p1w?=
 =?us-ascii?Q?/5slSJIOov19RCbHk1NUsWq1UFZQZNMIIu+ul3PRgxSQS5c+rYqbfhJhZcDN?=
 =?us-ascii?Q?qT+AM9X3WvC10VVJJZ4oYqsrO0344ErZG2VrMPtN?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbed9f04-d386-4d9c-2f0d-08db5619af85
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3342.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 May 2023 14:27:32.4887 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vMVjUhreJx24AeVGo623tGewSSj94+DS/EmpCy7ALXSRV/jGEDMrESIfXbin35Cnnb2v5i1WCzxEldhMsOzMQQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6569
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
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.128 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.128 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pyveZ-0004AG-4N
Subject: [f2fs-dev] [PATCH v2] fsck.f2fs: Detect and fix looped node chain
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
 fsck/mount.c | 122 +++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 104 insertions(+), 18 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index df0314d57caf..478043035c95 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -3394,22 +3394,89 @@ static void destroy_fsync_dnodes(struct list_head *head)
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
+	err = dev_write_block(node_blk, blkaddr_tmp);
+	if (!err)
+		FIX_MSG("Fix looped node chain on blkaddr %u\n",
+				blkaddr_tmp);
+
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
@@ -3440,19 +3507,38 @@ static int find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
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
+			err = find_node_blk_fast(sbi, &blkaddr_fast, node_blk_fast,
+					&is_detecting);
+			if (err)
+				break;
+
+			if (blkaddr_fast == blkaddr) {
+				MSG(0, "\tdetect looped node chain, blkaddr:%u\n",
+						blkaddr);
+
+				err = loop_node_chain_fix(sbi,
+						NEXT_FREE_BLKADDR(sbi, curseg),
+						node_blk_fast, blkaddr, node_blk);
+				if (!err) {
+					/* after fixing the looped node chain,
+					 * retry agian.
+					 */
+					is_detecting = false;
+					destroy_fsync_dnodes(head);
+					goto retry;
+				} else
+					break;
+			}
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
