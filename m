Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6HsJEE7ny2myMQYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Mar 2026 17:25:02 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BBBB36B9EE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Mar 2026 17:25:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rfPrFapSVsCvvrWqhKhHeZcvD/6XlyCDHk8Gw/0Q1YA=; b=USuzvx6H6COT90vdQzEpbKlpc1
	Zk/q7l2O2UInW0ethbfclMgV3hVwuEUv5jel3T/Mx0VHGBnIdOnQr4NnxabD0flRSpXFAAE36lE9h
	Coh3n32u8gyRVaYtbIR5G+v8vkw5SNS1kHNI4azNec1Fnl6wiQ3loCkBGnoQU61jjEaE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w7axU-0004HW-BK;
	Tue, 31 Mar 2026 15:24:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kth5965@gmail.com>) id 1w7axS-0004HM-CF
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Mar 2026 15:24:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wSjL61USwcQJ1wIuLmTxtI1CzuBhlv8ZgrHUillsx5w=; b=DvJLpeGZ2f+nP2BJzJmqKJDIm4
 /RyEZAa3URRL0zKw4KljTsynNtD1lmd0CTINtMeTKnsSAAY2YSl6WmApDhMu6udzM1LvH4ymQC1WN
 jP6BWEAGLLx0Muh3g/Sip7CZUalE2f+FUjZWfqQJDodmgfh2q/OY37jrotIc/U5UczzY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wSjL61USwcQJ1wIuLmTxtI1CzuBhlv8ZgrHUillsx5w=; b=VItqU3g3lMGh8uRfRE46Ic7cAC
 irOJjvCKSd6QKEpdpWiaWJv+Q3LoU8Vwy/ZPnXYdsZWHEUasWadIz5L1/dhSODkTtpPtjqJT2odim
 HqL29cCSuDWp7ssvmuiBuNBvCpLuZwKTdoHIIG5W7zksNTC3Wn+j0aHJaIxbkY1KhAzQ=;
