Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +BSeCQD/D2pvSQYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 09:00:16 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DC325AFC3E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 May 2026 09:00:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jYS2vVpvRD7Cor8yapJVtmr0BzEqAwavtYes3wv2r+w=; b=kyJHBLv4sfUYLWZtiiCc6hr4vW
	g7wbJ62PUB0WbUjT4eWAJeLkaSVItrz0spUY0aQHsnd3RhqA3dhayh690+E2pl7zz0pEbVySvmFTP
	ifXTVN0+eSLuc2M5b7V5XhBXfPnb181PNK/SW9jjwz5YNzmLu8lOQIe2Q2rHugVidLBM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wQJra-0001QB-BN;
	Fri, 22 May 2026 07:00:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1wQJrD-0001Ok-Ph
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 06:59:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LXpfIPCwR9J7BljOwsx1xfeavd9YBYzAsniQAQt/y8k=; b=ZvHWJFIhyqqRd2iUq39zfJnNMB
 r2LCMQXauqgyv47rdLzn7sjTIutOFEyiyvRwb001WQHVQUmGIMLwt8nlCuN0xY5XCLHTsyodokxDe
 yZjbbn8ppMIqqO7MFIn/wBB0TIyJzRFGdqv+3fWl5yjCyZAMJ8dtNFZNlhcAK7MosNp0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LXpfIPCwR9J7BljOwsx1xfeavd9YBYzAsniQAQt/y8k=; b=OsKfjCO+vB94IU587Ap9Qv3nM5
 HYYHzS7MHtYA58ij9fVSK9ZiByLlKx2bu4CrH5EIJTqtULkzjKwwWpDNu+lSnAj0MCKk5btbFqJQX
 yOaFFCPUiba6vSByc/v9lAv9jdipRvof3/FQ6IXaiBy3m8yMZqJFBSz7e7jkN5Dmh6UA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wQJrA-0000ZJ-7U for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 May 2026 06:59:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id E1EB1601FE;
 Fri, 22 May 2026 06:59:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BB621F000E9;
 Fri, 22 May 2026 06:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779433169;
 bh=LXpfIPCwR9J7BljOwsx1xfeavd9YBYzAsniQAQt/y8k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=AOnv0N5nweVg5QC5b5VyS1GdSxJytzWnQ8XYj6tnqz8kHRj2FCU97cCD9vHaj/+p5
 6MlwCbe5PxDQYeQVjO3+uLMJ1Yscul89MXn32qDE3+da7W1hNLuteq6UkoPIpzi9Gm
 4zUUCSM5S3TwBe2+1rqeJwUmHkL234Oi8bE5IHLKdl9OXNuYdgOyY3ePpjiIUHkyHJ
 k1T6jdZMlEZZNs4/nt3XbAPcOxfjAmy43BdhOrFtbT4WWt55EAioJl23yNhw39GuNy
 Bj7EHXSQ+rjiVNeYOYkKtcJvzRF4VUnsfwO+IQ0RCkmWAnapV/HaKVqVwOs/LIQG8X
 AEq2M8O+KhVOA==
