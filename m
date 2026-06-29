Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id wIPTEpJYQmqf5AkAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jun 2026 13:35:46 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A4B86D97FA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jun 2026 13:35:45 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=kgq0EoLx;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=QbQz82Cc;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="T vP3UqD";
	dkim=fail ("body hash did not verify") header.d=gmail.com header.s=20251104 header.b=T4hvTTMG;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=fail reason="SPF not aligned (relaxed), DKIM not aligned (relaxed)" header.from=gmail.com (policy=none)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Qr39UvOzgicL6TEOW8cTnW8nXrNLzGZB78dG5+ptWYk=; b=kgq0EoLxPxNBqQ7LzlpYDSm+3F
	sKQAjM7KgRHjN+DdByjFqvOHW6/BawbJiRY4Z70+nnwPPlnE7ag5wsuoM4BHQh+IObDdEvjDxRpzZ
	1S1JZ5Sh5QCCQfzaBCf4InHGrM2w5CJd60ca8mDgIsnvTC3KNQgD2UH7dFHCC3Cd40MM=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1weAH1-0001m2-Jw;
	Mon, 29 Jun 2026 11:35:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1weAH0-0001lw-96
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jun 2026 11:35:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dUfXUhJKFOXNw8CUsqhWMHTHM7liMd5Eu8ugQl8pICc=; b=QbQz82Cc/IeS5B8CfUUpLzzOzL
 2BzdHJFqjf7rXL3raBOCsl33DsBmsB62zyct6w8jS7RuXU9NgGCm6vkxeOWNbQ2rW+MiyGnyUShn8
 ox3rIjbyJvlNSDC7FVeiimStIlaAd73jM35w/pkCuGGlijh1S799txv7SdysXwZns9B8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=dUfXUhJKFOXNw8CUsqhWMHTHM7liMd5Eu8ugQl8pICc=; b=T
 vP3UqDFSn7H7gaz/j20CVEvys41nIem7Sit9tTXaz+tV0ZRs5E9EetDOqzoCoXlNiBrla7AvQgy9o
 vaD1T/0OIhhMfKGKzPtodNtGL/Q8bzBLdKemhogR5jZXhBgBq3qP6wkzgQC3FNygMBfQrnqk+vOUb
 ThMzGeaoTKRhaBUw=;
