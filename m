Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 564EFC52AA7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Nov 2025 15:20:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:References:Mime-Version:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9fZD0tq92Q/b7XjkVBVH1suzdTT/X9S/ehHWvAsHt1c=; b=UCIWHc9rYQcPl04hqAanSdVhTD
	+iRYlknT3tKYOeTwLBgbN3Qvk0KURB+iQ6JbQXBnxpmcZ7j5H17FB9LApWwDmMosjMAx33zL+m4CK
	lf6eJC2Ehk7OenOgRcRT1p/GeHsjFCrsgzf6/T8rnqf2j6caXfhg/5cYFVFnYixX76/g=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vJBiG-0005Xo-Nf;
	Wed, 12 Nov 2025 14:20:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3J5EUaQsKAOoVaMZZQOTUQZSaaSXQ.OaY@flex--joannechien.bounces.google.com>)
 id 1vJBi9-0005Xb-TE for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Nov 2025 14:20:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CQ6Qy7ndj39B6pMalkS3qilQZ+lIftQt3Cy+FN17e5g=; b=KzHyvnQ2971DPY8rL5ZHbUxJ0f
 OGPQrdWYqDasuEpEi1j2VOYc6p4KL0ssYmJSn4hnZyMzrU1vf6JhV/VYBwXOW230PUx0rIt+1YOuc
 bM0Ua8hdC4FKULjMtKIzKyseHh0oO+dOlCh0BDvmfVy4OpIQDAQGKA1CjJZx2y901X8o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CQ6Qy7ndj39B6pMalkS3qilQZ+lIftQt3Cy+FN17e5g=; b=iRAEWI+kMeDHiHDW3jOeWCkH6J
 te02sBWcyf/jppWPRV1rOeBCceTB9zbYEzrFAvmfRF+Yhx8Qy326QlO3Veq69FSmj1R2fKfmDssVc
 nn4LIhMCUBnlizQHHO1MFMvvHGYDWPY5WngrwuO0snW97C/rLqwfonDQiMKZ/xhsaALA=;
Received: from mail-pf1-f201.google.com ([209.85.210.201])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vJBi9-0001Ws-Io for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Nov 2025 14:20:37 +0000
Received: by mail-pf1-f201.google.com with SMTP id
 d2e1a72fcca58-7b043e2790bso2153050b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 12 Nov 2025 06:20:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1762957227; x=1763562027;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=CQ6Qy7ndj39B6pMalkS3qilQZ+lIftQt3Cy+FN17e5g=;
 b=aNU4jOpHYYNvVYLeNVWkGyBGFmbyIIPjbr7FcopU209JSR6a0Y0OJDlUuoKCYjceZP
 uopd4G8+KexWJx8E7qYcSZJonBhkHvmHHUT5x93Syr/Ym1MrE1HrU+hUr8sx92Pp/6KA
 81ONcpEd9BdrVNr14HV8KVe/rNS53hdIMN7993f+wvd40xZ2yWK4S1wZaA6N1kZs58lp
 K3fK9CIiNb8HTIW4/hxT9uD/e4kT7zgHGvle0TVScLmtFSZOSnuM3SMHy29u+H14pb3X
 C6bQGK0KXZG1Xhzty70sLbX3wh3COFXD1yewaniBe2wGXgnBG6SxTdoFhas5HutdptTn
 asUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762957227; x=1763562027;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CQ6Qy7ndj39B6pMalkS3qilQZ+lIftQt3Cy+FN17e5g=;
 b=h0QPnj6gBOkw3rQvILvbqa4rXnmt1sNFSWT9CwK+No9xEv2Yf9XDhMclon6CLsnP83
 NrgZFN0LsCklx2Ay7pqk1kI0q9b3WBwP16snCXJb58bLzvJ0l+TXap7Iq4KrUgJyynNM
 THAumzg+5wlPHGp+OumMWAgjLTcf9xj9nt3Y/ORI1JHQ1sKWBrSzLyub4lVS0HwQq2o3
 83EVmxRHJ+4BZyAgAjYpMIHEanyHauZzb/dxtiFs+Tl2zHwY0J6ma1ca9hBgoAbX7Mlx
 +FIJYD4uwPa0Z3yPEhmCqXadSDtFigWuJaU5/+hRIYC8t5DuACeEHqDU483KlnkT+uQ9
 UN7Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZivSnQg30XhprSOZw1Px5M4viMjwoCj0dnWjxsLkUC3yA9yymlKBg/yHXIUeaQdS3+3x30I92xiZTSMV/DcEw@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yzke5HPqdcys9b/kaE17BslpUngq4VkvrDDbamG58Q3mIm7Ly6x
 Ze6mUrupTllZiENXLXyUBAOyJKMA1x063WxSwijtgQt+3lrqfclox4JxIAneEI0lctBYd1u0PIo
 peKUeptqV+srqIIOgl2WBHzqhoQ==
