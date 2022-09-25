Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C2A775E938A
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 25 Sep 2022 15:59:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ocS9k-0002rH-W5;
	Sun, 25 Sep 2022 13:59:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ocS9j-0002qq-CF
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 25 Sep 2022 13:59:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9QCw9eWqkOVG++MmuqXn5QU5tGCZwmG/gFwQyiJbArA=; b=Oa+JAdbFcOlUYXgvE8aRzmb2Oy
 rYwanbocfgf2HI81ZKib9Gug+wGA1xcavjxeiSBHgDugZqpL5AEFxrvyorNkzcFvhguJXUo3/uDXX
 CRzMLwJiIDfj84BhDcwbtNFnEvsXqsgdH6Ja7nAW0X+/cVpdnIH4StMXE8hBDsLFq77s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9QCw9eWqkOVG++MmuqXn5QU5tGCZwmG/gFwQyiJbArA=; b=ZoyqtZwDWHUL6Q4pxfJs6xMd7x
 8hgTc/n+BGdL6YSskNt9BO//hBPVJEcyqhe4gZHKS6Rk248rk4tO7Est2QZkObx+L4R6brasQoOUY
 j60lDbwcsjQG1OUYl5tTa6KGk97yg+fPpPGIDB0PNKP4klE5sWtO+nGBrhB4GtvZMXsQ=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ocS9c-0006Qw-MN for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 25 Sep 2022 13:58:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 37AA4B80C74
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 25 Sep 2022 13:58:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48B1BC433D6;
 Sun, 25 Sep 2022 13:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664114317;
 bh=MGwUQiUtZoWNbJEdflLjTSXHBOjjDadhwqToTMxsbm4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=p4PCxVZpotAhSGpe00qAsg2OTZlWqQkiD1+hylwC5zFJyA9yN8OqxE0AUBT0n/87c
 TrbKDlW9iMQJjJbUbu1zmCMKOyzjrVHWmUHx6gA1LQAvdO3uFcvLf0i+lDAxMcjC+/
 aHWEkAJyzH+pOwVxcCzv9uOH7j5AuIVu8Vty0gpTgRYDtCZaIEelUCr/Sq0+BKVA3J
 H671FLnOHWB31OQiN7pVB5b+e7f90+pX37w8TPKLQDrcvW144e1HIlNAcwfWSLkpEA
 +A2EmJzKcwGs0Tcz4A+QOHmSUVCk8tTmoAt1f55//5hFWVRajficegb0naHfUAZmJB
 z4w04Pn7ZOrrA==
Message-ID: <86b63dd6-ebe6-0d1a-5494-a8c839e483fc@kernel.org>
Date: Sun, 25 Sep 2022 21:58:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Content-Language: en-US
To: Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220913074812.2300528-1-chao@kernel.org>
 <44a1eca6-568b-a752-ef01-06de489eb466@kernel.org>
 <YyylXIEhaearlfEf@google.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <YyylXIEhaearlfEf@google.com>
X-Spam-Score: -9.0 (---------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/9/23 2:11, Jaegeuk Kim wrote: > I modified a bit.
 > >
 https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev-test&id=a9a1592fa175baaaae43f54f175a972757c47919
 Fine to me. :) 
 Content analysis details:   (-9.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
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
X-Headers-End: 1ocS9c-0006Qw-MN
Subject: Re: [f2fs-dev] [PATCH v3] f2fs: fix to detect corrupted meta ino
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

On 2022/9/23 2:11, Jaegeuk Kim wrote:
> I modified a bit.
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?h=dev-test&id=a9a1592fa175baaaae43f54f175a972757c47919

Fine to me. :)

Thanks,

> 
> Thanks,
> 
> On 09/22, Chao Yu wrote:
>> Ping,
>>
>> On 2022/9/13 15:48, Chao Yu wrote:
>>> It is possible that ino of dirent or orphan inode is corrupted in a
>>> fuzzed image, occasionally, if corrupted ino is equal to meta ino:
>>> meta_ino, node_ino or compress_ino, caller of f2fs_iget() from below
>>> call paths will get meta inode directly, it's not allowed, let's
>>> add sanity check to detect such cases.
>>>
>>> case #1
>>> - recover_dentry
>>>    - __f2fs_find_entry
>>>    - f2fs_iget_retry
>>>
>>> case #2
>>> - recover_orphan_inode
>>>    - f2fs_iget_retry
>>>
>>> Signed-off-by: Chao Yu <chao@kernel.org>
>>> ---
>>> v3:
>>> - update commit title/message
>>> - change logic inside f2fs_iget() rather than its caller
>>>    fs/f2fs/inode.c | 25 ++++++++++++++++++-------
>>>    1 file changed, 18 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
>>> index cde0a3dc80c3..1baac6056733 100644
>>> --- a/fs/f2fs/inode.c
>>> +++ b/fs/f2fs/inode.c
>>> @@ -487,6 +487,12 @@ static int do_read_inode(struct inode *inode)
>>>    	return 0;
>>>    }
>>> +static bool is_meta_ino(struct f2fs_sb_info *sbi, unsigned int ino)
>>> +{
>>> +	return ino == F2FS_NODE_INO(sbi) || ino == F2FS_META_INO(sbi) ||
>>> +		ino == F2FS_COMPRESS_INO(sbi);
>>> +}
>>> +
>>>    struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
>>>    {
>>>    	struct f2fs_sb_info *sbi = F2FS_SB(sb);
>>> @@ -497,17 +503,22 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
>>>    	if (!inode)
>>>    		return ERR_PTR(-ENOMEM);
>>> +	if (is_meta_ino(sbi, ino)) {
>>> +		if (!(inode->i_state & I_NEW)) {
>>> +			f2fs_err(sbi, "detect corrupted inode no:%lu, run fsck to repair", ino);
>>> +			set_sbi_flag(sbi, SBI_NEED_FSCK);
>>> +			ret = -EFSCORRUPTED;
>>> +			trace_f2fs_iget_exit(inode, ret);
>>> +			iput(inode);
>>> +			return ERR_PTR(ret);
>>> +		}
>>> +		goto make_now;
>>> +	}
>>> +
>>>    	if (!(inode->i_state & I_NEW)) {
>>>    		trace_f2fs_iget(inode);
>>>    		return inode;
>>>    	}
>>> -	if (ino == F2FS_NODE_INO(sbi) || ino == F2FS_META_INO(sbi))
>>> -		goto make_now;
>>> -
>>> -#ifdef CONFIG_F2FS_FS_COMPRESSION
>>> -	if (ino == F2FS_COMPRESS_INO(sbi))
>>> -		goto make_now;
>>> -#endif
>>>    	ret = do_read_inode(inode);
>>>    	if (ret)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
