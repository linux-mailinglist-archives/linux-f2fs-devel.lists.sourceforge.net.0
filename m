Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 682DC53DDF1
	for <lists+linux-f2fs-devel@lfdr.de>; Sun,  5 Jun 2022 21:39:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nxw5x-0006Pe-2k; Sun, 05 Jun 2022 19:39:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>) id 1nxw5s-0006P2-Pg
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jun 2022 19:39:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pFaDJUkNgKV/oU+nKufi51KbavXmhswow0vSfNYzKrI=; b=muGIKy79Yxd6GBgw0gztDFQ/yS
 eE6DzXTQlEMfF20rELDBFA1RKrLX9oOXGbeDf8W/n3YdPYF0fARj9Jr2tCNW30H0uZSQncqCb4NfL
 F1vEkSuqO6TtVdcY340P9n2DdKnzQ1uWMmWwLi7LJox7oR3KJKk+53yuQ6xP4wWGlQdc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pFaDJUkNgKV/oU+nKufi51KbavXmhswow0vSfNYzKrI=; b=T
 Xe/VyYEj72m2eh79ZFv3+ZZCBr1Xj8RofKeYrNrdUndiovmQFKWZjZH0jeXMWL+Ccz67lpB44Eu4G
 vlfErOYaCNaIy/gSaAW96w3c4q4uTypN8+GV1SBctyAeHy/yyyJPuwdPcHih3zI+lxZ1Nz47VJkBG
 YLitxxhvAXumNHqM=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nxw5r-00055k-L0
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 05 Jun 2022 19:39:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=pFaDJUkNgKV/oU+nKufi51KbavXmhswow0vSfNYzKrI=; b=IQQ3chWAAqod3iNOvZPz+sg3JL
 Hk+ApUMeqh7NT3g6IWWJNzgueSDKfvvNhBx6utIRkRDW0gX3AiQfvMXnwsyaJ/64KiwRfHwjSy/dv
 8J6uezBFHQnTUj8EMV7+h4tSlGa2WN04lIzx/EyXL84mDYJOn+khSbti+8XKflhn9L4r/WhR6xbM7
 +MZ9IYhStDA3yihxRhpkHHC+OXeBpvNCGWk5fEeGTb1H9CRJG5lEjoY1+jSkJw8hVgtSw7cxw6GvV
 KZogb0QToLdgR6kEf13Hcr4syZG2xfRXsnqeCO+zpSb6FDBtT5Fx6Rp6rYpWkgGY3OjWTTkHnJk29
 kJYadcSQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nxw5Q-009wsN-GO; Sun, 05 Jun 2022 19:38:56 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Sun,  5 Jun 2022 20:38:44 +0100
Message-Id: <20220605193854.2371230-1-willy@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Spam-Score: 2.3 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch series removes find_get_pages_range(),
 pagevec_lookup() and pagevec_lookup_range(),
 converting all callers to use the new filemap_get_folios().
 I've only run xfstests over ext4 ... some oth [...] 
 Content analysis details:   (2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nxw5r-00055k-L0
Subject: [f2fs-dev] [PATCH 00/10] Convert to filemap_get_folios()
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
Cc: linux-nilfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch series removes find_get_pages_range(), pagevec_lookup()
and pagevec_lookup_range(), converting all callers to use the new
filemap_get_folios().  I've only run xfstests over ext4 ... some other
testing might be appropriate.

Matthew Wilcox (Oracle) (10):
  filemap: Add filemap_get_folios()
  buffer: Convert clean_bdev_aliases() to use filemap_get_folios()
  ext4: Convert mpage_release_unused_pages() to use filemap_get_folios()
  ext4: Convert mpage_map_and_submit_buffers() to use
    filemap_get_folios()
  f2fs: Convert f2fs_invalidate_compress_pages() to use
    filemap_get_folios()
  hugetlbfs: Convert remove_inode_hugepages() to use
    filemap_get_folios()
  nilfs2: Convert nilfs_copy_back_pages() to use filemap_get_folios()
  vmscan: Add check_move_unevictable_folios()
  shmem: Convert shmem_unlock_mapping() to use filemap_get_folios()
  filemap: Remove find_get_pages_range() and associated functions

 fs/buffer.c             | 26 +++++++--------
 fs/ext4/inode.c         | 40 ++++++++++++-----------
 fs/f2fs/compress.c      | 35 +++++++++-----------
 fs/hugetlbfs/inode.c    | 44 ++++++++-----------------
 fs/nilfs2/page.c        | 60 +++++++++++++++++-----------------
 include/linux/pagemap.h |  5 ++-
 include/linux/pagevec.h | 10 ------
 include/linux/swap.h    |  3 +-
 mm/filemap.c            | 72 +++++++++++++++++------------------------
 mm/shmem.c              | 13 ++++----
 mm/swap.c               | 29 -----------------
 mm/vmscan.c             | 55 ++++++++++++++++++-------------
 12 files changed, 166 insertions(+), 226 deletions(-)

-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
