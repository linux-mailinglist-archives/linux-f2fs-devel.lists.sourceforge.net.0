Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1947F4FCD58
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Apr 2022 05:54:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ne7br-0006Au-Hb; Tue, 12 Apr 2022 03:54:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1ne7bp-0006Ao-V6
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 03:54:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TwKGLf/b+FwcgzUgmVqBJ97cgnzM9MUy6XMP7N8+x6g=; b=FM6DQxGfZI7YAQlkBYyMDZiH3j
 9cL4HJjJhCuNzUyyaWwrNnTIcKAMgQPhytFWRPZsUFCYIVB9vF0USoc5smg79D6C5nFBO2QeKMyqn
 I5MXPkKUxoCH5PcxvpzfMQO/gZ7SqguDMKun5uQOt4pZ5uc1MBwd1SXNBcE22rCrB91U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TwKGLf/b+FwcgzUgmVqBJ97cgnzM9MUy6XMP7N8+x6g=; b=HZTBHI0l2fdS2s442wSx8APg9N
 DPHRWh6oEHe+YcxLCY++A3+Lmv7KRfb1DNVW6D46H9qWOFjTxKeK2Gf0NT+M9EhPPNPtOgG07QzWn
 TrO3YGREZmGHk0enCEo9dBSEGuKoLK995YSGX3M1xuBtk0IiRnHV+Z+wW1DTntxrYwj8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ne7bn-00DSQ6-VW
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 03:54:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DB55B6171C;
 Tue, 12 Apr 2022 03:54:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27236C385A1;
 Tue, 12 Apr 2022 03:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649735661;
 bh=BGvS5QVzIyiSDgSRuQVCljw3+GN8jAFk4L0lp3E94hs=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=awZkCYqGgJKhYtEdrLt5NDWTLPsMwWhKne4/gXjYnkLcxJLTnmLmCthbK5OJjjIbx
 G2WtD9qukkk4gjEEvJBHmA3rtwL6hEWoLjhX87p5gzS3x9lIG4Ai74OdT1dfaePIbq
 2IQulkBNPn5nOAKm+gF3t7qjZR/iLeXW1KSBx2T3xmBb0+FFsd8L06NWoaqtyX4uBk
 IfXfRpdrFodxJSXbNAdUyVih0jtRIO3GAOeks1l85c0Lo6xNR+fhTdZfTDx32+93v+
 hzxXpiB5Zimo3zhgM/wPjfieJ5xnpkXjsL5QZ8Sg49r8dZErJGqakOu4MqKCboylwI
 hmIaqGjpMwZJw==
Message-ID: <1eee9abe-f468-ce32-cdb9-3a706404de2f@kernel.org>
Date: Tue, 12 Apr 2022 11:54:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220406152651.5142-1-chao@kernel.org>
 <YlSNjgQwoiENx5EK@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YlSNjgQwoiENx5EK@google.com>
X-Spam-Score: -6.8 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/4/12 4:20, Jaegeuk Kim wrote: > On 04/06, Chao Yu
 wrote: >> Previously, during foreground GC, if victims contain data of pinned
 file, >> it will fail migration of the data, and meanwhile i_gc_ [...] 
 Content analysis details:   (-6.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.6 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ne7bn-00DSQ6-VW
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: give priority to select unpinned
 section for foreground GC
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

On 2022/4/12 4:20, Jaegeuk Kim wrote:
> On 04/06, Chao Yu wrote:
>> Previously, during foreground GC, if victims contain data of pinned file,
>> it will fail migration of the data, and meanwhile i_gc_failures of that
>> pinned file may increase, and when it exceeds threshold, GC will unpin
>> the file, result in breaking pinfile's semantics.
>>
>> In order to mitigate such condition, let's record and skip section which
>> has pinned file's data and give priority to select unpinned one.
>>
>> Signed-off-by: Chao Yu <chao.yu@oppo.com>
>> ---
>> v3:
>> - check pin status before pinning section in pin_section().
>>   fs/f2fs/gc.c      | 56 ++++++++++++++++++++++++++++++++++++++++++++---
>>   fs/f2fs/segment.c |  7 ++++++
>>   fs/f2fs/segment.h |  2 ++
>>   3 files changed, 62 insertions(+), 3 deletions(-)
>>
>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
>> index 6a7e4148ff9d..df23824ae3c2 100644
>> --- a/fs/f2fs/gc.c
>> +++ b/fs/f2fs/gc.c
>> @@ -646,6 +646,37 @@ static void release_victim_entry(struct f2fs_sb_info *sbi)
>>   	f2fs_bug_on(sbi, !list_empty(&am->victim_list));
>>   }
>>   
>> +static void pin_section(struct f2fs_sb_info *sbi, unsigned int segno)
> 
> Need f2fs_...?

