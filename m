Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFwcIvxUGWrTvQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2026 10:57:32 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 65C2F5FF9B4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 May 2026 10:57:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4EXteMYl692vuavWadd+9SE7Aqu9zz8WhoaJZu30GxI=; b=ZzGbminZs/v0/PQEi2JGHb2DOK
	vYBpkhcNye53r+qYp+/HdU+PAKj6r2AQi6GoFdFzx5ZZQI9UC1U19g7aqGIEHo4C//dgNRTp76/mn
	0e83dvm7GDO4dR14NTZFZ+AV0D3rhneZVFZWwXfLT0bs2IR41uvqwhlFsrvcUU8W2zq0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wSt20-0000mW-Le;
	Fri, 29 May 2026 08:57:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1wSt1y-0000mL-Jk
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 May 2026 08:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q6axjk8imQgMtWryaId2+SykHTa/PtkuCfq/EIOaqg4=; b=NPBVsheFMF99ImFkZzi4ZBmiCS
 27q8Af+Mn0ACNk5YJb6bUsFQGrHOUcocaqZ1fXeuAUGCsCUPbaRwilX+gWgsfiknCCDpAzRPUqi10
 8e8iz2Eoq8Y58+mpTzcPycpgxPY3C8SSSFfnSy4DzvwCkl6slhNrjwPLcCSsHMur3ja4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=q6axjk8imQgMtWryaId2+SykHTa/PtkuCfq/EIOaqg4=; b=XKi8STT6dHtGdBwxGTvYEiD/70
 +Na+2Vf3RJRe1SvoyBwZc+kxiX3EHeVz3BMmD0fuTj2uTQ/qQpXBxt8jhP2XEZMPXYfIz3jMhxuvA
 GpR5rhfwi72AnLIDrQbN+WGQrcHA5qjUB5rvrjTiCRGNxWxrnezCIeLblqrzYyBJZ0Ew=;
Received: from mail-pj1-f50.google.com ([209.85.216.50])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wSt1V-00013U-8w for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 29 May 2026 08:57:26 +0000
Received: by mail-pj1-f50.google.com with SMTP id
 98e67ed59e1d1-36b95eb4bb4so696459a91.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 29 May 2026 01:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1780045007; x=1780649807; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q6axjk8imQgMtWryaId2+SykHTa/PtkuCfq/EIOaqg4=;
 b=PVyUlN8ft+BaQIC/3h06ruXmSigr6f5wdUEEnNoQWW47lyEUj7z4MatHk9qTV8kLgt
 ZfFR3zyy0SwuYFtjmchM+iVuPVFUi6sEQ+OkMCy+A0awe1tttnsfEmRqqzPvsEj1Vwxm
 XrWKJGctcrIOPmMjDLSrQnGNPmxpE+NHwjA5vRK+t+EL/tX0zqqfUsZDOUEXUGD7biEf
 M2TBDM23mSmGQUZr03cJr+Gk4v+XUu4bjKlYCctNVN7SYPRT+wlhmzE5lGqvcViYLom9
 PWHaEmTocu3UMxdYMNrGwH62fdpLTbn9+sM752F2t4WYNwOpDFzx5hnoTGCfExU6MBpY
 /usw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780045007; x=1780649807;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=q6axjk8imQgMtWryaId2+SykHTa/PtkuCfq/EIOaqg4=;
 b=Pw2Qr5Aslw2hZD5fbRvBz0QtsgdRxmVuCMIGWUp1x8YLglhe0a6Z+mifHI8UH62eZC
 MEiAySGF+R1/nWAHO65sre/1W24W8bx/rVJKrBGxDEDz2xhaydC8ccFKoieLl4C+2Afi
 ek34mfBZm/ROO41GrKoX6eKXMuFNpJ0IlVsiRjKR0MSX8ufbHCZkxrvQ0e56RqagGXUP
 HxgbOJgLSPvz+9vwaalH3zpQWw1d8kMrxN+mmxZiQ+1ex5uqbC4w16bH4bcRq4aSNNuU
 kMvq4h1O6uMc67/1sFEfrPuPRJ4HFxmATCzWIPjYXz13lxMpIzHATVSbVQMl8ZJ9ijF1
 5s5A==
X-Gm-Message-State: AOJu0YxWWOO4ZD6rLxf2q1y/tB0KhnErph2SaDXc4sxdQcODDe38MChH
 tXgIY0SJ37jeCemNVjm4G3ryeZia4TX+HRYF0k9Z0d46KMGA8BhQlLQB
X-Gm-Gg: Acq92OGI+J7A6Vvsen+2zdAI8bTcua50r1eWpDvzLfa341VHg5YJRgsFf3loE1EkCYZ
 2gWxKoO23BPvyAwSfN0CnjWbdU69VeYGXIJ19ytWHGkrCD0RFJ/bEHPXfazIXAN04QYi3AfRekR
 PnoVOTaFKzbIgcxsQItPegsy+SStbvnb1db5qSmzFNhXYT0ERZPboUnOrsyxPrxvwQY5j98y1Lf
 gW1bLxp6Vehe64HulZAZLbhTesSCwJJbQdc8qLng9tvKhiUim8uT/ua0AA3b4bO7xpAQzN8Mq66
 wQvkCrA7gTRgQhwzHbiEqWnsf8969Svo+8bqUB3yT1sSIJpE5MEUGt/Yga7Rb1TFAwvKWr3qx5z
 ar10ks8KrTBPKPQ2Dz0U08SKPucSyUYkB0eZgfvEz1CKyhbuOFK4hmtUI+IBDfij2VvmWxnYtmQ
 2ZRzz/Wv5fiFBPiBMb1VsYkgE8mDk6Y+aff2I0zp6koQ2cZ1AVik3zJeZ8QZjzYr/JZ7HQxIFjX
 t44UESF
X-Received: by 2002:a17:90b:4a87:b0:366:2e1f:393 with SMTP id
 98e67ed59e1d1-36bbcfe746fmr2454793a91.21.1780045006613; 
 Fri, 29 May 2026 01:56:46 -0700 (PDT)
