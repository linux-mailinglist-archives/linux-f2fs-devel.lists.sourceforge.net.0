Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FA19770A1B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Aug 2023 22:53:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qS1nH-0000cr-Q5;
	Fri, 04 Aug 2023 20:53:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qS1nG-0000ck-GL
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Aug 2023 20:53:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zkArzJ5PXbeVcKW11UUNW4FpM+RKBtAyytG6PLU6vy4=; b=EiQFm6U9zp7vgT28DKtSM4oUb+
 oNrMNhuMwBCymc3/icxhqKhaGoK5xHjjzVLdER6yi/KfVFfwf7UhscMVdOnnYdyfyCPUJgjHXu1pj
 YKOv3t5ysRPplh+dzZB55cUUs//QUlc/b+oUX8ylFjjfcOS2V+ECAv2mqG7UYsLcqxBA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zkArzJ5PXbeVcKW11UUNW4FpM+RKBtAyytG6PLU6vy4=; b=F0RG85Fa1jyN8s1VBszBRXSxsy
 fQxP7WamOXvSrO0wez6TMTX2kCsQ2JAUYiFnqEi+LafkSr0Hj6nWVxLM3ZwkHPI+yohg7W8WHxwK4
 6TgHzTrK1mBnacyZhEXXjjyhZ8Z2U7d8nih8AE43/HK713HgrjfLsm4j5k9xa/Ybaswc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qS1nB-00DKaX-4i for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Aug 2023 20:53:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 90E3261F2C;
 Fri,  4 Aug 2023 20:52:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D26BEC433C8;
 Fri,  4 Aug 2023 20:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1691182374;
 bh=w3Im6Ax8lHd1gNOmnL1fnLf1h4Lex/RXxwbkLAeKoN0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=arM1eQdSUSo6RFHJxon4XQvX08aPMFHJzfgjPZcYFEYqh6GBSriWliUCZRBf2QLa7
 1r3or889XSfhxFOb3dOetka7M04KlZHWEbB4TsLcBz1C9uu48SA8zrIKOeC6X7vD08
 aANy68PDjh/VJInhkFLEzwrCMrRAuz7SOZ8nrZAbNpmney7AtFd36JJ2AeiQ1vSeMK
 w8tpClR36IfGAteNC1AUiVdKawDW0/6Ur94VYHKe7X2qkIIVtyJIsw9qpQmyEqRdfr
 YrtO0+fKJwYj9+DD++STnr+9xw24+OR5vBz9wLCnzkYFew1kh5AI9phiia/O+P63yw
 MgdIPRJN96fmw==
Date: Fri, 4 Aug 2023 13:52:52 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZM1lJPQcV+FjGnaI@google.com>
References: <ZKP6EJ5dZ4f4wScp@google.com>
 <65143701-4c19-ab66-1500-abd1162639cd@kernel.org>
 <ZKWovWZDiHjMavtB@google.com>
 <cadfb8d7-f5d0-a3ec-cafb-a0c06ad7d290@kernel.org>
 <ZK2FT9CUjxXvQ2K5@google.com>
 <330c96f7-fbad-dd17-6368-f1378b3b5375@kernel.org>
 <ZK7M6EkLkV8UbqUl@google.com>
 <87acf602-1587-0615-909d-6e60c66c3cda@kernel.org>
 <ZLrpMAaOkmrKQFv+@google.com>
 <5e5f830b-1b13-4893-fbb0-4c7e99ec9f32@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5e5f830b-1b13-4893-fbb0-4c7e99ec9f32@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 07/25, Chao Yu wrote: > On 2023/7/22 4:23, Jaegeuk Kim
 wrote: > > On 07/13, Chao Yu wrote: > > > On 2023/7/12 23:55, Jaegeuk Kim
 wrote: > > > > On 07/12, Chao Yu wrote: > > > > > On 2023/7/12 0:37, [...]
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qS1nB-00DKaX-4i
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: do not issue small discard commands
 during checkpoint
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

