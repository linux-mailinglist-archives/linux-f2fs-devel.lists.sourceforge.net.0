Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id guTwOTeTImqwaQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 05 Jun 2026 11:13:27 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F2704646BF7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 05 Jun 2026 11:13:26 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=G5oD7MDp;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=RHVKlAWA;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=XBmeXUCj;
	dkim=fail ("body hash did not verify") header.d=samsung.com header.s=mail20170921 header.b=Hnl2i44g;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=samsung.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:
	List-Id:Subject:References:Date:Message-ID:In-Reply-To:To:From:Mime-Version:
	Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4EgYioq6Uq4K00BE9PPp11SMP3SBXCOxYeou9vkOOPc=; b=G5oD7MDpaz2fCUC9cGAmRupfQs
	KC1VwdLuYA9FAuVJbtuq1ek+qYm3z5TwWXmKEsRpP9D8k9lbe2h7c6rHcejPN8j4XM3ZOGYOjWjT6
	/AW6pb73uG4IzPLqL2gfyBAZ2Mghc1z715xd+RKYAh8vVkZQk7gNhGMOEkPdOn3HKVl8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wVQcF-00071j-5w;
	Fri, 05 Jun 2026 09:13:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daejun7.park@samsung.com>) id 1wVQcD-00071b-T4
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Jun 2026 09:13:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cY3mgHZ58rCY+aIK6fkmiLKJRn9JHZyHBWcC5lvPPiE=; b=RHVKlAWA0Bsx8fYw1wCoHYz++M
 qVRrcKqq1xkdixmyjtD+T5aA6JqNGz2/wOKMyHSwquQPt/5B8S23ro3bQz/tGs19Bp+YZpT8gZDRv
 8w2HrEp9TsG0K/yD2qn0CLElHMLZL3smyBy6YdjlbCvF9UHYe62DAOIjKXazdJl/qWio=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cY3mgHZ58rCY+aIK6fkmiLKJRn9JHZyHBWcC5lvPPiE=; b=XBmeXUCj7JhnO7dpRUrZLlUr3R
 A3bdtMLSd5lMnYtVnO6TZRKrYnKLVyTnGtXe16roqR+HN9vb+sBCn+5cMZBlEmT7LR7yUn6qWytXG
 X3sBPVs5Lqf3QTaA+6RF1PjG/ME6pQT18KCiYg3KbUglDIoVERLh9gbRnM3T1mScxBwY=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wVQc9-0000fX-Tm for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Jun 2026 09:13:22 +0000
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20260605091311epoutp04d8befa9f7b7cb6a316fa2ea278897718~2JHXoLOCt1650116501epoutp04e
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  5 Jun 2026 09:13:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20260605091311epoutp04d8befa9f7b7cb6a316fa2ea278897718~2JHXoLOCt1650116501epoutp04e
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1780650791;
 bh=cY3mgHZ58rCY+aIK6fkmiLKJRn9JHZyHBWcC5lvPPiE=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=Hnl2i44g1swaKypDNXV4vf8zcdgwkX2uQ/+O0MqxOyGktJqvFRgNrXlgugjuNJfqP
 ZaDBZHDCZ727TaU01i55B/ECHc3KJNX8hKEwkYd7BO9yDB25tPI1ghm2sf8GHSDdv5
 l+KNJ7IbrxmOxHv3+MUTboPrPPCsQt9kueJ0ouyM=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
 epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
 20260605091310epcas2p4442dc31855c4029a04717125919147ab~2JHW-IZV-1881018810epcas2p4C;
 Fri,  5 Jun 2026 09:13:10 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.38.211]) by
 epsnrtp01.localdomain (Postfix) with ESMTP id 4gWwhQ3TQyz6B9m6; Fri,  5 Jun
 2026 09:13:10 +0000 (GMT)