Received: from xiaomi-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-36bc1d9f2bbsm874027a91.2.2026.05.29.01.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 May 2026 01:56:46 -0700 (PDT)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri, 29 May 2026 16:56:26 +0800
Message-ID: <20260529085629.2664539-3-yangyongpeng.storage@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260529085629.2664539-1-yangyongpeng.storage@gmail.com>
References: <20260529085629.2664539-1-yangyongpeng.storage@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang Implement an inline extent mapping
 mechanism
 that stores extent information directly in the inode's data block address
 area. This provides a more space-efficient representation when contiguous
 block r [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.50 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
X-Headers-End: 1wSt1V-00013U-8w
Subject: [f2fs-dev] [RFC PATCH v2 2/5] f2fs: introduce inline extent mapping
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
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	TAGGED_FROM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[yangyongpengstorage@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
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
X-Rspamd-Queue-Id: 65C2F5FF9B4
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

Implement an inline extent mapping mechanism that stores extent
information directly in the inode's data block address area. This
provides a more space-efficient representation when contiguous block
ranges can be described by fewer extent entries than individual block
addresses.

The inline extent format uses a magic-number-based identification in the
inode block address space and maintains a sorted array of extents with
binary search for lookup operations.

Main changes:
- Add extent lookup, insert, update, and merge operations
- Add extent management (format conversion between direct blocks and
  inline extents, truncation)
- Add f2fs_iext_info to sbi for global inline extent state
- Add Kconfig options (CONFIG_F2FS_INLINE_EXTENT and
  CONFIG_F2FS_INLINE_EXTENT_DEBUG for statistics)
- Integrate with existing f2fs data path, node operations, and recovery

Test setup (Xiaomi smartphone, UFS 4.0 storage, f2fs):

  echo 1 > /sys/fs/f2fs/<dev>/inline_extent_enable
  echo 'mp4' > /sys/fs/f2fs/<dev>/inline_extent_extension_list
  fio --name=test --filename=data.mp4 --rw=write:4k --bs=64M \
      --size=8G --ioengine=libaio --direct=1
  sync
  fio --name=test --filename=data.mp4 --rw=write --bs=64M \
      --size=8G --ioengine=libaio --direct=1
  sync
  echo 3 > /proc/sys/vm/drop_caches
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

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
v2:
- Bypass inline extent lookup for F2FS_GET_BLOCK_PRECACHE.
- Unify fofs range check to "fofs >= direct_blocks".
- Remove NULL_ADDR caching support; simplify merge/split logic.
- Change f2fs_iext_convert_to_inline_extent return type to bool.
- Rename __is_extent_mergeable to __is_iextent_mergeable.
- Remove inode parameter from f2fs_iext_sanity_check.
- Reduce #ifdef nesting in node.c.
- Add complete benchmark data (4K/8K/32K/64K).
- Code style fixes.
---
 fs/f2fs/Kconfig    |  18 +
 fs/f2fs/Makefile   |   1 +
 fs/f2fs/data.c     | 157 ++++++++-
 fs/f2fs/dir.c      |   9 +
 fs/f2fs/f2fs.h     |  23 +-
 fs/f2fs/file.c     |   1 +
 fs/f2fs/iextent.c  | 823 +++++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/iextent.h  | 184 ++++++++++
 fs/f2fs/inline.c   |   7 +
 fs/f2fs/namei.c    |  48 +++
 fs/f2fs/node.c     |  66 +++-
 fs/f2fs/node.h     |   4 +
 fs/f2fs/recovery.c |  17 +
 fs/f2fs/super.c    |  13 +
 14 files changed, 1361 insertions(+), 10 deletions(-)
 create mode 100644 fs/f2fs/iextent.c
 create mode 100644 fs/f2fs/iextent.h

diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index 5916a02fb46d..4a5d900090ee 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -150,3 +150,21 @@ config F2FS_UNFAIR_RWSEM
 	help
 	  Use unfair rw_semaphore, if system configured IO priority by block
 	  cgroup.
+
+config F2FS_INLINE_EXTENT
+	bool "F2FS inline extent"
+	depends on F2FS_FS
+	default y
+	help
+	  Support the inline extent feature: leverage the inode's data block
+	  address area to store extent-format mapping relationships, replacing
+	  individual block addresses with compact extent entries to optimize
+	  large file random reads.
+
+config F2FS_INLINE_EXTENT_DEBUG
+	bool "F2FS inline extent debug"
+	depends on F2FS_INLINE_EXTENT
+	default n
+	help
+	  Support inline extent debug to stat code coverage and extents
+	  consistency check.
diff --git a/fs/f2fs/Makefile b/fs/f2fs/Makefile
index 8a7322d229e4..ed75c0b71a93 100644
--- a/fs/f2fs/Makefile
+++ b/fs/f2fs/Makefile
@@ -4,6 +4,7 @@ obj-$(CONFIG_F2FS_FS) += f2fs.o
 f2fs-y		:= dir.o file.o inode.o namei.o hash.o super.o inline.o
 f2fs-y		+= checkpoint.o gc.o data.o node.o segment.o recovery.o
 f2fs-y		+= shrinker.o extent_cache.o sysfs.o
+f2fs-$(CONFIG_F2FS_INLINE_EXTENT) += iextent.o
 f2fs-$(CONFIG_F2FS_STAT_FS) += debug.o
 f2fs-$(CONFIG_F2FS_FS_XATTR) += xattr.o
 f2fs-$(CONFIG_F2FS_FS_POSIX_ACL) += acl.o
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 9c6440a7db0e..2a98626051fb 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -26,6 +26,7 @@
 #include "node.h"
 #include "segment.h"
 #include "iostat.h"
+#include "iextent.h"
 #include <trace/events/f2fs.h>
 
 #define NUM_PREALLOC_POST_READ_CTXS	128
@@ -1203,11 +1204,66 @@ static void f2fs_submit_page_read(struct inode *inode, struct fsverity_info *vi,
 	f2fs_submit_read_bio(sbi, bio, DATA);
 }
 
+#ifdef CONFIG_F2FS_INLINE_EXTENT
+static bool __set_iext_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr)
+{
+	block_t fofs = f2fs_start_bidx_of_node(ofs_of_node(dn->node_folio),
+						dn->inode) + dn->ofs_in_node;
+	int ret;
+	bool need_update = false;
+
+	/*
+	 * Don't cache extent during recovery, be consistent with largest
+	 * extent.
+	 */
+	if (unlikely(is_sbi_flag_set(F2FS_I_SB(dn->inode), SBI_POR_DOING)) &&
+			fofs >= ADDRS_PER_INODE(dn->inode)) {
+		f2fs_bug_on(F2FS_I_SB(dn->inode),
+			f2fs_iext_last_fofs(dn->inode, dn->inode_folio) >=
+			ADDRS_PER_INODE(dn->inode));
+		return need_update;
+	}
+
+	f2fs_folio_wait_writeback(dn->inode_folio, NODE, true, true);
+	ret = f2fs_iext_update_data_blkaddr(dn->inode, dn->inode_folio, fofs,
+						blkaddr);
+	switch (ret) {
+	case F2FS_IEXT_INSERT_CONVERT:
+		/* caller need to update direct blocks array. */
+		f2fs_iext_convert_to_direct_blocks(dn->inode, dn->inode_folio);
+		need_update = true;
+		fallthrough;
+	case F2FS_IEXT_INSERT_REMOVED:
+	case F2FS_IEXT_INSERT_NORMAL:
+		if (folio_mark_dirty(dn->inode_folio))
+			dn->node_changed = true;
+		break;
+	case F2FS_IEXT_INSERT_DROP:
+		break;
+	default:
+		f2fs_bug_on(F2FS_I_SB(dn->inode), 1);
+	}
+	return need_update;
+}
+#endif
+
 static void __set_data_blkaddr(struct dnode_of_data *dn, block_t blkaddr)
 {
 	__le32 *addr = get_dnode_addr(dn->inode, dn->node_folio);
 
 	dn->data_blkaddr = blkaddr;
+#ifdef CONFIG_F2FS_INLINE_EXTENT
+	if (f2fs_iext_support_inline_extent(dn->inode,
+			dn->inode_folio)) {
+		f2fs_bug_on(F2FS_I_SB(dn->inode),
+				!dn->inode_folio_locked);
+		f2fs_bug_on(F2FS_I_SB(dn->inode),
+				!folio_test_locked(dn->inode_folio));
+		if (!__set_iext_data_blkaddr(dn, blkaddr) &&
+				dn->node_folio == dn->inode_folio)
+			return;
+	}
+#endif
 	addr[dn->ofs_in_node] = cpu_to_le32(dn->data_blkaddr);
 }
 
@@ -1645,6 +1701,61 @@ static bool map_is_mergeable(struct f2fs_sb_info *sbi,
 	return false;
 }
 
+#ifdef CONFIG_F2FS_INLINE_EXTENT
+static bool f2fs_iext_map_blocks(struct inode *inode,
+		struct f2fs_map_blocks *map, int flag)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	unsigned int maxblocks = map->m_len;
+	pgoff_t pgoff = (pgoff_t)map->m_lblk;
+	block_t blkaddr;
+	struct folio *ifolio;
+	unsigned int len;
+	int ret;
+
+	if (f2fs_compressed_file(inode))
+		return false;
+
+	ifolio = f2fs_get_inode_folio(sbi, inode->i_ino);
+	if (IS_ERR(ifolio))
+		return false;
+	if (!f2fs_iext_support_inline_extent(inode, ifolio)) {
+		f2fs_folio_put(ifolio, true);
+		return false;
+	}
+	ret = f2fs_iext_lookup_blkaddr(inode, ifolio, pgoff, &blkaddr, &len);
+	f2fs_folio_put(ifolio, true);
+	if (ret)
+		return false;
+
+	if (blkaddr == NULL_ADDR || blkaddr == NEW_ADDR)
+		return false;
+	map->m_pblk = blkaddr;
+	map->m_len = min_t(unsigned int, maxblocks, len);
+	map->m_flags = F2FS_MAP_MAPPED;
+	if (map->m_next_extent)
+		*map->m_next_extent = pgoff + map->m_len;
+
+	/* for hardware encryption, but to avoid potential issue in future */
+	if (flag == F2FS_GET_BLOCK_DIO)
+		f2fs_wait_on_block_writeback_range(inode,
+					map->m_pblk, map->m_len);
+
+	map->m_multidev_dio = f2fs_allow_multi_device_dio(sbi, flag);
+	if (map->m_multidev_dio) {
+		int bidx = f2fs_target_device_index(sbi, map->m_pblk);
+		struct f2fs_dev_info *dev = &sbi->devs[bidx];
+
+		map->m_bdev = dev->bdev;
+		map->m_len = min(map->m_len, dev->end_blk + 1 - map->m_pblk);
+		map->m_pblk -= dev->start_blk;
+	} else {
+		map->m_bdev = inode->i_sb->s_bdev;
+	}
+	return true;
+}
+#endif
+
 /*
  * f2fs_map_blocks() tries to find or build mapping relationship which
  * maps continuous logical blocks to physical blocks, and return such
@@ -1694,6 +1805,23 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 		goto map_more;
 	}
 
+#ifdef CONFIG_F2FS_INLINE_EXTENT
+	/*
+	 * Precache need to load all mapping to read extent cache, so we need
+	 * to bypass inline extent.
+	 */
+	if (!map->m_may_create && flag != F2FS_GET_BLOCK_PRECACHE &&
+			f2fs_iext_map_blocks(inode, map, flag)) {
+		if (map->m_len == maxblocks ||
+			map->m_multidev_dio ||
+			flag != F2FS_GET_BLOCK_FIEMAP)
+			goto out;
+		pgofs =	(pgoff_t)map->m_lblk + map->m_len;
+		ofs = map->m_len;
+		goto map_more;
+	}
+#endif
+
 	map->m_bdev = inode->i_sb->s_bdev;
 	map->m_multidev_dio =
 		f2fs_allow_multi_device_dio(F2FS_I_SB(inode), flag);
@@ -3706,6 +3834,31 @@ void f2fs_write_failed(struct inode *inode, loff_t to)
 	}
 }
 
+#ifdef CONFIG_F2FS_INLINE_EXTENT
+static bool f2fs_iext_get_data_blkaddr(struct inode *inode,
+			struct folio *ifolio, pgoff_t index, block_t *blkaddr)
+{
+	int ret;
+
+	if (f2fs_compressed_file(inode))
+		return false;
+	if (!f2fs_iext_support_inline_extent(inode, ifolio))
+		return false;
+
+	ret = f2fs_iext_lookup_blkaddr(inode, ifolio, index, blkaddr, NULL);
+	if (ret || *blkaddr == NULL_ADDR || *blkaddr == NEW_ADDR)
+		return false;
+
+	return true;
+}
+#else
+static bool f2fs_iext_get_data_blkaddr(struct inode *inode,
+			struct folio *ifolio, pgoff_t index, block_t *blkaddr)
+{
+	return false;
+}
+#endif
+
 static int prepare_write_begin(struct f2fs_sb_info *sbi,
 			struct folio *folio, loff_t pos, unsigned int len,
 			block_t *blk_addr, bool *node_changed)
