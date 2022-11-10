Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BCCA6243D5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Nov 2022 15:08:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ot8Ec-0000rS-IZ;
	Thu, 10 Nov 2022 14:08:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1ot8Eb-0000rC-6z
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Nov 2022 14:08:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kmmoJlk+mG5PaobLGsiIW2wpCvqYqxN9bHvwSsvPhVc=; b=OCTSvnDyWIuxRDqxpuNGN2MziY
 OF5qqzMb49ZKZjds+0IohRwRWCfEpJ8ofJMnfTSL0w+1SivQ3cVllyDCVHxm27V5lBP1ktrpkCyF+
 EglXELzc3pFFdHGZMmfQ2sTZWCWo+/fioAurjywHFl+NBF9Bqi2O3/VXBSDM3uOduCxY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kmmoJlk+mG5PaobLGsiIW2wpCvqYqxN9bHvwSsvPhVc=; b=KbzeWQxbfYIktFxvpfYtTidLJn
 xZ9I7yjldj6RHKZ4Vz84+25h631n3t8XCDQAIkRWUdcNLOGXU2A02Y5rR8cKs4GZH5cWP4sKMgibV
 qyKXWSTI2M5eJHRXT6I1B14sXhJ8h444hy6vmYKGcoy4muCYWtX9okQF1EByTfHa2t1M=;
Received: from mail-sgaapc01on2087.outbound.protection.outlook.com
 ([40.107.215.87] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ot8Ea-00067v-Dp for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Nov 2022 14:08:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BHK9QkKHZGDMN4pRbqNrca7fW1PxavkjGbc8dhmAdxnGjLfrrNgaGDspS4e4yiiuGLw0W0cydRhddPghu+OoFsSGIWjVrFOE15XZO1QIUOB78qwTxO0agFIWX6GUcdB5jymbqniZlyY36YLbRbuD5FHaz52H9TesPGa5GMYKKaCPhQDRNlRLi4sijl+1Yn0mFmwm+IGlbDizT9yxLJjlwxwavwEBRWZh4vqfSDTYYnvvUQqFmgOg2f7/LXBwuxlU1NoEkitS5vV19Lplk4dIKumD+ykWJZ9IdCOV9JNDQq/SP6UbXLaICDEy2dTBjR1mO13HaSJALPdEfiy4VPz9qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kmmoJlk+mG5PaobLGsiIW2wpCvqYqxN9bHvwSsvPhVc=;
 b=V1zbmNG/d1nhuxLdwdyrCNWkEzBiGlrgDmDulJJ761GCiMt4ITaIzuccZkRbptZnilkRasBWDDLRNMLOJopABZFaKpA6tlr2DVUIEo4wy/n8fRfIxottFVe/EZWiR3lpTp6wqVebue1AwOsHGQJkOa54uROIUrGX+pKk2G2vbNwZuelmf0lsumjoIixbDSG7kYtAdQdfwnfVPwInXm5TU+X46nRRrCJHFVdqq1URHmbrx2fjDKg5s+Y4rLx1lHG2ReEuCb27eEcUBU4hunX/7Vo5YDD89POVGpAD9+X4NfuctplqSRltmnUvB9SefVVfyhc9sk1A63139xZ8djqD1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kmmoJlk+mG5PaobLGsiIW2wpCvqYqxN9bHvwSsvPhVc=;
 b=YglpbeZGWCUFWtn7ZRLnzgE8YNT4E4Dwu5GpKgYpiuLyNqyghh33XuiZDw1uq/YmlGTZM3zQFvAa7NGs1W4gmMVmBfr+heDV6Peu6fZ6ih3ipRTPegVQdIXFks4OCeyvIvtMfJpbr9dU6Vd3ZUJ6gKyR53xMJv7QzHop9wcp5UA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6) by
 TY0PR02MB5744.apcprd02.prod.outlook.com (2603:1096:400:1b4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Thu, 10 Nov
 2022 14:08:29 +0000
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::31b6:afe9:43b5:aaca]) by SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::31b6:afe9:43b5:aaca%8]) with mapi id 15.20.5791.027; Thu, 10 Nov 2022
 14:08:29 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Thu, 10 Nov 2022 22:07:23 +0800
