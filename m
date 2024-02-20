Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA9085B406
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Feb 2024 08:31:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rcKak-0003zN-AE;
	Tue, 20 Feb 2024 07:31:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rcKai-0003yz-Hd
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 07:31:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LXdZZWsekregI13VH2wKLdCjgx2gH/jIrNAs3e9XgQI=; b=KV5ZDOZp6IbydbcXcS8+mIE/Wm
 ydYbzGM0ZxwIyNWLqTqPZC4843/ocwWiV0HPbceHA12/6VbF/ZTGZDWn3yy1eWBEoq8BxVT+nlacP
 MWlf5aF5yWn/26K0bsVdkPkSWjxZTQ3VM8L+mcJyxH96PeD+eDzOH6UhUaBIkM1g5Iqk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LXdZZWsekregI13VH2wKLdCjgx2gH/jIrNAs3e9XgQI=; b=UDDBQC3ENZNEVDMmcqegr688SB
 oQ9KmwTdwgVne9qIvmB3/fVTe0E2iZOMNM1DE+rbMunmbLMwoW1IdvqfTPzivA3zZ09Kmx1rGmK9+
 TXyyQRTmjnV2fV3IKjSbTx97eKWcQSMnUotVCszf7S8t3SocUGkrsdskACG9OeoZB524=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rcKah-0007xG-Bh for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Feb 2024 07:31:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4580E61084
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 20 Feb 2024 07:30:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 295DEC433F1;
 Tue, 20 Feb 2024 07:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1708414250;
 bh=OXGYwlEcvKSUcy2Rn7wKI35ffz8WjMg3NS9M274cDBk=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=fmVP63GFYSZHSKWN5LDO/SlxUIB4eeyGvmf6n9OzQyvUKCrghxkUdaWEkcunV8FKU
 3wme0jcNiIVelsPo8KPbDgquH4XtPw4e8W5AnHm7cTMtI+Szxf8be37I9t/x1hJUEl
 mfAIfnMEciWPIw9RBbTrH9UvTpJa++4aREfmPYYbNSfPrtbS8xfJCEHu6LJbpMvsPY
 u31AD3Harai+DtetK25epW78qBcxQij+oCoNqxhkYJFLaYxuStcC+TWoIhs6AKPq4+
 GnjI1+V7pjqwjf2/Fk0Vj57b4aO3eTmBmd5H8tJzwrSATQaJb6Mez+iYCaYSk11wG5
 nKYWa67hK9D1A==
Message-ID: <bded9fde-9541-465d-86f8-292249226cc9@kernel.org>
Date: Tue, 20 Feb 2024 15:30:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20240207005105.3744811-1-jaegeuk@kernel.org>
 <20240207005105.3744811-2-jaegeuk@kernel.org> <ZcpfF9UJz8bNW6ge@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZcpfF9UJz8bNW6ge@google.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/2/13 2:10, Jaegeuk Kim wrote: How do you think of
 appending below diff which cleans up missing parts? --- fs/f2fs/f2fs.h | 2
 +- fs/f2fs/file.c | 4 ++-- fs/f2fs/segment.c | 4 ++-- fs/f2fs/segment.h |
 22 +++++++++++ fs/f2fs/super.c | 2 +- 5 files changed, 17 insertions(+),
 17 deletions(-) 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rcKah-0007xG-Bh
Subject: Re: [f2fs-dev] [PATCH 2/3 v2] f2fs: use BLKS_PER_SEG, BLKS_PER_SEC,
 and SEGS_PER_SEC
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/2/13 2:10, Jaegeuk Kim wrote:

How do you think of appending below diff which cleans up missing
parts?

---
  fs/f2fs/f2fs.h    |  2 +-
  fs/f2fs/file.c    |  4 ++--
  fs/f2fs/segment.c |  4 ++--
  fs/f2fs/segment.h | 22 +++++++++++-----------
  fs/f2fs/super.c   |  2 +-
  5 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c4488e12c56e..fc9328655de8 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3491,7 +3491,7 @@ static inline __le32 *get_dnode_addr(struct inode *inode,
  		sizeof((f2fs_inode)->field))			\
  		<= (F2FS_OLD_ATTRIBUTE_SIZE + (extra_isize)))	\

-#define __is_large_section(sbi)		((sbi)->segs_per_sec > 1)
+#define __is_large_section(sbi)		(SEGS_PER_SEC(sbi) > 1)

  #define __is_meta_io(fio) (PAGE_TYPE_OF_BIO((fio)->type) == META)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 20a26bb5b889..ef43d33278ea 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2997,8 +2997,8 @@ static int f2fs_ioc_flush_device(struct file *filp, unsigned long arg)

  	if (!f2fs_is_multi_device(sbi) || sbi->s_ndevs - 1 <= range.dev_num ||
  			__is_large_section(sbi)) {
-		f2fs_warn(sbi, "Can't flush %u in %d for segs_per_sec %u != 1",
-			  range.dev_num, sbi->s_ndevs, sbi->segs_per_sec);
+		f2fs_warn(sbi, "Can't flush %u in %d for SEGS_PER_SEC %u != 1",
+			  range.dev_num, sbi->s_ndevs, SEGS_PER_SEC(sbi));
  		return -EINVAL;
  	}

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 97ac733ceffe..b59e29608ae7 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2750,7 +2750,7 @@ static unsigned int __get_next_segno(struct f2fs_sb_info *sbi, int type)
  	if (f2fs_need_rand_seg(sbi))
  		return get_random_u32_below(MAIN_SECS(sbi) * SEGS_PER_SEC(sbi));