@@ -3761,7 +3914,9 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 	}
 
 	if (!f2fs_lookup_read_extent_cache_block(inode, index,
-						 &dn.data_blkaddr)) {
+				&dn.data_blkaddr) &&
+			!f2fs_iext_get_data_blkaddr(inode, ifolio, index,
+				&dn.data_blkaddr)) {
 		if (IS_DEVICE_ALIASING(inode)) {
 			err = -ENODATA;
 			goto out;
diff --git a/fs/f2fs/dir.c b/fs/f2fs/dir.c
index b1697194c3c4..47c8d24961a3 100644
--- a/fs/f2fs/dir.c
+++ b/fs/f2fs/dir.c
@@ -16,6 +16,7 @@
 #include "node.h"
 #include "acl.h"
 #include "xattr.h"
+#include "iextent.h"
 #include <trace/events/f2fs.h>
 
 static inline bool f2fs_should_fallback_to_linear(struct inode *dir)
@@ -543,6 +544,14 @@ struct folio *f2fs_init_inode_metadata(struct inode *inode, struct inode *dir,
 		if (IS_ERR(folio))
 			return folio;
 
+#ifdef CONFIG_F2FS_INLINE_EXTENT
+		if (S_ISREG(inode->i_mode) &&
+				(F2FS_I(inode)->i_flags & F2FS_EXTENT_FL) &&
+				!is_inode_flag_set(inode, FI_INLINE_DATA)) {
+			f2fs_iext_init_inline_extent(inode, folio);
+			folio_mark_dirty(folio);
+		}
+#endif
 		if (S_ISDIR(inode->i_mode)) {
 			/* in order to handle error case */
 			folio_get(folio);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index fffb516b78f4..e1402ee09c5e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1137,6 +1137,8 @@ static inline void set_new_dnode(struct dnode_of_data *dn, struct inode *inode,
 	dn->inode_folio = ifolio;
 	dn->node_folio = nfolio;
 	dn->nid = nid;
+	if (ifolio != NULL)
+		dn->inode_folio_locked = folio_test_locked(ifolio);
 }
 
 /*
@@ -1769,6 +1771,10 @@ struct f2fs_sb_info {
 	struct f2fs_nm_info *nm_info;		/* node manager */
 	struct inode *node_inode;		/* cache node blocks */
 
+#ifdef CONFIG_F2FS_INLINE_EXTENT
+	struct f2fs_iext_info *iext_info;
+#endif
+
 	/* for segment-related operations */
 	struct f2fs_sm_info *sm_info;		/* segment manager */
 
@@ -3106,12 +3112,15 @@ static inline void f2fs_put_page(struct page *page, bool unlock)
 	f2fs_folio_put(page_folio(page), unlock);
 }
 
+static inline __le32 *get_dnode_addr(struct inode *inode,
+					struct folio *node_folio);
 static inline void f2fs_put_dnode(struct dnode_of_data *dn)
 {
 	if (dn->node_folio)
 		f2fs_folio_put(dn->node_folio, true);
 	if (dn->inode_folio && dn->node_folio != dn->inode_folio)
-		f2fs_folio_put(dn->inode_folio, false);
+		f2fs_folio_put(dn->inode_folio,
+				dn->inode_folio_locked);
 	dn->node_folio = NULL;
 	dn->inode_folio = NULL;
 }
@@ -3240,9 +3249,20 @@ static inline __le32 *get_dnode_addr(struct inode *inode,
 			get_dnode_base(inode, node_folio);
 }
 
+#ifdef CONFIG_F2FS_INLINE_EXTENT
+int f2fs_iext_data_blkaddr(struct inode *inode,
+			struct folio *node_folio, unsigned int offset,
+			block_t *blkaddr);
+#endif
 static inline block_t data_blkaddr(struct inode *inode,
 			struct folio *node_folio, unsigned int offset)
 {
+#ifdef CONFIG_F2FS_INLINE_EXTENT
+	block_t blkaddr;
+
+	if (!f2fs_iext_data_blkaddr(inode, node_folio, offset, &blkaddr))
+		return blkaddr;
+#endif
 	return le32_to_cpu(*(get_dnode_addr(inode, node_folio) + offset));
 }
 
@@ -3323,6 +3343,7 @@ static inline void f2fs_change_bit(unsigned int nr, char *addr)
 #define F2FS_NOCOMP_FL			0x00000400 /* Don't compress */
 #define F2FS_INDEX_FL			0x00001000 /* hash-indexed directory */
 #define F2FS_DIRSYNC_FL			0x00010000 /* dirsync behaviour (directories only) */
+#define F2FS_EXTENT_FL			0x00080000 /* Extents */
 #define F2FS_PROJINHERIT_FL		0x20000000 /* Create with parents projid */
 #define F2FS_CASEFOLD_FL		0x40000000 /* Casefolded file */
 #define F2FS_DEVICE_ALIAS_FL		0x80000000 /* File for aliasing a device */
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index e40e136f9d43..7db9cef5bc65 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2209,6 +2209,7 @@ static const struct {
 	{ F2FS_NOCOMP_FL,	FS_NOCOMP_FL },
 	{ F2FS_INDEX_FL,	FS_INDEX_FL },
 	{ F2FS_DIRSYNC_FL,	FS_DIRSYNC_FL },
+	{ F2FS_EXTENT_FL,	FS_EXTENT_FL },
 	{ F2FS_PROJINHERIT_FL,	FS_PROJINHERIT_FL },
 	{ F2FS_CASEFOLD_FL,	FS_CASEFOLD_FL },
 };
diff --git a/fs/f2fs/iextent.c b/fs/f2fs/iextent.c
new file mode 100644
index 000000000000..d919448ef740
--- /dev/null
+++ b/fs/f2fs/iextent.c
@@ -0,0 +1,823 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * fs/f2fs/iextent.c
+ *
+ * Copyright (c) 2026 Xiaomi Technology Co., Ltd.
+ *             http://www.mi.com/
+ */
+#include <linux/f2fs_fs.h>
+#include <linux/seq_file.h>
+
+#include "f2fs.h"
+#include "iextent.h"
+
+/*
+ * ASSERT - debug assertion for inline extent code.
+ * Uses f2fs_bug_on when sbi is available, falls back to WARN_ON_ONCE otherwise.
+ */
+#define ASSERT(sbi, condition) do {			\
+	if (!(sbi))					\
+		WARN_ON_ONCE(!(condition));		\
+	else						\
+		f2fs_bug_on((sbi), !(condition));	\
+} while (0)
+
+bool f2fs_iext_sanity_check(struct folio *ifolio)
+{
+	struct f2fs_iext_header *eh =
+		(struct f2fs_iext_header *)get_dnode_addr(NULL, ifolio);
+	struct f2fs_extent *ix;
+	int inline_extents = EXT_ENTRY_COUNT(eh);
+	int k;
+
+	if (!S_ISREG(le16_to_cpu(F2FS_NODE(ifolio)->i.i_mode)))
+		return false;
+
+	if (inline_extents == 0)
+		return true;
+
+	ix = EXT_FIRST_INDEX(eh);
+	for (k = 0; k < EXT_ENTRY_COUNT(eh); k++, ix++) {
+		if (F2FS_EXT_LEN(ix) == 0)
+			return false;
+		if (F2FS_EXT_LOGICAL_START(ix) > UINT_MAX - F2FS_EXT_LEN(ix))
+			return false;
+		if (F2FS_EXT_PHYSICAL_START(ix) != NEW_ADDR &&
+			F2FS_EXT_PHYSICAL_START(ix) >
+			UINT_MAX - F2FS_EXT_LEN(ix))
+			return false;
+		if (k == 0)
+			continue;
+		if (F2FS_EXT_LOGICAL_START(ix) <=
+				F2FS_EXT_LOGICAL_END(&ix[-1]))
+			return false;
+	}
+	return true;
+}
+
+/*
+ * Borrowed from ext4_ext_binsearch_idx.
+ *
+ * __iext_binsearch_idx:
+ * binary search for the closest index of the given block
+ * the header must be checked before calling this
+ */
+static int __iext_binsearch_idx(struct inode *inode, struct folio *ifolio,
+			block_t block)
+{
+	struct f2fs_iext_header *eh =
+		(struct f2fs_iext_header *)get_dnode_addr(inode, ifolio);
+	struct f2fs_extent *r, *l, *m;
+	int index = 0;
+
+	if (EXT_ENTRY_COUNT(eh) == 0)
+		return -1;
+
+	l = EXT_FIRST_INDEX(eh) + 1;
+	r = EXT_LAST_INDEX(eh);
+	while (l <= r) {
+		m = l + (r - l) / 2;
+		if (block < le32_to_cpu(m->fofs))
+			r = m - 1;
+		else
+			l = m + 1;
+	}
+
+	index = l - EXT_FIRST_INDEX(eh) - 1;
+
+#ifdef CONFIG_F2FS_INLINE_EXTENT_DEBUG
+	{
+		struct f2fs_sb_info *sbi = inode ? F2FS_I_SB(inode) : NULL;
+		struct f2fs_extent *chix, *ix;
+		int k;
+
+		chix = ix = EXT_FIRST_INDEX(eh);
+		for (k = 0; k < EXT_ENTRY_COUNT(eh); k++, ix++) {
+			if (k != 0 && le32_to_cpu(ix->fofs) <=
+			    le32_to_cpu(ix[-1].fofs)) {
+				f2fs_debug(sbi, "k=%d, ix=0x%p, first=0x%p",
+				       k, ix, EXT_FIRST_INDEX(eh));
+				f2fs_debug(sbi, "%u <= %u",
+				       le32_to_cpu(ix->fofs),
+				       le32_to_cpu(ix[-1].fofs));
+			}
+			ASSERT(sbi, !(k && le32_to_cpu(ix->fofs)
+					   <= le32_to_cpu(ix[-1].fofs)));
+			if (block < le32_to_cpu(ix->fofs))
+				break;
+			chix = ix;
+		}
+		ASSERT(sbi, chix == l - 1);
+	}
+#endif
+
+	return index;
+}
+
+static void __ext_add_one_entry(struct f2fs_iext_header *eh, int index,
+			struct f2fs_extent *ext)
+{
+	int inline_extents = EXT_ENTRY_COUNT(eh);
+
+	if (WARN_ON_ONCE(index < 0 || index > inline_extents))
+		return;
+
+	memmove(&eh->exts[index + 1], &eh->exts[index],
+			(inline_extents - index) * sizeof(struct f2fs_extent));
+	memcpy(&eh->exts[index], ext, sizeof(struct f2fs_extent));
+
+	eh->cnt = cpu_to_le32(inline_extents + 1);
+}
+
+static void __ext_del_one_entry(struct f2fs_iext_header *eh, int index)
+{
+	int inline_extents = EXT_ENTRY_COUNT(eh);
+
+	memmove(&eh->exts[index], &eh->exts[index + 1],
+			(inline_extents - index - 1) *
+			sizeof(struct f2fs_extent));
+
+	eh->cnt = cpu_to_le32(inline_extents - 1);
+}
+
+enum {
+	F2FS_EXT_HIT_LEFT = -1,
+	F2FS_EXT_HIT_MID = 0,
+	F2FS_EXT_HIT_RIGHT = 1,
+};
+
+static int __is_iextent_hit(struct f2fs_extent *ext, block_t fofs)
+{
+	block_t start = F2FS_EXT_LOGICAL_START(ext);
+	block_t end = F2FS_EXT_LOGICAL_END(ext);
+
+	if (fofs < start)
+		return F2FS_EXT_HIT_LEFT;
+	if (fofs > end)
+		return F2FS_EXT_HIT_RIGHT;
+	return F2FS_EXT_HIT_MID;
+}
+
+static bool __is_iextent_mergeable(struct f2fs_extent *left,
+			struct f2fs_extent *right)
+{
+	block_t left_blk_start = F2FS_EXT_PHYSICAL_START(left);
+	block_t right_blk_start = F2FS_EXT_PHYSICAL_START(right);
+
+	if (F2FS_EXT_LOGICAL_END(left) + 1 != F2FS_EXT_LOGICAL_START(right))
+		return false;
+
+	/* NEW_ADDR always can merge. */
+	if (left_blk_start == right_blk_start) {
+		/*
+		 * In fallocate context, FALLOC_FL_COLLAPSE_RANGE mode might
+		 * cause `left_blk_start == right_blk_start` and not equal
+		 * NEW_ADDR.
+		 */
+		if (left_blk_start == NEW_ADDR)
+			return true;
+		return false;
+	}
+	if (left_blk_start == NULL_ADDR ||
+			left_blk_start == NEW_ADDR ||
+			right_blk_start == NULL_ADDR ||
+			right_blk_start == NEW_ADDR)
+		return false;
+	if (F2FS_EXT_PHYSICAL_END(left) + 1 != F2FS_EXT_PHYSICAL_START(right))
+		return false;
+
+	return true;
+}
+
+/*
+ * 1. all single extent insert operation must check mergeable at first even for
+ * split case.
+ * 2. all -ENOSPC error will delete the old mapping except for case which will
+ * split extent into 2 separate extent and insert new one.
+ * 3. index point to 0th extent or extent which first fofs is bigger than @fofs.
+ * 4. delete old mapping before insert new one even for extent which len is 1.
+ */
+
+static int __iext_insert_idx(struct inode *inode, struct folio *ifolio,
+				block_t fofs, block_t blkaddr)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	int max_inline_extents = MAX_INLINE_EXTENTS(inode);
+	struct f2fs_iext_header *eh =
+		(struct f2fs_iext_header *)get_dnode_addr(inode, ifolio);
+	int inline_extents = EXT_ENTRY_COUNT(eh);
+	int index = 0, left = -1, right = -1, ret = 0, hit;
+	int merge_bits = 0, max_split_cnt = 0;
+	block_t fofs_start, fofs_end, blk_start;
+	unsigned int len;
+	struct f2fs_extent *last_ext;
+	struct f2fs_extent split;
+	struct f2fs_extent ext = {
+		.fofs = cpu_to_le32(fofs),
+		.blk = cpu_to_le32(blkaddr),
+		.len = cpu_to_le32(1),
+	};
+#ifdef CONFIG_F2FS_INLINE_EXTENT_DEBUG
+	struct f2fs_iext_info *iext_info = sbi->iext_info;
+#endif
+
+	ASSERT(sbi, EXT_ENTRY_COUNT(eh) <= MAX_INLINE_EXTENTS(inode));
+
+	/* 1. insert empty inline extent area. */
+	if (inline_extents == 0) {
+		ASSERT(sbi, max_inline_extents > 0);
+		INLINE_EXT_STAT_INC(iext_info, overwrite_ext_count);
+		goto add_entry;
+	}
+
+	/* 2. try merge with last extent. */
+	last_ext = EXT_LAST_INDEX(eh);
+	if (__is_iextent_mergeable(last_ext, &ext)) {
+		last_ext->len = cpu_to_le32(F2FS_EXT_LEN(last_ext) + 1);
+		INLINE_EXT_STAT_INC(iext_info, fast_right_merge_count);
+		goto out;
+	}
+
+	if (MAX_INLINE_EXTENTS(inode) == inline_extents &&
+			fofs > F2FS_EXT_LOGICAL_END(last_ext)) {
+		INLINE_EXT_STAT_INC(iext_info, drop_insert_new_ext_cnt);
+		ret = -E2BIG;
+		goto out;
+	}
+	/* 3. search extent. */
+	index = __iext_binsearch_idx(inode, ifolio, fofs);
+
+	fofs_start = F2FS_EXT_LOGICAL_START(&eh->exts[index]);
+	fofs_end = F2FS_EXT_LOGICAL_END(&eh->exts[index]);
+	blk_start = F2FS_EXT_PHYSICAL_START(&eh->exts[index]);
+	len = F2FS_EXT_LEN(&eh->exts[index]);
+
+	/* 4. check extent hit. */
+	hit = __is_iextent_hit(&eh->exts[index], fofs);
+	switch (hit) {
+	case F2FS_EXT_HIT_LEFT:
+		/* only if fofs < eh->exts[0].fofs. */
+		ASSERT(sbi, index == 0);
+		right = index;
+		break;
+	case F2FS_EXT_HIT_RIGHT:
+		left = index;
+		if (left + 1 < inline_extents)
+			right = left + 1;
+		break;
+	case F2FS_EXT_HIT_MID:
+		max_split_cnt = 0;
+
+		/* 5. overwrite extent. */
+		if (len == 1) {
+			__ext_del_one_entry(eh, index);
+			inline_extents = EXT_ENTRY_COUNT(eh);
+			/*
+			 * just overwrite for single extent, other cases may
+			 * cause merge.
+			 */
+			if (inline_extents == 0) {
+				/*
+				 * blkaddr can be NULL_ADDR, so need to check
+				 * before update.
+				 */
+				INLINE_EXT_STAT_INC(iext_info,
+						overwrite_ext_count);
+				goto add_entry;
+			}
+			if (index < inline_extents)
+				right = index;
+			if (index - 1 >= 0)
+				index = left = index - 1;
+			/*
+			 * index may not change but extent content has already
+			 * changed.
+			 */
+			fofs_start = F2FS_EXT_LOGICAL_START(&eh->exts[index]);
+			fofs_end = F2FS_EXT_LOGICAL_END(&eh->exts[index]);
+			blk_start = F2FS_EXT_PHYSICAL_START(&eh->exts[index]);
+			len = F2FS_EXT_LEN(&eh->exts[index]);
+			break;
+		}
+		/* 6. split extent. */
+		if (blk_start == NEW_ADDR && blk_start == blkaddr)
+			goto out;
+		if (blk_start != NEW_ADDR &&
+				blk_start + fofs - fofs_start == blkaddr)
+			goto out;
+		if (fofs_start == fofs || fofs_end == fofs)
+			max_split_cnt = 1;
+		else
+			max_split_cnt = 2;
+		switch (max_split_cnt) {
+		case 1:
+			/*
+			 * Corner cases:
+			 * 1. actual split count maybe 0 or 1, because @ext
+			 * might merge with another extent.
+			 * 2. truncate fofs at first even though ext can not
+			 * merge and no space, because ext will add to inline
+			 * extent area or may out of range of inline extent
+			 * area.
+			 */
+			eh->exts[index].len = cpu_to_le32(F2FS_EXT_LEN(
+						&eh->exts[index]) - 1);
+			eh->exts[index].fofs = cpu_to_le32(fofs == fofs_start ?
+						fofs_start + 1 : fofs_start);
+			if (blk_start != NEW_ADDR)
+				eh->exts[index].blk = cpu_to_le32(
+						fofs == fofs_start ?
+						blk_start + 1 : blk_start);
+			/* add ext at index or 'index + 1' */
+			if (fofs == fofs_end) {
+				INLINE_EXT_STAT_INC(iext_info,
+						split_right_count);
+				/* may be can merge with the right of index */
+				if (index + 1 < inline_extents)
+					right = index + 1;
+				else {
+					index++; /* insert to next position. */
+					goto add_entry;
+				}
+			} else {
+				INLINE_EXT_STAT_INC(iext_info,
+						split_left_count);
+				/* may be can merge with the left of index */
+				if (index - 1 >= 0)
+					index = left = index - 1;
+				else
+					goto add_entry;
+			}
+			fofs_start = F2FS_EXT_LOGICAL_START(&eh->exts[index]);
+			fofs_end = F2FS_EXT_LOGICAL_END(&eh->exts[index]);
+			blk_start = F2FS_EXT_PHYSICAL_START(&eh->exts[index]);
+			len = F2FS_EXT_LEN(&eh->exts[index]);
+			break;
+		case 2:
+			if (inline_extents + max_split_cnt >
+					max_inline_extents) {
+				ret = -ENOSPC;
+				goto out;
+			}
+			eh->exts[index].len = cpu_to_le32(fofs - fofs_start);
+
+			split.fofs = cpu_to_le32(fofs + 1);
+			split.len = cpu_to_le32(fofs_end - fofs);
+			if (blk_start != NEW_ADDR)
+				split.blk = cpu_to_le32(blk_start + fofs -
+						fofs_start + 1);
+			else
+				split.blk = cpu_to_le32(blk_start);
+			__ext_add_one_entry(eh, index + 1, &split);
+			inline_extents = EXT_ENTRY_COUNT(eh);
+			/* add ext between index and 'index + 1' */
+			index++;
+			INLINE_EXT_STAT_INC(iext_info, split_mid_count);
+			goto add_entry;
+		default:
+			ASSERT(sbi, 0);
+		}
+		break;
+	default:
+		ASSERT(sbi, 0);
+	}
+	/* 7. try to merge extent. */
+	if (left >= 0 && __is_iextent_mergeable(&eh->exts[left], &ext))
+		merge_bits |= 1;
+	if (right >= 0 && __is_iextent_mergeable(&ext, &eh->exts[right]))
+		merge_bits |= (1 << 1);
+	switch (merge_bits) {
+	case 1:
+		eh->exts[left].len = cpu_to_le32(F2FS_EXT_LEN(
+					&eh->exts[left]) + 1);
+		INLINE_EXT_STAT_INC(iext_info, right_merge_count);
+		goto out;
+	case 2:
+		eh->exts[right].len = cpu_to_le32(F2FS_EXT_LEN(
+					&eh->exts[right]) + 1);
+		eh->exts[right].fofs = cpu_to_le32(fofs);
+		eh->exts[right].blk = cpu_to_le32(blkaddr);
+		INLINE_EXT_STAT_INC(iext_info, left_merge_count);
+		goto out;
+	case 3:
+		eh->exts[left].len = cpu_to_le32(F2FS_EXT_LEN(&eh->exts[left])
+					+ 1 + F2FS_EXT_LEN(&eh->exts[right]));
+		__ext_del_one_entry(eh, right);
+		INLINE_EXT_STAT_INC(iext_info, del_ext_count);
+		INLINE_EXT_STAT_INC(iext_info, lr_merge_count);
+		goto out;
+	default:
+		/* no extent can merge. */
+		ASSERT(sbi, merge_bits == 0);
+	}
+	/* insert ext after found index. always false for split case. */
+	if (fofs > fofs_start)
+		index++;
+	INLINE_EXT_STAT_INC(iext_info, insert_new_ext_count);
+add_entry:
+	/*
+	 * Just bypass insert new NULL_ADDR, because the old blkaddr can not
+	 * be NULL_ADDR, and inserting need to delete it at first.
+	 * This will bypass all newly NULL_ADDR insert operation.
+	 */
+	if (blkaddr == NULL_ADDR) {
+		/* ret = 0; delete succeed. */
+		goto out;
+	}
+	if (inline_extents + 1 > max_inline_extents) {
+		ret = -ENOSPC;
+		goto out;
+	}
+	/* 8. insert as new extent. */
+	INLINE_EXT_STAT_INC(iext_info, add_ext_count);
+	__ext_add_one_entry(eh, index, &ext);
+out:
+	ASSERT(sbi, EXT_ENTRY_COUNT(eh) <= MAX_INLINE_EXTENTS(inode));
+	return ret;
+}
+
+/* Lookup whether fofs is exists in inline extent area. */
+static int __iext_lookup_data_blkaddr(struct inode *inode, struct folio *ifolio,
+				block_t fofs, block_t *blkaddr,
+				unsigned int *len)
+{
+	int index, hit;
+	struct f2fs_iext_header *eh =
+		(struct f2fs_iext_header *)get_dnode_addr(inode, ifolio);
+	int inline_extents = EXT_ENTRY_COUNT(eh);
+	block_t blk_start, fofs_start;
+
+	if (inline_extents == 0)
+		return -ENOENT;
+	index = __iext_binsearch_idx(inode, ifolio, fofs);
+	hit = __is_iextent_hit(&eh->exts[index], fofs);
+	if (hit != F2FS_EXT_HIT_MID)
+		return -ENOENT;
+	blk_start = F2FS_EXT_PHYSICAL_START(&eh->exts[index]);
+	fofs_start = F2FS_EXT_LOGICAL_START(&eh->exts[index]);
+	if (blk_start == NEW_ADDR) {
+		*blkaddr = blk_start;
+		if (len)
+			*len = 1;
+	} else {
+		*blkaddr = blk_start + fofs - fofs_start;
+		if (len)
+			*len = F2FS_EXT_LEN(&eh->exts[index]) -
+					(fofs - fofs_start);
+	}
+	return 0;
+}
+
+int f2fs_iext_lookup_blkaddr(struct inode *inode, struct folio *ifolio,
+					block_t fofs, block_t *blkaddr,
+					unsigned int *len)
+{
+	int error = 0;
+	struct f2fs_iext_header *eh =
+		(struct f2fs_iext_header *)get_dnode_addr(inode, ifolio);
+	struct f2fs_extent *last_ext = EXT_LAST_INDEX(eh);
+
+	if (EXT_ENTRY_COUNT(eh) == 0 || F2FS_EXT_LOGICAL_END(last_ext) < fofs)
+		error = -ENOENT;
+	else
+		error = __iext_lookup_data_blkaddr(inode, ifolio, fofs,
+						blkaddr, len);
+
+	/* return NULL_ADDR for direct blocks. */
+	if (error && fofs < ADDRS_PER_INODE(inode)) {
+		*blkaddr = NULL_ADDR;
+		error = 0;
+		if (len)
+			*len = 1;
+	}
+	return error;
+}
+
+/*
+ * Exceptions:
+ * 1. inline extent area is full, blkaddr is overlap with EXT_LAST_INDEX()
+ *    1.1 blkaddr hit the right/left most or middle blk of EXT_LAST_INDEX()
+ *    1.2 the above cases is similar with extent merge
+ * 2. inline extent area is full, blkaddr is less than EXT_LAST_INDEX()
+ *    2.1 remove EXT_LAST_INDEX() and try again.
+ * 3. inline extent area is full, blkaddr is bigger than EXT_LAST_INDEX(), just
+ *    drop it.
+ *
+ * The above exceptions will be handled twice at most, because 1 insert
+ * operation may cause 2 extent insert operations at most.
+ *
+ * This function inform whether need to mark inode folio as dirty through return
+ * value.
+ */
+
+int f2fs_iext_update_data_blkaddr(struct inode *inode, struct folio *ifolio,
+					block_t fofs, block_t blkaddr)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	int error = 0, retry_cnt = 2, hit;
+	int direct_blocks = ADDRS_PER_INODE(inode);
+	unsigned int len;
+	struct f2fs_iext_header *eh =
+		(struct f2fs_iext_header *)get_dnode_addr(inode, ifolio);
+	struct f2fs_extent *last_ext;
+	block_t fofs_start;
+#ifdef CONFIG_F2FS_INLINE_EXTENT_DEBUG
+	struct f2fs_iext_info *iext_info = sbi->iext_info;
+#endif
+
+retry:
+	ASSERT(sbi, retry_cnt >= 0);
+	ASSERT(sbi, EXT_ENTRY_COUNT(eh) <= MAX_INLINE_EXTENTS(inode));
+	error = __iext_insert_idx(inode, ifolio, fofs, blkaddr);
+
+	if (!error)
+		return 0;
+	/*
+	 * fofs doesn't exists in inline extent area and bigger than last
+	 * fofs. Caller only need to give up insert.
+	 */
+	if (error == -E2BIG && fofs >= direct_blocks)
+		return F2FS_IEXT_INSERT_DROP;
+	/* evict the last extent and try to insert again. */
+	/* must be after __iext_insert_idx, which might remove extent. */
+	last_ext = EXT_LAST_INDEX(eh);
+	ASSERT(sbi, last_ext);
+	if (!last_ext)
+		return F2FS_IEXT_INSERT_CONVERT;
+	fofs_start = F2FS_EXT_LOGICAL_START(last_ext);
+	len = F2FS_EXT_LEN(last_ext);
+	hit = __is_iextent_hit(last_ext, fofs);
+	switch (hit) {
+	case F2FS_EXT_HIT_LEFT:
+		/*
+		 * if last extent cover direct blocks, we must interrupt and
+		 * trigger format conversion.
+		 */
+		if (fofs_start < direct_blocks) {
+			error = F2FS_IEXT_INSERT_CONVERT;
+			INLINE_EXT_STAT_INC(iext_info,
+					trigger_ext_format_convert);
+			goto out;
+		}
+		/*
+		 * whether fofs exceed ADDRS_PER_INODE or not, just delete the
+		 * lastest extent and try again.
+		 */
+		INLINE_EXT_STAT_INC(iext_info, evict_last_ext_cnt);
+		__ext_del_one_entry(eh, EXT_ENTRY_COUNT(eh) - 1);
+		break;
+	case F2FS_EXT_HIT_RIGHT:
+		/*
+		 * don't need to cache it in inline extent area and old mapping
+		 * has already removed.
+		 */
+		if (fofs >= direct_blocks) {
+			INLINE_EXT_STAT_INC(iext_info, drop_insert_new_ext_cnt);
+			error = F2FS_IEXT_INSERT_REMOVED;
+			goto out;
+		}
+		INLINE_EXT_STAT_INC(iext_info, trigger_ext_format_convert);
+		error = F2FS_IEXT_INSERT_CONVERT;
+		goto out;
+	case F2FS_EXT_HIT_MID:
+		/*
+		 * if `len == 1` then {fofs, blkaddr, 1} already overwrite old
+		 * extent.
+		 */
+		ASSERT(sbi, len > 1);
+		/*
+		 * truncate [fofs + 1, fofs_start + len - 1] and replace
+		 * last_ext with {fofs, blkaddr, 1}.
+		 * `fofs == fofs_start` will never happen, because
+		 * __iext_insert_idx will truncate fofs.
+		 *
+		 * truncate [fofs, fofs_start + len - 1] when fofs are out of
+		 * range of [0, direct_blocks).
+		 */
+		if (fofs > fofs_start && fofs >= direct_blocks) {
+			last_ext->len = cpu_to_le32(fofs - fofs_start);
+			INLINE_EXT_STAT_INC(iext_info, truncate_last_ext_cnt);
+			if (EXT_ENTRY_COUNT(eh) == MAX_INLINE_EXTENTS(inode)) {
+				error = F2FS_IEXT_INSERT_REMOVED;
+				goto out;
+			}
+		} else {
+			error = F2FS_IEXT_INSERT_CONVERT;
+			goto out;
+		}
+		break;
+	}
+	ASSERT(sbi, EXT_ENTRY_COUNT(eh) <= MAX_INLINE_EXTENTS(inode));
+	retry_cnt--;
+	goto retry;
+out:
+	return error;
+}
+
+static int __iext_convert_to_inline_extent(struct inode *inode,
+				       struct folio *direct_folio,
+				       struct folio *extent_folio)
+{
+	int i = 0, error, direct_blocks = ADDRS_PER_INODE(inode);
+	__le32 *arr = (__le32 *)get_dnode_addr(inode, direct_folio);
+
+	for (; i < direct_blocks; i++) {
+		error = __iext_insert_idx(inode, extent_folio, i,
+					le32_to_cpu(arr[i]));
+		if (error)
+			return error;
+	}
+
+	return 0;
+}
+
+bool f2fs_iext_convert_to_inline_extent(struct inode *inode,
+					struct folio *ifolio)
+{
+	struct f2fs_iext_info *iext_info = F2FS_I_SB(inode)->iext_info;
+	bool updated = false;
+	int ret;
+
+	if (f2fs_iext_support_inline_extent(inode, ifolio))
+		goto out;
+
+	mutex_lock(&iext_info->convert_lock);
+	memcpy(folio_address(iext_info->convert_folio),
+				folio_address(ifolio), PAGE_SIZE);
+	f2fs_iext_init_inline_extent(inode, ifolio);
+	ret = __iext_convert_to_inline_extent(inode, iext_info->convert_folio,
+				ifolio);
+	if (ret)
+		memcpy(folio_address(ifolio),
+				folio_address(iext_info->convert_folio),
+				PAGE_SIZE);
+	else
+		updated = true;
+	mutex_unlock(&iext_info->convert_lock);
+
+out:
+	return updated;
+}
+
+static void __iext_convert_to_direct_blocks(struct inode *inode,
+					struct folio *direct_folio,
+					struct folio *extent_folio)
+{
+	int i = 0, direct_blocks = ADDRS_PER_INODE(inode);
+	struct f2fs_iext_header *eh =
+		(struct f2fs_iext_header *)get_dnode_addr(inode, extent_folio);
+	int inline_extents = EXT_ENTRY_COUNT(eh);
+	int j, len;
+	struct f2fs_extent *ext;
+	block_t fofs_start = 0, blk_start;
+	__le32 *arr = (__le32 *)get_dnode_addr(inode, direct_folio);
+
+	/* set default to NULL_ADDR. */
+	memset(arr, 0, sizeof(__le32) * direct_blocks);
+	for (; fofs_start < direct_blocks && i < inline_extents; i++) {
+		ext = &eh->exts[i];
+		len = F2FS_EXT_LEN(ext);
+		fofs_start = F2FS_EXT_LOGICAL_START(ext);
+		blk_start = F2FS_EXT_PHYSICAL_START(ext);
+		for (j = 0; j < len && fofs_start < direct_blocks; j++) {
+			if (blk_start == NEW_ADDR)
+				arr[fofs_start++] = cpu_to_le32(blk_start);
+			else
+				arr[fofs_start++] = cpu_to_le32(blk_start + j);
+		}
+	}
+}
+
+void f2fs_iext_convert_to_direct_blocks(struct inode *inode,
+					struct folio *ifolio)
+{
+	struct f2fs_iext_info *iext_info = F2FS_I_SB(inode)->iext_info;
+
+	mutex_lock(&iext_info->convert_lock);
+	memcpy_to_folio(iext_info->convert_folio, 0,
+			folio_address(ifolio), PAGE_SIZE);
+	__iext_convert_to_direct_blocks(inode, ifolio,
+			iext_info->convert_folio);
+	mutex_unlock(&iext_info->convert_lock);
+}
+
+/* truncate extent starting from @fofs. */
+void f2fs_iext_truncate_from_blkaddr(struct inode *inode,
+					struct folio *ifolio, block_t fofs)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	int index, hit;
+	unsigned int len;
+	struct f2fs_iext_header *eh =
+		(struct f2fs_iext_header *)get_dnode_addr(inode, ifolio);
+	int inline_extents = EXT_ENTRY_COUNT(eh);
+	struct f2fs_extent *ext;
+	block_t fofs_start;
+
+	if (inline_extents == 0)
+		return;
+	index = __iext_binsearch_idx(inode, ifolio, fofs);
+
+	ext = &eh->exts[index];
+
+	hit = __is_iextent_hit(ext, fofs);
+	switch (hit) {
+	case F2FS_EXT_HIT_LEFT:
+		ASSERT(sbi, index == 0);
+		eh->cnt = cpu_to_le32(0);
+		break;
+	case F2FS_EXT_HIT_RIGHT:
+		eh->cnt = cpu_to_le32(index + 1);
+		break;
+	case F2FS_EXT_HIT_MID:
+		fofs_start = F2FS_EXT_LOGICAL_START(ext);
+		len = F2FS_EXT_LEN(ext);
+
+		if (len == 1 || fofs == fofs_start) {
+			eh->cnt = cpu_to_le32(index);
+			break;
+		}
+		ext->len = cpu_to_le32(fofs - fofs_start);
+		eh->cnt = cpu_to_le32(index + 1);
+		break;
+	default:
+		ASSERT(sbi, 0);
+	}
+}
+
+int f2fs_iext_info_init(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_iext_info *iext_info;
+	struct page *page;
+
+	iext_info = f2fs_kvzalloc(sbi, sizeof(struct f2fs_iext_info),
+				GFP_KERNEL);
+	if (!iext_info)
+		return -ENOMEM;
+
+	page = alloc_pages(GFP_KERNEL, 0);
+	if (!page) {
+		kvfree(iext_info);
+		return -ENOMEM;
+	}
+
+	iext_info->convert_folio = page_folio(page);
+	mutex_init(&iext_info->convert_lock);
+	spin_lock_init(&iext_info->iext_ext_lock);
+	sbi->iext_info = iext_info;
+	return 0;
+}
+
+void f2fs_iext_info_destroy(struct f2fs_sb_info *sbi)
+{
+	if (sbi->iext_info == NULL)
+		return;
+	__free_page(folio_page(sbi->iext_info->convert_folio, 0));
+	kvfree(sbi->iext_info);
+}
+
+int f2fs_iext_update_extension_list(struct f2fs_sb_info *sbi, const char *name,
+					bool set)
+{
+	struct f2fs_iext_info *iext_info = sbi->iext_info;
+	__u8 (*extlist)[F2FS_EXTENSION_LEN] = iext_info->extensions;
+	int count;
+	int i, ret = 0;
+	unsigned long flag;
+
+	if (strlen(name) >= F2FS_EXTENSION_LEN)
+		return -EINVAL;
+
+	spin_lock_irqsave(&iext_info->iext_ext_lock, flag);
+	count = iext_info->iext_ext_cnt;
+	if (set && count == IEXT_EXT_NUM) {
+		ret = -EINVAL;
+		goto out;
+	}
+	for (i = 0; i < count; i++) {
+		if (strcmp(name, extlist[i]))
+			continue;
+
+		if (set) {
+			ret = -EINVAL;
+			goto out;
+		}
+
+		memcpy(extlist[i], extlist[i + 1],
+				F2FS_EXTENSION_LEN * (count - i - 1));
+		memset(extlist[count - 1], 0, F2FS_EXTENSION_LEN);
+		iext_info->iext_ext_cnt--;
+		goto out;
+	}
+
+	if (!set) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	memcpy(extlist[count], name, strlen(name));
+	iext_info->iext_ext_cnt++;
+out:
+	spin_unlock_irqrestore(&iext_info->iext_ext_lock, flag);
+	return ret;
+}
diff --git a/fs/f2fs/iextent.h b/fs/f2fs/iextent.h
new file mode 100644
index 000000000000..e5fb028612ad
--- /dev/null
+++ b/fs/f2fs/iextent.h
@@ -0,0 +1,184 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * fs/f2fs/iextent.h
+ *
+ * Copyright (c) 2026 Xiaomi Technology Co., Ltd.
+ *             http://www.mi.com/
+ */
+#ifndef __F2FS_INLINE_EXTENT_H_
+#define __F2FS_INLINE_EXTENT_H_
+
+#include <linux/types.h>
+
+#define F2FS_IEXT_FORMAT_MAGIC1	0xF2F5EF00 /* F2FS Extent Format. */
+/* Use invalid data blkaddr as inline-extent identifier. */
+#define F2FS_IEXT_FORMAT_MAGIC2	(-3U)
+struct f2fs_iext_header {
+	__le32 magic1;		/* magic1 # to identify extent format. */
+	/* magic2 # cannot be a valid blkaddr in non-inline-extent format.*/
+	__le32 magic2;
+	__le32 cnt;		/* total # of extents. */
+	struct f2fs_extent exts[];
+};
+
+#define MAX_INLINE_EXTENTS(inode)	((ADDRS_PER_INODE(inode) * \
+			sizeof(__le32) - sizeof(struct f2fs_iext_header)) / \
+			sizeof(struct f2fs_extent))
+
+#define EXT_FIRST_INDEX(__hdr__) ((__hdr__)->exts)
+#define EXT_ENTRY_COUNT(__hdr__) (le32_to_cpu((__hdr__)->cnt))
+#define EXT_LAST_INDEX(__hdr__) \
+			(EXT_ENTRY_COUNT(__hdr__) ? \
+			&(__hdr__)->exts[EXT_ENTRY_COUNT(__hdr__) - 1] : \
+			NULL)
+
+#define F2FS_EXT_LEN(ext) (le32_to_cpu((ext)->len))
+#define F2FS_EXT_LOGICAL_START(ext) (le32_to_cpu((ext)->fofs))
+#define F2FS_EXT_LOGICAL_END(ext) \
+			((F2FS_EXT_LOGICAL_START(ext) + F2FS_EXT_LEN(ext)) - 1)
+#define F2FS_EXT_PHYSICAL_START(ext) (le32_to_cpu((ext)->blk))
+#define F2FS_EXT_PHYSICAL_END(ext) \
+			((F2FS_EXT_PHYSICAL_START(ext) + F2FS_EXT_LEN(ext)) - 1)
+
+#define IEXT_EXT_NUM 16
+struct f2fs_iext_info {
+	/* preallocated folio used for format conversion. */
+	struct folio *convert_folio;
+	struct mutex convert_lock;	/* protects convert_folio access */
+
+	spinlock_t iext_ext_lock;
+	unsigned char iext_ext_cnt;	/* extension count */
+	unsigned char extensions[IEXT_EXT_NUM][F2FS_EXTENSION_LEN];
+	bool iext_enable;
+#ifdef CONFIG_F2FS_INLINE_EXTENT_DEBUG
+	/* stat for inline extent code coverage. */
+	atomic64_t left_merge_count;
+	atomic64_t right_merge_count;
+	atomic64_t fast_right_merge_count;
+	atomic64_t lr_merge_count;
+	atomic64_t split_left_count;
+	atomic64_t split_right_count;
+	atomic64_t split_mid_count;
+	atomic64_t insert_new_ext_count;
+	atomic64_t overwrite_ext_count;
+	atomic64_t add_ext_count;
+	atomic64_t del_ext_count;
+	atomic64_t evict_last_ext_cnt;
+	atomic64_t truncate_last_ext_cnt;
+	atomic64_t drop_insert_new_ext_cnt;
+	atomic64_t trigger_ext_format_convert;
+#endif
+};
+
+enum {
+	/* insert extent correctly */
+	F2FS_IEXT_INSERT_NORMAL = 0,
+	/* inline area cannot cover all direct blocks */
+	F2FS_IEXT_INSERT_CONVERT,
+	/* didn't modify inode folio, because no space and fofs is too big */
+	F2FS_IEXT_INSERT_DROP,
+	/* modify inode folio, but didn't insert due to no space */
+	F2FS_IEXT_INSERT_REMOVED,
+};
+
+#ifdef CONFIG_F2FS_INLINE_EXTENT_DEBUG
+#define INLINE_EXT_STAT_INC(iext_info, member) \
+			atomic64_inc(&(iext_info)->member)
+#else
+#define INLINE_EXT_STAT_INC(iext_info, member) do { } while (0)
+#endif
+
+#ifdef CONFIG_F2FS_INLINE_EXTENT
+static inline bool f2fs_iext_support_inline_extent(struct inode *inode,
+			struct folio *ifolio)
+{
+	struct f2fs_iext_header *eh =
+		(struct f2fs_iext_header *)get_dnode_addr(inode, ifolio);
+
+	if (__le32_to_cpu(eh->magic1) == F2FS_IEXT_FORMAT_MAGIC1 &&
+			__le32_to_cpu(eh->magic2) == F2FS_IEXT_FORMAT_MAGIC2)
+		return true;
+	return false;
+}
+
+static inline void f2fs_iext_init_inline_extent(struct inode *inode,
+			struct folio *ifolio)
+{
+	struct f2fs_iext_header *eh =
+		(struct f2fs_iext_header *)get_dnode_addr(inode, ifolio);
+
+	eh->magic1 = __cpu_to_le32(F2FS_IEXT_FORMAT_MAGIC1);
+	eh->magic2 = __cpu_to_le32(F2FS_IEXT_FORMAT_MAGIC2);
+	eh->cnt = 0;
+}
+
+static inline bool f2fs_iext_is_enable(struct f2fs_sb_info *sbi)
+{
+	struct f2fs_iext_info *iext_info = sbi->iext_info;
+
+	return READ_ONCE(iext_info->iext_enable);
+}
+
+static inline void f2fs_iext_set_enable(struct f2fs_sb_info *sbi, bool enable)
+{
+	struct f2fs_iext_info *iext_info = sbi->iext_info;
+
+	WRITE_ONCE(iext_info->iext_enable, enable);
+}
+
+static inline block_t f2fs_iext_last_fofs(struct inode *inode,
+			struct folio *ifolio)
+{
+	struct f2fs_iext_header *eh =
+		(struct f2fs_iext_header *)get_dnode_addr(inode, ifolio);
+
+	if (EXT_ENTRY_COUNT(eh) == 0)
+		return 0;
+
+	return F2FS_EXT_LOGICAL_END(EXT_LAST_INDEX(eh));
+}
+#else
+static inline bool f2fs_iext_support_inline_extent(struct inode *inode,
+			struct folio *ifolio)
+{
+	return false;
+}
+
+static inline void f2fs_iext_init_inline_extent(struct inode *inode,
+			struct folio *ifolio)
+{
+}
+
+static inline bool f2fs_iext_is_enable(struct f2fs_sb_info *sbi)
+{
+	return false;
+}
+
+static inline void f2fs_iext_set_enable(struct f2fs_sb_info *sbi, bool enable)
+{
+}
+
+static inline block_t f2fs_iext_last_fofs(struct inode *inode,
+			struct folio *ifolio)
+{
+	return 0;
+}
+#endif
+
+bool f2fs_iext_sanity_check(struct folio *ifolio);
+int f2fs_iext_lookup_blkaddr(struct inode *inode, struct folio *ifolio,
+					block_t fofs, block_t *blkaddr,
+					unsigned int *len);
+int f2fs_iext_update_data_blkaddr(struct inode *inode, struct folio *ifolio,
+					block_t fofs, block_t blkaddr);
+bool f2fs_iext_convert_to_inline_extent(struct inode *inode,
+					struct folio *ifolio);
+void f2fs_iext_convert_to_direct_blocks(struct inode *inode,
+					struct folio *ifolio);
+void f2fs_iext_truncate_from_blkaddr(struct inode *inode,
+					struct folio *ifolio, block_t fofs);
+int f2fs_iext_update_extension_list(struct f2fs_sb_info *sbi, const char *name,
+					bool set);
+int f2fs_iext_info_init(struct f2fs_sb_info *sbi);
+void f2fs_iext_info_destroy(struct f2fs_sb_info *sbi);
+#endif
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 099f72089701..8b4f9359a471 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -13,6 +13,7 @@
 
 #include "f2fs.h"
 #include "node.h"