Message-Id: <20221110140723.92752-4-shengyong@oppo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221110140723.92752-1-shengyong@oppo.com>
References: <20221110140723.92752-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR02CA0103.apcprd02.prod.outlook.com
 (2603:1096:4:92::19) To SI2PR02MB5148.apcprd02.prod.outlook.com
 (2603:1096:4:153::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5148:EE_|TY0PR02MB5744:EE_
X-MS-Office365-Filtering-Correlation-Id: 54dece0c-3889-4413-1673-08dac3250b30
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8MQUNkNQXwU362nOQJ943Dcj55nZeJ0Vt3H4G+rCu5Spl6+xPXoWVBw5+PJT/zzaFYDvBWKX+8SgEt1p/T0RHvE/YN4FRjoHXBH9HjUa1aWcovsDqv4MY1dSnmfY2nFHvfHKFzFqyUJQjQC/zhtPXW4ydRDCVl1rw6DJRjZuRRsywli7rfQPAHmSG/gkTm335XuGPK7rmAEpURNquUpsQorXRoFCI3SIwR3xvjMHfrkG4LJqn/p7UiV7mNCPi9efiwnzxsGHlJ5jPnjqRn3oeq9IY3WOxuMRpKfo1Vc4TJBvjbZ7Sy8JWsEs356twHOL+F5Vdiku5/KN1dmXkTAr9ql2foqihshA0Q8dzmCEbMQLLt3j3Bsd7xNeqm8PNLKRHRyRt1mSGV5COslM6Tb5tx+9s2W2EOsKtuw8E8pBm3etBy+M5KL66WuVe5/TNKnddrsEfI4fgsyKriGyAn9TotzaoCngJIU97vefXUZ5taV7dft4Wh7zREDQw0TfO+E61hzorwUEpJcU+3MtqfaCcWSJ3CdrzyCdM1mwU2Zzq3E5fM8wVYJsAYYQsxpUDHTo4j/fPXfc/8c+fpAaZOhn/myUazJdLBASSQLjzQrQb7CJZS6wKXypgldnEFMQ+LY/iwEKriYH0af8sveFa+W2HWsX5lYcQPUNOpbLYRlguJgfjoNGamjAi2y8zS3iFh5lykIDbz14w0SRvyfkECYLgtcjOZzCgVzxxH352F9a7N935Fk9DUvzR6lw/bqyMsnhStoaVPIIq5vYJbOpbfo4Fg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5148.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(451199015)(52116002)(1076003)(186003)(83380400001)(36756003)(6506007)(6512007)(26005)(2616005)(38350700002)(38100700002)(6486002)(478600001)(86362001)(41300700001)(8936002)(5660300002)(66476007)(66556008)(4326008)(66946007)(8676002)(316002)(107886003)(6666004)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9C5VcyFSZFAxnu7bqOVjyOUOEMhl8iwgzlUzFFBEiYf2hrPz9AlaSD9jW3Cg?=
 =?us-ascii?Q?WqgdBWAPthvyswE55ZhV3Pma5nzTfmF6AML6ZbssXWYGVevaStpABOagWKW/?=
 =?us-ascii?Q?2wAzhd0F+N4YNGcVQBRckjIk6/af6wZMk6RRCZRqMbf+mkqrpi9AQF48URhr?=
 =?us-ascii?Q?StnAZRJZAxivnMdYdDAzCoipC+2a5Zu1IyYk5QEjr0veMNj18X7r5JeEsPa3?=
 =?us-ascii?Q?nTV2CxTRvYj80ktHIcsuCYPNg4L3/taIy6LPp34/ZzIZy4Uvm86EO6j/sMZ2?=
 =?us-ascii?Q?IgQ21A1IFy1gE5LNkc098PRmeRpx0mJkT4Wf3e9novdf0ms/gJaSNh8VTqnc?=
 =?us-ascii?Q?IS9N0D3k+Fa8qBjWwdX0h6qQdkklrXHZDm0QKF78iIEfoj6STwPDvD8Gp7/l?=
 =?us-ascii?Q?c4pznM6rpjbq4N6//nVcuZrBrbwpa1tdwCEP9uAtedzn7fd37LVhCPqxH4ii?=
 =?us-ascii?Q?5jtfv3gOcgRpMVVqERwX+LT5DTzpFtoVkhucJ8yUcfLqhS7MMxCv/kOPrEbo?=
 =?us-ascii?Q?YxsH4ZJylwJAx1epVGh4C3/eFcd0mGdcxhHV3B6UrroOHylVtA/X0kV22uf+?=
 =?us-ascii?Q?YHQub1J0PBqCNF28qPED30DrAdrAG3Q+M6Ubx7iLbHyr8HhgoczCKQcE74Is?=
 =?us-ascii?Q?ZooLEqqT5kQuIB4cMGwvB9HVEUMhUTJ+V15cvHM4llZJuEfny6g2O3XyXi8V?=
 =?us-ascii?Q?wUZbm3PPWgR5md/shZvKQJBL7MJkeZ6aNMEkXw4dVjWckfQXHWYBbDz0G2Fd?=
 =?us-ascii?Q?2jF2TOXUGc+g0Uvb2vA5KjmwpJMHmv6mmaQcLMKwDEYm1YlzjAPMbSqBJ5YG?=
 =?us-ascii?Q?9nHTltXv3iKzXoyOQxlOaikf4X4luWXkfYnM+viYntvNmXQFmY+fhitAAf6U?=
 =?us-ascii?Q?XvBl2sValcRsqXGMv9LoW8mc2kwNP6+NjUuddVzZbtJkTXGnif9C+w0H85wT?=
 =?us-ascii?Q?zJWKVvfTejSY0G7NoQPkLt+XU2vbeI0OoutPBWW/84zXOHoIzmPnYHRZueUB?=
 =?us-ascii?Q?A4WJ1D8uFJP1Eh3WxBv0l8T3Z7gyMd1JJsHpPW43+bTQNc/d4YAKYOE/11hZ?=
 =?us-ascii?Q?0k4bxf8gFZSkn/fxG0h2BcQAToUZ6PWwELG5yLWnkLKAgnVQyHZcyvls05nd?=
 =?us-ascii?Q?5Zy+tw802Vxd4IU+0wWMHHNIQFEqMjEfa8YUzwiCKpCrXadnyeKQ1uThlHdV?=
 =?us-ascii?Q?F1ERDH0JgGVYwmhOyFv0yE1cZJsY7f1fP7CbXBwR5k7CqbSM0i0d41zgaeMJ?=
 =?us-ascii?Q?xA6aT82DIQOy8w+hlvtu761sr5Y5aGjVpojARzm7HTDWInJTkW2zR/mNKc3k?=
 =?us-ascii?Q?4P5Pb/ZBGAeEN0H0itjCmiEPvP98q3Tt/+x5OlOXHszjvvJOA/17UUqf8QWr?=
 =?us-ascii?Q?LM29cHpfpnMLLeUaPWPIXxU8YN8/yLXiBqyASx/KFbm1guuK6N1MHSv1Fg0v?=
 =?us-ascii?Q?+GIbMI/ADsrMAnTacx8CDAulF+HUpj0sZYTUDtuKfqxxGsOcGkTaJXIplVvA?=
 =?us-ascii?Q?jgW25kjKOw5c8bJBl6rB8iiZktnhFEIzRtUXfloAbQhciBBIcHflKO8+wcni?=
 =?us-ascii?Q?gC61Axgi4oGbUXbJU/YSFUrWYbjE5CwzVTUYUCfq?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54dece0c-3889-4413-1673-08dac3250b30
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5148.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 14:08:29.7428 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dMcXQZ0UUSxdEgnuWfsPU+ptpgOV3YMUS+AMEcJfMqLiUn4nsE9KPD+IbmSuGWZN10ZAXLPqRjVkAlsW0qjeUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB5744
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: There is no need to recalculate ADDRS_PER_INODE and
 ADDRS_PER_BLOCK, 
 especially in a for loop. Signed-off-by: Sheng Yong <shengyong@oppo.com>
 --- fsck/fsck.c | 19 +++++++++ 1 file changed, 9 insertions(+), 10 deletions(-)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.87 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.87 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1ot8Ea-00067v-Dp
Subject: [f2fs-dev] [PATCH 4/4] fsck.f2fs: avoid uncessary recalculation
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There is no need to recalculate ADDRS_PER_INODE and ADDRS_PER_BLOCK,
especially in a for loop.

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/fsck.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index ebc60ad..ec096f2 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -706,7 +706,7 @@ void fsck_chk_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 	int ofs;
 	char *en;
 	u32 namelen;
-	unsigned int idx = 0;
+	unsigned int addrs, idx = 0;
 	unsigned short i_gc_failures;
 	int need_fix = 0;
 	int ret;
@@ -932,17 +932,16 @@ check_next:
 	}
 
 	/* check data blocks in inode */
