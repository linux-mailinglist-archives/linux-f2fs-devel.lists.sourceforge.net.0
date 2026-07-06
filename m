Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id El9GIrRYS2opPwEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 06 Jul 2026 09:26:44 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA27A70D841
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 06 Jul 2026 09:26:43 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=HVwPAfxK;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=IcCAG0Qd;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="c Je1pE5";
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=DdGjD1Gm;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jR7sRtM/1rrTRFJL9//jTRZDLLp8Qinf7SgMw1kDnU4=; b=HVwPAfxKta+b9nYyGjBBhqnW6C
	KsIrzGk8prdCFXr7WwsI+F3QPuh9d90CSFCYC/zAPXNvJqGMkw80V8rVPt50rmaEvPAtVKZJkV0qY
	j1vCkUhxqmhuSA0m9BfwmFOsQyzQt0vC1Ij/EnXUU/BXTqh2x6gLKUVNWe6CdNvtxgK4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wgdip-0006qd-K5;
	Mon, 06 Jul 2026 07:26:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wgdio-0006qX-EO
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Jul 2026 07:26:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r9rr12uEz4wcmEe34JFodnc/izFEa7CRhf+laB57WvU=; b=IcCAG0QdONnezWT+IxDXlvDlQx
 HszwfglIj8sxk47uwn/8RBE8le7xMC8Glwsvseg0Vm0b1bY5FyMYnM2JzkD4UdzIXokVGPJLi5+09
 vGZwpzXoFOI6LvjIqlp+yattwTU8A+VwvrHgQaTawZk+GKxiz3Bmab2L/VCA9cribSBg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=r9rr12uEz4wcmEe34JFodnc/izFEa7CRhf+laB57WvU=; b=c
 Je1pE5Vo8lR3w18AvQVqscwLie28Wdv3vlWdMpKKY087S89Yom8Eq1/od1cTAosHU/GNxVOT31k46
 5Z/sJLPtzaX107V9Ml3GqoFU++vyHWjjKheZ8U5BbHFpHkdCt1miiMkAbVXt18k5IOdTZNCbMMqtP
 QFA6FwwP0iRBOYAU=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wgdii-0002LB-Kn for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 06 Jul 2026 07:26:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id BC72C4026D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  6 Jul 2026 07:26:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5D421F000E9;
 Mon,  6 Jul 2026 07:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783322774;
 bh=r9rr12uEz4wcmEe34JFodnc/izFEa7CRhf+laB57WvU=;
 h=From:To:Cc:Subject:Date;
 b=DdGjD1GmWxlQbhI1z0EnFT5ajuIt1SSVXZGcvF9auziq8Li2gC3DMuvwRP2Flc/ky
 AbvLo/tHeesYET8tmF/jIj7MITuwI+GcsLB4dXS6mUfOMOqH8IgHmxLsDu0UHg8hgd
 9YH1TYbctwXE7SyLncPBA/2sWaJJpHELTBEaUBB5fnPGTzntZ5x8myNjDfbiK0wXUd
 yeiTsIA5X49TUdDj56kwZQlvn+vtf+o50nN6R1DcWWrsJBuFHvPwAvUHT41XxabgP+
 /4tGKN9/2SJVC5ZNKqmk0D1c9Jh4rCWQO9aTOgglPAlpicc1ABMpVEZtqao2z4Eg2H
 +QThLwYCf12KQ==
To: jaegeuk@kernel.org
Date: Mon,  6 Jul 2026 07:26:06 +0000
Message-ID: <20260706072606.3709384-1-chao@kernel.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: generic/794 4s ... - output mismatch (see
 /share/git/fstests/results//generic/794.out.bad)
 --- tests/generic/794.out 2026-06-12 08:46:32.766426241 +0800 +++
 /share/git/fstests/results//generic/794.out [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1wgdii-0002LB-Kn
Subject: [f2fs-dev] [PATCH] f2fs: fix to zero post-EOF data when extending
 file size
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: stable@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:stable@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ALIAS_RESOLVED(0.00)[];
	TO_DN_NONE(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	FROM_HAS_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:from_smtp,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: BA27A70D841

generic/794  4s ... - output mismatch (see /share/git/fstests/results//generic/794.out.bad)
    --- tests/generic/794.out   2026-06-12 08:46:32.766426241 +0800
    +++ /share/git/fstests/results//generic/794.out.bad 2026-07-05 18:32:55.000000000 +0800
    @@ -1,4 +1,16 @@
     QA output created by 794
     append_write
    +FAIL: non-zero data in gap [4080,4096) after shutdown+remount
    +000000 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a 5a  >ZZZZZZZZZZZZZZZZ<
    +*
    +001000
     truncate_up
    ...
    (Run 'diff -u /share/git/fstests/tests/generic/794.out /share/git/fstests/results//generic/794.out.bad'  to see the entire diff)
Ran: generic/794
Failures: generic/794
Failed 1 of 1 tests

Steps of generic/794:
1. write 4096 bytes to file w/ 0x5a
2. use fiemap to get PBA of first block in file
3. truncate file to 4080
4. umount; write 4096 bytes to file w/ 0x5a directly via PBA; mount
5. extend filesize via
   a) append 4096 from offset 4096, or
   b) truncate 8192, or
   c) fallocate 4096 from offset 4096