Sure, I can add prefix...

It's a local function, it won't pollute global namespace w/o f2fs_ prefix
though.

> 
>> +{
>> +	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
>> +	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
>> +
>> +	if (test_bit(secno, dirty_i->pinned_secmap))
>> +		return;
>> +	set_bit(secno, dirty_i->pinned_secmap);
>> +	dirty_i->pinned_secmap_cnt++;
>> +}
>> +
>> +static bool pinned_section_exists(struct dirty_seglist_info *dirty_i)
>> +{
>> +	return dirty_i->pinned_secmap_cnt;
>> +}
>> +
>> +static bool section_is_pinned(struct dirty_seglist_info *dirty_i,
>> +						unsigned int secno)
>> +{
>> +	return pinned_section_exists(dirty_i) &&
>> +			test_bit(secno, dirty_i->pinned_secmap);
>> +}
>> +
>> +static void unpin_all_sections(struct f2fs_sb_info *sbi)
>> +{
>> +	unsigned int bitmap_size = f2fs_bitmap_size(MAIN_SECS(sbi));
>> +
>> +	memset(DIRTY_I(sbi)->pinned_secmap, 0, bitmap_size);
>> +	DIRTY_I(sbi)->pinned_secmap_cnt = 0;
>> +}
>> +
>>   /*
>>    * This function is called from two paths.
>>    * One is garbage collection and the other is SSR segment selection.
>> @@ -787,6 +818,9 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
>>   		if (gc_type == BG_GC && test_bit(secno, dirty_i->victim_secmap))
>>   			goto next;
>>   
>> +		if (gc_type == FG_GC && section_is_pinned(dirty_i, secno))
>> +			goto next;
>> +
>>   		if (is_atgc) {
>>   			add_victim_entry(sbi, &p, segno);
>>   			goto next;
>> @@ -1202,8 +1236,10 @@ static int move_data_block(struct inode *inode, block_t bidx,
>>   	}
>>   
>>   	if (f2fs_is_pinned_file(inode)) {
>> -		if (gc_type == FG_GC)
>> +		if (gc_type == FG_GC) {
>>   			f2fs_pin_file_control(inode, true);
>> +			pin_section(F2FS_I_SB(inode), segno);
> 
> Do we need to check unpinning the inode?
> 			if (!f2fs_pin_file_control())
> 				f2fs_set_pin_section();

I'm thinking that it needs to avoid increasing GC_FAILURE_PIN AMAP,
so could you please check below logic:

 From 7cb1ee0df32ede44b17c503b81930dae25d287eb Mon Sep 17 00:00:00 2001
From: Chao Yu <chao@kernel.org>
Date: Wed, 6 Apr 2022 23:26:51 +0800
Subject: [PATCH v4] f2fs: give priority to select unpinned section for
  foreground GC

Previously, during foreground GC, if victims contain data of pinned file,
it will fail migration of the data, and meanwhile i_gc_failures of that
pinned file may increase, and when it exceeds threshold, GC will unpin
the file, result in breaking pinfile's semantics.

In order to mitigate such condition, let's record and skip section which
has pinned file's data and give priority to select unpinned one.

Signed-off-by: Chao Yu <chao.yu@oppo.com>
---
v4:
- add f2fs_ prefix for newly introduced functions
- add bool type variable for functionality switch
- increase GC_FAILURE_PIN only if it disable pinning section
  fs/f2fs/gc.c      | 66 ++++++++++++++++++++++++++++++++++++++++++-----
  fs/f2fs/segment.c |  8 ++++++
  fs/f2fs/segment.h |  3 +++
  3 files changed, 71 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 6a7e4148ff9d..296b31e28d3d 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -646,6 +646,41 @@ static void release_victim_entry(struct f2fs_sb_info *sbi)
  	f2fs_bug_on(sbi, !list_empty(&am->victim_list));
  }

+static bool f2fs_pin_section(struct f2fs_sb_info *sbi, unsigned int segno)
+{
+	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
+	unsigned int secno = GET_SEC_FROM_SEG(sbi, segno);
+
+	if (!dirty_i->enable_pin_section)
+		return false;
+	if (test_bit(secno, dirty_i->pinned_secmap))
+		return true;
+	set_bit(secno, dirty_i->pinned_secmap);
+	dirty_i->pinned_secmap_cnt++;
+	return true;
+}
+
+static bool f2fs_pinned_section_exists(struct dirty_seglist_info *dirty_i)
+{
+	return dirty_i->enable_pin_section && dirty_i->pinned_secmap_cnt;
+}
+
+static bool f2fs_section_is_pinned(struct dirty_seglist_info *dirty_i,
+						unsigned int secno)
+{
+	return f2fs_pinned_section_exists(dirty_i) &&
+			test_bit(secno, dirty_i->pinned_secmap);
+}
+
+static void f2fs_unpin_all_sections(struct f2fs_sb_info *sbi, bool enable)
+{
+	unsigned int bitmap_size = f2fs_bitmap_size(MAIN_SECS(sbi));
+
+	memset(DIRTY_I(sbi)->pinned_secmap, 0, bitmap_size);
+	DIRTY_I(sbi)->pinned_secmap_cnt = 0;
+	DIRTY_I(sbi)->enable_pin_section = enable;
+}
+
  /*
   * This function is called from two paths.
   * One is garbage collection and the other is SSR segment selection.
@@ -787,6 +822,9 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
  		if (gc_type == BG_GC && test_bit(secno, dirty_i->victim_secmap))
  			goto next;

+		if (gc_type == FG_GC && f2fs_section_is_pinned(dirty_i, secno))
+			goto next;
+
  		if (is_atgc) {
  			add_victim_entry(sbi, &p, segno);
  			goto next;
@@ -1202,8 +1240,10 @@ static int move_data_block(struct inode *inode, block_t bidx,
  	}

  	if (f2fs_is_pinned_file(inode)) {
-		if (gc_type == FG_GC)
-			f2fs_pin_file_control(inode, true);
+		if (gc_type == FG_GC) {
+			if (!f2fs_pin_section(F2FS_I_SB(inode), segno))
+				f2fs_pin_file_control(inode, true);
+		}
  		err = -EAGAIN;
  		goto out;
  	}
@@ -1352,8 +1392,10 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
  		goto out;
  	}
  	if (f2fs_is_pinned_file(inode)) {
-		if (gc_type == FG_GC)
-			f2fs_pin_file_control(inode, true);
+		if (gc_type == FG_GC) {
+			if (!f2fs_pin_section(F2FS_I_SB(inode), segno))
+				f2fs_pin_file_control(inode, true);
+		}
  		err = -EAGAIN;
  		goto out;
  	}
@@ -1483,7 +1525,8 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,

  			if (is_inode_flag_set(inode, FI_PIN_FILE) &&
  							gc_type == FG_GC) {
-				f2fs_pin_file_control(inode, true);
+				if (!f2fs_pin_section(sbi, segno))
+					f2fs_pin_file_control(inode, true);
  				iput(inode);
  				return submitted;
  			}
@@ -1766,9 +1809,17 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
  		ret = -EINVAL;
  		goto stop;
  	}
+retry:
  	ret = __get_victim(sbi, &segno, gc_type);
-	if (ret)
+	if (ret) {
+		/* allow to search victim from sections has pinned data */
+		if (ret == -ENODATA && gc_type == FG_GC &&
+				f2fs_pinned_section_exists(DIRTY_I(sbi))) {
+			f2fs_unpin_all_sections(sbi, false);
+			goto retry;
+		}
  		goto stop;
