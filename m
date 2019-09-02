Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DD5A5DF0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2019 01:05:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i4vNZ-0005XV-Me; Mon, 02 Sep 2019 23:04:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1i4vNY-0005X2-NP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Sep 2019 23:04:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=74V073XTO234BYRNY5MdmpPF5NKuoc5Zk0AD2WY96Vs=; b=jaSkK6IgOYsnoJC8FjrtL2cJ1Q
 8cQt2uvagXcQc6xgjB7dqeod+YkzRR+Mfnt8KtgAyrP0B88CuDM9ZYoG4eaZENcLvQL22cBrn1WAu
 fQ/9IrDGizj9BJJrU3br/K9jjYLtbs6WnuBwCvNvYKsp9HCGBO+SEdvyp3S5yEV5XT/c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=74V073XTO234BYRNY5MdmpPF5NKuoc5Zk0AD2WY96Vs=; b=RYnkr2BU3/BPjD59lSuXvA+j82
 T6J1BpevISlWGZemCUV12KgwTYv1cOvpjCdu1MAAvABSbxZCv5Y8MM6tJ85p9sn+SNRreGVeruWxB
 nc4aTJzJk8hgyK9cLOniibK047t4lE0ev636feR6a+zzqwdmb6W+O9g5/mc33GPgDhb8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i4vNX-007CZk-HZ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 02 Sep 2019 23:04:56 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E79AE216C8;
 Mon,  2 Sep 2019 23:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567465490;
 bh=6GZgqxv9ZdrRWETuEeOhYJh9DzHgCwcEevQnOpLNpuU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=xlm3LQgQIxvu15+W1OTSs6m66X3i6ZSfdSx6wtgurwla+fwVinjVY1QaX0CcS3sEZ
 RROaSBjf5zbRVXp6WQhIx9H33bNQRkTKuub7PjGClfnOLsx5z+BhdAz8bsQkTOzJ4e
 n+DdGNL8H3QccEqOUnLPiGVp3SmpHhvxZ6S/fB/8=
Date: Mon, 2 Sep 2019 16:04:49 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190902230449.GD71929@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190219081529.5106-1-yuchao0@huawei.com>
 <d2b3c101-0399-4e85-5765-7b6504aaca74@huawei.com>
 <20190901071757.GA49907@jaegeuk-macbookpro.roam.corp.google.com>
 <024fe351-8e25-35cd-47a7-9755498c73f4@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <024fe351-8e25-35cd-47a7-9755498c73f4@huawei.com>
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
X-Headers-End: 1i4vNX-007CZk-HZ
Subject: Re: [f2fs-dev] [PATCH v4] f2fs: add bio cache for IPU
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

On 09/02, Chao Yu wrote:
> On 2019/9/1 15:17, Jaegeuk Kim wrote:
> > On 08/31, Chao Yu wrote:
> >> On 2019/2/19 16:15, Chao Yu wrote:
> >>> @@ -1976,10 +2035,13 @@ static int __write_data_page(struct page *page, bool *submitted,
> >>>  	}
> >>>  
> >>>  	unlock_page(page);
> >>> -	if (!S_ISDIR(inode->i_mode) && !IS_NOQUOTA(inode))
> >>> +	if (!S_ISDIR(inode->i_mode) && !IS_NOQUOTA(inode)) {
> >>> +		f2fs_submit_ipu_bio(sbi, bio, page);
> >>>  		f2fs_balance_fs(sbi, need_balance_fs);
> >>> +	}
> >>
> >> Above bio submission was added to avoid below deadlock:
> >>
> >> - __write_data_page
> >>  - f2fs_do_write_data_page
> >>   - set_page_writeback        ---- set writeback flag
> >>   - f2fs_inplace_write_data
> >>  - f2fs_balance_fs
> >>   - f2fs_gc
> >>    - do_garbage_collect
> >>     - gc_data_segment
> >>      - move_data_page
> >>       - f2fs_wait_on_page_writeback
> >>        - wait_on_page_writeback  --- wait writeback
> >>
> >> However, it breaks the merge of IPU IOs, to solve this issue, it looks we need
> >> to add global bio cache for such IPU merge case, then later
> >> f2fs_wait_on_page_writeback can check whether writebacked page is cached or not,
> >> and do the submission if necessary.
> >>
> >> Jaegeuk, any thoughts?
> > 
> > How about calling f2fs_submit_ipu_bio() when we need to do GC in the same
> > context?
> 
> However it also could happen in race case:
> 
> Thread A				Thread B
> - __write_data_page (inode x, page y)
>  - f2fs_do_write_data_page
>   - set_page_writeback        ---- set writeback flag in page y
>   - f2fs_inplace_write_data
>  - f2fs_balance_fs
> 					 - lock gc_mutex
>  - lock gc_mutex
> 					  - f2fs_gc
> 					   - do_garbage_collect
> 					    - gc_data_segment
> 					     - move_data_page
> 					      - f2fs_wait_on_page_writeback
> 					       - wait_on_page_writeback  --- wait writeback of page y
> 
> So it needs a global bio cache for merged IPU pages, how about adding a list to
> link all ipu bios in struct f2fs_bio_info?

Hmm, I can't think of better solution than adding a list. In this case, blk_plug
doesn't work well?

> 
> struct f2fs_bio_info {
> 	....
> 	struct list_head ipu_bio_list;	/* track all ipu bio */
> 	spinlock_t ipu_bio_lock;	/* protect ipu bio list */
> }
> 
> > 
> >>
> >> Thanks,
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
