Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3AA9C4B9DC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Nov 2025 07:11:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iz+UBQm0bWuM3v1Piu+YGaBbv13OXsL75kfqaQ4tC3Q=; b=Ucttf9OhDEHtKfpQBoo79I4V8o
	LKvkgS1vYZOC6NhXsUm5SIbMCvoiwCV9/Pm2zA9OT40jmDemTsy2NAKczF8U3sUtMH+b6XQ1tDU4A
	EmIkuSUCEzFM95JJMRLBUsSbor76tW7LueV6lABw+e9u74kG5+Ah8IE602EXrAdoWZk0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vIhb1-0007JV-0U;
	Tue, 11 Nov 2025 06:11:15 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hexiaole1994@126.com>) id 1vIhay-0007JO-9Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 06:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SQNThmc7X74qfNRIdMXWU8JaAm5dM9fXnQhj2wzlK1Y=; b=MCQyyhL/nhTldkyDih16RDT3XJ
 28ibTeo0bEjI8LWhAThjp+yfcb5f8GbwBaq5fCbMBePy58KNxqfPo7jyLlx6qagFVasUKL4PPdcy6
 swpAitpxa/E/56EyMbiDU/uv32ZBN8SSQ11Cwl1bgrmPzb6/yMi/zw/JsoZw8m3wrISA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SQNThmc7X74qfNRIdMXWU8JaAm5dM9fXnQhj2wzlK1Y=; b=ZqpbAvHKeYTYAm96TPQ2IktpO5
 omF9IF7Bx9erDoSCncm01YZZCToONJOlFCKWdoIbcy3XO6g0ForJJClOG442CGDBswwPkDZYTSvYC
 mluDbSSlBMoFbFCDxcN8ffgUPwdu3gU5dJGMQctT3fHksZiCYi/9aWpe3e2bP1ZQhAlw=;
Received: from m16.mail.126.com ([117.135.210.6])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vIhax-0007XR-Cz for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Nov 2025 06:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
 s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=SQ
 NThmc7X74qfNRIdMXWU8JaAm5dM9fXnQhj2wzlK1Y=; b=DIVrFzWA4nnWn24ZRo
 XE9IO6g1j6WAITBYeFqd5axL2WLAa/D8lPGwmyrzt6pr/X6YXSF6ekI9gd1BbW8S
 7bm9GpsUw/0YKWjTNmTODepdBD5vSftg1SIjNDaHs74tF6WPID4yUSL2U641Sl8K
 IGUiVDA7sjMkg0F8g1MMJGLqk=
Received: from hpz640.. (unknown [])
 by gzga-smtp-mtada-g1-2 (Coremail) with SMTP id
 _____wD3DsRu0xJpNZcpAw--.15039S2; 
 Tue, 11 Nov 2025 14:10:55 +0800 (CST)
From: Xiaole He <hexiaole1994@126.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 11 Nov 2025 14:10:51 +0800
Message-ID: <20251111061051.337547-1-hexiaole1994@126.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251111060557.337514-1-hexiaole1994@126.com>
References: <20251111060557.337514-1-hexiaole1994@126.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD3DsRu0xJpNZcpAw--.15039S2
X-Coremail-Antispam: 1Uf129KBjvJXoW3Ar15KFy5CFy7urWkurWxJFb_yoW7GF1xpF
 47CFy3Krs5ur18Was2q3WUG3WS93yUur4UJr1jgw1vyrWfWF1Ikwn7ta45XF1vkrs3XFn7
 ZasIkry5A3WDuFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0zR6Vb9UUUUU=
X-Originating-IP: [202.110.209.182]
X-CM-SenderInfo: 5kh0xt5rohimizu6ij2wof0z/1tbiegIDBmkS0LpJvQAAsY
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
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
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [hexiaole1994(at)126.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [hexiaole1994(at)126.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [117.135.210.6 listed in wl.mailspike.net]
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vIhax-0007XR-Cz
Subject: [f2fs-dev] [PATCH v2] f2fs: fix has_curseg_enough_space to check
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

Fix by merging the dentry block check into the main data/node block
check loop and checking data_blocks + dent_blocks for data segments,
since both regular data blocks and dentry blocks can be written to the
same segment. When active_logs == 6, dentry blocks can be allocated to
any of the three data segments (HOT, WARM, COLD), so all three segments
need to account for dentry blocks. When active_logs != 6, dentry blocks
are always allocated to HOT_DATA segment only, so only HOT_DATA segment
needs to account for dentry blocks, while WARM and COLD segments only
check data_blocks.

Fixes: ef095d19e82f ("f2fs: write small sized IO to hot log")
Cc: stable@kernel.org
Signed-off-by: Xiaole He <hexiaole1994@126.com>
---
Changes in v2 (per Yongpeng's feedback):
- Merged dentry block check into the main loop to avoid duplication
- Check data_blocks + dent_blocks for data segments (both can write to same segment)
---
 fs/f2fs/segment.h | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 1ce2c8abaf48..acda720a54eb 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -626,21 +626,21 @@ static inline bool has_curseg_enough_space(struct f2fs_sb_info *sbi,
 
 		left_blocks = get_left_section_blocks(sbi, i, segno);
 
-		blocks = i <= CURSEG_COLD_DATA ? data_blocks : node_blocks;
+		if (i <= CURSEG_COLD_DATA) {
+			blocks = data_blocks;
+			/*
+			 * With active_logs == 6, dentry blocks can be allocated to
+			 * any data segment. With active_logs != 6, dentry blocks
+			 * are always allocated to HOT_DATA segment.
+			 */
+			if ((F2FS_OPTION(sbi).active_logs == 6) || (i == CURSEG_HOT_DATA))
+				blocks += dent_blocks;
+		} else {
+			blocks = node_blocks;
+		}
 		if (blocks > left_blocks)
 			return false;
 	}
-
-	/* check current data section for dentry blocks. */
-	segno = CURSEG_I(sbi, CURSEG_HOT_DATA)->segno;
-
-	if (unlikely(segno == NULL_SEGNO))
-		return false;
-
-	left_blocks = get_left_section_blocks(sbi, CURSEG_HOT_DATA, segno);
-
-	if (dent_blocks > left_blocks)
-		return false;
 	return true;
 }
 
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