On 07/25, Chao Yu wrote:
> On 2023/7/22 4:23, Jaegeuk Kim wrote:
> > On 07/13, Chao Yu wrote:
> > > On 2023/7/12 23:55, Jaegeuk Kim wrote:
> > > > On 07/12, Chao Yu wrote:
> > > > > On 2023/7/12 0:37, Jaegeuk Kim wrote:
> > > > > > On 07/06, Chao Yu wrote:
> > > > > > > On 2023/7/6 1:30, Jaegeuk Kim wrote:
> > > > > > > > On 07/04, Chao Yu wrote:
> > > > > > > > > On 2023/7/4 18:53, Jaegeuk Kim wrote:
> > > > > > > > > > On 07/03, Chao Yu wrote:
> > > > > > > > > > > On 2023/6/15 0:10, Jaegeuk Kim wrote:
> > > > > > > > > > > > If there're huge # of small discards, this will increase checkpoint latency
> > > > > > > > > > > > insanely. Let's issue small discards only by trim.
> > > > > > > > > > > > 
> > > > > > > > > > > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > > > > > > > > > > ---
> > > > > > > > > > > > 
> > > > > > > > > > > >        Change log from v1:
> > > > > > > > > > > >         - move the skip logic to avoid dangling objects
> > > > > > > > > > > > 
> > > > > > > > > > > >        fs/f2fs/segment.c | 2 +-
> > > > > > > > > > > >        1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > > > > > > > > 
> > > > > > > > > > > > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > > > > > > > > > > > index 8c7af8b4fc47..0457d620011f 100644
> > > > > > > > > > > > --- a/fs/f2fs/segment.c
> > > > > > > > > > > > +++ b/fs/f2fs/segment.c
> > > > > > > > > > > > @@ -2193,7 +2193,7 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
> > > > > > > > > > > >        			len = next_pos - cur_pos;
> > > > > > > > > > > >        			if (f2fs_sb_has_blkzoned(sbi) ||
> > > > > > > > > > > > -			    (force && len < cpc->trim_minlen))
> > > > > > > > > > > > +					!force || len < cpc->trim_minlen)
> > > > > > > > > > > >        				goto skip;
> > > > > > > > > > > 
> > > > > > > > > > > Sorry for late reply.
> > > > > > > > > > > 
> > > > > > > > > > > We have a configuration for such case, what do you think of setting
> > > > > > > > > > > max_small_discards to zero? otherwise, w/ above change, max_small_discards
> > > > > > > > > > > logic may be broken?
> > > > > > > > > > > 
> > > > > > > > > > > What:           /sys/fs/f2fs/<disk>/max_small_discards
> > > > > > > > > > > Date:           November 2013
> > > > > > > > > > > Contact:        "Jaegeuk Kim" <jaegeuk.kim@samsung.com>
> > > > > > > > > > > Description:    Controls the issue rate of discard commands that consist of small
> > > > > > > > > > >                      blocks less than 2MB. The candidates to be discarded are cached until
> > > > > > > > > > >                      checkpoint is triggered, and issued during the checkpoint.
> > > > > > > > > > >                      By default, it is disabled with 0.
> > > > > > > > > > > 
> > > > > > > > > > > Or, if we prefer to disable small_discards by default, what about below change:
> > > > > > > > > > 
> > > > > > > > > > I think small_discards is fine, but need to avoid long checkpoint latency only.
> > > > > > > > > 
> > > > > > > > > I didn't get you, do you mean we can still issue small discard by
> > > > > > > > > fstrim, so small_discards functionality is fine?
> > > > > > > > 
> > > > > > > > You got the point.
> > > > > > > 
> > > > > > > Well, actually, what I mean is max_small_discards sysfs entry's functionality
> > > > > > > is broken. Now, the entry can not be used to control number of small discards
> > > > > > > committed by checkpoint.
> > > > > > 
> > > > > > Could you descrbie this problem first?
> > > > > 
> > > > > Oh, alright, actually, I've described this problem literally, but maybe it's not
> > > > > clear, let me give some examples as below:
> > > > > 
> > > > > echo 0 > /sys/fs/f2fs/vdb/max_small_discards
> > > > > xfs_io -f /mnt/f2fs/file -c "pwrite 0 2m" -c "fsync"
> > > > > xfs_io /mnt/f2fs/file -c "fpunch 0 4k"
> > > > > sync
> > > > > cat /proc/fs/f2fs/vdb/discard_plist_info |head -2
> > > > > 
> > > > > echo 100 > /sys/fs/f2fs/vdb/max_small_discards
> > > > > rm /mnt/f2fs/file
> > > > > xfs_io -f /mnt/f2fs/file -c "pwrite 0 2m" -c "fsync"
> > > > > xfs_io /mnt/f2fs/file -c "fpunch 0 4k"
> > > > > sync
> > > > > cat /proc/fs/f2fs/vdb/discard_plist_info |head -2
> > > > > 
> > > > > Before the patch:
> > > > > 
> > > > > Discard pend list(Show diacrd_cmd count on each entry, .:not exist):
> > > > >     0         .       .       .       .       .       .       .       .
> > > > > 
> > > > > Discard pend list(Show diacrd_cmd count on each entry, .:not exist):
> > > > >     0         3       1       .       .       .       .       .       .
> > > > > 
> > > > > After the patch:
> > > > > Discard pend list(Show diacrd_cmd count on each entry, .:not exist):
> > > > >     0         .       .       .       .       .       .       .       .
> > > > > 
> > > > > Discard pend list(Show diacrd_cmd count on each entry, .:not exist):
> > > > >     0         .       .       .       .       .       .       .       .
> > > > > 
> > > > > So, now max_small_discards can not be used to control small discard number
> > > > > cached by checkpoint.
> > > 
> > > Let me explain more:
> > > 
> > > Previously, we have two mechanisms to cache & submit small discards:
> > > 
> > > a) set max small discard number in /sys/fs/f2fs/vdb/max_small_discards, and checkpoint
> > > will cache small discard candidates w/ configured maximum number.
> > > 
> > > b) call FITRIM ioctl, also, checkpoint in f2fs_trim_fs() will cache small discard
> > > candidates w/ configured discard granularity, but w/o limitation of number. FSTRIM
> > > interface is asynchronized, so it won't submit discard directly.
> > > 
> > > Finally, discard thread will submit them in background periodically.
> > > 
> > > So what I mean is the mechanism a) is broken, since no matter how we configure the
> > > sysfs entry /sys/fs/f2fs/vdb/max_small_discards, checkpoint will not cache small
> > > discard candidates any more.
> > 
> > Ok, it seems what I encountered before was adding this small discard even
> > after issuing it by checkpoint. Thoughts?
> 
> Do you mean: in f2fs_clear_prefree_segments(), small discard may overlap
> segment granularity discard?

