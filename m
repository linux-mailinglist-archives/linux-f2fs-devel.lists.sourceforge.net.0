Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE7A18D000
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 20 Mar 2020 15:22:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jFIXy-0003ZU-RS; Fri, 20 Mar 2020 14:22:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1jFIXt-0003Y1-Qv
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 14:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/SQrh0NC9B/4IIKX+SOFUuY0GCDKmd4E0NcfkuJjHos=; b=CL4c7NdPEz37JB82krDYLQE0eA
 htofA7h8ootbt4M5j3/gUsNG7fY2woOOweq6b/yIXiolBCG7L+Q641FK4LE6NAT/lDMdXI/kaG8/z
 mbyxzMHdQsnL45slMzPBInvulIfQtcmeFhfbyBTWMkMCXeA2KgK3UP50DNoXBbC/VUgw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=/SQrh0NC9B/4IIKX+SOFUuY0GCDKmd4E0NcfkuJjHos=; b=CXNrxiMxn7UjAgBgkOB7FfWMRE
 7pa3uP6/9Hjm23q7dhZPOYp7mfQzq9k2cuBtjF+mmQNCoJPyErd1qj3T4cLpOTPaOQCDS2s/q6QLi
 TGoVfDtH1iZcGJf0AmBo1HcD+4tlnOVBVlUbV6WIeB5F4UrscSGJM7zC6Bp/EyNKDdBk=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jFIXq-00A8CZ-NG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 20 Mar 2020 14:22:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=/SQrh0NC9B/4IIKX+SOFUuY0GCDKmd4E0NcfkuJjHos=; b=pcB/9QPTh7YnWOIm2ghnxPADsV
 jUNiKAT2ROOLf8Z0Kjh4GVizaWHd4Jl/BSMdUeOliFlhPlmDsQsZly7IDmulQdWX1MQQtfwueam0h
 bbx25ng2ceWN+WX7wV06ox7qBfFWp0bP1hmNYXbotqiG9wCLlYnHcrJw1Seky/BAuB8S7xlgRbeAq
 6r9g2t/3XGz15oLBcpXU7U60KXdkUN6ipfcM1atlL4fkiEeO0tIkUyBONGyp2ZNjWPrh/V5d1l7/b
 DQaZKaioxJR02IiMDVquobwUYu9B7lnym1K/M5ttAYCmn+ib8iUrBtRLofKBP2wvE9fD0COZvWqas
 qxL+ahjg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jFIXi-0000jv-8O; Fri, 20 Mar 2020 14:22:34 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 20 Mar 2020 07:22:29 -0700
Message-Id: <20200320142231.2402-24-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200320142231.2402-1-willy@infradead.org>
References: <20200320142231.2402-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jFIXq-00A8CZ-NG
Subject: [f2fs-dev] [PATCH v9 23/25] f2fs: Pass the inode to
 f2fs_mpage_readpages
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
Cc: linux-xfs@vger.kernel.org, William Kucharski <william.kucharski@oracle.com>,
 linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

This function now only uses the mapping argument to look up the inode,
and both callers already have the inode, so just pass the inode instead
of the mapping.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: William Kucharski <william.kucharski@oracle.com>
---
 fs/f2fs/data.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 237dff36fe73..c8b042979fc4 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2159,12 +2159,11 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
  * use ->readpage() or do the necessary surgery to decouple ->readpages()
  * from read-ahead.
  */
-static int f2fs_mpage_readpages(struct address_space *mapping,
+static int f2fs_mpage_readpages(struct inode *inode,
 		struct readahead_control *rac, struct page *page)
 {
 	struct bio *bio = NULL;
 	sector_t last_block_in_bio = 0;
-	struct inode *inode = mapping->host;
 	struct f2fs_map_blocks map;
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	struct compress_ctx cc = {
@@ -2276,7 +2275,7 @@ static int f2fs_read_data_page(struct file *file, struct page *page)
 	if (f2fs_has_inline_data(inode))
 		ret = f2fs_read_inline_data(inode, page);
 	if (ret == -EAGAIN)
-		ret = f2fs_mpage_readpages(page_file_mapping(page), NULL, page);
+		ret = f2fs_mpage_readpages(inode, NULL, page);
 	return ret;
 }
 
@@ -2293,7 +2292,7 @@ static void f2fs_readahead(struct readahead_control *rac)
 	if (f2fs_has_inline_data(inode))
 		return;
 
-	f2fs_mpage_readpages(rac->mapping, rac, NULL);
+	f2fs_mpage_readpages(inode, rac, NULL);
 }
 
 int f2fs_encrypt_one_page(struct f2fs_io_info *fio)
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
