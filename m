Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id +QJEMCR2RmruVwsAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 02 Jul 2026 16:31:00 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7B86F8E2F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 02 Jul 2026 16:30:59 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=jkq6Fanr;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b="SQ/KGMVx";
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=FbVqnBxO;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=nQQ3wYnz;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HUPdX7MoO3th6rlEE6sW+Fw/C9uEZ3+xAt+Dl1cpb8s=; b=jkq6FanrNFyOUYgxN6cVvgd/A7
	7OZ/2v6FyAJj4dne07ehRDjAZtBjkF6tS6KJmEId0odGFfopnABISCILKTZYZUyWU5Bs+1QTl7gpI
	bqQFtGz55D69fJvnEkT9leCy8/iXpWaERPVajtopSqtT5B3utz6PrCKryzx7eqTxxuiw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wfIRF-00009u-OE;
	Thu, 02 Jul 2026 14:30:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1wfIQm-00009Q-8s
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Jul 2026 14:30:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rFq+OINmUXKGlmjnlSY1tM2SnwGkTK6v9NJeoWagfZ0=; b=SQ/KGMVxeuY9apzK9zuSKyJStN
 h6/cBFn42xroTcmHmVdvnTxEzUZZcI+o9VQYMGSYrfyxck22Nmcsb3Don0ZMFtDPixCvebYUYyYTg
 nwL+7cx8/FH9mUROEGRve0Cciztl7NiP5ScZs59HVwKHWSwbdAaYgvuq9bPqlbQ8BLsA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rFq+OINmUXKGlmjnlSY1tM2SnwGkTK6v9NJeoWagfZ0=; b=FbVqnBxO8hFzr8Qf6CGMj8jdSp
 ef2cC8D8ubd3VZRjXp+YD/a5NPpD11Wuwe5VD1N/k0DYCascRcHlMGYQETLneR9JweFNfT5MF7Rw5
 YV8+hDWscLgpznHy6beRJa28L2ontk7KPKDtNZ4s1mQqleyW+aYl30RLKrUiXeQR/5aU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wfIQh-0004WB-HA for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Jul 2026 14:30:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 9E32D43F13;
 Thu,  2 Jul 2026 14:30:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5556D1F00A3A;
 Thu,  2 Jul 2026 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783002605;
 bh=rFq+OINmUXKGlmjnlSY1tM2SnwGkTK6v9NJeoWagfZ0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=nQQ3wYnzkb6toy2KmQQIbnwVJUyzIrCF4V4Kzoyaf0QXO0b7VHftlWTQV4TxgLDPP
 nXf2cfxMYC/OjEFizaraBRBxQO8M3uwqJSuQHTlD/ybZDO3SPPkanYQJ8tOUnfSd7Y
 XkJsNS4INwUtRBjE8n+/Dzg3oEqFaESbObF+Pw1i24P12koj6JvhuKKRW3W4gnTO44
 wNtSi/9iAVd2Qe9YElosooI8TeR8VITxMKaehCxvy8duso/VokCvkR9S0R14F+I1Bv
 ZLuxF0VX9foa7ro1aeyQK1ZAcMJmlQCREzf6x1nqcZjNBEFexUYa/xIE29yYAtV/Kh
 8fzcAC9qAKetA==
Date: Thu, 2 Jul 2026 14:30:03 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <akZ161iaNMoem0wy@google.com>
References: <20260529085629.2664539-1-yangyongpeng.storage@gmail.com>
 <7862f9d0-278f-4bf8-ae6b-9413dc52f841@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7862f9d0-278f-4bf8-ae6b-9413dc52f841@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 06/25, Chao Yu via Linux-f2fs-devel wrote: > Sorry for
 the delay. > > On 5/29/26 16:56, Yongpeng Yang wrote: > > From: Yongpeng Yang
 <yangyongpeng@xiaomi.com> > > > > Changes since v1: > > - Introd [...] 
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
X-Headers-End: 1wfIQh-0004WB-HA
Subject: Re: [f2fs-dev] [RFC PATCH v2 0/5] f2fs: introduce inline extent
 mapping for inode data blocks
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 Yongpeng Yang <monty_pavel@sina.com>,
 Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:yangyongpeng@xiaomi.com,m:monty_pavel@sina.com,m:yangyongpeng.storage@gmail.com,m:linux-f2fs-devel@lists.sourceforge.net,m:yangyongpengstorage@gmail.com,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FREEMAIL_CC(0.00)[xiaomi.com,sina.com,gmail.com,lists.sourceforge.net];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp,xiaomi.com:email];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[jaegeuk@kernel.org]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7B7B86F8E2F

