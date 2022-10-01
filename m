Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B17235F171C
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Oct 2022 02:16:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oeQB8-0007dr-Eo;
	Sat, 01 Oct 2022 00:16:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1oeQB7-0007dl-6t
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Oct 2022 00:16:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N2U+kRjUwrhCPwS//g5PvOiWdyp4CQ89VDhdF/f+99c=; b=hMREr6Hn0W6aRSuN7NV8ecxiHV
 HJEcc4jRs6wh3bYIACPW6nCsmlF2+jTerM+92CZkpJ4exaXb+tIC2WnhHKVRzLZaKhE5MUq+iGX1K
 YjG7UDZIcRJ5OWSGRAjl2xhaK+nRi8MInEbXaR6Ooi/WcbEvllWtKhh2neeYGdcIKULw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=N2U+kRjUwrhCPwS//g5PvOiWdyp4CQ89VDhdF/f+99c=; b=hZiqjHI3GUspRuEfEI3/JDfX7C
 SqfN9x2P3OO4X3KZSXN3uGfhi+0q4LQCGSsP9FaOS343/liJoMo0tjG3TDesITbtNgGsYgEQC+Drz
 3vHupDpSspnmDb4xXTgV/42SvaL4byVd59m1hldyK7eSDAzbmtVVwGlYOBnpYygEsDe4=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oeQBF-0005dc-8G for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 01 Oct 2022 00:16:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 7EBA4CE2713;
 Sat,  1 Oct 2022 00:16:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F0ABC433D7;
 Sat,  1 Oct 2022 00:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1664583376;
 bh=FAHwj+8JpdEpeBHnBv/tRm0Spzw+5KxeRqQ5U2Ch+jY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nFib9jiJNQ8NSdzhsE4wo6xjcA5zSkEOwdngDFRCJ07fXnTKUeKUhCt/pJxuP/dKf
 awrUzLM/xlYBpJDS+VJ9De0TbiZkMwKqLbgWM4xIrAPJm48tkuTMWkAofVon5Xuet7
 R5VIgxeWn5Rq+Mt3VrdX/aWjUJDf4SR7wlxGXWOU4nyPtHCF/CorHMQlt5/FVcb+my
 lAgVTv4US71+DYYGSTBDTCTgynR2ZWGJ89IIjknUQXPNoADaEVbZNbw8X2nlCyqI2n
 IpDkIDwwIA9z6pw/Op4q/r7ae+ROiqYN+FfsArG+rzrfmfatyntprxctIY7Tjg7mCR
 aoBtBo/hS4T2g==
Message-ID: <d3992e1c-3251-f900-97be-049b1e1e4e37@kernel.org>
Date: Sat, 1 Oct 2022 08:16:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Content-Language: en-US
To: Daeho Jeong <daeho43@gmail.com>
References: <20220920014036.2295853-1-daeho43@gmail.com>
 <f4ce9486-f104-b0e2-25ed-f6de96316b76@kernel.org>
 <CACOAw_z=9H6jEQNd8C99c6xO55PJXWJOW7Q=78qtppgysebN2A@mail.gmail.com>
 <4aca0d00-d3b7-975f-6b72-ccd6f07d22e5@kernel.org>
 <CACOAw_wVU1gmH1gyWHYNqCpgy4KGKB+EZK6pbGL-h_1ToDV=vg@mail.gmail.com>
 <53df1b78-c611-6a22-88b1-74cc83a9e148@kernel.org>
 <CACOAw_w_09sz8PxnSGzNmJwh1-y_3JoKbBu80VjgZgV1uxo7KA@mail.gmail.com>
 <CACOAw_wjcFr1fg3QRYPUyOGyo-G9D9U6=qprkPUP8PzoxPQkMQ@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CACOAw_wjcFr1fg3QRYPUyOGyo-G9D9U6=qprkPUP8PzoxPQkMQ@mail.gmail.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/10/1 4:01, Daeho Jeong wrote: > On Fri, Sep 30, 2022
 at 9:04 AM Daeho Jeong <daeho43@gmail.com> wrote: >> >>>>>>> >>>>>>> Hi Daeho, 
 >>>>>>> >>>>>>> isize should be updated after tagging inode [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oeQBF-0005dc-8G
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: introduce
 F2FS_IOC_START_ATOMIC_REPLACE
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

On 2022/10/1 4:01, Daeho Jeong wrote:
> On Fri, Sep 30, 2022 at 9:04 AM Daeho Jeong <daeho43@gmail.com> wrote:
>>
>>>>>>>
>>>>>>> Hi Daeho,
>>>>>>>
>>>>>>> isize should be updated after tagging inode as atomic_write one?
>>>>>>> otherwise f2fs_mark_inode_dirty_sync() may update isize to inode page,
>>>>>>> latter checkpoint may persist that change? IIUC...
>>>>>>>
>>>>>>> Thanks,
>>>>>>
>>>>>> Hi Chao,
>>>>>>
>>>>>> The first patch of this patchset prevents the inode page from being
>>>>>> updated as dirty for atomic file cases.
>>>>>> Is there any other chances for the inode page to be marked as dirty?
>>>>>
>>>>> I mean:
>>>>>
>>>>> Thread A                                Thread B
>>>>> - f2fs_ioc_start_atomic_write
>>>>>     - f2fs_i_size_write(inode, 0)
>>>>>      - f2fs_mark_inode_dirty_sync
>>>>>                                           - checkpoint
>>>>>                                            - persist inode with incorrect zero isize
>>>>>
>>>>>     - set_inode_flag(inode, FI_ATOMIC_FILE)
>>>>>
>>>>> Am I missing something?
>>>>>
>>>>
>>>> So, f2fs_mark_inode_dirty_sync() will not work for atomic files
>>>> anymore, which means it doesn't make the inode dirty.
>>>> Plz, refer to the first patch of this patchset. Or I might be confused
>>>> with something. :(
>>>
>>> I mean FI_ATOMIC_FILE was set after f2fs_i_size_write(), so inode will be set
>>> as dirty.
>>>
>>> Thanks,
>>>
>>
>> Oh, I was confused that f2fs_update_inode() is called in
>> f2fs_mark_inode_dirty_sync().
>> That is called in f2fs_write_inode(). Let me fix this.
> 
> Hmm, I think the issue was already there before my patch.
> So, how about making the inode flushed and clean if the inode is
> already dirty when starting atomic write?

What I mean is:

---
  fs/f2fs/file.c | 4 +++-
  1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index e4b6e51086a3..31b229678b1d 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2053,6 +2053,9 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)

  	isize = i_size_read(inode);
  	fi->original_i_size = isize;
+
+	set_inode_flag(inode, FI_ATOMIC_FILE);
+
  	if (truncate) {
  		set_inode_flag(inode, FI_ATOMIC_REPLACE);
  		truncate_inode_pages_final(inode->i_mapping);
@@ -2063,7 +2066,6 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)

  	stat_inc_atomic_inode(inode);

-	set_inode_flag(inode, FI_ATOMIC_FILE);
  	set_inode_flag(fi->cow_inode, FI_COW_FILE);
  	clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
  	f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
-- 


Let's set FI_ATOMIC_FILE flag before f2fs_i_size_write(inode, 0), so
- f2fs_ioc_start_atomic_write
  - f2fs_i_size_write(, 0)
   - f2fs_mark_inode_dirty_sync
    check f2fs_is_atomic_file() and return correctly.

And for the case the inode is dirty before f2fs_i_size_write(, 0), we
can call f2fs_write_inode() to flush dirty feilds into inode page, and
make inode clean.

> 
>>
>> Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
