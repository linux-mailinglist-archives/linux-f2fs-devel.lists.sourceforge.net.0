Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA95ACF4694
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 05 Jan 2026 16:31:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3gXiu3Bj2mm1imrXUvRCKGmU9nWpK9TVr2Cb+koSyrU=; b=MWAN6L8ECOUe1iocSq4b+GveWP
	fSVUbnMX+elO7RV+2di10A87NdZ9+H7bYrETLkLv7hlFZ1BnQ26dknCZ9xoOGV8Etf4izjbGLkis+
	W0C4i8Mu66wVHI45vhch9IHW7nyx6LzjGrUISqOh/NE8WJPFfYyE49gLmSJLgv0IkuJU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vcmYU-0002ET-1M;
	Mon, 05 Jan 2026 15:31:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1vcmYR-0002E8-8c
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Jan 2026 15:31:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MOtAEewhickz7rXgpIAHT8h7e5O32lYJDRxNeHUkyM8=; b=C3dJylXQvpCFqyyMDT/p1Pydr6
 5Izi0sCx4M8QGnRtWuIJEbFicyfjTwIDU+BqrcC66/z+bvLaWFPcB2pTFRqlIug9/kGt8w+eecSp6
 2OUyygOG5yoZMqqG06MukyRGzDpOpT2DDFYrecX78nbU3R1mYEhxWJE5046fmw7tqIcw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MOtAEewhickz7rXgpIAHT8h7e5O32lYJDRxNeHUkyM8=; b=H
 YLwdHFe7g9Zw/9Utw4wJvgRjJx8sE/BYc/Ay2GlxceA/47LY0ehnq9KXz/L9jAb+8U9Y6ZXKjv/f1
 bdCxXjfzDHu6swD/XQB/R1IB33psQT+RugjRwSuKNzZ4Q2/PP55o4umBaBnOb/hV6e9dWRRkygJwF
 W3pFLMiI24cy63RQ=;
Received: from m16.mail.126.com ([220.197.31.7])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vcmYQ-0006Du-OM for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 05 Jan 2026 15:31:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=MO
 tAEewhickz7rXgpIAHT8h7e5O32lYJDRxNeHUkyM8=; b=prNtQjOWfWmQ6W8ee/
 WIPu7I2Y3NqdqhiyYiYrwSlJjzNupnDykuZN9qeCJxq/75FKRlDHi+92sCRzTsJE
 xYBxfzozpZHUw9k2QZjq9QrVjJEnrIaj2f6eYBmc6KO3tzySDmbxF00wOJoTtSjX
 B0ylwOcbH2d9MbcDYvYgSrG5o=
Received: from YLLaptop.. (unknown [])
 by gzga-smtp-mtada-g0-1 (Coremail) with SMTP id _____wD3t6092Vtp4nHABA--.665S2;
 Mon, 05 Jan 2026 23:31:10 +0800 (CST)
From: Nanzhe Zhao <nzzhao@126.com>
To: Kim Jaegeuk <jaegeuk@kernel.org>
Date: Mon,  5 Jan 2026 23:30:56 +0800
Message-Id: <20260105153101.152892-1-nzzhao@126.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wD3t6092Vtp4nHABA--.665S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7KF48Jw1rCFyfGFWDtw15CFg_yoW8ZrW5pa
 y3GrZ8JF1rGF4S9ayftr1jgr4fJ3y8CFs8GFWxKry7A3W5CFs5WrW8tw1SyFyUCrW3GF4x
 Zr1j9a47uFyjyFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zi6VbkUUUUU=
X-Originating-IP: [2409:8a20:4df7:2871:d124:26e2:5013:1aa3]
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBsB62hmlb2T5HcwAA3-
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When reading immutable,
 non-compressed files with large folios
 enabled, I was able to reproduce readahead hangs while reading sparse files
 with holes and heavily fragmented files. The problems were ca [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [220.197.31.7 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1vcmYQ-0006Du-OM
Subject: [f2fs-dev] [PATCH v1 0/5] f2fs: fix large folio read corner cases
 for immutable files
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
Cc: Nanzhe Zhao <nzzhao@126.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When reading immutable, non-compressed files with large folios enabled,
I was able to reproduce readahead hangs while reading sparse files with
holes and heavily fragmented files. The problems were caused by a few
corner cases in the large-folio read loop:

  - f2fs_folio_state could be observed with uninitialized field
    read_pages_pending
  - subpage accounting could become inconsistent with BIO completion,
    leading to folios being prematurely unlocked/marked uptodate.
  - NULL_ADDR/NEW_ADDR blocks can carry F2FS_MAP_MAPPED, causing the
    large-folio read path to treat hole blocks as mapped and to account
    them in read_pages_pending.
  - in readahead, a folio that never had any subpage queued to a BIO
    would not be seen by f2fs_finish_read_bio(), leaving it locked.
  - the zeroing path did not advance index/offset before continuing.

This patch series fixes the above issues in f2fs_read_data_large_folio()
introduced by commit 05e65c14ea59 ("f2fs: support large folio for
immutable non-compressed case").

Testing
-------

All patches pass scripts/checkpatch.pl.

I tested the basic large-folio immutable read case described in the
original thread (create a large file, set immutable, drop caches to
reload the inode, then read it), and additionally verified:

  - sparse file
  - heavily fragmented file

In all cases, reads completed without hangs and data was verified against
the expected contents.

Nanzhe Zhao (5):
  f2fs: Zero f2fs_folio_state on allocation
  f2fs: Accounting large folio subpages before bio submission
  f2fs: add f2fs_block_needs_zeroing() to handle hole blocks
  f2fs: add 'folio_in_bio' to handle readahead folios with no BIO
    submission
  f2fs: advance index and offset after zeroing in large folio read

 fs/f2fs/data.c | 54 +++++++++++++++++++++++++++++++++-----------------
 1 file changed, 36 insertions(+), 18 deletions(-)


base-commit: 48b5439e04ddf4508ecaf588219012dc81d947c0
--
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
