Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOhOEQrTu2k4owIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2026 11:42:18 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 737D52C9A5D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 Mar 2026 11:42:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:In-Reply-To:Date:From:To:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=6B2Dg1AoebvNxRMIJ8zmV9pbOgv4Rj8yAIIMabIGkWE=; b=Cf6ByQTeB08k9RGgZ0Sfp8SK07
	PfGkeNf4y9JE3i8u4qkDgX02PANG1vRFrL6/vVmbLAsrO75Ud5KjUZvMeTURAUf4SADjyPDuvBLAb
	2n4OYaYFMz/e+TKChbbEdczO8/n1vdSNR2gO2PC+EVnyBWDYAqf+/Lh2Do6hTR27xDwU=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w3ApH-0001c6-NW;
	Thu, 19 Mar 2026 10:42:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gregkh@linuxfoundation.org>) id 1w3ApG-0001bs-8N
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Mar 2026 10:42:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :Message-ID:In-Reply-To:Date:From:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yY0j51hHzMvgKetoUu9yD8krxx4V6ImAMaftAkb2ORI=; b=Gy17hqO5LfSlq6UrTqlxcRJwJB
 /KN5oDZVRyV5I7oJ/Olim8+XGRqlIKxG54pVfHzRE4FSxYtMB7pSQ8DbiwhLADDpK4E74r8MKmI0K
 G6q/D8cCUJ4Zgk2yVP9u/7HKjTZfz7svAsg5zWecmVDlc0psjLG/6a9XL6OkYf9e80RA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 In-Reply-To:Date:From:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yY0j51hHzMvgKetoUu9yD8krxx4V6ImAMaftAkb2ORI=; b=V87QkK9smxeufXGhd+to3XvUcy
 VU7CgOp5fh9IxwFESz9rPJpYzXGLCz4NXRMY6UgM8ymiLtjTMjikX3GepjMHL3niWAJMM2IKBv3sX
 W+OfP4Tuc/1EZpSZEScHrjmecMcOMYIjiUrNHeTcsvPqk+qDZ52E1jMZdVSH3CObH67k=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w3ApF-00075p-UM for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 19 Mar 2026 10:42:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1445E60126;
 Thu, 19 Mar 2026 10:41:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E200C19424;
 Thu, 19 Mar 2026 10:41:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1773916910;
 bh=8OdpeWQNmt06kV3fJGwK42PRyqV5a8Lb7hkDWLkQBaQ=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=c14jKvFkZ7H0dWRSG7zFix+agAiTLpHnvMvWeQBitdYdXM1Yz46zrkIcExGKmUJzR
 BhXVvj25xpyx4OiiUZZiko7un5LOyotVxQ5rnPo0ubV2tViSza065vrYrDzQHBLYDw
 LmUQ1w6zIiSkISbcwoETCpsdHvtC0Wa6dqrjlskM=
