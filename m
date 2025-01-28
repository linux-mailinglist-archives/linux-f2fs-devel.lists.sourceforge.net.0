Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F39CA2037B
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Jan 2025 05:10:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tccvs-00032V-Oc;
	Tue, 28 Jan 2025 04:10:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tccvq-00032N-K9
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Jan 2025 04:10:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=P+HVaaIHLKsoY4slCpUFzCXmH1vtIb5RLGg51OL4Mac=; b=Q3bifs7fRz8CtJ05JdLNRtIw9a
 gNTJcug7Xux0eSGsrnVe/PIIB+UNAfLplV8/AGQ2YbZ8KQw6yb7sjTudIYILy7hHtl+zqC6nhejcQ
 AO+0EULGbjDlA2kcENDzsdP4G7xkd9pkCg3+JRqPJxhn0765wFCYnSON16++QF0QqkJQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=P+HVaaIHLKsoY4slCpUFzCXmH1vtIb5RLGg51OL4Mac=; b=T
 TtFNBH44WVQSKUp896jJF3+LGh8NgoEqAMY13OcwIWCdvQcEvTW4zemCRv0QKyKpVpzpd4iwwW1Xr
 FBUm4dXgLh7A2JQBMN3YnZgxX6kwHB/Vufoj47+4e8H59XFgDxLyn1aQ9YVgR5Nwb3lByIK9nTe0l
 Anu8AyF5IOJqtKRQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tccvq-0004a2-Ii for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Jan 2025 04:10:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1398B5C5424;
 Tue, 28 Jan 2025 04:09:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8A75C4CED3;
 Tue, 28 Jan 2025 04:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738037423;
 bh=QjjK0EVvl2V3iI3N6RLPL0h8OriQaqn1qcX7B5zcdvo=;
 h=Date:From:To:Cc:Subject:From;
 b=VyGI9gWNiWoxF+0Uh18Vc+SQ0Vk8GbOlE0TOsmL1bEt1xjAHhYEEk+SSzO0AxBH1D
 jUzTyvIaHj64OYVy7qlAmWCQcEMkC4yEtwsnZrgyi7/QF3/CWrafLgXp0zV5SIuRSB
 mI8aSLY1npCxv/XlSvG5MskIwbrT5Ks8g7izxZDw1wtr3pkvHZOP6YVJ+mdgissmBY
 wHbGfLLowiES7r8hh13Olvo/3NkPGbKAdUvfF+CK9p6jfLrl+PU9r17dGRAmM/S6fe
 WOiEbDRecwcXQpGpMCe/xVmSjNisd7DyiLMKO26Ui6rWka0qcc5XIup8nakceFRA7r
 lxtpJVxik3+LA==
Date: Tue, 28 Jan 2025 04:10:22 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <Z5hYrgYwNJuaPFF1@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -6.5 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, Could you please consider this pull request? Thanks,
 Content analysis details:   (-6.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tccvq-0004a2-Ii
Subject: [f2fs-dev] [GIT PULL] f2fs update for 6.14-rc1
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Linus,

Could you please consider this pull request?

Thanks,

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.14-rc1

for you to fetch changes up to 03511e936916873bf880e6678c98d5fb59c19742:

  f2fs: fix inconsistent dirty state of atomic file (2025-01-25 01:12:12 +0000)

----------------------------------------------------------------
f2fs-for-6.14-rc1

In this series, there are several major improvements such as 1) folio conversion
made by Matthew, 2) speed-up of block truncation, 3) caching more dentry pages.
In addition, we implemented a linear dentry search to address recent unicode
regression, and figured out some false alarms that we could get rid of.

Enhancement:
 - foilio conversion in various IO paths
 - optimize f2fs_truncate_data_blocks_range()
 - cache more dentry pages
 - remove unnecessary blk_finish_plug
 - procfs: show mtime in segment_bits

Bug fix:
 - introduce linear search for dentries
 - don't call block truncation for aliased file
 - fix using wrong 'submitted' value in f2fs_write_cache_pages
 - fix to do sanity check correctly on i_inline_xattr_size
 - avoid trying to get invalid block address
 - fix inconsistent dirty state of atomic file

----------------------------------------------------------------
Chao Yu (3):
      f2fs: fix to do sanity check correctly on i_inline_xattr_size
      f2fs: fix to avoid return invalid mtime from f2fs_get_section_mtime()
      f2fs: procfs: show mtime in segment_bits

Daniel Lee (1):
      f2fs: Introduce linear search for dentries

Dmitry Antipov (1):
      f2fs: ensure that node info flags are always initialized

Jaegeuk Kim (3):
      f2fs: don't call block truncation for aliased file
      f2fs: remove blk_finish_plug
      f2fs: avoid trying to get invalid block address

Jianan Huang (1):
      f2fs: fix inconsistent dirty state of atomic file

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

Nathan Chancellor (1):
      f2fs: Fix format specifier in sanity_check_inode()

Yi Sun (7):
      f2fs: expand f2fs_invalidate_compress_page() to f2fs_invalidate_compress_pages_range()
      f2fs: add parameter @len to f2fs_invalidate_internal_cache()
      f2fs: introduce update_sit_entry_for_release/alloc()
      f2fs: update_sit_entry_for_release() supports consecutive blocks.
      f2fs: add parameter @len to f2fs_invalidate_blocks()
      f2fs: Optimize f2fs_truncate_data_blocks_range()
      f2fs: Clean up the loop outside of f2fs_invalidate_blocks()

Yongpeng Yang (1):
      f2fs: The GC triggered by ioctl also needs to mark the segno as victim

Zhiguo Niu (1):
      f2fs: fix to avoid changing 'check only' behaior of recovery

zangyangyang1 (2):
      f2fs: cache more dentry pages
      f2fs: fix using wrong 'submitted' value in f2fs_write_cache_pages

 fs/f2fs/compress.c          |  38 ++++----
 fs/f2fs/data.c              |  62 ++++++-------
 fs/f2fs/dir.c               |  53 +++++++----
 fs/f2fs/f2fs.h              |  29 +++---
 fs/f2fs/file.c              |  37 ++++++--
 fs/f2fs/gc.c                |  13 +--
 fs/f2fs/inline.c            |   7 +-
 fs/f2fs/inode.c             |  19 ++--
 fs/f2fs/namei.c             |   1 +
 fs/f2fs/node.c              |  10 ++-
 fs/f2fs/recovery.c          |   4 +-
 fs/f2fs/segment.c           | 210 +++++++++++++++++++++++++++++---------------
 fs/f2fs/sysfs.c             |   3 +-
 include/trace/events/f2fs.h |  39 ++++----
 14 files changed, 324 insertions(+), 201 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
