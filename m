Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNwpIw6lb2lIDwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 16:53:50 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D78446CD1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Jan 2026 16:53:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JyzHDgRsMn1FNAM8f0xFb8e/y82SSM4omyRf8/arqv4=; b=I/Zpsq53FwuM39BRB2U6vlWBPH
	EAuBne8W3ycmKuBbbwJp31cR6RGODRj9famUHkbKeWJsvhz+QVeaI3wCeFiaz7fLVWMGNrsIJfVIR
	ELUb8yOrr6rNuPMFQTTwHcTSiHhvSYX1E1geh2b8hr9iM3G2UzA5SXF+v0JcXEqFpkUc=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1viCQu-0008DN-QH;
	Tue, 20 Jan 2026 14:10:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1viCQt-0008DF-7T
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jan 2026 14:10:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=niZhTc3DmsG9IgZdXfPGRTMOtycgFxKeIT30aZVg8R0=; b=I1QSr1AylbCj14eIv6VzQ+Feod
 aLdaoTcfGPnOPIttX42vZ1F+mkx4sH9HqhEPAgXACa6RBC3FoeYnV2scdxAtEeVRCznsSpJ9bPdNa
 qtzAhRYla4WaCqlEWdtm+zdNzJGR9o7NbAq+5DV0lug1iegGJWPPgnRWueI1C6WhixTM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=niZhTc3DmsG9IgZdXfPGRTMOtycgFxKeIT30aZVg8R0=; b=k
 bHQYqQD37iBUjGqBbTCem8WGZeRwih50JllTm86YJDAq6NGUwQC1J+snXm5G/vkMdUHp8l0oo8/Ak
 E1hyQe0n4HjXddHXrayHfba3cZSVWUMcbkpxaDTe9sipRbbSP4FrHYcQNx4hZAkLDLGTvDcHseTPo
 4HjcvpcN7VVnb0Ag=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1viCQp-0007N1-OB for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Jan 2026 14:10:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 591D2405C4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 20 Jan 2026 14:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2152C16AAE;
 Tue, 20 Jan 2026 14:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768918197;
 bh=/0YV9HPz2sOTWP+p0Nnsg9bPhsiHXnja/zujchfFWhU=;
 h=From:To:Cc:Subject:Date:From;
 b=fjzKuSWBOtdPopiMufPWFvZRIqoLYRP8n7nDglu6OKaJobys7OGf/7/NscShFk4Jp
 9xjE3nQWFU1wGEJ4hEt5wvSExDNJk7UYHwu2B0wJikl6m7O5CP3pNv2Jxuf0zpFL6v
 01PHnczTxISt42hS65sSjdh85BRIC5Qs4Nts5NOcL+4Pmf8BytB6/hSCuKD8utzD4Q
 dMx8zccm51Hvoimd+L6DIEp/8roCg6jiufxU07TmY1c2Nt1AHJO3d/0EDtvp/dYodf
 maRbVRfCOmoXp3oktYIibq64C/FWEhLrotWgcchv6plvaqrXM2r/ioQfsidq5Ac2le
 t/QHtj3lcI52w==
To: jaegeuk@kernel.org
Date: Tue, 20 Jan 2026 17:12:14 +0800
Message-Id: <20260120091215.62608-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch introduces sbi->nr_pages[F2FS_SKIPPED_WRITE] to
 record any skipped write during data flush in f2fs_enable_checkpoint(). So
 in the loop of data flush, if there is any skipped write in previous flush,
 let's retry sync_inode_sb(), otherwise,
 all dirty data written before f2fs_enable_checkpoint()
 should have been persisted [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 1.1 DATE_IN_PAST_03_06     Date: is 3 to 6 hours before Received: date
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1viCQp-0007N1-OB
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs: check skipped write in
 f2fs_enable_checkpoint()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_MATCH_TO(1.00)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[chao@kernel.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 2D78446CD1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This patch introduces sbi->nr_pages[F2FS_SKIPPED_WRITE] to record any
skipped write during data flush in f2fs_enable_checkpoint().

So in the loop of data flush, if there is any skipped write in previous
flush, let's retry sync_inode_sb(), otherwise, all dirty data written
before f2fs_enable_checkpoint() should have been persisted, then break
the retry loop.

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- update F2FS_SKIPPED_WRITE only when a) wbc->sync_mode is WB_SYNC_ALL
and b) return value of f2fs_write_cache_pages() is non-zero.
 fs/f2fs/data.c  | 19 +++++++++++++++++++
 fs/f2fs/f2fs.h  |  2 ++
 fs/f2fs/super.c | 37 +++++++++++++++++++++++++++++++++----
 3 files changed, 54 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d509172b51df..25b4d3f21fa7 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3495,6 +3495,16 @@ static inline void account_writeback(struct inode *inode, bool inc)
 	f2fs_up_read(&F2FS_I(inode)->i_sem);
 }
 
