Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CH5BO7w52mhCwIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Apr 2026 23:49:34 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DCBD43FDF2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Apr 2026 23:49:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:To:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=34RB91Uj1aj/r4Y5rwvslvRo3sT0mkgkPuZD9zL4vVo=; b=ktsGLQI5PisBxhY9UgZG6YAYii
	nDDOeu8kanC+kGBp6wmh+FXGlWjDLrBO+wMBzeGEhILMp47uWoN9dW07dDPljKYb2xjgw1Ao0jAFP
	OsBT2vbxNjdrgOy3UJzny7w6caaxQ1GCFuswrcRHzOAK+QzLLJgz0yQvs+qopmk17tck=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wFIyK-0004P9-Ez;
	Tue, 21 Apr 2026 21:49:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wFIyI-0004P2-GJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Apr 2026 21:49:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sI7B2qwYK2px9shzd9dW3cp4J2qj6hI2DwyeAFOz6cw=; b=hquGeeRewliGHfDAFgf/JjAbOl
 Ha1SvbPsDwvEjjDesyLJVDTdP9Cfo7VtIQc1wQNoM41AKlGohrHyok6x+ykVaLEdrDW0AbQaKsXCm
 tFCVowSIgVWOSN34KZzlZdMzb3m+EavVNvsA0y5o+CwGEtdN4NiRPJw4QeHM8A+Oh6yc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=sI7B2qwYK2px9shzd9dW3cp4J2qj6hI2DwyeAFOz6cw=; b=T
 tOxotWKb6Haz7Dgg8t8GvnId62QBV7mg2BS3Kb1iSvcTsZ+m6sSrg+NMK0MQh8kpenaK6nTn037Vj
 gnP9Q9prNRfBkq2Cnbn2KO/WMeIWbor7hYJwjkTXlvAT7wf1Z74YgIx+GLOb2CftByEgChICxRI/R
 d2ZI535pV7pOBx7Q=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wFIyF-0005ZW-Ct for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 21 Apr 2026 21:49:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id AFD6F61339;
 Tue, 21 Apr 2026 21:49:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49393C2BCB0;
 Tue, 21 Apr 2026 21:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776808156;
 bh=Lff42r7XhGDr0FLU9Y4QqnMEAZNEmPewvova1hONyow=;
 h=Date:From:To:Cc:Subject:From;
 b=TSzU6b8qIGpGfmBlz5Q8+W2WgZYhFluG4uXu3Ys8/X+bUXtECUD7EMhFGFpFh540/
 WJEIRatJzpK0AjQAgtPHInV1sw1eoLhw+D4Jau+plPkeMFG4EFiahS3gwvf9+06FOV
 LNW+Fu26RyESWElHhPGw+GrxuV3VjFHG/FdxyzOLyUGkPpEaXI8drLrHPaC9rU4Vqu
 pzd0InjAKIuBo2G6+n5RwJX369lvp3omOmKKiHPNcX2drKK8oHgXNMZ/zLOYXht4F4
 6k4CFOvaJpoU26xeIDGe3liiyKNKnwv+kiIFH6bfn1SPGU/8so0iWRZ8CFbTyUFZ2c
 0sTBqS5qfuyiA==
Date: Tue, 21 Apr 2026 21:49:14 +0000
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <aefw2uZrM9f-UfRa@google.com>
MIME-Version: 1.0
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Linus, Could you please consider this pull requeset? The
 following changes since commit e3c33bc767b5512dbfec643a02abf58ce608f3b2: 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wFIyF-0005ZW-Ct
