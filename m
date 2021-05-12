Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E544237B9B4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 May 2021 11:53:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lglYd-0001I0-Qs; Wed, 12 May 2021 09:53:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lglYR-0001H2-84
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 09:53:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dT2ZQpr2FHjUigwTfeHNC8s/oba2NdnTx2Za7u+bFUw=; b=etLYVeuwIPOxNZEE0G7+/QmQR5
 PHLK6kbNFeqqCYfM3Z/B/clnQY/Evpzb+za/Yob3o8mFXfwN5uIKGa1d5QFKJ3Z4hrf9CATQ78el/
 kifc9PUoi8vVVTjokzfbDOHa6rlhVrGwZ1Df1HK+ywX83pec2pgD9OI6+DI+Pi8lZzRM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dT2ZQpr2FHjUigwTfeHNC8s/oba2NdnTx2Za7u+bFUw=; b=Z5b9CHgHlcV/0xqnkePjeOZxTu
 ALEHlvG9hRlz4b+QPl9Reu7RrMvxqAsf+JQ9SgGVIyGt/wWIksKlq6ByiDSBGsQ9SZ74nL0iM2azQ
 x/tiGt6zexVsjxO2EEWNriGUv1OS3cwGOPSo353oStHU5UZWcwireskknUjqO3bj8d3g=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lglYM-0006bl-Vg
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 09:53:24 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fg94X6dhbzqTTw;
 Wed, 12 May 2021 17:49:48 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Wed, 12 May 2021 17:53:04 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 12 May 2021 17:52:58 +0800
Message-ID: <20210512095258.96918-3-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210512095258.96918-1-yuchao0@huawei.com>
References: <20210512095258.96918-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lglYM-0006bl-Vg
Subject: [f2fs-dev] [PATCH 3/3] f2fs: compress: remove unneeded preallocation
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We will reserve iblocks for compression saved, so during compressed
cluster overwrite, we don't need to preallocate blocks for later
write.

In addition, it adds a bug_on to detect wrong reserved iblock number
in __f2fs_cluster_blocks().

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c | 26 ++------------------------
 fs/f2fs/file.c     |  4 ----
 2 files changed, 2 insertions(+), 28 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index b6bd6862eef2..25e785e0d9fc 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -932,6 +932,8 @@ static int __f2fs_cluster_blocks(struct inode *inode,
 					ret++;
 			}
 		}
+
+		f2fs_bug_on(F2FS_I_SB(inode), !compr && ret != cluster_size);
 	}
 fail:
 	f2fs_put_dnode(&dn);
@@ -992,21 +994,16 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 	struct f2fs_sb_info *sbi = F2FS_I_SB(cc->inode);
 	struct address_space *mapping = cc->inode->i_mapping;
 	struct page *page;
-	struct dnode_of_data dn;
 	sector_t last_block_in_bio;
 	unsigned fgp_flag = FGP_LOCK | FGP_WRITE | FGP_CREAT;
 	pgoff_t start_idx = start_idx_of_cluster(cc);
 	int i, ret;
-	bool prealloc;
 
 retry:
 	ret = f2fs_is_compressed_cluster(cc->inode, start_idx);
 	if (ret <= 0)
 		return ret;
 
-	/* compressed case */
-	prealloc = (ret < cc->cluster_size);
-
 	ret = f2fs_init_compress_ctx(cc);
 	if (ret)
 		return ret;
@@ -1064,25 +1061,6 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 		}
 	}
 
-	if (prealloc) {
-		f2fs_do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, true);
-
-		set_new_dnode(&dn, cc->inode, NULL, NULL, 0);
-
-		for (i = cc->cluster_size - 1; i > 0; i--) {
-			ret = f2fs_get_block(&dn, start_idx + i);
-			if (ret) {
-				i = cc->cluster_size;
-				break;
-			}
-
-			if (dn.data_blkaddr != NEW_ADDR)
-				break;
-		}
-
-		f2fs_do_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO, false);
-	}
-
 	if (likely(!ret)) {
 		*fsdata = cc->rpages;
 		*pagep = cc->rpages[offset_in_cluster(cc, index)];
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 9241e8e3ffff..1dd69c88be36 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -85,10 +85,6 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 			err = ret;
 			goto err;
 		} else if (ret) {
-			if (ret < F2FS_I(inode)->i_cluster_size) {
-				err = -EAGAIN;
-				goto err;
-			}
 			need_alloc = false;
 		}
 	}
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
