Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC90AD4B9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Sep 2019 10:21:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i7EvQ-0000ym-Dc; Mon, 09 Sep 2019 08:21:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1i7EvL-0000yX-Cx
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Sep 2019 08:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hPRivYho5Xr8IJLX+oH8NcOhk9/jxgDB6IJ9YkX93o0=; b=jLqT4edb+2+LRJ+wkfVhp+4sJC
 Pb/qZx/Q3jGcCIHxJOCUe4EYyFLr94RQfDthkOKvBNZIWTAvxogoFMffWtCwGPaW3ptzJdwWhq0Z1
 Atmib/n3ErLT3RySMkG7ao5EZZpY2T6FvErNHNDX6BEnTtii4kzLlcRwLE3HSsfTOVwM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hPRivYho5Xr8IJLX+oH8NcOhk9/jxgDB6IJ9YkX93o0=; b=YIUjTKq+sHrQjdHJt3H1ng7pxC
 U4+xJXE0sjz2XrIJNDC3MBhwcUsklg8hxI/DadPrTmUaM8viRreIXr0z0/kkgjEg2a/Qd0sqwkSFD
 w6HajtKN3bL8q//57OaZyIvQyqS/if5WNG8vcJ0Lu3e7+ObxQYQW/2pGNIy1FIICNzoE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i7EvK-00FLGG-3t
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Sep 2019 08:21:23 +0000
Received: from localhost (unknown [148.69.85.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2BFE420678;
 Mon,  9 Sep 2019 08:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1568017275;
 bh=04tmiWC6pvuodyi7GIh/mM1etgygk5jMugzj+0z2AUw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uA72GW68ebXqnwaS0Zkre5YvbMxZSsV0oYPHoD13acAY46RQ1SmY4VYC4J7+Y7Wru
 3TuV64oLlfeFuNa1TpH376Zdur1bv+2UegwVXwlTFWL+nKuNckBvVFI+c2XXqXvhhb
 VBw26vUxVec8wG96c6jquoWJ9MyaQ5o1blEWGHHo=
Date: Mon, 9 Sep 2019 09:21:12 +0100
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>, g@jaegeuk-macbookpro.roam.corp.google.com
Message-ID: <20190909082112.GA25724@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190909012532.20454-1-jaegeuk@kernel.org>
 <20190909012532.20454-2-jaegeuk@kernel.org>
 <f446ff29-38a5-61fd-4056-b4067b01c630@huawei.com>
 <20190909073011.GA21625@jaegeuk-macbookpro.roam.corp.google.com>
 <5a473076-14b8-768a-62ac-f686e850d5a6@huawei.com>
 <20190909080108.GC21625@jaegeuk-macbookpro.roam.corp.google.com>
 <bf0683d9-ac05-1edc-71ea-3d02f7b2fb55@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bf0683d9-ac05-1edc-71ea-3d02f7b2fb55@huawei.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1i7EvK-00FLGG-3t
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: avoid infinite GC loop due to
 stale atomic files
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 09/09, Chao Yu wrote:
> On 2019/9/9 16:01, Jaegeuk Kim wrote:
> > On 09/09, Chao Yu wrote:
> >> On 2019/9/9 15:30, Jaegeuk Kim wrote:
> >>> On 09/09, Chao Yu wrote:
> >>>> On 2019/9/9 9:25, Jaegeuk Kim wrote:
> >>>>> If committing atomic pages is failed when doing f2fs_do_sync_file(), we can
> >>>>> get commited pages but atomic_file being still set like:
> >>>>>
> >>>>> - inmem:    0, atomic IO:    4 (Max.   10), volatile IO:    0 (Max.    0)
> >>>>>
> >>>>> If GC selects this block, we can get an infinite loop like this:
> >>>>>
> >>>>> f2fs_submit_page_bio: dev = (253,7), ino = 2, page_index = 0x2359a8, oldaddr = 0x2359a8, newaddr = 0x2359a8, rw = READ(), type = COLD_DATA
> >>>>> f2fs_submit_read_bio: dev = (253,7)/(253,7), rw = READ(), DATA, sector = 18533696, size = 4096
> >>>>> f2fs_get_victim: dev = (253,7), type = No TYPE, policy = (Foreground GC, LFS-mode, Greedy), victim = 4355, cost = 1, ofs_unit = 1, pre_victim_secno = 4355, prefree = 0, free = 234
> >>>>> f2fs_iget: dev = (253,7), ino = 6247, pino = 5845, i_mode = 0x81b0, i_size = 319488, i_nlink = 1, i_blocks = 624, i_advise = 0x2c
> >>>>> f2fs_submit_page_bio: dev = (253,7), ino = 2, page_index = 0x2359a8, oldaddr = 0x2359a8, newaddr = 0x2359a8, rw = READ(), type = COLD_DATA
> >>>>> f2fs_submit_read_bio: dev = (253,7)/(253,7), rw = READ(), DATA, sector = 18533696, size = 4096
> >>>>> f2fs_get_victim: dev = (253,7), type = No TYPE, policy = (Foreground GC, LFS-mode, Greedy), victim = 4355, cost = 1, ofs_unit = 1, pre_victim_secno = 4355, prefree = 0, free = 234
> >>>>> f2fs_iget: dev = (253,7), ino = 6247, pino = 5845, i_mode = 0x81b0, i_size = 319488, i_nlink = 1, i_blocks = 624, i_advise = 0x2c
> >>>>>
> >>>>> In that moment, we can observe:
> >>>>>
> >>>>> [Before]
> >>>>> Try to move 5084219 blocks (BG: 384508)
> >>>>>   - data blocks : 4962373 (274483)
> >>>>>   - node blocks : 121846 (110025)
> >>>>> Skipped : atomic write 4534686 (10)
> >>>>>
> >>>>> [After]
> >>>>> Try to move 5088973 blocks (BG: 384508)
> >>>>>   - data blocks : 4967127 (274483)
> >>>>>   - node blocks : 121846 (110025)
> >>>>> Skipped : atomic write 4539440 (10)
> >>>>>
> >>>>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> >>>>> ---
> >>>>>  fs/f2fs/file.c | 10 +++++-----
> >>>>>  1 file changed, 5 insertions(+), 5 deletions(-)
> >>>>>
> >>>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> >>>>> index 7ae2f3bd8c2f..68b6da734e5f 100644
> >>>>> --- a/fs/f2fs/file.c
> >>>>> +++ b/fs/f2fs/file.c
> >>>>> @@ -1997,11 +1997,11 @@ static int f2fs_ioc_commit_atomic_write(struct file *filp)
> >>>>>  			goto err_out;
> >>>>>  
> >>>>>  		ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 0, true);
> >>>>> -		if (!ret) {
> >>>>> -			clear_inode_flag(inode, FI_ATOMIC_FILE);
> >>>>> -			F2FS_I(inode)->i_gc_failures[GC_FAILURE_ATOMIC] = 0;
> >>>>> -			stat_dec_atomic_write(inode);
> >>>>> -		}
> >>>>> +
> >>>>> +		/* doesn't need to check error */
> >>>>> +		clear_inode_flag(inode, FI_ATOMIC_FILE);
> >>>>> +		F2FS_I(inode)->i_gc_failures[GC_FAILURE_ATOMIC] = 0;
> >>>>> +		stat_dec_atomic_write(inode);
> >>>>
> >>>> If there are still valid atomic write pages linked in .inmem_pages, it may cause
> >>>> memory leak when we just clear FI_ATOMIC_FILE flag.
> >>>
> >>> f2fs_commit_inmem_pages() should have flushed them.
> >>
> >> Oh, we failed to flush its nodes.
> >>
> >> However we won't clear such info if we failed to flush inmen pages, it looks
> >> inconsistent.
> >>
> >> Any interface needed to drop inmem pages or clear ATOMIC_FILE flag in that two
> >> error path? I'm not very clear how sqlite handle such error.
> > 
> > f2fs_drop_inmem_pages() did that, but not in this case.
> 
> What I mean is, for any error returned from atomic_commit() interface, should
> userspace application handle it with consistent way, like trigger
> f2fs_drop_inmem_pages(), so we don't need to handle it inside atomic_commit().

f2fs_ioc_abort_volatile_write() will be triggered.

> 
> > 
> >>
> >> Thanks,
> >>
> >>>
> >>>>
> >>>> So my question is why below logic didn't handle such condition well?
> >>>>
> >>>> f2fs_gc()
> >>>>
> >>>> 	if (has_not_enough_free_secs(sbi, sec_freed, 0)) {
> >>>> 		if (skipped_round <= MAX_SKIP_GC_COUNT ||
> >>>> 					skipped_round * 2 < round) {
> >>>> 			segno = NULL_SEGNO;
> >>>> 			goto gc_more;
> >>>> 		}
> >>>>
> >>>> 		if (first_skipped < last_skipped &&
> >>>> 				(last_skipped - first_skipped) >
> >>>> 						sbi->skipped_gc_rwsem) {
> >>>> 			f2fs_drop_inmem_pages_all(sbi, true);
> >>>
> >>> This is doing nothing, since f2fs_commit_inmem_pages() removed the inode
> >>> from inmem list.
> >>>
> >>>> 			segno = NULL_SEGNO;
> >>>> 			goto gc_more;
> >>>> 		}
> >>>> 		if (gc_type == FG_GC && !is_sbi_flag_set(sbi, SBI_CP_DISABLED))
> >>>> 			ret = f2fs_write_checkpoint(sbi, &cpc);
> >>>> 	}
> >>>>
> >>>>>  	} else {
> >>>>>  		ret = f2fs_do_sync_file(filp, 0, LLONG_MAX, 1, false);
> >>>>>  	}
> >>>>>
> >>> .
> >>>
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
