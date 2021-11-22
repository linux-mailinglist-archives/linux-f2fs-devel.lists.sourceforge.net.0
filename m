Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 363274587B9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Nov 2021 02:15:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1moxvv-0006zZ-1o; Mon, 22 Nov 2021 01:15:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <neilb@suse.de>) id 1moxvt-0006zS-Ts
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Nov 2021 01:15:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-id:Date:References:In-reply-to:Subject:Cc:
 To:From:MIME-Version:Content-Transfer-Encoding:Content-Type:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GqQ1fa2Qvqu8vDoZglgoNrFiVM2wF7QxgoW52V5xDOc=; b=TB559z3rpQbqlMrcK9RcKVww2S
 OcCOU4dtKR+OiDioH/AWez/dlS4TkWCL17cwISLx0ZKnGWKKGjBIAY03ZCHENMFhT+bkOXNnmfcSs
 sy0Fm3w+MRLalxIzQhz39ZyHzrEOXqzuNk9IcBgX0czW+OzFqkE7wrhimsjcBvyhKfUw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-id:Date:References:In-reply-to:Subject:Cc:To:From:MIME-Version:
 Content-Transfer-Encoding:Content-Type:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GqQ1fa2Qvqu8vDoZglgoNrFiVM2wF7QxgoW52V5xDOc=; b=MffQplgbZ32SWLZzAcrlR/gZoR
 EfkoqOScfla8/YyBNeO4TN9VrxMQDDlycCJKxC4Pg7BhrzWGlZWziwIw9n1F/Pv+W2/70It9zF6aq
 jNZZZ8TeqM4P8hBCUu0zcZUDcp5nhn6wC9Dwbaqvcn3gzAF23ZdpTYdRtODxy0Kj6eEQ=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1moxvp-0006PW-O3
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Nov 2021 01:15:45 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 1DB2D212C9;
 Mon, 22 Nov 2021 01:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1637543727; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GqQ1fa2Qvqu8vDoZglgoNrFiVM2wF7QxgoW52V5xDOc=;
 b=07hob/idqmMniFvmCthTif3NS1cq/eT+SpBnrhNL4SfJHxAMJIvmim3BL9BOBlaSpR6tkn
 Q+yUzRd8AhsJzGb7wZlZ21pOjhqj0KviiL8tbLshTjD2pk/JNO5Z8OQ7GD1ExbCWpDdirJ
 tNuTmi/83iA0YUsy7WiRW4VUnJ1uSEU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1637543727;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GqQ1fa2Qvqu8vDoZglgoNrFiVM2wF7QxgoW52V5xDOc=;
 b=c26sD4cZX0FIbNmCm9jO2s4pTZV4zMxcX69VcxMIweZQ28Q1R2Ajqdu95gFbcywyO5mfqM
 9fNTFnLwqvorP+AA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id C327C13466;
 Mon, 22 Nov 2021 01:15:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bX46HyrvmmEMPgAAMHmgww
 (envelope-from <neilb@suse.de>); Mon, 22 Nov 2021 01:15:22 +0000
MIME-Version: 1.0
From: "NeilBrown" <neilb@suse.de>
To: "Dave Chinner" <david@fromorbit.com>
In-reply-to: <20211117055311.GS449541@dread.disaster.area>
References: <163712329077.13692.12796971766360881401@noble.neil.brown.name>,
 <20211117055311.GS449541@dread.disaster.area>