+#include "iextent.h"
 #include <trace/events/f2fs.h>
 
 static bool support_inline_data(struct inode *inode)
@@ -212,6 +213,12 @@ int f2fs_convert_inline_folio(struct dnode_of_data *dn, struct folio *folio)
 clear_out:
 	stat_dec_inline_inode(dn->inode);
 	clear_inode_flag(dn->inode, FI_INLINE_DATA);
+#ifdef CONFIG_F2FS_INLINE_EXTENT
+	if (F2FS_I(dn->inode)->i_flags & F2FS_EXTENT_FL)
+		if (f2fs_iext_convert_to_inline_extent(
+					dn->inode, dn->inode_folio))
+			folio_mark_dirty(dn->inode_folio);
+#endif
 	f2fs_put_dnode(dn);
 	return 0;
 }
diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index cac03b8e91a1..f6afb3f66611 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -20,6 +20,7 @@
 #include "segment.h"
 #include "xattr.h"
 #include "acl.h"
+#include "iextent.h"
 #include <trace/events/f2fs.h>
 
 static inline bool is_extension_exist(const unsigned char *s, const char *sub,
@@ -70,6 +71,13 @@ static inline bool is_compress_extension(const unsigned char *s, const char *sub
 	return is_extension_exist(s, sub, true, true);
 }
 
+#ifdef CONFIG_F2FS_INLINE_EXTENT
+static inline bool is_iext_extension(const unsigned char *s, const char *sub)
+{
+	return is_extension_exist(s, sub, true, true);
+}
+#endif
+
 int f2fs_update_extension_list(struct f2fs_sb_info *sbi, const char *name,
 							bool hot, bool set)
 {
@@ -231,6 +239,42 @@ static void set_file_temperature(struct f2fs_sb_info *sbi, struct inode *inode,
 		file_set_hot(inode);
 }
 
+#ifdef CONFIG_F2FS_INLINE_EXTENT
+static void set_iext_new_inode(struct f2fs_sb_info *sbi, struct inode *inode,
+				const unsigned char *name)
+{
+	struct f2fs_iext_info *iext_info = sbi->iext_info;
+	unsigned char (*ext)[F2FS_EXTENSION_LEN] = iext_info->extensions;
+	unsigned long flag;
+	int i;
+
+	if (f2fs_compressed_file(inode))
+		return;
+
+	if (S_ISDIR(inode->i_mode))
+		return;
+
+	if (!f2fs_iext_is_enable(sbi))
+		return;
+
+	/* This name comes only from normal files. */
+	if (!name)
+		return;
+
+	spin_lock_irqsave(&iext_info->iext_ext_lock, flag);
+	/* Mark wanting extension file as inline extent format. */
+	for (i = 0; i < iext_info->iext_ext_cnt; i++) {
+		if (is_iext_extension(name, ext[i])) {
+			F2FS_I(inode)->i_flags |= F2FS_EXTENT_FL;
+			spin_unlock_irqrestore(&iext_info->iext_ext_lock, flag);
+			f2fs_mark_inode_dirty_sync(inode, true);
+			return;
+		}
+	}
+	spin_unlock_irqrestore(&iext_info->iext_ext_lock, flag);
+}
+#endif
+
 static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
 						struct inode *dir, umode_t mode,
 						const char *name)
@@ -327,6 +371,10 @@ static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
 	/* Check compression first. */
 	set_compress_new_inode(sbi, dir, inode, name);
 
+#ifdef CONFIG_F2FS_INLINE_EXTENT
+	/* must be set after compress flag set. */
+	set_iext_new_inode(sbi, inode, name);
+#endif
 	/* Should enable inline_data after compression set */
 	if (test_opt(sbi, INLINE_DATA) && f2fs_may_inline_data(inode))
 		set_inode_flag(inode, FI_INLINE_DATA);
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index cd5a394f6111..2317de756322 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -19,6 +19,7 @@
 #include "segment.h"
 #include "xattr.h"
 #include "iostat.h"
+#include "iextent.h"
 #include <trace/events/f2fs.h>
 
 #define on_f2fs_build_free_nids(nm_i) mutex_is_locked(&(nm_i)->build_lock)
@@ -819,6 +820,7 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
 	nid_t nids[4];
 	int level, i = 0;
 	int err = 0;
+	bool lock_ifolio = false;
 
 	level = get_node_path(dn->inode, index, offset, noffset);
 	if (level < 0)
@@ -846,6 +848,8 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
 		nids[1] = get_nid(parent, offset[0], true);
 	dn->inode_folio = nfolio[0];
 	dn->inode_folio_locked = true;
+	if (f2fs_iext_support_inline_extent(dn->inode, dn->inode_folio))
+		lock_ifolio = true;
 
 	/* get indirect or direct nodes */
 	for (i = 1; i <= level; i++) {
@@ -888,8 +892,10 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
 			done = true;
 		}
 		if (i == 1) {
-			dn->inode_folio_locked = false;
-			folio_unlock(parent);
+			if (!lock_ifolio) {
+				dn->inode_folio_locked = false;
+				folio_unlock(parent);
+			}
 		} else {
 			f2fs_folio_put(parent, true);
 		}
@@ -899,7 +905,8 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
 						NODE_TYPE_NON_INODE);
 			if (IS_ERR(nfolio[i])) {
 				err = PTR_ERR(nfolio[i]);
-				f2fs_folio_put(nfolio[0], false);
+				f2fs_folio_put(nfolio[0],
+						dn->inode_folio_locked);
 				goto release_out;
 			}
 		}
