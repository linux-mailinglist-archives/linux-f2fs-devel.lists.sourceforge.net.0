Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 693B43E518F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Aug 2021 05:40:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mDIcM-0000XR-8x; Tue, 10 Aug 2021 03:39:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <changfengnan@vivo.com>) id 1mDIcL-0000XD-0a
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Aug 2021 03:39:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vs66zIX2NEGJUFZfdxqtw8Q2lnuIh1g16dRyXRF9Res=; b=gQiZ1NhsODqNcMAWd6dki0pbq4
 nH33Fqz2/cDbxCwRKVhSXj1qwJslKs1xXY/pZUNUWJVjEJenzHfTC92JIBl+OXqyzGLlemMUyTfJU
 oAmYiGadFNtCKiYjJo46iOwPiWLOl55AigwwQESPgUrnG2Ju5bIxMmR9wqRsL48f19NM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Vs66zIX2NEGJUFZfdxqtw8Q2lnuIh1g16dRyXRF9Res=; b=G
 ho9sgnj1uU55j1UFQnQvWWLeC4RFZ53sevkDhJAto2TNwgiqE76EX6iXculFtYdY5gRgiCFKDax0H
 HE0rpR9LzED5m2nzh0mfa+4xan+tIFaCrx21uMQyhvXQS64HLEKLgqXAwLAGo73pkVSoTpc8XO7Fg
 JrMHXBI6pXV1C/2I=;
Received: from mail-m17654.qiye.163.com ([59.111.176.54])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mDIcC-0008II-6b
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Aug 2021 03:39:52 +0000
Received: from comdg01144017.vivo.xyz (unknown [218.104.188.164])
 by mail-m17654.qiye.163.com (Hmail) with ESMTPA id 73933201AE;
 Tue, 10 Aug 2021 11:39:36 +0800 (CST)
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 10 Aug 2021 11:39:34 +0800
Message-Id: <20210810033934.123709-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWRkYGE5WGEJLTkgZHhhIGE
 xLVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PFE6Tio4LD9DCy5JHxQZTxoY
 QgkKFAtVSlVKTUlDTk1NTExMS09KVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WUlKQ1VKS09VSkNDVUpNT1lXWQgBWUFISEJONwY+
X-HM-Tid: 0a7b2e24eb22d9fdkuws73933201ae
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.54 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [59.111.176.54 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1mDIcC-0008II-6b
Subject: [f2fs-dev] [PATCH] f2fs: compress: avoid duplicate counting of
 valid blocks when read compressed file
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
Cc: Fengnan Chang <changfengnan@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Since cluster is basic unit of compression, one cluster is compressed or
not, so we can calculate valid blocks only for first page in cluster,
the other pages just skip.

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/compress.c |  1 +
 fs/f2fs/data.c     | 19 ++++++++++++++-----
 fs/f2fs/f2fs.h     |  1 +
 3 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 7dbfd6965b97..71768f15752a 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -152,6 +152,7 @@ void f2fs_destroy_compress_ctx(struct compress_ctx *cc, bool reuse)
 	cc->rpages = NULL;
 	cc->nr_rpages = 0;
 	cc->nr_cpages = 0;
+	cc->nc_cluster_idx = NULL_CLUSTER;
 	if (!reuse)
 		cc->cluster_idx = NULL_CLUSTER;
 }
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index df5e8d8c654e..bc5c0d94a6fa 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2294,6 +2294,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
 		.log_cluster_size = F2FS_I(inode)->i_log_cluster_size,
 		.cluster_size = F2FS_I(inode)->i_cluster_size,
 		.cluster_idx = NULL_CLUSTER,
+		.nc_cluster_idx = NULL_CLUSTER,
 		.rpages = NULL,
 		.cpages = NULL,
 		.nr_rpages = 0,
@@ -2331,12 +2332,20 @@ static int f2fs_mpage_readpages(struct inode *inode,
 				if (ret)
 					goto set_error_page;
 			}
-			ret = f2fs_is_compressed_cluster(inode, page->index);
-			if (ret < 0)
-				goto set_error_page;
-			else if (!ret)
-				goto read_single_page;
+			if (cc.cluster_idx == NULL_CLUSTER) {
+				if (cc.nc_cluster_idx != NULL_CLUSTER)
+					goto read_single_page;
 
+				ret = f2fs_is_compressed_cluster(inode, page->index);
+				if (ret < 0)
+					goto set_error_page;
+				else if (!ret) {
+					cc.nc_cluster_idx = page->index >> cc.log_cluster_size;
+					goto read_single_page;
+				}
+
+				cc.nc_cluster_idx = NULL_CLUSTER;
+			}
 			ret = f2fs_init_compress_ctx(&cc);
 			if (ret)
 				goto set_error_page;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e97b4d8c5efc..e9b6890a3f19 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1471,6 +1471,7 @@ struct compress_data {
 struct compress_ctx {
 	struct inode *inode;		/* inode the context belong to */
 	pgoff_t cluster_idx;		/* cluster index number */
+	pgoff_t nc_cluster_idx;		/* cluster index number for non-compressed cluster use*/
 	unsigned int cluster_size;	/* page count in cluster */
 	unsigned int log_cluster_size;	/* log of cluster size */
 	struct page **rpages;		/* pages store raw data in cluster */
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
