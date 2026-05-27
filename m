Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IJDLBnHeFmo9uQcAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 May 2026 14:07:13 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1405E3D55
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 27 May 2026 14:07:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=t8hm0yWbVvlCkMNQHRNYIA0fxpAcsDnnX1xs28dlDMY=; b=lhL4zDuH10ivPBFBJl7koX3MtI
	9X20iXxaMPVx4Avmu79uamgeCUGP/Aidx1zo8XeyJfE22UZj1LoboFehPuAsto7QjGyAng6SByxV8
	q+l5+dgEE1sFitCCI94JB9VsNWKh7qIEinSXxtjaspqUUYar/n125gGc5x3OPwLQWYjI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wSD2O-0006D6-5P;
	Wed, 27 May 2026 12:07:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1wSD23-0006Ca-Lp
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 May 2026 12:06:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=w87yPUao64o6fGhq2gkW4aCOEo2iNW2ProMA0X1oPBY=; b=XPvrDPa2IFcRit171e264uieGu
 11GxFEAt6EnovVlHZsdPALzPvn9o55Jwf1kDhyTSK/oKoc7PstwwEExFFU+bycYnMGrGjH8OemXTP
 HC8Nt5oq4JdC1uR71QMvtkAjhr2tFaeB7+zEQx1v9ANzYzDASOx1Rhqke7yYvbHjo0eI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=w87yPUao64o6fGhq2gkW4aCOEo2iNW2ProMA0X1oPBY=; b=V
 MgUtoUIzr9FYIuXF6kdlgq7A6h9tGEovNPLAAqTwJ5jt0Ur+KGQOqlFuVzqk0c07csVUkK2AF6dqE
 nV+DmRhlqYAhIJyIW4Sr4aCfzlo9l6C6W8cUVtFFFqDe50ymsULZLiS6migbaJ2T6NNahhZZAZZKA
 43ifGInKxIN5S8pw=;
Received: from mail-pl1-f181.google.com ([209.85.214.181])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1wSD20-0002ta-7Q for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 27 May 2026 12:06:41 +0000
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2ba6485d219so89546335ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 27 May 2026 05:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1779883595; x=1780488395; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=w87yPUao64o6fGhq2gkW4aCOEo2iNW2ProMA0X1oPBY=;
 b=Y+DdiCcWrSD2OMtekKGNQWhyk49egdQUu9TwLwApQ9LcO6nhQGXiBayUB7gFRQUOm0
 hWJDMnxM/q/mHGyKjGTvBcG09jKon//OQ/bbsbTggKRx4SDki40WmZuj7mONoUDABoE/
 QYbJNANaVfg6XeQitp0PP0WyC4Yoez/hbqQ8eWjU54cyqM8KgQdPs8kF93x0aQb26zPc
 yW/hosgwHbYjol7jIwaJQ+cP7o8o14CuAr+pjlbxwVR+M9QLym941fhkKFVuXzm4oGvu
 9cWb4KIN7Gl3pnmvkdct+eBs7NxSu/td1CW2zoP3r/hJfzINPwIF8WIfPVufD3eaf9S4
 NMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779883595; x=1780488395;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=w87yPUao64o6fGhq2gkW4aCOEo2iNW2ProMA0X1oPBY=;
 b=r/N+pQFH3bSRhqCzrccNdzelRDWOfkaL/snZOf5Xfg6m2OUfEW5+Bj0xkPDK9ZbEWM
 E0sLez0NAkPurvvHPaYSRs1omvJ4zDr8H7uJ55+9gOaP8OT9/kfwwW4YviqfxgMRd1V/
 bOoSwq6AEFWFUFg1uhxQraMw2Gjijjv4xUhf96ILshmMQxmCWUThLmcw8Ru4k3u6qOBG
 khXn+bOWL3Ei41ex98UuYWNsUDGF2g392TfbzB0kiDMlr9JAezX+NEa87lg7ExFkYJU5
 PIq2xqFYLYY+JQOPwbQyooodeas/26E0e//jkZKMuckrvClZuzrZ9XRaUPQesxyl/3Cq
 1a0g==
X-Forwarded-Encrypted: i=1;
 AFNElJ9c9ko1BvcYvDKSTHA7N3jL1EjVyKM1pEQkPnGFTdjKvry71dHUFC9Tsm39uTm22bzVhGtc5MhNXO1HN3eA8jXk@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzZ+AZV7/3rb1joY96AmMFVjuLKQEk6nIRVcZVWY+Ta92eDLRSt
 EE07BoH5FFEMcmsr0EAaXpovjNaqgYTavEgiQuiQsFcmsM8nAQMz2NjW
