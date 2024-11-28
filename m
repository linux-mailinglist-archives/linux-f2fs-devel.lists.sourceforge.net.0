Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 390759DB27F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Nov 2024 06:21:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tGWxd-00046m-8Z;
	Thu, 28 Nov 2024 05:21:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tGWxb-00046Y-5D
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Nov 2024 05:21:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bXYZgyRUkeW2u8b7qt0UoQCZTVfllwtBY4MWT7T+Qu4=; b=UEtpqF5ZIBgPbhJsufJtgGvuDz
 cgn5yafOmVNFtsLak5fePKM1iWcBUQKvhyUayBzpGMId3ntY/tOxHH/FughTuQoG5r5k181E2ku6O
 hyf+yWEf7FSfsBNVCYH3PjubqrPZENFj/DpGra9vgP54T63rNpybC/E2LH70rfR7+9UI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=bXYZgyRUkeW2u8b7qt0UoQCZTVfllwtBY4MWT7T+Qu4=; b=I
 zXqAeKc95SbvI7z2UNr51IKFYelSF+L8LBPiXwnSnRgbyWlgkmP3cHNARgNDdO85Ls7rHbRKMf6Wc
 nQi3i5CKWMlvcNwFei2ngUPI14RO2XzePqt3M96MWwiyaMHM/89St3WlKkE0SL8nFPS1l5gjJ4Poj
 7hIAjlD1msnXFvSE=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tGWxb-0004nb-BT for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Nov 2024 05:21:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=bXYZgyRUkeW2u8b7qt0UoQCZTVfllwtBY4MWT7T+Qu4=; b=Yj7w3S9JBsnQ1lxLp5io1lzIws
 5ZBxS/d3EI0Uk+UQU7jamijfIIwZ+RNoCprqGiNvaQTLKVPRJiRTda9FGnUyhjZFFQN3cnU79nstn
 yJaDDk6nMGDtp8SwerNuSSqS2AgxGSwmsAWnLtVPGuB7d0z9hw9dLDEPxZdLlHg6VKT8J8luKIf6K
 7yjVgfN8bA5wW6QLY2hSkI1g/D0BzWv6xPHJK8zv5QFXOIaZG+FQL1ePlmfzozk0Zf9hvQDtUvzlG
 HCdYz9HE3EBpjq9WPuLdKbYqdwDDj5lkhsFwi9sgub2BAlQAU9YfLq27usSgJIz9ZG2bntkCbNVgp
 7A+JwxBg==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tGWbp-00000002DFQ-3a13; Thu, 28 Nov 2024 04:58:34 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu, 28 Nov 2024 04:58:15 +0000
Message-ID: <20241128045828.527559-1-willy@infradead.org>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This round of f2fs patches accomplishes two things: - Removal
 of all references to page->index in f2fs. I'm looking to finish this
 conversion
 in the January merge window. - Removal of all calls to page_file_mapping()
 and folio_file_mapping() 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [90.155.50.34 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tGWxb-0004nb-BT
Subject: [f2fs-dev] [PATCH 00/11] f2fs folio patches
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

This round of f2fs patches accomplishes two things:

 - Removal of all references to page->index in f2fs.  I'm looking to
   finish this conversion in the January merge window.
 - Removal of all calls to page_file_mapping() and folio_file_mapping()

I have only compile-tested these patches.

Matthew Wilcox (Oracle) (11):
  f2fs: Use a folio in f2fs_all_cluster_page_ready()
  f2fs: Use a folio in f2fs_compress_write_end()
  f2fs: Use a folio in f2fs_truncate_partial_cluster()
  f2fs: Use a folio in f2fs_write_compressed_pages()
  f2fs: Convert submit tracepoints to take a folio
  f2fs: Add F2FS_F_SB()
  f2fs: Convert f2fs_finish_read_bio() to use folios
  f2fs: Use a folio more in f2fs_submit_page_bio()
  f2fs: Use a data folio in f2fs_submit_page_bio()
  f2fs: Convert __read_io_type() to take a folio
  f2fs: Remove calls to folio_file_mapping()

 fs/f2fs/compress.c          | 28 ++++++++++++--------
 fs/f2fs/data.c              | 53 +++++++++++++++----------------------
 fs/f2fs/f2fs.h              |  7 ++++-
 fs/f2fs/inline.c            |  2 +-
 include/trace/events/f2fs.h | 39 +++++++++++++--------------
 5 files changed, 65 insertions(+), 64 deletions(-)

-- 
2.45.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
