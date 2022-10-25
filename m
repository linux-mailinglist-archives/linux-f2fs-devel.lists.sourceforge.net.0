Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1884860C0CA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 03:17:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1on8ZZ-0005pr-5b;
	Tue, 25 Oct 2022 01:17:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1on8ZY-0005pk-3S
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 01:17:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wDDDGhmjvfiqF8xxYsarZUdyGajrrDK3jEjc0tBTsdM=; b=jvDQ6cBIXhl2UYuarmtGCWI6xi
 MTdfaLKTKr2K3dsiFWwfcDpZixcoyjWHtYo34L+Uu0lUrlSsqU8LnGrJNxfluqApjRafDD+fjclNl
 wnq5ZP+GcFh1XQ8lYE5spAyfzklA9gbqBp8wltq/rNzvTHHvwEKLJBwxbc7FgX8yHi4k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wDDDGhmjvfiqF8xxYsarZUdyGajrrDK3jEjc0tBTsdM=; b=bJMz9vqgBziKuJDjEMLL9VXLLI
 gl78oeoT0rKuXPsanukK4deYXbPtA6HBY32bBvlpf0TyVn9CjqvBkJ7LA2sWmnJciOj4CuGr3Z4Ru
 Y1XY3xKPeylN0O3/MJJpkFZQ31d1DvcfWIcfWZeBaAVzWqWSH6+qDMdSQrRyTmNU4s7k=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1on8ZS-00GFXI-QU for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 01:17:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 9C60C616F9;
 Tue, 25 Oct 2022 01:17:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12CC6C433D6;
 Tue, 25 Oct 2022 01:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666660648;
 bh=diD0nztqMx45mp9l0MqBA1E5Hfz+zZa1dzlPrTxaT3w=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ZbDAStCN9MHfPYTkAz142in1TQilyth41CSmAf/fM+et1Ex4s84KGOo3CS8+E6C0M
 jofwvXcAK2Ut3fdIpKKPWu8KGExDTBiEhNjD5LCORNlkhx+le7wNgwIBz9TOGDHikX
 YTy9ASr7cQ0uwl+4cO1oNlRvzHlxPu6qpOE5jijNJLF1XBgfwqGZMKK4xleFFYixY/
 RRgsqppimG8sfgDmmGXmFe+HcvW6AZ0bApKsSbDQdKS3l0SgHFZ0RLRiwMo9R+ucBw
 +ltzH2ZYa5Vz7/2fqlI8dtPUDKapi19r1IVlEzSAeVPGoYZoEYV1eu4hy1UAfPtfM/
 Bn8pWSG8YnWdA==
Message-ID: <07348e12-142b-228c-e5fe-6f4fc9a74421@kernel.org>
Date: Tue, 25 Oct 2022 09:17:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: zhangqilong <zhangqilong3@huawei.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20221018024532.44184-1-zhangqilong3@huawei.com>
 <35811a40-cc69-a50d-b348-62eed5ed1227@kernel.org>
 <1e8cf37922cc4c87aff770449bbba4ab@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1e8cf37922cc4c87aff770449bbba4ab@huawei.com>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/20 15:27, zhangqilong via Linux-f2fs-devel wrote:
 >> On 2022/10/18 10:45, Zhang Qilong wrote: >>> In the following case: >>>
 process 1 process 2 >>> ->open A >>> ->mmap >>> ->read # the fir [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1on8ZS-00GFXI-QU
Subject: Re: [f2fs-dev] =?utf-8?b?562U5aSNOiBbUEFUQ0hdIGYyZnM6IEZpeCBkYXRh?=
 =?utf-8?q?_consistency_in_f2fs=5Fmove=5Ffile=5Frange=28=29?=
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022/10/20 15:27, zhangqilong via Linux-f2fs-devel wrote:
>> On 2022/10/18 10:45, Zhang Qilong wrote:
>>> In the following case:
>>> process 1			process 2
>>>    ->open A
>>>     ->mmap
>>>      ->read # the first time
>>>      				 ->ioctl w/h F2FS_IOC_MOVE_RANGE
>>> 				        	# (range A->B)
>>>      ->read # the second time
>>
>> How about checking B as well? Previous mapped data can still be accessed
>> after F2FS_IOC_MOVE_RANGE?
>>
> 
> Hi
> 
> I have checked B as well. Previous mapped data can't be accessed after
> F2FS_IOC_MOVE_RANGE.

I doubt that we didn't call flush_dcache_page() in below branch, so user may
see stall data after F2FS_IOC_MOVE_RANGE? Am I missing something?

__clone_blkaddrs()
{
...
		} else {
			struct page *psrc, *pdst;

			psrc = f2fs_get_lock_data_page(src_inode,
							src + i, true);
			if (IS_ERR(psrc))
				return PTR_ERR(psrc);
			pdst = f2fs_get_new_data_page(dst_inode, NULL, dst + i,
								true);
			if (IS_ERR(pdst)) {
				f2fs_put_page(psrc, 1);
				return PTR_ERR(pdst);
			}
			memcpy_page(pdst, 0, psrc, 0, PAGE_SIZE);
			set_page_dirty(pdst);
			f2fs_put_page(pdst, 1);
			f2fs_put_page(psrc, 1);

			ret = f2fs_truncate_hole(src_inode,
						src + i, src + i + 1);
			if (ret)
				return ret;
			i++;
		}
...
}

Thanks,

> 
> In addition, this patch could be applied to mainline if possible?
> 
> Thanks
> 
>> Thanks,
>>
>>>
>>> We will read old data at the second time. The root cause is that user
>>> still can see the previous source data after being moved. We fix it by
>>> adding truncating after __exchange_data_block.
>>>
>>> Fixes: 4dd6f977fc77 ("f2fs: support an ioctl to move a range of data
>>> blocks")
>>> Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
>>> ---
>>> v2:
>>> - moving truncating to the range of f2fs_lock_op()
>>>
>>> v3:
>>> - modify the title and commit message
>>> ---
>>>    fs/f2fs/file.c | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c index
>>> 82cda1258227..e9dfa41baf9e 100644
>>> --- a/fs/f2fs/file.c
>>> +++ b/fs/f2fs/file.c
>>> @@ -2824,6 +2824,7 @@ static int f2fs_move_file_range(struct file *file_in,
>> loff_t pos_in,
>>>    			goto out_src;
>>>    	}
>>>
>>> +	filemap_invalidate_lock(src->i_mapping);
>>>    	f2fs_lock_op(sbi);
>>>    	ret = __exchange_data_block(src, dst, pos_in >> F2FS_BLKSIZE_BITS,
>>>    				pos_out >> F2FS_BLKSIZE_BITS,
>>> @@ -2835,7 +2836,9 @@ static int f2fs_move_file_range(struct file *file_in,
>> loff_t pos_in,
>>>    		else if (dst_osize != dst->i_size)
>>>    			f2fs_i_size_write(dst, dst_osize);
>>>    	}
>>> +	truncate_pagecache_range(src, pos_in, pos_in + len - 1);
>>>    	f2fs_unlock_op(sbi);
>>> +	filemap_invalidate_unlock(src->i_mapping);
>>>
>>>    	if (src != dst)
>>>    		f2fs_up_write(&F2FS_I(dst)->i_gc_rwsem[WRITE]);
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
