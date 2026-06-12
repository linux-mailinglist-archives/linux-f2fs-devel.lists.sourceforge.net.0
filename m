Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 8WplB5a9K2qIEAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jun 2026 10:04:38 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4AC6779D5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jun 2026 10:04:32 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=jxobZCst;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=UU6Rvou8;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="X Teug72";
	dkim=fail ("body hash did not verify") header.d=126.com header.s=s110527 header.b=R2kprRq3;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NUUj3m7DUTgPJ5PSksBa2Ar//azx112cgGMks8BjlQI=; b=jxobZCstjyIhkOEVdkOVjbrrhY
	Q0+EwG3mFZhZxSxtT0iZu4qd/VhEHJtPUjjVV34kCigQFAms882RBDuWuD8pUy38EGkkXyVwXJVOP
	WFYrCGq5X7pO6nT3L/dCuqr3W3gcPv7FE1SYxYQS4zRiEDsmQnB9OF9Kq7ZUgA/x+q30=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wXwsR-0007AR-Vk;
	Fri, 12 Jun 2026 08:04:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <nzzhao@126.com>) id 1wXwsG-00077z-Ri
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jun 2026 08:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zoVeUGb3RwIyE5zPGXKoxB3o/1QDhVVrRsQ3VaUSBeI=; b=UU6Rvou8Ux1k1jzJ8IRAHG4/EL
 i0l8zxjLoEOI4fNz2U/B9EjLhgkYsVXwVMyxjOgqC8/3qnE+cR8LUUq/e6yrep/grDsiTi2KpJKQM
 ksyOYUkT5/oygpzreaidxurXksajp3LaQ/1ggartsM0XYWAoPMYV8G0RB0slqywxKg7A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:
 To:From:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zoVeUGb3RwIyE5zPGXKoxB3o/1QDhVVrRsQ3VaUSBeI=; b=X
 Teug725M5GeinAH8bBuKoaZStQzXbGZUfrJy9c2Wo+ET8lFrmWOcdPJZZn1dxv9hv4QSb35GPwShD
 mKyuBWfmTc4u11+p3dxdeMGiTbe/dR0O9hEVQrpaiAcy1Bv37Ye76HIH2WEQuLShMAEJ8ewwojwI/
 R5Y3GRx88NChvi6Q=;
Received: from m16.mail.126.com ([220.197.31.8])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wXwsC-0004J0-35 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jun 2026 08:04:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=zo
 VeUGb3RwIyE5zPGXKoxB3o/1QDhVVrRsQ3VaUSBeI=; b=R2kprRq3EnmC9N7X8+
 mJh6rKD3fRqD4oV8knRoZVBIkO73dDHRc7L1dPjYsnaQP/QuFV4pYm26Acqb5osi
 6OqPpT1R4nHCbQp6P1mnol8zTD0QL3f7xMHAOkvrzRnK82EyuXGCefjz/Thq//8+
 XVHlMRT3Vk7qqJpmWOARrCO+Y=
Received: from YLLaptop.. (unknown [])
 by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id
 _____wDX_ytWvStqyXqrBQ--.43664S2; 
 Fri, 12 Jun 2026 16:03:36 +0800 (CST)
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 12 Jun 2026 16:03:25 +0800
Message-Id: <20260612080334.70657-1-zhaonanzhe@xiaomi.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CM-TRANSID: _____wDX_ytWvStqyXqrBQ--.43664S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxZrWktw1fXFW7Zr1xJr4xJFb_yoWrCw4rpF
 yakr1fGr4rJr17Ar13Aw1Utr15CFW8GF17Xa9rGF1Iq3WUAr1rZF40qFyrWryUJryxXr10
 qw4UA348W3WDtaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UuHqcUUUUU=
