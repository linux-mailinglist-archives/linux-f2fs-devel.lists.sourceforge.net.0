Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id a/b3B+FUGWrTvQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2026 10:57:05 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 435BC5FF991
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2026 10:57:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0b9Ucbz3pEQDRUPL9sbh89eKa2Yhovc139188DRXHrg=; b=gzJCIRLP77mlLVCb+nXIwJDDMT
	rKX2Et+ncH8wESv0A3iuMHcX2Qz5auo2v4PtvnHqlcsSb38ioCQRx33wvRxyCNb1hd9bPMj8O8ABi
	QgjP5L1X53Xwzz4iZnlxkK7sXwT0BrzrnD+cg5J8eHaGbgtQjpCtRJIL83SCGwgF3IM0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wSt1Q-0000k2-IT;
	Fri, 29 May 2026 08:56:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1wSt1O-0000ja-V0
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 May 2026 08:56:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gS6EgVNsdZVPZIzlk+bf0VY00daf1OSIZDl2hqzrOrI=; b=Y4cHpgPaMc+sSrnFp5l6iWDxXQ
 1/SjhOzKqm3X3yxLkExJsxGBQTvbMgdnTbIIx5FyCvKFq334EwQVFMLfH2C86ZAmwxT2/2Sb886dP
 Ad9rMdxHK3q5TVRHqz6ursoAfeb+LSA922KEMyOrwrwDp5HbGsODmSeUc/QZcnORr/mU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gS6EgVNsdZVPZIzlk+bf0VY00daf1OSIZDl2hqzrOrI=; b=R
 2n8oDS54Mx0bUkWyJh0sy2mmEIzZPD2vkNpSjE44ZqBG5cwjOVklR1hDI/f/SFwIKLn7xxSAlsHzE
 SxmnuMxZZTYfxK87W7ptB2+fuOLlWUlrXz1iSC3V5WEuojKtaGJgnEfcs6/dsiXSRhqMY9oOPAuen
 9mdaAtmhXcoiTQJE=;
Received: from mail-pj1-f46.google.com ([209.85.216.46])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wSt1M-00010y-1a for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 May 2026 08:56:50 +0000
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-36bdb11bf8bso35881a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 May 2026 01:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780044998; x=1780649798; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=gS6EgVNsdZVPZIzlk+bf0VY00daf1OSIZDl2hqzrOrI=;
 b=oJp2mohsHsQ+7X5S5QJ/qMvhfLm7xzT+7uZVMmdwrKDomOrPR6MlqV/bXnl5YPDNUn
 AHcNvnNLs8/wpXXA8Vrs57AgRiHNcphAc+cKHB/gkuBvZ1EwZY5dpkVtP6h/7WWiswzW
 +UqivzdzZ6D1Arb1x6W9/9Y+NiDENa/BLDqhrsvKwCNOilg0+Cy4le6QZqfQLHe33PRg
 R8fPUebdcNb14H5IXSsSmZR/atid7DB03poTpWLVd0hn03d4xbGHrkRyE1xG0cB8AvTc
 yKf4ben5ifyyOGxm/BphnoRm9ErN/bDC765kdGF50Usq5+Pf99oubdRcEawUo8onjCMP
 WkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780044998; x=1780649798;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gS6EgVNsdZVPZIzlk+bf0VY00daf1OSIZDl2hqzrOrI=;
 b=l2bQdU7JVA/0RnOyajsuQbqp3bZKVBVXX4ibrtkWFpBozKoh87H+J1RfAmPDTC+gCU
 89Tzq4Ec09lwGc16vipNDYqL67EmXsHy6f1ZHrlJanczFp3Z3WOd6ojQGcmDI823AthK
 4Jc/4osVyIgKFK5TZzsMeP8akoSHqbNAZclhMuHjN02rys8bGUjWDZEEOCXLs3jlYuxM
 VZqYboS0naR49m7JIAs1z9544PpGl8Twr05876v2JQ8jPDTqT00mj1DFK3M0AWgHGTuQ
 /YS2gZmsFXG4WrpSd1rVX6Ronzm4WSwNNUfEUlWlDetBl4Arq8zU3rkoFMyjiFBmgDs3
 HGJQ==
