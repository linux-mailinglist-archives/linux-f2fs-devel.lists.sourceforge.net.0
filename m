Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 4uiCCT9FQ2pDWQoAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2026 06:25:35 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F9406E041D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Jun 2026 06:25:34 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=R84ZvSX5;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=TXAhx7Cx;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=Ls7kEthr;
	dkim=fail ("body hash did not verify") header.d=samsung.com header.s=mail20170921 header.b=hliOKDQo;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=samsung.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:
	List-Id:Subject:References:Date:Message-ID:In-Reply-To:To:From:Mime-Version:
	Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6TVbSml7Lzhw2SI+AW4L5oVpBgj6xdFMJpk5dMkeaks=; b=R84ZvSX50EPhHlhGVl2hji5flw
	3LJKrnUtX3NzEPPycxIvLH5yHJDyynlaB3F1yIi5Ph5PlFf42etPB8yUb+hwEPaWCWlP1upWuRrWV
	UhM+/L8j5jXBa0wqpYSe+h9NWTCZJIVXoEyfo7sRAJ6BqdTh38IaqPsu1ISBOPlBQAuw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1weQ2G-0004dE-06;
	Tue, 30 Jun 2026 04:25:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daejun7.park@samsung.com>) id 1weQ29-0004d5-A0
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jun 2026 04:25:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wgr+DCLKSXthU/Pbdstsom/aR6Dez98Oid1xTBdfh84=; b=TXAhx7CxunEYstCwRRlxx8oZh0
 gwfsALk6qAU3bL7rgNWgLqrEzBoZlM75vQ+EvYCxprxbKVSYbVL2p560L4ZBaCPUgcjuZpiTx30Qd
 1FeTKH4RGsbAVRSyfxCz258GYh3POUrRVv7qd2KAhpZfS/EIUcnpq4Es94xoOEu8idDA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:
 In-Reply-To:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Wgr+DCLKSXthU/Pbdstsom/aR6Dez98Oid1xTBdfh84=; b=Ls7kEthr5l5QxZhfW9hE8+TIjX
 BGAQZJLG/OIXZk6khS5llJFXl1yzukH45TkgvLWl3xc1Zyf4YP//maMBx9pMVrBThBfYEv9bcNpXZ
 Q6Ej9kz3Ps4mYiLPqW5gdZCAfqBGIV+EQkeOMDkP0cSr+3769xKbU2truFS/bDU7d/eQ=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1weQ28-00046O-84 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Jun 2026 04:25:17 +0000
Received: from epcas2p1.samsung.com (unknown [182.195.41.53])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20260630042504epoutp027b6696948cfd6a154980723d82b57dcb~9wT8ipCOJ3040230402epoutp02w
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 30 Jun 2026 04:25:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20260630042504epoutp027b6696948cfd6a154980723d82b57dcb~9wT8ipCOJ3040230402epoutp02w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1782793504;
 bh=Wgr+DCLKSXthU/Pbdstsom/aR6Dez98Oid1xTBdfh84=;
 h=Subject:Reply-To:From:To:CC:In-Reply-To:Date:References:From;
 b=hliOKDQocjLHPUFZziuZjOksTOIv59KhpNEFbtphhY+bC4vMQYztQay8ocLUm+9ER
 tIybBoJNq+1reUCtvz28pBNixwAJa1X/0nbalyTQEXRHMdIfm/jJhhvC1pPNMnMfOP
 39HchYaBa1f4MhkxubbizB0Ag9m4RLKvnZouUHp0=
Received: from epsnrtp02.localdomain (unknown [182.195.42.154]) by
 epcas2p1.samsung.com (KnoxPortal) with ESMTPS id
 20260630042504epcas2p13cc1b688fa6cdb0bb5ffe4e410c27ef1~9wT8OCQt52471624716epcas2p15;
 Tue, 30 Jun 2026 04:25:04 +0000 (GMT)
Received: from epcas2p2.samsung.com (unknown [182.195.38.205]) by
 epsnrtp02.localdomain (Postfix) with ESMTP id 4gq96R54tdz2SSKt; Tue, 30 Jun
 2026 04:25:03 +0000 (GMT)
