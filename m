Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE968AFC54
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Apr 2024 00:56:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rzP3u-000072-UC;
	Tue, 23 Apr 2024 22:56:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1rzP3m-00006h-JO
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Apr 2024 22:56:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Jo/OjuBX7+Ck/BIUygFAqUDlJfqBAMZkQTNEoiLOR9g=; b=Y0BPomC10f45H0RxjxzYDxheVQ
 68wp7c6To4G1t0MxbxMXeFZ8jrcnXcbuqsKfEqr+40lpIZNUudzWu33JveDNy1zQjB2sBYf3XoE8I
 dAc+pLjWgzoo5S7zZ1RdF7UK59Cb7XQZxYfhwlUxCagWGOw23jixLCBweWgmsK5hS2iU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Jo/OjuBX7+Ck/BIUygFAqUDlJfqBAMZkQTNEoiLOR9g=; b=d
 ciPnc5QWc28tH3YYtTMbv+9AOeqOXKCfi2DvRoeFAE1MSAsewNsS/9zs6vL0j00IZFnK6lD4Z3HZE
 uiIdYh1Lf0VHEqpZ9BxKYeNYHF6ozmtV/D9sr/ITckgVg+evpN37ysFm63l116RMD3vVrP/Vnsx+e
 GrzJoFVCN/0PWwLI=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rzP3l-0007EW-7o for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Apr 2024 22:56:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=Jo/OjuBX7+Ck/BIUygFAqUDlJfqBAMZkQTNEoiLOR9g=; b=et9bn3CkzMB3+HnIrCN3Uj3Sn2
 aQLlknGrRBNyt2qdPxSs7VeHT1SLo+HbT0YcdFSv3TF/TVQeNP7EeDbic5eG7ZKL3wPS3QKD4jPnr
 kOSe1jybNRVlGA8HI6UrFbPU+KYQ6CffAi2CuFYJGBn10G1tTPlpcYt+AwWWmVb8P1wwX+PyjUz85
 eJbvU3XFouLaJenbcOYHiRaD+ep0u/Zup/j0YriJASlYmqzfp4wlvDxY6m8WdWU9xqGuTgwOv157E
 JvcDWwo+ll3kG37kovqYhFcOEl0VyrsZ6yelcf5HVgG+QZ19crnhQ3aQNd3s58iAwHsPaWEinppT6
 rMLkR3mQ==;
Received: from willy by casper.infradead.org with local (Exim 4.97.1 #2 (Red
 Hat Linux)) id 1rzP3K-0000000HG6C-0rHA;
 Tue, 23 Apr 2024 22:55:54 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-mm@kvack.org
Date: Tue, 23 Apr 2024 23:55:31 +0100
Message-ID: <20240423225552.4113447-1-willy@infradead.org>
X-Mailer: git-send-email 2.44.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: There are only a few users left. Convert them all to either
 call folio_mapping() or just use folio->mapping directly. Matthew Wilcox
 (Oracle) (6): fscrypt: Convert bh_get_inode_and_lblk_num to use a folio f2fs:
 Convert f2fs_clear_page_cache_dirty_tag to use a folio memory-failure: Remove
 calls to page_mapping() migra [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1rzP3l-0007EW-7o
Subject: [f2fs-dev] [PATCH 0/6] Remove page_mapping()
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
Cc: linux-fsdevel@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There are only a few users left.  Convert them all to either call
folio_mapping() or just use folio->mapping directly.

Matthew Wilcox (Oracle) (6):
  fscrypt: Convert bh_get_inode_and_lblk_num to use a folio
  f2fs: Convert f2fs_clear_page_cache_dirty_tag to use a folio
  memory-failure: Remove calls to page_mapping()
  migrate: Expand the use of folio in __migrate_device_pages()
  userfault; Expand folio use in mfill_atomic_install_pte()
  mm: Remove page_mapping()

 fs/crypto/inline_crypt.c |  6 +++---
 fs/f2fs/data.c           |  5 +++--
 include/linux/pagemap.h  |  1 -
 mm/folio-compat.c        |  6 ------
 mm/memory-failure.c      |  6 ++++--
 mm/migrate_device.c      | 13 +++++--------
 mm/userfaultfd.c         |  5 ++---
 7 files changed, 17 insertions(+), 25 deletions(-)

-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
