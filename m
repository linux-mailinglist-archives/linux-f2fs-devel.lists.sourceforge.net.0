Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BDFE3E9CC3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Aug 2021 05:06:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mE12d-0007ls-DU; Thu, 12 Aug 2021 03:05:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <changfengnan@vivo.com>) id 1mE12b-0007ll-US
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Aug 2021 03:05:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IeCBU2LLvsoCSlSf7dWXxyfWQgHrx9z2ev0Wz8IdYZc=; b=h+9VXVLu2T3Yxgngo0tqHBGKZM
 R/JWgWiYgte+yPNRTIQS78ICFPwWwptH2nKzjNSBoSeaQj3ES7oYoUXRwNYhDaUqY4ABUPFPsedBK
 altUzIHHAtiBf6jUAMgGxQIFhImW1/YKpjIe/Vqbwr3pxL2dOv7Uj+zSIClg1hES+/zQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IeCBU2LLvsoCSlSf7dWXxyfWQgHrx9z2ev0Wz8IdYZc=; b=b
 3lrc55xEgYJhzSfP+VgBw089AoAviKifl1HGLEZV3CcMUwYFDmCXfue85R69+fPHGFYQ4GqVcAXG8
 hpwgOGfTNhiAR3pvB/EXjZMPkFrHKQ56Ds/jA+NuqFaOpufQyvnHh/EVzTlJ+JPkIvTBXKgr1gQ5Q
 tk3d8CSXJZbF+NE0=;
Received: from mail-m17654.qiye.163.com ([59.111.176.54])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mE12Y-003gh8-F4
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Aug 2021 03:05:57 +0000
Received: from comdg01144017.vivo.xyz (unknown [218.104.188.164])
 by mail-m17654.qiye.163.com (Hmail) with ESMTPA id CC44C20144;
 Thu, 12 Aug 2021 11:05:46 +0800 (CST)
From: Fengnan Chang <changfengnan@vivo.com>
To: jaegeuk@kernel.org, chao@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 12 Aug 2021 11:05:40 +0800
Message-Id: <20210812030540.259344-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWUNCQ0NWTR8ZSktLGhoeQx
 lJVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MRA6Mio4Ez9ITCEyUQtRPiwB
 GhwaCwFVSlVKTUlDTEhMTk9MT0tCVTMWGhIXVRgTGhUcHR4VHBUaFTsNEg0UVRgUFkVZV1kSC1lB
 WUlKQ1VKS09VSkNDVUpNT1lXWQgBWUFJTE1PNwY+
X-HM-Tid: 0a7b3852aadbd9fdkuwscc44c20144
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [59.111.176.54 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.54 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1mE12Y-003gh8-F4
Subject: [f2fs-dev] [PATCH v3] f2fs: compress: avoid duplicate counting of
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
 fs/f2fs/data.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index df5e8d8c654e..b06a0e5de1f1 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2299,6 +2299,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
 		.nr_rpages = 0,
 		.nr_cpages = 0,
 	};
+	pgoff_t nc_cluster_idx = NULL_CLUSTER;
 #endif
 	unsigned nr_pages = rac ? readahead_count(rac) : 1;
 	unsigned max_nr_pages = nr_pages;
@@ -2328,15 +2329,26 @@ static int f2fs_mpage_readpages(struct inode *inode,
 							&last_block_in_bio,
 							rac != NULL, false);
 				f2fs_destroy_compress_ctx(&cc, false);
+				nc_cluster_idx = NULL_CLUSTER;
 				if (ret)
 					goto set_error_page;
 			}
-			ret = f2fs_is_compressed_cluster(inode, page->index);
-			if (ret < 0)
-				goto set_error_page;
-			else if (!ret)
-				goto read_single_page;
+			if (cc.cluster_idx == NULL_CLUSTER) {
+				if (nc_cluster_idx != NULL_CLUSTER &&
+					nc_cluster_idx == page->index >> cc.log_cluster_size) {
+					goto read_single_page;
+				}
+
+				ret = f2fs_is_compressed_cluster(inode, page->index);
+				if (ret < 0)
+					goto set_error_page;
+				else if (!ret) {
+					nc_cluster_idx = page->index >> cc.log_cluster_size;
+					goto read_single_page;
+				}
 
+				nc_cluster_idx = NULL_CLUSTER;
+			}
 			ret = f2fs_init_compress_ctx(&cc);
 			if (ret)
 				goto set_error_page;
@@ -2373,6 +2385,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
 							&last_block_in_bio,
 							rac != NULL, false);
 				f2fs_destroy_compress_ctx(&cc, false);
+				nc_cluster_idx = NULL_CLUSTER;
 			}
 		}
 #endif
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
