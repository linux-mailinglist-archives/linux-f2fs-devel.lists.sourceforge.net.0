Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DFA6A070A2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jan 2025 10:02:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tVoQk-0007K3-VZ;
	Thu, 09 Jan 2025 09:02:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tVoQi-0007J5-8v
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Jan 2025 09:02:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vhS3LHc1JIJita/BWNfIWOOjatAWz4Z4eAAwUgqAW5k=; b=ZPEoKmX6UiNxs8WkcDLAjaYtyP
 U2fKSY/k4a5DI/LMU/XlJoaM1MA8X7TAfOfIbPP4yaVxnLF33idoVXkpweRn/1PEJr7zNJmScq8wU
 v+2sMkazESZpz1N8quM7Pm9jv8Yu+R53uPFjKI+lGtkIDT+7DR+OKASz+SGVVP8lYEjM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vhS3LHc1JIJita/BWNfIWOOjatAWz4Z4eAAwUgqAW5k=; b=hkJSWkntIOg7AGrWV0oMlmE3ua
 REmlG204lnVbEp36g6Izzqrdw4LC/YMJFmi8NCZUmJ2fXxkxoKhWQDKsMa1r5BFStOjFwHJPjYRrZ
 aIKn9f/l2qBWWik5hq3Bt51sSAXdev5kZtm8KbiuYykV6ApUefy44pQJeapmBBZXsELo=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tVoQi-0002Y1-66 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Jan 2025 09:02:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DC145A4145C;
 Thu,  9 Jan 2025 09:00:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21DDEC4CED2;
 Thu,  9 Jan 2025 09:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1736413325;
 bh=L7LvL2tSo6jWe5a0UOxf4F5AmXJpLLXOk6B1qOWWyVY=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Vb3ZyM16hycfV0urU8ENHsRKuBqVVEQb8QehUWL0Ew22d1lj7OmUJe4qPaj6RBWmA
 ziKFteqife6TYai2nC2QdM5yJL0EjQWkbzeHYOT6thHA9je9xQR9+qveSziX2Pf5Q9
 kQ7t5zbSx7c5Fxrj/28XJahKBaF+puBO9EQdcvByxj9Ea/3N+qPtZ1iX/Wu8rRUy6t
 Gm0FkINMhxIBiGan5r0DCvuUlc2cxqTOCIUHxZxB2uvHJVh3LanDhFpfI9d7k+vZlE
 zS0KUNZukgesTZywYIJ9erXW0mXDNKV3V3sCb60eupO82sjPuR1bDGf1OWgSy2pCKC
 IF44RqPu5jGVQ==
Message-ID: <08098e46-0468-4fec-b2fb-9ea7414eaea0@kernel.org>
Date: Thu, 9 Jan 2025 17:02:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: qasdev <qasdev00@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <Z36iKVJjiufq_Q3x@qasdev.system>
Content-Language: en-US
In-Reply-To: <Z36iKVJjiufq_Q3x@qasdev.system>
X-Spam-Score: -2.9 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/9/25 00:23, qasdev wrote: > On Wed, Jan 08,
 2025 at 07:44:03PM
 +0800, Chao Yu wrote: >> Hi Qasim, >> >> On 2025/1/8 07:03, qasdev wrote:
 >>> In f2fs_getxattr(), the function lookup_all_xattrs() a [...] 
 Content analysis details:   (-2.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tVoQi-0002Y1-66
Subject: Re: [f2fs-dev] [PATCH] f2fs: Fix slab-out-of-bounds Read KASAN bug
 in f2fs_getxattr()
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 1/9/25 00:23, qasdev wrote:
> On Wed, Jan 08, 2025 at 07:44:03PM +0800, Chao Yu wrote:
>> Hi Qasim,
>>
>> On 2025/1/8 07:03, qasdev wrote:
>>> In f2fs_getxattr(), the function lookup_all_xattrs() allocates a 12-byte
>>> (base_size) buffer for an inline extended attribute. However, when
>>> __find_inline_xattr() calls __find_xattr(), it uses the macro
>>> "list_for_each_xattr(entry, addr)", which starts by calling
>>> XATTR_FIRST_ENTRY(addr). This skips a 24-byte struct f2fs_xattr_header
>>> at the beginning of the buffer, causing an immediate out-of-bounds read
>>> in a 12-byte allocation. The subsequent !IS_XATTR_LAST_ENTRY(entry)
>>> check then dereferences memory outside the allocated region, triggering
>>> the slab-out-of bounds read.
>>>
>>> This patch prevents the out-of-bounds read by adding a check to bail
>>> out early if inline_size is too small and does not account for the
>>> header plus the 4-byte value that IS_XATTR_LAST_ENTRY reads.
>>
>> Thank you very much for analyzing this issue, the root cause you figured out
>> makes sense to me.
>>
>> Can you please check the patch in below link? It seems it can fix this issue
>> as well? IIUC.
>>
>> https://lore.kernel.org/linux-f2fs-devel/20241216134600.8308-1-chao@kernel.org/
>>
>> Thanks,
> 
> Hi Chao,
> 
> I tested the patch you linked on my machine and with syzbot, and both tests succeeded. The patch you linked works very well.

Hi Qasdev,

Thanks for the test!

>   
> Here is the link to the results of the testing of both patches: https://syzkaller.appspot.com/bug?extid=f5e74075e096e757bdbf
> 
> Would it be possible to include me in the Tested-by header and any other contribution acknowledgments you feel appropriate?
 > > Thanks!
> 
> Best regards,
> Qasim
> 
>>
>>>
>>> Reported-by: syzbot <syzbot+f5e74075e096e757bdbf@syzkaller.appspotmail.com>
>>> Closes: https://syzkaller.appspot.com/bug?extid=f5e74075e096e757bdbf
>>> Tested-by: syzbot <syzbot+f5e74075e096e757bdbf@syzkaller.appspotmail.com>
>>> Tested-by: Qasim Ijaz <qasdev00@gmail.com>

IMO, it will be better to quoted your comment description and all above 
tags into the patch, what do you think?

Thanks,

>>> Fixes: 388a2a0640e1 ("f2fs: remove redundant sanity check in sanity_check_inode()")
>>> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
>>> ---
>>>    fs/f2fs/xattr.c | 3 +++
>>>    1 file changed, 3 insertions(+)
>>>
>>> diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
>>> index 3f3874943679..cf82646bca0e 100644
>>> --- a/fs/f2fs/xattr.c
>>> +++ b/fs/f2fs/xattr.c
>>> @@ -329,6 +329,9 @@ static int lookup_all_xattrs(struct inode *inode, struct page *ipage,
>>>    	if (!xnid && !inline_size)
>>>    		return -ENODATA;
>>> +	if (inline_size < sizeof(struct f2fs_xattr_header) + sizeof(__u32))
>>> +		return -ENODATA;
>>> +
>>>    	*base_size = XATTR_SIZE(inode) + XATTR_PADDING_SIZE;
>>>    	txattr_addr = xattr_alloc(F2FS_I_SB(inode), *base_size, is_inline);
>>>    	if (!txattr_addr)
>>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
