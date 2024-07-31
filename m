Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F163942903
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Jul 2024 10:18:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sZ4XK-0003DD-RD;
	Wed, 31 Jul 2024 08:18:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sZ4XI-0003CB-SE
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Jul 2024 08:18:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pytFQxHeIR2ohksh8YrUbDKscnh2RqAc5B3mUL9Kvq8=; b=GQc1RxXwd3o1xDhheDPlDWXwZx
 bs/ZwhBnbewi8lATfxx2DGKBNVCFYGBGO++0gay8HpNv8ObAq7sGcrXMvBfwa/TWHbGrAgosJvY9k
 qBIU+tgd+y4z7PrU7Shqx0gzIXJ3N50vNhSOmdcon95wiPxPF8kREQU6XxvVmjwpIXUk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pytFQxHeIR2ohksh8YrUbDKscnh2RqAc5B3mUL9Kvq8=; b=JdzRtFPrfZkrkwz4doPvodZk5g
 qM+G+THJa7EzRshhCR86k+gpjUPK3C9d0qxfJLHIcdUydgQNhgkIxgxtv6Ud/KvbmJNr/xVrzcdtH
 VmwZmOg0okYpDqsN34xeXBp+wenuMoYxlrDG7tIWAkScU3nV0z0H7+6DYDD6UCyxZm0A=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sZ4XI-0007wy-UD for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 31 Jul 2024 08:18:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 936776222A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 31 Jul 2024 08:18:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82951C116B1;
 Wed, 31 Jul 2024 08:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1722413886;
 bh=fZJzL9fO5FzTr6ClXfZRQcuAR19IGhcGGEsag84FQwM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=OYdJdRiu+c2+xwO/QTYLHkuBbR+XEayRGXnShfczbz5tDgJmlQJZ+wkJTxINkzqK2
 ja8b+yeLzDwis8aIgM2gStkLIjIP97Ed78pvp0lyObjadgzok4xCNn4qUSfggohNNa
 GNkZOt0EPP3CDbqYcYT8HlSomGvV/2VNToFMu/C5YIGohWom94O0h1dPD1naZQgVtR
 7OI/ekvds4puMqFklXM5z9+0TUQCQpitrEURoNAgSu4Q/Y4KdWgGJcS8fmYMqh93R9
 wvhIp7sl1RDGNdyENZeUlhvfP0jVRH+OQl17FdBP5PE1bg2TCnttDZur7m9U4b0Ju5
 jmgQU9Yzmp/ww==
Message-ID: <1b1c5fcf-0c71-4c5d-a429-3decc3bb8cb3@kernel.org>
Date: Wed, 31 Jul 2024 16:18:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20240726012204.1306174-1-chao@kernel.org>
 <ZqfCwDcg7nvJPenf@google.com>
 <9e6c0e72-a175-4432-bada-564464698c3f@kernel.org>
 <ZqkUJAMJzW_4ANhY@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ZqkUJAMJzW_4ANhY@google.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2024/7/31 0:26, Jaegeuk Kim wrote: > On 07/30, Chao Yu
 wrote: >> On 2024/7/30 0:26, Jaegeuk Kim wrote: >>> On 07/26, Chao Yu wrote:
 >>>> We should always truncate pagecache while truncating on-disk [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sZ4XI-0007wy-UD
Subject: Re: [f2fs-dev] [PATCH v2 3/4] f2fs: atomic: fix to truncate
 pagecache before on-disk metadata truncation
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

On 2024/7/31 0:26, Jaegeuk Kim wrote:
> On 07/30, Chao Yu wrote:
>> On 2024/7/30 0:26, Jaegeuk Kim wrote:
>>> On 07/26, Chao Yu wrote:
>>>> We should always truncate pagecache while truncating on-disk data.
>>>>
>>>> Fixes: a46bebd502fe ("f2fs: synchronize atomic write aborts")
>>>> Signed-off-by: Chao Yu <chao@kernel.org>
>>>> ---
>>>> v2:
>>>> - fix to use cow_inode instead of inode
>>>>    fs/f2fs/file.c | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>>> index 6c62f76474d1..54886ddcb8ab 100644
>>>> --- a/fs/f2fs/file.c
>>>> +++ b/fs/f2fs/file.c
>>>> @@ -2202,6 +2202,7 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
>>>>    		F2FS_I(fi->cow_inode)->atomic_inode = inode;
>>>>    	} else {
>>>>    		/* Reuse the already created COW inode */
>>>> +		truncate_setsize(fi->cow_inode, 0);
>>>
>>> What if the below truncation failed?
>>
>> What about just dropping page cache and do not set isize to 0?
> 
> Can we also check if there's any dirty page before truncating it?

Sure, so how about this?

		/* Reuse the already created COW inode */
		if (get_dirty_pages(fi->cow_inode)) {
			ret = filemap_write_and_wait(fi->cow_inode->i_mapping);
			if (ret) {
				f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
				goto out;
			}
		}

		truncate_inode_pages(fi->cow_inode->i_mapping, 0);

		ret = f2fs_do_truncate_blocks(fi->cow_inode, 0, true);
		if (ret) {
			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
			goto out;
		}

		i_size_write(fi->cow_inode, 0);

Thanks,

> 
>>
>> Thanks,
>>
>>>
>>>>    		ret = f2fs_do_truncate_blocks(fi->cow_inode, 0, true);
>>>>    		if (ret) {
>>>>    			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
>>>> -- 
>>>> 2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
