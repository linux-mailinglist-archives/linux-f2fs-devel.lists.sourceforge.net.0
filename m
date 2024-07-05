Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D54F9280F3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Jul 2024 05:32:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sPZfu-0003PK-FE;
	Fri, 05 Jul 2024 03:31:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sPZfs-0003PD-Mh
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Jul 2024 03:31:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zfOgl5m+LpHqCrR2p6UqcNvFbndclFJ1VtRZrKN35Cc=; b=dO5c1yudQmzhG3qHZNyT7b83Vl
 F2eS2zqq4vTf+o4LHrjAjvEa2JgFMzjiRh0S3BJ9L0izCJQc7AojSFJ3tEZFbxXqp6KSZL9lXZ7o7
 YyOixSpsBMGU3WlfvZU9o/ES9ZeKBOLECjTwGtVYudM3b2EtgeUiNYpw/Tm38tgD98oo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zfOgl5m+LpHqCrR2p6UqcNvFbndclFJ1VtRZrKN35Cc=; b=R2lFojaqhAgBxK8dIs1rze1Ayd
 juSDAsFwQ8wRvUGifvWInTBpcU0C4cDZu0FO8r+j2oQHewRjZDdN93OQfLVr7bffHMmGvLRQ2UQ7U
 jMB6b2W7yHTP6+Y/jpAQRaVqqqneB9f0cbMK7tfdV5bzN8EQo0aK6Ay1FI4q1kNdvu/s=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sPZft-0005OX-RW for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Jul 2024 03:31:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B24D262929;
 Fri,  5 Jul 2024 03:31:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32267C116B1;
 Fri,  5 Jul 2024 03:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1720150302;
 bh=ewvGDXC/oaZqmx9YwPZQma7o8HkfeSCNzB4HQ1lQ2gg=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Whrx3S79MpSMHptgttRWKx90wBdprGvI0F7s9iuTS1Wz/8FkFIU/zkBAlJ4mNJEaY
 cJXAIfe6SfuJGNV85Jgwp5Zu7RYtZy3nLmvXMCufyDYJ27vYUqNQ7XtKOy6Fe/OoZm
 +qhWSvIJYG2waLz4jEfvWv/V+v6rsTa4IpTspnEJl50+n7zOvivR+Sp2/dKZ7xQs2x
 2BEryv9EoLwuzNMymVZgTCT29YBvhKRSwwCdPwbLmbj8HP9dWv0E2AMZ8pRVK0rg1+
 8sUIHVWt7rbyxV6cJAR5XD/EF+/EP+4wHSmpw58W1eqacSQdb/k0IKUZKF2hMMDVUa
 cHmxRh76OPG4g==
