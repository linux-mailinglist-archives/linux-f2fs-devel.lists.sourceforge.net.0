Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id V4h7HeuSImqcaQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 05 Jun 2026 11:12:11 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7B3646BBB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 05 Jun 2026 11:12:09 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=bZzPScZC;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=YU0yBCoT;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="G U8D34g";
	dkim=fail ("body hash did not verify") header.d=samsung.com header.s=mail20170921 header.b=Sm915RmF;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=samsung.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:
	List-Id:Subject:References:Date:Message-ID:To:From:Mime-Version:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=4wCux4yXZHZbUR0oCexa/g1QsHDIrGI60ZtXZ1QGwRg=; b=bZzPScZCp1/PctdV0ZhplT6zTI
	pogC5K5NP09Ia7rke+W217FnyDknJlggznNYKqQ7d9tNCMJ43WFOshx4G1L+eHiNGANINNGVtE+wa
	fwl5TWDjqp02IQFOCvjIGySZ8THsUwOE2VzVO+IPajLfUibacb3hLq6p6fPyXU/Hwk/A=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wVQar-0007gZ-EL;
	Fri, 05 Jun 2026 09:11:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daejun7.park@samsung.com>) id 1wVQaq-0007gQ-6k
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Jun 2026 09:11:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fRvQ0uFz1O3IyQbw8MT5KRHmu8290vtJA5Shz/WUb3w=; b=YU0yBCoToWq0rg7bwKGPKG1rRo
 LsENqkHHZh2dcGG1CX2NLzLO2ujsAj3WfDMcbnhj9yTDPoXlsnZDOWaEHRKN1dEKDH7HNzz7IrSn2
 XmSMIwreeLELhvzLh/06++HTT2MULzyR8A0COESDovTWSZl46AWWXRYvbahTSnBJQl2o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fRvQ0uFz1O3IyQbw8MT5KRHmu8290vtJA5Shz/WUb3w=; b=G
 U8D34gnh9CxVRfLsNk7ur/gflaPVze0cU3lFfwjgUKbbnLHg89yNFDuf/R0UTOT+R86/RvoaV5dCR
 /6YZXnqmdpiSwBvx8lqAYdBYZo1ETl+a2UtxLmyiYAvNNNnf7ldn1VR4xzoPLR/U/8iTt5rlgTJ+v
 6/KQG8dAOsAWRl+Y=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wVQam-0000VV-9L for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Jun 2026 09:11:56 +0000
Received: from epcas2p2.samsung.com (unknown [182.195.41.54])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20260605091140epoutp02f23dc610d7f176976986c0574660db78~2JGDIrOrE1520715207epoutp02X
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  5 Jun 2026 09:11:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20260605091140epoutp02f23dc610d7f176976986c0574660db78~2JGDIrOrE1520715207epoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1780650700;
 bh=fRvQ0uFz1O3IyQbw8MT5KRHmu8290vtJA5Shz/WUb3w=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=Sm915RmF0qhWZ3XG0LrRZFlh2JFOLMSsGMmHbNevEjJ8YIwCiqRheXeOdccqjQTLw
 1hPSybmoMWvuiDPkHvhATk4kbRXLVebjG5eCOlqDq5EIvKw6AOd8ZWdyZl39u0dM3w
 9fJ0JmQpKdEBDG/Dt1avLVh2jZiMje+w1Hxv3d1E=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
 epcas2p2.samsung.com (KnoxPortal) with ESMTPS id
 20260605091140epcas2p2023718cad3e4f7e5ed8fded7bece5421~2JGC4Dln_0290902909epcas2p2z;
 Fri,  5 Jun 2026 09:11:40 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.206]) by
 epsnrtp01.localdomain (Postfix) with ESMTP id 4gWwfh17Jwz6B9m6; Fri,  5 Jun
 2026 09:11:40 +0000 (GMT)
