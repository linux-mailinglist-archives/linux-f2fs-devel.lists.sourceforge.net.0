Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C90636E117B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Apr 2023 17:55:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pmzHp-0000OA-LR;
	Thu, 13 Apr 2023 15:55:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pmzHo-0000Nw-0n
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Apr 2023 15:55:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yPug8uwzqMZxOSLnZtzqocKtcET+KBOz8LLuiDR4RjM=; b=hWU8WaHeNP1t7Xuu3uViapia2W
 pUdBvBCVm5V02oEYQ14yIl4tJIvAeJZvdjM/jnOTak7MD9RYzX20VL8a7uNvcG8tUnS9+SYRwnoYq
 kasSO6uJtm98CWXggfh7jQjME/kbjZSLPnvaF+RdAuKKAe6XxD80880xIjizz5myYI/8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yPug8uwzqMZxOSLnZtzqocKtcET+KBOz8LLuiDR4RjM=; b=YJzPcrzBBn0VXdfGJK98zq8woH
 1l6B/XiT1zmRLKrizTFq/EFBv/CRQ5zXXsue3KIHpgZgECrDDExgp+6YUkyqPmPIrQkGSv9XNXqdt
 NQ3zrqDgFG9SkGukooEdtRdisTnBMCnD3LFgrgW08Z1KSbAHSrBOEAt1eCtKgswVoL/w=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pmzHo-0006bB-8w for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Apr 2023 15:55:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D808161357;
 Thu, 13 Apr 2023 15:54:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B3EFC433D2;
 Thu, 13 Apr 2023 15:54:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681401294;
 bh=o4ODpdXxs0R0RlNul9JlHgYE6YejXTJwLDkZoKzub5M=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=D39YPG/eK4fIhVrODY+Le+B0dyr789mrvtJCpy+vKoGxzVZkazoyNu6+sSdHmFkk/
 gCSWym3u1TpU068BaSVP7IYXo7/wm0wPV4pPALJZpx5zQXjRW2ouMvQxGVt/k6EECX
 vqw5HgbyK9SYCk0QLKnbOMxyeW+FbmTySwC1QvHr0C+YbCpqGdyQ0bwyFJVgQbWl1k
 z6WjsaXrXG4Kb971ww534tF/AlDGef2Yrm7c9o5lUCen4HUuFaIQviovTXhyCRecGq
 DxXHo2KTxWbP4Sh0NlrwZIxD5OPXLPd1W6I3QludiPFRurL6cqmzdQfZlUpVeO6TqY
 ZA6+6LUncmTbA==
Date: Thu, 13 Apr 2023 08:54:52 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZDglzIoEp3dH3eOS@google.com>
References: <20230406191629.63024-1-frank.li@vivo.com>
 <2e41d6e0-13bb-fa5d-00aa-75865b8e7c34@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2e41d6e0-13bb-fa5d-00aa-75865b8e7c34@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/13, Chao Yu wrote: > On 2023/4/7 3:16,
 Yangtao Li wrote:
 > > Convert to use remove_proc_subtree() and kill kobject_del() directly.
 > > kobject_put() actually covers kobject removal automatically [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pmzHo-0006bB-8w
Subject: Re: [f2fs-dev] [PATCH] f2fs: remove bulk remove_proc_entry() and
 unnecessary kobject_del()
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/13, Chao Yu wrote:
> On 2023/4/7 3:16, Yangtao Li wrote:
> > Convert to use remove_proc_subtree() and kill kobject_del() directly.
> > kobject_put() actually covers kobject removal automatically, which is
> > single stage removal.
> > 
> > Signed-off-by: Yangtao Li <frank.li@vivo.com>
> > ---
> >   fs/f2fs/sysfs.c | 15 ++-------------
> >   1 file changed, 2 insertions(+), 13 deletions(-)
> > 
> > diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> > index dfbd17802549..3aad3500a701 100644
> > --- a/fs/f2fs/sysfs.c
> > +++ b/fs/f2fs/sysfs.c
> > @@ -1461,25 +1461,14 @@ int f2fs_register_sysfs(struct f2fs_sb_info *sbi)
> >   void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi)
> >   {
> > -	if (sbi->s_proc) {
> > -#ifdef CONFIG_F2FS_IOSTAT
> > -		remove_proc_entry("iostat_info", sbi->s_proc);
> > -#endif
> > -		remove_proc_entry("segment_info", sbi->s_proc);
> > -		remove_proc_entry("segment_bits", sbi->s_proc);
> > -		remove_proc_entry("victim_bits", sbi->s_proc);
> > -		remove_proc_entry("discard_plist_info", sbi->s_proc);
> > -		remove_proc_entry(sbi->sb->s_id, f2fs_proc_root);
> > -	}
> > +	if (sbi->s_proc)
> > +		remove_proc_subtree(sbi->sb->s_id, f2fs_proc_root);
> > -	kobject_del(&sbi->s_stat_kobj);
> 
> - f2fs_register_sysfs
>  - kobject_init_and_add(&sbi->s_stat_kobj, ..)
> 
> /**
>  * kobject_init_and_add() - Initialize a kobject structure and add it to
>  *                          the kobject hierarchy.
> ...
>  *
>  * This function combines the call to kobject_init() and kobject_add().
> ...
>  */
> 
> /**
>  * kobject_del() - Unlink kobject from hierarchy.
>  * @kobj: object.
>  *
>  * This is the function that should be called to delete an object
>  * successfully added via kobject_add().
>  */
> 
> Am I missing something?

kobject_put -> kobject_cleanup was supposed to do it?

> 
> Thanks,
> 
> >   	kobject_put(&sbi->s_stat_kobj);
> >   	wait_for_completion(&sbi->s_stat_kobj_unregister);
> > -	kobject_del(&sbi->s_feature_list_kobj);
> >   	kobject_put(&sbi->s_feature_list_kobj);
> >   	wait_for_completion(&sbi->s_feature_list_kobj_unregister);
> > -	kobject_del(&sbi->s_kobj);
> >   	kobject_put(&sbi->s_kobj);
> >   	wait_for_completion(&sbi->s_kobj_unregister);
> >   }


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