X-Gm-Message-State: AOJu0YyQCCyE5Muwm/VRogIH8cMjpgiSiRfnWaiA1NlrdHBTF6kfLJlj
 BdzMvs4P+5PS3D6o6Z8g9OUoTliShfD4ULXGmqCA6/Q5JoS5vWtDh6ze
X-Gm-Gg: Acq92OH6JEi5vGqVTU+oR9pBQhskDjgMqLDhN7K1nEXpFmKX+ntpRwnNStUfcTBSwyD
 wMuYD7JSQ6+nbZZDehHagoeaoXxILmk2tLNs9bFUk8apKTgJwb4XLmE43TmX743J//DqZrctT2x
 0H2Sd0q0FFbD1KC3FxFmGwTnk4l8JAhTbHR+1x/Oi09g19I43az00vvHHeIWyrlBkWUGn3I6Pbc
 EdY0VSY9gVQ0VeIuw9g/s/AMUXpGK7tPa7BGE1tzZij4mvIgpOPIETKogqhFBVzLty4Gxuo0UGU
 WEPUiJRQtAqKlsqfXQwCpEhvgxcUI9GU7nPJ5DlHVW3i8PoRu+F3mNJI44vWFC4dh2RqQDnv3sV
 ymDx/MDFZ6gqrdh+Duiw94G21fYqkvoftwprovdcuQFK7YeCSQqwA1j8SExvBC++2Gg7m9iWZbL
 I9aBy/Lt4EXE4JEEkfeXXjcq8K8eo5fXzyPws29BORZWNyKF7rRfIDlGwXPx4iTvCsOLISFb+tS
 Kh35LiFyO8KZFg8AeY=
X-Received: by 2002:a17:90b:3d4b:b0:36a:4074:9aa6 with SMTP id
 98e67ed59e1d1-36bbcad6365mr2790982a91.6.1780044997635; 
 Fri, 29 May 2026 01:56:37 -0700 (PDT)