On 06/25, Chao Yu via Linux-f2fs-devel wrote:
> Sorry for the delay.
> 
> On 5/29/26 16:56, Yongpeng Yang wrote:
> > From: Yongpeng Yang <yangyongpeng@xiaomi.com>
> > 
> > Changes since v1:
> > - Introduce tracepoints for f2fs_iext_update_data_blkaddr and
> >   f2fs_iext_lookup_blkaddr to aid debugging (new patch 5/5).
> > - Bypass inline extent lookup for F2FS_GET_BLOCK_PRECACHE to ensure all
> >   mappings are loaded into the read extent cache.
> > - Unify the check for fofs exceeding direct_blocks range to use
> >   "fofs >= direct_blocks" consistently.
> > - Remove support for caching NULL_ADDR in inline extent area. If a fofs
> >   within [0, direct_blocks) is not found in inline extent, it implies
> >   NULL_ADDR. This simplifies merge and split logic.
> > - Fix f2fs_iext_enable_inline_extent to use PTR_ERR instead of -ENOMEM.
> > - Change f2fs_iext_convert_to_inline_extent return type to bool.
> > - Add benchmark data covering 4K/8K/32K/64K random read.
> > - Rename __is_extent_mergeable to __is_iextent_mergeable to avoid
> >   naming collision with extent cache code.
> > - Remove inode parameter from f2fs_iext_sanity_check (always NULL).
> > - Reduce #ifdef CONFIG_F2FS_INLINE_EXTENT nesting in node.c.
> > - Code style fixes to comply with kernel coding style.
> > 
> > This patchset introduces an inline extent mapping mechanism for f2fs.
> > Instead of storing individual block addresses in the inode's data block
> > address area (i_addr[]), this feature packs contiguous block ranges into
> > compact extent entries, significantly reducing the number of entries
> > needed and enabling faster block address lookups via binary search.
> > 
> > The inline extent format is identified by magic numbers in the inode
> > data area and is transparent to the rest of f2fs -- when the extent
> > area is full or cannot represent the mapping efficiently, it
> > automatically converts back to the direct block address format.
> > 
> > Patch 1: Preparatory refactoring -- replace raw pointer arithmetic
> >          with f2fs_data_blkaddr() to abstract block address access.
> > Patch 2: Core implementation -- data structures, extent operations
> >          (lookup, insert, merge, split, truncate), format conversion,
> >          and integration with f2fs data/node paths.
> > Patch 3: ioctl interface -- allow per-file enable/disable of inline
> >          extent format via F2FS_EXTENT_FL flag.
> > Patch 4: sysfs interface -- runtime enable/disable toggle and file
> >          extension list for automatic inline extent activation.
> > Patch 5: Tracepoints for inline extent lookup and update operations.
> > 
> > Test setup and results:
> > =======================
> > 
> > Platform: Xiaomi smartphone, UFS 4.0 storage
> > 
> >   # Enable inline extent
> >   echo 1 > /sys/fs/f2fs/<dev>/inline_extent_enable
> >   echo 'mp4' > /sys/fs/f2fs/<dev>/inline_extent_extension_list
> > 
> >   # Prepare data: write with 4K offset stride to create fragmented
> >   # extents, then overwrite sequentially so inline extent can cache
> >   # all mappings in compact form.
> >   fio --name=test --filename=data.mp4 --rw=write:4k --bs=64M \
> >       --size=8G --ioengine=libaio --direct=1
> >   sync
> >   fio --name=test --filename=data.mp4 --rw=write --bs=64M \
> >       --size=8G --ioengine=libaio --direct=1
> >   sync
> >   echo 3 > /proc/sys/vm/drop_caches
> > 
> >   # Benchmark: random buffered read, 1GB total IO
> >   fio --name=buffer-read --ioengine=libaio --rw=randread --bs=$BS \
> >       --size=8G --io_size=1G --numjobs=1 --filename=data.mp4
> > 
> > Results (random read bandwidth, MiB/s):
> > +---------------------------------------------------+
> > | BS     | baseline | inline ext | improvement      |
> > |--------+----------+------------+------------------|
> > | 4K     | 35       | 36         | +2.5%            |
> > | 8K     | 60       | 62         | +3%              |
> > | 32K    | 179      | 191        | +6.8%            |
> > | 64K    | 284      | 321        | +13%             |
> > +---------------------------------------------------+
> > 
> > The improvement comes from eliminating direct/indirect node page reads
> > during block address lookup -- all mappings are stored directly in
> > the inode page and found via O(log n) binary search.
> > 
> > Yongpeng Yang (5):
> >   f2fs: replace raw dnode pointer arithmetic with f2fs_data_blkaddr()
> >   f2fs: introduce inline extent mapping for inode data blocks
> >   f2fs: support setting inline extent flag via ioctl
> >   f2fs: add sysfs interface for inline extent management
> >   f2fs: introduce tracepoints for inline extent lookup and update
> > 
> >  fs/f2fs/Kconfig             |  18 +
> >  fs/f2fs/Makefile            |   1 +
> >  fs/f2fs/data.c              | 157 ++++++-
> >  fs/f2fs/debug.c             |   4 +
> >  fs/f2fs/dir.c               |   9 +
> >  fs/f2fs/f2fs.h              |  23 +-
> >  fs/f2fs/file.c              |  93 +++-
> >  fs/f2fs/iextent.c           | 873 ++++++++++++++++++++++++++++++++++++
> >  fs/f2fs/iextent.h           | 187 ++++++++
> >  fs/f2fs/inline.c            |   7 +
> >  fs/f2fs/namei.c             |  48 ++
> >  fs/f2fs/node.c              |  66 ++-
> >  fs/f2fs/node.h              |   4 +
> >  fs/f2fs/recovery.c          |  17 +
> >  fs/f2fs/super.c             |  13 +
> >  fs/f2fs/sysfs.c             |  52 +++
> >  include/trace/events/f2fs.h |  79 ++++
> >  17 files changed, 1635 insertions(+), 16 deletions(-)
> 
> It's quite a large number of change (including f2fs-tools change) to support
> this new feature, it causes the performance price ratio a little bit low.
> 
> About inode disk layout, as we discuss offline, maybe we can add 4 or 8 ...
> extents in i_extra_attr area of f2fs_inode structure, it can reduce the
> change line and code complex, however, not sure how will it affect the
> benefits.
> 
> To Jaegeuk, please share your thoughts on this feature.

Agreed. Can we try to add more extents simply?

> 
> Thanks,
> 
> >  create mode 100644 fs/f2fs/iextent.c
> >  create mode 100644 fs/f2fs/iextent.h
> > 
> 
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
