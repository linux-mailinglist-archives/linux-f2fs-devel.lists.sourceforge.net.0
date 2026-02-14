Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kKz3AvThj2npUAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Feb 2026 03:46:12 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFFC13ACFF
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Feb 2026 03:46:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:To:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IXtSSnSc7cWdrGYkV1bPopcXr1r5TyVTGyLzBTGDQA8=; b=jwd1PEm35YFZ2vZ1xPpCTmbuq5
	jgwawaxdwvKSUeuecC68PmUb2zmJROIvfsJ3ef5nlZpukXg1KvURySmkfAsB87eV4UtmO3reb2YXa
	MVg4Q+d4fXc871E7Q8FvnsFgkdng6RijwTWl/EUhVAGVoyZOmrdtZLvmcr9cSWra7rFk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vr5fP-0004j8-NA;
	Sat, 14 Feb 2026 02:45:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vr5fO-0004iu-5O
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Feb 2026 02:45:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fmxGzBCl9SjY8gs8kQMNbmmQWJi/aFJLOUp7yTRMmYw=; b=EoE8pcdb4Z/LsbwT3Zrx9UP1sr
 1qS85cZEd2tdjP8HTHbn/ihxFneeqY2JDdS3LRFr077qU8iZ94yKcXa0WGKuI/EZobNOka3NoV+po
 Fjeg9z+uNvKD7YQcXbNNODmzbn4okdOkufO4zheNmdR+GySLnXWYSiIBLAW6lkY9Xbv4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fmxGzBCl9SjY8gs8kQMNbmmQWJi/aFJLOUp7yTRMmYw=; b=C
 YtCku1fiNU4su9/lT93BUWnvLYKmdMGBroWgjf6kwosuPCR0spFWxqtz2ExJKOysB/HKgMRsm2acl
 /S4jz4JghUTx6+AhmolOV5zdTo2WTn+hpgdS6eM0di4k1xAwgAeChthFNgMDVLTt3ggFQr92oH+a/
 ZAUb5Cz3p56M8VzM=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vr5fO-0003cq-9w for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Feb 2026 02:45:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id CE8BA406EB;
 Sat, 14 Feb 2026 02:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88EDAC116C6;
 Sat, 14 Feb 2026 02:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1771037143;
 bh=Cprpcf3MQJLqJyu2NM+Wgkl2K+e7s0rsC9kggQ8QHE4=;
 h=Date:From:To:Cc:Subject:From;
 b=tCBcekDdXj4PYOyicQ0R3KL6NyZ0rRTOZu/uLuvcc9Ls8BJEcmNAoS+NGfaZSV6Gg
 aAmwiYwSnkszb2U+Qde3ciOPYMIr2YP+2qSlznU3X/3LqDTlEMV4vz1Q0XNQZ/JYUB
 cIeHJgnCUxyWzGQkwQ35vSw+m2waoFB5cOc/Hq5+pcG+RlIfhODHZw7SpyOBJpPk5j
 J2MAjNe15Pkyd9vFVdGteIRU01Y0VYnE0tZ33bSFevE1q7gGhN162XP6fk1itK88Jn
 7DTjeHTDMofSZSMgd4tYlAwi/6ROZ4VO96XpogbslJR8TGzGML0CwEBzEwm4Z3gcdQ
 FPMaNI1wsz25Q==
Date: Sat, 14 Feb 2026 02:45:41 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <aY_h1URe0wsXKl84@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, Could you please consider this pull request? Thanks,
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vr5fO-0003cq-9w
Subject: [f2fs-dev] [GIT PULL] f2fs update for 7.0-rc1
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.21 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_ALL(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org]
X-Rspamd-Queue-Id: 3CFFC13ACFF
X-Rspamd-Action: no action

Hi Linus,

Could you please consider this pull request?

Thanks,

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-7.0-rc1

for you to fetch changes up to 52190933c37a96164b271f3f30c16099d9eb8c09:

  f2fs: sysfs: introduce critical_task_priority (2026-02-10 20:53:21 +0000)

----------------------------------------------------------------
f2fs-for-7.0-rc1

In this development cycle, we focused on several key performance optimizations:
1) introducing large folio support to enhance read speeds for immutable files,
2) reducing checkpoint=enable latency by flushing only committed dirty pages,
and 3) implementing tracepoints to diagnose and resolve lock priority inversion.
Additionally, we introduced the packed_ssa feature to optimize the SSA footprint
when utilizing large block sizes.

Enhancement:
 - support large folio for immutable non-compressed case
 - support non-4KB block size without packed_ssa feature
 - optimize f2fs_enable_checkpoint() to avoid long delay
 - optimize f2fs_overwrite_io() for f2fs_iomap_begin
 - optimize NAT block loading during checkpoint write
 - add write latency stats for NAT and SIT blocks in f2fs_write_checkpoint
 - pin files do not require sbi->writepages lock for ordering
 - avoid f2fs_map_blocks() for consecutive holes in readpages
 - flush plug periodically during GC to maximize readahead effect
 - add tracepoints to catch lock overheads
 - add several sysfs entries to tune internal lock priorities

Bug fix:
 - fix lock priority inversion issue
 - fix incomplete block usage in compact SSA summaries
 - fix to show simulate_lock_timeout correctly
 - fix to avoid mapping wrong physical block for swapfile
 - fix IS_CHECKPOINTED flag inconsistency issue caused by concurrent atomic
   commit and checkpoint writes
 - fix to avoid UAF in f2fs_write_end_io()

