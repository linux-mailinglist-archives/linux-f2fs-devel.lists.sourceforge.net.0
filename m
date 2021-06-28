Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0AB43B65FC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Jun 2021 17:44:33 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lxtR0-0006Ms-FC; Mon, 28 Jun 2021 15:44:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1lxtQz-0006Me-0O
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Jun 2021 15:44:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lY1wnZEDs4yl/jchBSmtjwBXHcgP9IReJQ4lpvifbLs=; b=Uud0hJBhNyEYlNw4O7PN0jYJQv
 NyU7S4C+QuDpsWKj5bEg2lVqyOi6OuLydXgHk9+lITig/rXtY08kA/At+MCYzFEJFyda/jWgLgCQt
 AmAh5P7ZXghXw7XLz6nC5HuFIY4nEe/rGSGqZ2+Fh3wSbfykuEmruyTXbr6JpDwdLWNg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lY1wnZEDs4yl/jchBSmtjwBXHcgP9IReJQ4lpvifbLs=; b=fAWqI/oYFGCbWzFraEmQT514ZA
 GT88OLa4HWVtA5uJxpypfiF4DE98SE+Hl/FE6iB/XYWsr+W7kyezCNZhxO76XxyDNSuWIZeHqd8Dj
 FKluuk9ZKymjd1+g4EjH9b28sdxk7eOJ4oaLKZaq2bHRnrOQBBAar7J8XZp+liF6bK4E=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lxtQq-00048G-Ci
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 28 Jun 2021 15:44:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1C0AA6197F;
 Mon, 28 Jun 2021 15:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1624895056;
 bh=Nc3RW4c4m0ZLIXjyzWfSq3lrPFLR/+B7zK7FDQahSAw=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=lqQu7Pj+l/3+GXkuIpEUuIogvkatxylDG2nAUoAfpakTUIYD2ziZGmr6SXZXy+vJk
 QlGLI0PQHvN7ImEb+MonFR/7itSTtOMJEa9PgoFlPK47cfupAxq7nsWB+5hMMefVzs
 UEl6kNS73LSFj089UAqFQ6giMCN/BVNuBOGAmGmXIa6B09pe+bccDfE79sgSZUnGJc
 HIj4pNpxEsQFexqP6tE8rspApFN6qdGFpkA5ztsxgo21ZDsfO1qLGZeXET7dPMLWij
 UMvIpHR7FTFJMXvccZwoC6d9GreAloJJ7XBabzLUIcI1xTWo+j+wyxWDQh9fYneMPy
 tQ/bCHXGKdLvw==
To: Wang Shilong <wangshilong1991@gmail.com>
References: <20210625125026.5796-1-wangshilong1991@gmail.com>
 <9f6d607a-6b43-a3e2-7002-426f58513f9c@kernel.org>
 <CAP9B-Qn+eV5LSCtfbLAeXZpOJ3UDMzb7a9i6vJwfDN_zfKjHYA@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <c3b7dd84-7c26-78b7-2bac-84cdccc51ee8@kernel.org>
Date: Mon, 28 Jun 2021 23:44:14 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAP9B-Qn+eV5LSCtfbLAeXZpOJ3UDMzb7a9i6vJwfDN_zfKjHYA@mail.gmail.com>
Content-Language: en-US
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lxtQq-00048G-Ci
Subject: Re: [f2fs-dev] [PATCH] f2fs: forbid U32_MAX project ID
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
Cc: Wang Shilong <wshilong@ddn.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/6/28 20:40, Wang Shilong wrote:
> Hi Chao,
> 
> On Mon, Jun 28, 2021 at 8:32 PM Chao Yu <chao@kernel.org> wrote:
>>
>> On 2021/6/25 20:50, Wang Shilong wrote:
>>> From: Wang Shilong <wshilong@ddn.com>
>>>
>>> U32_MAX is reserved for special purpose,
>>> qid_has_mapping() will return false if projid is
>>> 4294967295, dqget() will return NULL for it.
>>>
>>> So U32_MAX is unsupported Project ID, fix to forbid it.
>>>
>>> Signed-off-by: Wang Shilong <wshilong@ddn.com>
>>> ---
>>>    fs/f2fs/file.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
>>> index ceb575f99048..861edf3c01d5 100644
>>> --- a/fs/f2fs/file.c
>>> +++ b/fs/f2fs/file.c
>>> @@ -3066,6 +3066,8 @@ int f2fs_fileattr_set(struct user_namespace *mnt_userns,
>>>        u32 iflags;
>>>        int err;
>>>
>>> +     if (fa->fsx_projid >= U32_MAX)
>>
>> unlikely()? if this is really a corner case.
>>
>>> +             return -EINVAL;
>>>        if (unlikely(f2fs_cp_error(F2FS_I_SB(inode))))
>>>                return -EIO;
>>>        if (!f2fs_is_checkpoint_ready(F2FS_I_SB(inode)))
>>
>> I prefer to check fsx_projid here to keep line with check order in other
>> f2fs interfaces.
> 
> Just sent a v2 which tried to fix the problem in the VFS.

Shilong,

Agreed, and better.

Thanks,

> 
>>
>> Thoughts, Shilong?
>>
>> Thanks,
>>
>>>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
