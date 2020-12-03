Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 897B52CCF56
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Dec 2020 07:32:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kki9s-0005BY-Kv; Thu, 03 Dec 2020 06:32:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kkhzg-0003yx-7g
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 06:21:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:CC:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IOsuQ8SWGIS2kqdSD0hIxOxfwfwGVrAG/grdvgdD36I=; b=IVt/kWObVqkUllE+XyLCacR0GM
 cUG/TqCAGC1x7wyKBDE0wH0PK5hUlE67LedelRRpHOjTtgoWSDi7V0XB9PvimVAxxzDfQEyaOrhdC
 V7JMUhvrHOBT2DfG+urwq6jfuz5E3DqXbnEKUuEyfaMvkMcpB+ULI9e5IhtEf0JCPq80=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:CC:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IOsuQ8SWGIS2kqdSD0hIxOxfwfwGVrAG/grdvgdD36I=; b=PpjEAAZBTSKFH4vmLvie1t9EpA
 zmGvxd0SSXJiZjSrkXXAi5wL/4mpXbUS7R1FXQ7KOobr6uvdI2uaIalPMl6mRFSsrMovvA+oBYoJU
 wsnY9RvvXNPXo1fUMvOEtVN54wVlrOkuSivelVohZGx0bVHCZqwVfaSGK5ZnC5vP6afU=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kkhzV-00HCH0-O1
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 06:21:32 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4Cmm1F4g79zhYDB;
 Thu,  3 Dec 2020 14:20:49 +0800 (CST)
Received: from [10.136.114.67] (10.136.114.67) by smtp.huawei.com
 (10.3.19.204) with Microsoft SMTP Server (TLS) id 14.3.487.0; Thu, 3 Dec 2020
 14:21:06 +0800
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20201030041035.394565-1-daeho43@gmail.com>
 <20201030041035.394565-2-daeho43@gmail.com>
 <dcf074e3-821c-6858-eb17-63dcc05e7039@huawei.com>
 <X8h6XK6cYwXqGnV7@google.com> <X8iAyiB0RIgm/EgB@google.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <4ce24298-a531-723d-77a8-1a5eda181869@huawei.com>
Date: Thu, 3 Dec 2020 14:21:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <X8iAyiB0RIgm/EgB@google.com>
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
X-Headers-End: 1kkhzV-00HCH0-O1
Subject: Re: [f2fs-dev] [PATCH v7 2/2] f2fs: add
 F2FS_IOC_SET_COMPRESS_OPTION ioctl
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
Cc: linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com,
 Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2020/12/3 14:08, Jaegeuk Kim wrote:
