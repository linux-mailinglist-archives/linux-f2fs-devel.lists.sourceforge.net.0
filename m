Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D214A5E9388
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 25 Sep 2022 15:58:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ocS8o-0002oF-6W;
	Sun, 25 Sep 2022 13:57:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ocS8m-0002o5-Gj
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 25 Sep 2022 13:57:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bRrCr8KjaZOz4IShAVOpMHsf9fyex9dSeqr52b10eIA=; b=Nup86d+luXT4/CT8oYA1ZDynvh
 88VOXolPUn1iRPlgZn9V6LRLPc5DwC4oT5/qpfepFLKHtbZE0IqCAwdBdQBm8VI4pfYtX2OtDU7tJ
 j9BWfqvJ2ljHrlekKc5mdXJehN7FrRTkqCgHzHLXPMtHDCwjHHE9KyoFNpCm0uF/Z0zk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bRrCr8KjaZOz4IShAVOpMHsf9fyex9dSeqr52b10eIA=; b=fi76FPfCeXhuOZ9vEkpmjHrCJd
 C3z0nhJOSBnyk5TJMPjueWOarbtXXJrDB28Y4fkqXoUXhF1J0lYKdih1aw7UuLctuO+1R0A9VO69K
 /WMpFzegcpDt0XglxkGo9V2dpMuzEzk/ulCuWjSlCShMmLTlSdSMwcad0sS655AxFhR0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ocS8k-0006BJ-Df for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 25 Sep 2022 13:57:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9B62861005
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 25 Sep 2022 13:57:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76336C433C1;
 Sun, 25 Sep 2022 13:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664114260;
 bh=N0p+XMeh405m/51bzQKxPmvxMqC5MIXNTOTO+P5wiZk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DuYEcQRm56zWUhKYlickDrWNf3iCO4KsdwpLT8LR3W1Vd+yslZ8RWJ1+/lcCfv6q+
 MJhQ4QCRpjwOsjqKZh7MMd3+DDH/4bY4AP6psxUYjPAhzjGVAWtsNZ3nkdd5nWdb4m
 pQVEDxnEMUyJjEUQt8D7G/Zm2F+eZgvwUDqHN7vWEXEHgokxDjAwWLo7cevvnrmMi5
 hrBaspEfY563XSQjItIlGFBc0YkUr6dg+XzWX8uWakwl+eWO3hCLu/ML+0zq3cAgfn
 ZTDaET7apJTNkQmR5B33+8Xoj+Id8iAQD+BBqfHNFfcvpA6MsVdMwHlQq/grKx4HFm
 aD0Ksqrt4woLw==
Message-ID: <490b5696-b4b3-94ca-f856-e19af9a88ab6@kernel.org>
Date: Sun, 25 Sep 2022 21:57:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220913135919.2445544-1-chao@kernel.org>
 <YykPzeC4lk+F/U/2@google.com>
 <b22657e3-df59-46ff-81c5-be22e422a576@kernel.org>
 <YyykoT0BdBrXfcrQ@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YyykoT0BdBrXfcrQ@google.com>
