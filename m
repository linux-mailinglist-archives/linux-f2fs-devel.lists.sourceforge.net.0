Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58976AC8B74
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 May 2025 11:51:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Mime-Version:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lIGNcli5wJ8WAQjB20BlTSk/PwNAsikxj/FA0RRfXhE=; b=XQJMHYXqyT2zoUSC9UApOOPA8b
	b6teXJYWLEQ4r8u5wiYVgSKiKzCO9gCIj4ivflMPPi2ccjiLFZMGN/wFOD6uoQLjq9HkVd9lEFnCY
	4gm1oPfcZF0Xb7COzN/zLPNFIULISyQVI1SjCoar2ZNz/FW0KKjhBxSw6/bTEJL2yJ/c=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uKwO7-0007e0-0U;
	Fri, 30 May 2025 09:50:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3MHk5aAwKAFE28ADBt37FB31z77z4x.v75@flex--jprusakowski.bounces.google.com>)
 id 1uKwO5-0007ds-SV for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 May 2025 09:50:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 Mime-Version:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kNsoQrbO6r0+t/N3UUDEwd5dEvoE0yv1vSMzQKLNhHg=; b=FbQBM3eP/NQenj9Crx/auwufdI
 wQpeAiCHNVEz7ObRmU8JJYLRBmHS4jQKdBle9zNt8ietoc9He0y253Gqw89ZySqLgRmTxkIZqyAmO
 kpgolR9upp48XzofSTsJq8gUOavi8wpe0o7eqPSvxYLXJLiEnGpNxkkgy5nYDhg5IKyo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:Mime-Version:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kNsoQrbO6r0+t/N3UUDEwd5dEvoE0yv1vSMzQKLNhHg=; b=K
 LPho751AjNyPnoxVLlf9ZG5hz9uiYqAPUNHOtuM2dbYsCzF2tEZDBYXOZxD3Ni6f04XVfy33RAlmP
 8hHY0P9NEX8R0EAxJg1N6kvyxUXFl2q/d6JONYEm5T+fzwp/Tw/Ze10ACiEtXFExamYf1Xu4EiOYj
 Bg1cFWG0WGMbuIyU=;
Received: from mail-ej1-f73.google.com ([209.85.218.73])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uKwO5-0006fW-4Z for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 30 May 2025 09:50:53 +0000
Received: by mail-ej1-f73.google.com with SMTP id
 a640c23a62f3a-acb61452b27so146068766b.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 30 May 2025 02:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1748598641; x=1749203441;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=kNsoQrbO6r0+t/N3UUDEwd5dEvoE0yv1vSMzQKLNhHg=;
 b=sf0vc34czaeIQb235m24PbjTc7Xsq54ghhtQIND61jnjKWrQ9QuBAv9hhIzfQJn4TH
 sEeiJvOpgVXqYPVnRTXxRugGqSeFWiN8nzVIy9HeYbH72TJnpT5IiZdpfJlj1UhEB0nZ
 q/Mc80BvpSBE2s1hEqBe1yaT7II4lSypNaBCFAB9km0pTWLy05Gr8fTZK9tOv62THlgs
 JaJdrwUj9YMoh39z+f2u5b5unp5Izz7sONYS+wf4mSQus0mxmoMKwXw5jDpt7R7+FUE5
 0dTjUpYnX5AMebp7UzIC5/Y7FcdhthscXKZ/NsxAwMVlvE1rf3nq3hUTuh8I86RVRNvu
 Eugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748598641; x=1749203441;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kNsoQrbO6r0+t/N3UUDEwd5dEvoE0yv1vSMzQKLNhHg=;
 b=X72jQOQ+E/Vi7rbU96vxRQcLU7HazZe7QKz1RpMKT5xN9F0wBzRSdUywYK9tR1aQG/
 8qI8tKFzQNXrrfevaHDBurEEZNQUBRNUc5+Kery/gula3TQEtLPTP8KVjwmCdqsRSfYD
 Wdq8YyKU+gNp2YF8qgux+amnE+Cfdbf3ZpiL03IP5jbm24HmZoKWPLInPnnT9hZNQKVV
 lofU6zydYWLDIJoyXrNJnqWiNmt59A05ekPSo94MjgbygSvPsGQ9aTECvVqI01YwfCYB
 u9gYKZ+dlLhHaniJ8VYGq0PnQ8k/ndRig3VtbieYIsIr6s9mvWSfY5+TQnuceYYYU+/K
 KO1g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWYIuOtJ8wHAa4AQh2jSBNeviuY4m5v+ZlX/qkjCWMCz/9fouUwNcoR29h7ydOQQvOhdymhCpL6s39+UBV1pjI7@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yzpo0K3qTL+z5yKh6t28L33941YqzBA3inQba4IQcQg8ublwGmw
 x/NTCBidZTPzN6uxDcjbV5o0fPKPUxk+UC10NxDPxNkX66KsrDQ4uj0LfVYfKrvTnxfVhzv7PrW
 PhBkXUWUmfQOlJMfCIh9kOqdFz4KiqQ==
X-Google-Smtp-Source: AGHT+IE72Av919IDDm4wEfbEzX4XfOKhpgZ1L0ybT1n1bbC7V6vlgXaojKI4rlGgqekrC/BSpb6havKaBqZVlhykYEQ=
X-Received: from edbdg5.prod.google.com ([2002:a05:6402:1d05:b0:5dc:2205:e2ad])
 (user=jprusakowski job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:26c6:b0:5fb:c126:12c9 with SMTP id
 4fb4d7f45d1cf-6056e2586fbmr2079020a12.25.1748597040124; 
 Fri, 30 May 2025 02:24:00 -0700 (PDT)
Date: Fri, 30 May 2025 09:23:49 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250530092349.3407742-1-jprusakowski@google.com>
To: Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org
X-Spam-Score: -8.2 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: In current implementation the atomic write may not start
 before
 the direct write and the test fails. The patch adds a delay after starting
 the atomic write process so it has a chance to actually start wrtiting data
 and set the internal state of the file correctly. 
 Content analysis details:   (-8.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.218.73 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.218.73 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.218.73 listed in sa-accredit.habeas.com]
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.218.73 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.5 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1uKwO5-0006fW-4Z
Subject: [f2fs-dev] [PATCH v1] f2fs/004: avoid race condition in test
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
From: Jan Prusakowski via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jan Prusakowski <jprusakowski@google.com>
Cc: jaegeuk@kernel.org, Jan Prusakowski <jprusakowski@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In current implementation the atomic write may not start before
the direct write and the test fails.

The patch adds a delay after starting the atomic write process
so it has a chance to actually start wrtiting data and set the
internal state of the file correctly.

Signed-off-by: Jan Prusakowski <jprusakowski@google.com>
---
 tests/f2fs/004 | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/f2fs/004 b/tests/f2fs/004
index e08cee11..ac824c43 100755
--- a/tests/f2fs/004
+++ b/tests/f2fs/004
@@ -40,6 +40,9 @@ touch $dbfile
 $F2FS_IO_PROG write 1 0 32 zero atomic_commit $dbfile 3000 >> $seqres.full &
 atomic_write_pid=$!
 
+# wait a bit to allow the atomic write to start
+sleep 2
+
 # simulate concurrent direct read/write IO
 $XFS_IO_PROG -d -c "pread 0 128k" $dbfile
 $XFS_IO_PROG -d -c "pwrite 0 128k" $dbfile
-- 
2.49.0.1204.g71687c7c1d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