Mime-Version: 1.0
From: Daejun Park <daejun7.park@samsung.com>
To: Chao Yu <chao@kernel.org>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
X-Priority: 3
X-Content-Kind-Code: NORMAL
In-Reply-To: <e5ed9594-0137-4329-97e4-1e268c3dd91e@kernel.org>
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20260630042503epcms2p7b66961d1140646e3071ac93f10df22cd@epcms2p7>
Date: Tue, 30 Jun 2026 13:25:03 +0900
X-CMS-MailID: 20260630042503epcms2p7b66961d1140646e3071ac93f10df22cd
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
X-CPGSPASS: Y
X-CPGSPASS: Y
cpgsPolicy: CPGSC10-223,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260605091139epcms2p2b17a6e7962b7c9b8fb058e1c55cd4dba
References: <e5ed9594-0137-4329-97e4-1e268c3dd91e@kernel.org>
 <20260605091229epcms2p406d0a66d4fa12ba1d77bc668ebcfe352@epcms2p4>
 <20260605091139epcms2p2b17a6e7962b7c9b8fb058e1c55cd4dba@epcms2p2>
 <20260605091310epcms2p7e1130728968307f799403ef00ee38ba6@epcms2p7>
 <CGME20260605091139epcms2p2b17a6e7962b7c9b8fb058e1c55cd4dba@epcms2p7>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/29/26 20:08, Chao Yu wrote: > On 6/5/26 17:13, Daejun
 Park wrote: Hi Chao, Thanks for the review. Replies inline. 
 Content analysis details:   (-0.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [203.254.224.25 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1weQ28-00046O-84
Subject: Re: [f2fs-dev] (2) [PATCH v2 2/2] f2fs: pack same-inode blocks by
 inode during FG_GC
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
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	DMARC_POLICY_SOFTFAIL(0.10)[samsung.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	HAS_X_PRIO_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[daejun7.park@samsung.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,samsung.com:s=mail20170921];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[daejun7.park@samsung.com];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_ADDR_EQ_FROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daejun7.park@samsung.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,samsung.com:-];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[epcms2p7:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 4F9406E041D

On 6/29/26 20:08, Chao Yu wrote:
> On 6/5/26 17:13, Daejun Park wrote:

Hi Chao,

Thanks for the review.  Replies inline.

>>   Natural FG_GC under tight cold migration (mkfs.f2fs -s 32, 2 GiB disk
>>   90 % fill, 6 hot x 200 MiB + 6 cold x 100 MiB interleaved, 300 s rewrite):
>>     legacy   cold extents 350 -> 357 (delta +7,  no improvement)
>>     packed   cold extents 350 -> 132 (delta -218, -63 %  reduction)
>>     per user iter:
>>       move_blks         legacy 42344  packed 34822  (-18 %)
>>       skipped_gc_rwsem  legacy 108    packed   44   (-59 %)
>>     hot rewrite iters in fixed 300 s window:  +45 %
>
> Can you please explain why we can get above benefits except per-file defragment
> during FGGC? Not sure, due to in paralell rewriting/removing races w/ fggc on
> the same section?

The primary effect is per-file defragmentation; the move_blks and
skipped_gc_rwsem deltas follow from it.  Grouping by inode writes each file's
surviving blocks as one contiguous run, so a destination section fills with
whole-file runs that share a lifetime instead of an interleave of many inodes.
An all-cold section is rarely re-invalidated by the hot rewrites, so it drops
out of the FG_GC victim pool and its cold blocks stop being re-collected; in the
legacy order the section mixes several inodes, the hotter ones keep partially
invalidating it, it is GC'd again, and the cold blocks are dragged along -- that
repeated re-collection is the extra move_blks.

skipped_gc_rwsem (per-block i_gc_rwsem trylock failures against an inode a writer
holds) drops for the same reason: fewer migrations overall, and increasingly
all-cold victims hold fewer blocks of the inodes being actively rewritten.  Lock
granularity is unchanged (still per block).  So your intuition about the
interaction with the parallel rewrite is right, but the root cause is the
layout, not locking.

> May be you can provide scripts in somewhere? :)

Sure -- core reproducer below; run it once with arg 0 and once with 1:

	#!/bin/bash
	# natural-FG_GC packing A/B: -s 32, cold+hot interleaved ~90%, 300s rewrite. arg = packing 0|1
	DEV=/dev/sdX; MNT=/mnt/test; PACK=$1
	mkfs.f2fs -f -s 32 "$DEV" >/dev/null
	mount -t f2fs -o background_gc=sync "$DEV" "$MNT"; mkdir -p "$MNT/d"
	echo "$PACK" > /sys/fs/f2fs/$(basename $DEV)/gc_inode_local_packing
	for c in $(seq 0 199); do            # 6 hot x200M + 6 cold x100M, 1M at a time -> mixed sections
	  for i in 1 2 3 4 5 6; do dd if=/dev/urandom of=$MNT/d/hot_$i  bs=1M count=1 seek=$c oflag=sync status=none; done
	  [ $c -lt 100 ] && for i in 1 2 3 4 5 6; do dd if=/dev/urandom of=$MNT/d/cold_$i bs=1M count=1 seek=$c oflag=sync status=none; done
	done; sync
	pre=$(filefrag $MNT/d/cold_* | grep -oE '[0-9]+ extent' | awk '{s+=$1}END{print s}')
	end=$(( $(date +%s) + 300 ))         # hot rewrite invalidates hot -> FG_GC picks mixed -> migrates cold
	while [ $(date +%s) -lt $end ]; do
	  for i in 1 2 3 4 5 6; do dd if=/dev/urandom of=$MNT/d/hot_$i bs=1M count=200 oflag=sync status=none & done; wait
	done; sync
	post=$(filefrag $MNT/d/cold_* | grep -oE '[0-9]+ extent' | awk '{s+=$1}END{print s}')
	echo "pack=$PACK cold_extents $pre -> $post  move_blks=$(awk '/Try to move/{print $4}' /sys/kernel/debug/f2fs/status)  skipped=$(cat /sys/fs/f2fs/$(basename $DEV)/total_skipped_gc_rwsem)"
	umount "$MNT"

I can also add an A/B with the concurrent writers enabled vs serialized to
isolate the concurrency contribution you mentioned.

>> +#define MAX_GC_PACK_BLOCKS	4096
>
> What do you think of introducing a sysfs for this parameter?

Sure -- I'll expose it as an RW sysfs knob in v3 (default 4096), like
migration_granularity.

>> +	if (pack_by_inode)
>> +		submitted += pack_gc_section(sbi, gc_list, gc_type);
>> +
>> stop:
>
> Should we drop all items in gc_block list belong to current sections for
> anyone jumps to 'stop' label? so that in next round of section migration,
> we can avoid to touch block list in previous section.

Good point.  f2fs_gc() reuses one gc_list across sections within a single call
and only calls put_gc_inode() at the very end.  On the normal path that's fine
because pack_gc_section() drains every queued record and resets nr_gc_blocks
before do_garbage_collect() returns.  But on the freezing 'goto stop' path the
drain is skipped, so the records survive on the inode_entries; if freezing
clears before f2fs_gc()'s next freeze check, the next section's pack pass would
walk those stale records and migrate blocks belonging to the previous section.

So v3 will drop the section's queued gc_blocks on that path (a small helper that
frees them and resets nr_gc_blocks) so each do_garbage_collect() leaves the list
clean.

>> +	if (pack_by_inode) {
>> +		unsigned int seg;
>> +
>> +		for (seg = start_segno; seg < end_segno; seg++)
>> +			if (get_valid_blocks(sbi, seg, false) == 0)
>> +				seg_freed++;
>> +	}
>
> Is it possible there is empty segment previously? we should not account it
> into seg_freed?

It can, but this matches legacy and is required for the count that matters.  In
the original loop an already-empty segment also takes 'goto freed' and is
counted by the same seg_freed++; the recompute reproduces that after the
deferred migration.  It has to include them, because sec_freed is bumped only
when seg_freed == f2fs_usable_segs_in_sec() (the whole section empty); excluding
already-empty segments would under-count a fully-reclaimable section and make a
sync F2FS_IOC_GC return -EAGAIN, the regression this v2 fixes.

You're right that skewing the tracepoint is itself a downside, though.  The skew
is only on the freezing path: the recompute sits after the stop: label, so a
frozen GC -- which migrated nothing -- still scans the full range and can report
pre-existing-empty segments as freed in total_freed (the -EAGAIN decision is
unaffected; it goes through total_sec_freed, gated by the equality).  v3 will run
the recompute only on the normal completion path (move it above stop:), so a
frozen GC no longer inflates the trace; on the normal path the count already
equals what legacy reports.

>> +	sbi->gc_inode_local_packing = __is_large_section(sbi);
>
> I don't think we should enable a new feature by default, due to it brings
> bugs commonly.

Agreed.  v3 will default it to 0 (disabled) and let users opt in via the sysfs
knob; I'll update the ABI doc wording accordingly.

Thanks,
Daejun


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