@@ -945,7 +952,7 @@ int f2fs_get_dnode_of_data(struct dnode_of_data *dn, pgoff_t index, int mode)
 release_pages:
 	f2fs_folio_put(parent, true);
 	if (i > 1)
-		f2fs_folio_put(nfolio[0], false);
+		f2fs_folio_put(nfolio[0], dn->inode_folio_locked);
 release_out:
 	dn->inode_folio = NULL;
 	dn->node_folio = NULL;
@@ -1194,6 +1201,7 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from)
 	unsigned int nofs = 0;
 	struct dnode_of_data dn;
 	struct folio *folio;
+	bool lock_ifolio = false;
 
 	trace_f2fs_truncate_inode_blocks_enter(inode, from);
 
@@ -1217,7 +1225,16 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from)
 	}
 
 	set_new_dnode(&dn, inode, folio, NULL, 0);
-	folio_unlock(folio);
+#ifdef CONFIG_F2FS_INLINE_EXTENT
+	if (f2fs_iext_support_inline_extent(inode, folio)) {
+		lock_ifolio = true;
+		f2fs_iext_truncate_from_blkaddr(inode, folio,
+				MAX(ADDRS_PER_INODE(inode), from));
+	} else
+#endif
+	{
+		folio_unlock(folio);
+	}
 
 	switch (level) {
 	case 0:
@@ -1282,17 +1299,19 @@ int f2fs_truncate_inode_blocks(struct inode *inode, pgoff_t from)
 		if (err < 0)
 			goto fail;
 		if (offset[1] == 0 && get_nid(folio, offset[0], true)) {
-			folio_lock(folio);
+			if (!lock_ifolio)
+				folio_lock(folio);
 			BUG_ON(!is_node_folio(folio));
 			set_nid(folio, offset[0], 0, true);
-			folio_unlock(folio);
+			if (!lock_ifolio)
+				folio_unlock(folio);
 		}
 		offset[1] = 0;
 		offset[0]++;
 		nofs += err;
 	}
 fail:
