Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qPbLHAHmu2njpQIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2026 13:03:13 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0880A2CAD49
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2026 13:03:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:In-Reply-To:Date:From:To:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=lzLMKW06tbIQLntOiVRvoYMxtiCcIOOlFAtXTJ7frZ0=; b=CJ8pIevtR1rF+wrDAf8Zwl/brL
	X7pZa5/A5fNUS/6uZvjOSw0ZkgTuyfg0z7TNmNj2DVG3JuHulx7wj3eQXjuWwPbyN9KjHzFU4D7lZ
	NhNIHHMXhrDU+/a+0FB38l7YLPwBaasW81mvg4ERr14fzTTz2HDDmbZ/fxBtgMcAwN0o=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w3C5P-0003Xx-EN;
	Thu, 19 Mar 2026 12:02:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1w3C5E-0003XU-Af
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Mar 2026 12:02:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:In-Reply-To:Date:From:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0etlLGiru6ha8GrUwdqyPqC3kVf/pRhYmLSG4XvdT34=; b=OdNJa8ij0kwc1IAF6w98iVgrFT
 EJMBh9sYazEE8glFsak5EusC681KslNzd0RvHXzWitbHClr8OFOrDOPrLmx6WgNIVugAb0fs7pjRi
 9HzGuqHJrUCs5RiZPFwBt8FUDB44t5uwaUhbob6ROtyXRI/P0+lihwtZ3vSfBTbqEG2A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 In-Reply-To:Date:From:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0etlLGiru6ha8GrUwdqyPqC3kVf/pRhYmLSG4XvdT34=; b=Bs0g/AVGMgOJE0+PpOujn4blgM
 dMPv3Rngi2o2oghR5U1xpaYbYKu6s0kAIB1QT/XdXt1vgr6N2bXVh4rSLRatEPEVSybTm/ycadAQs
 GAYD0FJr4Xthd+81Q5aeZe4Tpp4khj6LkeXKBy4vLyUxvHKoAWcHQ0oaUOI2JX5651h8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w3C51-0003i9-Ck for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Mar 2026 12:02:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 375826011F;
 Thu, 19 Mar 2026 12:01:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81D71C2BC87;
 Thu, 19 Mar 2026 12:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1773921709;
 bh=qrrebqt85HR9K8FE9JnPTsqIPghjBh7k06QMaP35Gvc=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=P+WbSty00ZFEWVKuH0Rc+0kzh1EqIU+odRHB+6Jry95m7WYw5wjdAM7pc9SgLjrTa
 JVDskwgrfMpPEzwClIOdOURelvFsPtv9060klDJrbQUy9IfsxyHvJe1QH17fcFryDP
 Di6K7sN4OXHEuUw6IUcXlJcZ9p+6gWQ0Y0EGOXBw=
To: 1468888505@139.com, chao@kernel.org, daehojeong@google.com,
 gregkh@linuxfoundation.org, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, patches@lists.linux.dev
