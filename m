Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D88382F0D40
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Jan 2021 08:35:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kyrjj-0002xj-VZ; Mon, 11 Jan 2021 07:35:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kyrjj-0002xV-0y
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 07:35:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GKa9DRIfM/eJAifBVr59eeGtwBSXulZ4wRwM6ax0VK0=; b=ccP3uX7Xnmxh/rhd0DIyQxqB8T
 ojPsdTKjk6KscMAFMdCd6FmpApNGuxliftvtM8bz91lRUrxLQDDQcd43+wejqUVRFGmplCBypDXgL
 tdfEFlWfDZ3mLjOrEeCM+5wqdZvfv5hKJYdJx3ceIZtQAJC8uRAHY+uVJ+0ticx2C+Gw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GKa9DRIfM/eJAifBVr59eeGtwBSXulZ4wRwM6ax0VK0=; b=IDkF0eqJ+SNWzWhRMh8KCxKndI
 FbU9JUqTML2qBhWV1SFE5p8l7iT4cavYLmE6lM/sRZ7LiJL9otcD9X/2VPGGY+D/pPMeoq9V6/2I1
 fLgmDyWxKZX1xl3nPrnMSBRpjIC1ZtQ2s54JeJPfIKAbyWOEe1MFRHfxnhH8/4SF+Z0M=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kyrjZ-008Qwj-IW
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 11 Jan 2021 07:35:34 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DDlp94LTtzj4rj;
 Mon, 11 Jan 2021 15:34:25 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.498.0; Mon, 11 Jan
 2021 15:35:08 +0800
To: Chengguang Xu <cgxu519@mykernel.net>, <jaegeuk@kernel.org>,
 <chao@kernel.org>
References: <1610279329-5733-1-git-send-email-cgxu519@mykernel.net>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <cbdc0859-929b-3e8c-a5ed-4f458f6c4bcc@huawei.com>
Date: Mon, 11 Jan 2021 15:35:07 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <1610279329-5733-1-git-send-email-cgxu519@mykernel.net>
Content-Language: en-US
X-Originating-IP: [10.136.114.67]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1kyrjZ-008Qwj-IW
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: using generic_file_llseek()
 instead of generic_file_llseek_size()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/1/10 19:48, Chengguang Xu wrote:
> generic_file_llseek_size() is used for filesystems that have
> a custom maximum size and a custom EOF position. so it's better
> to replace it using generic_file_llseek().

F2FS inode may have different max size, e.g. compressed file have
less blkaddr entries in all its direct-node blocks, result in being
with less max filesize.

I guess we should consider that when checking boundary with s_maxbytes,
so how about using below patch instead:

Subject: [PATCH] f2fs: fix to use per-inode maxbytes

---
  fs/f2fs/data.c  |  2 +-
  fs/f2fs/f2fs.h  |  2 +-
  fs/f2fs/file.c  |  9 ++++++---
  fs/f2fs/super.c | 12 ++++++++----
  4 files changed, 16 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 3cc81e73b372..a534121729f2 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3791,7 +3791,7 @@ static sector_t f2fs_bmap(struct address_space *mapping, sector_t block)
  		filemap_write_and_wait(mapping);

  	/* Block number less than F2FS MAX BLOCKS */