-	/* if segs_per_sec is large than 1, we need to keep original policy. */
+	/* if SEGS_PER_SEC() is large than 1, we need to keep original policy. */
  	if (__is_large_section(sbi))
  		return curseg->segno;

@@ -3498,7 +3498,7 @@ int f2fs_allocate_data_block(struct f2fs_sb_info *sbi, struct page *page,
  	 */
  	if (segment_full) {
  		if (type == CURSEG_COLD_DATA_PINNED &&
-		    !((curseg->segno + 1) % sbi->segs_per_sec))
+		    !((curseg->segno + 1) % SEGS_PER_SEC(sbi)))
  			goto skip_new_segment;

  		if (from_gc) {
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index cb982af765c3..63f278210654 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -48,21 +48,21 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,

  #define IS_CURSEC(sbi, secno)						\
  	(((secno) == CURSEG_I(sbi, CURSEG_HOT_DATA)->segno /		\
-	  (sbi)->segs_per_sec) ||	\
+	  SEGS_PER_SEC(sbi)) ||	\
  	 ((secno) == CURSEG_I(sbi, CURSEG_WARM_DATA)->segno /		\
-	  (sbi)->segs_per_sec) ||	\
+	  SEGS_PER_SEC(sbi)) ||	\
  	 ((secno) == CURSEG_I(sbi, CURSEG_COLD_DATA)->segno /		\
-	  (sbi)->segs_per_sec) ||	\
+	  SEGS_PER_SEC(sbi)) ||	\
  	 ((secno) == CURSEG_I(sbi, CURSEG_HOT_NODE)->segno /		\
-	  (sbi)->segs_per_sec) ||	\
+	  SEGS_PER_SEC(sbi)) ||	\
  	 ((secno) == CURSEG_I(sbi, CURSEG_WARM_NODE)->segno /		\
-	  (sbi)->segs_per_sec) ||	\
+	  SEGS_PER_SEC(sbi)) ||	\
  	 ((secno) == CURSEG_I(sbi, CURSEG_COLD_NODE)->segno /		\
-	  (sbi)->segs_per_sec) ||	\
+	  SEGS_PER_SEC(sbi)) ||	\
  	 ((secno) == CURSEG_I(sbi, CURSEG_COLD_DATA_PINNED)->segno /	\
-	  (sbi)->segs_per_sec) ||	\
+	  SEGS_PER_SEC(sbi)) ||	\
  	 ((secno) == CURSEG_I(sbi, CURSEG_ALL_DATA_ATGC)->segno /	\
-	  (sbi)->segs_per_sec))
+	  SEGS_PER_SEC(sbi)))

  #define MAIN_BLKADDR(sbi)						\
  	(SM_I(sbi) ? SM_I(sbi)->main_blkaddr : 				\
@@ -93,7 +93,7 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
  #define GET_SEGNO_FROM_SEG0(sbi, blk_addr)				\
  	(GET_SEGOFF_FROM_SEG0(sbi, blk_addr) >> (sbi)->log_blocks_per_seg)
  #define GET_BLKOFF_FROM_SEG0(sbi, blk_addr)				\
-	(GET_SEGOFF_FROM_SEG0(sbi, blk_addr) & ((sbi)->blocks_per_seg - 1))
+	(GET_SEGOFF_FROM_SEG0(sbi, blk_addr) & (BLKS_PER_SEG(sbi) - 1))

  #define GET_SEGNO(sbi, blk_addr)					\
  	((!__is_valid_data_blkaddr(blk_addr) ||			\
@@ -101,9 +101,9 @@ static inline void sanity_check_seg_type(struct f2fs_sb_info *sbi,
  	NULL_SEGNO : GET_L2R_SEGNO(FREE_I(sbi),			\
  		GET_SEGNO_FROM_SEG0(sbi, blk_addr)))
  #define GET_SEC_FROM_SEG(sbi, segno)				\
-	(((segno) == -1) ? -1 : (segno) / (sbi)->segs_per_sec)
+	(((segno) == -1) ? -1 : (segno) / SEGS_PER_SEC(sbi))
  #define GET_SEG_FROM_SEC(sbi, secno)				\
-	((secno) * (sbi)->segs_per_sec)
+	((secno) * SEGS_PER_SEC(sbi))
  #define GET_ZONE_FROM_SEC(sbi, secno)				\
  	(((secno) == -1) ? -1 : (secno) / (sbi)->secs_per_zone)
  #define GET_ZONE_FROM_SEG(sbi, segno)				\
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 2a8b6cfaf683..9d2c680a61f5 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4723,7 +4723,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
  			.reason = CP_DISCARD,
  			.trim_start = 0,
  			.trim_end = MAIN_SEGS(sbi) - 1,
-			.trim_minlen = sbi->blocks_per_seg,
+			.trim_minlen = BLKS_PER_SEG(sbi),
  		};
  		f2fs_write_checkpoint(sbi, &cpc);
  	}
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
