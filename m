Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB6532D8F5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Mar 2021 18:50:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lHs7J-0002Sw-Lk; Thu, 04 Mar 2021 17:50:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lHs7H-0002SF-Fn
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Mar 2021 17:50:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tD6ZuOE/37Q5sI2lFAJpJYxzjmw5NqiNJf8WroZej7Y=; b=NZHnDI/kIWyWk5UDH9Scd6f2SJ
 +Ny1X0yK5BRv57BpRZFawbORa/Z9lqvCTHa4UUr1fiCAD/k88KoTAssJVKpQM0rbMGbY3u7wmLuY7
 etrKUKeYKiaHOt7oLg+QgfrLPLcAYE8s2AW19oIMCtQ2LScAOi3/F3qHZ+GgEiDo41h8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tD6ZuOE/37Q5sI2lFAJpJYxzjmw5NqiNJf8WroZej7Y=; b=ic7vSWSRSA44T5EuCy9LZ+SELt
 I02LIiHw+kdeqOs/SLQqUlqHsT36RKhFJ1RTsrY0DvvvYY4F4ui1TkY3wYgeG78Ymo5MZsAjJollh
 k6HgjrvVsf+K2cx+Bf3nn9TKG44j3ADfPuRvyci2BiztJvnPJD/clOUe9BpiOGb2ShNA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lHs7C-00E56u-Tz
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Mar 2021 17:50:27 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 898FD64F1E;
 Thu,  4 Mar 2021 17:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614880215;
 bh=qHMFp+DR771VBs3rk6GDPx6UFsJ6juz5aNB02nBIg5M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tWW1+Z/KIX+3MI8iP02qNrvcNPOP8NZZu6SFDBH5Oe5ul1JU69bncfHdVHmB8SH4O
 MShGIqkC2EwvMTd/CryERy/ce5qJ4jn2mL3Esr01pHiEGNjkhXyBYAWYwGqQhQidzU
 v2psMJz8u3uicyhfiDxZz86OWUEuIolZB/Jndi3VLw+hfqwqpsxhP2E8X/TAc6Y8+j
 8GCvp3EYQJX0Qd4/1TP+XCwC8yHqm1KeFMA+cv2iZx38EI5pYu1Gf9sKFK8ute/TjU
 +QF6MdNnF319iQwWpcWTvrIZh5WnJT3BDZAQO42tg+ec2q7MlERjvo71SygLbKHFW1
 +fswrQPMCF/BA==
Date: Thu, 4 Mar 2021 09:50:14 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YEEd1q5nz9EYGy8H@google.com>
References: <20210302054233.3886681-1-jaegeuk@kernel.org>
 <920469a9-45d3-68e3-1f8d-a436bdd60cfe@huawei.com>
 <YD5wQRX+HnltBvEM@google.com> <YD6HjZG7QMS6Z3Tb@google.com>
 <05b43d3e-d735-ae34-5a4f-3d81a4fc8a9b@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <05b43d3e-d735-ae34-5a4f-3d81a4fc8a9b@huawei.com>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lHs7C-00E56u-Tz
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

On 03/04, Chao Yu wrote:
> On 2021/3/3 2:44, Jaegeuk Kim wrote:
> > On 03/02, Jaegeuk Kim wrote:
> > > On 03/02, Chao Yu wrote:
> > > > On 2021/3/2 13:42, Jaegeuk Kim wrote:
> > > > > This is useful when checking conditions during checkpoint=disable in Android.
> > > > 
> > > > This sysfs entry is readonly, how about putting this at
> > > > /sys/fs/f2fs/<disk>/stat/?
> > > 
> > > Urg.. "stat" is a bit confused. I'll take a look a better ones.
> 
> Oh, I mean put it into "stat" directory, not "stat" entry, something like this:
> 
> /sys/fs/f2fs/<disk>/stat/ovp_segments

I meant that too. Why is it like stat, since it's a geomerty?

> 
> > 
> > Taking a look at other entries using in Android, I feel that this one can't be
> > in stat or whatever other location, since I worry about the consistency with
> > similar dirty/free segments. It seems it's not easy to clean up the existing
> > ones anymore.
> 
> Well, actually, the entry number are still increasing continuously, the result is
> that it becomes more and more slower and harder for me to find target entry name
> from that directory.
> 
> IMO, once new readonly entry was added to "<disk>" directory, there is no chance
> to reloacate it due to interface compatibility. So I think this is the only
> chance to put it to the appropriate place at this time.

I know, but this will diverge those info into different places. I don't have
big concern when finding a specific entry with this tho, how about making
symlinks to create a dir structure for your easy access? Or, using a script
would be alternative way.

> 
> Thanks,
> 
> > 
> > > 
> > > > 
> > > > > 
> > > > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > > > ---
> > > > >    fs/f2fs/sysfs.c | 8 ++++++++
> > > > >    1 file changed, 8 insertions(+)
> > > > > 
> > > > > diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> > > > > index e38a7f6921dd..254b6fa17406 100644
> > > > > --- a/fs/f2fs/sysfs.c
> > > > > +++ b/fs/f2fs/sysfs.c
> > > > > @@ -91,6 +91,13 @@ static ssize_t free_segments_show(struct f2fs_attr *a,
> > > > >    			(unsigned long long)(free_segments(sbi)));
> > > > >    }
> > > > > +static ssize_t ovp_segments_show(struct f2fs_attr *a,
> > > > > +		struct f2fs_sb_info *sbi, char *buf)
> > > > > +{
> > > > > +	return sprintf(buf, "%llu\n",
> > > > > +			(unsigned long long)(overprovision_segments(sbi)));
> > > > > +}
> > > > > +
> > > > >    static ssize_t lifetime_write_kbytes_show(struct f2fs_attr *a,
> > > > >    		struct f2fs_sb_info *sbi, char *buf)
> > > > >    {
> > > > > @@ -629,6 +636,7 @@ F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, node_io_flag, node_io_flag);
> > > > >    F2FS_RW_ATTR(CPRC_INFO, ckpt_req_control, ckpt_thread_ioprio, ckpt_thread_ioprio);
> > > > >    F2FS_GENERAL_RO_ATTR(dirty_segments);
> > > > >    F2FS_GENERAL_RO_ATTR(free_segments);
> > > > > +F2FS_GENERAL_RO_ATTR(ovp_segments);
> > > > 
> > > > Missed to add document entry in Documentation/ABI/testing/sysfs-fs-f2fs?
> > > 
> > > Yeah, thanks.
> > > 
> > > > 
> > > > Thanks,
> > > > 
> > > > >    F2FS_GENERAL_RO_ATTR(lifetime_write_kbytes);
> > > > >    F2FS_GENERAL_RO_ATTR(features);
> > > > >    F2FS_GENERAL_RO_ATTR(current_reserved_blocks);
> > > > > 
> > > 
> > > 
> > > _______________________________________________
> > > Linux-f2fs-devel mailing list
> > > Linux-f2fs-devel@lists.sourceforge.net
> > > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