Received: from mail-pl1-f171.google.com ([209.85.214.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1weAGy-000831-SW for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Jun 2026 11:35:34 +0000
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2c7cfa17fedso26994265ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Jun 2026 04:35:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1782732923; x=1783337723; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dUfXUhJKFOXNw8CUsqhWMHTHM7liMd5Eu8ugQl8pICc=;
 b=T4hvTTMGBuB+Kr37gtx3TOWvPTtmsTMUDGBXECy4HwPuaj3wZ4+oD6f3WEYozYepLR
 fcwNBsP8pZ9BAmvkNR6ZF00rrBleR3eOUx9C7FXYOyQuqRX83G/mt9ZgEglN9zSAfeHz
 Ks/y6KT86NOUFvEkgqMiehVVnCemDFrApBCiYArAT8tSWzuwJYfxMO1Q1YcImVkPe4uP
 S04wbAE3NFES2bRupmAzdnZwEdM74QIHyeavAcDmAADVJAlfW6gfmALHB1LhWg0kM7fU
 o87xDzGavuh4cydB3VVYj8DH7frnLBsWRKKgRhLl9qb1fb1JyRaP3GNcChhMuUdqYl8f
 FhnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782732923; x=1783337723;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dUfXUhJKFOXNw8CUsqhWMHTHM7liMd5Eu8ugQl8pICc=;
 b=JXmskzQqHc/da/BWzCjLF5/ZsJQlaCA986UGzcCz7rcyRWEh/5GWkR1YUvf6XBISHr
 56ivRMJ2Z+Lb7tiW09+hU2nEKfceRNe7f5w+xwYGVuu3ohYhTJUybJ5+cHh6PERy9ANT
 etW3guZy1bW7eIpokMivYpE7eMpDjDC8RrRXSbE5VY1LMecyWHgqv666hWn5ppRZU/5p
 d50CIqjYvOXw1RUGnQWjm6rTSZJ02F877aJAhP9ORRDgZPwA6qhG/vftbYP+LYN47z2K
 H1nOA8qWdiK97SYKq36fcn+2QCSQ7VlyhNi/hoVkTL2I1pgI8AJJYYgcI5zYF/9AsVHF
 w6wA==
X-Gm-Message-State: AOJu0YwsguxvcNiG3K+qhBtDA3fJEOT8OI5Dq1tmtvog8RfxUm48RgsF
 KadIk8t2qNZibvxihlouERBvJVnzWnYsyoOv/yVhveSNYURbB2sG6Lyl
X-Gm-Gg: AfdE7cl4uRQ3qDhzU99fFNZvLbaTYUudKNAw9JIccZsK/zlSdkJYvEAJZ4AnfesqpBI
 r40QjeXaaqzoWi1IDEm8FWquz5+9FOVSlx1RD+1PD01FLTZssTqW57A0myKjStJ59EFVUdHNpYo
 CHahaTLOpUbmNYBIlOucewlE6BOqAYHyPYIqV3tHVrPAdNyXJcxWIPPTUGXrC0s0E+FzyKqs0+N
 2W+Mxnzh3pFzTgODoqGlhy4z06HJ9jN9E8CSHSo3KjyD563b6ivzrWg+bKGqWT+ccjAO8FNTrb1
 c8tYmKa+c4iWlvruVpstgFW6T/hsjlweoiJzFKORBFwbW/c2IJz7dfg4bER7FfLHChvVL7IHPbJ
 Xqw0SlOMMPZ77Cz/2MurXz488WwhWlIvUIQ+fQWqiG+t5AgnsikMYv+rKM1IPY6ggTGg15unIcZ
 CLos5DWCJK3eeecCVtiy4GyFh7Dr5/5AakyT0LnSwdMp6FVLFb
X-Received: by 2002:a17:903:2408:b0:2c9:c517:d069 with SMTP id
 d9443c01a7336-2c9c517d497mr57773875ad.17.1782732922523; 
 Mon, 29 Jun 2026 04:35:22 -0700 (PDT)
Received: from qiwenjie-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2c9d4823066sm33937035ad.77.2026.06.29.04.35.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2026 04:35:22 -0700 (PDT)
From: Wenjie Qi <qwjhust@gmail.com>
X-Google-Original-From: Wenjie Qi <qiwenjie@xiaomi.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 29 Jun 2026 19:35:15 +0800
Message-ID: <20260629113516.2123545-1-qiwenjie@xiaomi.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  For a full-block buffered overwrite, PRE_AIO does not reserve
 a block if the target range is already mapped. It still walks the dnode path
 under the node_change read lock. Skip PRE_AIO when the write is within i_size
 and the read extent cache covers the whole range with valid data blocks. 
 Content analysis details:   (-0.2 points, 5.0 required)
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
 [qwjhust(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.171 listed in wl.mailspike.net]
X-Headers-End: 1weAGy-000831-SW
Subject: [f2fs-dev] [PATCH] f2fs: skip preallocation for mapped buffered
 overwrites
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
Cc: qwjhust@gmail.com, qiwenjie@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-1.01 / 15.00];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	ARC_NA(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:qwjhust@gmail.com,m:qiwenjie@xiaomi.com,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,gmail.com:s=20251104];
	FREEMAIL_CC(0.00)[gmail.com,xiaomi.com,vger.kernel.org,lists.sourceforge.net];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[qwjhust@gmail.com,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,gmail.com:-];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	ALIAS_RESOLVED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[xiaomi.com:mid,xiaomi.com:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7A4B86D97FA

For a full-block buffered overwrite, PRE_AIO does not reserve a block if
the target range is already mapped.  It still walks the dnode path under
the node_change read lock.

Skip PRE_AIO when the write is within i_size and the read extent cache
covers the whole range with valid data blocks.

Assisted-by: Codex:gpt-5.5
Signed-off-by: Wenjie Qi <qiwenjie@xiaomi.com>
---
QEMU test on a 1GiB F2FS scratch image:
- mapped 4K overwrite: PRE_AIO traces 20000 -> 0, about
  10.2 -> 2.0 us/write.
- sparse in-i_size hole write miss case: PRE_AIO traces stayed
  8192 -> 8192, median 7.71 -> 7.95 us/write.

 fs/f2fs/file.c | 29 +++++++++++++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 4b52c56d71f0..cb03df086ff3 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -5007,6 +5007,32 @@ static ssize_t f2fs_write_checks(struct kiocb *iocb, struct iov_iter *from)
 	return count;
 }
 
+static bool f2fs_prealloc_mapped_overwrite(struct inode *inode,
+					   loff_t pos, size_t count,
+					   const struct f2fs_map_blocks *map)
+{
+	struct extent_info ei = {};
+	loff_t size = i_size_read(inode);
+	pgoff_t start = map->m_lblk;
+	pgoff_t end = start + map->m_len;
+	pgoff_t ei_end;
+
+	if (pos >= size || count > size - pos)
+		return false;
+	if (f2fs_has_inline_data(inode) || f2fs_compressed_file(inode) ||
+	    f2fs_is_atomic_file(inode) || IS_DEVICE_ALIASING(inode))
+		return false;
+	if (end < start)
+		return false;
+	if (!f2fs_lookup_read_extent_cache(inode, start, &ei))
+		return false;
+	if (!__is_valid_data_blkaddr(ei.blk))
+		return false;
+
+	ei_end = (pgoff_t)ei.fofs + ei.len;
+	return start >= ei.fofs && end <= ei_end;
+}
+
 /*
  * Preallocate blocks for a write request, if it is possible and helpful to do
  * so.  Returns a positive number if blocks may have been preallocated, 0 if no
@@ -5061,6 +5087,9 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
 	else
 		return 0;
 
+	if (!dio && f2fs_prealloc_mapped_overwrite(inode, pos, count, &map))
+		return 0;
+
 	if (!IS_DEVICE_ALIASING(inode))
 		map.m_may_create = true;
 	if (dio) {


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