Mime-Version: 1.0
From: Daejun Park <daejun7.park@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <20260605091229epcms2p406d0a66d4fa12ba1d77bc668ebcfe352@epcms2p4>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20260605091310epcms2p7e1130728968307f799403ef00ee38ba6@epcms2p7>
Date: Fri, 05 Jun 2026 18:13:10 +0900
X-CMS-MailID: 20260605091310epcms2p7e1130728968307f799403ef00ee38ba6
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-223,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260605091139epcms2p2b17a6e7962b7c9b8fb058e1c55cd4dba
References: <20260605091229epcms2p406d0a66d4fa12ba1d77bc668ebcfe352@epcms2p4>
 <20260605091139epcms2p2b17a6e7962b7c9b8fb058e1c55cd4dba@epcms2p2>
 <CGME20260605091139epcms2p2b17a6e7962b7c9b8fb058e1c55cd4dba@epcms2p7>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The legacy FG_GC path migrates a victim section's valid
 blocks
 in source segment-offset order: blocks of several inodes that were interleaved
 in each source segment are migrated to the destination cur [...] 
 Content analysis details:   (-0.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wVQc9-0000fX-Tm
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: pack same-inode blocks by inode
 during FG_GC
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
Reply-To: daejun7.park@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.01 / 15.00];
	MV_CASE(0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	DMARC_POLICY_SOFTFAIL(0.10)[samsung.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[daejun7.park@samsung.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	HAS_X_PRIO_THREE(0.00)[3];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,samsung.com:s=mail20170921];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,samsung.com:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daejun7.park@samsung.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[daejun7.park@samsung.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[samsung.com:email,samsung.com:from_mime,samsung.com:replyto,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: F2704646BF7

The legacy FG_GC path migrates a victim section's valid blocks in
source segment-offset order: blocks of several inodes that were
interleaved in each source segment are migrated to the destination
curseg in the same interleaved order, carrying source-side
fragmentation forward into the post-GC layout regardless of section
size.

Pack the migration order by inode for every victim section:

  * gc_data_segment()'s phase 3 records each valid block on a
    per-inode gc_blocks list hanging off the inode_entry that
    add_gc_inode() already creates in gc_list.  Each gc_block
    carries the source segno, nofs, ofs_in_node and per-segment off
    so the deferred migration can rebuild start_bidx and pass the
    correct segno to check_valid_map() inside the existing
    do_migrate_one_data_block() helper.

  * Phase 4 of gc_data_segment() is gated by nr_phases: in packing
    mode nr_phases caps the loop at 4 (phases 0..3), so the summary
    block is not re-scanned just to hit a per-slot 'continue'.  The
    phase 4 migration body is reached only via the new 'goto
    do_migrate' fallback path described below, in which case the
    inode_entry just returned by add_gc_inode() is reused instead of
    repeating find_gc_inode().

  * do_garbage_collect() invokes pack_gc_section() once, after every
    source segment of the victim section has been parsed.  Walking
    gc_list->ilist in inode order emits all of one inode's blocks
    contiguously to the destination curseg.  On large sections this
    lets an inode's blocks span the full SEGS_PER_SEC *
    usable_blks_in_seg destination range.

  * Because migration is deferred past gc_data_segment()'s
    per-segment loop, the in-loop 'freed:' check can no longer
    observe the emptied source segments: at that point the source is
    still fully valid.  do_garbage_collect() therefore skips the
    in-loop seg_freed count when packing and, after the pack pass,
    recomputes seg_freed across the scanned segment range.  Without
    this, FG_GC reports seg_freed == 0 for a fully packed section, so
    f2fs_gc() never counts the section as reclaimed, has_enough_free_secs()
    keeps looping, and a sync F2FS_IOC_GC returns -EAGAIN despite
    having freed the space.

  * i_gc_rwsem is taken and released per block inside the packing
    pass (via do_migrate_one_data_block), matching the legacy
    phase 4 lock-holding window so concurrent user IO sees no
    additional latency.

Activation conditions:
  * sbi->gc_inode_local_packing == true (sysfs writable, accepts
    only 0 or 1; default derived from __is_large_section(sbi) since
    the gain on a single-segment section is marginal and adds memory
    pressure with little return)
  * gc_type == FG_GC; BG_GC's move_data_page() path defers
    destination allocation to the writeback flusher, so any
    reordering applied during GC is lost.

Race against the sysfs knob: gc_inode_local_packing is unsynchronised.
Re-reading it from phase 3 (enqueue), phase 4 (skip) and the pack
pass independently would let a concurrent toggle queue blocks via
gc_blocks and then bypass pack_gc_section().  do_garbage_collect()
snapshots the value into a local 'pack_by_inode' bool and threads it
through gc_data_segment() and the packing call so all three sites
remain consistent for the entire section.

On the freezing 'goto stop' path the pack pass is skipped; the queued
records are freed un-migrated by put_gc_inode(), and next_victim_seg is
cleared (NULL_SEGNO) so the next FG_GC re-selects a victim by search
rather than resuming past the still-valid source segments whose blocks
were just dropped.

Per-block records are allocated from a dedicated f2fs_gc_block slab
(via f2fs_kmem_cache_create) rather than kmalloc(GFP_NOFS).  To bound
the transient footprint, the queue is drained early once it reaches
MAX_GC_PACK_BLOCKS (4096, ~128 KiB at 32 B per gc_block) instead of
holding an entire section's worth of records before the first write:
ordinary sections stay under the cap and pack in a single pass, while
a pathologically large section drains in batches.  A per-cache
slabinfo line and FAULT_SLAB_ALLOC coverage of the fallback path are
useful for diagnostics.

Allocation failure falls through to 'goto do_migrate', the same
phase 4 body the !pack_by_inode path uses, so the block is migrated
immediately rather than dropped.  This costs the packing benefit
for the one block but preserves FG_GC progress under memory
pressure, which matters more when FG_GC is called precisely
because the system is short on free sections.

Measurements (QEMU virtio guest, 4-cycle fragmentation, gc_urgent
40s, filefrag total extents before/after GC; structural counters
only since QEMU virtio BW/lat is unreliable):

  Large section (mkfs.f2fs -s 32 = 64 MiB section,
                 64 files x 4 MiB):
    legacy   65536 -> 65536    0 %  reduction
    packed   65536 -> 49170   24 %  reduction (-16366 extents)

  Default section (mkfs.f2fs -s 1 = 2 MiB section,
                   128 files x 256 KiB):
    legacy    8192 ->  8192    0 %  reduction
    packed    8192 ->  7690    6 %  reduction
    GC work (move_blks, cp_blks, gc_calls) identical between modes;
    the packing only reorders dest curseg writes.

  Natural FG_GC under tight cold migration
  (mkfs.f2fs -s 32, 2 GiB disk 90 % fill,
   6 hot x 200 MiB + 6 cold x 100 MiB interleaved fill,
   background_gc=sync, 300 s hot rewrite):
    legacy   cold extents 350 -> 357 (delta +7,  no improvement)
    packed   cold extents 350 -> 132 (delta -218, -63 %  reduction)
    per user iter:
      move_blks         legacy 42344  packed 34822  (-18 %)
      cp_blocks         legacy 23.90  packed 22.95  (-4  %)
      skipped_gc_rwsem  legacy 108    packed   44   (-59 %)
    hot rewrite iters in fixed 300 s window:  +45 %

seg_freed accounting regression test (QEMU guest, mkfs.f2fs -s 4,
400 x 1 MiB files written sequentially so each 2 MiB segment holds
exactly two files, every even-indexed file deleted so each data
segment is ~50 % valid with no trivially-empty segment -- forcing
GC to free sections by migration, the path this commit defers).
Forced sync F2FS_IOC_GC x24 plus gc_urgent, packing OFF vs ON:

    metric (sum over FG_GC)      packing OFF   packing ON
    f2fs_gc_end seg_freed             152          152
    f2fs_gc_end sec_freed              38           38
    F2FS_IOC_GC(sync) successes        24           24
    data integrity (sha256)            OK           OK

  Without the deferred-migration seg_freed recompute the ON column
  collapses to seg_freed/sec_freed = 0 and all 24 ioctls return
  -EAGAIN, which is the regression this test guards against.

Sanity verified in QEMU guest (mkfs.f2fs -s 8, 16 x 4 MiB files,
gc_urgent + remount): data sha256 matches before and after GC; no
WARN/BUG in dmesg; gc_inode_local_packing knob exposed under
/sys/fs/f2fs/<disk>/.  An additional stress run on mkfs.f2fs -s 32
with FAULT_SLAB_ALLOC at inject_rate=4 triggered 7689 slab alloc
failures during FG_GC, exercising the 'goto do_migrate' fallback;
sha256 was preserved and dmesg stayed clean.

Signed-off-by: Daejun Park <daejun7.park@samsung.com>
---
v2:
 - recompute seg_freed over the scanned segment range after
   pack_gc_section(): the deferred migration meant the in-loop 'freed:'
   check saw the source still valid, so seg_freed stayed 0 and a packed
   section was never counted as reclaimed (sync F2FS_IOC_GC -> -EAGAIN).
 - clear next_victim_seg on the freezing 'goto stop' path, since the
   blocks queued for the section are dropped un-migrated there.
 - bound the packing queue with MAX_GC_PACK_BLOCKS and drain early once
   the cap is hit, instead of holding a whole section's gc_block records.
 - rebased onto current f2fs/dev.

 Documentation/ABI/testing/sysfs-fs-f2fs |  10 ++
 fs/f2fs/f2fs.h                          |   7 +-
 fs/f2fs/gc.c                            | 162 ++++++++++++++++++++++--
 fs/f2fs/gc.h                            |   1 +
 fs/f2fs/super.c                         |   1 +
 fs/f2fs/sysfs.c                         |   7 +
 6 files changed, 176 insertions(+), 12 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 1b58c029a..1085af8f6 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -1002,3 +1002,13 @@ Description:	It can be used to tune priority of f2fs critical task, e.g. f2fs_ck
 		threads, limitation as below:
 		- it requires user has CAP_SYS_NICE capability.
 		- the range is [100, 139], by default the value is 120.
+
+What:		/sys/fs/f2fs/<disk>/gc_inode_local_packing
+Date:		May 2026
+Contact:	Daejun Park <daejun7.park@samsung.com>
+Description:	When set to 1, foreground GC packs valid blocks of the same
+		inode contiguously into the destination curseg, in addition to
+		(rather than within) source segment-offset order.  Effective
+		only under FG_GC; BG_GC's writeback-deferred destination
+		allocation is unaffected.  Default is 1 on large sections
+		(SEGS_PER_SEC > 1), 0 otherwise.  Set to 0 to disable.
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 9f24287de..5d5fe6d98 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -404,8 +404,9 @@ struct ino_entry {
 
 /* for the list of inodes to be GCed */
 struct inode_entry {
-	struct list_head list;	/* list head */
-	struct inode *inode;	/* vfs inode pointer */
+	struct list_head list;		/* list head */
+	struct inode *inode;		/* vfs inode pointer */
+	struct list_head gc_blocks;	/* per-inode block list for GC packing */
 };
 
 struct fsync_node_entry {
@@ -1907,6 +1908,8 @@ struct f2fs_sb_info {
 	unsigned int migration_granularity;
 	/* migration window granularity of garbage collection, unit: segment */
 	unsigned int migration_window_granularity;
+	/* pack same-inode blocks together during FG_GC migration */
+	bool gc_inode_local_packing;
 
 	/*
 	 * for stat information.
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index e232dff72..af58ebfc9 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -24,6 +24,24 @@
 #include <trace/events/f2fs.h>
 
 static struct kmem_cache *victim_entry_slab;
+static struct kmem_cache *gc_block_slab;
+
+/* Per-block migration record for inode-local packing under FG_GC. */
+struct gc_block {
+	struct list_head list;
+	unsigned int segno;		/* source segment for check_valid_map() */
+	unsigned int nofs;
+	unsigned int ofs_in_node;
+	int off;
+};
+
+/*
+ * Upper bound on blocks held on the per-inode packing queue before a
+ * partial drain.  Caps the transient gc_block slab footprint on very
+ * large victim sections; ordinary sections stay under it and pack in a
+ * single pass.
+ */
+#define MAX_GC_PACK_BLOCKS	4096
 
 static unsigned int count_bits(const unsigned long *addr,
 				unsigned int offset, unsigned int len);
@@ -1004,6 +1022,7 @@ static struct inode_entry *add_gc_inode(struct gc_inode_list *gc_list,
 	new_ie = f2fs_kmem_cache_alloc(f2fs_inode_entry_slab,
 					GFP_NOFS, true, NULL);
 	new_ie->inode = inode;
+	INIT_LIST_HEAD(&new_ie->gc_blocks);
 
 	f2fs_radix_tree_insert(&gc_list->iroot, inode->i_ino, new_ie);
 	list_add_tail(&new_ie->list, &gc_list->ilist);
@@ -1013,8 +1032,13 @@ static struct inode_entry *add_gc_inode(struct gc_inode_list *gc_list,
 static void put_gc_inode(struct gc_inode_list *gc_list)
 {
 	struct inode_entry *ie, *next_ie;
+	struct gc_block *e, *tmp_e;
 
 	list_for_each_entry_safe(ie, next_ie, &gc_list->ilist, list) {
+		list_for_each_entry_safe(e, tmp_e, &ie->gc_blocks, list) {
+			list_del(&e->list);
+			kmem_cache_free(gc_block_slab, e);
+		}
 		radix_tree_delete(&gc_list->iroot, ie->inode->i_ino);
 		iput(ie->inode);
 		list_del(&ie->list);
@@ -1646,7 +1670,7 @@ static int do_migrate_one_data_block(struct f2fs_sb_info *sbi,
  */
 static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 		struct gc_inode_list *gc_list, unsigned int segno, int gc_type,
-		bool force_migrate, struct blk_plug *plug)
+		bool force_migrate, bool pack_by_inode, struct blk_plug *plug)
 {
 	struct super_block *sb = sbi->sb;
 	struct f2fs_summary *entry;
@@ -1655,6 +1679,8 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	int phase = 0;
 	int submitted = 0;
 	unsigned int usable_blks_in_seg = f2fs_usable_blks_in_seg(sbi, segno);
+	/* packing path skips phase 4; pack_gc_section() handles migration */
+	int nr_phases = pack_by_inode ? 4 : 5;
 
 	start_addr = START_BLOCK(sbi, segno);
 
@@ -1663,6 +1689,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 
 	for (off = 0; off < usable_blks_in_seg; off++, entry++) {
 		struct inode *inode;
+		struct inode_entry *ie = NULL;
 		struct node_info dni; /* dnode info for the data */
 		unsigned int ofs_in_node, nofs;
 		block_t start_bidx;
@@ -1705,6 +1732,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 
 		if (phase == 3) {
 			struct folio *data_folio;
+			struct gc_block *e;
 			int err;
 
 			inode = f2fs_iget(sb, dni.ino);
@@ -1751,8 +1779,10 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 					iput(inode);
 					continue;
 				}
-				add_gc_inode(gc_list, inode);
-				continue;
+				ie = add_gc_inode(gc_list, inode);
+				if (!pack_by_inode)
+					continue;
+				goto queue;
 			}
 
 			data_folio = f2fs_get_read_data_folio(inode, start_bidx,
@@ -1764,18 +1794,38 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 			}
 
 			f2fs_folio_put(data_folio, false);
-			add_gc_inode(gc_list, inode);
+			ie = add_gc_inode(gc_list, inode);
+			if (!pack_by_inode)
+				continue;
+queue:
+			e = f2fs_kmem_cache_alloc(gc_block_slab, GFP_NOFS,
+						  false, sbi);
+			if (!e)
+				goto do_migrate;	/* alloc fail: migrate now */
+			e->segno = segno;
+			e->nofs = nofs;
+			e->ofs_in_node = ofs_in_node;
+			e->off = off;
+			list_add_tail(&e->list, &ie->gc_blocks);
+			gc_list->nr_gc_blocks++;
 			continue;
 		}
 
-		/* phase 4 */
-		inode = find_gc_inode(gc_list, dni.ino);
+		/*
+		 * phase 4: legacy per-segment migration.  Capped out by
+		 * nr_phases when packing is on; reached only via the
+		 * 'goto do_migrate' fallback above, in which case @ie is
+		 * the entry add_gc_inode() just returned and we reuse it
+		 * instead of repeating the radix-tree lookup.
+		 */
+do_migrate:
+		inode = ie ? ie->inode : find_gc_inode(gc_list, dni.ino);
 		if (inode)
 			submitted += do_migrate_one_data_block(sbi, inode,
 					segno, off, nofs, ofs_in_node, gc_type);
 	}
 
-	if (++phase < 5) {
+	if (++phase < nr_phases) {
 		blk_finish_plug(plug);
 		blk_start_plug(plug);
 		goto next_step;
@@ -1784,6 +1834,32 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 	return submitted;
 }
 
+/*
+ * pack_gc_section - migrate all gc_blocks queued for this victim section,
+ * grouped by inode.  gc_list->ilist is walked in insertion order so
+ * destination curseg writes form inode-contiguous runs that span every
+ * source segment of the section.
+ */
+static int pack_gc_section(struct f2fs_sb_info *sbi,
+			   struct gc_inode_list *gc_list, int gc_type)
+{
+	struct inode_entry *ie;
+	struct gc_block *e, *tmp;
+	int submitted = 0;
+
+	list_for_each_entry(ie, &gc_list->ilist, list) {
+		list_for_each_entry_safe(e, tmp, &ie->gc_blocks, list) {
+			submitted += do_migrate_one_data_block(sbi, ie->inode,
+					e->segno, e->off, e->nofs,
+					e->ofs_in_node, gc_type);
+			list_del(&e->list);
+			kmem_cache_free(gc_block_slab, e);
+		}
+	}
+	gc_list->nr_gc_blocks = 0;
+	return submitted;
+}
+
 static int __get_victim(struct f2fs_sb_info *sbi, unsigned int *victim,
 			int gc_type, bool one_time)
 {
@@ -1810,6 +1886,13 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 	unsigned char type;
 	unsigned char data_type;
 	int submitted = 0, sum_blk_cnt;
+	/*
+	 * Snapshot the packing knob once for this section.  Re-reading the
+	 * sysfs-writable bool from phase 3, phase 4 and the pack pass would
+	 * let a concurrent toggle queue blocks via add_gc_block() and then
+	 * bypass pack_gc_section(), losing this cycle of migration.
+	 */
+	bool pack_by_inode = sbi->gc_inode_local_packing && gc_type == FG_GC;
 
 	if (__is_large_section(sbi)) {
 		sec_end_segno = rounddown(end_segno, SEGS_PER_SEC(sbi));
@@ -1938,14 +2021,20 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 			else
 				submitted += gc_data_segment(sbi, sum->entries,
 						gc_list, cur_segno,
-						gc_type, force_migrate, &plug);
+						gc_type, force_migrate,
+						pack_by_inode, &plug);
 
 			stat_inc_gc_seg_count(sbi, data_type, gc_type);
 			sbi->gc_reclaimed_segs[sbi->gc_mode]++;
 			migrated++;
 
 freed:
-			if (gc_type == FG_GC &&
+			/*
+			 * Packing defers migration to pack_gc_section() after
+			 * this loop, so the source segment is still fully valid
+			 * here; seg_freed is recomputed below the stop: label.
+			 */
+			if (!pack_by_inode && gc_type == FG_GC &&
 					get_valid_blocks(sbi, cur_segno, false) == 0)
 				seg_freed++;
 
@@ -1956,20 +2045,64 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 
 			if (unlikely(freezing(current))) {
 				folio_put_refs(sum_folio, 2);
+				/*
+				 * Packing deferred this section's migration to
+				 * pack_gc_section(), which the goto stop below
+				 * skips, so blocks queued but not yet drained
+				 * are dropped un-migrated.  Clear the in-section
+				 * victim hint so the next FG_GC re-selects via a
+				 * clean search instead of skipping the still
+				 * valid source segments.
+				 */
+				if (pack_by_inode && __is_large_section(sbi))
+					sbi->next_victim_seg[gc_type] = NULL_SEGNO;
 				goto stop;
 			}
+
+			/*
+			 * Bound the transient gc_block footprint on very large
+			 * sections: drain once the packing queue grows past
+			 * MAX_GC_PACK_BLOCKS rather than holding the whole
+			 * section before migrating anything.
+			 */
+			if (pack_by_inode &&
+				gc_list->nr_gc_blocks >= MAX_GC_PACK_BLOCKS)
+				submitted += pack_gc_section(sbi, gc_list,
+								gc_type);
 		}
 next_block:
 		folio_put_refs(sum_folio, 2);
 		segno = block_end_segno;
 	}
 
+	/*
+	 * Drain whatever is still queued for this section.  Skipped on the
+	 * freezing 'goto stop' path: leftover entries are freed un-migrated
+	 * by put_gc_inode() in f2fs_gc().
+	 */
+	if (pack_by_inode)
+		submitted += pack_gc_section(sbi, gc_list, gc_type);
+
 stop:
 	if (submitted)
 		f2fs_submit_merged_write(sbi, data_type);
 
 	blk_finish_plug(&plug);
 
+	/*
+	 * Packing deferred migration past the per-segment loop, so the
+	 * in-loop freed: check could not observe the emptied source segments
+	 * (and on the freezing path some queued blocks were dropped).  Count
+	 * the segments that are actually free now over the scanned range.
+	 */
+	if (pack_by_inode) {
+		unsigned int seg;
+
+		for (seg = start_segno; seg < end_segno; seg++)
+			if (get_valid_blocks(sbi, seg, false) == 0)
+				seg_freed++;
+	}
+
 	if (migrated)
 		stat_inc_gc_sec_count(sbi, data_type, gc_type);
 
@@ -2139,11 +2272,20 @@ int __init f2fs_create_garbage_collection_cache(void)
 {
 	victim_entry_slab = f2fs_kmem_cache_create("f2fs_victim_entry",
 					sizeof(struct victim_entry));
-	return victim_entry_slab ? 0 : -ENOMEM;
+	if (!victim_entry_slab)
+		return -ENOMEM;
+	gc_block_slab = f2fs_kmem_cache_create("f2fs_gc_block",
+					sizeof(struct gc_block));
+	if (!gc_block_slab) {
+		kmem_cache_destroy(victim_entry_slab);
+		return -ENOMEM;
+	}
+	return 0;
 }
 
 void f2fs_destroy_garbage_collection_cache(void)
 {
+	kmem_cache_destroy(gc_block_slab);
 	kmem_cache_destroy(victim_entry_slab);
 }
 
diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
index 6c4d45675..f0541d0b7 100644
--- a/fs/f2fs/gc.h
+++ b/fs/f2fs/gc.h
@@ -75,6 +75,7 @@ struct f2fs_gc_kthread {
 struct gc_inode_list {
 	struct list_head ilist;
 	struct radix_tree_root iroot;
+	unsigned int nr_gc_blocks;	/* blocks queued for inode-local packing */
 };
 
 struct victim_entry {
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 87f816f01..d2dc5a2b6 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4363,6 +4363,7 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	sbi->migration_granularity = SEGS_PER_SEC(sbi);
 	sbi->migration_window_granularity = f2fs_sb_has_blkzoned(sbi) ?
 		DEF_MIGRATION_WINDOW_GRANULARITY_ZONED : SEGS_PER_SEC(sbi);
+	sbi->gc_inode_local_packing = __is_large_section(sbi);
 	sbi->seq_file_ra_mul = MIN_RA_MUL;
 	sbi->max_fragment_chunk = DEF_FRAGMENT_SIZE;
 	sbi->max_fragment_hole = DEF_FRAGMENT_SIZE;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 665687244..30a3beb60 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -659,6 +659,11 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 			return -EINVAL;
 	}
 
+	if (!strcmp(a->attr.name, "gc_inode_local_packing")) {
+		if (t > 1)
+			return -EINVAL;
+	}
+
 	if (!strcmp(a->attr.name, "gc_urgent")) {
 		if (t == 0) {
 			sbi->gc_mode = GC_NORMAL;
@@ -1269,6 +1274,7 @@ F2FS_SBI_RW_ATTR(gc_reclaimed_segments, gc_reclaimed_segs);
 F2FS_SBI_GENERAL_RW_ATTR(max_victim_search);
 F2FS_SBI_GENERAL_RW_ATTR(migration_granularity);
 F2FS_SBI_GENERAL_RW_ATTR(migration_window_granularity);
+F2FS_SBI_GENERAL_RW_ATTR(gc_inode_local_packing);
 F2FS_SBI_GENERAL_RW_ATTR(dir_level);
 F2FS_SBI_GENERAL_RW_ATTR(allocate_section_hint);
 F2FS_SBI_GENERAL_RW_ATTR(allocate_section_policy);
@@ -1438,6 +1444,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(max_victim_search),
 	ATTR_LIST(migration_granularity),
 	ATTR_LIST(migration_window_granularity),
+	ATTR_LIST(gc_inode_local_packing),
 	ATTR_LIST(dir_level),
 	ATTR_LIST(ram_thresh),
 	ATTR_LIST(ra_nid_pages),
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