+	}

  	seg_freed = do_garbage_collect(sbi, segno, &gc_list, gc_type, force);
  	if (gc_type == FG_GC &&
@@ -1811,6 +1862,9 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
  	SIT_I(sbi)->last_victim[ALLOC_NEXT] = 0;
  	SIT_I(sbi)->last_victim[FLUSH_DEVICE] = init_segno;

+	if (gc_type == FG_GC && f2fs_pinned_section_exists(DIRTY_I(sbi)))
+		f2fs_unpin_all_sections(sbi, true);
+
  	trace_f2fs_gc_end(sbi->sb, ret, total_freed, sec_freed,
  				get_pages(sbi, F2FS_DIRTY_NODES),
  				get_pages(sbi, F2FS_DIRTY_DENTS),
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 22dfeb991529..93c7bae57a25 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4734,6 +4734,13 @@ static int init_victim_secmap(struct f2fs_sb_info *sbi)
  	dirty_i->victim_secmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
  	if (!dirty_i->victim_secmap)
  		return -ENOMEM;
+
+	dirty_i->pinned_secmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
+	if (!dirty_i->pinned_secmap)
+		return -ENOMEM;
+
+	dirty_i->pinned_secmap_cnt = 0;
+	dirty_i->enable_pin_section = true;
  	return 0;
  }

@@ -5322,6 +5329,7 @@ static void destroy_victim_secmap(struct f2fs_sb_info *sbi)
  {
  	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);

+	kvfree(dirty_i->pinned_secmap);
  	kvfree(dirty_i->victim_secmap);
  }

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 5c94caf0c0a1..8a591455d796 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -294,6 +294,9 @@ struct dirty_seglist_info {
  	struct mutex seglist_lock;		/* lock for segment bitmaps */
  	int nr_dirty[NR_DIRTY_TYPE];		/* # of dirty segments */
  	unsigned long *victim_secmap;		/* background GC victims */
+	unsigned long *pinned_secmap;		/* pinned victims from foreground GC */
+	unsigned int pinned_secmap_cnt;		/* count of victims which has pinned data */
+	bool enable_pin_section;		/* enable pinning section */
  };

  /* victim selection function for cleaning and SSR */