----------------------------------------------------------------
Chao Yu (33):
      f2fs: fix to do sanity check on nat entry of quota inode
      f2fs: add lock elapsed time trace facility for f2fs rwsemphore
      f2fs: sysfs: introduce max_lock_elapsed_time
      f2fs: trace elapsed time for cp_rwsem lock
      f2fs: trace elapsed time for node_change lock
      f2fs: trace elapsed time for node_write lock
      f2fs: trace elapsed time for gc_lock lock
      f2fs: trace elapsed time for cp_global_sem lock
      f2fs: trace elapsed time for io_rwsem lock
      f2fs: clean up w/ __f2fs_schedule_timeout()
      f2fs: fix to use jiffies based precision for DEFAULT_SCHEDULE_TIMEOUT
      f2fs: fix timeout precision of f2fs_io_schedule_timeout_killable()
      f2fs: rename FAULT_TIMEOUT to FAULT_ATOMIC_TIMEOUT
      f2fs: introduce FAULT_LOCK_TIMEOUT
      f2fs: sysfs: introduce inject_lock_timeout
      f2fs: fix to check sysfs filename w/ gc_pin_file_thresh correctly
      Revert "f2fs: block cache/dio write during f2fs_enable_checkpoint()"
      f2fs: fix to avoid UAF in f2fs_write_end_io()
      f2fs: make FAULT_DISCARD obsolete
      f2fs: fix to do sanity check on node footer in __write_node_folio()
      f2fs: fix to do sanity check on node footer in {read,write}_end_io
      f2fs: detect more inconsistent cases in sanity_check_node_footer()
      f2fs: avoid f2fs_map_blocks() for consecutive holes in readpages
      f2fs: fix to avoid mapping wrong physical block for swapfile
      f2fs: fix error path handling in f2fs_read_data_large_folio()
      f2fs: fix to unlock folio in f2fs_read_data_large_folio()
      f2fs: check skipped write in f2fs_enable_checkpoint()
      f2fs: introduce FAULT_SKIP_WRITE
      f2fs: fix to show simulate_lock_timeout correctly
      f2fs: decrease maximum flush retry count in f2fs_enable_checkpoint()
      f2fs: fix lock priority inversion issue
      f2fs: introduce trace_f2fs_priority_update
      f2fs: sysfs: introduce critical_task_priority

Daeho Jeong (3):
      f2fs: flush plug periodically during GC to maximize readahead effect
      f2fs: support non-4KB block size without packed_ssa feature
      f2fs: fix incomplete block usage in compact SSA summaries

Jaegeuk Kim (4):
      f2fs: support large folio for immutable non-compressed case
      f2fs: add a tracepoint to see large folio read submission
      f2fs: use folio_end_read
      Revert "f2fs: add timeout in f2fs_enable_checkpoint()"

Joanne Chang (1):
      f2fs: improve check for enough free sections

Nanzhe Zhao (4):
      f2fs: Zero f2fs_folio_state on allocation
      f2fs: Accounting large folio subpages before bio submission
      f2fs: add 'folio_in_bio' to handle readahead folios with no BIO submission
      f2fs: advance index and offset after zeroing in large folio read

Yangyang Zang (1):
      f2fs: clean up the type parameter in f2fs_sync_meta_pages()

Yeongjin Gil (1):
      f2fs: optimize f2fs_overwrite_io() for f2fs_iomap_begin

Yongpeng Yang (11):
      f2fs: clean up the force parameter in __submit_merged_write_cond()
      f2fs: return immediately after submitting the specified folio in __submit_merged_write_cond
      f2fs: remove non-uptodate folio from the page cache in move_data_block
      f2fs: fix out-of-bounds access in sysfs attribute read/write
      f2fs: change seq_file_ra_mul and max_io_bytes to unsigned int
      f2fs: fix IS_CHECKPOINTED flag inconsistency issue caused by concurrent atomic commit and checkpoint writes
      f2fs: avoid unnecessary block mapping lookups in f2fs_read_data_large_folio
      f2fs: pin files do not require sbi->writepages lock for ordering
      f2fs: add write latency stats for NAT and SIT blocks in f2fs_write_checkpoint
      f2fs: change size parameter of __has_cursum_space() to unsigned int
      f2fs: optimize NAT block loading during checkpoint write

ZhaoYueNan (1):
      f2fs: Update the default value of the documentation ckpt_thread_ioprio

Zhiguo Niu (2):
      f2fs: remove some redundant codes in f2fs_quota_enable
      f2fs: fix to add gc count stat in f2fs_gc_range

 Documentation/ABI/testing/sysfs-fs-f2fs |  62 ++++-
 Documentation/filesystems/f2fs.rst      |  49 +++-
 fs/f2fs/checkpoint.c                    | 247 ++++++++++++++++--
 fs/f2fs/compress.c                      |  18 +-
 fs/f2fs/data.c                          | 436 +++++++++++++++++++++++++++-----
 fs/f2fs/debug.c                         |   1 +
 fs/f2fs/f2fs.h                          | 251 +++++++++++++-----
 fs/f2fs/file.c                          |  84 +++---
 fs/f2fs/gc.c                            |  86 ++++---
 fs/f2fs/inline.c                        |  10 +-
 fs/f2fs/inode.c                         |  16 +-
 fs/f2fs/namei.c                         |  65 +++--
 fs/f2fs/node.c                          |  99 ++++++--
 fs/f2fs/node.h                          |   8 -
 fs/f2fs/recovery.c                      |  11 +-
 fs/f2fs/segment.c                       | 133 +++++-----
 fs/f2fs/segment.h                       | 108 ++++----
 fs/f2fs/super.c                         | 202 +++++++++------
 fs/f2fs/sysfs.c                         | 111 +++++++-
 fs/f2fs/xattr.c                         |   5 +-
 include/linux/f2fs_fs.h                 |  73 ++++--
 include/trace/events/f2fs.h             | 142 ++++++++++-
 22 files changed, 1671 insertions(+), 546 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
