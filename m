Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 419BDC46E2B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Nov 2025 14:27:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mjpopVq0G1wUUm8owNGrsiDNcO0MEDIpy0hW/tvJHh8=; b=UNmcAyHZcSsWWmE7mUw96oH/Md
	6ZkcpeuvlXbwD3V8+TLp25P3eQDv/7oxgHr9RKH/dXfrsnPx9Ky9in0vfELsRvfRpLEqcwfH4CuCe
	VaFXFLyz+tCqYX7TFo39f9PslBquRU+gJwUsI0t/2adpKC1fERcdrGpRpWT3uf+sqPLE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIRvd-0001if-JJ;
	Mon, 10 Nov 2025 13:27:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hexiaole1994@126.com>) id 1vIRvb-0001iY-Lu
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Nov 2025 13:27:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mia422mlEesoTBfhRn/yCjSqZVQ0iuEMVkMXEpjpE+Q=; b=EublAfOo7m5CUPZQgsy+vxJHad
 JgOQFKcbE4aPgbtAe5OTYsBons8Sz+LwZrZsah9ub8JTRIy4gQzAl9A8xtg8KJZns13ZA7Pk9GV3I
 qvPqzefjUu/3bH3x9Fy8ecqdV1hiQc32x9WQDrZFo9xCvQqNDonVGCAbRit4a8IZ3IXY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Mia422mlEesoTBfhRn/yCjSqZVQ0iuEMVkMXEpjpE+Q=; b=S
 ENk6lXlsvlGQYqjeip6u7O2ewyI3wygjE866qEmMUYZfzu/IdJ/0bp39pa8pFyRMlkajuQYDVde1G
 qSoRZHOS0vTd8+l8fxzgJJzzyYQM3H6e9lFmMgmU0OB0ApxdBPpNMs1Vxw3zKfsmqsxmwbygN9b18
 +2wSarzZHcjhWsJE=;
Received: from m16.mail.126.com ([220.197.31.7])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vIRva-0001w9-1J for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Nov 2025 13:27:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=Mi
 a422mlEesoTBfhRn/yCjSqZVQ0iuEMVkMXEpjpE+Q=; b=dIYSIzdsw2ZcuMpA4h
 vABCCHm691nm4Pwq+QeyXDHnL3dXLmxMqqWp1Wk5uMI0WoCb0LaiMnDAqo35+GLr
 26k8xETGE0+mheoBCbzzLeccEauCAJiBHJRWbcJbJrTVMaXkNSBqqz1PS42dnsRK
 LDFa3YkeSOvZ6lnAqT6onNDpo=
Received: from hpz640.. (unknown [])
 by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id
 _____wD3SMIl6BFpQXf_Ag--.45629S2; 
 Mon, 10 Nov 2025 21:27:02 +0800 (CST)
From: Xiaole He <hexiaole1994@126.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 10 Nov 2025 21:26:54 +0800
Message-ID: <20251110132654.6485-1-hexiaole1994@126.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: _____wD3SMIl6BFpQXf_Ag--.45629S2
X-Coremail-Antispam: 1Uf129KBjvJXoWxGw4xWFW3Ar4kCrWDXrWfAFb_yoWrtr43pF
 47CF9xKr4rur1xuasaq3W8AF1S93y8ur4UJr1Iq3sYyr4rWF1Skw1kt345XF1vkrs3Jr1x
 XFZIyFy5A3WDuFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UUManUUUUU=
