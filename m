Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B971F81F9BB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Dec 2023 16:34:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rIsOS-00045s-WE;
	Thu, 28 Dec 2023 15:33:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rIsOS-00045i-1J
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Dec 2023 15:33:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fnbK6e3V1ZIOGu8FV/t/V29FKn/SP7f6pz3s+PrwkD8=; b=ilghSMstOb+1guui2BeJJZsihw
 kPQz02Akfe73tlVCANe4MhsI3F1epZmRMaEfufNGD1L369hLfPN56q31y6b25cF1/GiXf5hOgXJqz
 JXeW2p0V5CyF/hUR+skvBRzZgz9XVdQyuoVlmrIgwzirNGA8onfk3BH+b1h7Xhq3sZRg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fnbK6e3V1ZIOGu8FV/t/V29FKn/SP7f6pz3s+PrwkD8=; b=DoWv1jGFjXai26MlaEI9XQG82M
 G/PvkUrxc65lQpOo/OrCLZfjBClT6omTBBLMWMiQRtcs/TCvjCBMCqvcnbZodH/rk16EhGHwATDTz
 JiJLYpBqkvHN2rpg2r9Dtr0gZ0chXUfFZDKNc1Py/IJVp2IK2hPcST8rDnZ1tb5dL1tA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rIsOR-0003v9-Ju for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Dec 2023 15:33:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 97D82B80DE3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 28 Dec 2023 15:33:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9075C433C8;
 Thu, 28 Dec 2023 15:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703777622;
 bh=5yDsdWwaOqkj18xvk96SZBr48BQYi9xMppuyMIAULmU=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=ipbAH/Wrp+ob6Xz/zB6i7pWjWD21xpgwi8d2rw2pVIqCBvEHGuX4I8jd+DJs0lhKG
 h2BBoxE8exC0WvB1G47rLd1XRlQ0YFDzg7Do22yyNTMQ7S9bsXy8UCTTPKZe+f2zmC
 0qmK9RaswodQXcH8JIraTOjvkOkhnDSM8UishL/tahB1aKFDWu8P2U2vxqqRP9XYJs
 OXE46j+jQDiLFoZ3KxrEF/TP9wU73NL2vZW/RsrfDfs4V23kbES0utEbpLxQ7m0eig
 qO/xhxNmiPib6F1CFcxs2wAwaPt7SLC4H6Hi19Hl+mW+s2ZvKbFvaHJLFC/WivTuS8
 BYL6quMrgPTfw==
Message-ID: <19a1340f-0a0d-40a0-9d00-0faf171480f2@kernel.org>
Date: Thu, 28 Dec 2023 23:33:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20231210113547.3412782-1-chao@kernel.org>
 <20231210113547.3412782-5-chao@kernel.org> <ZXeJKCNrxcit0eTC@google.com>
 <5884e300-5384-4a49-9f8d-8cced50f4e6d@kernel.org>
 <ZXjc_I6__dijbwvN@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZXjc_I6__dijbwvN@google.com>
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/12/13 6:21, Jaegeuk Kim wrote: > On 12/12, Chao Yu
 wrote: >> On 2023/12/12 6:11, Jaegeuk Kim wrote: >>> On 12/10, Chao Yu wrote:
 >>>> This patch adds i_size check during compress inode convers [...] 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rIsOR-0003v9-Ju
Subject: Re: [f2fs-dev] [PATCH 5/6] f2fs: fix to restrict condition of
 compress inode conversion
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

On 2023/12/13 6:21, Jaegeuk Kim wrote:
> On 12/12, Chao Yu wrote:
>> On 2023/12/12 6:11, Jaegeuk Kim wrote:
>>> On 12/10, Chao Yu wrote:
>>>> This patch adds i_size check during compress inode conversion in order
>>>> to avoid .page_mkwrite races w/ conversion.
>>>
>>> Which race condition do you see?
>>
>> Something like:
>>
>> - f2fs_setflags_common
>>   - check S_ISREG && F2FS_HAS_BLOCKS
>> 					- mkwrite
>> 					 - f2fs_get_block_locked
>> 					  : update metadata in old inode's disk layout
> 
> Don't we need to prevent setting this for mmapped file?

Oh, we have used i_sem lock to prevent such race case, however
we missed f2fs_disable_compressed_file():

- f2fs_disable_compressed_file
  - check inode_has_data
						- f2fs_file_mmap
						- mkwrite
						 - f2fs_get_block_locked
						 : update metadata in compressed
						   inode's disk layout
  - fi->i_flags &= ~F2FS_COMPR_FL
  - clear_inode_flag(inode, FI_COMPRESSED_FILE);

Thanks,

> 
>>   - set_compress_context
>>
>> Thanks,
>>
>>>
>>>>
>>>> Fixes: 4c8ff7095bef ("f2fs: support data compression")
>>>> Signed-off-by: Chao Yu <chao@kernel.org>
>>>> ---
>>>>    fs/f2fs/f2fs.h | 8 +++++++-
>>>>    fs/f2fs/file.c | 5 ++---
>>>>    2 files changed, 9 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
>>>> index 65294e3b0bef..c9b8a1953913 100644
>>>> --- a/fs/f2fs/f2fs.h
>>>> +++ b/fs/f2fs/f2fs.h
>>>> @@ -4397,13 +4397,19 @@ static inline int set_compress_context(struct inode *inode)
>>>>    #endif
>>>>    }
>>>> +static inline bool inode_has_data(struct inode *inode)
>>>> +{
>>>> +	return (S_ISREG(inode->i_mode) &&
>>>> +		(F2FS_HAS_BLOCKS(inode) || i_size_read(inode)));
>>>> +}
>>>> +
>>>>    static inline bool f2fs_disable_compressed_file(struct inode *inode)
>>>>    {
>>>>    	struct f2fs_inode_info *fi = F2FS_I(inode);
>>>>    	if (!f2fs_compressed_file(inode))
>>>>    		return true;
>>>> -	if (S_ISREG(inode->i_mode) && F2FS_HAS_BLOCKS(inode))
>>>> +	if (inode_has_data(inode))
>>>>    		return false;
>>>>    	fi->i_flags &= ~F2FS_COMPR_FL;
>>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>>> index 1a3c29a9a6a0..8af4b29c3e1a 100644
>>>> --- a/fs/f2fs/file.c
>>>> +++ b/fs/f2fs/file.c
>>>> @@ -1922,8 +1922,7 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
>>>>    			f2fs_down_write(&F2FS_I(inode)->i_sem);
>>>>    			if (!f2fs_may_compress(inode) ||
>>>> -					(S_ISREG(inode->i_mode) &&
>>>> -					F2FS_HAS_BLOCKS(inode))) {
>>>> +					inode_has_data(inode)) {
>>>>    				f2fs_up_write(&F2FS_I(inode)->i_sem);
>>>>    				return -EINVAL;
>>>>    			}
>>>> @@ -3996,7 +3995,7 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
>>>>    		goto out;
>>>>    	}
>>>> -	if (F2FS_HAS_BLOCKS(inode)) {
>>>> +	if (inode_has_data(inode)) {
>>>>    		ret = -EFBIG;
>>>>    		goto out;
>>>>    	}
>>>> -- 
>>>> 2.40.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
