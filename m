Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C73C950747
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Aug 2024 16:14:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sdsHj-0001KN-5U;
	Tue, 13 Aug 2024 14:14:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sdsHh-0001K7-RT
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Aug 2024 14:14:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/1nmacVmrsXn6q7cUflrbKUeMHuQqfjQNR0KC6cVyz8=; b=NcsTdIlWmR8B3pE2dnf0JlpGwK
 t87SLKRJaW1iqoRqWw4O1SH5xrRO2etzQihbciAguTf/bSMy/+y/3aMfXvWb9acWeaqYFXHQxn+Mu
 DUEnnaC6681ReVtM6ziP3jf29kOCjpskum+jUXNgOg3K23Eu8ri+3ykcRcJ0RdSPrnVE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/1nmacVmrsXn6q7cUflrbKUeMHuQqfjQNR0KC6cVyz8=; b=OEuuLSBOeiSHtvanpNAW2W+qQx
 yxH+k45ZRWA3lvgAloCSgWkLSIMl586Z33kvR+jsSV0VTkxdTOCSC6chSBMM+tTjwtqHJftw31Bx2
 P1k+3Tclv9tVEIIv79oil3H+cZMJy5Pz3MT5L6cxPj7hcGPciQxkHs9eCCddmi0QxO68=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sdsHg-0001Cw-Uf for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Aug 2024 14:14:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 94D6F61727;
 Tue, 13 Aug 2024 14:13:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECC9CC4AF11;
 Tue, 13 Aug 2024 14:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723558430;
 bh=ceJAsQVNvPZUvEVH90Lwtfbz3Ha3JuH6fkV/BpfNMgQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=nJR5h6nfLGvDN1tZY8B6tCGJErI5wYrupexx86bDUR8ZZHF8uZMGcphc6Zx+caNhZ
 DrbS/FicXfh88Q20S4VUlUtCar05NhDlieMIS29787iWRjGwOYby6pamMfP0wkw0HZ
 pQp4ZSo4Fen2MQNQKjKJrr6rDdx4wjoLpCWmsrX9dTV+wQQBOtQ6xLo6FrY2Awb3k4
 hNcABuWiQCJxOO53ORBjVtZ56ffg/X6a2XYmKuOUrpBydDcY9iHgRRVSB257K3gO6f
 R3JV1+fOfwZz9f77Gw9b7J3Y5nIyp9u4cGHMyLobvT9YrItmYnqwz/r4dHHvmyasDO
 piGcoJYEvKSXA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Tue, 13 Aug 2024 22:13:26 +0800
Message-Id: <20240813141331.417067-4-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240813141331.417067-1-chao@kernel.org>
References: <20240813141331.417067-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Convert to use folio, so that we can get rid of 'page->index'
 to prepare for removal of 'index' field in structure page [1]. [1]
 https://lore.kernel.org/all/Zp8fgUSIBGQ1TN0D@casper.infradead.org/
 Cc: Matthew Wilcox <willy@infradead.org> Signed-off-by: Chao Yu
 <chao@kernel.org>
 --- fs/f2fs/data.c | 2 +- fs/f2fs/f2fs.h | 2 +- fs/f2fs/inline.c | 10
 +++++----- fs/f2fs/node.c | 2 +- 4 files changed [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sdsHg-0001Cw-Uf
Subject: [f2fs-dev] [PATCH 4/9] f2fs: convert f2fs_write_inline_data() to
 use folio
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
Cc: linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Convert to use folio, so that we can get rid of 'page->index' to
prepare for removal of 'index' field in structure page [1].

[1] https://lore.kernel.org/all/Zp8fgUSIBGQ1TN0D@casper.infradead.org/

Cc: Matthew Wilcox <willy@infradead.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c   |  2 +-
 fs/f2fs/f2fs.h   |  2 +-
 fs/f2fs/inline.c | 10 +++++-----
 fs/f2fs/node.c   |  2 +-
 4 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 0df5a0c66ede..6d2a37db0c9e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2866,7 +2866,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 
 	err = -EAGAIN;
 	if (f2fs_has_inline_data(inode)) {
-		err = f2fs_write_inline_data(inode, page);
+		err = f2fs_write_inline_data(inode, folio);
 		if (!err)
 			goto out;
 	}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index a4b90215a51f..7c7760aa1a7c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4185,7 +4185,7 @@ int f2fs_read_inline_data(struct inode *inode, struct folio *folio);
 int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page);
 int f2fs_convert_inline_inode(struct inode *inode);
 int f2fs_try_convert_inline_dir(struct inode *dir, struct dentry *dentry);
-int f2fs_write_inline_data(struct inode *inode, struct page *page);
+int f2fs_write_inline_data(struct inode *inode, struct folio *folio);
 int f2fs_recover_inline_data(struct inode *inode, struct page *npage);
 struct f2fs_dir_entry *f2fs_find_in_inline_dir(struct inode *dir,
 					const struct f2fs_filename *fname,
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 98d122164cd1..005babf1bed1 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -260,7 +260,7 @@ int f2fs_convert_inline_inode(struct inode *inode)
 	return err;
 }
 
-int f2fs_write_inline_data(struct inode *inode, struct page *page)
+int f2fs_write_inline_data(struct inode *inode, struct folio *folio)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct page *ipage;
@@ -274,14 +274,14 @@ int f2fs_write_inline_data(struct inode *inode, struct page *page)
 		return -EAGAIN;
 	}
 
-	f2fs_bug_on(F2FS_I_SB(inode), page->index);
+	f2fs_bug_on(F2FS_I_SB(inode), folio->index);
 
 	f2fs_wait_on_page_writeback(ipage, NODE, true, true);
-	memcpy_from_page(inline_data_addr(inode, ipage),
-			 page, 0, MAX_INLINE_DATA(inode));
+	memcpy_from_folio(inline_data_addr(inode, ipage),
+			 folio, 0, MAX_INLINE_DATA(inode));
 	set_page_dirty(ipage);
 
-	f2fs_clear_page_cache_dirty_tag(page_folio(page));
+	f2fs_clear_page_cache_dirty_tag(folio);
 
 	set_inode_flag(inode, FI_APPEND_WRITE);
 	set_inode_flag(inode, FI_DATA_EXIST);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 20518c12f5b7..2b764c86aacc 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1535,7 +1535,7 @@ static void flush_inline_data(struct f2fs_sb_info *sbi, nid_t ino)
 	if (!clear_page_dirty_for_io(page))
 		goto page_out;
 
-	ret = f2fs_write_inline_data(inode, page);
+	ret = f2fs_write_inline_data(inode, page_folio(page));
 	inode_dec_dirty_pages(inode);
 	f2fs_remove_dirty_inode(inode);
 	if (ret)
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