6. verify the gap is zeroed in memory [4080,4096)
7. sync range 4096 from offset 4096; shutdown -f (flush meta before shutdown)
8. umount; mount; verify [4080,4096) is zeroed or not.

When extending file size (e.g. via truncate, fallocate, or write) across an
unaligned EOF boundary, we need to ensure that post-EOF data in the partial
page is zeroed out in pagecache and marked dirty, meanwhile, tagging the inode
with FI_ZERO_POST_EOF, so that following checkpoint() and fsync() can persist
the page contain zeroed data before committing inode w/ updated i_size.

This help to prevent stale disk data beyond the previous EOF from being exposed
after remounting or crash recovery.

Since f2fs is a LFS filesystem, we only support direct write via PBA in pinfile,
and pinfile has section-aligned filesize, so in Android, there should no problem,
but for other usage in different environment, let's fix this w/ fsync_mode=strict
mount option.

Cc: stable@kernel.org
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/checkpoint.c |  4 ++++
 fs/f2fs/f2fs.h       |  1 +
 fs/f2fs/file.c       | 35 ++++++++++++++++++++++++++++++++---
 3 files changed, 37 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 064f5b537423..6f486d3a94c7 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1359,6 +1359,10 @@ static int f2fs_sync_inode_meta(struct f2fs_sb_info *sbi)
 		inode = igrab(&fi->vfs_inode);
 		spin_unlock(&sbi->inode_lock[DIRTY_META]);
 		if (inode) {
+			if (is_inode_flag_set(inode, FI_ZERO_POST_EOF)) {
+				filemap_write_and_wait(inode->i_mapping);
+				clear_inode_flag(inode, FI_ZERO_POST_EOF);
+			}
 			sync_inode_metadata(inode, 0);
 
 			/* it's on eviction */
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 8e2fb0bda467..41be09dad43c 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -939,6 +939,7 @@ enum {
 	FI_ATOMIC_REPLACE,	/* indicate atomic replace */
 	FI_OPENED_FILE,		/* indicate file has been opened */
 	FI_DONATE_FINISHED,	/* indicate page donation of file has been finished */
+	FI_ZERO_POST_EOF,	/* indicate unaligned EOF gap was zeroed in pagecache */
 	FI_MAX,			/* max flag, never be used */
 };
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 11cc8d79c235..2e9d585073ec 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -36,21 +36,43 @@
 #include <trace/events/f2fs.h>
 #include <uapi/linux/f2fs.h>
 
+static int fill_zero(struct inode *inode, pgoff_t index,
+					loff_t start, loff_t len);
+
 static void f2fs_zero_post_eof_page(struct inode *inode,
 					loff_t new_size, bool lock)
 {
 	loff_t old_size = i_size_read(inode);
+	unsigned int offset;
 
 	if (old_size >= new_size)
 		return;
 
-	if (mapping_empty(inode->i_mapping))
-		return;
-
 	if (lock)
 		filemap_invalidate_lock(inode->i_mapping);
+
 	/* zero or drop pages only in range of [old_size, new_size] */
 	truncate_inode_pages_range(inode->i_mapping, old_size, new_size);
+
+	/*
+	 * When expanding an unaligned EOF size, zero post-EOF data in
+	 * pagecache and set FI_ZERO_POST_EOF, so following checkpointing
+	 * or fsync can persist correct data to disk before committing
+	 * inode w/ updated i_size.
+	 */
+	if (F2FS_OPTION(F2FS_I_SB(inode)).fsync_mode != FSYNC_MODE_STRICT)
+		goto out_unlock;
+
+	offset = old_size & (PAGE_SIZE - 1);
+	if (offset) {
+		unsigned int len = min_t(loff_t, PAGE_SIZE - offset,
+							new_size - old_size);
+		pgoff_t index = old_size >> PAGE_SHIFT;
+
+		fill_zero(inode, index, offset, len);
+		set_inode_flag(inode, FI_ZERO_POST_EOF);
+	}
+out_unlock:
 	if (lock)
 		filemap_invalidate_unlock(inode->i_mapping);
 }
@@ -304,6 +326,13 @@ static int f2fs_do_sync_file(struct file *file, loff_t start, loff_t end,
 	if (S_ISDIR(inode->i_mode))
 		goto go_write;
 
+	if (is_inode_flag_set(inode, FI_ZERO_POST_EOF)) {
+		ret = filemap_write_and_wait(inode->i_mapping);
+		if (ret)
+			return ret;
+		clear_inode_flag(inode, FI_ZERO_POST_EOF);
+	}
+
 	/* if fdatasync is triggered, let's do in-place-update */
 	if (datasync || get_dirty_pages(inode) <= SM_I(sbi)->min_fsync_blocks)
 		set_inode_flag(inode, FI_NEED_IPU);
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