X-Spam-Score: -9.0 (---------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/9/23 2:08, Jaegeuk Kim wrote: > On 09/20, Chao Yu
 wrote: >> On 2022/9/20 8:56, Jaegeuk Kim wrote: >>> On 09/13, Chao Yu wrote:
 >>>> Once CP_ERROR_FLAG is set, checkpoint is disallowed to be tr [...] 
 Content analysis details:   (-9.0 points, 6.0 required)
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
 -3.8 NICE_REPLY_A           Looks like a legit reply (A)
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ocS8k-0006BJ-Df
Subject: Re: [f2fs-dev] [RFC PATCH v2] f2fs: record need_fsck in super_block
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

On 2022/9/23 2:08, Jaegeuk Kim wrote:
> On 09/20, Chao Yu wrote:
>> On 2022/9/20 8:56, Jaegeuk Kim wrote:
>>> On 09/13, Chao Yu wrote:
>>>> Once CP_ERROR_FLAG is set, checkpoint is disallowed to be triggered to
>>>> persist CP_FSCK_FLAG, fsck won't repair the image due to lack of
>>>> CP_FSCK_FLAG.
>>>>
>>>> This patch proposes to persist newly introduced SB_NEED_FSCK flag into
>>>> super block if CP_ERROR_FLAG and SBI_NEED_FSCK is set, later, once fsck
>>>> detect this flag, it can check and repair corrupted image in time.
>>>>
>>>> Signed-off-by: Chao Yu <chao@kernel.org>
>>>> ---
>>>> v2:
>>>> - remove unneeded codes.
>>>>    fs/f2fs/checkpoint.c    |  6 +++++-
>>>>    fs/f2fs/f2fs.h          |  1 +
>>>>    fs/f2fs/super.c         | 26 ++++++++++++++++++++++++++
>>>>    include/linux/f2fs_fs.h |  5 ++++-
>>>>    4 files changed, 36 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
>>>> index c3119e4c890c..0836fce40394 100644
>>>> --- a/fs/f2fs/checkpoint.c
>>>> +++ b/fs/f2fs/checkpoint.c
>>>> @@ -30,8 +30,12 @@ void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io)
>>>>    {
>>>>    	f2fs_build_fault_attr(sbi, 0, 0);
>>>>    	set_ckpt_flags(sbi, CP_ERROR_FLAG);
>>>> -	if (!end_io)
>>>> +	if (!end_io) {
>>>>    		f2fs_flush_merged_writes(sbi);
>>>> +
>>>> +		if (is_sbi_flag_set(sbi, SBI_NEED_FSCK))
>>>> +			f2fs_update_sb_flags(sbi, SB_NEED_FSCK);
>>>
>>> Let's think of putting some more context in superblock, if we want to overwrite
>>> it. E.g., a reason to stop checkpoint?
>>
>> Good idea, maybe:
>> Bit	Value				max number of type
>> [0]	need fsck flag			1
>> [1-5]	reason to stop checkpoint	32
>> [6-13]	reason to fsck			256
> 
> How about just keeping the counters of the reasons? (e.g., EIO count which
> stopped checkpoint)
> 
> #define MAX_CRASH_REASON 32
> char array[MAX_CRASH_REASON];

Something like this?

---
  fs/f2fs/checkpoint.c    | 10 +++++++---
  fs/f2fs/data.c          |  6 ++++--
  fs/f2fs/f2fs.h          |  4 +++-
  fs/f2fs/file.c          | 11 ++++++-----
  fs/f2fs/gc.c            |  6 ++++--
  fs/f2fs/inode.c         |  3 ++-
  fs/f2fs/segment.c       |  5 +++--
  fs/f2fs/super.c         | 25 +++++++++++++++++++++++++
  include/linux/f2fs_fs.h | 20 +++++++++++++++++++-
  9 files changed, 73 insertions(+), 17 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 308b70812cbd..b14a8e5eca21 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -26,12 +26,16 @@
  static struct kmem_cache *ino_entry_slab;
  struct kmem_cache *f2fs_inode_entry_slab;

-void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io)
+void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io,
+						unsigned char reason)
  {
  	f2fs_build_fault_attr(sbi, 0, 0);
  	set_ckpt_flags(sbi, CP_ERROR_FLAG);
-	if (!end_io)
+	if (!end_io) {
  		f2fs_flush_merged_writes(sbi);
+
+		f2fs_update_sb_flags(sbi, reason);
+	}
  }

  /*
@@ -122,7 +126,7 @@ struct page *f2fs_get_meta_page_retry(struct f2fs_sb_info *sbi, pgoff_t index)
  		if (PTR_ERR(page) == -EIO &&
  				++count <= DEFAULT_RETRY_IO_COUNT)
  			goto retry;
-		f2fs_stop_checkpoint(sbi, false);
+		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_META_PAGE);
  	}
  	return page;
  }
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 4e5be2c1dab9..20c8d835a87b 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -333,7 +333,8 @@ static void f2fs_write_end_io(struct bio *bio)
  			mempool_free(page, sbi->write_io_dummy);

  			if (unlikely(bio->bi_status))
-				f2fs_stop_checkpoint(sbi, true);
+				f2fs_stop_checkpoint(sbi, true,
+						STOP_CP_REASON_WRITE_FAIL);
  			continue;
  		}

@@ -349,7 +350,8 @@ static void f2fs_write_end_io(struct bio *bio)
  		if (unlikely(bio->bi_status)) {
  			mapping_set_error(page->mapping, -EIO);
  			if (type == F2FS_WB_CP_DATA)
-				f2fs_stop_checkpoint(sbi, true);
+				f2fs_stop_checkpoint(sbi, true,
+						STOP_CP_REASON_WRITE_FAIL);
  		}

  		f2fs_bug_on(sbi, page->mapping == NODE_MAPPING(sbi) &&
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d680a051cba4..ebda0ce1adbf 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3559,6 +3559,7 @@ int f2fs_enable_quota_files(struct f2fs_sb_info *sbi, bool rdonly);
  int f2fs_quota_sync(struct super_block *sb, int type);
  loff_t max_file_blocks(struct inode *inode);
  void f2fs_quota_off_umount(struct super_block *sb);
+void f2fs_update_sb_flags(struct f2fs_sb_info *sbi, unsigned char reason);
  int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover);
  int f2fs_sync_fs(struct super_block *sb, int sync);
  int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi);
@@ -3718,7 +3719,8 @@ static inline bool f2fs_need_rand_seg(struct f2fs_sb_info *sbi)
  /*
   * checkpoint.c
   */
