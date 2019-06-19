Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC1524AFDD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Jun 2019 04:08:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hdQ1f-00062e-Fw; Wed, 19 Jun 2019 02:08:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hdQ1d-00062O-RD
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Jun 2019 02:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H/n5keYtcpezB5ks7Ll0CKFUlXor7AsxFFaJmg9lX/Q=; b=FKo82ZIa7qg0gyDYe6i1bQzJPW
 aVnlYnFodRYiqg9G0p6wizJ+jRjhPWU54BSwNSgZtzavT3SpXzbUahgg4eqz9NQt97mq6tQN48FGd
 ekg/3sq/G51DE3mNt2DRi0C1Fgh1SjreF9vzqseGIj+NwlwWtcHo1/LAOHPWAT5mliSg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H/n5keYtcpezB5ks7Ll0CKFUlXor7AsxFFaJmg9lX/Q=; b=TiM2ThZ7bZeHUToE7TFQEHmLsE
 RypFpeFOhHLX6hGQ+9Ryir7+zVGlZQZZrfG/Natk+R+PCJGftip9TXwF8/19qk80H5f+JlT8lemvs
 7XZLI6BDcA7f8k4tkaapj7TWFhMJv6QPoAZ6bQMBuLRwjWxSJLjkkwjDnt/PpPPmcpXQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hdQ1b-00GVAW-17
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Jun 2019 02:08:37 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EC44520863;
 Wed, 19 Jun 2019 02:08:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1560910107;
 bh=rvhJw8Hyr+ITLOGNar1oGROo4CxqfckrE6ZP4SykFYI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MCa/a5qKKYe2B5IEQOdgVbJ63CRfjSlr7gOjlOxA98D/XGOCEzi721fb91CihluSB
 nYZb1G929gToJJLcK3FZgacdeMYcfV1byiFevmKEEX9Zd8x0ICSzWQZPBxH5adjWKT
 m93eCNrlsFew7DJ68dk/EYVsVNyjVahW6bidnT7k=
Date: Tue, 18 Jun 2019 19:08:25 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Kassey <kassey1216@gmail.com>
Message-ID: <20190619020825.GA42712@jaegeuk-macbookpro.roam.corp.google.com>
References: <CAKwPUoyvn6mjEw=DfPTpLBZy-NQvtd8fpjfpwRRGMvqshB5gxw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAKwPUoyvn6mjEw=DfPTpLBZy-NQvtd8fpjfpwRRGMvqshB5gxw@mail.gmail.com>
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
X-Headers-End: 1hdQ1b-00GVAW-17
Subject: Re: [f2fs-dev] f2fs: wait_on_all_pages_writeback 4.4 kernel
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
Cc: kassey@126.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Kassey,

I remember there was a bug related to this.

Could you check this out?

https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-stable.git/commit/?h=linux-4.4.y&id=45afbd380596bb505970070d9521d607de22bd6b

Thanks,

On 06/19, Kassey wrote:
> hi, Chao and team:
>    we got dump on arm64 that showing a task is sleep on
> wait_on_all_pages_writeback
>   by checking the sbi->nr_pages, we can see that the value is negative
> for F2FS_WB_CP_DATA
>   caused the problem to wait .
> 
>   can you help to suggest if any reasaon that we are seeing negative
> value here  ?
> 
> nr_pages = (
>         (counter = 0),
>         (counter = 30005),
>         (counter = 0),
>         (counter = 79),
>         (counter = 0),
>         (counter = 0),
>         (counter = 9),
>         (counter = -6),
>         (counter = 6)),
> 
> 
> -000|__switch_to(prev = 0xFFFFFFF74A1F8EC0, next = 0xFFFFFFF8B2C21D80)
> -001|__schedule(preempt = FALSE)
> -002|need_resched(inline)
> -002|schedule()
> -003|schedule_timeout(?)
> -004|get_current(inline)
> -004|io_schedule_timeout(timeout = 0x01F4)
> -005|get_pages(inline)
> -005|wait_on_all_pages_writeback(sbi = 0xFFFFFFF7A7323000)
> -006|do_checkpoint(sbi = 0xFFFFFFF7A7323000, cpc = 0xFFFFFFF760C43C28)
> -007|f2fs_write_checkpoint(sbi = 0xFFFFFFF7A7323000, cpc = 0xFFFFFFF760C43C28)
> -008|f2fs_sync_fs(sb = 0xFFFFFFF887139800, ?)
> -009|f2fs_do_sync_file(?, ?, ?, datasync = 0x0, atomic = TRUE)
> -010|is_inode_flag_set(inline)
> -010|f2fs_is_atomic_file(inline)
> -010|f2fs_ioc_commit_atomic_write(inline)
> -010|f2fs_ioctl(filp = 0xFFFFFFF811E4E3C0, ?, ?)
> -011|f2fs_compat_ioctl(file = 0xFFFFFFF811E4E3C0, ?, ?)
> -012|compat_sys_ioctl(fd = 0xA7, cmd = 0xF502, ?)
> -013|oppo_root_check(asm)
> -014|__sys_trace(asm)
> -015|NSX:0xFFFFFFBFFE7FC7C0(asm)
>  -->|exception
> -016|NUR:0xEDD8236C(asm)
>  ---|end of frame
> 
> 
> 
> 
> 
> -- 
> Best regards
> Kassey


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