X-Originating-IP: [202.110.209.182]
X-CM-SenderInfo: 5kh0xt5rohimizu6ij2wof0z/1tbieh8CBmkR5xMTBwAAs5
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When active_logs == 6, dentry blocks can be allocated to HOT,
 WARM, or COLD segments based on various conditions in __get_segment_type_6():
 - age extent cache (if enabled) - FI_HOT_DATA flag (set when [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [220.197.31.7 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [hexiaole1994(at)126.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [hexiaole1994(at)126.com]
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1vIRva-0001w9-1J
Subject: [f2fs-dev] [PATCH v1] f2fs: fix has_curseg_enough_space to check
 all data segments for dentry blocks
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
Cc: jaegeuk@kernel.org, Xiaole He <hexiaole1994@126.com>,
 linux-kernel@vger.kernel.org, stable@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When active_logs == 6, dentry blocks can be allocated to HOT, WARM, or
COLD segments based on various conditions in __get_segment_type_6():
- age extent cache (if enabled)
- FI_HOT_DATA flag (set when dirty_pages <= min_hot_blocks)
- rw_hint (defaults to WARM via f2fs_rw_hint_to_seg_type)
- file_is_hot(), FI_NEED_IPU, f2fs_is_cow_file(), etc.

However, has_curseg_enough_space() only checked CURSEG_HOT_DATA segment
for dentry blocks, which could lead to incorrect space calculation when
dentry blocks are actually allocated to WARM or COLD segments.

Reproducer:
Note: This reproducer requires adding a tracepoint to observe segment
type. Add the following tracepoint to include/trace/events/f2fs.h:

TRACE_EVENT(f2fs_allocate_data_block,
        TP_PROTO(struct f2fs_sb_info *sbi, struct inode *inode,
                enum log_type type, block_t blkaddr),

        TP_ARGS(sbi, inode, type, blkaddr),

        TP_STRUCT__entry(
                __field(dev_t, dev)
                __field(ino_t, ino)
                __field(int, type)
                __field(block_t, blkaddr)
                __field(int, is_dir)
        ),

        TP_fast_assign(
                __entry->dev = sbi->sb->s_dev;
                __entry->ino = inode ? inode->i_ino : 0;
                __entry->type = type;
                __entry->blkaddr = blkaddr;
                __entry->is_dir = inode ? S_ISDIR(inode->i_mode) : 0;
        ),

        TP_printk("dev = (%d,%d), ino = %lu, %s, blkaddr = %u, is_dir = %d",
                show_dev(__entry->dev),
                (unsigned long)__entry->ino,
                show_data_type(__entry->type),
                __entry->blkaddr,
                __entry->is_dir)
);

And add the tracepoint call in fs/f2fs/segment.c in
f2fs_allocate_data_block() function. Find the location after
locate_dirty_segment() calls and before IS_DATASEG() check:

	locate_dirty_segment(sbi, GET_SEGNO(sbi, old_blkaddr));
	locate_dirty_segment(sbi, GET_SEGNO(sbi, *new_blkaddr));

	trace_f2fs_allocate_data_block(sbi, folio ? folio->mapping->host : NULL,
					type, *new_blkaddr);

	if (IS_DATASEG(curseg->seg_type))

1. Mount F2FS with active_logs=6 and age extent cache disabled:
   # mkfs.f2fs -f /dev/sdb1
   # mount -t f2fs -o active_logs=6 /dev/sdb1 /mnt/f2fs-test

2. Enable tracing and f2fs_allocate_data_block tracepoint:
   # echo 1 > /sys/kernel/debug/tracing/events/f2fs/f2fs_allocate_data_block/enable
   # echo 1 > /sys/kernel/debug/tracing/tracing_on
   # echo > /sys/kernel/debug/tracing/trace

3. Create a directory and write enough files to trigger dirty_pages >
   min_hot_blocks (default 16), which will clear FI_HOT_DATA flag:
   # mkdir /mnt/f2fs-test/testdir
   # cd /mnt/f2fs-test/testdir
   # seq 1 8192 | xargs touch
   # sync

4. Observe dentry block allocation:
   # cat /sys/kernel/debug/tracing/trace

   The trace output shows dentry blocks (is_dir = 1) allocated to WARM
   segment because FI_HOT_DATA is cleared when dirty_pages >
   min_hot_blocks (default 16). However, has_curseg_enough_space() only
   checked HOT_DATA segment space.

Fix by checking all three data segments (HOT, WARM, COLD) when
active_logs == 6, similar to how __get_segment_type_6() can return
any of these segment types for dentry blocks.

Fixes: ef095d19e82f ("f2fs: write small sized IO to hot log")
Cc: stable@kernel.org
Signed-off-by: Xiaole He <hexiaole1994@126.com>
---
 fs/f2fs/segment.h | 31 +++++++++++++++++++++++++------
 1 file changed, 25 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 1ce2c8abaf48..c13400a53013 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -632,15 +632,34 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
 	}
 
 	/* check current data section for dentry blocks. */
-	segno = CURSEG_I(sbi, CURSEG_HOT_DATA)->segno;
+	if (F2FS_OPTION(sbi).active_logs == 6) {
+		/*
+		 * With active_logs == 6, dentry blocks can be allocated to
+		 * HOT, WARM, or COLD segments based on age extent cache,
+		 * FI_HOT_DATA flag, rw_hint, etc. Check all three.
+		 */
+		for (i = CURSEG_HOT_DATA; i <= CURSEG_COLD_DATA; i++) {
+			segno = CURSEG_I(sbi, i)->segno;
+
+			if (unlikely(segno == NULL_SEGNO))
+				return false;
+
+			left_blocks = get_left_section_blocks(sbi, i, segno);
+
+			if (dent_blocks > left_blocks)
+				return false;
+		}
+	} else {
+		segno = CURSEG_I(sbi, CURSEG_HOT_DATA)->segno;
 
-	if (unlikely(segno == NULL_SEGNO))
-		return false;
+		if (unlikely(segno == NULL_SEGNO))
+			return false;
 
-	left_blocks = get_left_section_blocks(sbi, CURSEG_HOT_DATA, segno);
+		left_blocks = get_left_section_blocks(sbi, CURSEG_HOT_DATA, segno);
 
-	if (dent_blocks > left_blocks)
-		return false;
+		if (dent_blocks > left_blocks)
+			return false;
+	}
 	return true;
 }
 
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