X-Google-Smtp-Source: AGHT+IEvwPE8wXHAoTH4+kRCz/nwKtlAXCsMVOxHQHz6fO63yQ7yVeRoMRbdXyB0GF6cp2lHZ9lVEAu4F9AjgFQhJg==
X-Received: from plhn15.prod.google.com ([2002:a17:903:110f:b0:297:d52d:2b6c])
 (user=joannechien job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:dace:b0:293:33b:a9b0 with SMTP id
 d9443c01a7336-2984edcada9mr39893955ad.32.1762955559492; 
 Wed, 12 Nov 2025 05:52:39 -0800 (PST)
Date: Wed, 12 Nov 2025 13:52:23 +0000
In-Reply-To: <20251112135223.3467852-1-joannechien@google.com>
Mime-Version: 1.0
References: <20251112135223.3467852-1-joannechien@google.com>
X-Mailer: git-send-email 2.51.2.1041.gc1ab5b90ca-goog
Message-ID: <20251112135223.3467852-3-joannechien@google.com>
To: Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently, f2fs/019 and f2fs/020 only clears MKFS_OPTIONS.
 This causes the tests to fail when leftover MOUNT_OPTIONS depend on unapplied
 MKFS_OPTIONS. So MOUNT_OPTIONS should also be cleared to ensure [...] 
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
X-Headers-End: 1vJBi9-0001Ws-Io
Subject: [f2fs-dev] [PATCH v1 3/3] f2fs/{019,
 020}: clear MOUNT_OPTIONS alongside MKFS_OPTIONS
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

Currently, f2fs/019 and f2fs/020 only clears MKFS_OPTIONS. This causes
the tests to fail when leftover MOUNT_OPTIONS depend on unapplied
MKFS_OPTIONS. So MOUNT_OPTIONS should also be cleared to ensure reliable
mounting.

Signed-off-by: Joanne Chang <joannechien@google.com>
---
 tests/f2fs/019 | 1 +
 tests/f2fs/020 | 1 +
 2 files changed, 2 insertions(+)

diff --git a/tests/f2fs/019 b/tests/f2fs/019
index a6e6e38c..721f2180 100755
--- a/tests/f2fs/019
+++ b/tests/f2fs/019
@@ -22,6 +22,7 @@ _require_inject_f2fs_command node addr
 
 # remove all mkfs options to avoid layout change of on-disk inode
 export MKFS_OPTIONS=""
+export MOUNT_OPTIONS=""
 
 testfile=$SCRATCH_MNT/testfile
 
diff --git a/tests/f2fs/020 b/tests/f2fs/020
index a6933134..eecd312d 100755
--- a/tests/f2fs/020
+++ b/tests/f2fs/020
@@ -25,6 +25,7 @@ _require_attrs user
 
 # remove all mkfs options to avoid layout change of on-disk inode
 export MKFS_OPTIONS=""
+export MOUNT_OPTIONS=""
 
 testdir=$SCRATCH_MNT/testdir
 
-- 
2.51.2.1041.gc1ab5b90ca-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
