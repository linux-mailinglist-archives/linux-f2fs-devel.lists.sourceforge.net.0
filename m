Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gBQ7IRrzdmkzZgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 05:52:42 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A1683F54
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 05:52:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zDf05Qb4BUEAxaonSpzON8BxVnck2syD0FCqfmCsl/4=; b=jI8yUYt96ni0eAT5MGRQJ2mp0+
	6o+fNdTFbAS9gG1+QwHx2XSQlfOXOVnZasw9Rukxu73SNLr4fH0s9IiEgtckFeRaNE4LaZGTgqmZM
	qDXygMaSNeqQw2NqOQQinovjUx8TDlZ0Qxi3ZA51FK7ZHAexJ2lgKzATFQRNLEI+RKWY=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vkEae-0004A3-Ne;
	Mon, 26 Jan 2026 04:52:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+12afb9bb7a5ef89fcdd0+8191+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vkEab-00049u-OQ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 04:52:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pNvONlM06djPs13O5Qblg4h3hQTBMH5YrEOJt01du6I=; b=efNsS2zOQu5P0gNIAM2hifJ4MI
 HQ/x5hLa3pdkCnJJXuCtbd+oUfo1RRfc2OUG/du5+p+Qw1hhrxzX7lH5ckEfEN+HEcObBaAkc98zc
 lDplQudTNx2a+TnSekS66rFFukIJyClTszMnh++W+qsZwSUmAhvHjDd2/Uh96q2ixE/8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pNvONlM06djPs13O5Qblg4h3hQTBMH5YrEOJt01du6I=; b=I
 hOwDvtF8xZB9pKJQSvlK9xbBrmb18d/VZ8Fp1OtDjACnOW+DEA0y94qNuc4WRUaojrTbfoXmZVrdH
 aSAlUOOXe3EvfbRmkOpQt8IagthxOL9nhDTbSVjAi+ASa9S2c+iQSlzty7CDd0BahhKuD8lE69X7z
 8TTzORiHowNzFGeI=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vkEab-0001oU-7I for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 04:52:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=pNvONlM06djPs13O5Qblg4h3hQTBMH5YrEOJt01du6I=; b=4DY+nA687CEyR82Rlm7seNgexK
 m83BvRaldlSZAl9nZwnEZgrII9lWmZdz2LHit+Ry+qAp6ChGRPfGKyoMzZzerGJiHppAYXD8N44dk
 tvkxLyJ3RmBMDqr8WGExAAKmxn22M7nOyK7x+6c8+rHieYkv+8VkvmltHQIqwpWdYcsj9Ns7A7VaX
 x7vuXdvO+o9Ud9xG0tSa9jknwdj0twEKtTWf19VnbsJ6dqsMt2BYuEMpNvSYtU9MEK7RYfGXdTGNe
 5mun4OQWUEz0zFIrYAxbzwRQHJvzmE1mPHaiWB+uu77uGVkpWiSWQ4pkFW1SFWi+/ZauVfKd/GLrB
 gr2+k33w==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vkEaK-0000000BuOK-38N0; Mon, 26 Jan 2026 04:52:21 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Mon, 26 Jan 2026 05:50:46 +0100
Message-ID: <20260126045212.1381843-1-hch@lst.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi all, this series has a hodge podge of fsverity enhances
 that I looked into as part of the review of the xfs fsverity support series.
 The first part calls fsverity code from VFS code instead of requiring
 boilerplate
 in the file systems. The first patch fixes a bug in btrfs as part of that,
 as btrfs was missing a check. An xfstests t [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [198.137.202.133 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vkEab-0001oU-7I
Subject: [f2fs-dev] fsverity cleanups,
 speedup and memory usage optimization v3
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
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Andrey Albershteyn <aalbersh@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid]
X-Rspamd-Queue-Id: 22A1683F54
X-Rspamd-Action: no action

Hi all,

this series has a hodge podge of fsverity enhances that I looked into as
part of the review of the xfs fsverity support series.

The first part calls fsverity code from VFS code instead of requiring
boilerplate in the file systems.  The first patch fixes a bug in btrfs
as part of that, as btrfs was missing a check.  An xfstests
test case for this was submitted already.

The middle part optimizes the fsverity read path by kicking off readahead
for the fsverity hashes from the data read submission context, which in my
simply testing showed huge benefits for sequential reads using dd.
I haven't been able to get fio to run on a preallocated fio file, but
I expect random read benefits would be significantly better than that
still.

The last part avoids the need for a pointer in every inode for fsverity
and instead uses a rhashtable lookup, which is done once per read_folio
or ->readahead invocation plus for btrfs only for each bio completion.
Right now this does not increse the number of inodes in
each slab, but for ext4 we are getting very close to that (within
16 bytes by my count).

Changes since v2:
 - use sizeof_field for .key_len
 - fix a rebase error that caused an extra fsverity_get_info in
   fsverity_init_verification_context
 - add verify.o to the build in the correct patch
 - fix handling of non-ENOENT ERR_PTR folios in
   generic_readahead_merkle_tree
 - split fixing the __filemap_get_folio error handling into a
   separate patch
 - fix the readahead range in fsverity_read_merkle_tree
 - remove __fsverity_readahead as a result of the above
 - simplify the start/end_hidx calculation in fsverity_readahead
 - drop the > i_size check in fsverity_readahead
 - use pgoff_t where applicable
 - constify fsverity_info pointers in the verification path
 - use IS_ENABLED to disable code not used for non-fsverity builds in
   ext4 and f2fs
 - allow bisection for non-fsverity builds by provinding a stub
   fsverity_info_addr prototype
 - drop the now superflous inode argument to
   fsverity_init_verification_context
 - improve the kerneldoc for fsverity_readahead
 - improve various commit messages
 - fix the barrier placement in fsverity_active
 - mark fsverity_active to work around stupid compilers

Changes since v1:
 - reorder to keep the most controversial part last
 - drop moving the open handling to common code (for now)
 - factor the page cache read code into common code
 - reduce the number of hash lookups
 - add a barrier in the fsverity_active that pairs with the cmpxchg
   that sets the inode flag.

Diffstat:
 fs/attr.c                    |   12 ++
 fs/btrfs/btrfs_inode.h       |    4 
 fs/btrfs/extent_io.c         |   37 +++++---
 fs/btrfs/inode.c             |   13 ---
 fs/btrfs/verity.c            |   11 --
 fs/buffer.c                  |   25 ++---
 fs/ext4/ext4.h               |    4 
 fs/ext4/inode.c              |    4 
 fs/ext4/readpage.c           |   34 ++++---
 fs/ext4/super.c              |    4 
 fs/ext4/verity.c             |   34 ++-----
 fs/f2fs/compress.c           |    7 -
 fs/f2fs/data.c               |   72 ++++++++++------
 fs/f2fs/f2fs.h               |   12 --
 fs/f2fs/file.c               |    4 
 fs/f2fs/inode.c              |    1 
 fs/f2fs/super.c              |    3 
 fs/f2fs/verity.c             |   34 ++-----
 fs/inode.c                   |    9 ++
 fs/verity/Makefile           |    1 
 fs/verity/enable.c           |   39 +++++----
 fs/verity/fsverity_private.h |   21 ++--
 fs/verity/open.c             |   82 ++++++++++--------
 fs/verity/pagecache.c        |   54 ++++++++++++
 fs/verity/read_metadata.c    |   17 ++-
 fs/verity/verify.c           |  104 +++++++++++++++---------
 include/linux/fsverity.h     |  186 +++++++++++++++----------------------------
 27 files changed, 438 insertions(+), 390 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