-- 
2.25.1

Thanks,

> 
>> +		}
>>   		err = -EAGAIN;
>>   		goto out;
>>   	}
>> @@ -1352,8 +1388,10 @@ static int move_data_page(struct inode *inode, block_t bidx, int gc_type,
>>   		goto out;
>>   	}
>>   	if (f2fs_is_pinned_file(inode)) {
>> -		if (gc_type == FG_GC)
>> +		if (gc_type == FG_GC) {
>>   			f2fs_pin_file_control(inode, true);
>> +			pin_section(F2FS_I_SB(inode), segno);
>> +		}
>>   		err = -EAGAIN;
>>   		goto out;
>>   	}
>> @@ -1485,6 +1523,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
>>   							gc_type == FG_GC) {
>>   				f2fs_pin_file_control(inode, true);
>>   				iput(inode);
>> +				pin_section(sbi, segno);
> 
> We don't have this code.
> 
>>   				return submitted;
>>   			}
>>   
>> @@ -1766,9 +1805,17 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
>>   		ret = -EINVAL;
>>   		goto stop;
>>   	}
>> +retry:
>>   	ret = __get_victim(sbi, &segno, gc_type);
>> -	if (ret)
>> +	if (ret) {
>> +		/* allow to search victim from sections has pinned data */
>> +		if (ret == -ENODATA && gc_type == FG_GC &&
>> +				pinned_section_exists(DIRTY_I(sbi))) {
>> +			unpin_all_sections(sbi);
>> +			goto retry;
>> +		}
>>   		goto stop;
>> +	}
>>   
>>   	seg_freed = do_garbage_collect(sbi, segno, &gc_list, gc_type, force);
>>   	if (gc_type == FG_GC &&
>> @@ -1811,6 +1858,9 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
>>   	SIT_I(sbi)->last_victim[ALLOC_NEXT] = 0;
>>   	SIT_I(sbi)->last_victim[FLUSH_DEVICE] = init_segno;
>>   
>> +	if (gc_type == FG_GC && pinned_section_exists(DIRTY_I(sbi)))
>> +		unpin_all_sections(sbi);
>> +
>>   	trace_f2fs_gc_end(sbi->sb, ret, total_freed, sec_freed,
>>   				get_pages(sbi, F2FS_DIRTY_NODES),
>>   				get_pages(sbi, F2FS_DIRTY_DENTS),
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index 012524db7437..1c20d7c9eca3 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -4736,6 +4736,12 @@ static int init_victim_secmap(struct f2fs_sb_info *sbi)
>>   	dirty_i->victim_secmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
>>   	if (!dirty_i->victim_secmap)
>>   		return -ENOMEM;
>> +
>> +	dirty_i->pinned_secmap = f2fs_kvzalloc(sbi, bitmap_size, GFP_KERNEL);
>> +	if (!dirty_i->pinned_secmap)
>> +		return -ENOMEM;
>> +
>> +	dirty_i->pinned_secmap_cnt = 0;
>>   	return 0;
>>   }
>>   
>> @@ -5324,6 +5330,7 @@ static void destroy_victim_secmap(struct f2fs_sb_info *sbi)
>>   {
>>   	struct dirty_seglist_info *dirty_i = DIRTY_I(sbi);
>>   
>> +	kvfree(dirty_i->pinned_secmap);
>>   	kvfree(dirty_i->victim_secmap);
>>   }
>>   
>> diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
>> index 5c94caf0c0a1..fd6f246e649c 100644
>> --- a/fs/f2fs/segment.h
>> +++ b/fs/f2fs/segment.h
>> @@ -294,6 +294,8 @@ struct dirty_seglist_info {
>>   	struct mutex seglist_lock;		/* lock for segment bitmaps */
>>   	int nr_dirty[NR_DIRTY_TYPE];		/* # of dirty segments */
>>   	unsigned long *victim_secmap;		/* background GC victims */
>> +	unsigned long *pinned_secmap;		/* pinned victims from foreground GC */
>> +	unsigned int pinned_secmap_cnt;		/* count of victims which has pinned data */
>>   };
>>   
>>   /* victim selection function for cleaning and SSR */
>> -- 
>> 2.32.0


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
