Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AD0331B6F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Mar 2021 01:08:23 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lJPv5-0003ys-VI; Tue, 09 Mar 2021 00:08:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lJPv4-0003yG-QE
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Mar 2021 00:08:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Yo9UdVtuDkDBl6CuR0MfMMAKwq7Q53cgtnHN/wYwXy0=; b=SxT5Jkflp7QHTejdvpeQ8u/x/B
 EAR/AMaYrVysbSeN4oPpLcYKQirZ0aWSkiMYLxLo7drvP9DkgJvSFtDA74590MqhycmiM156uOKZU
 cFOkD3FNGU+QMvyLaYA4Jg+u9nV+OmYbhFFVhX4X8/clon4H1iCaQ0/sXyBMwwHp/p0o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Yo9UdVtuDkDBl6CuR0MfMMAKwq7Q53cgtnHN/wYwXy0=; b=ly1GcynpNjbsDQBfDYSIA4cXe/
 BcTMIdFMrhWue6ZZMbnHV9FpxbDRXDwbpV6ixwQp/KwF5VdKjkycxH2fgv7VNVJxhw6HE/5geuNno
 s6YG5BM0gExC/4/jtPZVnXVRXvipnKKmAg5ZrXSBPrcMG0JK2UoiYGKzTrVf+ZkXv0vo=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lJPuv-002ENm-2M
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 09 Mar 2021 00:08:14 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 695E061554;
 Tue,  9 Mar 2021 00:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1615248479;
 bh=hh6W4mb3ILZuAEfS/9qpYK9HmLfYcB44uqr5rewvqiY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=P5Qtd1psIuOnnPSSLk66PHnUOWZ0U9zWdOh/dEFU3bbnDfny0T2AYUGq50iD47mjA
 mLbyLRO3bPBooxXftkfNdeN6KimUVhtoXa9WkWxSXvPaX/WnsdxRHMeOToGK1SbEYZ
 dzaU7HBdq64z2FWXTmiaDLrPOl5uSw3tJMm9VLQFgxgd+Y2YjlOzEPqQer+jly3oSr
 7nU1eZZVqHwFQE7Cr4ay8ygLO7olkV+16tM/dAI5wOVL+NMG8KjRVFhATlWL2MT+1r
 NvnAPLQ/ORo6IEJAZR05uFFIwl4heCyMXWlqNvLDl69BvSsRyo28jSK8XQgXTDWsI6
 tsNbJ8+lUJGTQ==
Date: Mon, 8 Mar 2021 16:07:57 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YEa8XfQvBsmABpY6@google.com>
References: <20210302054233.3886681-1-jaegeuk@kernel.org>
 <920469a9-45d3-68e3-1f8d-a436bdd60cfe@huawei.com>
 <YD5wQRX+HnltBvEM@google.com> <YD6HjZG7QMS6Z3Tb@google.com>
 <05b43d3e-d735-ae34-5a4f-3d81a4fc8a9b@huawei.com>
 <YEEd1q5nz9EYGy8H@google.com>
 <ee90aac8-bc84-0a85-e1b8-f51c40c77535@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ee90aac8-bc84-0a85-e1b8-f51c40c77535@huawei.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lJPuv-002ENm-2M
Subject: Re: [f2fs-dev] [PATCH] f2fs: expose # of overprivision segments
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
Cc: kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/05, Chao Yu wrote:
> On 2021/3/5 1:50, Jaegeuk Kim wrote:
> > On 03/04, Chao Yu wrote:
> > > On 2021/3/3 2:44, Jaegeuk Kim wrote:
> > > > On 03/02, Jaegeuk Kim wrote:
> > > > > On 03/02, Chao Yu wrote:
> > > > > > On 2021/3/2 13:42, Jaegeuk Kim wrote:
> > > > > > > This is useful when checking conditions during checkpoint=disable in Android.
> > > > > > 
> > > > > > This sysfs entry is readonly, how about putting this at
> > > > > > /sys/fs/f2fs/<disk>/stat/?
> > > > > 
> > > > > Urg.. "stat" is a bit confused. I'll take a look a better ones.
> > > 
> > > Oh, I mean put it into "stat" directory, not "stat" entry, something like this:
> > > 
> > > /sys/fs/f2fs/<disk>/stat/ovp_segments
> > 
> > I meant that too. Why is it like stat, since it's a geomerty?
> 
> Hmm.. I feel a little bit weired to treat ovp_segments as 'stat' class, one reason
> is ovp_segments is readonly and is matching the readonly attribute of a stat.