X-Gm-Gg: Acq92OHRoRsKaSEJtZ/0YNBqNO3HrdSG2LHWgQe/aSqjKftsEjlFAIrEah7kNdJxA8t
 FcnsZHcMqmtk+hKnkpM1zTJM0GWRBapuWIWRw4MmjE3HMcHm4dcJ8CfGHczgSg+N6NPCfXdvcTN
 yaefcETQIEboocS7S69Xr8q48Ob4M1ML30nsC6qcmciATtfTcbZMOIry7LoL2tOQJVOhz6NzBd8
 FOjOAOF5BX0xrKstV1/I+ijIzvtI0EQIapdER72g4bR5kMfUyJ5zG/4qGDegtorHmqbIm6DVa8K
 4v0SyT0rRDCqcUoAus6sixO0pIHcJESTAr6z9VQZJPzDPMIhlNH6V44gn0P79LhYPRKj38ElN7v
 I++bMDtu5kmNgCP7ayARK0dMlIS0OxIjI5PTFDt2ny2zOiBQeu5+TPDx+Z4pQcLKyYgD6xeTH5N
 A8R19nSRi0H9RxfahQAiNOZCXQN9rjTZwKYluU0fXHh4Og0Cd0zsfdPhTgX5HOf7vnZrdZoGSyk
 VBTXr9l
X-Received: by 2002:a17:902:ec81:b0:2b2:4697:4370 with SMTP id
 d9443c01a7336-2beb0368160mr229211925ad.3.1779883594883; 
 Wed, 27 May 2026 05:06:34 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2beb58c4f20sm149627235ad.61.2026.05.27.05.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 05:06:34 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 27 May 2026 20:06:28 +0800
Message-ID: <20260527120628.2255597-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: A partial atomic write reserves a block in the COW inode
 before
 reading the original data page for the untouched bytes in that page. If that
 read fails, write_begin returns an error but leaves the COW inode entry as
 NEW_ADDR. A retry of the same partial write then finds the COW entry, treats
 it as existing COW data, and f2fs_write_ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.181 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1wSD20-0002ta-7Q
Subject: [f2fs-dev] [PATCH] f2fs: keep atomic write retry from zeroing
 original data
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
Cc: qwjhust@gmail.com, linux-kernel@vger.kernel.org, qiwenjie@xiaomi.com,
 daehojeong@google.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:qwjhust@gmail.com,m:linux-kernel@vger.kernel.org,m:qiwenjie@xiaomi.com,m:daehojeong@google.com,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,vger.kernel.org,xiaomi.com,google.com,lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_SEVEN(0.00)[7];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,xiaomi.com:mid,xiaomi.com:email]
X-Rspamd-Queue-Id: 7B1405E3D55
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

A partial atomic write reserves a block in the COW inode before reading the
original data page for the untouched bytes in that page.

If that read fails, write_begin returns an error but leaves the COW inode
entry as NEW_ADDR. A retry of the same partial write then finds the COW
entry, treats it as existing COW data, and f2fs_write_begin() zeroes the
whole folio because blkaddr is NEW_ADDR.

If the retry is committed, the bytes outside the retried write range are
committed as zeroes instead of preserving the original file contents.

Only use the COW inode as the read source when it already has a real data
block. If the COW entry is still NEW_ADDR, treat it as a reservation to
reuse: keep reading the old data from the original inode and avoid
reserving or accounting the same atomic block again.

Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
 fs/f2fs/data.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d83a21998ec2..edda2ff72073 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3862,6 +3862,7 @@ static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
 	pgoff_t index = folio->index;
 	int err = 0;
 	block_t ori_blk_addr = NULL_ADDR;
+	bool cow_has_reserved_block = false;
 
 	/* If pos is beyond the end of file, reserve a new block in COW inode */
 	if ((pos & PAGE_MASK) >= i_size_read(inode))
@@ -3871,9 +3872,11 @@ static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
 	err = __find_data_block(cow_inode, index, blk_addr);
 	if (err) {
 		return err;
-	} else if (*blk_addr != NULL_ADDR) {
+	} else if (__is_valid_data_blkaddr(*blk_addr)) {
 		*use_cow = true;
 		return 0;
+	} else if (*blk_addr == NEW_ADDR) {
+		cow_has_reserved_block = true;
 	}
 
 	if (is_inode_flag_set(inode, FI_ATOMIC_REPLACE))
@@ -3886,10 +3889,13 @@ static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
 
 reserve_block:
 	/* Finally, we should reserve a new block in COW inode for the update */
-	err = __reserve_data_block(cow_inode, index, blk_addr, node_changed);
-	if (err)
-		return err;
-	inc_atomic_write_cnt(inode);
+	if (!cow_has_reserved_block) {
+		err = __reserve_data_block(cow_inode, index, blk_addr,
+					   node_changed);
+		if (err)
+			return err;
+		inc_atomic_write_cnt(inode);
+	}
 
 	if (ori_blk_addr != NULL_ADDR)
 		*blk_addr = ori_blk_addr;

base-commit: c0b65f6129c7fbb526e921dd60261650f1b2bef9
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
