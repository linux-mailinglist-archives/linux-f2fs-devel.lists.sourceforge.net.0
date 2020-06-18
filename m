Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 673C41FEC14
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jun 2020 09:16:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jlomj-0003tg-1h; Thu, 18 Jun 2020 07:16:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jlomg-0003tY-V6
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 07:16:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3OTBtRULW3GhR+PxOAkycbW/RmyV4thFK+sQUWXO19w=; b=D4BIGKuPN7c0kp1M4vzspPF5nL
 d+/Au4jNri4P5Qooj6KooGF0pIp0FvvZ0VOXUIyB+NPB3GEW+PQNtOwW+Fewn1WortprUgCgNeogf
 6Ug8G0Y2n5rm35l/YvgdH4dXraD2bbzoJU431fJWEPaNxfRN0lMB0VvZxUfp9NG3We1A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3OTBtRULW3GhR+PxOAkycbW/RmyV4thFK+sQUWXO19w=; b=aZOr7HHmN62mUWeLnZucpjUahr
 TbeiqpUqnkPbUFipv84ngMb4DMVjCaCfAt8AYVw0tuu36BuMZaCqNu4JeP3ovjsUupk/hJH/bL05V
 aqOu7351BVKsVgEVv6ZSw7fgcD6gb6DyZWy+nJBBsDyPlgg4A5yDZBfinw5ths/rv1Bo=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jlome-00AHZo-8A
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 18 Jun 2020 07:16:26 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 6612C4F2B6C69AE1E50B;
 Thu, 18 Jun 2020 15:16:15 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.207) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 18 Jun
 2020 15:16:13 +0800