-void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io);
+void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io,
+							unsigned char reason);
  void f2fs_flush_ckpt_thread(struct f2fs_sb_info *sbi);
  struct page *f2fs_grab_meta_page(struct f2fs_sb_info *sbi, pgoff_t index);
  struct page *f2fs_get_meta_page(struct f2fs_sb_info *sbi, pgoff_t index);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 2f9b387fef54..da45798d7fe5 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2153,7 +2153,8 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
  		if (ret) {
  			if (ret == -EROFS) {
  				ret = 0;
-				f2fs_stop_checkpoint(sbi, false);
+				f2fs_stop_checkpoint(sbi, false,
+						STOP_CP_REASON_SHUTDOWN);
  				set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
  				trace_f2fs_shutdown(sbi, in, ret);
  			}
@@ -2166,7 +2167,7 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
  		ret = freeze_bdev(sb->s_bdev);
  		if (ret)
  			goto out;
-		f2fs_stop_checkpoint(sbi, false);
+		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_SHUTDOWN);
  		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
  		thaw_bdev(sb->s_bdev);
  		break;
@@ -2175,16 +2176,16 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
  		ret = f2fs_sync_fs(sb, 1);
  		if (ret)
  			goto out;
-		f2fs_stop_checkpoint(sbi, false);
+		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_SHUTDOWN);
  		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
  		break;
  	case F2FS_GOING_DOWN_NOSYNC:
-		f2fs_stop_checkpoint(sbi, false);
+		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_SHUTDOWN);
  		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
  		break;
  	case F2FS_GOING_DOWN_METAFLUSH:
  		f2fs_sync_meta_pages(sbi, META, LONG_MAX, FS_META_IO);