-	if (unlikely(block >= F2FS_I_SB(inode)->max_file_blocks))
+	if (unlikely(block >= max_file_blocks(inode)))
  		goto out;

  	if (f2fs_compressed_file(inode)) {
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 63a8b0adeee6..9eea6f770a51 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1493,7 +1493,6 @@ struct f2fs_sb_info {
  	unsigned int total_sections;		/* total section count */
  	unsigned int total_node_count;		/* total node block count */
  	unsigned int total_valid_node_count;	/* valid node block count */
-	loff_t max_file_blocks;			/* max block index of file */
  	int dir_level;				/* directory level */
  	int readdir_ra;				/* readahead inode in readdir */
  	u64 max_io_bytes;			/* max io bytes to merge IOs */
@@ -3291,6 +3290,7 @@ int f2fs_inode_dirtied(struct inode *inode, bool sync);
  void f2fs_inode_synced(struct inode *inode);
  int f2fs_enable_quota_files(struct f2fs_sb_info *sbi, bool rdonly);
  int f2fs_quota_sync(struct super_block *sb, int type);
+loff_t max_file_blocks(struct inode *inode);
  void f2fs_quota_off_umount(struct super_block *sb);
  int f2fs_commit_super(struct f2fs_sb_info *sbi, bool recover);
  int f2fs_sync_fs(struct super_block *sb, int sync);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 5e7a567b555b..567eba90bd93 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -539,6 +539,9 @@ static loff_t f2fs_llseek(struct file *file, loff_t offset, int whence)
  	struct inode *inode = file->f_mapping->host;
  	loff_t maxbytes = inode->i_sb->s_maxbytes;

+	if (f2fs_compressed_file(inode))
+		maxbytes = max_file_blocks(inode) << F2FS_BLKSIZE_BITS;
+
  	switch (whence) {
  	case SEEK_SET:
  	case SEEK_CUR:
@@ -736,7 +739,7 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)

  	free_from = (pgoff_t)F2FS_BLK_ALIGN(from);

-	if (free_from >= sbi->max_file_blocks)
+	if (free_from >= max_file_blocks(inode))
  		goto free_partial;

  	if (lock)
@@ -2890,7 +2893,7 @@ static int f2fs_ioc_defragment(struct file *filp, unsigned long arg)
  		return -EINVAL;

  	if (unlikely((range.start + range.len) >> PAGE_SHIFT >
-					sbi->max_file_blocks))
+					max_file_blocks(inode)))
  		return -EINVAL;

  	err = mnt_want_write_file(filp);
@@ -3458,7 +3461,7 @@ int f2fs_precache_extents(struct inode *inode)
  	map.m_next_extent = &m_next_extent;
  	map.m_seg_type = NO_CHECK_TYPE;
  	map.m_may_create = false;
-	end = F2FS_I_SB(inode)->max_file_blocks;
+	end = max_file_blocks(inode);

  	while (map.m_lblk < end) {
  		map.m_len = end - map.m_lblk;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index f871aa718eaa..113c88af665e 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2786,10 +2786,10 @@ static const struct export_operations f2fs_export_ops = {
  	.get_parent = f2fs_get_parent,
  };

-static loff_t max_file_blocks(void)
+loff_t max_file_blocks(struct inode *inode)
  {
  	loff_t result = 0;
-	loff_t leaf_count = DEF_ADDRS_PER_BLOCK;
+	loff_t leaf_count;

  	/*
  	 * note: previously, result is equal to (DEF_ADDRS_PER_INODE -
@@ -2798,6 +2798,11 @@ static loff_t max_file_blocks(void)
  	 * result as zero.
  	 */

+	if (inode && f2fs_compressed_file(inode))
+		leaf_count = ADDRS_PER_BLOCK(inode);
+	else
+		leaf_count = DEF_ADDRS_PER_BLOCK;
+
  	/* two direct node blocks */
  	result += (leaf_count * 2);

@@ -3685,8 +3690,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
  	if (err)
  		goto free_options;

-	sbi->max_file_blocks = max_file_blocks();
-	sb->s_maxbytes = sbi->max_file_blocks <<
+	sb->s_maxbytes = max_file_blocks(NULL) <<
  				le32_to_cpu(raw_super->log_blocksize);
  	sb->s_max_links = F2FS_LINK_MAX;

-- 
2.29.2



> 
> Signed-off-by: Chengguang Xu <cgxu519@mykernel.net>
> ---
>   fs/f2fs/file.c | 6 +-----
>   1 file changed, 1 insertion(+), 5 deletions(-)
> 
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index f585545..2ca22ea 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -480,15 +480,11 @@ static loff_t f2fs_seek_block(struct file *file, loff_t offset, int whence)
>   
>   static loff_t f2fs_llseek(struct file *file, loff_t offset, int whence)
>   {
> -	struct inode *inode = file->f_mapping->host;
> -	loff_t maxbytes = inode->i_sb->s_maxbytes;
> -
>   	switch (whence) {
>   	case SEEK_SET:
>   	case SEEK_CUR:
>   	case SEEK_END:
> -		return generic_file_llseek_size(file, offset, whence,
> -						maxbytes, i_size_read(inode));
> +		return generic_file_llseek(file, offset, whence);
>   	case SEEK_DATA:
>   	case SEEK_HOLE:
>   		if (offset < 0)
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