-	f2fs_folio_put(folio, false);
+	f2fs_folio_put(folio, lock_ifolio);
 	trace_f2fs_truncate_inode_blocks_exit(inode, err);
 	return err > 0 ? 0 : err;
 }
@@ -1608,6 +1627,14 @@ static struct folio *__get_node_folio(struct f2fs_sb_info *sbi, pgoff_t nid,
 		err = -EFSBADCRC;
 		goto out_err;
 	}
+#ifdef CONFIG_F2FS_INLINE_EXTENT
+	if (IS_INODE(folio) &&
+			f2fs_iext_support_inline_extent(NULL, folio) &&
+			!f2fs_iext_sanity_check(folio)) {
+		err = -EINVAL;
+		goto out_err;
+	}
+#endif
 page_hit:
 	err = f2fs_sanity_check_node_footer(sbi, folio, nid, ntype, false);
 	if (!err)
@@ -3577,3 +3604,26 @@ void f2fs_destroy_node_manager_caches(void)
 	kmem_cache_destroy(free_nid_slab);
 	kmem_cache_destroy(nat_entry_slab);
 }
+
+#ifdef CONFIG_F2FS_INLINE_EXTENT
+int f2fs_iext_data_blkaddr(struct inode *inode,
+			struct folio *node_folio, unsigned int offset,
+			block_t *blkaddr)
+{
+	int ret = -EINVAL;
+
+	if (IS_INODE(node_folio) &&
+			f2fs_iext_support_inline_extent(inode, node_folio)) {
+		block_t fofs = f2fs_start_bidx_of_node(
+						ofs_of_node(node_folio),
+						inode) + offset;
+		f2fs_bug_on(F2FS_I_SB(inode), fofs != offset);
+		f2fs_bug_on(F2FS_I_SB(inode), !folio_test_locked(node_folio));
+
+		ret = f2fs_iext_lookup_blkaddr(inode, node_folio, fofs, blkaddr,
+						NULL);
+		f2fs_bug_on(F2FS_I_SB(inode), ret);
+	}
+	return ret;
+}
+#endif
diff --git a/fs/f2fs/node.h b/fs/f2fs/node.h
index 5e114f352099..28c10787e5bb 100644
--- a/fs/f2fs/node.h
+++ b/fs/f2fs/node.h
@@ -259,6 +259,10 @@ static inline unsigned int ofs_of_node(const struct folio *node_folio)
 	return flag >> OFFSET_BIT_SHIFT;
 }
 
