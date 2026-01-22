Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iGdJMFPecWk+MgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 09:22:43 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 56C5662FDA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 09:22:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=64WZrZddb6n+a1fzXm30tvUqFL3Mfs0EaWyPro3eUv0=; b=hO4DkacXki6fN7QAQiL6RrAA8K
	VsDQvnircn8sc6t8qBomUhVS4Yia49W0KLMoi0ara5zFZnjf2GzWJUL3/go/ItHO/AIu1T1s/PA4H
	5dly9LZLbN9R4RkUlvEQ16rUur/gw2YROflvnfNn3tvqpUS3vRFvBWYGF1+cV0dv8Hiw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vipxY-00010T-Jm;
	Thu, 22 Jan 2026 08:22:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+561f00ef1fac768e3611+8187+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vipxW-00010L-KL for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 08:22:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iXKlgI5mS16I9g4e1Orrg3wlBXZeyCMyoyxfvSYepqc=; b=jiGO1RlMQ0tX/KHyPfvrKhXqKr
 POi1Wvj451TrR2CtHAtuRqy5V1hESnmnuUuTvSAmZfvqUSKA9357T2+Zj5Qs8lY2/nijBkFh0DZQ/
 bB6sVLSe5AbZ9JjlnkitxY69oI+9brjQ0E+Gzkiu5UIaCQfKjADH9RuOIsdN4Nu7L6C8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iXKlgI5mS16I9g4e1Orrg3wlBXZeyCMyoyxfvSYepqc=; b=K
 fpOiCezDMQ+kHD6CFskZNt2kno+Re3qQgv4M3keAn42rYJ4D8eUKwrfjRBlh3+TP8CzqWmgJCoFJa
 JTKKO6m77uLxdOeI7lu3djOf6giRpllVvyVADILuuMeyrcj8Cg55/T+0AiZ5wyeraavVqC2erzqsW
 LtuagWHGju3M55r0=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vipxV-0005CX-Vy for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 08:22:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=iXKlgI5mS16I9g4e1Orrg3wlBXZeyCMyoyxfvSYepqc=; b=rGgRTf0OcAev4pI/Wfx3GGpLO9
 r5yxrrJ7Q7V58xtL6nEMg44KfYMJwSlGgtChkUNYr3Z8Egr6SffraBe04smzAX2NY/UZIbq8lc7sI
 pwvVZ6eRzqYzPc/ZOxci/bVLX9tEJUdMuObov495cANoQlyUX5S6LWHF6DNvViI6lCqlDDcqcawRH
 R80PmyQBsqIb0VKnLAtB3m43hjIJjd2Ydl1FiKXu0W5jzBBCMPh5rQQA7uqEqTH6GGp53lC/WQjrX
 mKBDcXQB7eVHFNPJvuc+npqA2y+UOxWQ3zjtF0DIJ5oV7+/Enw9DF6skUT74FM7IHCAwOWYOS60Tz
 0Gd15HEA==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vipxM-00000006dsU-3Z7U; Thu, 22 Jan 2026 08:22:21 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Thu, 22 Jan 2026 09:21:56 +0100
Message-ID: <20260122082214.452153-1-hch@lst.de>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vipxV-0005CX-Vy
Subject: [f2fs-dev] fsverity cleanups,
 speedup and memory usage optimization v2
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
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 56C5662FDA
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
and instead uses a rhashtable lookup, which is once per read_folio or
->readahead invocation and for for btrfs another time for each bio
completion.  Right now this does not increse the number of inodes in
each slab, but for ext4 we are getting very close to that (within
16 bytes by my count).

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
 fs/ext4/readpage.c           |   31 ++++---
 fs/ext4/super.c              |    4 
 fs/ext4/verity.c             |   34 ++------
 fs/f2fs/compress.c           |    7 -
 fs/f2fs/data.c               |   73 +++++++++++------
 fs/f2fs/f2fs.h               |   12 --
 fs/f2fs/file.c               |    4 
 fs/f2fs/inode.c              |    1 
 fs/f2fs/super.c              |    3 
 fs/f2fs/verity.c             |   34 ++------
 fs/inode.c                   |    9 ++
 fs/verity/Makefile           |    3 
 fs/verity/enable.c           |   39 +++++----
 fs/verity/fsverity_private.h |   19 ++--
 fs/verity/open.c             |   80 ++++++++++---------
 fs/verity/pagecache.c        |   53 ++++++++++++
 fs/verity/read_metadata.c    |   10 +-
 fs/verity/verify.c           |   94 +++++++++++++++-------
 include/linux/fsverity.h     |  180 +++++++++++++++----------------------------
 27 files changed, 422 insertions(+), 378 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