I didn't dig enough tho, don't think so. Somehow I got a loop as below which
said the same LBA was issued and added back repeatedly, not seen this short log
unfortunately.

> 
> e.g.
> - f2fs_clear_prefree_segments
>  - f2fs_issue_discard(0, 512)  --- segment granularity discard
>  - f2fs_issue_discard(0, 1)  --- small discard
>  - f2fs_issue_discard(5, 1)  --- small discard
> 
> Thanks,
> 
> > 
> > node=0], cp [data=0, node=0, meta=0], app [read=0 (direct=0, buffered=0), mapped=0], compr(buffered=0, mapped=0)], fs [data=0, (gc_data=0, cdata=0), node=0, meta=0]
> >   f2fs_discard-25-752     [003] .....  9744.173085: f2fs_iostat_latency: dev = (254,51), iotype [peak lat.(ms)/avg lat.(ms)/count], rd_data [0/0/0], rd_node [0/0/0], rd_meta [0/0/0], wr_sync_data [0/0/0], wr_sync_node [0/0/0], wr_sync_meta [0/0/0], wr_async_data [0/0/0], wr_async_node [0/0/0], wr_async_meta [0/0/0]
> >   f2fs_discard-25-752     [003] .....  9744.173089: f2fs_issue_discard: dev = (254,51), blkstart = 0x18c0c6, blklen = 0x1
> >   f2fs_discard-25-752     [003] .....  9744.173111: f2fs_issue_discard: dev = (254,51), blkstart = 0x18c0ca, blklen = 0x1
> >   f2fs_discard-25-752     [003] .....  9744.173126: f2fs_issue_discard: dev = (254,51), blkstart = 0x18c116, blklen = 0x1
> >   f2fs_discard-25-752     [003] .....  9744.173140: f2fs_issue_discard: dev = (254,51), blkstart = 0x18c121, blklen = 0x1
> >   f2fs_discard-25-752     [003] .....  9744.173154: f2fs_issue_discard: dev = (254,51), blkstart = 0x18c15b, blklen = 0x1
> >   f2fs_discard-25-752     [003] .....  9744.173169: f2fs_issue_discard: dev = (254,51), blkstart = 0x18c16e, blklen = 0x1
> >   f2fs_discard-25-752     [003] .....  9744.173183: f2fs_issue_discard: dev = (254,51), blkstart = 0x18c181, blklen = 0x1
> >   f2fs_discard-25-752     [004] .....  9744.175272: f2fs_remove_discard: dev = (254,51), blkstart = 0x18c0a9, blklen = 0x1
> >   f2fs_discard-25-752     [004] .....  9744.175345: f2fs_remove_discard: dev = (254,51), blkstart = 0x18c0c6, blklen = 0x1
> >   f2fs_discard-25-752     [004] .....  9744.175348: f2fs_remove_discard: dev = (254,51), blkstart = 0x18c0ca, blklen = 0x1
> >   f2fs_discard-25-752     [004] .....  9744.175352: f2fs_remove_discard: dev = (254,51), blkstart = 0x18c116, blklen = 0x1
> >   f2fs_discard-25-752     [004] .....  9744.175354: f2fs_remove_discard: dev = (254,51), blkstart = 0x18c121, blklen = 0x1
> >   f2fs_discard-25-752     [004] .....  9744.175360: f2fs_remove_discard: dev = (254,51), blkstart = 0x18c15b, blklen = 0x1
> >   f2fs_discard-25-752     [004] .....  9744.175362: f2fs_remove_discard: dev = (254,51), blkstart = 0x18c16e, blklen = 0x1
> >   f2fs_discard-25-752     [004] .....  9744.175367: f2fs_remove_discard: dev = (254,51), blkstart = 0x18c181, blklen = 0x1
> >   f2fs_discard-25-752     [002] .....  9744.228775: f2fs_issue_discard: dev = (254,51), blkstart = 0x18c197, blklen = 0x1
> >   f2fs_discard-25-752     [002] .....  9744.228950: f2fs_issue_discard: dev = (254,51), blkstart = 0x18c1ad, blklen = 0x1
> >   f2fs_discard-25-752     [002] .....  9744.228965: f2fs_issue_discard: dev = (254,51), blkstart = 0x18c1b1, blklen = 0x1
> >   f2fs_discard-25-752     [002] .....  9744.228994: f2fs_issue_discard: dev = (254,51), blkstart = 0x18c1b3, blklen = 0x1
> >   f2fs_discard-25-752     [002] .....  9744.229006: f2fs_issue_discard: dev = (254,51), blkstart = 0x18c27a, blklen = 0x1
> >   f2fs_discard-25-752     [002] .....  9744.229017: f2fs_issue_discard: dev = (254,51), blkstart = 0x18c2a3, blklen = 0x1
> >   f2fs_discard-25-752     [002] .....  9744.229028: f2fs_issue_discard: dev = (254,51), blkstart = 0x18c2ab, blklen = 0x1
> >   f2fs_discard-25-752     [002] .....  9744.229041: f2fs_issue_discard: dev = (254,51), blkstart = 0x18c304, blklen = 0x1
> >   f2fs_discard-25-752     [002] .....  9744.230811: f2fs_remove_discard: dev = (254,51), blkstart = 0x18c197, blklen = 0x1
> >   f2fs_discard-25-752     [002] .....  9744.230926: f2fs_remove_discard: dev = (254,51), blkstart = 0x18c1ad, blklen = 0x1
> >   f2fs_discard-25-752     [002] .....  9744.230929: f2fs_remove_discard: dev = (254,51), blkstart = 0x18c1b1, blklen = 0x1
> >   f2fs_discard-25-752     [002] .....  9744.230932: f2fs_remove_discard: dev = (254,51), blkstart = 0x18c1b3, blklen = 0x1
> >   f2fs_discard-25-752     [002] .....  9744.230940: f2fs_remove_discard: dev = (254,51), blkstart = 0x18c27a, blklen = 0x1
> >   f2fs_discard-25-752     [002] .....  9744.230945: f2fs_remove_discard: dev = (254,51), blkstart = 0x18c2a3, blklen = 0x1
> >   f2fs_discard-25-752     [002] .....  9744.230947: f2fs_remove_discard: dev = (254,51), blkstart = 0x18c2ab, blklen = 0x1
> >   f2fs_discard-25-752     [002] .....  9744.230952: f2fs_remove_discard: dev = (254,51), blkstart = 0x18c304, blklen = 0x1
> > 
> > > 
> > > So, it needs to fix max_small_discards sysfs functionality? or just drop the
> > > functionality?
> > > 
> > > > 
> > > > Since we do not submit small discards anymore during checkpoint. Why not relying
> > > > on the discard thread to issue them?
> > > 
> > > Sorry, I'm not sure I get your point, do you mean max_small_discards functionality
> > > is obsoleted, so it recommended to use fstrim to cache & submit small discards?
> > > 
> > > Let me know, if I'm missing something or misunderstanding the point.
> > > 
> > > Thanks,
> > > 
> > > > 
> > > > > 
> > > > > Thanks,
> > > > > 
> > > > > > 
> > > > > > > 
> > > > > > > I think there is another way to achieve "avoid long checkpoint latency caused
> > > > > > > by committing huge # of small discards", the way is we can set max_small_discards
> > > > > > > to small value or zero, w/ such configuration, it will take checkpoint much less
> > > > > > > time or no time to committing small discard due to below control logic:
> > > > > > > 
> > > > > > > f2fs_flush_sit_entries()
> > > > > > > {
> > > > > > > ...
> > > > > > > 			if (!(cpc->reason & CP_DISCARD)) {
> > > > > > > 				cpc->trim_start = segno;
> > > > > > > 				add_discard_addrs(sbi, cpc, false);
> > > > > > > 			}
> > > > > > > ...
> > > > > > > }
> > > > > > > 
> > > > > > > add_discard_addrs()
> > > > > > > {
> > > > > > > ...
> > > > > > > 	while (force || SM_I(sbi)->dcc_info->nr_discards <=
> > > > > > > 				SM_I(sbi)->dcc_info->max_discards) {
> > > > > > > 
> > > > > > > It will break the loop once nr_discards is larger than max_discards, if
> > > > > > > max_discards is set to zero, checkpoint won't take time to handle small discards.
> > > > > > > 
> > > > > > > ...
> > > > > > > 		if (!de) {
> > > > > > > 			de = f2fs_kmem_cache_alloc(discard_entry_slab,
> > > > > > > 						GFP_F2FS_ZERO, true, NULL);
> > > > > > > 			de->start_blkaddr = START_BLOCK(sbi, cpc->trim_start);
> > > > > > > 			list_add_tail(&de->list, head);
> > > > > > > 		}
> > > > > > > ...
> > > > > > > 	}
> > > > > > > ...
> > > > > > > 
> > > > > > > Thanks,
> > > > > > > 
> > > > > > > > 
> > > > > > > > > 
> > > > > > > > > Thanks,
> > > > > > > > > 
> > > > > > > > > > 
> > > > > > > > > > > 
> > > > > > > > > > >      From eb89d9b56e817e3046d7fa17165b12416f09d456 Mon Sep 17 00:00:00 2001
> > > > > > > > > > > From: Chao Yu <chao@kernel.org>
> > > > > > > > > > > Date: Mon, 3 Jul 2023 09:06:53 +0800
> > > > > > > > > > > Subject: [PATCH] Revert "f2fs: enable small discard by default"
> > > > > > > > > > > 
> > > > > > > > > > > This reverts commit d618ebaf0aa83d175658aea5291e0c459d471d39 in order
> > > > > > > > > > > to disable small discard by default, so that if there're huge number of
> > > > > > > > > > > small discards, it will decrease checkpoint's latency obviously.
> > > > > > > > > > > 
> > > > > > > > > > > Also, this patch reverts 9ac00e7cef10 ("f2fs: do not issue small discard
> > > > > > > > > > > commands during checkpoint"), due to it breaks small discard feature which
> > > > > > > > > > > may be configured via sysfs entry max_small_discards.
> > > > > > > > > > > 
> > > > > > > > > > > Fixes: 9ac00e7cef10 ("f2fs: do not issue small discard commands during checkpoint")
> > > > > > > > > > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > > > > > > > > > ---
> > > > > > > > > > >       fs/f2fs/segment.c | 4 ++--
> > > > > > > > > > >       1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > > > > > > > 
> > > > > > > > > > > diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
> > > > > > > > > > > index 14c822e5c9c9..0a313368f18b 100644
> > > > > > > > > > > --- a/fs/f2fs/segment.c
> > > > > > > > > > > +++ b/fs/f2fs/segment.c
> > > > > > > > > > > @@ -2193,7 +2193,7 @@ void f2fs_clear_prefree_segments(struct f2fs_sb_info *sbi,
> > > > > > > > > > >       			len = next_pos - cur_pos;
> > > > > > > > > > > 
> > > > > > > > > > >       			if (f2fs_sb_has_blkzoned(sbi) ||
> > > > > > > > > > > -					!force || len < cpc->trim_minlen)
> > > > > > > > > > > +			    (force && len < cpc->trim_minlen))
> > > > > > > > > > >       				goto skip;
> > > > > > > > > > > 
> > > > > > > > > > >       			f2fs_issue_discard(sbi, entry->start_blkaddr + cur_pos,
> > > > > > > > > > > @@ -2269,7 +2269,7 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
> > > > > > > > > > >       	atomic_set(&dcc->queued_discard, 0);
> > > > > > > > > > >       	atomic_set(&dcc->discard_cmd_cnt, 0);
> > > > > > > > > > >       	dcc->nr_discards = 0;
> > > > > > > > > > > -	dcc->max_discards = MAIN_SEGS(sbi) << sbi->log_blocks_per_seg;
> > > > > > > > > > > +	dcc->max_discards = 0;
> > > > > > > > > > >       	dcc->max_discard_request = DEF_MAX_DISCARD_REQUEST;
> > > > > > > > > > >       	dcc->min_discard_issue_time = DEF_MIN_DISCARD_ISSUE_TIME;
> > > > > > > > > > >       	dcc->mid_discard_issue_time = DEF_MID_DISCARD_ISSUE_TIME;
> > > > > > > > > > > -- 
> > > > > > > > > > > 2.40.1
> > > > > > > > > > > 
> > > > > > > > > > > 
> > > > > > > > > > > 
> > > > > > > > > > > >        			f2fs_issue_discard(sbi, entry->start_blkaddr + cur_pos,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
