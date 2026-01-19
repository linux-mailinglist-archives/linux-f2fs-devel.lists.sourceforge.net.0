Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 139A1D3ACB0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 15:47:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9fUACsM89ZoXkN8UcuoqIA3WO272qIYU+MR07oERZM0=; b=k/qMmuApUdae2x9mzAuw6a/lp/
	IGtaOYL9N3s/7uGL4RND9H2zdSoq5vAXBFILXoC0/ZvSntiBjOLWYdqvI1N0gNWX070NCFDd+/WaU
	ujXVfb5Ix/w5OPEVpRwQ6kuh+lOW7esxGcul8vC18N4y7y6qAHE9HWKbsEEc1Rdbd91I=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhqX2-0003C5-Q9;
	Mon, 19 Jan 2026 14:47:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vhqX1-0003Bz-Hh
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 14:47:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=teNaU+J26crTj/WEsr4FSZ98zxDh1+1gWmmDAmI2KiE=; b=is0SZm48ys1lW2I6xCjC5Egj/M
 IvN3/nWwQfcq4EUll6wMKfDkVggZT/IrFuVhColyifxrER3A7U/v6RifBtMxkMZOYdAooG5YIq/6j
 qehsAZBPoBh+jcICuAlC7Mzb85UPr+Xh2XO9ac40QnyYrGvquc4NMdrXCYfp0CSV2sKY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=teNaU+J26crTj/WEsr4FSZ98zxDh1+1gWmmDAmI2KiE=; b=CYqTSfkF182FAvvmlr7UgrGX5v
 SVJVvXXofcL6Ug9tialX+UKL53ZR4uzDxvb1NaJCV4sWa5niUZNOtvclBbJMBZA/q8ueoGFm6o8fp
 JV9qcaqlGkdssNuSdGgVLE3vwAVNsB+hNkjJ0T+gm5cegcxtMdipA3DpNE6D21jlhhU8=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhqX1-0000Eh-1h for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 14:47:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7B09460135
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Jan 2026 14:46:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC267C2BC87;
 Mon, 19 Jan 2026 14:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768834012;
 bh=cpepyOoJYyqrPZNpjm50qjy8to4U+hnkpMNW8x4AblY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uK5hUso0baL+dnPeqSOGm75+ZcRGbhrcp4pSAAR73EGl6uCAGEn2PKA7UTpjZaMnu
 YdcAEfBGbiaqrEOni6hoFjI+MC+vuFz6Aj21ENTFboUtATS6M1DMVlVbPquFLBwRdX
 W8/BjPbW4LQdkHlej4WCTSr2hsMWd7ti5vxekt7Buq9IjFYzgCz9w3E0KJ7jXex9XP
 RpH21Vn3IOgbLw/fp+SU8whSUg5F5hmFtcwCCRiedHavMTqXfdTTQ91+VPr1Hd+nC0
 iB+xgFNL9vcb6X0d9kcqCDV3ruXuy/n8zPrOqg0kTS36JsGS5fgO4n7nPIq3WIwyeK
 G1hlyMk/QoUnQ==
To: jaegeuk@kernel.org
Date: Mon, 19 Jan 2026 21:32:30 +0800
Message-Id: <20260119133230.16481-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20260119133230.16481-1-chao@kernel.org>
References: <20260119133230.16481-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: In order to simulate skipped write during
 enable_checkpoint().
 Signed-off-by: Chao Yu <chao@kernel.org> ---
 Documentation/ABI/testing/sysfs-fs-f2fs
 | 1 + Documentation/filesystems/f2fs.rst | 1 + fs/f2fs/data.c | 4 ++++
 fs/f2fs/f2fs.h | 1 + fs/f2fs/super.c | 1 + 5 [...] 
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vhqX1-0000Eh-1h
Subject: [f2fs-dev] [PATCH 2/2] f2fs: introduce FAULT_SKIP_WRITE
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

In order to simulate skipped write during enable_checkpoint().

Signed-off-by: Chao Yu <chao@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 1 +
 Documentation/filesystems/f2fs.rst      | 1 +
 fs/f2fs/data.c                          | 4 ++++
 fs/f2fs/f2fs.h                          | 1 +
 fs/f2fs/super.c                         | 1 +
 5 files changed, 8 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 7398b369784c..9a8ec2290f68 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -744,6 +744,7 @@ Description:	Support configuring fault injection type, should be
 		FAULT_ATOMIC_TIMEOUT             0x00400000 (1000ms)
 		FAULT_VMALLOC                    0x00800000
 		FAULT_LOCK_TIMEOUT               0x01000000 (1000ms)
+		FAULT_SKIP_WRITE                 0x02000000
 		===========================      ==========
 
 What:		/sys/fs/f2fs/<disk>/discard_io_aware_gran
diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index fc005f2eaf86..7e4031631286 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -218,6 +218,7 @@ fault_type=%d		 Support configuring fault injection type, should be
 			     FAULT_ATOMIC_TIMEOUT             0x00400000 (1000ms)
 			     FAULT_VMALLOC                    0x00800000
 			     FAULT_LOCK_TIMEOUT               0x01000000 (1000ms)
+			     FAULT_SKIP_WRITE                 0x02000000
 			     ===========================      ==========
 mode=%s			 Control block allocation mode which supports "adaptive"
 			 and "lfs". In "lfs" mode, there should be no random
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 00108d5881aa..830c8090767e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2926,6 +2926,10 @@ int f2fs_do_write_data_page(struct f2fs_io_info *fio)
 		goto got_it;
 	}
 
+	if (is_sbi_flag_set(fio->sbi, SBI_ENABLE_CHECKPOINT) &&
+		time_to_inject(fio->sbi, FAULT_SKIP_WRITE))
+		return -EINVAL;
+
 	/* Deadlock due to between page->lock and f2fs_lock_op */
 	if (fio->need_lock == LOCK_REQ && !f2fs_trylock_op(fio->sbi, &lc))
 		return -EAGAIN;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 52cec6b3ecf0..3a8e1dcdcd69 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -66,6 +66,7 @@ enum {
 	FAULT_ATOMIC_TIMEOUT,
 	FAULT_VMALLOC,
 	FAULT_LOCK_TIMEOUT,
+	FAULT_SKIP_WRITE,
 	FAULT_MAX,
 };
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 0afe9f829058..5d8b2e812340 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -70,6 +70,7 @@ const char *f2fs_fault_name[FAULT_MAX] = {
 	[FAULT_ATOMIC_TIMEOUT]		= "atomic timeout",
 	[FAULT_VMALLOC]			= "vmalloc",
 	[FAULT_LOCK_TIMEOUT]		= "lock timeout",
+	[FAULT_SKIP_WRITE]		= "skip write",
 };
 
 int f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned long rate,
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
