Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DA4A39312
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2025 06:52:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tkGWr-00024k-4s;
	Tue, 18 Feb 2025 05:52:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tkGWn-00023y-QH
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QSBcAaMb/qljfoVgIF4wX+lU6va9sOZY2zsNylGwXQg=; b=ZpfDkFyJWZrE1Q0iTmFSgM7JnZ
 i4mEtEOrTkJ7DY/xuUcIeR1RTqrAsou2W3eQ7VPxzl8s2FmjJAFEDedOG76iUdF/4JMw8xRxPfC0n
 nfnUsGKvpvKNRJr7nHpKzo6SD/1NVYYSc0qw4LfRMHNkHAULsHNoi+44IX6MmV5VVI1A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QSBcAaMb/qljfoVgIF4wX+lU6va9sOZY2zsNylGwXQg=; b=V
 00u1Wi59KMEsTqu0/L/fOzcbrB6ttRvUzGTsR+rjI7HBg5d/tb1138QfyxmEKtuAIjlKMem6QH/fG
 F4UJ5GPGysh3nXhEfDfNNNmYFNOI8pbigiT+H89jLp0YZAfD9sGgMLEi8zhki2tVn9u5//YIhQkCp
 bBd/JYWp7fp34fSU=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tkGWm-0007c0-JN for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=QSBcAaMb/qljfoVgIF4wX+lU6va9sOZY2zsNylGwXQg=; b=e2dzg8tqt/QSPBSeNAzY1ONhod
 Hoa0X16axLyTsvZu924I+7nVrEryNCvx6c53V0dgzZqX8cm6JvIX/iDZLc5cKG4UY/iRwyNEpbG9Y
 2V+g0P8n25gLwGorLdGC1Cbi+svqLcnU3DsfxEUstid1GGNsgPijjoGZu/c4yVzx45mx0q7Kf3qkQ
 pphGccOQUVme3Wg2vE1GbjwUAJGih2YjhWg0qhLFVnPWxep2NA3QoyU2UkLE3ZldrhiMRIcUmJW+O
 69YuOJvjdL/Iei1Bza4B9WjRHoIHxE7OaiMJajPKUYLeDY1N2bojYy6mzv1X+Tr9R6LGDa5Gvv33F
 j4+gikfQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tkGWb-00000002Tqv-1Abt; Tue, 18 Feb 2025 05:52:05 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 18 Feb 2025 05:51:34 +0000
Message-ID: <20250218055203.591403-1-willy@infradead.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: More f2fs folio conversions. This time I'm focusing on
 removing
 accesses to page->mapping as well as getting rid of accesses to old APIs.
 f2fs was the last user of wait_for_stable_page(), grab_cache_p [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tkGWm-0007c0-JN
Subject: [f2fs-dev] [PATCH 00/27] f2fs folio conversions for v6.15
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
Cc: linux-fsdevel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

More f2fs folio conversions.  This time I'm focusing on removing
accesses to page->mapping as well as getting rid of accesses to
old APIs.  f2fs was the last user of wait_for_stable_page(),
grab_cache_page_write_begin() and wait_on_page_locked(), so
I've included those removals in this series too.

Matthew Wilcox (Oracle) (27):
  f2fs: Add f2fs_folio_wait_writeback()
  mm: Remove wait_for_stable_page()
  f2fs: Add f2fs_folio_put()
  f2fs: Convert f2fs_flush_inline_data() to use a folio
  f2fs: Convert f2fs_sync_node_pages() to use a folio
  f2fs: Pass a folio to flush_dirty_inode()
  f2fs: Convert f2fs_fsync_node_pages() to use a folio
  f2fs: Convert last_fsync_dnode() to use a folio
  f2fs: Return a folio from last_fsync_dnode()
  f2fs: Add f2fs_grab_cache_folio()
  mm: Remove grab_cache_page_write_begin()
  f2fs: Use a folio in __get_node_page()
  f2fs: Use a folio in do_write_page()
  f2fs: Convert f2fs_write_end_io() to use a folio_iter
  f2fs: Mark some functions as taking a const page pointer
  f2fs: Convert f2fs_in_warm_node_list() to take a folio
  f2fs: Add f2fs_get_node_folio()
  f2fs: Use a folio throughout f2fs_truncate_inode_blocks()
  f2fs: Use a folio throughout __get_meta_page()
  f2fs: Hoist the page_folio() call to the start of
    f2fs_merge_page_bio()
  f2fs: Add f2fs_get_read_data_folio()
  f2fs: Add f2fs_get_lock_data_folio()
  f2fs: Convert move_data_page() to use a folio
  f2fs: Convert truncate_partial_data_page() to use a folio
  f2fs: Convert gc_data_segment() to use a folio
  f2fs: Add f2fs_find_data_folio()
  mm: Remove wait_on_page_locked()

 fs/f2fs/checkpoint.c    |  26 ++--
 fs/f2fs/data.c          | 130 ++++++++++---------
 fs/f2fs/f2fs.h          |  90 +++++++++----
 fs/f2fs/file.c          |  24 ++--
 fs/f2fs/gc.c            |  42 +++---
 fs/f2fs/node.c          | 279 ++++++++++++++++++++--------------------
 fs/f2fs/node.h          |   6 +-
 fs/f2fs/segment.c       |  26 ++--
 include/linux/pagemap.h |   9 --
 mm/filemap.c            |   2 +-
 mm/folio-compat.c       |  14 --
 11 files changed, 338 insertions(+), 310 deletions(-)

-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