From: <gregkh@linuxfoundation.org>
Date: Thu, 19 Mar 2026 13:01:25 +0100
In-Reply-To: <20260304055556.2595295-1-1468888505@139.com>
Message-ID: <2026031925-underling-compacter-ea20@gregkh>
MIME-Version: 1.0
X-stable: commit
X-Patchwork-Hint: ignore 
X-Spam-Score: 2.3 (++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is a note to let you know that I've just added the patch
 titled f2fs: zone: fix to avoid inconsistence in between SIT and SSA to the
 6.6-stable tree which can be found at:
 http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;
 a=summary Content analysis details:   (2.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.105.4.254 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w3C51-0003i9-Ck
Subject: [f2fs-dev] Patch "f2fs: zone: fix to avoid inconsistence in between
 SIT and SSA" has been added to the 6.6-stable tree
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
Cc: stable-commits@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [3.49 / 15.00];
	MID_END_EQ_FROM_USER_PART(4.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[linuxfoundation.org : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,linuxfoundation.org:s=korg];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:1468888505@139.com,m:chao@kernel.org,m:daehojeong@google.com,m:gregkh@linuxfoundation.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:patches@lists.linux.dev,m:stable-commits@vger.kernel.org,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[139.com,kernel.org,google.com,linuxfoundation.org,lists.sourceforge.net,lists.linux.dev];
	DKIM_MIXED(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RSPAMD_URIBL_FAIL(0.00)[lists.sourceforge.net:query timed out];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,linuxfoundation.org:-];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RSPAMD_EMAILBL_FAIL(0.00)[20260304055556.2595295-1-1468888505.139.com:query timed out,jaegeuk.kernel.org:query timed out];
	RCPT_COUNT_SEVEN(0.00)[8];
	FROM_NO_DN(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.dev:email,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 0880A2CAD49
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


This is a note to let you know that I've just added the patch titled

    f2fs: zone: fix to avoid inconsistence in between SIT and SSA

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     f2fs-zone-fix-to-avoid-inconsistence-in-between-sit-and-ssa.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-222982-greg=kroah.com@vger.kernel.org Wed Mar  4 06:56:20 2026
From: Li hongliang <1468888505@139.com>
Date: Wed,  4 Mar 2026 13:55:56 +0800
Subject: f2fs: zone: fix to avoid inconsistence in between SIT and SSA
To: gregkh@linuxfoundation.org, stable@vger.kernel.org, chao@kernel.org
Cc: patches@lists.linux.dev, linux-kernel@vger.kernel.org, jaegeuk@kernel.org, daehojeong@google.com, linux-f2fs-devel@lists.sourceforge.net
Message-ID: <20260304055556.2595295-1-1468888505@139.com>

From: Chao Yu <chao@kernel.org>

[ Upstream commit 773704c1ef96a8b70d0d186ab725f50548de82c4 ]

w/ below testcase, it will cause inconsistence in between SIT and SSA.

create_null_blk 512 2 1024 1024
mkfs.f2fs -m /dev/nullb0
mount /dev/nullb0 /mnt/f2fs/
touch /mnt/f2fs/file
f2fs_io pinfile set /mnt/f2fs/file
fallocate -l 4GiB /mnt/f2fs/file

F2FS-fs (nullb0): Inconsistent segment (0) type [1, 0] in SSA and SIT
CPU: 5 UID: 0 PID: 2398 Comm: fallocate Tainted: G           O       6.13.0-rc1 #84
Tainted: [O]=OOT_MODULE
Hardware name: innotek GmbH VirtualBox/VirtualBox, BIOS VirtualBox 12/01/2006
Call Trace:
 <TASK>
 dump_stack_lvl+0xb3/0xd0
 dump_stack+0x14/0x20
 f2fs_handle_critical_error+0x18c/0x220 [f2fs]
 f2fs_stop_checkpoint+0x38/0x50 [f2fs]
 do_garbage_collect+0x674/0x6e0 [f2fs]
 f2fs_gc_range+0x12b/0x230 [f2fs]
 f2fs_allocate_pinning_section+0x5c/0x150 [f2fs]
 f2fs_expand_inode_data+0x1cc/0x3c0 [f2fs]
 f2fs_fallocate+0x3c3/0x410 [f2fs]
 vfs_fallocate+0x15f/0x4b0
 __x64_sys_fallocate+0x4a/0x80
 x64_sys_call+0x15e8/0x1b80
 do_syscall_64+0x68/0x130
 entry_SYSCALL_64_after_hwframe+0x67/0x6f
RIP: 0033:0x7f9dba5197ca
F2FS-fs (nullb0): Stopped filesystem due to reason: 4

The reason is f2fs_gc_range() may try to migrate block in curseg, however,
its SSA block is not uptodate due to the last summary block data is still
in cache of curseg.

In this patch, we add a condition in f2fs_gc_range() to check whether
section is opened or not, and skip block migration for opened section.

Fixes: 9703d69d9d15 ("f2fs: support file pinning for zoned devices")
Reviewed-by: Daeho Jeong <daehojeong@google.com>
Cc: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
[ Minor conflict resolved. ]
Signed-off-by: Li hongliang <1468888505@139.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/f2fs/gc.c |    3 +++
 1 file changed, 3 insertions(+)

--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -2019,6 +2019,9 @@ int f2fs_gc_range(struct f2fs_sb_info *s
 		if (!get_valid_blocks(sbi, segno, true))
 			continue;
 
+		if (IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, segno)))
+			continue;
+
 		do_garbage_collect(sbi, segno, &gc_list, FG_GC,
 						dry_run_sections == 0);
 		put_gc_inode(&gc_list);


Patches currently in stable-queue which might be from 1468888505@139.com are

queue-6.6/pnfs-fix-a-deadlock-when-returning-a-delegation-during-open.patch
queue-6.6/net-add-support-for-segmenting-tcp-fraglist-gso-packets.patch
queue-6.6/f2fs-zone-fix-to-avoid-inconsistence-in-between-sit-and-ssa.patch
queue-6.6/net-fix-segmentation-of-forwarding-fraglist-gro.patch
queue-6.6/nfs-pass-explicit-offset-count-to-trace-events.patch
queue-6.6/net-gso-fix-tcp-fraglist-segmentation-after-pull-from-frag_list.patch
queue-6.6/nfs-fix-a-deadlock-involving-nfs_release_folio.patch


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