Message-ID: <b8db6396-3f44-4a58-a4ef-c413c4a1ea1b@kernel.org>
Date: Fri, 5 Jul 2024 11:31:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Sunmin Jeong <s_min.jeong@samsung.com>, jaegeuk@kernel.org
References: <CGME20240702120631epcas1p1c7044f77b56009471e2dc07d4e135a99@epcas1p1.samsung.com>
 <20240702120624.476067-1-s_min.jeong@samsung.com>
 <5d8802d6-0132-4986-8238-9385d1758719@kernel.org>
 <000001dace8a$f97d2d30$ec778790$@samsung.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <000001dace8a$f97d2d30$ec778790$@samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/5 11:25, Sunmin Jeong wrote: > Hi Chao Yu, > >>>
 The page cache of the atomic file keeps new data pages which will be >>>
 stored in the COW file. It can also keep old data pages when GCing t [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sPZft-0005OX-RW
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: use meta inode for GC of atomic
 file
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
Cc: 'Sungjong Seo' <sj1557.seo@samsung.com>, daehojeong@google.com,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2024/7/5 11:25, Sunmin Jeong wrote:
> Hi Chao Yu,
> 
>>> The page cache of the atomic file keeps new data pages which will be
>>> stored in the COW file. It can also keep old data pages when GCing the
>>> atomic file. In this case, new data can be overwritten by old data if
>>> a GC thread sets the old data page as dirty after new data page was
>>> evicted.
>>>
>>> Also, since all writes to the atomic file are redirected to COW
>>> inodes, GC for the atomic file is not working well as below.
>>>
>>> f2fs_gc(gc_type=FG_GC)
>>>     - select A as a victim segment
>>>     do_garbage_collect
>>>       - iget atomic file's inode for block B
>>>       move_data_page
>>>         f2fs_do_write_data_page
>>>           - use dn of cow inode
>>>           - set fio->old_blkaddr from cow inode
>>>       - seg_freed is 0 since block B is still valid
>>>     - goto gc_more and A is selected as victim again
>>>
>>> To solve the problem, let's separate GC writes and updates in the
>>> atomic file by using the meta inode for GC writes.
>>>
>>> Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
>>> Cc: stable@vger.kernel.org #v5.19+
>>> Reviewed-by: Sungjong Seo <sj1557.seo@samsung.com>
>>> Reviewed-by: Yeongjin Gil <youngjin.gil@samsung.com>
>>> Signed-off-by: Sunmin Jeong <s_min.jeong@samsung.com>
>>> ---
>>>    fs/f2fs/f2fs.h    | 5 +++++
>>>    fs/f2fs/gc.c      | 6 +++---
>>>    fs/f2fs/segment.c | 4 ++--
>>>    3 files changed, 10 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h index
>>> a000cb024dbe..59c5117e54b1 100644
>>> --- a/fs/f2fs/f2fs.h
>>> +++ b/fs/f2fs/f2fs.h
>>> @@ -4267,6 +4267,11 @@ static inline bool f2fs_post_read_required(struct
>> inode *inode)
>>>    		f2fs_compressed_file(inode);
>>>    }
>>>
>>> +static inline bool f2fs_meta_inode_gc_required(struct inode *inode) {
>>> +	return f2fs_post_read_required(inode) || f2fs_is_atomic_file(inode);
>>> +}
>>> +
>>>    /*
>>>     * compress.c
>>>     */
>>> diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c index
>>> a079eebfb080..136b9e8180a3 100644
>>> --- a/fs/f2fs/gc.c
>>> +++ b/fs/f2fs/gc.c
>>> @@ -1580,7 +1580,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi,
>> struct f2fs_summary *sum,
>>>    			start_bidx = f2fs_start_bidx_of_node(nofs, inode) +
>>>    								ofs_in_node;
>>>
>>> -			if (f2fs_post_read_required(inode)) {
>>> +			if (f2fs_meta_inode_gc_required(inode)) {
>>>    				int err = ra_data_block(inode, start_bidx);
>>>
>>>    				f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
>>> @@ -1631,7 +1631,7 @@ static int gc_data_segment(struct f2fs_sb_info
>>> *sbi, struct f2fs_summary *sum,
>>>
>>>    			start_bidx = f2fs_start_bidx_of_node(nofs, inode)
>>>    								+ ofs_in_node;
>>> -			if (f2fs_post_read_required(inode))
>>> +			if (f2fs_meta_inode_gc_required(inode))
>>>    				err = move_data_block(inode, start_bidx,
>>>    							gc_type, segno, off);
>>>    			else
>>> @@ -1639,7 +1639,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi,
>> struct f2fs_summary *sum,
>>>    								segno, off);
>>>
>>>    			if (!err && (gc_type == FG_GC ||
>>> -					f2fs_post_read_required(inode)))
>>> +					f2fs_meta_inode_gc_required(inode)))
>>>    				submitted++;
>>>
>>>    			if (locked) {
>>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c index
>>> 7e47b8054413..b55fc4bd416a 100644
>>> --- a/fs/f2fs/segment.c
>>> +++ b/fs/f2fs/segment.c
>>> @@ -3823,7 +3823,7 @@ void f2fs_wait_on_block_writeback(struct inode
>> *inode, block_t blkaddr)
>>>    	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>>>    	struct page *cpage;
>>>
>>> -	if (!f2fs_post_read_required(inode))
>>> +	if (!f2fs_meta_inode_gc_required(inode))
>>>    		return;
>>>
>>>    	if (!__is_valid_data_blkaddr(blkaddr))
>>> @@ -3842,7 +3842,7 @@ void f2fs_wait_on_block_writeback_range(struct
>> inode *inode, block_t blkaddr,
>>>    	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
>>>    	block_t i;
>>>
>>> -	if (!f2fs_post_read_required(inode))
>>> +	if (!f2fs_meta_inode_gc_required(inode))
>>>    		return;
>>>
>>>    	for (i = 0; i < len; i++)
>>
>> f2fs_write_single_data_page()
>> ...
>> 		.post_read = f2fs_post_read_required(inode) ? 1 : 0,
>>
>> Do we need to use f2fs_meta_inode_gc_required() here?
>>
>> Thanks,
> 
> As you said, we need to use f2fs_meta_inode_gc_required instead of
> f2fs_post_read_required. Then what about changing the variable name
> "post_read" to another one such as "meta_gc"?

Sunmin, yes, I think so.

Thanks,

> struct f2fs_io_info {
>      unsigned int post_read:1;   /* require post read */
> 
> Thanks,
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