Mime-Version: 1.0
From: Daejun Park <daejun7.park@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20260605091139epcms2p2b17a6e7962b7c9b8fb058e1c55cd4dba@epcms2p2>
Date: Fri, 05 Jun 2026 18:11:39 +0900
X-CMS-MailID: 20260605091139epcms2p2b17a6e7962b7c9b8fb058e1c55cd4dba
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-223,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260605091139epcms2p2b17a6e7962b7c9b8fb058e1c55cd4dba
References: <CGME20260605091139epcms2p2b17a6e7962b7c9b8fb058e1c55cd4dba@epcms2p2>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, FG_GC migrates a victim section's valid blocks in source
 segment-offset order, so blocks from several inodes stay interleaved in the
 destination curseg and post-GC files stay fragmented. This series m [...]
 Content analysis details:   (-0.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [203.254.224.25 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wVQam-0000VV-9L
Subject: [f2fs-dev] [PATCH v2 0/2] f2fs: pack same-inode blocks by inode
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	DMARC_POLICY_SOFTFAIL(0.10)[samsung.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_EQ_ADDR_ALL(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	HAS_X_PRIO_THREE(0.00)[3];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[daejun7.park@samsung.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,samsung.com:from_mime,samsung.com:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: DB7B3646BBB

Hi,

FG_GC migrates a victim section's valid blocks in source segment-offset
order, so blocks from several inodes stay interleaved in the destination
curseg and post-GC files stay fragmented.  This series migrates them in
inode order instead, producing inode-contiguous runs across the section.

Patch 1 is a pure refactor (extract do_migrate_one_data_block()).
Patch 2 records each valid block on a per-inode list in phase 3 and
drains it in inode order via pack_gc_section() once the section has been
scanned.  It is gated on a sysfs knob (gc_inode_local_packing, default
on for large sections) and FG_GC only; on slab alloc failure a block
falls back to immediate migration.

Changes since v1:
  - patch 2: fix seg_freed accounting.  Migration is deferred to
    pack_gc_section(), so the in-loop 'freed:' check saw the source still
    valid and seg_freed stayed 0; f2fs_gc() then under-counted sec_freed
    and a sync F2FS_IOC_GC returned -EAGAIN despite freeing space.
    seg_freed is now recomputed after the pack pass.
  - patch 2: clear next_victim_seg on the freezing 'goto stop' path,
    where queued blocks are dropped un-migrated.
  - patch 2: bound the packing queue (MAX_GC_PACK_BLOCKS) and drain it in
    batches instead of holding a whole section's records.
  - patch 1: unchanged.
  - rebased onto current f2fs/dev.

Results (QEMU guest):
  - large section (-s 32, 64 x 4 MiB): post-GC extents 65536 -> 49170
    (-24 %).
  - natural FG_GC, 90 % full, 300 s hot/cold rewrite: cold-file extents
    -63 %, move_blks -18 %, skipped_gc_rwsem -59 %.
  - seg_freed regression test (new): packing now matches the legacy path
    (seg_freed 152, sec_freed 38, 24/24 sync ioctls succeed); on v1 the
    packing column was 0/0/0 with every ioctl returning -EAGAIN.

Data sha256 is preserved across GC; a FAULT_SLAB_ALLOC run exercises the
alloc-failure fallback with a clean dmesg.

Daejun Park (2):
  f2fs: extract do_migrate_one_data_block() helper for GC migration
  f2fs: pack same-inode blocks by inode during FG_GC

 Documentation/ABI/testing/sysfs-fs-f2fs |  10 +
 fs/f2fs/f2fs.h                          |   7 +-
 fs/f2fs/gc.c                            | 271 +++++++++++++++++++-----
 fs/f2fs/gc.h                            |   1 +
 fs/f2fs/super.c                         |   1 +
 fs/f2fs/sysfs.c                         |   7 +
 6 files changed, 240 insertions(+), 57 deletions(-)


base-commit: c0b65f6129c7fbb526e921dd60261650f1b2bef9
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