+int f2fs_iext_data_blkaddr(struct inode *inode,
+			struct folio *node_folio, unsigned int offset,
+			block_t *blkaddr);
+
 static inline __u64 cpver_of_node(const struct folio *node_folio)
 {
 	struct f2fs_node *rn = F2FS_NODE(node_folio);
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 89af8407b667..94f0d7c2e42e 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -13,6 +13,7 @@
 #include "f2fs.h"
 #include "node.h"
 #include "segment.h"
+#include "iextent.h"
 
 /*
  * Roll forward recovery scenarios.
@@ -665,6 +666,22 @@ static int do_recover_data(struct f2fs_sb_info *sbi, struct inode *inode,
 		}
 		goto out;
 	}
+#ifdef CONFIG_F2FS_INLINE_EXTENT
+	if (f2fs_iext_support_inline_extent(inode,
+			dn.inode_folio)) {
+		f2fs_bug_on(F2FS_I_SB(inode),
+				!dn.inode_folio_locked);
+		f2fs_bug_on(F2FS_I_SB(inode),
+				!folio_test_locked(dn.inode_folio));
+		f2fs_folio_wait_writeback(dn.inode_folio, NODE, true, true);
+		if (f2fs_iext_last_fofs(inode, dn.inode_folio) >=
+				ADDRS_PER_INODE(inode)) {
+			f2fs_iext_truncate_from_blkaddr(inode,
+					dn.inode_folio, ADDRS_PER_INODE(inode));
+			folio_mark_dirty(dn.inode_folio);
+		}
+	}
+#endif
 
 	f2fs_folio_wait_writeback(dn.node_folio, NODE, true, true);
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 20577e33ee2a..3025ef1ca09a 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -37,6 +37,7 @@
 #include "xattr.h"
 #include "gc.h"
 #include "iostat.h"
+#include "iextent.h"
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/f2fs.h>
@@ -5037,6 +5038,12 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 
 	sbi->sb = sb;
 
+#ifdef CONFIG_F2FS_INLINE_EXTENT
+	err = f2fs_iext_info_init(sbi);
+	if (err)
+		goto free_sbi;
+#endif
+
 	/* initialize locks within allocated memory */
 	init_f2fs_rwsem_trace(&sbi->gc_lock, sbi, LOCK_NAME_GC_LOCK);
 	mutex_init(&sbi->writepages);
@@ -5524,6 +5531,9 @@ static int f2fs_fill_super(struct super_block *sb, struct fs_context *fc)
 free_sbi:
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 	lockdep_unregister_key(&sbi->cp_global_sem_key);
+#endif
+#ifdef CONFIG_F2FS_INLINE_EXTENT
+	f2fs_iext_info_destroy(sbi);
 #endif
 	kfree(sbi);
 	sb->s_fs_info = NULL;
@@ -5608,6 +5618,9 @@ static void kill_f2fs_super(struct super_block *sb)
 		destroy_device_list(sbi);
 #ifdef CONFIG_DEBUG_LOCK_ALLOC
 		lockdep_unregister_key(&sbi->cp_global_sem_key);
+#endif
+#ifdef CONFIG_F2FS_INLINE_EXTENT
+		f2fs_iext_info_destroy(sbi);
 #endif
 		kfree(sbi);
 		sb->s_fs_info = NULL;
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