X-Originating-IP: [223.104.43.40]
X-CM-SenderInfo: xq22xtbr6rjloofrz/xtbBohjqumorvViXyQAA3Q
X-Spam-Score: 1.2 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Nanzhe <zhaonanzhe@xiaomi.com> This RFC series supports
 large folios for most readable/writable files in buffered I/O paths, including
 normal files, block-layer encrypted files, and atomic files. Compressed files
 are still excluded [...] 
 Content analysis details:   (1.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
 [223.104.43.40 listed in dnsbl-2.uceprotect.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [nzzhao(at)126.com]
 0.0 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and EnvelopeFrom
 freemail headers are different
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [220.197.31.8 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wXwsC-0004J0-35
Subject: [f2fs-dev] [RFC PATCH 0/9] f2fs: support & optimize large folios
 for writable files
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
From: Nanzhe Zhao via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Cc: Barry Song <baohua@kernel.org>, Ryan Roberts <Ryan.Roberts@arm.com>,
 Juan Yescas <jyescas@google.com>, Dev Jain <Dev.Jain@arm.com>,
 David Hildenbrand <David.Hildenbrand@arm.com>,
 Pengfei Li <lipengfei28@xiaomi.com>, Bo Zhang <zhangbo56@xiaomi.com>,
 Kalesh Singh <kaleshsingh@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Nanzhe Zhao <zhaonanzhe@xiaomi.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	SUSPICIOUS_AUTH_ORIGIN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_THREE(0.00)[4];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,126.com:s=s110527];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	SEM_URIBL_UNKNOWN_FAIL(0.00)[lists.sourceforge.net:query timed out];
	SEM_URIBL_FRESH15_UNKNOWN_FAIL(0.00)[lists.sourceforge.net:query timed out,xiaomi.com:query timed out];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,126.com:-];
	HAS_XOIP(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	HAS_REPLYTO(0.00)[zhaonanzhe@xiaomi.com];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8F4AC6779D5

From: Nanzhe <zhaonanzhe@xiaomi.com>

This RFC series supports large folios for most readable/writable files in
buffered I/O paths, including normal files, block-layer encrypted files,
and atomic files. Compressed files are still excluded.

Atomic files need explicit support here because Android enables atomic
writes through ioctls, which mark the inode as an atomic file
(FI_ATOMIC_FILE). Once large-folio mapping is enabled for such a file,
the atomic buffered write path also needs to handle large folios
correctly.

In the write path, allocating f2fs_folio_state for large folios starts
to conflict with f2fs page-private flags. This RFC series extends
f2fs_folio_state so that it can also store f2fs private flags, and
updates the existing PAGE_PRIVATE helpers to work correctly with
f2fs_folio_state.

In addition, fio results with max large-folio order set to 2 showed
that 4K read/write performance did not improve much.
Analysis showed that one important reason was the extra spinlock traffic
from incrementing read_pages_pending once per 4K subpage.
This RFC series therefore adds two optimizations to
f2fs_read_data_large_folio:

1. batch read_pages_pending updates by the mapped block count instead of
   incrementing it once per 4K subpage;

2. skip f2fs_folio_state allocation when a single block mapping / BIO
   covers the whole folio, because folio_end_read() can complete such a
   folio without extra per-folio state.

In the benchmark tables below, "skip=1" means enabling the second
optimization above, i.e. skipping f2fs_folio_state allocation for the
whole-folio-in-one-bio case.
The "batch" optimization refers to updating read_pages_pending in
and add to bio in larger chunks instead of once per subpage.

Test environment:
- Device: Pixel 6 (device1A, 1A071FDF600053)
- Filesystem: f2fs on dm-49, inlinecrypt enabled
- File size: 256MB
- Repetitions: 10
- Prepare: end_fsync + sync + drop_caches
- Fio: psync, direct=0, iodepth=1
- Max folio order: 2

Table 1: HOLE_READ (10 repeats)
------------------------------------------------------------
All bandwidth numbers are in MiB/s. Non-baseline entries show the
absolute value followed by the percentage delta relative to the
order=0 baseline in parentheses.

| bs  | order=0 | order=2 |
|-----|---------|---------|
| 4k  | 469.6   | 521.9 (+11.1%) |
| 64k | 668.1   | 852.4 (+27.6%) |
| 1M  | 653.0   | 867.2 (+32.8%) |

Table 2: DATA_READ (10 repeats)
----------------------------------------
| bs  | order=0 | batch=0 | batch=1,skip=0 | batch=1,skip=1 |
|-----|---------|---------|----------------|----------------|
| 4k  | 441.6   | 456.5 (+3.4%) | 499.7 (+13.2%) | 544.4 (+23.3%) |
| 64k | 632.8   | 697.0 (+10.1%) | 837.8 (+32.4%) | 990.9 (+56.6%) |
| 1M  | 601.5   | 733.0 (+21.9%) | 927.5 (+54.2%) | 963.4 (+60.2%) |

Table 3: WRITE (10 reps)
----------------------------------------------------------
O = overwrite (N = new write, Y = overwrite)
S = sync / fsync (Y = fsync enabled, N = no fsync)
W = writeback (Y = background writeback, N = no writeback)

| O,S,W | bs  | order=0 | order=2 |
|-------|-----|---------|---------|
| N,N,Y | 4k  | 263.4   | 286.3 (+8.7%) |
| N,N,Y | 64k | 683.5   | 1199.6 (+75.5%) |
| N,N,Y | 1M  | 767.4   | 1383.8 (+80.3%) |
| N,Y,N | 4k  | 10.8    | 9.1 (-15.7%) |
| N,Y,N | 64k | 69.3    | 50.3 (-27.4%) |
| N,Y,N | 1M  | 103.5   | 157.8 (+52.5%) |
| Y,N,Y | 4k  | 301.6   | 344.1 (+14.1%) |
| Y,N,Y | 64k | 691.3   | 865.9 (+25.3%) |
| Y,N,Y | 1M  | 742.3   | 969.2 (+30.6%) |
| Y,Y,N | 4k  | 9.5     | 17.1 (+80.0%) |
| Y,Y,N | 64k | 43.5    | 108.2 (+148.7%) |
| Y,Y,N | 1M  | 140.9   | 146.6 (+4.0%) |

Nanzhe (9):
  f2fs: extend folio state for large folio write path
  f2fs: carry subpage offset and count in write IO
  f2fs: support regular file buffered writes on large folios
  f2fs: support atomic file large folios buffered write
  f2fs: support large folio writeback
  f2fs: prepare mmap write faults for large folios
  f2fs: make GC migration large-folio aware
  f2fs: allow large folio support to writeable files
  f2fs: optimize small block size large folio read

 fs/f2fs/compress.c |    2 +
 fs/f2fs/data.c     | 1015 +++++++++++++++++++++++++++++++++++++++-----
 fs/f2fs/f2fs.h     |   75 +++-
 fs/f2fs/file.c     |   81 ++--
 fs/f2fs/gc.c       |   30 +-
 fs/f2fs/inode.c    |    6 +-
 fs/f2fs/segment.c  |    4 +-
 7 files changed, 1064 insertions(+), 149 deletions(-)

-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