Received: from xiaomi-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36bc1d9f2bbsm874027a91.2.2026.05.29.01.56.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:56:37 -0700 (PDT)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri, 29 May 2026 16:56:24 +0800
Message-ID: <20260529085629.2664539-1-yangyongpeng.storage@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang Changes since v1: - Introduce tracepoints
 for f2fs_iext_update_data_blkaddr and f2fs_iext_lookup_blkaddr to aid
 debugging
 (new patch 5/5). - Bypass inline extent lookup for F2FS_GET_BLOCK_PRECACHE
 to [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.46 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wSt1M-00010y-1a
Subject: [f2fs-dev] [RFC PATCH v2 0/5] f2fs: introduce inline extent mapping
 for inode data blocks
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[yangyongpengstorage@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[yangyongpengstorage@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 435BC5FF991
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

Changes since v1:
- Introduce tracepoints for f2fs_iext_update_data_blkaddr and
  f2fs_iext_lookup_blkaddr to aid debugging (new patch 5/5).
- Bypass inline extent lookup for F2FS_GET_BLOCK_PRECACHE to ensure all
  mappings are loaded into the read extent cache.
- Unify the check for fofs exceeding direct_blocks range to use
  "fofs >= direct_blocks" consistently.
- Remove support for caching NULL_ADDR in inline extent area. If a fofs
  within [0, direct_blocks) is not found in inline extent, it implies
  NULL_ADDR. This simplifies merge and split logic.
- Fix f2fs_iext_enable_inline_extent to use PTR_ERR instead of -ENOMEM.
- Change f2fs_iext_convert_to_inline_extent return type to bool.
- Add benchmark data covering 4K/8K/32K/64K random read.
- Rename __is_extent_mergeable to __is_iextent_mergeable to avoid
  naming collision with extent cache code.
- Remove inode parameter from f2fs_iext_sanity_check (always NULL).
- Reduce #ifdef CONFIG_F2FS_INLINE_EXTENT nesting in node.c.
- Code style fixes to comply with kernel coding style.

This patchset introduces an inline extent mapping mechanism for f2fs.
Instead of storing individual block addresses in the inode's data block
address area (i_addr[]), this feature packs contiguous block ranges into
compact extent entries, significantly reducing the number of entries
needed and enabling faster block address lookups via binary search.

The inline extent format is identified by magic numbers in the inode
data area and is transparent to the rest of f2fs -- when the extent
area is full or cannot represent the mapping efficiently, it
automatically converts back to the direct block address format.

Patch 1: Preparatory refactoring -- replace raw pointer arithmetic
         with f2fs_data_blkaddr() to abstract block address access.
Patch 2: Core implementation -- data structures, extent operations
         (lookup, insert, merge, split, truncate), format conversion,
         and integration with f2fs data/node paths.
Patch 3: ioctl interface -- allow per-file enable/disable of inline
         extent format via F2FS_EXTENT_FL flag.
Patch 4: sysfs interface -- runtime enable/disable toggle and file
         extension list for automatic inline extent activation.
Patch 5: Tracepoints for inline extent lookup and update operations.

Test setup and results:
=======================

Platform: Xiaomi smartphone, UFS 4.0 storage

  # Enable inline extent
  echo 1 > /sys/fs/f2fs/<dev>/inline_extent_enable
  echo 'mp4' > /sys/fs/f2fs/<dev>/inline_extent_extension_list

  # Prepare data: write with 4K offset stride to create fragmented
  # extents, then overwrite sequentially so inline extent can cache
  # all mappings in compact form.
  fio --name=test --filename=data.mp4 --rw=write:4k --bs=64M \
      --size=8G --ioengine=libaio --direct=1
  sync
  fio --name=test --filename=data.mp4 --rw=write --bs=64M \
      --size=8G --ioengine=libaio --direct=1
  sync
  echo 3 > /proc/sys/vm/drop_caches

  # Benchmark: random buffered read, 1GB total IO
  fio --name=buffer-read --ioengine=libaio --rw=randread --bs=$BS \
      --size=8G --io_size=1G --numjobs=1 --filename=data.mp4

Results (random read bandwidth, MiB/s):
+---------------------------------------------------+
| BS     | baseline | inline ext | improvement      |
|--------+----------+------------+------------------|
| 4K     | 35       | 36         | +2.5%            |
| 8K     | 60       | 62         | +3%              |
| 32K    | 179      | 191        | +6.8%            |
| 64K    | 284      | 321        | +13%             |
+---------------------------------------------------+

The improvement comes from eliminating direct/indirect node page reads
during block address lookup -- all mappings are stored directly in
the inode page and found via O(log n) binary search.

Yongpeng Yang (5):
  f2fs: replace raw dnode pointer arithmetic with f2fs_data_blkaddr()
  f2fs: introduce inline extent mapping for inode data blocks
  f2fs: support setting inline extent flag via ioctl
  f2fs: add sysfs interface for inline extent management
  f2fs: introduce tracepoints for inline extent lookup and update

 fs/f2fs/Kconfig             |  18 +
 fs/f2fs/Makefile            |   1 +
 fs/f2fs/data.c              | 157 ++++++-
 fs/f2fs/debug.c             |   4 +
 fs/f2fs/dir.c               |   9 +
 fs/f2fs/f2fs.h              |  23 +-
 fs/f2fs/file.c              |  93 +++-
 fs/f2fs/iextent.c           | 873 ++++++++++++++++++++++++++++++++++++
 fs/f2fs/iextent.h           | 187 ++++++++
 fs/f2fs/inline.c            |   7 +
 fs/f2fs/namei.c             |  48 ++
 fs/f2fs/node.c              |  66 ++-
 fs/f2fs/node.h              |   4 +
 fs/f2fs/recovery.c          |  17 +
 fs/f2fs/super.c             |  13 +
 fs/f2fs/sysfs.c             |  52 +++
 include/trace/events/f2fs.h |  79 ++++
 17 files changed, 1635 insertions(+), 16 deletions(-)
 create mode 100644 fs/f2fs/iextent.c
 create mode 100644 fs/f2fs/iextent.h

-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