To: Daeho Jeong <daeho43@gmail.com>, <linux-kernel@vger.kernel.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <kernel-team@android.com>
References: <20200616215400.207245-1-daeho43@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <473bd45c-5d1b-58cd-c0c1-aec9347c214e@huawei.com>
Date: Thu, 18 Jun 2020 15:16:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200616215400.207245-1-daeho43@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jlome-00AHZo-8A
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: add F2FS_IOC_SEC_TRIM_FILE ioctl
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/6/17 5:54, Daeho Jeong wrote:
> From: Daeho Jeong <daehojeong@google.com>
> 
> Added a new ioctl to send discard commands or/and zero out
> to selected data area of a regular file for security reason.
> 
> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> ---
>  fs/f2fs/f2fs.h |  15 +++++
>  fs/f2fs/file.c | 179 +++++++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 194 insertions(+)
> 
> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> index c812fb8e2d9c..3763d9e03ca8 100644
> --- a/fs/f2fs/f2fs.h
> +++ b/fs/f2fs/f2fs.h
> @@ -434,6 +434,8 @@ static inline bool __has_cursum_space(struct f2fs_journal *journal,
>  					_IOR(F2FS_IOCTL_MAGIC, 18, __u64)
>  #define F2FS_IOC_RESERVE_COMPRESS_BLOCKS				\
>  					_IOR(F2FS_IOCTL_MAGIC, 19, __u64)
> +#define F2FS_IOC_SEC_TRIM_FILE		_IOW(F2FS_IOCTL_MAGIC, 20,	\
> +						struct f2fs_sectrim_range)
>  
>  #define F2FS_IOC_GET_VOLUME_NAME	FS_IOC_GETFSLABEL
>  #define F2FS_IOC_SET_VOLUME_NAME	FS_IOC_SETFSLABEL
> @@ -453,6 +455,13 @@ static inline bool __has_cursum_space(struct f2fs_journal *journal,
>  #define F2FS_GOING_DOWN_METAFLUSH	0x3	/* going down with meta flush */
>  #define F2FS_GOING_DOWN_NEED_FSCK	0x4	/* going down to trigger fsck */
>  
> +/*
> + * Flags used by F2FS_IOC_SEC_TRIM_FILE
> + */
> +#define F2FS_TRIM_FILE_DISCARD		0x1	/* send discard command */
> +#define F2FS_TRIM_FILE_ZEROOUT		0x2	/* zero out */
> +#define F2FS_TRIM_FILE_MASK		0x3
> +
>  #if defined(__KERNEL__) && defined(CONFIG_COMPAT)
>  /*
>   * ioctl commands in 32 bit emulation
> @@ -488,6 +497,12 @@ struct f2fs_flush_device {
>  	u32 segments;		/* # of segments to flush */
>  };
>  
> +struct f2fs_sectrim_range {
> +	u64 start;
> +	u64 len;
> +	u64 flags;
> +};
> +
>  /* for inline stuff */
>  #define DEF_INLINE_RESERVED_SIZE	1
>  static inline int get_extra_isize(struct inode *inode);
> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> index dfa1ac2d751a..28cebbb10cae 100644
> --- a/fs/f2fs/file.c
> +++ b/fs/f2fs/file.c
> @@ -21,6 +21,7 @@
>  #include <linux/uuid.h>
>  #include <linux/file.h>
>  #include <linux/nls.h>
> +#include <linux/sched/signal.h>
>  
>  #include "f2fs.h"
>  #include "node.h"
> @@ -3749,6 +3750,181 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
>  	return ret;
>  }
>  
> +static int f2fs_secure_erase(struct block_device *bdev, block_t block,
> +					block_t len, u32 flags)
> +{
> +	struct request_queue *q = bdev_get_queue(bdev);
> +	sector_t sector = SECTOR_FROM_BLOCK(block);
> +	sector_t nr_sects = SECTOR_FROM_BLOCK(len);
> +	int ret = 0;
> +
> +	if (!q)
> +		return -ENXIO;
> +
> +	if (flags & F2FS_TRIM_FILE_DISCARD)
> +		ret = blkdev_issue_discard(bdev, sector, nr_sects, GFP_NOFS,
> +						blk_queue_secure_erase(q) ?
> +						BLKDEV_DISCARD_SECURE : 0);
> +
> +	if (!ret && (flags & F2FS_TRIM_FILE_ZEROOUT))
> +		ret = blkdev_issue_zeroout(bdev, sector, nr_sects, GFP_NOFS, 0);
> +
> +	return ret;
> +}
> +
> +static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
> +{
> +	struct inode *inode = file_inode(filp);
> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> +	struct address_space *mapping = inode->i_mapping;
> +	struct block_device *prev_bdev = NULL;
> +	struct f2fs_sectrim_range range;
> +	pgoff_t index, pg_end;
> +	block_t prev_block = 0, len = 0;
> +	u64 end_addr;
> +	bool to_end;
> +	int ret = 0;
> +
> +	if (!(filp->f_mode & FMODE_WRITE))
> +		return -EBADF;
> +
> +	if (copy_from_user(&range, (struct f2fs_sectrim_range __user *)arg,
> +				sizeof(range)))
> +		return -EFAULT;
> +
> +	if (range.flags == 0 || (range.flags & ~F2FS_TRIM_FILE_MASK))
> +		return -EINVAL;
> +
> +	if ((range.flags & F2FS_TRIM_FILE_DISCARD) &&
> +			!f2fs_hw_support_discard(sbi))
> +		return -EOPNOTSUPP;
> +
> +	file_start_write(filp);
> +	inode_lock(inode);
> +
> +	if (!S_ISREG(inode->i_mode) || f2fs_is_atomic_file(inode) ||

Could relocate S_ISREG(inode->i_mode) check out of inode_lock() coverage,
it's not a big deal though.

Reviewed-by: Chao Yu <yuchao0@huawei.com>

Thanks,

> +			f2fs_compressed_file(inode)) {
> +		ret = -EINVAL;
> +		goto err;
> +	}
> +
> +	if (inode->i_size == 0)
> +		goto err;
> +
> +	end_addr = range.start + range.len;
> +	if (end_addr > inode->i_size) {
> +		ret = -EINVAL;
> +		goto err;
> +	}
> +
> +	to_end = (end_addr == inode->i_size);
> +	if (!IS_ALIGNED(range.start, F2FS_BLKSIZE) ||
> +			(!to_end && !IS_ALIGNED(end_addr, F2FS_BLKSIZE))) {
> +		ret = -EINVAL;
> +		goto err;
> +	}
> +
> +	index = F2FS_BYTES_TO_BLK(range.start);
> +	pg_end = DIV_ROUND_UP(end_addr, F2FS_BLKSIZE);
> +
> +	ret = f2fs_convert_inline_inode(inode);
> +	if (ret)
> +		goto err;
> +
> +	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +	down_write(&F2FS_I(inode)->i_mmap_sem);
> +
> +	ret = filemap_write_and_wait_range(mapping, range.start, end_addr - 1);
> +	if (ret)
> +		goto out;
> +
> +	truncate_inode_pages_range(mapping, range.start,
> +			to_end ? -1 : end_addr - 1);
> +
> +	while (index < pg_end) {
> +		struct dnode_of_data dn;
> +		pgoff_t end_offset, count;
> +		int i;
> +
> +		set_new_dnode(&dn, inode, NULL, NULL, 0);
> +		ret = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
> +		if (ret) {
> +			if (ret == -ENOENT) {
> +				index = f2fs_get_next_page_offset(&dn, index);
> +				continue;
> +			}
> +			goto out;
> +		}
> +
> +		end_offset = ADDRS_PER_PAGE(dn.node_page, inode);
> +		count = min(end_offset - dn.ofs_in_node, pg_end - index);
> +		for (i = 0; i < count; i++, dn.ofs_in_node++) {
> +			struct block_device *cur_bdev;
> +			block_t blkaddr = f2fs_data_blkaddr(&dn);
> +
> +			if (!__is_valid_data_blkaddr(blkaddr))
> +				continue;
> +
> +			if (!f2fs_is_valid_blkaddr(sbi, blkaddr,
> +						DATA_GENERIC_ENHANCE)) {
> +				ret = -EFSCORRUPTED;
> +				f2fs_put_dnode(&dn);
> +				goto out;
> +			}
> +
> +			cur_bdev = f2fs_target_device(sbi, blkaddr, NULL);
> +			if (f2fs_is_multi_device(sbi)) {
> +				int di = f2fs_target_device_index(sbi, blkaddr);
> +
> +				blkaddr -= FDEV(di).start_blk;
> +			}
> +
> +			if (len) {
> +				if (prev_bdev == cur_bdev &&
> +					blkaddr == prev_block + len) {
> +					len++;
> +				} else {
> +					ret = f2fs_secure_erase(prev_bdev,
> +						prev_block, len, range.flags);
> +					if (ret) {
> +						f2fs_put_dnode(&dn);
> +						goto out;
> +					}
> +
> +					len = 0;
> +				}
> +			}
> +
> +			if (!len) {
> +				prev_bdev = cur_bdev;
> +				prev_block = blkaddr;
> +				len = 1;
> +			}
> +		}
> +
> +		f2fs_put_dnode(&dn);
> +		index += count;
> +
> +		if (fatal_signal_pending(current)) {
> +			ret = -EINTR;
> +			goto out;
> +		}
> +		cond_resched();
> +	}
> +
> +	if (len)
> +		ret = f2fs_secure_erase(prev_bdev, prev_block, len,
> +				range.flags);
> +out:
> +	up_write(&F2FS_I(inode)->i_mmap_sem);
> +	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> +err:
> +	inode_unlock(inode);
> +	file_end_write(filp);
> +
> +	return ret;
> +}
> +
>  long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  {
>  	if (unlikely(f2fs_cp_error(F2FS_I_SB(file_inode(filp)))))
> @@ -3835,6 +4011,8 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>  		return f2fs_release_compress_blocks(filp, arg);
>  	case F2FS_IOC_RESERVE_COMPRESS_BLOCKS:
>  		return f2fs_reserve_compress_blocks(filp, arg);
> +	case F2FS_IOC_SEC_TRIM_FILE:
> +		return f2fs_sec_trim_file(filp, arg);
>  	default:
>  		return -ENOTTY;
>  	}
> @@ -4004,6 +4182,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>  	case F2FS_IOC_GET_COMPRESS_BLOCKS:
>  	case F2FS_IOC_RELEASE_COMPRESS_BLOCKS:
>  	case F2FS_IOC_RESERVE_COMPRESS_BLOCKS:
> +	case F2FS_IOC_SEC_TRIM_FILE:
>  		break;
>  	default:
>  		return -ENOIOCTLCMD;
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
