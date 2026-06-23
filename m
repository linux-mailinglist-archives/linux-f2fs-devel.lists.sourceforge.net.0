Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id cTCnEbbLOmrMHAgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jun 2026 20:08:54 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F2FA6B95E0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Jun 2026 20:08:53 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=ElBKgs0n;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=cALwx5wU;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="a 3FIhgC";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=HoYS0ai9;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:To:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4NO0e4Iq8mMt3TMlPAzcvTJlZsZmxSOqzlsQASj0N2A=; b=ElBKgs0nZXgYhzEvjFJtxiCXO9
	/oqEKbNxRHEAj4IhTOf1uNmdheinDLn58F2hpCy+L/9ZKThU3p0zyuwcSiInONBvQa+eYCZkK9T6g
	qzEVCRvtp4LZmndT33eVFLX363n3jWukmnwZnMcijuno2Rs3rWaKOf4VoXuyXtb2n4xU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wc5Y8-0006Dj-Ot;
	Tue, 23 Jun 2026 18:08:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wc5Y6-0006Da-6j
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jun 2026 18:08:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E28GvbgFZJU4j1wSj4zi15k7SX9ARGcFit6CjnTXRTI=; b=cALwx5wUv/Jo56FrtdnbS8EiUM
 fiz9+JkDXIn7gtgZRojIqjatT12+4mghsVjIHNgMRiLGL2JX0bPj5dehdeIpdE/ZNuCxnQsf518zM
 S3r3FHDyrf0AbLwlGQ6b1N0yiUlFcxwotBESbJF9/0A+w5k+VoE+LmBOtDPdhXp+Aiq4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=E28GvbgFZJU4j1wSj4zi15k7SX9ARGcFit6CjnTXRTI=; b=a
 3FIhgCP4Z7I+EDpqCV6JRpC/Oes/3Jj9COWcnRP7LqpTvfbHU4AYA71OOkqF8XWx6gaId3/KpDuQr
 FCdW4DMdvF6uEMcVF0RjX6P44rPl2gPJTZFWdp0+eRqVFYSDFOdKqjuBfS0L4VqHt4puU4f+09NBJ
 5fWggChnBaZ7K5ug=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wc5Y2-0000NO-BQ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Jun 2026 18:08:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id AC8D360018;
 Tue, 23 Jun 2026 18:08:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47EDF1F000E9;
 Tue, 23 Jun 2026 18:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782238108;
 bh=E28GvbgFZJU4j1wSj4zi15k7SX9ARGcFit6CjnTXRTI=;
 h=Date:From:To:Cc:Subject;
 b=HoYS0ai9vczBs5bZHNchLIrClaPcyXUfrYoCYTgDN70iGH/XhVG2QFs3du+djTFNo
 cWvyyTo1I1U2r6+WEksnHimb0wTmrhuxCnsQUkH8eP7/421OkgyWPQVzGTfd7lb0YD
 pG3rghzcVJd3XbNMmwo0ltTtLCnXFgCx+LXHg/LXj2tDvJMazdPEprgw56YsoHJFp7
 Vptn2L2oQLqMhzaYSpjVbOhiGR3qia2oZQQ/+UIUHvoiJsplQ9G8+b9nUk6Jdjzw/V
 psqrEH/Ki1e+PR3xvkiBbpEP9nDcHJOm+X6b1t6kftIFl0rZUDMszzPebMicdo6Xkw
 RpodPULGlAckg==
