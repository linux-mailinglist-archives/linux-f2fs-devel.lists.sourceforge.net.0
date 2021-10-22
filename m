Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ABC4379F6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Oct 2021 17:32:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mdwX7-0005N7-3g; Fri, 22 Oct 2021 15:32:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mdwX6-0005MK-Ew
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Oct 2021 15:32:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vzmn7a/XdwXzsj0OI+skwq6aSHdLz8K8GMedL6eNm0Y=; b=lCkY3HHgL490LC1R9lX2pJYl9D
 lP6D3Q13JGJRm06eETVQTfBVRVRephgwD5kh+BvQZxcoCVh9OF7kDkSq2aq2+lYEow09zr0aCZZBy
 e8AWG+vtbpUu2FDHZNy7VluxXHCLv2nQyC4J5T2zeyx10L2ouMi7Qwe28cdiNJTRyQuc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vzmn7a/XdwXzsj0OI+skwq6aSHdLz8K8GMedL6eNm0Y=; b=ZH59ZKo/beaV/a+M1r+1CuGafb
 n71btT8TZ4G7ku0eqONIEiLH6XXW+gm7oSkQ9Sl0kW6l48rzwhIfrEs/g2SLCAJ/rWAwXtyS74V37
 /tME+v4CIKXSiC4XPEK+5gHo3LqTWnXEt41xZmAJFr6z8N/v/9hb/VTFa31Su93b98GE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mdwX0-00C0v0-9P
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 22 Oct 2021 15:32:36 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0DCEC6054E;
 Fri, 22 Oct 2021 15:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634916740;
 bh=dsX++Uq9HxwTDlQDY7ato4NKF0kNAEUBDapYaqRA0mI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=lQWW/kv4bYwG2eiGsk3PVYg9jXIMXMKfD1qt40pxIisJzhuO9iPyELNTcPrDIMU//
 ECQ8d9i3TlKupqDUH+GCtLlcdYYrJcWNhBfitlIYYJBJ0roxybxflXr43fn+G2i7pf
 jfqsWwqGSzJTco7W/4iE4hQ+VOp97sdF9Ww+kWi91vm3wjzGQxZxZ2KHmfujNLKQvy
 1Ns3wrxF5xFusbkj8TBUOzXWxc+Gaeq5Gy10uLTThbfYTY100ke9UKU1GnUj4Yv3Z5
 1jXHMi96uF3jATU7SHVhhs3zNKBkHktLInR0tgccjaxATjTSJAE2+KQ35nBtAM4MKk
 gBaue/wr7AXcw==
Message-ID: <3ddb4013-8d63-7c00-6fdd-1f21752bd60c@kernel.org>
Date: Fri, 22 Oct 2021 23:32:16 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>
References: <20211014190503.717830-1-daeho43@gmail.com>
 <e8b106fb-2878-2fa9-788f-965eef179a85@kernel.org>
 <CACOAw_yupuz+Xx-z9V0UaExuARHd8H9rruWCa2yj5-mgkeuUtQ@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CACOAw_yupuz+Xx-z9V0UaExuARHd8H9rruWCa2yj5-mgkeuUtQ@mail.gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2021/10/22 0:44, Daeho Jeong wrote: > There is a deadlock
 between sb_internal lock (sb_start_intwrite()) and > dquot related lock.
 > It's because we call f2fs_truncate(), which eventually calls > d [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mdwX0-00C0v0-9P
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove circular locking between
 sb_internal and fs_reclaim
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2021/10/22 0:44, Daeho Jeong wrote:
> There is a deadlock between sb_internal lock (sb_start_intwrite()) and
> dquot related lock.
> It's because we call f2fs_truncate(), which eventually calls
> dquot_initialize(), while holding sb_internal lock.
> So, I called dquot_initialize() in advance to make the 2nd calling of
> it in f2fs_truncate() ineffective.
> This is similar with the thing in f2fs_evict_inode() in inode.c

Well, if dquot_initialize() fails in f2fs_drop_inode(), will we still run
into deadlock?

Thanks,

> 
> Thanks,
> 
> On Thu, Oct 21, 2021 at 5:11 AM Chao Yu <chao@kernel.org> wrote:
>>
>> On 2021/10/15 3:05, Daeho Jeong wrote:
>>> From: Daeho Jeong <daehojeong@google.com>
>>>
>>> We detected the below circular locking dependency between sb_internal
>>> and fs_reclaim. So, removed it by calling dquot_initialize() before
>>> sb_start_intwrite().
>>>
>>>    ======================================================
>>>    WARNING: possible circular locking dependency detected
>>>    ------------------------------------------------------
>>>    kswapd0/133 is trying to acquire lock:
>>> ffffff80d5fb9680 (sb_internal#2){.+.+}-{0:0}, at: evict+0xd4/0x2f8
>>>
>>> but task is already holding lock:
>>> ffffffda597c93a8 (fs_reclaim){+.+.}-{0:0}, at:
>>> __fs_reclaim_acquire+0x4/0x50
>>>
>>> which lock already depends on the new lock.
>>> ...
>>> other info that might help us debug this:
>>>
>>>    Chain exists of:
>>>
>>> sb_internal#2 --> &s->s_dquot.dqio_sem --> fs_reclaim
>>>
>>>     Possible unsafe locking scenario:
>>>
>>>           CPU0                    CPU1
>>>           ----                    ----
>>>      lock(fs_reclaim);
>>>                                   lock(&s->s_dquot.dqio_sem);
>>>                                   lock(fs_reclaim);
>>>      lock(sb_internal#2);
>>
>> Sorry, I still didn't get the root cause of this deadlock issue, could
>> you please explain more about this?
>>
>> And why calling dquot_initialize() in drop_inode() could break the
>> circular locking dependency?
>>
>> Thanks,
>>
>>>
>>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
>>> ---
>>>    fs/f2fs/super.c | 2 ++
>>>    1 file changed, 2 insertions(+)
>>>
>>> diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
>>> index 86eeb019cc52..a133932333c5 100644
>>> --- a/fs/f2fs/super.c
>>> +++ b/fs/f2fs/super.c
>>> @@ -1370,6 +1370,8 @@ static int f2fs_drop_inode(struct inode *inode)
>>>                        /* should remain fi->extent_tree for writepage */
>>>                        f2fs_destroy_extent_node(inode);
>>>
>>> +                     dquot_initialize(inode);
>>> +
>>>                        sb_start_intwrite(inode->i_sb);
>>>                        f2fs_i_size_write(inode, 0);
>>>
>>>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