Date: Mon, 22 Nov 2021 12:15:19 +1100
Message-id: <163754371968.13692.1277530886009912421@noble.neil.brown.name>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Various places in the kernel - largely in filesystems -
 respond
 to a memory allocation failure by looping around and re-trying. Some of these
 cannot conveniently use __GFP_NOFAIL, for reasons such as: [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1moxvp-0006PW-O3
Subject: [f2fs-dev] [PATCH v2] MM: introduce memalloc_retry_wait()
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
Cc: linux-nfs@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 Theodore Ts'o <tytso@mit.edu>, "Darrick J. Wong" <djwong@kernel.org>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Chuck Lever <chuck.lever@oracle.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Andrew Morton <akpm@linux-foundation.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


Various places in the kernel - largely in filesystems - respond to a
memory allocation failure by looping around and re-trying.
Some of these cannot conveniently use __GFP_NOFAIL, for reasons such as:
 - a GFP_ATOMIC allocation, which __GFP_NOFAIL doesn't work on
 - a need to check for the process being signalled between failures
 - the possibility that other recovery actions could be performed
 - the allocation is quite deep in support code, and passing down an
   extra flag to say if __GFP_NOFAIL is wanted would be clumsy.

Many of these currently use congestion_wait() which (in almost all
cases) simply waits the given timeout - congestion isn't tracked for
most devices.

It isn't clear what the best delay is for loops, but it is clear that
the various filesystems shouldn't be responsible for choosing a timeout.

This patch introduces memalloc_retry_wait() with takes on that
responsibility.  Code that wants to retry a memory allocation can call
this function passing the GFP flags that were used.  It will wait
however is appropriate.

For now, it only considers __GFP_NORETRY and whatever
gfpflags_allow_blocking() tests.  If blocking is allowed without
__GFP_NORETRY, then alloc_page either made some reclaim progress, or
waited for a while, before failing.  So there is no need for much
further waiting.  memalloc_retry_wait() will wait until the current
jiffie ends.  If this condition is not met, then alloc_page() won't have
waited much if at all.  In that case memalloc_retry_wait() waits about
200ms.  This is the delay that most current loops uses.

linux/sched/mm.h needs to be included in some files now,
but linux/backing-dev.h does not.

Signed-off-by: NeilBrown <neilb@suse.de>
---

Switched to io_schedule_timeout(), and added some missing #includes.

 fs/ext4/extents.c        |  8 +++-----
 fs/ext4/inline.c         |  5 ++---
 fs/ext4/page-io.c        |  9 +++++----
 fs/f2fs/data.c           |  4 ++--
 fs/f2fs/gc.c             |  5 ++---
 fs/f2fs/inode.c          |  4 ++--
 fs/f2fs/node.c           |  4 ++--
 fs/f2fs/recovery.c       |  6 +++---
 fs/f2fs/segment.c        |  9 +++------
 fs/f2fs/super.c          |  5 ++---
 fs/xfs/kmem.c            |  3 +--
 fs/xfs/xfs_buf.c         |  2 +-
 include/linux/sched/mm.h | 26 ++++++++++++++++++++++++++
 net/sunrpc/svc_xprt.c    |  3 ++-
 14 files changed, 56 insertions(+), 37 deletions(-)

diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
index 0ecf819bf189..5582fba36b44 100644
--- a/fs/ext4/extents.c
+++ b/fs/ext4/extents.c
@@ -27,8 +27,8 @@
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/fiemap.h>
-#include <linux/backing-dev.h>
 #include <linux/iomap.h>
+#include <linux/sched/mm.h>
 #include "ext4_jbd2.h"
 #include "ext4_extents.h"
 #include "xattr.h"
@@ -4407,8 +4407,7 @@ int ext4_ext_truncate(handle_t *handle, struct inode *inode)
 	err = ext4_es_remove_extent(inode, last_block,
 				    EXT_MAX_BLOCKS - last_block);
 	if (err == -ENOMEM) {
-		cond_resched();
-		congestion_wait(BLK_RW_ASYNC, HZ/50);
+		memalloc_retry_wait(GFP_ATOMIC);
 		goto retry;
 	}
 	if (err)
@@ -4416,8 +4415,7 @@ int ext4_ext_truncate(handle_t *handle, struct inode *inode)
 retry_remove_space:
 	err = ext4_ext_remove_space(inode, last_block, EXT_MAX_BLOCKS - 1);
 	if (err == -ENOMEM) {
-		cond_resched();
-		congestion_wait(BLK_RW_ASYNC, HZ/50);
+		memalloc_retry_wait(GFP_ATOMIC);
 		goto retry_remove_space;
 	}
 	return err;
diff --git a/fs/ext4/inline.c b/fs/ext4/inline.c
index 39a1ab129fdc..635bcf68a67e 100644
--- a/fs/ext4/inline.c
+++ b/fs/ext4/inline.c
@@ -7,7 +7,7 @@
 #include <linux/iomap.h>
 #include <linux/fiemap.h>
 #include <linux/iversion.h>
-#include <linux/backing-dev.h>
+#include <linux/sched/mm.h>
 
 #include "ext4_jbd2.h"
 #include "ext4.h"
@@ -1929,8 +1929,7 @@ int ext4_inline_data_truncate(struct inode *inode, int *has_inline)
 retry:
 			err = ext4_es_remove_extent(inode, 0, EXT_MAX_BLOCKS);
 			if (err == -ENOMEM) {
-				cond_resched();
-				congestion_wait(BLK_RW_ASYNC, HZ/50);
+				memalloc_retry_wait(GFP_ATOMIC);
 				goto retry;
 			}
 			if (err)
diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
index 9cb261714991..1d370364230e 100644
--- a/fs/ext4/page-io.c
+++ b/fs/ext4/page-io.c
@@ -24,7 +24,7 @@
 #include <linux/kernel.h>
 #include <linux/slab.h>
 #include <linux/mm.h>
-#include <linux/backing-dev.h>
+#include <linux/sched/mm.h>
 
 #include "ext4_jbd2.h"
 #include "xattr.h"
@@ -523,12 +523,13 @@ int ext4_bio_write_page(struct ext4_io_submit *io,
 			ret = PTR_ERR(bounce_page);
 			if (ret == -ENOMEM &&
 			    (io->io_bio || wbc->sync_mode == WB_SYNC_ALL)) {
-				gfp_flags = GFP_NOFS;
+				gfp_t new_gfp_flags = GFP_NOFS;
 				if (io->io_bio)
 					ext4_io_submit(io);
 				else
-					gfp_flags |= __GFP_NOFAIL;
-				congestion_wait(BLK_RW_ASYNC, HZ/50);
+					new_gfp_flags |= __GFP_NOFAIL;
+				memalloc_retry_wait(gfp_flags);
+				gfp_flags = new_gfp_flags;
 				goto retry_encrypt;
 			}
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 9f754aaef558..aacf5e4dcc57 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -8,9 +8,9 @@
 #include <linux/fs.h>
 #include <linux/f2fs_fs.h>
 #include <linux/buffer_head.h>
+#include <linux/sched/mm.h>
 #include <linux/mpage.h>
 #include <linux/writeback.h>
-#include <linux/backing-dev.h>
 #include <linux/pagevec.h>
 #include <linux/blkdev.h>
 #include <linux/bio.h>
@@ -2542,7 +2542,7 @@ int f2fs_encrypt_one_page(struct f2fs_io_info *fio)
 		/* flush pending IOs and wait for a while in the ENOMEM case */
 		if (PTR_ERR(fio->encrypted_page) == -ENOMEM) {
 			f2fs_flush_merged_writes(fio->sbi);
-			congestion_wait(BLK_RW_ASYNC, DEFAULT_IO_TIMEOUT);
+			memalloc_retry_wait(GFP_NOFS);
 			gfp_flags |= __GFP_NOFAIL;
 			goto retry_encrypt;
 		}
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index a946ce0ead34..374bbb5294d9 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -7,7 +7,6 @@
  */
 #include <linux/fs.h>
 #include <linux/module.h>
-#include <linux/backing-dev.h>
 #include <linux/init.h>
 #include <linux/f2fs_fs.h>
 #include <linux/kthread.h>
@@ -15,6 +14,7 @@
 #include <linux/freezer.h>
 #include <linux/sched/signal.h>
 #include <linux/random.h>
+#include <linux/sched/mm.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -1375,8 +1375,7 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
 		if (err) {
 			clear_page_private_gcing(page);
 			if (err == -ENOMEM) {
-				congestion_wait(BLK_RW_ASYNC,
-						DEFAULT_IO_TIMEOUT);
+				memalloc_retry_wait(GFP_NOFS);
 				goto retry;
 			}
 			if (is_dirty)
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 0f8b2df3e1e0..4c11254a07d4 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -8,8 +8,8 @@
 #include <linux/fs.h>
 #include <linux/f2fs_fs.h>
 #include <linux/buffer_head.h>
-#include <linux/backing-dev.h>
 #include <linux/writeback.h>
+#include <linux/sched/mm.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -562,7 +562,7 @@ struct inode *f2fs_iget_retry(struct super_block *sb, unsigned long ino)
 	inode = f2fs_iget(sb, ino);
 	if (IS_ERR(inode)) {
 		if (PTR_ERR(inode) == -ENOMEM) {
-			congestion_wait(BLK_RW_ASYNC, DEFAULT_IO_TIMEOUT);
+			memalloc_retry_wait(GFP_NOFS);
 			goto retry;
 		}
 	}
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 556fcd8457f3..219506ca9a97 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -8,7 +8,7 @@
 #include <linux/fs.h>
 #include <linux/f2fs_fs.h>
 #include <linux/mpage.h>
-#include <linux/backing-dev.h>
+#include <linux/sched/mm.h>
 #include <linux/blkdev.h>
 #include <linux/pagevec.h>
 #include <linux/swap.h>
@@ -2750,7 +2750,7 @@ int f2fs_recover_inode_page(struct f2fs_sb_info *sbi, struct page *page)
 retry:
 	ipage = f2fs_grab_cache_page(NODE_MAPPING(sbi), ino, false);
 	if (!ipage) {
-		congestion_wait(BLK_RW_ASYNC, DEFAULT_IO_TIMEOUT);
+		memalloc_retry_wait(GFP_NOFS);
 		goto retry;
 	}
 
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 6a1b4668d933..d1664a0567ef 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -8,6 +8,7 @@
 #include <asm/unaligned.h>
 #include <linux/fs.h>
 #include <linux/f2fs_fs.h>
+#include <linux/sched/mm.h>
 #include "f2fs.h"
 #include "node.h"
 #include "segment.h"
@@ -587,7 +588,7 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 	err = f2fs_get_dnode_of_data(&dn, start, ALLOC_NODE);
 	if (err) {
 		if (err == -ENOMEM) {
-			congestion_wait(BLK_RW_ASYNC, DEFAULT_IO_TIMEOUT);
+			memalloc_retry_wait(GFP_NOFS);
 			goto retry_dn;
 		}
 		goto out;
@@ -670,8 +671,7 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 			err = check_index_in_prev_nodes(sbi, dest, &dn);
 			if (err) {
 				if (err == -ENOMEM) {
-					congestion_wait(BLK_RW_ASYNC,
-							DEFAULT_IO_TIMEOUT);
+					memalloc_retry_wait(GFP_NOFS);
 					goto retry_prev;
 				}
 				goto err;
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index df9ed75f0b7a..40fdb4a8daeb 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -9,6 +9,7 @@
 #include <linux/f2fs_fs.h>
 #include <linux/bio.h>
 #include <linux/blkdev.h>
+#include <linux/sched/mm.h>
 #include <linux/prefetch.h>
 #include <linux/kthread.h>
 #include <linux/swap.h>
@@ -245,9 +246,7 @@ static int __revoke_inmem_pages(struct inode *inode,
 								LOOKUP_NODE);
 			if (err) {
 				if (err == -ENOMEM) {
-					congestion_wait(BLK_RW_ASYNC,
-							DEFAULT_IO_TIMEOUT);
-					cond_resched();
+					memalloc_retry_wait(GFP_NOFS);
 					goto retry;
 				}
 				err = -EAGAIN;
@@ -424,9 +423,7 @@ static int __f2fs_commit_inmem_pages(struct inode *inode)
 			err = f2fs_do_write_data_page(&fio);
 			if (err) {
 				if (err == -ENOMEM) {
-					congestion_wait(BLK_RW_ASYNC,
-							DEFAULT_IO_TIMEOUT);
-					cond_resched();
+					memalloc_retry_wait(GFP_NOFS);
 					goto retry;
 				}
 				unlock_page(page);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 040b6d02e1d8..3bace24f8800 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -8,9 +8,9 @@
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/fs.h>
+#include <linux/sched/mm.h>
 #include <linux/statfs.h>
 #include <linux/buffer_head.h>
-#include <linux/backing-dev.h>
 #include <linux/kthread.h>
 #include <linux/parser.h>
 #include <linux/mount.h>
@@ -2415,8 +2415,7 @@ static ssize_t f2fs_quota_read(struct super_block *sb, int type, char *data,
 		page = read_cache_page_gfp(mapping, blkidx, GFP_NOFS);
 		if (IS_ERR(page)) {
 			if (PTR_ERR(page) == -ENOMEM) {
-				congestion_wait(BLK_RW_ASYNC,
-						DEFAULT_IO_TIMEOUT);
+				memalloc_retry_wait(GFP_NOFS);
 				goto repeat;
 			}
 			set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
diff --git a/fs/xfs/kmem.c b/fs/xfs/kmem.c
index 6f49bf39183c..c557a030acfe 100644
--- a/fs/xfs/kmem.c
+++ b/fs/xfs/kmem.c
@@ -4,7 +4,6 @@
  * All Rights Reserved.
  */
 #include "xfs.h"
-#include <linux/backing-dev.h>
 #include "xfs_message.h"
 #include "xfs_trace.h"
 
@@ -26,6 +25,6 @@ kmem_alloc(size_t size, xfs_km_flags_t flags)
 	"%s(%u) possible memory allocation deadlock size %u in %s (mode:0x%x)",
 				current->comm, current->pid,
 				(unsigned int)size, __func__, lflags);
-		congestion_wait(BLK_RW_ASYNC, HZ/50);
+		memalloc_retry_wait(lflags);
 	} while (1);
 }
diff --git a/fs/xfs/xfs_buf.c b/fs/xfs/xfs_buf.c
index 631c5a61d89b..6c45e3fa56f4 100644
--- a/fs/xfs/xfs_buf.c
+++ b/fs/xfs/xfs_buf.c
@@ -394,7 +394,7 @@ xfs_buf_alloc_pages(
 		}
 
 		XFS_STATS_INC(bp->b_mount, xb_page_retries);
-		congestion_wait(BLK_RW_ASYNC, HZ / 50);
+		memalloc_retry_wait(gfp_mask);
 	}
 	return 0;
 }
diff --git a/include/linux/sched/mm.h b/include/linux/sched/mm.h
index aca874d33fe6..aa5f09ca5bcf 100644
--- a/include/linux/sched/mm.h
+++ b/include/linux/sched/mm.h
@@ -214,6 +214,32 @@ static inline void fs_reclaim_acquire(gfp_t gfp_mask) { }
 static inline void fs_reclaim_release(gfp_t gfp_mask) { }
 #endif
 
+/* Any memory-allocation retry loop should use
+ * memalloc_retry_wait(), and pass the flags for the most
+ * constrained allocation attempt that might have failed.
+ * This provides useful documentation of where loops are,
+ * and a central place to fine tune the waiting as the MM
+ * implementation changes.
+ */
+static inline void memalloc_retry_wait(gfp_t gfp_flags)
+{
+	/* We use io_schedule_timeout because waiting for memory
+	 * typically included waiting for dirty pages to be
+	 * written out, which requires IO.
+	 */
+	__set_current_state(TASK_UNINTERRUPTIBLE);
+	gfp_flags = current_gfp_context(gfp_flags);
+	if (gfpflags_allow_blocking(gfp_flags) &&
+	    !(gfp_flags & __GFP_NORETRY))
+		/* Probably waited already, no need for much more */
+		io_schedule_timeout(1);
+	else
+		/* Probably didn't wait, and has now released a lock,
+		 * so now is a good time to wait
+		 */
+		io_schedule_timeout(HZ/50);
+}
+
 /**
  * might_alloc - Mark possible allocation sites
  * @gfp_mask: gfp_t flags that would be used to allocate
diff --git a/net/sunrpc/svc_xprt.c b/net/sunrpc/svc_xprt.c
index 1e99ba1b9d72..9cb18b822ab2 100644
--- a/net/sunrpc/svc_xprt.c
+++ b/net/sunrpc/svc_xprt.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/sched.h>
+#include <linux/sched/mm.h>
 #include <linux/errno.h>
 #include <linux/freezer.h>
 #include <linux/kthread.h>
@@ -688,7 +689,7 @@ static int svc_alloc_arg(struct svc_rqst *rqstp)
 			return -EINTR;
 		}
 		trace_svc_alloc_arg_err(pages);
-		schedule_timeout(msecs_to_jiffies(500));
+		memalloc_retry_wait(GFP_KERNEL);
 	}
 	rqstp->rq_page_end = &rqstp->rq_pages[pages];
 	rqstp->rq_pages[pages] = NULL; /* this might be seen in nfsd_splice_actor() */
-- 
2.33.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
