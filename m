Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0287CAFD427
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:04:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZDfPt7Ij4a/uUWeTNUxyMBnZXDPzmb1BjfXwmP473rw=; b=UXuStAtLKNTVbhkCIzyDGyKDAW
	95bKf/4PbIHDd5LjJelcM4wiy08DGKEey+ycY0O83m6fjKF1efPjKfxJ/x/qkgkhXNriDPNlOESFx
	jAgDDjwtLYS7OMk2nnnMq4WbjmG8ntktJn4crHb8x5J6LS+uc14fYJXfH9yGiHRpmSWU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBjp-0005D8-QA;
	Tue, 08 Jul 2025 17:04:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjm-0005Cn-Bm
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ttDN4dv5XDqTL4vLkuIdiJ2q47l8sy5Tymga31uKeTU=; b=XNzHx+kAJuYGlCVtge0yBKOpE1
 86OEV/NpNJmKUiT4dckUDOzWZXTNDMu9D33nJ/l631dDrbbjGEYktED7b6ICMfrc5A9new99/tU0v
 AjbQKnVn1SgrBHCLrHoIZZSw7thrcDSy6zBwsyZVE8GobviTLv9zyxVpWZEMVQECT4o8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ttDN4dv5XDqTL4vLkuIdiJ2q47l8sy5Tymga31uKeTU=; b=X
 YZEe/iKWCLutqkRorV2xTp9VUMOLoNJ1gLK6qZs4abkINKJPFKvdgcXpjS9sUxoD/rr3uScgdLnwa
 0eySYIYWJZsceXNmoRmZ7SOJCXhuu+Uuw++J1CysmK0HG/1/jI2RUkbOHOU9XoPbgisNU1gGYE4S2
 W3bB6jI/t0/BqX6I=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBjk-0006Dn-KU for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=ttDN4dv5XDqTL4vLkuIdiJ2q47l8sy5Tymga31uKeTU=; b=ofIg3UiQAoOscWCfqgbfi6Jo3M
 mqwliH2xwGx2TisuVY6sL7YWYW0KU3KoOqUQJm3AxuMZl4mj+t8HsSh2UleGWTG39OJ7v8IrE587d
 S2W6hOUcVcyNDNeBF/1sWD4XxZPa9TauMp9D0cYL4W7CgnDK/hQ1EVJZWuvmBzC/4HpXij+CvYNm5
 GsBS6HhbGNjQ2Hegn7QKBE1q49a2ANrvHd/Y/cVb+K8Xz4+EiuhSKNnnJsQn9algAyrhOE0sNYolv
 Hq6g4ogbEIaE1xrnmA1r2iwuqIF9AYIjVypTm+DXorfb/31k4Mxza4hgeq0exx9jY1W+iMCztduxi
 //sdHFCA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjd-00000000T39-1x1p;
 Tue, 08 Jul 2025 17:04:01 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:02:57 +0100