Received: from mail-pj1-f43.google.com ([209.85.216.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1w7axR-0007sC-U0 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 31 Mar 2026 15:24:46 +0000
Received: by mail-pj1-f43.google.com with SMTP id
 98e67ed59e1d1-3538952a464so424554a91.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 31 Mar 2026 08:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1774970675; x=1775575475; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wSjL61USwcQJ1wIuLmTxtI1CzuBhlv8ZgrHUillsx5w=;
 b=DvMUS2zRUYDJht346HaN0E/1iqjn41WDOwtaFvlw9dbHT80EBiyrzhtYlwgbp4t9jS
 NSfjQyV41di8jF+9jhsdikFE4Nd7/F47VUeMrZSQDAqYcs3/nKrGygXSYB0b1axJTWoM
 kvsh7pq1TylJZu61MK4db54U0qF84oM8dx+Uh/QF1NKNtqgfmWEJCv3MNMFU30ztrSXU
 ylxhYb8jZ33Id8bkW5SFuVvVSrNCXMFgj7RLWa9Obsw0nJpUxhBlUE3e1q7lVSWQA4N+
 mTft0n1rty96dOuO0JAIqEatLljJyfOoDWtSKlwz6j5j36QKBFaVWuGM2ju0ZolDgQLN
 bCVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774970675; x=1775575475;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=wSjL61USwcQJ1wIuLmTxtI1CzuBhlv8ZgrHUillsx5w=;
 b=DYMFfJAXJPd5/gGbzgHKnfcUO+eYG8VMnq4IoS4GxfVsn9wFDuwGdB+WmNgXLJbDiz
 QzMwfQYeeQs1HayR1VKEbQlgcOSYFZQWlOMMLwvKr6k2JAUUl2VH6RHaotMHMt3/p2l5
 w9EUnFeW8tpLR3l6nHzBhxKpPhBwQfvO151vWFgm67sqybwH89ItF1DyIZ9qkAzixB1U
 zHotkgNH/L9pU5bEy+hI4bQIBD/bxvn/owHND+GCHoMEAszJ9Fyl2Stn5Nithyo/vPnM
 Rufo1gF42tRc4aHdsIhWXeVzVUhDGNW+FlQjClkxJhaPHBeg9VX15EF9jRotqNa6tlli
 wnMA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbS7+q7wDzILUZMkBl4dkN6deHSj/tmRstt8T0hSNDulkM/qn6gWfyyKSrJ7B+FEkjxcRKJ0Nx8LDcf3GHukgg@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwINQJBTZD3rpUwgaj/lJnwhbQVCWCmzOWXQl4AYfH3l/ZHd/Fc
 7BgNWInonTOQFMUFYYKfHIKs0R4yVu+PBqcypqdWT8thv0xlCRcAaiD5
X-Gm-Gg: ATEYQzzrDZdsKijePl7nYVLDk35VPhG3ifDQOhVw+564SYuGBBRkYMlv9FtEjifQkt3
 WHRvXvU1Zj53v58pwYhzMH/RBMG7RH8SmOPUK9Vz/vzhUb7D1JDCaOC5kKcOxdNS147sUFl9fLT
 xTf4PnJgSt3YMVofVHI2+WHV5+1UoUHF8E5OAKnCbhzioPuisGtxvgi918MPKQbXUK2qAchktaa
 x4qSWxXmEc9zSgBUWHaDTQaSYUYiK153Zfn/JK5AphuExIR29CgPrY4ohlhDrg62U9MqXxKQ8b/
 MG2A2QXe8/M6xnA1stcK8W5sRPm1w52hKeENInV3ozEeeCt6kjn8TDdQUhubLsEs85DMsKomd9K
 Ae76c3oOmmGIUSNS7/Q3swHYq5NsItwZ1dOFoON0g0vON4YsZe2rJ4JCeH6zVgpiMX7NvCY3k+C
 eh1vpVv9jBcq914mXDz0MXfJHyGgKW+kEYoKyHJMS3
X-Received: by 2002:a17:90b:4cc6:b0:35b:93d8:6ab9 with SMTP id
 98e67ed59e1d1-35c300c22cfmr9471276a91.3.1774970675122; 
 Tue, 31 Mar 2026 08:24:35 -0700 (PDT)
Received: from kt5965-NUC8i3BEH.. ([182.217.14.201])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-35dbe6953a8sm2111709a91.12.2026.03.31.08.24.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 31 Mar 2026 08:24:34 -0700 (PDT)
From: kth5965@gmail.com
To: Chao Yu <chao@kernel.org>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Date: Wed,  1 Apr 2026 00:24:29 +0900
Message-ID: <20260331152429.163173-1-kth5965@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <37c11065-e055-41b8-82a8-68f2fdf56ac3@kernel.org>
References: <37c11065-e055-41b8-82a8-68f2fdf56ac3@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Sorry for the late reply. I worked in that direction, and
 the fix ended up touching a bit more than I first expected. One part that
 grew a bit was the empty/no-data inline conversion side. To handle that case
 cleanly, I ended up consolidating part of the inline-state teardown so the
 no-data path and the normal inline [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.43 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [kth5965(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [kth5965(at)gmail.com]
X-Headers-End: 1w7axR-0007sC-U0
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: evict: truncate page cache before
 clear_inode
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
Cc: linux-kernel@vger.kernel.org,
 syzbot+fc026e87558558f75c00@syzkaller.appspotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [1.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:chao@kernel.org,m:jaegeuk@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:syzbot+fc026e87558558f75c00@syzkaller.appspotmail.com,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[kth5965@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	FORGED_SENDER_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,fc026e87558558f75c00];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FROM_NEQ_ENVFROM(0.00)[kth5965@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_NO_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 8BBBB36B9EE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Sorry for the late reply.

I worked in that direction, and the fix ended up touching a bit more than I first expected.

One part that grew a bit was the empty/no-data inline conversion side.
To handle that case cleanly, I ended up consolidating part of the inline-state teardown so the no-data path and the normal inline-conversion cleanup follow the same path.
This also lets f2fs_convert_inline_inode() avoid grabbing folio #0 in the empty inline case.

With the current version, the reproducer no longer reaches the late clear_inode() BUG and instead fails earlier with Failed to read root inode.

If you think that cleanup change should be trimmed or split out, please let me know.

The current diff is below.

diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 0a1052d5ee62..89e8a0fbb923 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -53,8 +53,8 @@ bool f2fs_sanity_check_inline_data(struct inode *inode, struct folio *ifolio)
	if (!f2fs_has_inline_data(inode))
		return false;

-	if (inode_has_blocks(inode, ifolio))
-		return false;
+	if (!f2fs_exist_data(inode) && inode_has_blocks(inode, ifolio))
+		return true;

	if (!support_inline_data(inode))
		return true;
@@ -142,6 +142,17 @@ int f2fs_read_inline_data(struct inode *inode, struct folio *folio)
	return 0;
 }

+static void f2fs_clear_inline_inode(struct dnode_of_data *dn)
+{
+	f2fs_folio_wait_writeback(dn->inode_folio, NODE, true, true);
+	clear_inode_flag(dn->inode, FI_DATA_EXIST);
+	stat_dec_inline_inode(dn->inode);
+	clear_inode_flag(dn->inode, FI_INLINE_DATA);
+	set_raw_inline(dn->inode, F2FS_INODE(dn->inode_folio));
+	folio_mark_dirty(dn->inode_folio);
+	folio_clear_f2fs_inline(dn->inode_folio);
+}
+
 int f2fs_convert_inline_folio(struct dnode_of_data *dn, struct folio *folio)
 {
	struct f2fs_io_info fio = {
@@ -157,8 +168,10 @@ int f2fs_convert_inline_folio(struct dnode_of_data *dn, struct folio *folio)
	struct node_info ni;
	int dirty, err;

-	if (!f2fs_exist_data(dn->inode))
-		goto clear_out;
+	if (!f2fs_exist_data(dn->inode)) {
+		f2fs_clear_inline_inode(dn);
+		goto out;
+	}

	err = f2fs_reserve_block(dn, 0);
	if (err)
		return err;
@@ -206,10 +219,8 @@ int f2fs_convert_inline_folio(struct dnode_of_data *dn, struct folio *folio)

	/* clear inline data and flag after data writeback */
	f2fs_truncate_inline_inode(dn->inode, dn->inode_folio, 0);
-	folio_clear_f2fs_inline(dn->inode_folio);
-clear_out:
-	stat_dec_inline_inode(dn->inode);
-	clear_inode_flag(dn->inode, FI_INLINE_DATA);
+	f2fs_clear_inline_inode(dn);
+out:
	f2fs_put_dnode(dn);
	return 0;
 }
@@ -219,7 +230,7 @@ int f2fs_convert_inline_inode(struct inode *inode)
	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
	struct dnode_of_data dn;
	struct f2fs_lock_context lc;
-	struct folio *ifolio, *folio;
+	struct folio *ifolio, *folio = NULL;
	int err = 0;

	if (f2fs_hw_is_readonly(sbi) || f2fs_readonly(sbi->sb))
		return -EROFS;
@@ -232,9 +243,13 @@ int f2fs_convert_inline_inode(struct inode *inode)
	if (err)
		return err;

-	folio = f2fs_grab_cache_folio(inode->i_mapping, 0, false);
-	if (IS_ERR(folio))
-		return PTR_ERR(folio);
+	if (f2fs_exist_data(inode)) {
+		folio = f2fs_grab_cache_folio(inode->i_mapping, 0, false);
+		if (IS_ERR(folio))
+			return PTR_ERR(folio);
+	}
+
+	set_new_dnode(&dn, inode, NULL, NULL, 0);

	f2fs_lock_op(sbi, &lc);

@@ -249,11 +264,11 @@ int f2fs_convert_inline_inode(struct inode *inode)
	if (f2fs_has_inline_data(inode))
		err = f2fs_convert_inline_folio(&dn, folio);

-	f2fs_put_dnode(&dn);
 out:
+	f2fs_put_dnode(&dn);
	f2fs_unlock_op(sbi, &lc);
-
-	f2fs_folio_put(folio, true);
+	if (folio)
+		f2fs_folio_put(folio, true);

	if (!err)
		f2fs_balance_fs(sbi, dn.node_changed);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
