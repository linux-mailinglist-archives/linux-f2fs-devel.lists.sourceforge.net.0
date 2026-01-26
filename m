Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6Hk3OZvqd2nSmQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 23:28:43 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E4B38DEEB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 23:28:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k24m0WIODI+YDePA3fEhVtN1fSdLuQ9nVrKXYxQX9a0=; b=cFlyTP8Df4CFz5vPV63zFqWVbK
	38C9Ja0YXOp3+daEEX9ylMzVRmAUfcXQsCIqHom2pEVpK/on+/XBO9Gw3kyNlKlXt6uYxArI6TQpP
	+GLea6W/GVW+NLcxhAtofgf5j3OoGw/A4sTHHkWJonSkZxU0eKxO4fjWjp2ftPcBYJIQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vkV4S-0001Q0-44;
	Mon, 26 Jan 2026 22:28:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1vkV4E-0001Ob-E1
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 22:28:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r/YQUW79tWj3TANvJnFZMqHkLodLunhydJd79kJoIgs=; b=kOR6/ICHTjK9CcgUrDZwwXjbZ8
 mPlul62yl3twuULrmYeL5+CwGoDqH6x43v+sTN6FheqEzCaB2UYnNQk6udwms8dBj5ToBcwPw3ZH3
 u46xXUh66icoz588RoLkVpddhqEA1Ivy4uyAn8DfAWiCgPOcKr2MTDWxUdFoXSDXCmLY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=r/YQUW79tWj3TANvJnFZMqHkLodLunhydJd79kJoIgs=; b=P
 786xfDwmPxMcX1HJn3Qb6QNdDkXe/vdeIjEB37WXO4tY/bSfvW4vK+KLY+DwnIw26WWXmmZFIV1ZE
 b2g1OeTQeH+5uzC6IDfRiFmLCs0dITEpS4if4408nfEYJB3vFNIu/0StmRC4WbJgd5IOB4HTgh27L
 sqTbL++a9sOIHa/s=;
Received: from mail-dy1-f176.google.com ([74.125.82.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vkV4E-0005pm-IS for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 22:28:19 +0000
Received: by mail-dy1-f176.google.com with SMTP id
 5a478bee46e88-2b740872a01so7415102eec.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Jan 2026 14:28:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769466488; x=1770071288; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=r/YQUW79tWj3TANvJnFZMqHkLodLunhydJd79kJoIgs=;
 b=R0MoLs4vCqeD8IHkVtSNJ6RdpYjZWcRau3XO9MKxKZfMClgQ3bH9ObBp+Cw6mSodF2
 b8V/LIHioow+TW3bv+0VnTkPTBiPLtX6cO/8YvSWuvgQJQRq+KXF8VDw8O0MVyCb096D
 v3j1DYXuW91K7BujChHt7/MkotSbaLoOdbnNnT3gPGGjhLRUWZZwokQEziHRKA1mYc6q
 NQ5rm2vcOE7dbDohRqXNO0BPHZ9TJrC5AZyntoAZW5b+Qq9iVLt341lruVO6vKhdXuh7
 Fxwhd3bEWNNXENw5+XktNaKJ29frI0LuNPpXABSkoFuG8+GOR5JLt2RQFjQJ3FgYVm5J
 GrKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769466488; x=1770071288;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r/YQUW79tWj3TANvJnFZMqHkLodLunhydJd79kJoIgs=;
 b=wb3zZxBhNnYw1fzi48lwWt0g28BQYjlrD+ePttZbBrdETBBHHI0jbl8IPegeuV8TzN
 dsJy9abZavqL/1j+nPHxEH+dhb07RoC39AYbmkvDqswF08DetsxbCT0450Mj3DSPJazT
 pJ2joeICBaWnz7p9ui0KkcTho2/b7mOYldDUzBf5v+aaTXkD95uBF/jxVoEnu6j2s0+U
 25fNDJNEDZOVJwOdOZ3PRU/igrzGuOSxZVhHXPJtQp+Ufu0Yq2wVMua4YtSftZoaRwCX
 JQiaFfVr6uX6aa6CwrgRjD/9Gmf1DR/tgY2ouWORnVD+70t71vYGIfY9YYheATqAY/FM
 RlhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVS1U3KCAzRekYFcmRQxt3e1B6nmfTnC8MMDRYPom8vuRXGDkhQYQMIV/pN7V0fOwmmR/6rCsHzWIsu7Jfk/t7f@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwHfwKeTzYu5GF+zJ/1PPPh5uVxUbK7Xtc+M0pYQXWUNE3Y72QZ
 xRya08686GFg5lPqE4czhnjpqAqjWvVBX+RMSmZmSTyLGaat0Dm8KU1a
X-Gm-Gg: AZuq6aIJGYVbptfWaRS7rsAJMKQWQxc+z+cz1E7qujQYd9bW1VTcrtt9wjH2SJG8Lse
 nbv1X/cKmNdwygfMoYXBVwXpQVvcyuoBB5bid9c5RWcrHziRGse38VYbWqRAnAOw9voxlXSdpI/
 TEWW/g09tMT7RLkfZ44Mt66/g8WjHHT7Q9oZgBsDQYcamHpWyqmH9mCx0rLM/TLBovCgJ7RLlCL
 wsw2HeMrkvlOiFgjOW1GoJkGHH6jf8ijD0kI1BfXR4ZEO62S4qraRPJol7hE9E09CHIouSHjrO4
 zaN6xrtOT29MLnpalJihdDlTbZ0B4uGxWTRd0+W7uR6Yem7euW6/DdDONQyL2hy1C3dkMLqtldc
 KXDH+gKZPvlSAwGOy461ql+pGyIck3JiDlvwCuBcrxcgbwy0EUN0m6Fltw9xWbUVv3RO8uC6wHx
 vu3EKqIXO+dNis+ili4j7wHndwyuqJoSUYLIAlBidCWTGDCQ7NzFlk9TqBsdMfoD7HIqoWzi2t/
 odT3egbymdcP2khI6HKpLkaF57LpWqXmNzp5uo=
X-Received: by 2002:a05:693c:3009:b0:2a4:3592:cf83 with SMTP id
 5a478bee46e88-2b76483aaf4mr3221663eec.39.1769466487881; 
 Mon, 26 Jan 2026 14:28:07 -0800 (PST)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e7c:8:533d:ee0f:5a8a:2ece])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-2b73a6b6227sm15058201eec.8.2026.01.26.14.28.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jan 2026 14:28:07 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 26 Jan 2026 14:28:01 -0800
