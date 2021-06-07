Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 071FE39DF69
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Jun 2021 16:53:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lqGcb-00085W-Mb; Mon, 07 Jun 2021 14:52:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack@suse.cz>) id 1lqGca-00084w-DA
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 14:52:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vhH8fZvd6Tom4nBiYNHBFCVmcJF6aY93XCBQD2IK7mE=; b=LUv6UMZgHMhiJxbb/GUZrj4djJ
 Y1M5lZiYN+zo+eNrHw1V/RnbsKg+3i5jEjkMtLZkMxwNaJ9WqR2FgEufXVEG3GJYED6weOkbT5vPy
 /fZAnC1RRmN8sSvvQiBY48T49ZoGpvmySwo1UqUZOKqwZ6fZD9iJBuASSMZ7NwIpw8Xc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vhH8fZvd6Tom4nBiYNHBFCVmcJF6aY93XCBQD2IK7mE=; b=coahACi3OqqY5E+C9zjKy+xWRC
 U0CjVX98qn7odG40KRE7Lpp+SZOclpg3w7K2wEYD/gAuese6XdY8mggcwqZ5Fn3OfXvTHQA397Vdg
 h43TCtlBCGCejrNF4pIs0pxAJ0keXdVDnXCkjJOjDBKJ7ValHl69IF4Xd56J+9D4SG40=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lqGcS-00065H-Tu
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Jun 2021 14:52:56 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 819DE21A68;
 Mon,  7 Jun 2021 14:52:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1623077557; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vhH8fZvd6Tom4nBiYNHBFCVmcJF6aY93XCBQD2IK7mE=;
 b=sTYyrBrhmcoYH4Pc6qGpefCJy5Sux5PJVReKTeUz6gUVd74lV8PShJvlmgXRUYi7K78zGY
 d4J3ry2lEKY4SEj8ooKRSfsxNwMcXt1Hj4nLWK6IcMLWMM+R6InO8T8IFySZfCpG7xy0Kk
 TEFjqGOekbxuEn9tycM3YhzJbNJncoU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1623077557;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vhH8fZvd6Tom4nBiYNHBFCVmcJF6aY93XCBQD2IK7mE=;
 b=DwFAqfCR7Wr+2ACyXhre2GSoLv5DOgFn+ENsakIV7+3dRNt9fpuZ6AfKNeT4x7NlOGqZpl
 fOCS0M97+XnF36Bg==
Received: from quack2.suse.cz (unknown [10.100.200.198])
 by relay2.suse.de (Postfix) with ESMTP id B8DC1A3B98;
 Mon,  7 Jun 2021 14:52:36 +0000 (UTC)
Received: by quack2.suse.cz (Postfix, from userid 1000)
 id 91DF31F2CB3; Mon,  7 Jun 2021 16:52:36 +0200 (CEST)
From: Jan Kara <jack@suse.cz>
To: <linux-fsdevel@vger.kernel.org>
Date: Mon,  7 Jun 2021 16:52:14 +0200
Message-Id: <20210607145236.31852-4-jack@suse.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210607144631.8717-1-jack@suse.cz>
References: <20210607144631.8717-1-jack@suse.cz>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2616; h=from:subject;
 bh=feuIxLKoHMpqfTsHSNzx+Llrxfh/M4pQHEj3mln4fkU=;
 b=owEBbQGS/pANAwAIAZydqgc/ZEDZAcsmYgBgvjKf4qNEt/Jyz8s3OnJ3hXcO5MHT6Xe5BiU0vi7v
 Yg+bSvWJATMEAAEIAB0WIQSrWdEr1p4yirVVKBycnaoHP2RA2QUCYL4ynwAKCRCcnaoHP2RA2chHB/
 wKYys4WnIBaTn+iTmcDwD76cwJNj9fNUmSIB5g6n0gtAP4/BnjWvcBbmQla0RGUYJvtO/9VQX1/DPE
 RdysgXZVUQqMFjHYjWjBwkkpPWcvdHvIW+9KXp0iJzLJkqUV8p8ZfByoP2JTRzDN82Rte87GtnN2Sp
 L0xIljcsn5jrH8Ww2o3Twm5GXBaCRdS8AVgRk1xEBgsw9Tm6VEqipm87uxNWlHgaU4THjuXQviA32K
 qTmxhDoIUFvd+7DyJIQyVFx8U2bwkAdQVm20zTZnZAZepHKSgapRODGbx6Yqk1g6ob+l9hmvzMz/zA
 Y3rmXXMf7ydvJe7qAvc8CkddqajivD