> On 12/02, Jaegeuk Kim wrote:
>> On 12/03, Chao Yu wrote:
>>> Jaegeuk, not sure, is it too late to merge this cleanup into original patch?
>>
>> Let me merge this on top of tree. Thanks. :)
> 
> I integrated this into the original patch since I had to revise this commit. :(
> ("f2fs: avoid race condition for shinker count")

It's fine to me. :)

Thanks,

> 
>>
>>>
>>>  From a5c63ec58e0cda6eb5d186b46942eea46422b7a9 Mon Sep 17 00:00:00 2001
>>> From: Chao Yu <yuchao0@huawei.com>
>>> Date: Thu, 3 Dec 2020 10:04:26 +0800
>>> Subject: [PATCH] f2fs: remove f2fs_is_compress_algorithm_valid() for cleanup
>>>
>>> No logic changes.
>>>
>>> Signed-off-by: Chao Yu <yuchao0@huawei.com>
>>> ---
>>>   fs/f2fs/compress.c | 5 -----
>>>   fs/f2fs/f2fs.h     | 5 -----
>>>   fs/f2fs/file.c     | 2 +-
>>>   3 files changed, 1 insertion(+), 11 deletions(-)
>>>
>>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>>> index dfadbc78946c..869b047a4801 100644
>>> --- a/fs/f2fs/compress.c
>>> +++ b/fs/f2fs/compress.c
>>> @@ -574,11 +574,6 @@ bool f2fs_is_compress_backend_ready(struct inode *inode)
>>>   	return f2fs_cops[F2FS_I(inode)->i_compress_algorithm];
>>>   }
>>>
>>> -bool f2fs_is_compress_algorithm_valid(unsigned char algorithm)
>>> -{
>>> -	return f2fs_cops[algorithm] != NULL;
>>> -}
>>> -
>>>   static mempool_t *compress_page_pool;
>>>   static int num_compress_pages = 512;
>>>   module_param(num_compress_pages, uint, 0444);
>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>> index b70c8d553439..17b45c2d2b04 100644
>>> --- a/fs/f2fs/f2fs.h
>>> +++ b/fs/f2fs/f2fs.h
>>> @@ -3882,7 +3882,6 @@ bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
>>>   int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock);
>>>   void f2fs_compress_write_end_io(struct bio *bio, struct page *page);
>>>   bool f2fs_is_compress_backend_ready(struct inode *inode);
>>> -bool f2fs_is_compress_algorithm_valid(unsigned char algorithm);
>>>   int f2fs_init_compress_mempool(void);
>>>   void f2fs_destroy_compress_mempool(void);
>>>   void f2fs_do_decompress_pages(struct decompress_io_ctx *dic, bool verity);
>>> @@ -3927,10 +3926,6 @@ static inline bool f2fs_is_compress_backend_ready(struct inode *inode)
>>>   	/* not support compression */
>>>   	return false;
>>>   }
>>> -static inline bool f2fs_is_compress_algorithm_valid(unsigned char algorithm)
>>> -{
>>> -	return false;
>>> -}
>>>   static inline struct page *f2fs_compress_control_page(struct page *page)
>>>   {
>>>   	WARN_ON_ONCE(1);
>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>> index 300355fe25f0..0453b441228d 100644
>>> --- a/fs/f2fs/file.c
>>> +++ b/fs/f2fs/file.c
>>> @@ -4016,7 +4016,7 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
>>>   	F2FS_I(inode)->i_cluster_size = 1 << option.log_cluster_size;
>>>   	f2fs_mark_inode_dirty_sync(inode, true);
>>>
>>> -	if (!f2fs_is_compress_algorithm_valid(option.algorithm))
>>> +	if (!f2fs_is_compress_backend_ready(inode))
>>>   		f2fs_warn(sbi, "compression algorithm is successfully set, "
>>>   			"but current kernel doesn't support this algorithm.");
>>>   out:
>>> -- 
>>> 2.26.2
>>>
>>>
>>>
>>>
>>>
>>> On 2020/10/30 12:10, Daeho Jeong wrote:
>>>> From: Daeho Jeong <daehojeong@google.com>
>>>>
>>>> Added a new F2FS_IOC_SET_COMPRESS_OPTION ioctl to change file
>>>> compression option of a file.
>>>>
>>>> struct f2fs_comp_option {
>>>>       u8 algorithm;         => compression algorithm
>>>>                             => 0:lzo, 1:lz4, 2:zstd, 3:lzorle
>>>>       u8 log_cluster_size;  => log scale cluster size
>>>>                             => 2 ~ 8
>>>> };
>>>>
>>>> struct f2fs_comp_option option;
>>>>
>>>> option.algorithm = 1;
>>>> option.log_cluster_size = 7;
>>>>
>>>> ioctl(fd, F2FS_IOC_SET_COMPRESS_OPTION, &option);
>>>>
>>>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
>>>> ---
>>>>
>>>> v6: changed the function name of checking compression algorithm validity.
>>>> v5: allowed to set algorithm which is not currently enabled by kernel.
>>>> v4: changed commit message.
>>>> v3: changed the error number more specific.
>>>>       folded in fix for build breakage reported by kernel test robot
>>>>       <lkp@intel.com> and Dan Carpenter <dan.carpenter@oracle.com>.
>>>> v2: added ioctl description.
>>>> ---
>>>>    fs/f2fs/compress.c |  5 +++++
>>>>    fs/f2fs/f2fs.h     |  7 ++++++
>>>>    fs/f2fs/file.c     | 54 ++++++++++++++++++++++++++++++++++++++++++++++
>>>>    3 files changed, 66 insertions(+)
>>>>
>>>> diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
>>>> index 7895186cc765..b0144670d320 100644
>>>> --- a/fs/f2fs/compress.c
>>>> +++ b/fs/f2fs/compress.c
>>>> @@ -514,6 +514,11 @@ bool f2fs_is_compress_backend_ready(struct inode *inode)
>>>>    	return f2fs_cops[F2FS_I(inode)->i_compress_algorithm];
>>>>    }
>>>> +bool f2fs_is_compress_algorithm_valid(unsigned char algorithm)
>>>> +{
>>>> +	return f2fs_cops[algorithm] != NULL;
>>>> +}
>>>> +
>>>>    static mempool_t *compress_page_pool;
>>>>    static int num_compress_pages = 512;
>>>>    module_param(num_compress_pages, uint, 0444);
>>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>>> index a33c90cf979b..70a8a2196888 100644
>>>> --- a/fs/f2fs/f2fs.h
>>>> +++ b/fs/f2fs/f2fs.h
>>>> @@ -435,6 +435,8 @@ static inline bool __has_cursum_space(struct f2fs_journal *journal,
>>>>    						struct f2fs_sectrim_range)
>>>>    #define F2FS_IOC_GET_COMPRESS_OPTION	_IOR(F2FS_IOCTL_MAGIC, 21,	\
>>>>    						struct f2fs_comp_option)
>>>> +#define F2FS_IOC_SET_COMPRESS_OPTION	_IOW(F2FS_IOCTL_MAGIC, 22,	\
>>>> +						struct f2fs_comp_option)
>>>>    /*
>>>>     * should be same as XFS_IOC_GOINGDOWN.
>>>> @@ -3915,6 +3917,7 @@ bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
>>>>    int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock);
>>>>    void f2fs_compress_write_end_io(struct bio *bio, struct page *page);
>>>>    bool f2fs_is_compress_backend_ready(struct inode *inode);
>>>> +bool f2fs_is_compress_algorithm_valid(unsigned char algorithm);
>>>>    int f2fs_init_compress_mempool(void);
>>>>    void f2fs_destroy_compress_mempool(void);
>>>>    void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity);
>>>> @@ -3945,6 +3948,10 @@ static inline bool f2fs_is_compress_backend_ready(struct inode *inode)
>>>>    	/* not support compression */
>>>>    	return false;
>>>>    }
>>>> +static inline bool f2fs_is_compress_algorithm_valid(unsigned char algorithm)
>>>> +{
>>>> +	return false;
>>>> +}
>>>>    static inline struct page *f2fs_compress_control_page(struct page *page)
>>>>    {
>>>>    	WARN_ON_ONCE(1);
>>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>>> index bd52df84219d..be56702e4939 100644
>>>> --- a/fs/f2fs/file.c
>>>> +++ b/fs/f2fs/file.c
>>>> @@ -3963,6 +3963,57 @@ static int f2fs_ioc_get_compress_option(struct file *filp, unsigned long arg)
>>>>    	return 0;
>>>>    }
>>>> +static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
>>>> +{
>>>> +	struct inode *inode = file_inode(filp);
>>>> +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>>>> +	struct f2fs_comp_option option;
>>>> +	int ret = 0;
>>>> +
>>>> +	if (!f2fs_sb_has_compression(sbi))
>>>> +		return -EOPNOTSUPP;
>>>> +
>>>> +	if (!(filp->f_mode & FMODE_WRITE))
>>>> +		return -EBADF;
>>>> +
>>>> +	if (copy_from_user(&option, (struct f2fs_comp_option __user *)arg,
>>>> +				sizeof(option)))
>>>> +		return -EFAULT;
>>>> +
>>>> +	if (!f2fs_compressed_file(inode) ||
>>>> +			option.log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
>>>> +			option.log_cluster_size > MAX_COMPRESS_LOG_SIZE ||
>>>> +			option.algorithm >= COMPRESS_MAX)
>>>> +		return -EINVAL;
>>>> +
>>>> +	file_start_write(filp);
>>>> +	inode_lock(inode);
>>>> +
>>>> +	if (f2fs_is_mmap_file(inode) || get_dirty_pages(inode)) {
>>>> +		ret = -EBUSY;
>>>> +		goto out;
>>>> +	}
>>>> +
>>>> +	if (inode->i_size != 0) {
>>>> +		ret = -EFBIG;
>>>> +		goto out;
>>>> +	}
>>>> +
>>>> +	F2FS_I(inode)->i_compress_algorithm = option.algorithm;
>>>> +	F2FS_I(inode)->i_log_cluster_size = option.log_cluster_size;
>>>> +	F2FS_I(inode)->i_cluster_size = 1 << option.log_cluster_size;
>>>> +	f2fs_mark_inode_dirty_sync(inode, true);
>>>> +
>>>> +	if (!f2fs_is_compress_algorithm_valid(option.algorithm))
>>>> +		f2fs_warn(sbi, "compression algorithm is successfully set, "
>>>> +			"but current kernel doesn't support this algorithm.");
>>>> +out:
>>>> +	inode_unlock(inode);
>>>> +	file_end_write(filp);
>>>> +
>>>> +	return ret;
>>>> +}
>>>> +
>>>>    long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>>>>    {
>>>>    	if (unlikely(f2fs_cp_error(F2FS_I_SB(file_inode(filp)))))
>>>> @@ -4053,6 +4104,8 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>>>>    		return f2fs_sec_trim_file(filp, arg);
>>>>    	case F2FS_IOC_GET_COMPRESS_OPTION:
>>>>    		return f2fs_ioc_get_compress_option(filp, arg);
>>>> +	case F2FS_IOC_SET_COMPRESS_OPTION:
>>>> +		return f2fs_ioc_set_compress_option(filp, arg);
>>>>    	default:
>>>>    		return -ENOTTY;
>>>>    	}
>>>> @@ -4224,6 +4277,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
>>>>    	case F2FS_IOC_RESERVE_COMPRESS_BLOCKS:
>>>>    	case F2FS_IOC_SEC_TRIM_FILE:
>>>>    	case F2FS_IOC_GET_COMPRESS_OPTION:
>>>> +	case F2FS_IOC_SET_COMPRESS_OPTION:
>>>>    		break;
>>>>    	default:
>>>>    		return -ENOIOCTLCMD;
>>>>
>>
>>
>> _______________________________________________
>> Linux-f2fs-devel mailing list
>> Linux-f2fs-devel@lists.sourceforge.net
>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
