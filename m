Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 66591D2E5DC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jan 2026 09:58:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oH4AKkK7GfQ9LtPy6iYaJE7+cLHE6mPe8lRQavg+/6s=; b=fQPNHqOUp82VD3cyGIk6fAPgex
	xh/3Z1Mb3+pI4QR2ccdctf3Hm/XhA7NpV8AhxqFmVA7+7soikf/0CqsN87MAs1walC3MNvqE6pDf+
	BnV8gfu3BqJBvjwQt98BIY6zCXZI+m/0WhpF27/In8suzymISUW3Jc8lKRqYQ5pOcHqI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgff2-0001aQ-1T;
	Fri, 16 Jan 2026 08:58:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vgff0-0001aA-9L
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 08:58:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m5mqDEL+es14uhO2HVj/So1KHwX5VXRkuw/RBSrzcj8=; b=ND9xqME24eWaxEKkOaFiw3xE/6
 7qY8VVgMLd7CIsIPXmsjiIkUou03tuBLCLCg45/xEkOHDwBETvEBSPx4uEswUYdGT7tVCx/ad/eQQ
 Q5iQL6BGYi3apkjwSagEYZ1W0y6yts1mDBGf4v4oYM3ZRCpri9PZVnfdgBMV+UZlXpzA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=m5mqDEL+es14uhO2HVj/So1KHwX5VXRkuw/RBSrzcj8=; b=X
 t3JSlEPLhPadYGe+TzSdIlki9QSWsBVVVjDN+saNc1iovL9Gc/n//1gx+Njfkx6Hh5ceo+4XJQahB
 GTeTDIurXX+Sf3/O19+xnNf+55Z9vxxRSVhGOLYtNiJyzTWxtmyf1R9keh4M86LIwYAxIbfCAuIvs
 8VKPpQStHARUXA9k=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgff0-0001ZC-Lw for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 08:58:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 5D4A9409A6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 16 Jan 2026 08:58:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F955C116C6;
 Fri, 16 Jan 2026 08:58:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768553896;
 bh=WTvV40fRxMzH1AP7htSCOKbaMIyOF0igMiKpWQjc6AQ=;
 h=From:To:Cc:Subject:Date:From;
 b=hDn14edjLUc2O5CkHOfWpwX7Hv9YCZzKMJqpxQ7qeNg1XS36aD0NUtVFfBrVKM/vs
 yL3oUtDFysK8Qi5X+6eAMJ9G3H1iAKL9MGfbzsi6XbjwwgJgJ6ADBJBwWq0es6h7nn
 7uOpYPVQWbont4bmGDKD0NwOzUNYpdw0ya9Egpzank3bIzkYEiAmwgmkQN3OIRdk9V
 gbVWsb5bryiXWc1MN7RUtBYI2TJYEuAVZLEG57AwHJ0rOWxYVp0aqy4kiz8eProjX1
 RKelVd/MxTSwcNtFBbkBjCOHSqeYFJ1QNfUMMqyvIpcbjKfW3QFAYXQaoXAz6JLUpf
 1X3wdT8PbC+dw==
To: jaegeuk@kernel.org
Date: Fri, 16 Jan 2026 14:31:15 +0800
Message-Id: <20260116063115.21938-1-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: We missed to unlock folio in error path of
 f2fs_read_data_large_folio(), 
 fix it. With below testcase, it can reproduce the bug. touch /mnt/f2fs/file
 truncate -s $((1024*1024*1024)) /mnt/f2fs/file f2fs_io setflags immutable
 /mnt/f2fs/file sync echo 3 > /proc/sys/vm/drop_caches time dd
 if=/mnt/f2fs/file of=/dev/null bs=1M count= [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vgff0-0001ZC-Lw
Subject: [f2fs-dev] [PATCH v2] f2fs: fix to unlock folio in
 f2fs_read_data_large_folio()
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

We missed to unlock folio in error path of f2fs_read_data_large_folio(),
fix it.

With below testcase, it can reproduce the bug.

touch /mnt/f2fs/file
truncate -s $((1024*1024*1024)) /mnt/f2fs/file
f2fs_io setflags immutable /mnt/f2fs/file
sync
echo 3 > /proc/sys/vm/drop_caches
time dd if=/mnt/f2fs/file of=/dev/null bs=1M count=1024
f2fs_io clearflags immutable /mnt/f2fs/file
echo 1 > /proc/sys/vm/drop_caches
time dd if=/mnt/f2fs/file of=/dev/null bs=1M count=1024
time dd if=/mnt/f2fs/file of=/dev/null bs=1M count=1024

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- rebase to last dev-test branch
 fs/f2fs/data.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index d685c889f7b6..d509172b51df 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2453,11 +2453,11 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 	int ret = 0;
 	bool folio_in_bio;
 
-	if (!IS_IMMUTABLE(inode))
-		return -EOPNOTSUPP;
-
-	if (f2fs_compressed_file(inode))
+	if (!IS_IMMUTABLE(inode) || f2fs_compressed_file(inode)) {
+		if (folio)
+			folio_unlock(folio);
 		return -EOPNOTSUPP;
+	}
 
 	map.m_seg_type = NO_CHECK_TYPE;
 
@@ -2565,18 +2565,16 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 		last_block_in_bio = block_nr;
 	}
 	trace_f2fs_read_folio(folio, DATA);
+err_out:
+	if (!folio_in_bio) {
+		folio_end_read(folio, !ret);
+		if (ret)
+			return ret;
+	}
 	if (rac) {
-		if (!folio_in_bio)
-			folio_end_read(folio, true);
 		folio = readahead_folio(rac);
 		goto next_folio;
 	}
-err_out:
-	/* Nothing was submitted. */
-	if (!bio) {
-		folio_end_read(folio, !ret);
-		return ret;
-	}
 out:
 	f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
 	if (ret) {
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