-		f2fs_stop_checkpoint(sbi, false);
+		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_SHUTDOWN);
  		set_sbi_flag(sbi, SBI_IS_SHUTDOWN);
  		break;
  	case F2FS_GOING_DOWN_NEED_FSCK:
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 3a820e5cdaee..6e42dad0ac2d 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -74,7 +74,8 @@ static int gc_thread_func(void *data)

  		if (time_to_inject(sbi, FAULT_CHECKPOINT)) {
  			f2fs_show_injection_info(sbi, FAULT_CHECKPOINT);
-			f2fs_stop_checkpoint(sbi, false);
+			f2fs_stop_checkpoint(sbi, false,
+					STOP_CP_REASON_FAULT_INJECT);
  		}

  		if (!sb_start_write_trylock(sbi->sb)) {
@@ -1712,7 +1713,8 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
  			f2fs_err(sbi, "Inconsistent segment (%u) type [%d, %d] in SSA and SIT",
  				 segno, type, GET_SUM_TYPE((&sum->footer)));
  			set_sbi_flag(sbi, SBI_NEED_FSCK);
-			f2fs_stop_checkpoint(sbi, false);
+			f2fs_stop_checkpoint(sbi, false,
+				STOP_CP_REASON_CORRUPTED_SUMMARY);
  			goto skip;
  		}

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index f6cb8b78b5d5..7880596b51ee 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -716,7 +716,8 @@ void f2fs_update_inode_page(struct inode *inode)
  			cond_resched();
  			goto retry;
  		} else if (err != -ENOENT) {
-			f2fs_stop_checkpoint(sbi, false);
+			f2fs_stop_checkpoint(sbi, false,
+					STOP_CP_REASON_UPDATE_INODE);
  		}
  		return;
  	}
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index e35be4116767..4ed84510f195 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -390,7 +390,7 @@ void f2fs_balance_fs(struct f2fs_sb_info *sbi, bool need)
  {
  	if (time_to_inject(sbi, FAULT_CHECKPOINT)) {
  		f2fs_show_injection_info(sbi, FAULT_CHECKPOINT);
-		f2fs_stop_checkpoint(sbi, false);
+		f2fs_stop_checkpoint(sbi, false, STOP_CP_REASON_FAULT_INJECT);
  	}

  	/* balance_fs_bg is able to be pending */
@@ -708,7 +708,8 @@ int f2fs_flush_device_cache(struct f2fs_sb_info *sbi)
  		} while (ret && --count);

  		if (ret) {
-			f2fs_stop_checkpoint(sbi, false);
+			f2fs_stop_checkpoint(sbi, false,
+					STOP_CP_REASON_FLUSH_FAIL);
  			break;
  		}

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index b8e5fe244596..9f0a64b4c5c6 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3846,6 +3846,31 @@ int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover)
  	return err;
  }