It seems I don't fully understand what you suggest here. I don't want to add the
# of ovp_segments in <disk>/stat, since it is not part of status, but put it in
<disk>/ to sync with other # of free/dirty segments. If you can't read out easily,
I suggest to create symlinks to organize all the current mess.

> 
> > 
> > > 
> > > > 
> > > > Taking a look at other entries using in Android, I feel that this one can't be
> > > > in stat or whatever other location, since I worry about the consistency with
> > > > similar dirty/free segments. It seems it's not easy to clean up the existing
> > > > ones anymore.
> > > 
> > > Well, actually, the entry number are still increasing continuously, the result is
> > > that it becomes more and more slower and harder for me to find target entry name
> > > from that directory.
> > > 
> > > IMO, once new readonly entry was added to "<disk>" directory, there is no chance
> > > to reloacate it due to interface compatibility. So I think this is the only
> > > chance to put it to the appropriate place at this time.
> > 
> > I know, but this will diverge those info into different places. I don't have
> > big concern when finding a specific entry with this tho, how about making
> > symlinks to create a dir structure for your easy access? Or, using a script
> > would be alternative way.
> 
> Yes, there should be some alternative ways to help to access f2fs sysfs
> interface, but from a point view of user, I'm not sure he can figure out those
> ways.
> 
> For those fs meta stat, why not adding a single entry to include all info you
> need rather than adding them one by one? e.g.

You can add that in /proc as well, which requires to parse back when retrieving
specific values.

> 
> /proc/fs/f2fs/<disk>/super_block
> /proc/fs/f2fs/<disk>/checkpoint
> /proc/fs/f2fs/<disk>/nat_table
> /proc/fs/f2fs/<disk>/sit_table
> ...
> 
> Thanks,
> 
> > 
> > > 
> > > Thanks,
> > > 
> > > > 
> > > > > 
> > > > > > 
> > > > > > > 
> > > > > > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > > > > > ---
> > > > > > >     fs/f2fs/sysfs.c | 8 ++++++++
> > > > > > >     1 file changed, 8 insertions(+)
> > > > > > > 
> > > > > > > diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> > > > > > > index e38a7f6921dd..254b6fa17406 100644
> > > > > > > --- a/fs/f2fs/sysfs.c
> > > > > > > +++ b/fs/f2fs/sysfs.c
> > > > > > > @@ -91,6 +91,13 @@ static ssize_t free_segments_show(struct f2fs_attr *a,
> > > > > > >     			(unsigned long long)(free_segments(sbi)));
> > > > > > >     }
> > > > > > > +static ssize_t ovp_segments_show(struct f2fs_attr *a,
> > > > > > > +		struct f2fs_sb_info *sbi, char *buf)
> > > > > > > +{
> > > > > > > +	return sprintf(buf, "%llu\n",
> > > > > > > +			(unsigned long long)(overprovision_segments(sbi)));
> > > > > > > +}
> > > > > > > +
> > > > > > >     static ssize_t lifetime_write_kbytes_show(struct f2fs_attr *a,
> > > > > > >     		struct f2fs_sb_info *sbi, char *buf)
> > > > > > >     {
> > > > > > > @@ -629,6 +636,7 @@ F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, node_io_flag, node_io_flag);
> > > > > > >     F2FS_RW_ATTR(CPRC_INFO, ckpt_req_control, ckpt_thread_ioprio, ckpt_thread_ioprio);
> > > > > > >     F2FS_GENERAL_RO_ATTR(dirty_segments);
> > > > > > >     F2FS_GENERAL_RO_ATTR(free_segments);
> > > > > > > +F2FS_GENERAL_RO_ATTR(ovp_segments);
> > > > > > 
> > > > > > Missed to add document entry in Documentation/ABI/testing/sysfs-fs-f2fs?
> > > > > 
> > > > > Yeah, thanks.
> > > > > 
> > > > > > 
> > > > > > Thanks,
> > > > > > 
> > > > > > >     F2FS_GENERAL_RO_ATTR(lifetime_write_kbytes);
> > > > > > >     F2FS_GENERAL_RO_ATTR(features);
> > > > > > >     F2FS_GENERAL_RO_ATTR(current_reserved_blocks);
> > > > > > > 
> > > > > 
> > > > > 
> > > > > _______________________________________________
> > > > > Linux-f2fs-devel mailing list
> > > > > Linux-f2fs-devel@lists.sourceforge.net
> > > > > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > > > .
> > > > 
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
