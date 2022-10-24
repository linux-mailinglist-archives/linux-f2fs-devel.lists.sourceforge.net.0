Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CB860B49B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Oct 2022 19:55:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1on1fY-00077z-Kp;
	Mon, 24 Oct 2022 17:55:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1on1fX-00077l-7U
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Oct 2022 17:55:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u+ElbLpV9PwM+nc2KjbX0cOI1rgej0JCw6fnLN9fEEw=; b=ii8LeetLfB0XskLuFTujTBJsKp
 4p3bEBQg1Yua5yEYy3f+or5A2xrMUJbP2JL09jTkgjM8MCRaJcHA7nXeLBslNUua01AhIRagAPapv
 X58mSD5KMB1EDcQiNrZuw8aSsyUYYqDyF9Xk8WODAb01HpgfnKGIeUl1WRuBF8/pTJ/8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u+ElbLpV9PwM+nc2KjbX0cOI1rgej0JCw6fnLN9fEEw=; b=FlBuCS0DktsYThi7lrIUpUcdJT
 qzZF7eWItpD8Ybco3cA5/PIkTNKJFAK4XWU3Uf+mLwSdWd47xpthZhe6si+2nvtA4Uo+Q1xIYjy1h
 mEmsKwpJtPENtNi4b+OIXBCUnTjIvFSxc5OvgrAVZSUWpsPubNH9uLQlD+IkQBol5V9w=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1on1fT-00033m-FW for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Oct 2022 17:55:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4602561504;
 Mon, 24 Oct 2022 17:55:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9221DC433D6;
 Mon, 24 Oct 2022 17:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666634108;
 bh=TZafC3FCBwyCdhLS3WGPtwk2Fa0PcLeiroN/lPKgcEw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p615aO4UoV6y3ZcDSrk+2YIYhQ3lIvz8WEwmw8b63tjK0/2OVRqcZRExCk9SBGKgm
 QKxazzbzyEdJ9nhEgFL4BO1Rg/tmZ5GJD1Xlxvas6mVUGUsW0vTKWXQnYD9TYVmRCS
 EeS/02Soz5uXmebwWnko0ZZAANbcpS9VfeA+SfSMv5lcBOnv87SHMBh77gr9UHq5U2
 cgqkcdv2R2klZxRYeB6EtoKWCCNKrc/RJkn5/1ze3sa5rjbgbPVqTdIU8EyMgqJBev
 A4Y8W0g1H631X0bSo8ddu53z/lcHZWvjbIwLSCWaqPwJ70bc6SSsqEHR7VYPwf4Iaq
 S/JN2gEf+RmiA==
Date: Mon, 24 Oct 2022 10:55:06 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
Message-ID: <Y1bRepqUMmSbPwy4@google.com>
References: <20221010221548.2728860-1-jaegeuk@kernel.org>
 <20221020090708.tiysx3qsgatb3ngv@shindev>
 <Y1HXP7ysrNXX+oR8@google.com>
 <20221021043008.puq6iizza4il3w6s@shindev>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221021043008.puq6iizza4il3w6s@shindev>
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/21, Shinichiro Kawasaki wrote: > On Oct 20,
 2022 / 16:18, 
 Jaegeuk Kim wrote: > > ... > > > Thanks, I think that fix looks good to me.
 I applied into the original patch. > > https://git.kernel.or [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1on1fT-00033m-FW
Subject: Re: [f2fs-dev] [PATCH 1/3] f2fs-tools: give less overprovisioning
 space
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/21, Shinichiro Kawasaki wrote:
> On Oct 20, 2022 / 16:18, Jaegeuk Kim wrote:
> 
> ...
> 
> > Thanks, I think that fix looks good to me. I applied into the original patch.
> > https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git/commit/?h=dev&id=281d3e72370f6c39c0d57acaf37a7f0e003ddd28
> 
> Oh, happy to know that the fix is good. And thank you for adding my SoB tag.
> 
> One more thing, my fix missed care for fsck/resize.c. I suggest to apply one
> more hunk below to the commit in same manner as mkfs/f2fs_format.c.
> 
> diff --git a/fsck/resize.c b/fsck/resize.c
> index c048b16..79945e1 100644
> --- a/fsck/resize.c
> +++ b/fsck/resize.c
> @@ -476,8 +476,8 @@ static void rebuild_checkpoint(struct f2fs_sb_info *sbi,
>                         get_cp(rsvd_segment_count)) *
>                         c.new_overprovision / 100);
> 
> -       if (get_cp(rsvd_segment_count) > get_cp(overprov_segment_count))
> -               ASSERT_MSG("Cannot support wrong overprovision ratio\n");
> +       if (get_cp(overprov_segment_count) < get_cp(rsvd_segment_count))
> +               set_cp(overprov_segment_count, get_cp(rsvd_segment_count));
> 
>         DBG(0, "Info: Overprovision ratio = %.3lf%%\n", c.new_overprovision);
>         DBG(0, "Info: Overprovision segments = %u (GC reserved = %u)\n",
> 
> Without this change, the assert message "Cannot support wrong overprovision
> ratio" was printed when I ran resize.f2fs -t X command to the f2fs formatted
> with mkfs.f2fs -s Y. With the change above, the assert message is not printed.

Thanks, applied.

> 
> > 
> > > 
> > > FYI, I tried to fix and created a patch which allows reserved segments larger
> > > than overprovisioning segments [1]. It compares those two, and take larger one
> > > to subtract from usable segments to get the segments for users. I confirmed it
> > > keeps small number of overprovisioning segments for no -s option case, and
> > > avoids the mkfs.f2fs failure for the -s option and zoned block device cases.
> > > However, it increases runtime of my test script which fills f2fs and do file
> > > overwrites to test f2fs GC on zoned block devices. It takes +60% longer runtime.
> > > Then GC performance looks worse than before, and this fix does not look good
> > > for me.
> > 
> > I think you can try to avoid that by tuning /sys/fs/f2fs/xx/reserved_blocks?
> 
> Thanks, I was able to shorten the runtime using the sysfs attribute. So the
> longer GC time was just caused by the smaller reserved segments size. Good.
> 
> -- 
> Shin'ichiro Kawasaki


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