+void f2fs_update_sb_flags(struct f2fs_sb_info *sbi, unsigned char reason)
+{
+	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
+	unsigned short s_flags;
+	int err;
+
+	f2fs_bug_on(sbi, reason >= MAX_STOP_REASON);
+
+	f2fs_down_write(&sbi->sb_lock);
+
+	raw_super->s_stop_reason[reason]++;
+	
+	s_flags = le16_to_cpu(raw_super->s_flags);
+
+	if (is_sbi_flag_set(sbi, SBI_NEED_FSCK))
+		raw_super->s_flags = cpu_to_le16(s_flags | SB_NEED_FSCK);
+
+	err = f2fs_commit_super(sbi, false);
+	if (err)
+		f2fs_warn(sbi, "f2fs_commit_super fails to persist flag: %u, reason:%u err:%d",
+					s_flags | SB_NEED_FSCK, reason, err);
+
+	f2fs_up_write(&sbi->sb_lock);
+}
+
  static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
  {
  	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
index d445150c5350..adeaac71a563 100644
--- a/include/linux/f2fs_fs.h
+++ b/include/linux/f2fs_fs.h
@@ -73,6 +73,22 @@ struct f2fs_device {
  	__le32 total_segments;
  } __packed;

+/* reason of stop_checkpoint */
+enum {
+	STOP_CP_REASON_SHUTDOWN,
+	STOP_CP_REASON_FAULT_INJECT,
+	STOP_CP_REASON_META_PAGE,
+	STOP_CP_REASON_WRITE_FAIL,
+	STOP_CP_REASON_CORRUPTED_SUMMARY,
+	STOP_CP_REASON_UPDATE_INODE,
+	STOP_CP_REASON_FLUSH_FAIL,
+	STOP_CP_REASON_MAX,
+};
+
+#define	MAX_STOP_REASON			32
+
+#define SB_NEED_FSCK			0x00000001	/* need fsck */
+
  struct f2fs_super_block {
  	__le32 magic;			/* Magic Number */
  	__le16 major_ver;		/* Major Version */
@@ -116,7 +132,9 @@ struct f2fs_super_block {
  	__u8 hot_ext_count;		/* # of hot file extension */
  	__le16  s_encoding;		/* Filename charset encoding */
  	__le16  s_encoding_flags;	/* Filename charset encoding flags */
-	__u8 reserved[306];		/* valid reserved region */
+	__le16 s_flags;			/* super block flags */
+	__u8 s_stop_reason[MAX_STOP_REASON];	/* stop checkpoint reason */
+	__u8 reserved[272];		/* valid reserved region */
  	__le32 crc;			/* checksum of superblock */
  } __packed;

-- 
2.36.1



> 
>>
>> Thanks
>>
>>>
>>>> +	}
>>>>    }
>>>>    /*
>>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>>> index dee7b67a17a6..1960a98c7555 100644
>>>> --- a/fs/f2fs/f2fs.h
>>>> +++ b/fs/f2fs/f2fs.h
>>>> @@ -3556,6 +3556,7 @@ int f2fs_enable_quota_files(struct f2fs_sb_info *sbi, bool rdonly);
>>>>    int f2fs_quota_sync(struct super_block *sb, int type);
>>>>    loff_t max_file_blocks(struct inode *inode);
>>>>    void f2fs_quota_off_umount(struct super_block *sb);
>>>> +void f2fs_update_sb_flags(struct f2fs_sb_info *sbi, unsigned int flag);
>>>>    int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover);
>>>>    int f2fs_sync_fs(struct super_block *sb, int sync);
>>>>    int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi);
>>>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>>>> index b8e5fe244596..c99ba840593d 100644
>>>> --- a/fs/f2fs/super.c
>>>> +++ b/fs/f2fs/super.c
>>>> @@ -3846,6 +3846,32 @@ int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover)
>>>>    	return err;
>>>>    }
>>>> +void f2fs_update_sb_flags(struct f2fs_sb_info *sbi, unsigned int flag)
>>>> +{
>>>> +	unsigned short s_flags;
>>>> +	int err;
>>>> +
>>>> +	if (le16_to_cpu(F2FS_RAW_SUPER(sbi)->s_flags) & SB_NEED_FSCK)
>>>> +		return;
>>>> +
>>>> +	f2fs_down_write(&sbi->sb_lock);
>>>> +
>>>> +	s_flags = le16_to_cpu(F2FS_RAW_SUPER(sbi)->s_flags);
>>>> +
>>>> +	if (s_flags & SB_NEED_FSCK)
>>>> +		goto out_unlock;
>>>> +
>>>> +	F2FS_RAW_SUPER(sbi)->s_flags = cpu_to_le16(s_flags | SB_NEED_FSCK);
>>>> +
>>>> +	err = f2fs_commit_super(sbi, false);
>>>> +	if (err) {
>>>> +		f2fs_warn(sbi, "f2fs_commit_super fails to persist flag: %u, err:%d", flag, err);
>>>> +		F2FS_RAW_SUPER(sbi)->s_flags = s_flags;
>>>> +	}
>>>> +out_unlock:
>>>> +	f2fs_up_write(&sbi->sb_lock);
>>>> +}
>>>> +
>>>>    static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
>>>>    {
>>>>    	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
>>>> diff --git a/include/linux/f2fs_fs.h b/include/linux/f2fs_fs.h
>>>> index d445150c5350..124176e2a42c 100644
>>>> --- a/include/linux/f2fs_fs.h
>>>> +++ b/include/linux/f2fs_fs.h
>>>> @@ -73,6 +73,8 @@ struct f2fs_device {
>>>>    	__le32 total_segments;
>>>>    } __packed;
>>>> +#define SB_NEED_FSCK			0x00000001	/* need fsck */
>>>> +
>>>>    struct f2fs_super_block {
>>>>    	__le32 magic;			/* Magic Number */
>>>>    	__le16 major_ver;		/* Major Version */
>>>> @@ -116,7 +118,8 @@ struct f2fs_super_block {
>>>>    	__u8 hot_ext_count;		/* # of hot file extension */
>>>>    	__le16  s_encoding;		/* Filename charset encoding */
>>>>    	__le16  s_encoding_flags;	/* Filename charset encoding flags */
>>>> -	__u8 reserved[306];		/* valid reserved region */
>>>> +	__le16 s_flags;			/* super block flags */
>>>> +	__u8 reserved[304];		/* valid reserved region */
>>>>    	__le32 crc;			/* checksum of superblock */
>>>>    } __packed;
>>>> -- 
>>>> 2.25.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