+static inline void update_skipped_write(struct f2fs_sb_info *sbi,
+						struct writeback_control *wbc)
+{
+	long skipped = wbc->pages_skipped;
+
+	if (is_sbi_flag_set(sbi, SBI_ENABLE_CHECKPOINT) && skipped &&
+		wbc->sync_mode == WB_SYNC_ALL)
+		atomic_add(skipped, &sbi->nr_pages[F2FS_SKIPPED_WRITE]);
+}
+
 static int __f2fs_write_data_pages(struct address_space *mapping,
 						struct writeback_control *wbc,
 						enum iostat_type io_type)
@@ -3559,10 +3569,19 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
 	 */
 
 	f2fs_remove_dirty_inode(inode);
+
+	/*
+	 * f2fs_write_cache_pages() has retry logic for EAGAIN case which is
+	 * common when racing w/ checkpoint, so only update skipped write
+	 * when ret is non-zero.
+	 */
+	if (ret)
+		update_skipped_write(sbi, wbc);
 	return ret;
 
 skip_write:
 	wbc->pages_skipped += get_dirty_pages(inode);
+	update_skipped_write(sbi, wbc);
 	trace_f2fs_writepages(mapping->host, wbc, DATA);
 	return 0;
 }
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 035239758e33..52cec6b3ecf0 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1238,6 +1238,7 @@ enum count_type {
 	F2FS_RD_META,
 	F2FS_DIO_WRITE,
 	F2FS_DIO_READ,
+	F2FS_SKIPPED_WRITE,	/* skip or fail during f2fs_enable_checkpoint() */
 	NR_COUNT_TYPE,
 };
 
@@ -1476,6 +1477,7 @@ enum {
 	SBI_IS_RESIZEFS,			/* resizefs is in process */
 	SBI_IS_FREEZING,			/* freezefs is in process */
 	SBI_IS_WRITABLE,			/* remove ro mountoption transiently */
+	SBI_ENABLE_CHECKPOINT,			/* indicate it's during f2fs_enable_checkpoint() */
 	MAX_SBI_FLAG,
 };
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 97c2264ec7fe..0afe9f829058 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2690,6 +2690,7 @@ static int f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 	long long start, writeback, end;
 	int ret;
 	struct f2fs_lock_context lc;
+	long long skipped_write, dirty_data;
 
 	f2fs_info(sbi, "f2fs_enable_checkpoint() starts, meta: %lld, node: %lld, data: %lld",
 					get_pages(sbi, F2FS_DIRTY_META),
@@ -2698,17 +2699,45 @@ static int f2fs_enable_checkpoint(struct f2fs_sb_info *sbi)
 
 	start = ktime_get();
 
+	set_sbi_flag(sbi, SBI_ENABLE_CHECKPOINT);
+
 	/* we should flush all the data to keep data consistency */
 	do {
+		skipped_write = get_pages(sbi, F2FS_SKIPPED_WRITE);
+		dirty_data = get_pages(sbi, F2FS_DIRTY_DATA);
+
 		sync_inodes_sb(sbi->sb);
 		f2fs_io_schedule_timeout(DEFAULT_SCHEDULE_TIMEOUT);
-	} while (get_pages(sbi, F2FS_DIRTY_DATA) && retry--);
+
+		f2fs_info(sbi, "sync_inode_sb done, dirty_data: %lld, %lld, "
+				"skipped write: %lld, %lld, retry: %d",
+				get_pages(sbi, F2FS_DIRTY_DATA),
+				dirty_data,
+				get_pages(sbi, F2FS_SKIPPED_WRITE),
+				skipped_write, retry);
+
+		/*
+		 * sync_inodes_sb() has retry logic, so let's check dirty_data
+		 * in prior to skipped_write in case there is no dirty data.
+		 */
+		if (!get_pages(sbi, F2FS_DIRTY_DATA))
+			break;
+		if (get_pages(sbi, F2FS_SKIPPED_WRITE) == skipped_write)
+			break;
+	} while (retry--);
+
+	clear_sbi_flag(sbi, SBI_ENABLE_CHECKPOINT);
 
 	writeback = ktime_get();
 
-	if (unlikely(get_pages(sbi, F2FS_DIRTY_DATA)))
-		f2fs_warn(sbi, "checkpoint=enable has some unwritten data: %lld",
-					get_pages(sbi, F2FS_DIRTY_DATA));
+	if (unlikely(get_pages(sbi, F2FS_DIRTY_DATA) ||
+			get_pages(sbi, F2FS_SKIPPED_WRITE)))
+		f2fs_warn(sbi, "checkpoint=enable unwritten data: %lld, skipped data: %lld, retry: %d",
+				get_pages(sbi, F2FS_DIRTY_DATA),
+				get_pages(sbi, F2FS_SKIPPED_WRITE), retry);
+
+	if (get_pages(sbi, F2FS_SKIPPED_WRITE))
+		atomic_set(&sbi->nr_pages[F2FS_SKIPPED_WRITE], 0);
 
 	f2fs_down_write_trace(&sbi->gc_lock, &lc);
 	f2fs_dirty_to_prefree(sbi);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
