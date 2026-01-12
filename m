Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED1ED1042B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jan 2026 02:31:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ksa9DSIS2I5nUZJN+XpbJEt5RTze+lBfaRALHYx8/Fs=; b=HORdZSfL9IrmuEVSfAeBTo0jUk
	SQ2j8rybeAQWDrjdjW1p99WHxz7S47Hgi4tRo/sajFL8/oMT0um9TK2KN2lSxFwkBXM5gEbZB2+7d
	pjgmw8/6Xd17Za7iQl22lxOIsHOsMvVop9WPJwG7IWAHxLffztgIIXu9f44ITNatH+j8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vf6ly-0006aq-Gh;
	Mon, 12 Jan 2026 01:31:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vf6lw-0006aj-TQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 01:31:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=J8YD+mhgx8Q/OEdEYj5CeNbIlgUI7TUUkdP7EdA1FRg=; b=PBZtntlR41gHLGDSKbR+iImEEm
 lH+4O8EkZbhszuOwtolBMv/WwBNYArBGXAw7Fq71u7pCBOFd2ePkYu1xv0gKpGJIS9etBuzINVix9
 yv5JcuDO76Kheflz9uarLtcRrYL+E2lI0wgKjgHoNfvDUn5WBLwIscfd/p/SQNhv2I5Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=J8YD+mhgx8Q/OEdEYj5CeNbIlgUI7TUUkdP7EdA1FRg=; b=P
 OxLKjT7z9arUOQs7WwkJ5hFHciDThrVIjLI2JGBabDHIXrRrgq4whQJ37tS5DEbPQqGIpSQ7Y5gFr
 97SlWSuIJEbsRrNv2IS2BV0O/pv8kkQsiejNtRvsGXX+j19AyIJGydJzzqjBTQXLqXguPJi6oBLhR
 SsuDGDU9hyhPVE6o=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vf6lx-0000td-5U for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Jan 2026 01:31:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7D2A260159
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Jan 2026 01:30:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7D5DC4CEF7;
 Mon, 12 Jan 2026 01:30:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768181457;
 bh=zb6R+J9kkW67RrSB5zaxDMsHKu/A1fi9UpiW2r/jkL0=;
 h=From:To:Cc:Subject:Date:From;
 b=KnXVJaqeBj6/lKmz8vDUkzLzhMLuTLlQRKU7DOQdGOFGcY8sUDiwWjlqpmyrrvnbI
 RPx9HMm1hzTHZmUhnc3yM97p9c+EPhx/2h5Mmuuqq3in2YSYOnXgUUt+/yZQ8CyhrC
 KhiuSAqtItTsX+G0IrshuJ1VHHBF0PBliDhbWKNpn7x+X6ah5JfnZboK06rtXHnB1R
 AOmyGVrf+TnElXj2nG0fhNHlvQSxhoTP/ApO+Le/4/5HokqGHXtnK5LtjUY0fPbYuu
 eZ05WaCKYJbxi+h6shr8fb3M+7YyW0XQ1eb9JhUPpKd521B6VznEGyw3wAFGHSzSHJ
 Q2YSbRnghyRcg==
To: jaegeuk@kernel.org
Date: Mon, 12 Jan 2026 09:30:52 +0800
Message-Id: <20260112013052.7623-1-chao@kernel.org>
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
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vf6lx-0000td-5U
Subject: [f2fs-dev] [PATCH] f2fs: fix to unlock folio in
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
Changelog:
- this patch is based on Nanzhe Zhao's patchset
 fs/f2fs/data.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index eeeb70bff101..a2c4769d0ae1 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2462,11 +2462,11 @@ static int f2fs_read_data_large_folio(struct inode *inode,
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
 
@@ -2569,22 +2569,18 @@ static int f2fs_read_data_large_folio(struct inode *inode,
 		last_block_in_bio = block_nr;
 	}
 	trace_f2fs_read_folio(folio, DATA);
-	if (rac) {
-		if (!folio_in_bio) {
-			if (!ret)
-				folio_mark_uptodate(folio);
-			folio_unlock(folio);
-		}
-		folio = readahead_folio(rac);
-		goto next_folio;
-	}
+
 err_out:
-	/* Nothing was submitted. */
-	if (!bio) {
+	if (!folio_in_bio) {
 		if (!ret)
 			folio_mark_uptodate(folio);
 		folio_unlock(folio);
-		return ret;
+		if (ret)
+			return ret;
+	}
+	if (rac) {
+		folio = readahead_folio(rac);
+		goto next_folio;
 	}
 out:
 	f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
