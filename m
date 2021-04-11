Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3969635B216
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 11 Apr 2021 09:02:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lVU6w-0003SR-9c; Sun, 11 Apr 2021 07:02:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1lVU6s-0003Ry-NL
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 11 Apr 2021 07:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PmIPUqDY/QNWnROnk9djp1aJ9t10Kc7Rv7U6oV4ESoA=; b=ExCJWTvtO9Hlblpr3sjAOI7eX+
 bv94n2mPeuevnl8P170rB+x7Ww3G15HIPIaj62RJ/ELH64i3t4Ly4oFVZ0m5UYK8mFYj8HhI+LwqE
 aaGnSQ4pjyt9OkkC4XDkB1I8oeGl0Zuo5LujidwL5jIa6IggkwNN8bbvVaj19fCruvAU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PmIPUqDY/QNWnROnk9djp1aJ9t10Kc7Rv7U6oV4ESoA=; b=Y4E3wFTMRcIKPPPuXz4ywz7KZu
 8jyO4Qtfh0rYSQv8kiW2iwaoE0bCUtzsRb7l/cuzWyfIxL7HPRQ0r3EJLqWEu9HmKXg4HL8Xw8Gcd
 EcIUMJUPzLLX5ipxgSIyJPe3tCJtfuWtpR9ajOFjAB0wwDQuhqXDHnmQOFbClih2p8yM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lVU6n-0008SZ-S2
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 11 Apr 2021 07:02:18 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8887361206;
 Sun, 11 Apr 2021 07:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1618124522;
 bh=dbu10ZxNnwrVX7m/W1f40w6BRJpvnEEL0J+cWh2TzEw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=MOi4YddZxzel+f1kOe/jTUfurJJUkG4JJgL4ANjNLKO2ombxnCbx4OA1ss+RIIJLE
 lIWura2Dt16fX8OreA1ubTOWXqymnKRE5/kPwDYUZdv6LouSg15IqqSd0l+VCgEW2w
 vZZBbJ/j2tlhqfXjPfUPXtwzpxM/lEbbi1HMGR2wQ2lAleEbO/iCeuhYc0hFbS3ega
 bFhetItvW5bhnRCL67otyz6ZuCcJEnF7IR27uiWFJvpTObe17AAQHAKgj00FWeQsyF
 2FV20a7REI4NHlW9dJyOrGf8qLbtPLWpu61xEpWzYrOHldYLNLLHQ1H7JJjUYGHvBl
 9Qv3geCSO/sfQ==
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20210324031828.67133-1-yuchao0@huawei.com>
 <YFvQGxLbpmDjxEzR@google.com>
 <2dfb085b-80ce-050b-5650-986675a07488@huawei.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <66e0a225-7f52-a33e-ccd6-e7bfa1067ed1@kernel.org>
Date: Sun, 11 Apr 2021 15:01:59 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <2dfb085b-80ce-050b-5650-986675a07488@huawei.com>
Content-Language: en-US
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lVU6n-0008SZ-S2
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix to avoid touching checkpointed
 data in get_victim()
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Jaegeuk,

Could you please help to merge below cleanup diff into original patch?
or merge this separately if it is too late since it is near rc7.

 From 5a342a8f332a1b3281ec0e2b4d41b5287689c8ed Mon Sep 17 00:00:00 2001
From: Chao Yu <yuchao0@huawei.com>
Date: Sun, 11 Apr 2021 14:29:34 +0800
Subject: [PATCH] f2fs: avoid duplicated codes for cleanup

f2fs_segment_has_free_slot() was copied from __next_free_blkoff(),
the main implementation of them is almost the same, clean up them to
reuse common code as much as possible.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
  fs/f2fs/segment.c | 32 ++++++++++----------------------
  1 file changed, 10 insertions(+), 22 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index b33273aa5c22..bd9056165d62 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2627,22 +2627,20 @@ static void new_curseg(struct f2fs_sb_info *sbi, int type, bool new_sec)
  	curseg->alloc_type = LFS;
  }

-static void __next_free_blkoff(struct f2fs_sb_info *sbi,
-			struct curseg_info *seg, block_t start)
+static int __next_free_blkoff(struct f2fs_sb_info *sbi,
+					int segno, block_t start)
  {
-	struct seg_entry *se = get_seg_entry(sbi, seg->segno);
+	struct seg_entry *se = get_seg_entry(sbi, segno);
  	int entries = SIT_VBLOCK_MAP_SIZE / sizeof(unsigned long);
  	unsigned long *target_map = SIT_I(sbi)->tmp_map;
  	unsigned long *ckpt_map = (unsigned long *)se->ckpt_valid_map;
  	unsigned long *cur_map = (unsigned long *)se->cur_valid_map;
-	int i, pos;
+	int i;

  	for (i = 0; i < entries; i++)
  		target_map[i] = ckpt_map[i] | cur_map[i];

-	pos = __find_rev_next_zero_bit(target_map, sbi->blocks_per_seg, start);
-
-	seg->next_blkoff = pos;
+	return __find_rev_next_zero_bit(target_map, sbi->blocks_per_seg, start);
  }

  /*
@@ -2654,26 +2652,16 @@ static void __refresh_next_blkoff(struct f2fs_sb_info *sbi,
  				struct curseg_info *seg)
  {
  	if (seg->alloc_type == SSR)
-		__next_free_blkoff(sbi, seg, seg->next_blkoff + 1);
+		seg->next_blkoff =
+			__next_free_blkoff(sbi, seg->segno,
+						seg->next_blkoff + 1);
  	else
  		seg->next_blkoff++;
  }

  bool f2fs_segment_has_free_slot(struct f2fs_sb_info *sbi, int segno)
  {
-	struct seg_entry *se = get_seg_entry(sbi, segno);
-	int entries = SIT_VBLOCK_MAP_SIZE / sizeof(unsigned long);
-	unsigned long *target_map = SIT_I(sbi)->tmp_map;
-	unsigned long *ckpt_map = (unsigned long *)se->ckpt_valid_map;
-	unsigned long *cur_map = (unsigned long *)se->cur_valid_map;
-	int i, pos;
-
-	for (i = 0; i < entries; i++)
-		target_map[i] = ckpt_map[i] | cur_map[i];
-
-	pos = __find_rev_next_zero_bit(target_map, sbi->blocks_per_seg, 0);
-
-	return pos < sbi->blocks_per_seg;
+	return __next_free_blkoff(sbi, segno, 0) < sbi->blocks_per_seg;
  }

  /*
@@ -2701,7 +2689,7 @@ static void change_curseg(struct f2fs_sb_info *sbi, int type, bool flush)

  	reset_curseg(sbi, type, 1);
  	curseg->alloc_type = SSR;
-	__next_free_blkoff(sbi, curseg, 0);
+	__next_free_blkoff(sbi, curseg->segno, 0);

  	sum_page = f2fs_get_sum_page(sbi, new_segno);
  	if (IS_ERR(sum_page)) {
-- 
2.22.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