Message-ID: <20260126222801.2229197-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong In a previous commit, a bug was introduced
 where compact SSA summaries failed to utilize the entire block space in
 non-4KB
 block size configurations, leading to inefficient space management. 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [daeho43(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [daeho43(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [74.125.82.176 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vkV4E-0005pm-IS
Subject: [f2fs-dev] [PATCH] f2fs: fix incomplete block usage in compact SSA
 summaries
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
Cc: Chris Mason <clm@meta.com>, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:kernel-team@android.com,m:clm@meta.com,m:daehojeong@google.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	DKIM_MIXED(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[daeho43@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20230601];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[meta.com:email]
X-Rspamd-Queue-Id: 1E4B38DEEB
X-Rspamd-Action: no action

From: Daeho Jeong <daehojeong@google.com>

In a previous commit, a bug was introduced where compact SSA summaries
failed to utilize the entire block space in non-4KB block size
configurations, leading to inefficient space management.

This patch fixes the calculation logic to ensure that compact SSA
summaries can fully occupy the block regardless of the block size.

Reported-by: Chris Mason <clm@meta.com>
Fixes: e48e16f3e37f ("f2fs: support non-4KB block size without packed_ssa feature")
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/segment.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 00870a8fe387..6a97fe76712b 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2674,12 +2674,12 @@ int f2fs_npages_for_summary_flush(struct f2fs_sb_info *sbi, bool for_ra)
 			valid_sum_count += f2fs_curseg_valid_blocks(sbi, i);
 	}
 
-	sum_in_page = (sbi->sum_blocksize - 2 * sbi->sum_journal_size -
+	sum_in_page = (sbi->blocksize - 2 * sbi->sum_journal_size -
 			SUM_FOOTER_SIZE) / SUMMARY_SIZE;
 	if (valid_sum_count <= sum_in_page)
 		return 1;
 	else if ((valid_sum_count - sum_in_page) <=
-		(sbi->sum_blocksize - SUM_FOOTER_SIZE) / SUMMARY_SIZE)
+		(sbi->blocksize - SUM_FOOTER_SIZE) / SUMMARY_SIZE)
 		return 2;
 	return 3;
 }
@@ -4324,7 +4324,7 @@ static int read_compacted_summaries(struct f2fs_sb_info *sbi)
 			s = (struct f2fs_summary *)(kaddr + offset);
 			sum_entries(seg_i->sum_blk)[j] = *s;
 			offset += SUMMARY_SIZE;
-			if (offset + SUMMARY_SIZE <= sbi->sum_blocksize -
+			if (offset + SUMMARY_SIZE <= sbi->blocksize -
 						SUM_FOOTER_SIZE)
 				continue;
 
@@ -4497,7 +4497,7 @@ static void write_compacted_summaries(struct f2fs_sb_info *sbi, block_t blkaddr)
 			*summary = sum_entries(seg_i->sum_blk)[j];
 			written_size += SUMMARY_SIZE;
 
-			if (written_size + SUMMARY_SIZE <= PAGE_SIZE -
+			if (written_size + SUMMARY_SIZE <= sbi->blocksize -
 							SUM_FOOTER_SIZE)
 				continue;
 
-- 
2.52.0.457.g6b5491de43-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
