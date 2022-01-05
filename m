Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EA048553B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  5 Jan 2022 16:02:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1n57ng-00005P-4B; Wed, 05 Jan 2022 15:02:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <gregkh@linuxfoundation.org>) id 1n57ne-00005G-66
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 05 Jan 2022 15:02:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MnKymvyb8XATeSMUgF++O29wdaRbTg36dhMwR8StyBE=; b=Y3WUxDWCxAPldSKZ0OE/KigckO
 afdoTsZp6dKJC6JLf6UMzpg18T7M1Sl9ZpqoYS8pDbp/40LyLCY2g7bGzOHmEtl8b/uOP5fK3RiOA
 UAno4Vbjt3QVCFM8GmySvTezP0yhWz6v9jAzdYMDu+UwR3m65sLlRNAUsT7CunenXAzM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MnKymvyb8XATeSMUgF++O29wdaRbTg36dhMwR8StyBE=; b=iZiSRq8OyTVA/SFwxRTvo0ZqV7
 zcHFIkhu7zbB+Rd21Iq2Moq/YhKE+dl1pPvEnH9oQXciavVn4nP2KUQVQrCwy+0EiFWNVZK/Tx4RI
 jRIgwOzIYWgf+1rKLSw2mPIhTulLJUfnjRgu0uFRw3H4GMT+Q66C+L2XetlMNibuVfZQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1n57nW-0008RX-D2
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 05 Jan 2022 15:02:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3898561771;
 Wed,  5 Jan 2022 15:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11A23C36AE3;
 Wed,  5 Jan 2022 15:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1641394903;
 bh=CD89Bk4p1/Y++Rnwm7lJnL3hwXMixERyPrxxV9HwqIQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KJAkbj0mHkka3crRuvSFpNd3Av83nJ13NMsUI571Id4ZACnXqMU28BRLbX2dWtwaU
 14V0upTnn2+NbBQjJwtXzOY5qkEHmokPNGYJt97lWbqapsfQo/l/9b1Fzv3mLmSz6p
 k324HYaW538QvA0oa4SDhJFPfq5yHNuKgABPoY9M=
Date: Wed, 5 Jan 2022 16:01:40 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YdWy1I7pFrnV4NTa@kroah.com>
References: <20220104130513.3077-1-chao@kernel.org>
 <YdRJEBhSg8vlD6cP@kroah.com>
 <53d75d26-2289-a66a-a7fa-62593bad81c8@kernel.org>
 <YdRk8tXZ6PHXKLJV@kroah.com>
 <f07cbfa3-29f8-c671-98cf-45b664000f95@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f07cbfa3-29f8-c671-98cf-45b664000f95@kernel.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Jan 04, 2022 at 11:48:25PM +0800, Chao Yu wrote: >
 On 2022/1/4 23:17, Greg KH wrote: > > On Tue, Jan 04, 2022 at 11:05:36PM
 +0800, Chao Yu wrote: > > > On 2022/1/4 21:18, Greg KH wrote: > > > [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1n57nW-0008RX-D2
Subject: Re: [f2fs-dev] [PATCH] f2fs: quota: fix potential deadlock
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
Cc: jaegeuk@kernel.org, Yi Zhuang <zhuangyi1@huawei.com>,
 stable@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Jan 04, 2022 at 11:48:25PM +0800, Chao Yu wrote:
> On 2022/1/4 23:17, Greg KH wrote:
> > On Tue, Jan 04, 2022 at 11:05:36PM +0800, Chao Yu wrote:
> > > On 2022/1/4 21:18, Greg KH wrote:
> > > > On Tue, Jan 04, 2022 at 09:05:13PM +0800, Chao Yu wrote:
> > > > > commit a5c0042200b28fff3bde6fa128ddeaef97990f8d upstream.
> > > > > 
> > > > > As Yi Zhuang reported in bugzilla:
> > > > > 
> > > > > https://bugzilla.kernel.org/show_bug.cgi?id=214299
> > > > > 
> > > > > There is potential deadlock during quota data flush as below:
> > > > > 
> > > > > Thread A:			Thread B:
> > > > > f2fs_dquot_acquire
> > > > > down_read(&sbi->quota_sem)
> > > > > 				f2fs_write_checkpoint
> > > > > 				block_operations
> > > > > 				f2fs_look_all
> > > > > 				down_write(&sbi->cp_rwsem)
> > > > > f2fs_quota_write
> > > > > f2fs_write_begin
> > > > > __do_map_lock
> > > > > f2fs_lock_op
> > > > > down_read(&sbi->cp_rwsem)
> > > > > 				__need_flush_qutoa
> > > > > 				down_write(&sbi->quota_sem)
> > > > > 
> > > > > This patch changes block_operations() to use trylock, if it fails,
> > > > > it means there is potential quota data updater, in this condition,
> > > > > let's flush quota data first and then trylock again to check dirty
> > > > > status of quota data.
> > > > > 
> > > > > The side effect is: in heavy race condition (e.g. multi quota data
> > > > > upaters vs quota data flusher), it may decrease the probability of
> > > > > synchronizing quota data successfully in checkpoint() due to limited
> > > > > retry time of quota flush.
> > > > > 
> > > > > Fixes: db6ec53b7e03 ("f2fs: add a rw_sem to cover quota flag changes")
> > > > > Cc: stable@vger.kernel.org # v5.3+
> > > > > Reported-by: Yi Zhuang <zhuangyi1@huawei.com>
> > > > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > > > ---
> > > > >    fs/f2fs/checkpoint.c | 3 ++-
> > > > >    1 file changed, 2 insertions(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
> > > > > index 83e9bc0f91ff..7b0282724231 100644
> > > > > --- a/fs/f2fs/checkpoint.c
> > > > > +++ b/fs/f2fs/checkpoint.c
> > > > > @@ -1162,7 +1162,8 @@ static bool __need_flush_quota(struct f2fs_sb_info *sbi)
> > > > >    	if (!is_journalled_quota(sbi))
> > > > >    		return false;
> > > > > -	down_write(&sbi->quota_sem);
> > > > > +	if (!down_write_trylock(&sbi->quota_sem))
> > > > > +		return true;
> > > > >    	if (is_sbi_flag_set(sbi, SBI_QUOTA_SKIP_FLUSH)) {
> > > > >    		ret = false;
> > > > >    	} else if (is_sbi_flag_set(sbi, SBI_QUOTA_NEED_REPAIR)) {
> > > > > -- 
> > > > > 2.32.0
> > > > > 
> > > > 
> > > > What stable tree(s) is this for?
> > > 
> > > Oh, please help to try applying to 5.4, 5.10, and 5.15 stable trees, thanks!
> > 
> > This is already in the 5.15.6 kernel release, do you need it applied
> > there again?  :)
> 
> Oops, no, so 5.4 and 5.10 is enough. ;)
> We can skip 5.15 since this patch was merged in 5.15-rc1 at the first time.

It was merged in 5.16-rc1, and then backported to 5.15.6.  You might
want to check your git scripts.

Anyway, now queued up, thanks.

greg k-h


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
