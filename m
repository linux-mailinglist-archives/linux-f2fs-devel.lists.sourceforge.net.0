Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 666F47685FC
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 30 Jul 2023 16:26:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qQ7N6-0005QA-P1;
	Sun, 30 Jul 2023 14:26:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qQ7N4-0005Q3-GE
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 30 Jul 2023 14:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UmGtcZWWe7c6VEm2EQCOJClKAmZ35iUBrjyFcNXbdog=; b=k6dRQaGjxNQ6owvNlRhFgVsDXa
 SlOLrkgvf6DcwE7TTvvdEXHrnqGVBkw472Vy1c11GGe8DclaRX5q9LG9RVGhSNPBa3+1lYosY3IiL
 8w8xcK41YM/bq2TVjBBDK9PTBr0Nv7W4Ft6ojhB8vDyEIca4uTg8KiauPrhFnNJ2n6/c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UmGtcZWWe7c6VEm2EQCOJClKAmZ35iUBrjyFcNXbdog=; b=RSShzmULZzpojHebkVVlVXhPGn
 LZTK6cre3KVKEWBQG6LFzQ9ee96RR82BnrtEibC5ym1zYNogj9+8FZrDVntemJikiQvyhHmVbhoYJ
 5/FtR6TrfbVfe2XDie+hwBy8IqDxJiiw5LFsgkYXYvccSyAO55XkjUi7JI1+jK/ij6sg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qQ7N0-0004Zg-JO for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 30 Jul 2023 14:26:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 01C6660BFC
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 30 Jul 2023 14:26:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2771CC433CB;
 Sun, 30 Jul 2023 14:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690727160;
 bh=bFoKB/RBY0k016vlqdS3IXGsfWxj2zFbV5ucQ5U5Jko=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OvlXf1CA7g/XmjfjJdtJ6c5ETDOLD/8Qj13TesgGPngkufKf1IU5Gm7iTd279MJN1
 AjNS5xyN4szVN3sey0hDrrJQBfGDrOtE4O5Y6VI9u4L725UyHOQGm40Zwstr5quhMa
 XTHggwb/BYyTRd+PzDMsEmNgFE4zQ9iyertfROQPmcPZbLGqXnBmElLKbQGGUsvdk6
 3lgqwOOHXTfwnc1JgxhcqQihPRW9bEVkkujSsO9tHtZp7bmOO0UAINy3BhdgiFkGre
 OltpB1i+2DVBtrJ1Q1Ev/iALlprSlHPZPkY2Xg/YhVrAAcpwZ41eT7f302LH4mhmbp
 V5GBZnn2JMhjw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sun, 30 Jul 2023 22:25:52 +0800
Message-Id: <20230730142552.3918623-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230730142552.3918623-1-chao@kernel.org>
References: <20230730142552.3918623-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Previously, we have two mechanisms to cache & submit small
 discards: a) set max small discard number in
 /sys/fs/f2fs/vdb/max_small_discards, 
 and checkpoint will cache small discard candidates w/ configured maximum
 number. Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qQ7N0-0004Zg-JO
Subject: [f2fs-dev] [PATCH 2/2] Revert "f2fs: do not issue small discard
 commands during checkpoint"
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Previously, we have two mechanisms to cache & submit small discards:

a) set max small discard number in /sys/fs/f2fs/vdb/max_small_discards,
and checkpoint will cache small discard candidates w/ configured maximum
number.

b) call FITRIM ioctl, also, checkpoint in f2fs_trim_fs() will cache small
discard candidates w/ configured discard granularity, but w/o limitation
of number. FSTRIM interface is asynchronized, so it won't submit discard
directly.

Finally, discard thread will submit them in background periodically.

However, after commit 9ac00e7cef10 ("f2fs: do not issue small discard
commands during checkpoint"), the mechanism a) is broken, since no matter
how we configure the sysfs entry /sys/fs/f2fs/vdb/max_small_discards,
checkpoint will not cache small discard candidates any more.

echo 0 > /sys/fs/f2fs/vdb/max_small_discards
xfs_io -f /mnt/f2fs/file -c "pwrite 0 2m" -c "fsync"
xfs_io /mnt/f2fs/file -c "fpunch 0 4k"
sync
cat /proc/fs/f2fs/vdb/discard_plist_info |head -2

echo 100 > /sys/fs/f2fs/vdb/max_small_discards
rm /mnt/f2fs/file
xfs_io -f /mnt/f2fs/file -c "pwrite 0 2m" -c "fsync"
xfs_io /mnt/f2fs/file -c "fpunch 0 4k"
sync
cat /proc/fs/f2fs/vdb/discard_plist_info |head -2

Before the patch:
Discard pend list(Show diacrd_cmd count on each entry, .:not exist):
  0         .       .       .       .       .       .       .       .
Discard pend list(Show diacrd_cmd count on each entry, .:not exist):
  0         3       1       .       .       .       .       .       .

After the patch:
Discard pend list(Show diacrd_cmd count on each entry, .:not exist):
  0         .       .       .       .       .       .       .       .
Discard pend list(Show diacrd_cmd count on each entry, .:not exist):
  0         .       .       .       .       .       .       .       .

This patch reverts commit 9ac00e7cef10 ("f2fs: do not issue small discard
commands during checkpoint") in order to fix this issue.

Fixes: 9ac00e7cef10 ("f2fs: do not issue small discard commands during checkpoint")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 6e5d1039ca76..1f0a25011687 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2195,7 +2195,7 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 			len = next_pos - cur_pos;
 
 			if (f2fs_sb_has_blkzoned(sbi) ||
-					!force || len < cpc->trim_minlen)
+			    (force && len < cpc->trim_minlen))
 				goto skip;
 
 			f2fs_issue_discard(sbi, entry->start_blkaddr + cur_pos,
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
