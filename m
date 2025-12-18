Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D6476CCA9CA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Dec 2025 08:17:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Mime-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ruvIvQzYjBpVzTOmBga0AdWb/k5oBSnJqLysv0MAFBg=; b=ktYD8aBQWgCp+njWZO9OTv9Upi
	rC52o5ZW7tnMEPbiGfSyuqv7cS2sM1B7tbSUI1Hr/BUquiOzBp2jNqf1t1PLnCku/jJfeFONC2Fhj
	60Y5TZwbvzfDqVSXzXfdc3hw16DWygcwld5r6fc9Q1K7y6MEAHuQP3pNbSpNt0WP11Pw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vW8GX-0005sJ-4k;
	Thu, 18 Dec 2025 07:17:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3iapDaQsKAD4otfssjhmnjslttlqj.htr@flex--joannechien.bounces.google.com>)
 id 1vW8GV-0005sD-QS for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Dec 2025 07:17:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xKVoCbsNxKQYZtB4BuZGzRvyC3k2P4dMNqUBymSgTnA=; b=d79tFpZc27dIAM32ShPYCMeiuB
 ZCaNT7neFShxkhCEeHrzEY3dMronpsTLLufAbWsoczZfJWGH/dWWSblM0BCel+Eu6vPIqPUbDujo6
 YmrADvXZUlTsBi5Gu+Rmm1CmYK+z7BW5mVTTtByViHDGLNBh/zfRGwP4gQ84ajtUvKjU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xKVoCbsNxKQYZtB4BuZGzRvyC3k2P4dMNqUBymSgTnA=; b=n
 Je7iLletcdpUH9AOUTVNMN2SOqz9aShfw2Z1BwJm/IiQWwZtkV1SaJcFQhm+arpVul2XujZ4w2I6D
 OIMyhnRu499iGXvLC8U2ezrw7YHSTfMUPRUZAhEtwctJmkf1X0iVh9DOHyH/13ba3Kpk3FayO72I/
 pGzQCPOMWzkzVePk=;
Received: from mail-pf1-f201.google.com ([209.85.210.201])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vW8GV-0004Gy-G5 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 18 Dec 2025 07:17:35 +0000
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-7c7957d978aso510670b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 Dec 2025 23:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1766042250; x=1766647050;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=xKVoCbsNxKQYZtB4BuZGzRvyC3k2P4dMNqUBymSgTnA=;
 b=abpWuhOSKhS4/sfzGYd6NnoB4/JR63yCSp4e1xqlDi1v/nm5nHKApHQo5SvDEb+rXR
 0xRFJPbFQZu4nvSe3N8Xq6tlvPizoFEji5N7gtzrcF/FaTm+UGq+ZeXIY1qo0FEcaDI9
 DlsztiTxVhYH0PX9X0Ukuz2gESWq1Ul4U5R9HrOp9qZJQsvUZkXAIY7i9BdKeRswW+Dg
 D8Fo2bE4eBDQQg38T+FVCZX+HHRGChiDX27zvJCvZKCvssOjMSLQzlXmEBGvNEOYzXI7
 3fHQJ+jrbSTKEHf7AT1KRD/OsNdxpQoKb8lL6Yu+f2HZl5abKvnet5yaV8kE+AdPBHbN
 kirQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766042250; x=1766647050;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xKVoCbsNxKQYZtB4BuZGzRvyC3k2P4dMNqUBymSgTnA=;
 b=lsV18E9qInd+IlUkyQfY6ewXYlpiNYs7HI6M7eCIPIXflZXQ6qyGvCb3W+msA1+DEz
 4QJRXq4Y1rZuPuhht8WvkAPnVT0klYg4MCoX8nAA7/bGy2hTVNxBjdM90uAfwYsX8MLD
 f5yBqEWN0ptVA8mWQ6VJABb5iw9SWIXFhDMnMaSYKjd7Xq6Fw1vRj+bp5JVhPFMjfnbm
 jLKweAwLIHNoII/iLusCt2DWxlxcvyw/J6FGSjixzuLBUPfZXarJcmI1yG6UE54lKLNT
 nS1OzJsbQMHfpRE3VBaXJQgPs9Va1fA2IaLm+OnoBGbgjvmO1f7qO/MAeOWCkoO7x89+
 S2xA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYxfjni5piOnkAF8tJrzFjuEWOx8lUoJV7JMVhDjM4+oSfFt7PAKmMl7nb/mrSIO0qy4pE7HwYYkC6/JgUDo4K@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwugHudpat5ngOQQvNOz1ayVuiIqFtgQlBFxGbpCnqcchuxly0Q
 cffkClUZBxeHRyKu5mjpJ3ab1pAgmE71mBi+PYGtnTCQj9ZueqKXKEd0H3o6qQJSNUmMM5x2320
 YSHaXteHUC11ZEnj9wh0P82uxng==
X-Google-Smtp-Source: AGHT+IHbkacaOyXp/ZNrkhluvqAvKQwLxhC1/JTp6/ItJ4DdUJpNGQI6HchisZWanelvxUT7Znb9Ux4QW+y8hhCOrw==
X-Received: from pgbbx39.prod.google.com ([2002:a05:6a02:527:b0:b6c:f35f:bae9])
 (user=joannechien job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7486:b0:33b:5a3f:3cbe with SMTP id
 adf61e73a8af0-369afa08091mr18617994637.54.1766042249795; 
 Wed, 17 Dec 2025 23:17:29 -0800 (PST)
Date: Thu, 18 Dec 2025 07:17:17 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.313.g674ac2bdf7-goog
Message-ID: <20251218071717.2573035-1-joannechien@google.com>
To: Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: generic/735 attempts to create a file with nearly 2^32
 blocks.
 However, the maximum block count per file in F2FS is limited by the capacity
 of the inode. This limit is roughly 2^30 blocks, which is si [...] 
 Content analysis details:   (-7.6 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -7.5 USER_IN_DEF_DKIM_WL From: address is in the default DKIM welcome-list
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.201 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vW8GV-0004Gy-G5
Subject: [f2fs-dev] [PATCH v1] generic/735: disable for f2fs
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
From: Joanne Chang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Joanne Chang <joannechien@google.com>
Cc: Joanne Chang <joannechien@google.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

generic/735 attempts to create a file with nearly 2^32 blocks. However,
the maximum block count per file in F2FS is limited by the capacity of
the inode. This limit is roughly 2^30 blocks, which is significantly
lower than the test's requirement.

Signed-off-by: Joanne Chang <joannechien@google.com>
---
 tests/generic/735 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/generic/735 b/tests/generic/735
index 9bbdf3a1..d5ba5673 100755
--- a/tests/generic/735
+++ b/tests/generic/735
@@ -19,6 +19,9 @@ if [[ "$FSTYP" =~ ext[0-9]+ ]]; then
 	_fixed_by_kernel_commit 2dcf5fde6dff "ext4: prevent the normalized size from exceeding EXT_MAX_BLOCKS"
 fi
 
+# Block number 0xffffffff is too big for a file in f2fs.
+_exclude_fs f2fs
+
 _require_odirect
 _require_xfs_io_command "falloc"
 _require_xfs_io_command "finsert"
-- 
2.52.0.313.g674ac2bdf7-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