To: chao@kernel.org, daehojeong@google.com, gregkh@linuxfoundation.org,
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net, rob_garcia@163.com
From: <gregkh@linuxfoundation.org>
Date: Thu, 19 Mar 2026 11:41:20 +0100
In-Reply-To: <20260305084803.210354-1-rob_garcia@163.com>
Message-ID: <2026031919-pessimism-ship-75a8@gregkh>
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
 titled f2fs: fix to avoid migrating empty section to the 6.12-stable tree
 which can be found at:
 http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;
 a=summary Content analysis details:   (2.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w3ApF-00075p-UM
Subject: [f2fs-dev] Patch "f2fs: fix to avoid migrating empty section" has
 been added to the 6.12-stable tree
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
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,linuxfoundation.org:s=korg];
	FORGED_SENDER(0.00)[gregkh@linuxfoundation.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:daehojeong@google.com,m:gregkh@linuxfoundation.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:rob_garcia@163.com,m:stable-commits@vger.kernel.org,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,linuxfoundation.org,lists.sourceforge.net,163.com];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,linuxfoundation.org:-];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_NONE(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[gregkh@linuxfoundation.org,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim,linuxfoundation.org:email]
X-Rspamd-Queue-Id: 737D52C9A5D
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr


This is a note to let you know that I've just added the patch titled

    f2fs: fix to avoid migrating empty section

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     f2fs-fix-to-avoid-migrating-empty-section.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-223179-greg=kroah.com@vger.kernel.org Thu Mar  5 09:48:57 2026
From: Robert Garcia <rob_garcia@163.com>
Date: Thu,  5 Mar 2026 16:48:03 +0800
Subject: f2fs: fix to avoid migrating empty section
To: stable@vger.kernel.org, Chao Yu <chao@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daehojeong@google.com>, Robert Garcia <rob_garcia@163.com>, linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Message-ID: <20260305084803.210354-1-rob_garcia@163.com>

From: Chao Yu <chao@kernel.org>

[ Upstream commit d625a2b08c089397d3a03bff13fa8645e4ec7a01 ]

It reports a bug from device w/ zufs:

F2FS-fs (dm-64): Inconsistent segment (173822) type [1, 0] in SSA and SIT
F2FS-fs (dm-64): Stopped filesystem due to reason: 4

Thread A				Thread B
- f2fs_expand_inode_data
 - f2fs_allocate_pinning_section
  - f2fs_gc_range
   - do_garbage_collect w/ segno #x
					- writepage
					 - f2fs_allocate_data_block
					  - new_curseg
					   - allocate segno #x

The root cause is: fallocate on pinning file may race w/ block allocation
as above, result in do_garbage_collect() from fallocate() may migrate
segment which is just allocated by a log, the log will update segment type
in its in-memory structure, however GC will get segment type from on-disk
SSA block, once segment type changes by log, we can detect such
inconsistency, then shutdown filesystem.

In this case, on-disk SSA shows type of segno #173822 is 1 (SUM_TYPE_NODE),
however segno #173822 was just allocated as data type segment, so in-memory
SIT shows type of segno #173822 is 0 (SUM_TYPE_DATA).

Change as below to fix this issue:
- check whether current section is empty before gc
- add sanity checks on do_garbage_collect() to avoid any race case, result
in migrating segment used by log.
- btw, it fixes misc issue in printed logs: "SSA and SIT" -> "SIT and SSA".

Fixes: 9703d69d9d15 ("f2fs: support file pinning for zoned devices")
Cc: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
[ Use IS_CURSEC instead of is_cursec according to
commit c1cfc87e49525 ("f2fs: introduce is_cur{seg,sec}()"). ]
Signed-off-by: Robert Garcia <rob_garcia@163.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/f2fs/gc.c |   16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1805,6 +1805,13 @@ static int do_garbage_collect(struct f2f
 					GET_SUM_BLOCK(sbi, segno));
 		f2fs_put_page(sum_page, 0);
 
+		if (IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, segno))) {
+			f2fs_err(sbi, "%s: segment %u is used by log",
+							__func__, segno);
+			f2fs_bug_on(sbi, 1);
+			goto skip;
+		}
+
 		if (get_valid_blocks(sbi, segno, false) == 0)
 			goto freed;
 		if (gc_type == BG_GC && __is_large_section(sbi) &&
@@ -1815,7 +1822,7 @@ static int do_garbage_collect(struct f2f
 
 		sum = page_address(sum_page);
 		if (type != GET_SUM_TYPE((&sum->footer))) {
-			f2fs_err(sbi, "Inconsistent segment (%u) type [%d, %d] in SSA and SIT",
+			f2fs_err(sbi, "Inconsistent segment (%u) type [%d, %d] in SIT and SSA",
 				 segno, type, GET_SUM_TYPE((&sum->footer)));
 			f2fs_stop_checkpoint(sbi, false,
 				STOP_CP_REASON_CORRUPTED_SUMMARY);
@@ -2079,6 +2086,13 @@ int f2fs_gc_range(struct f2fs_sb_info *s
 			.iroot = RADIX_TREE_INIT(gc_list.iroot, GFP_NOFS),
 		};
 
+		/*
+		 * avoid migrating empty section, as it can be allocated by
+		 * log in parallel.
+		 */
+		if (!get_valid_blocks(sbi, segno, true))
+			continue;
+
 		if (IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, segno)))
 			continue;
 


Patches currently in stable-queue which might be from rob_garcia@163.com are

queue-6.12/rxrpc-fix-recvmsg-unconditional-requeue.patch
queue-6.12/net-dsa-properly-keep-track-of-conduit-reference.patch
queue-6.12/binfmt_misc-restore-write-access-before-closing-files-opened-by-open_exec.patch
queue-6.12/spi-cadence-quadspi-implement-refcount-to-handle-unbind-during-busy.patch
queue-6.12/f2fs-fix-to-avoid-migrating-empty-section.patch
queue-6.12/blk-throttle-fix-access-race-during-throttle-policy-activation.patch


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