X-Developer-Key: i=jack@suse.cz; a=openpgp;
 fpr=93C6099A142276A28BBE35D815BC833443038D8C
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1lqGcS-00065H-Tu
Subject: [f2fs-dev] [PATCH 04/14] mm: Add functions to lock invalidate_lock
 for two mappings
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
Cc: linux-cifs@vger.kernel.org, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-ext4@vger.kernel.org, Ted Tso <tytso@mit.edu>,
 "Darrick J. Wong" <darrick.wong@oracle.com>, Jeff Layton <jlayton@kernel.org>,
 Steve French <sfrench@samba.org>, Dave Chinner <david@fromorbit.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 Christoph Hellwig <hch@infradead.org>, linux-mm@kvack.org,
 Miklos Szeredi <miklos@szeredi.hu>, Jan Kara <jack@suse.cz>,
 Jaegeuk Kim <jaegeuk@kernel.org>, ceph-devel@vger.kernel.org,
 Johannes Thumshirn <jth@kernel.org>, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Some operations such as reflinking blocks among files will need to lock
invalidate_lock for two mappings. Add helper functions to do that.

Signed-off-by: Jan Kara <jack@suse.cz>
---
 include/linux/fs.h |  6 ++++++
 mm/filemap.c       | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index d8afbc9661d7..ddc11bafc183 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -849,6 +849,12 @@ static inline void filemap_invalidate_unlock_shared(
 void lock_two_nondirectories(struct inode *, struct inode*);
 void unlock_two_nondirectories(struct inode *, struct inode*);
 
+void filemap_invalidate_lock_two(struct address_space *mapping1,
+				 struct address_space *mapping2);
+void filemap_invalidate_unlock_two(struct address_space *mapping1,
+				   struct address_space *mapping2);
+
+
 /*
  * NOTE: in a 32bit arch with a preemptable kernel and
  * an UP compile the i_size_read/write must be atomic
diff --git a/mm/filemap.c b/mm/filemap.c
index c8e7e451d81e..b8e9bccecd9f 100644
--- a/mm/filemap.c
+++ b/mm/filemap.c
@@ -1009,6 +1009,44 @@ struct page *__page_cache_alloc(gfp_t gfp)
 EXPORT_SYMBOL(__page_cache_alloc);
 #endif
 
+/*
+ * filemap_invalidate_lock_two - lock invalidate_lock for two mappings
+ *
+ * Lock exclusively invalidate_lock of any passed mapping that is not NULL.
+ *
+ * @mapping1: the first mapping to lock
+ * @mapping2: the second mapping to lock
+ */
+void filemap_invalidate_lock_two(struct address_space *mapping1,
+				 struct address_space *mapping2)
+{
+	if (mapping1 > mapping2)
+		swap(mapping1, mapping2);
+	if (mapping1)
+		down_write(&mapping1->invalidate_lock);
+	if (mapping2 && mapping1 != mapping2)
+		down_write_nested(&mapping2->invalidate_lock, 1);
+}
+EXPORT_SYMBOL(filemap_invalidate_lock_two);
+
+/*
+ * filemap_invalidate_unlock_two - unlock invalidate_lock for two mappings
+ *
+ * Unlock exclusive invalidate_lock of any passed mapping that is not NULL.
+ *
+ * @mapping1: the first mapping to unlock
+ * @mapping2: the second mapping to unlock
+ */
+void filemap_invalidate_unlock_two(struct address_space *mapping1,
+				   struct address_space *mapping2)
+{
+	if (mapping1)
+		up_write(&mapping1->invalidate_lock);
+	if (mapping2 && mapping1 != mapping2)
+		up_write(&mapping2->invalidate_lock);
+}
+EXPORT_SYMBOL(filemap_invalidate_unlock_two);
+
 /*
  * In order to wait for pages to become available there must be
  * waitqueues associated with pages. By using a hash table of
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