Message-ID: <20250708170359.111653-1-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Some more folio conversions for f2fs. Again, I have checked
 these patches build, but otherwise they are untested. There are three inline
 functions in fscrypt that I change to take a const struct folio [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uZBjk-0006Dn-KU
Subject: [f2fs-dev] [PATCH 00/60] f2fs folio conversions for 6.17
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
Cc: "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Some more folio conversions for f2fs.  Again, I have checked these patches
build, but otherwise they are untested.  There are three inline functions
in fscrypt that I change to take a const struct folio pointer instead
of a mutable pointer that I don't think should cause any conflicts.

Matthew Wilcox (Oracle) (60):
  f2fs: Pass a folio to recover_dentry()
  f2fs: Pass a folio to recover_inode()
  f2fs: Pass a folio to recover_quota_data()
  f2fs: Pass a folio to f2fs_recover_inode_page()
  f2fs: Pass a folio to sanity_check_extent_cache()
  f2fs: Pass a folio to sanity_check_inode()
  f2fs: Pass a folio to f2fs_sanity_check_inline_data()
  f2fs: Pass a folio to inode_has_blocks()
  f2fs: Pass a folio to F2FS_INODE()
  f2fs: Pass a folio to ino_of_node()
  f2fs: Pass a folio to nid_of_node()
  f2fs: Pass a folio to is_recoverable_dnode()
  f2fs: Pass a folio to set_dentry_mark()
  f2fs: Pass a folio to set_fsync_mark()
  f2fs: Pass a folio to set_mark()
  f2fs: Pass a folio to f2fs_allocate_data_block()
  f2fs: Pass a folio to f2fs_inode_chksum_set()
  f2fs: Pass a folio to f2fs_enable_inode_chksum()
  f2fs: Pass a folio to f2fs_inode_chksum()
  f2fs: Pass a folio to fill_node_footer_blkaddr()
  f2fs: Pass a folio to get_nid()
  f2fs: Pass a folio to set_cold_node()
  f2fs: Pass folios to copy_node_footer()
  f2fs: Pass a folio to fill_node_footer()
  f2fs: Pass a folio to cpver_of_node()
  f2fs: Pass a folio to f2fs_recover_xattr_data()
  f2fs: Pass a folio to is_fsync_dnode()
  f2fs: Pass a folio to is_dent_dnode()
  f2fs: Add fio->folio
  f2fs: Use folio_unlock() in f2fs_write_compressed_pages()
  f2fs: Pass a folio to is_cold_node()
  f2fs: Pass a folio to is_node()
  f2fs: Pass a folio to IS_DNODE()
  f2fs: Pass a folio to ofs_of_node()
  f2fs: Pass a folio to get_dnode_base()
  f2fs: Pass a folio to ADDRS_PER_PAGE()
  f2fs: Pass a folio to IS_INODE()
  f2fs: Add folio counterparts to page_private_flags functions
  f2fs: Use a folio in f2fs_is_cp_guaranteed()
  f2fs: Convert set_page_private_data() to folio_set_f2fs_data()
  f2fs: Convert get_page_private_data() to folio_get_f2fs_data()
  f2fs: Pass a folio to f2fs_compress_write_end_io()
  f2fs: Use a folio in f2fs_merge_page_bio()
  f2fs: Use a bio in f2fs_submit_page_write()
  f2fs: Pass a folio to WB_DATA_TYPE() and f2fs_is_cp_guaranteed()
  f2fs: Use a folio iterator in f2fs_handle_step_decompress()
  f2fs: Pass a folio to f2fs_end_read_compressed_page()
  f2fs: Use a folio iterator in f2fs_verify_bio()
  f2fs: Pass a folio to f2fs_is_compressed_page()
  f2fs: Convert get_next_nat_page() to get_next_nat_folio()
  f2fs: Pass the nat_blk to __update_nat_bits()
  f2fs: Pass a folio to F2FS_NODE()
  f2fs: Pass a folio to f2fs_cache_compressed_page()
  f2fs: Use a folio in f2fs_encrypted_get_link()
  f2fs: Use F2FS_F_SB() in f2fs_read_end_io()
  f2fs: Remove clear_page_private_all()
  f2fs: Remove use of page from f2fs_write_single_data_page()
  f2fs: Pass a folio to f2fs_submit_merged_write_cond()
  f2fs: Pass a folio to __has_merged_page()
  f2fs: Remove F2FS_P_SB()

 fs/f2fs/checkpoint.c    |   8 +-
 fs/f2fs/compress.c      |  44 +++++------
 fs/f2fs/data.c          | 138 +++++++++++++++++-----------------
 fs/f2fs/dir.c           |   4 +-
 fs/f2fs/extent_cache.c  |   8 +-
 fs/f2fs/f2fs.h          | 135 +++++++++++++++++----------------
 fs/f2fs/file.c          |  28 +++----
 fs/f2fs/gc.c            |  18 ++---
 fs/f2fs/inline.c        |  20 ++---
 fs/f2fs/inode.c         |  61 +++++++--------
 fs/f2fs/namei.c         |  12 +--
 fs/f2fs/node.c          | 162 ++++++++++++++++++++--------------------
 fs/f2fs/node.h          |  75 ++++++++++---------
 fs/f2fs/recovery.c      |  78 +++++++++----------
 fs/f2fs/segment.c       |  27 ++++---
 include/linux/f2fs_fs.h |   2 +-
 include/linux/fscrypt.h |   7 +-
 17 files changed, 414 insertions(+), 413 deletions(-)

-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