+	addrs = ADDRS_PER_INODE(&node_blk->i);
 	if (cur_qtype != -1) {
+		unsigned int addrs_per_blk = ADDRS_PER_BLOCK(&node_blk->i);
 		qf_szchk_type[cur_qtype] = QF_SZCHK_REGFILE;
-		qf_maxsize[cur_qtype] = (ADDRS_PER_INODE(&node_blk->i) +
-				2 * ADDRS_PER_BLOCK(&node_blk->i) +
-				2 * ADDRS_PER_BLOCK(&node_blk->i) *
-				NIDS_PER_BLOCK +
-				(u64) ADDRS_PER_BLOCK(&node_blk->i) *
-				NIDS_PER_BLOCK * NIDS_PER_BLOCK) * F2FS_BLKSIZE;
-	}
-	for (idx = 0; idx < ADDRS_PER_INODE(&node_blk->i);
-						idx++, child.pgofs++) {
+		qf_maxsize[cur_qtype] = (addrs + 2 * addrs_per_blk +
+				2 * addrs_per_blk * NIDS_PER_BLOCK +
+				(u64) addrs_per_blk * NIDS_PER_BLOCK *
+				NIDS_PER_BLOCK) * F2FS_BLKSIZE;
+	}
+	for (idx = 0; idx < addrs; idx++, child.pgofs++) {
 		block_t blkaddr = le32_to_cpu(node_blk->i.i_addr[ofs + idx]);
 
 		/* check extent info */
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
