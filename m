Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79AA836C0B8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Apr 2021 10:21:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lbIyE-00068t-0o; Tue, 27 Apr 2021 08:21:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <frank.li@vivo.com>) id 1lbIyB-00068k-QH
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Apr 2021 08:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RGtY9vq8DFGl4Mlbgx5MfxB0PKeGEWLcJuxIVtKM8xY=; b=Z7GvnrHzBpjCXvE5JVTc0ezbLH
 GOyZjPtCtP5Bz6109b773/geT28kHvfQpU1LQuB53LySCyhCD49wofUI//hY2enlGlmA9wcXrrSXd
 lC35JSr+My5kIDx+2bUN2WDDfAjDPFLdApm0E+tDvzPMxNb7bWWMhLyvqZ/ASB9QrOQw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=RGtY9vq8DFGl4Mlbgx5MfxB0PKeGEWLcJuxIVtKM8xY=; b=Y
 qfqOwQ2aBSqhZLaZlLgE38ATueAYNVquPWv3IxJwIHj9bI79j0OtJcymywdnw6hzuhp6Un9yWTEJy
 dwE4FxSu/UL7qBtJoS19WhAa7jBI1Js8wiP767R1WQBY6k7MWausL1tuq+i/X+RTENgFsDwNfrs/U
 9EiLGsvRnww1xZRw=;
Received: from mail-m176233.qiye.163.com ([59.111.176.233])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lbIy7-0001ex-Ha
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Apr 2021 08:21:23 +0000
Received: from ubuntu.localdomain (unknown [58.251.74.232])
 by mail-m176233.qiye.163.com (Hmail) with ESMTPA id 621A18C00D8;
 Tue, 27 Apr 2021 16:21:12 +0800 (CST)
From: Yangtao Li <frank.li@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 27 Apr 2021 16:21:06 +0800
Message-Id: <20210427082106.2755-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZQ0wYTVYfQkpPH0xIGUsfSU5VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6M0k6NDo4Lj8KQ1YXPBdDHzhW
 HEkwCkpVSlVKTUpCTkpKTUxJQkJIVTMWGhIXVR0JGhUQVRcSOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlISVlXWQgBWUFPSElONwY+
X-HM-Tid: 0a79126aff1dd9abkuws621a18c00d8
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1lbIy7-0001ex-Ha
Subject: [f2fs-dev] [PATCH] f2fs: reset free segment to prefree status when
 do_checkpoint() fail
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
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When do_checkpoint() fails, the prefree bitmap is not cleared,
but these segments are already in the free state. If these segments
are used, the segments in use will be reset to the free state when
f2fs_clear_prefree_segments is called next time.

So reset free segments to prefree status when do_checkpoint() fail
to avoid this situation.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/checkpoint.c |  6 ++++--
 fs/f2fs/f2fs.h       |  1 +
 fs/f2fs/segment.c    | 13 +++++++++++++
 fs/f2fs/segment.h    |  7 ++++++-
 4 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index be5415a0dbbc..0200af4d02ef 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -1647,10 +1647,12 @@ int f2fs_write_checkpoint(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	f2fs_save_inmem_curseg(sbi);
 
 	err = do_checkpoint(sbi, cpc);
-	if (err)
+	if (err) {
 		f2fs_release_discard_addrs(sbi);
-	else
+		f2fs_set_free_as_prefree_segments(sbi);
+	} else {
 		f2fs_clear_prefree_segments(sbi, cpc);
+	}
 
 	f2fs_restore_inmem_curseg(sbi);
 stop:
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e2d302ae3a46..1618e9a74e89 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3369,6 +3369,7 @@ bool f2fs_is_checkpointed_data(struct f2fs_sb_info *sbi, block_t blkaddr);
 void f2fs_drop_discard_cmd(struct f2fs_sb_info *sbi);
 void f2fs_stop_discard_thread(struct f2fs_sb_info *sbi);
 bool f2fs_issue_discard_timeout(struct f2fs_sb_info *sbi);
+void f2fs_set_free_as_prefree_segments(struct f2fs_sb_info *sbi);
 void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 					struct cp_control *cpc);
 void f2fs_dirty_to_prefree(struct f2fs_sb_info *sbi);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index c2866561263e..334e499a0f43 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1959,6 +1959,19 @@ static void set_prefree_as_free_segments(struct f2fs_sb_info *sbi)
 	mutex_unlock(&dirty_i->seglist_lock);
 }
 
+void f2fs_set_free_as_prefree_segments(struct f2fs_sb_info *sbi)
+{
+	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
+	unsigned int segno;
+
+	mutex_lock(&dirty_i->seglist_lock);
+	for_each_set_bit(segno, dirty_i->dirty_segmap[PRE], MAIN_SEGS(sbi)) {
+		if (__set_test_and_inuse(sbi, segno))
+			test_and_clear_bit(segno, dirty_i->dirty_segmap[PRE]);
+	}
+	mutex_unlock(&dirty_i->seglist_lock);
+}
+
 void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
 						struct cp_control *cpc)
 {
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index e9a7a637d688..5da8d1100b87 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -487,19 +487,24 @@ static inline void __set_test_and_free(struct f2fs_sb_info *sbi,
 	spin_unlock(&free_i->segmap_lock);
 }
 
-static inline void __set_test_and_inuse(struct f2fs_sb_info *sbi,
+static inline bool __set_test_and_inuse(struct f2fs_sb_info *sbi,
 		unsigned int segno)
 {
 	struct free_segmap_info *free_i = FREE_I(sbi);
 	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
+	bool is_inuse = false;
 
 	spin_lock(&free_i->segmap_lock);
 	if (!test_and_set_bit(segno, free_i->free_segmap)) {
 		free_i->free_segments--;
 		if (!test_and_set_bit(secno, free_i->free_secmap))
 			free_i->free_sections--;
+	} else {
+		is_inuse = true;
 	}
 	spin_unlock(&free_i->segmap_lock);
+
+	return is_inuse;
 }
 
 static inline void get_sit_bitmap(struct f2fs_sb_info *sbi,
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