Date: Tue, 23 Jun 2026 18:08:26 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <ajrLmn16uMPcc4Lv@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, Could you please consider this pull request? Given
 that the git history shows less than a day since the last update,
 it is completely
 fine to let it soak in -next for a bit. I submitted this because I [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wc5Y2-0000NO-BQ
Subject: [f2fs-dev] [GIT PULL] f2fs update for 7.2-rc1
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
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_MIXED(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 2F2FA6B95E0

Hi Linus,

Could you please consider this pull request? Given that the git history shows
less than a day since the last update, it is completely fine to let it soak in
-next for a bit. I submitted this because I needed to remove an old patch that
was incorrectly merged a while ago, and I wanted to clean up the tree.

The following changes since commit 70eda68668d1476b459b64e69b8f36659fa9dfa8:

  Merge tag 'hid-for-linus-2026051401' of git://git.kernel.org/pub/scm/linux/kernel/git/hid/hid (2026-05-14 14:30:01 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-7.2-rc1

for you to fetch changes up to 4275b59673eb60b02eec3997816c83f1f4b909c4:

  f2fs: fix to round down start offset of fallocate for pin file (2026-06-22 19:55:27 +0000)

----------------------------------------------------------------
f2fs-for-7.2-rc1

In this round, the changes primarily focus on filesystem error reporting,
reducing memory footprint by reverting in-memory data structures used for
runtime validation, honoring FDP hints, and adding trace and debug logs.
In addition, there are critical bug fixes resolving out-of-bounds read
vulnerabilities in inline directory and ACL handling, potential deadlocks
in balance_fs, use-after-free issues in atomic writes, and false data/node
type assignments in large sections.

Enhancement:
 - Revert  in-memory sit version and block bitmaps
 - support to report fserror
 - add trace_f2fs_fault_report
 - add iostat latency tracking for direct IO
 - add logs in f2fs_disable_checkpoint()
 - honor per-I/O write streams for direct writes
 - map data writes to FDP streams
 - skip inode folio lookup for cached overwrite
 - skip direct I/O iostat context when disabled
 - revert "check in-memory block bitmap"
 - revert "check in-memory sit version bitmap"

Bug fix:
 - optimize representative type determination in GC
 - fix incorrect FI_NO_EXTENT handling in __destroy_extent_node()
 - fix potential deadlock in f2fs_balance_fs()
 - fix potential deadlock in gc_merge path of f2fs_balance_fs()
 - atomic: fix UAF issue on f2fs_inode_info.atomic_inode
 - fix missing read bio submission on large folio error
 - pass correct iostat type for single node writes
 - fix to do sanity check on f2fs_get_node_folio_ra()
 - validate orphan inode entry count
 - keep atomic write retry from zeroing original data
 - read COW data with the original inode during atomic write
 - validate inline dentry name lengths before conversion
 - validate dentry name length before lookup compares it
 - reject setattr size changes on large folio files
 - revert "remove non-uptodate folio from the page cache in move_data_block"
 - validate ACL entry sizes in f2fs_acl_from_disk()
 - bound i_inline_xattr_size for non-inline-xattr inodes
 - fix listxattr handling of corrupted xattr entries
 - fix to round down start offset of fallocate for pin file

----------------------------------------------------------------
Bart Van Assche (3):
      f2fs: Prepare for supporting delayed bio completion
      f2fs: Rename f2fs_post_read_wq into f2fs_wq
      f2fs: Split f2fs_write_end_io()

Bryam Vargas (1):
      f2fs: bound i_inline_xattr_size for non-inline-xattr inodes

Cen Zhang (2):
      f2fs: annotate lockless last_time[] accesses
      f2fs: annotate lockless NAT counter reads

Chao Yu (13):
      f2fs: support to report fserror
      f2fs: doc: fix the wrong description for critical_task_priority
      f2fs: add logs in f2fs_disable_checkpoint()
      f2fs: fix potential deadlock in gc_merge path of f2fs_balance_fs()
      f2fs: atomic: fix UAF issue on f2fs_inode_info.atomic_inode
      Revert: "f2fs: check in-memory block bitmap"
      Revert: "f2fs: check in-memory sit version bitmap"
      f2fs: fix to do sanity check on f2fs_get_node_folio_ra()
      f2fs: fix wrong description in printed log
      f2fs: misc cleanup in f2fs_record_stop_reason()
      f2fs: avoid unnecessary sanity check on ckpt_valid_blocks
      f2fs: avoid unnecessary fscrypt_finalize_bounce_page()
      f2fs: remove unneeded f2fs_is_compressed_page()

Daeho Jeong (1):
      f2fs: optimize representative type determination in GC

Keshav Verma (1):
      f2fs: fix listxattr handling of corrupted xattr entries

Mikhail Lobanov (1):
      f2fs: read COW data with the original inode during atomic write

Ruipeng Qi (1):
      f2fs: fix potential deadlock in f2fs_balance_fs()

Samuel Moelius (2):
      f2fs: validate inline dentry name lengths before conversion
      f2fs: validate dentry name length before lookup compares it

Sunmin Jeong (1):
      f2fs: fix to round down start offset of fallocate for pin file

Wenjie Qi (11):
      f2fs: map data writes to FDP streams
      f2fs: fix missing read bio submission on large folio error
      f2fs: pass correct iostat type for single node writes
      f2fs: validate compress cache inode only when enabled
      f2fs: avoid false shutdown fserror reports
      f2fs: honor per-I/O write streams for direct writes
      f2fs: validate orphan inode entry count
      f2fs: keep atomic write retry from zeroing original data
      f2fs: skip inode folio lookup for cached overwrite
      f2fs: reject setattr size changes on large folio files
      f2fs: skip direct I/O iostat context when disabled

Yongpeng Yang (1):
      f2fs: fix incorrect FI_NO_EXTENT handling in __destroy_extent_node()

Zhang Cen (1):
      f2fs: validate ACL entry sizes in f2fs_acl_from_disk()

Zhaoyang Huang (1):
      Revert "f2fs: remove non-uptodate folio from the page cache in move_data_block"

liujinbao1 (2):
      f2fs: Add trace_f2fs_fault_report
      f2fs: add iostat latency tracking for direct IO

 Documentation/ABI/testing/sysfs-fs-f2fs |   5 +-
 Documentation/filesystems/f2fs.rst      |   9 +++
 fs/f2fs/acl.c                           |  18 ++++-
 fs/f2fs/checkpoint.c                    |  14 +++-
 fs/f2fs/compress.c                      |  10 ++-
 fs/f2fs/data.c                          | 133 ++++++++++++++++++++++----------
 fs/f2fs/dir.c                           |   7 ++
 fs/f2fs/extent_cache.c                  |  19 ++---
 fs/f2fs/f2fs.h                          |  39 +++++++---
 fs/f2fs/file.c                          |  75 +++++++++++++++++-
 fs/f2fs/gc.c                            |  69 +++++++++++++----
 fs/f2fs/inline.c                        |  10 +++
 fs/f2fs/inode.c                         |  31 ++++++--
 fs/f2fs/node.c                          |  22 +++++-
 fs/f2fs/node.h                          |   8 +-
 fs/f2fs/recovery.c                      |   2 +
 fs/f2fs/segment.c                       |  75 ++++++------------
 fs/f2fs/segment.h                       |  22 ------
 fs/f2fs/super.c                         |  72 +++++++++++++++--
 fs/f2fs/sysfs.c                         |   2 +
 fs/f2fs/verity.c                        |   2 +
 fs/f2fs/xattr.c                         |  12 ++-
 include/linux/f2fs_fs.h                 |   1 +
 include/trace/events/f2fs.h             |  28 +++++++
 24 files changed, 502 insertions(+), 183 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
