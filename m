Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E1721AFAD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2020 08:46:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtmnU-0001si-D1; Fri, 10 Jul 2020 06:46:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jtmnT-0001sa-5G
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 06:46:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mhrgJ3FRiZjO0xkSqdB1rYc0g6soW7SuqCMENCfj2aQ=; b=HH9pRgXr9YDfmizdbP1IDvvwlR
 l2NkjA35moPt9Z0BXg+Dg9bSqBJZx5mWybd4x3uytQA+QWb9qb15GHJaP7qUBoa4lYm9URMZKnGkF
 rmA3BjQO71ArgmBhQXLvo08rQjPCZNlHpX7S8U/9PJv8gVY+Ho7T8FXv3WMy5bJzhYRE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mhrgJ3FRiZjO0xkSqdB1rYc0g6soW7SuqCMENCfj2aQ=; b=NkN3wGpZ9aMgSn3j4ViQ8SdNv4
 /jpFu+dr/H+GcyzGYcjgN/KZxiAztfYer+zosTFTmsaoaBWD2DksysxF9h3+3uJg+rS+P2SRGCooM
 nCJc+NK9WVLHh3hvO39Hs/d4TICu9dh5vRIbvEU5+KvcL8UDYXXl7m0YXHKQRASel9u4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jtmnR-001i7y-Lx
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 06:46:11 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 308D5207DF;
 Fri, 10 Jul 2020 06:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594363564;
 bh=4hA4Pkh1IVhGVJIJ1bNCGgYAfcOIFM+f/AjmG0yu4gI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=2GlAy5uj37xFyGWJcs4dYwhUtXTbe2t7VOc5/uc3lVnlVUJDEtLQXxt2w3duVxseQ
 yPN0SMxN19fjUFvr44nNS52tn/9/qEv8HC9AL2peeWQG+V9VfvL9MNhmXpQIUneVvk
 yIBEWUTO3xZURAsYSaU0H7M5Tx60V+eaXFduug7Y=
Date: Thu, 9 Jul 2020 23:46:03 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200710064603.GA1656368@google.com>
References: <20200710021505.2405872-1-daeho43@gmail.com>
 <20200710030246.GA545837@google.com>
 <62c9dd7a-5d18-8bb6-8e43-c055fcff51cc@huawei.com>
 <20200710033100.GE545837@google.com>
 <ede6620c-6fc9-797d-e3ea-e630eb76b309@huawei.com>
 <20200710035215.GI545837@google.com>
 <34cad197-75eb-d7c2-4465-261d5debfd3b@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <34cad197-75eb-d7c2-4465-261d5debfd3b@huawei.com>
X-Spam-Score: -0.2 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtmnR-001i7y-Lx
Subject: Re: [f2fs-dev] [PATCH] f2fs: change the way of handling range.len
 in F2FS_IOC_SEC_TRIM_FILE
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
Cc: linux-f2fs-devel@lists.sourceforge.net, kernel-team@android.com,
 Daeho Jeong <daehojeong@google.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/10, Chao Yu wrote:
> On 2020/7/10 11:52, Jaegeuk Kim wrote:
> > On 07/10, Chao Yu wrote:
> >> On 2020/7/10 11:31, Jaegeuk Kim wrote:
> >>> On 07/10, Chao Yu wrote:
> >>>> On 2020/7/10 11:02, Jaegeuk Kim wrote:
> >>>>> On 07/10, Daeho Jeong wrote:
> >>>>>> From: Daeho Jeong <daehojeong@google.com>
> >>>>>>
> >>>>>> Changed the way of handling range.len of F2FS_IOC_SEC_TRIM_FILE.
> >>>>>>  1. Added -1 value support for range.len to signify the end of file.
> >>>>>>  2. If the end of the range passes over the end of file, it means until
> >>>>>>     the end of file.
> >>>>>>  3. ignored the case of that range.len is zero to prevent the function
> >>>>>>     from making end_addr zero and triggering different behaviour of
> >>>>>>     the function.
> >>>>>>
> >>>>>> Signed-off-by: Daeho Jeong <daehojeong@google.com>
> >>>>>> ---
> >>>>>>  fs/f2fs/file.c | 16 +++++++---------
> >>>>>>  1 file changed, 7 insertions(+), 9 deletions(-)
> >>>>>>
> >>>>>> diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> >>>>>> index 368c80f8e2a1..1c4601f99326 100644
> >>>>>> --- a/fs/f2fs/file.c
> >>>>>> +++ b/fs/f2fs/file.c
> >>>>>> @@ -3813,21 +3813,19 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
> >>>>>>  	file_start_write(filp);
> >>>>>>  	inode_lock(inode);
> >>>>>>  
> >>>>>> -	if (f2fs_is_atomic_file(inode) || f2fs_compressed_file(inode)) {
> >>>>>> +	if (f2fs_is_atomic_file(inode) || f2fs_compressed_file(inode) ||
> >>>>>> +			range.start >= inode->i_size) {
> >>>>>>  		ret = -EINVAL;
> >>>>>>  		goto err;
> >>>>>>  	}
> >>>>>>  
> >>>>>> -	if (range.start >= inode->i_size) {
> >>>>>> -		ret = -EINVAL;
> >>>>>> +	if (range.len == 0)
> >>>>>>  		goto err;
> >>>>>> -	}
> >>>>>>  
> >>>>>> -	if (inode->i_size - range.start < range.len) {
> >>>>>> -		ret = -E2BIG;
> >>>>>> -		goto err;
> >>>>>> -	}
> >>>>>> -	end_addr = range.start + range.len;
> >>>>>> +	if (range.len == (u64)-1 || inode->i_size - range.start < range.len)
> >>>>>> +		end_addr = inode->i_size;
> >>>>
> >>>> We can remove 'range.len == (u64)-1' condition since later condition can cover
> >>>> this?
> >>>>
> >>>>>
> >>>>> Hmm, what if there are blocks beyond i_size? Do we need to check i_blocks for
> >>>>
> >>>> The blocks beyond i_size will never be written, there won't be any valid message
> >>>> there, so we don't need to worry about that.
> >>>
> >>> I don't think we have a way to guarantee the order of i_size and block
> >>> allocation in f2fs. See f2fs_write_begin and f2fs_write_end.
> >>
> >> However, write_begin & write_end are covered by inode_lock, it could not be
> >> racy with inode size check in f2fs_sec_trim_file() as it hold inode_lock as
> >> well?
> > 
> > Like Daeho said, write_begin -> checkpoint -> power-cut can give bigger i_blocks
> > than i_size.
> 
> The path won't, cp only persists reserved block in dnode rather than written
> data block in segment, because data will be copied to page cache after write_begin.

Ah, you're talking about data validity, while I was doing block allocation in
this case. In either cases, I'd say secure_trim needs to trim whatever data
in valid block *address*.

> 
> I think truncation path could as Daeho said:
> 
> 1. truncate -> i_size update however blocks wasn't truncated yet -> checkpoint -> recovery
> 2. truncate failed -> i_size update however partial blocks was truncated -> fsync
> 
> > 
> >>
> >>>
> >>>>
> >>>> Thanks,
> >>>>
> >>>>> ending criteria?
> >>>>>
> >>>>>> +	else
> >>>>>> +		end_addr = range.start + range.len;
> >>>>>>  
> >>>>>>  	to_end = (end_addr == inode->i_size);
> >>>>>>  	if (!IS_ALIGNED(range.start, F2FS_BLKSIZE) ||
> >>>>>> -- 
> >>>>>> 2.27.0.383.g050319c2ae-goog
> >>>>>>
> >>>>>>
> >>>>>>
> >>>>>> _______________________________________________
> >>>>>> Linux-f2fs-devel mailing list
> >>>>>> Linux-f2fs-devel@lists.sourceforge.net
> >>>>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> >>>>>
> >>>>>
> >>>>> _______________________________________________
> >>>>> Linux-f2fs-devel mailing list
> >>>>> Linux-f2fs-devel@lists.sourceforge.net
> >>>>> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> >>>>> .
> >>>>>
> >>> .
> >>>
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