Subject: [f2fs-dev] [GIT PULL] f2fs update for 7.1-rc1
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
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORGED_RECIPIENTS(0.00)[m:torvalds@linux-foundation.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
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
X-Rspamd-Queue-Id: 4DCBD43FDF2
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Hi Linus,

Could you please consider this pull requeset?

The following changes since commit e3c33bc767b5512dbfec643a02abf58ce608f3b2:

  Merge tag 'mm-hotfixes-stable-2026-03-23-17-56' of git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm (2026-03-24 09:12:45 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-7.1-rc1

for you to fetch changes up to cb8ff3ead9a3fc43727980be58c7099506f65261:

  f2fs: add page-order information for large folio reads in iostat (2026-04-18 22:44:42 +0000)

----------------------------------------------------------------
f2fs-for-7.1-rc1

In this round, the changes primarily focus on resolving race conditions,
memory safety issues (UAF), and improving the robustness of garbage
collection (GC), and folio management.

Enhancement:
 - add page-order information for large folio reads in iostat
 - add defrag_blocks sysfs node

Bug fix:
 - fix uninitialized kobject put in f2fs_init_sysfs()
 - disallow setting an extension to both cold and hot
 - fix node_cnt race between extent node destroy and writeback
 - fix to preserve previous reserve_{blocks,node} value when remount
 - fix to freeze GC and discard threads quickly
 - fix false alarm of lockdep on cp_global_sem lock
 - fix data loss caused by incorrect use of nat_entry flag
 - fix to skip empty sections in f2fs_get_victim
 - fix inline data not being written to disk in writeback path
 - fix fsck inconsistency caused by FGGC of node block
 - fix fsck inconsistency caused by incorrect nat_entry flag usage
 - call f2fs_handle_critical_error() to set cp_error flag
 - fix fiemap boundary handling when read extent cache is incomplete
 - fix use-after-free of sbi in f2fs_compress_write_end_io()
 - fix UAF caused by decrementing sbi->nr_pages[] in f2fs_write_end_io()
 - fix incorrect file address mapping when inline inode is unwritten
 - fix incomplete search range in f2fs_get_victim when f2fs_need_rand_seg is enabled
 - fix to avoid memory leak in f2fs_rename()

----------------------------------------------------------------
Cen Zhang (1):
      f2fs: add READ_ONCE() for i_blocks in f2fs_update_inode()

Chao Yu (6):
      f2fs: fix to avoid memory leak in f2fs_rename()
      f2fs: call f2fs_handle_critical_error() to set cp_error flag
      f2fs: use more generic f2fs_stop_checkpoint()
      f2fs: fix to do sanity check on dcc->discard_cmd_cnt conditionally
      f2fs: fix false alarm of lockdep on cp_global_sem lock
      f2fs: fix to avoid uninit-value access in f2fs_sanity_check_node_footer

Daeho Jeong (2):
      f2fs: fix to skip empty sections in f2fs_get_victim
      f2fs: fix to freeze GC and discard threads quickly

Daniel Lee (1):
      f2fs: add page-order information for large folio reads in iostat

Eric Biggers (1):
      f2fs: remove unreachable code in f2fs_encrypt_one_page()

George Saad (1):
      f2fs: fix use-after-free of sbi in f2fs_compress_write_end_io()

Guangshuo Li (1):
      f2fs: fix uninitialized kobject put in f2fs_init_sysfs()

Jaegeuk Kim (2):
      f2fs: allow empty mount string for Opt_usr|grp|projjquota
      f2fs: do not support mmap write for large folio

Jianan Huang (1):
      f2fs: avoid reading already updated pages during GC

Yongpeng Yang (16):
      f2fs: fix incorrect file address mapping when inline inode is unwritten
      f2fs: fix UAF caused by decrementing sbi->nr_pages[] in f2fs_write_end_io()
      f2fs: drop unused sbi parameter from f2fs_in_warm_node_list()
      f2fs: fix incorrect multidevice info in trace_f2fs_map_blocks()
      f2fs: fix fiemap boundary handling when read extent cache is incomplete
      f2fs: drop unused ri parameter from truncate_partial_nodes()
      f2fs: refactor f2fs_move_node_folio function
      f2fs: refactor node footer flag setting related code
      f2fs: fix fsck inconsistency caused by incorrect nat_entry flag usage
      f2fs: fix fsck inconsistency caused by FGGC of node block
      f2fs: fix inline data not being written to disk in writeback path
      f2fs: fix data loss caused by incorrect use of nat_entry flag
      f2fs: invalidate block device page cache on umount
      f2fs: fix node_cnt race between extent node destroy and writeback
      f2fs: disallow setting an extension to both cold and hot
      f2fs: protect extension_list reading with sb_lock in f2fs_sbi_show()

Zhiguo Niu (1):
      f2fs: fix to preserve previous reserve_{blocks,node} value when remount

liujinbao1 (2):
      f2fs:Fix incomplete search range in f2fs_get_victim when f2fs_need_rand_seg is enabled
      f2fs: Add defrag_blocks sysfs node

 Documentation/ABI/testing/sysfs-fs-f2fs |   6 ++
 fs/f2fs/checkpoint.c                    |   9 ---
 fs/f2fs/compress.c                      |  14 +++-
 fs/f2fs/data.c                          |  53 +++++++++------
 fs/f2fs/debug.c                         |   1 +
 fs/f2fs/extent_cache.c                  |  17 +++--
 fs/f2fs/f2fs.h                          |  41 ++++++++++--
 fs/f2fs/file.c                          |  15 ++++-
 fs/f2fs/gc.c                            |  23 ++++++-
 fs/f2fs/inline.c                        |  22 +++++--
 fs/f2fs/inode.c                         |   2 +-
 fs/f2fs/iostat.c                        |  38 ++++++++++-
 fs/f2fs/iostat.h                        |   4 ++
 fs/f2fs/namei.c                         |  16 +++++
 fs/f2fs/node.c                          | 112 +++++++++++++++++---------------
 fs/f2fs/node.h                          |  23 ++++---
 fs/f2fs/segment.c                       |  20 ++++--
 fs/f2fs/super.c                         |  70 +++++++++++++++-----
 fs/f2fs/sysfs.c                         |  27 ++++++--
 include/linux/f2fs_fs.h                 |   3 +
 include/trace/events/f2fs.h             |  21 ++++--
 21 files changed, 386 insertions(+), 151 deletions(-)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
