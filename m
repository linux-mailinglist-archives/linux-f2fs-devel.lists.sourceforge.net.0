Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UISmL/d5/GkQQgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 07 May 2026 13:39:35 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 392374E795C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 07 May 2026 13:39:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yflDlIxP0z90ysRtNDrq9jFgx6MfXwLEj2iDPN/8lBw=; b=PR6F5xzQu5EvmcONmWKKzIO4Lj
	zbEmOKqdVrhoGV0lquuTHSJYMMoydNtNKgxRMIrbLdUXYTreBNV4t2d4WUrwJP44UbSYRuQUNYi4W
	cA+cV3WisjJz+H1cUq6OdZ3f1oHj3Ls2KiU+0jFPNoyDNfWJYTjAK6Yh8TdLV+ZTwSyE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wKx4h-0004bN-Lm;
	Thu, 07 May 2026 11:39:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <monty_pavel@sina.com>) id 1wKx4e-0004bA-AO
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 May 2026 11:39:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=svhJxA7M8e6jSkmMPFhr1zfRIcx4YEYO7pH4BZPvcGU=; b=Qm0OTAjJuZEwernWolcHY5K9Ny
 vI8tB6jZ8sOceAlp5I6bLOxEyfwjfpN+f++8oAhGaU3U9gopCrQNvhJ5uhUECDqUNrQadT0RNzOM/
 G5Yjn2J7Aaad9fQf89P0rQLKlm5NYFA0BauhGpjSOuQevzYOzMmtPROqBXwkA6B+Qcks=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=svhJxA7M8e6jSkmMPFhr1zfRIcx4YEYO7pH4BZPvcGU=; b=i
 pTVpInWVUcFjMOj6KlYZquhWwTS9objjJrO9CJ+01qtq/uXmAveMQs5XRXKBxiFbewCiJzamGm8WF
 9a5rXOSWtdj5KhI4hQj3IbZl2voq2mNL/IJQxWyNF6kxQB99EHDaP3auMJAgt+4fzcCUojLV1k99J
 OUWUKTN8dQzeuHd0=;
Received: from r3-18.sinamail.sina.com.cn ([202.108.3.18])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wKx4Y-0002kZ-Ns for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 May 2026 11:39:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208;
 t=1778153958; bh=svhJxA7M8e6jSkmMPFhr1zfRIcx4YEYO7pH4BZPvcGU=;
 h=From:Subject:Date:Message-ID;
 b=OwyXfgjYW8GyQPS3Y3VcTdQG9nUgzkdtw02l0L8qOP3IQFog5+EXbnVf6lOfwPjxs
 IoJlwN9MudR/6oIhv1641T1RyNvAdUNwVkVIfoT/8/cpZ0lH3c8Zu6kzPexJNREYKF
 LKIQIjjrPDO62ZtjYtIwOAZjFmGhvL8k6Jquf+qA=
X-SMAIL-HELO: xiaomi-ThinkCentre-M760t.mioffice.cn
Received: from unknown (HELO
 xiaomi-ThinkCentre-M760t.mioffice.cn)([114.247.175.249])
 by sina.com (10.54.253.32) with ESMTP
 id 69FC79D6000021A4; Thu, 7 May 2026 19:39:04 +0800 (CST)
X-Sender: monty_pavel@sina.com
X-Auth-ID: monty_pavel@sina.com
Authentication-Results: sina.com; spf=none smtp.mailfrom=monty_pavel@sina.com;
 dkim=none header.i=none;
 dmarc=none action=none header.from=monty_pavel@sina.com
X-SMAIL-MID: 8635804456680
X-SMAIL-UIID: 96D5AB7D6EEC42CBB7EFCDCE2F5CFC89-20260507-193904-1
From: Yongpeng Yang <monty_pavel@sina.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Thu,  7 May 2026 19:38:37 +0800
Message-ID: <20260507113840.1353304-2-monty_pavel@sina.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Yongpeng Yang This patchset introduces an inline extent
 mapping mechanism for f2fs. Instead of storing individual block addresses
 in the inode's data block address area (i_addr[]),
 this feature packs contiguous blo [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [monty_pavel(at)sina.com]
X-Headers-End: 1wKx4Y-0002kZ-Ns
Subject: [f2fs-dev] [RFC PATCH 0/4] f2fs: introduce inline extent mapping
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
X-Rspamd-Queue-Id: 392374E795C
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[sina.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[sina.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,lists.sourceforge.net];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[monty_pavel@sina.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,sina.com:s=201208];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,sina.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sina.com:mid,xiaomi.com:email,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Action: no action

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

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

  # Benchmark: 64K random buffered read, 1GB total IO
  fio --name=buffer-read --ioengine=libaio --rw=randread --bs=64K \
      --size=8G --io_size=1G --numjobs=1 --filename=data.mp4

Results (64K random read bandwidth):

  +---------------------+------------+
  | Configuration       | Bandwidth  |
  +---------------------+------------+
  | inline extent OFF   | 284 MiB/s  |
  | inline extent ON    | 321 MiB/s  |
  +---------------------+------------+
  | Improvement         | +13%       |
  +---------------------+------------+

The improvement comes from eliminating direct/indirect node page reads
during block address lookup -- all mappings are stored directly in
the inode page and found via O(log n) binary search.

Yongpeng Yang (4):
  f2fs: replace raw dnode pointer arithmetic with f2fs_data_blkaddr()
  f2fs: introduce inline extent mapping for inode data blocks
  f2fs: support setting inline extent flag via ioctl
  f2fs: add sysfs interface for inline extent management

 fs/f2fs/Kconfig    |  18 +
 fs/f2fs/Makefile   |   1 +
 fs/f2fs/data.c     | 149 +++++++-
 fs/f2fs/debug.c    |   4 +
 fs/f2fs/dir.c      |   9 +
 fs/f2fs/f2fs.h     |  23 +-
 fs/f2fs/file.c     |  93 ++++-
 fs/f2fs/iextent.c  | 826 +++++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/iextent.h  | 170 ++++++++++
 fs/f2fs/inline.c   |   7 +
 fs/f2fs/namei.c    |  48 +++
 fs/f2fs/node.c     |  81 ++++-
 fs/f2fs/node.h     |   4 +
 fs/f2fs/recovery.c |  17 +
 fs/f2fs/super.c    |  13 +
 fs/f2fs/sysfs.c    |  51 +++
 16 files changed, 1500 insertions(+), 14 deletions(-)
 create mode 100644 fs/f2fs/iextent.c
 create mode 100644 fs/f2fs/iextent.h

--
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