To: jaegeuk@kernel.org
Date: Fri, 22 May 2026 14:59:12 +0800
Message-ID: <20260522065912.1756240-2-chao@kernel.org>
X-Mailer: git-send-email 2.54.0.746.g67dd491aae-goog
In-Reply-To: <20260522065912.1756240-1-chao@kernel.org>
References: <20260522065912.1756240-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Commit ae27d62e6bef ("f2fs: check in-memory sit version
 bitmap") added a mirror for sit version bitmap,
 it expects to detect in-memory corruption, 
 however we never got any reports from the check point [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1wQJrA-0000ZJ-7U
Subject: [f2fs-dev] [PATCH 2/2] Revert: "f2fs: check in-memory sit version
 bitmap"
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
Cc: linux-kernel@vger.kernel.org, wallentx <william.allentx@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-6.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:william.allentx@gmail.com,m:linux-f2fs-devel@lists.sourceforge.net,m:williamallentx@gmail.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[vger.kernel.org,gmail.com,lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 4DC325AFC3E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Commit ae27d62e6bef ("f2fs: check in-memory sit version bitmap") added
a mirror for sit version bitmap, it expects to detect in-memory
corruption, however we never got any reports from the check points
for almost decade, let's remove the code, it can help to save
memories.

Cc: wallentx <william.allentx@gmail.com>
Suggested-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.c |  6 ------
 fs/f2fs/segment.h | 16 ----------------
 2 files changed, 22 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 9926ba9d77ba..993555042876 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4882,11 +4882,6 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
 		return -ENOMEM;
 
 #ifdef CONFIG_F2FS_CHECK_FS
-	sit_i->sit_bitmap_mir = kmemdup(src_bitmap,
-					sit_bitmap_size, GFP_KERNEL);
-	if (!sit_i->sit_bitmap_mir)
-		return -ENOMEM;
-
 	sit_i->invalid_segmap = f2fs_kvzalloc(sbi,
 					main_bitmap_size, GFP_KERNEL);
 	if (!sit_i->invalid_segmap)
@@ -5849,7 +5844,6 @@ static void destroy_sit_info(struct f2fs_sb_info *sbi)
 	SM_I(sbi)->sit_info = NULL;
 	kfree(sit_i->sit_bitmap);
 #ifdef CONFIG_F2FS_CHECK_FS
-	kfree(sit_i->sit_bitmap_mir);
 	kvfree(sit_i->invalid_segmap);
 #endif
 	kfree(sit_i);
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 38a56b8ab2cc..b0c06b3580b4 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -206,8 +206,6 @@ struct sit_info {
 	char *bitmap;			/* all bitmaps pointer */
 	char *sit_bitmap;		/* SIT bitmap pointer */
 #ifdef CONFIG_F2FS_CHECK_FS
-	char *sit_bitmap_mir;		/* SIT bitmap mirror */
-
 	/* bitmap of segments to be ignored by GC in case of errors */
 	unsigned long *invalid_segmap;
 #endif
@@ -549,11 +547,6 @@ static inline void get_sit_bitmap(struct f2fs_sb_info *sbi,
 {
 	struct sit_info *sit_i = SIT_I(sbi);
 
-#ifdef CONFIG_F2FS_CHECK_FS
-	if (memcmp(sit_i->sit_bitmap, sit_i->sit_bitmap_mir,
-						sit_i->bitmap_size))
-		f2fs_bug_on(sbi, 1);
-#endif
 	memcpy(dst_addr, sit_i->sit_bitmap, sit_i->bitmap_size);
 }
 
@@ -894,12 +887,6 @@ static inline pgoff_t current_sit_addr(struct f2fs_sb_info *sbi,
 
 	f2fs_bug_on(sbi, !valid_main_segno(sbi, start));
 
-#ifdef CONFIG_F2FS_CHECK_FS
-	if (f2fs_test_bit(offset, sit_i->sit_bitmap) !=
-			f2fs_test_bit(offset, sit_i->sit_bitmap_mir))
-		f2fs_bug_on(sbi, 1);
-#endif
-
 	/* calculate sit block address */
 	if (f2fs_test_bit(offset, sit_i->sit_bitmap))
 		blk_addr += sit_i->sit_blocks;
@@ -925,9 +912,6 @@ static inline void set_to_next_sit(struct sit_info *sit_i, unsigned int start)
 	unsigned int block_off = SIT_BLOCK_OFFSET(start);
 
 	f2fs_change_bit(block_off, sit_i->sit_bitmap);
-#ifdef CONFIG_F2FS_CHECK_FS
-	f2fs_change_bit(block_off, sit_i->sit_bitmap_mir);
-#endif
 }
 
 static inline unsigned long long get_mtime(struct f2fs_sb_info *sbi,
-- 
2.49.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
