Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 86F4982C44B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jan 2024 18:09:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rOL1y-0005zE-OJ;
	Fri, 12 Jan 2024 17:09:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1rOL1x-0005z7-3b
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jan 2024 17:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KMeHdglnWzxd7RAnUb7Ks2qUqeLYXYvyecYuHzEA9Mg=; b=S66yd7OA30RC4EjPr4laSTWvzq
 pk8lBcqaaMqeW8QUpvgg9DB7GB4QM+54AM8x8VI4Kvc0pvMl7gnsL0lEFfm0B+K7bxYBeF3iOt+KN
 uourXnqdMYZXgS98qlu/fJ4huMc5+vjMDKOCVSEeSDZwN/NajF5OXOkTQ5sY1bSywx5g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KMeHdglnWzxd7RAnUb7Ks2qUqeLYXYvyecYuHzEA9Mg=; b=Yn7AXv7RSi+itkFfKscDkesTWJ
 7PTY1rOZhs462HCzq4Q5/e1qGMKBLUgrYvCtrnX12E6bfp+UAbokDGsaMPe3wEK6TYwohnox8i/UC
 oXVD2zvZiJLpxyfcyjbm/uDks5ERF0Q3azzDDHChjLT1s7bOui15UvRQDXod2XYHv7Yg=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rOL1v-0008HM-Py for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jan 2024 17:09:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 6A3BCCE2082;
 Fri, 12 Jan 2024 17:09:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3ABC43390;
 Fri, 12 Jan 2024 17:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705079340;
 bh=GDl6p3UZsPjLAqZ6riRDVB5aigv9wH3zVmTnLWIcCLI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oT6zVPJ1R4hpGcq1aYlIz3BQCRh9WApN8ONK8zmQdxhnpvQ4qnEitpsH/OaFXD7Lv
 pQYWqm+0WDhpeJreemXvrlAuK7AU4Hc4uIa4nlQpz0d9OLm0gGEjjyuSO4bLv48gNO
 wBpO2MgUt2REUjD9v8uQbuBBLgFkt9lh8NTLS8FdPZ7WLpCskAkiT3zi21d7UqBtVn
 JS1S7XlfxIALEhlgXbbrghvQDmBraimE2YU1/uOKIyP/EdEnD3lIBU9TDoZp54fiW3
 BjRIr4aEZruzFNycr5wKIvzaDW8rkO23ZZAW9/S2AOwa7o5iLpehdKKUeZX6/SHQtS
 MMuYRYDBwcCZw==
Date: Fri, 12 Jan 2024 09:08:58 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Al Viro <viro@zeniv.linux.org.uk>
Message-ID: <ZaFyKl-iqh9J64du@google.com>
References: <ZaAzOgd3iWL0feTU@google.com>
 <CAHk-=wgTbey3-RCz8ZpmTsMhUGf02YVV068k3OzrmOvJPowXfw@mail.gmail.com>
 <20240112071242.GA1674809@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240112071242.GA1674809@ZenIV>
X-Spam-Score: -4.6 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/12, Al Viro wrote: > On Thu, Jan 11, 2024 at 09:05:51PM
 -0800, Linus Torvalds wrote: > > On Thu, 11 Jan 2024 at 10:28, Jaegeuk Kim
 <jaegeuk@kernel.org> wrote: > > > > > > git://git.kernel.org/pu [...] 
 Content analysis details:   (-4.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rOL1v-0008HM-Py
Subject: Re: [f2fs-dev] [GIT PULL] f2fs update for 6.8-rc1
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
Cc: Linus Torvalds <torvalds@linux-foundation.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux F2FS Dev Mailing List <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/12, Al Viro wrote:
> On Thu, Jan 11, 2024 at 09:05:51PM -0800, Linus Torvalds wrote:
> > On Thu, 11 Jan 2024 at 10:28, Jaegeuk Kim <jaegeuk@kernel.org> wrote:
> > >
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git tags/f2fs-for-6.8-rc1
> > 
> > Hmm. I got a somewhat confusing conflict in f2fs_rename().
> > 
> > And honestly, I really don't know what the right resolution is. What I
> > ended up with was this:
> > 
> >         if (old_is_dir) {
> >                 if (old_dir_entry)
> >                         f2fs_set_link(old_inode, old_dir_entry,
> >                                                 old_dir_page, new_dir);
> >                 else
> >                         f2fs_put_page(old_dir_page, 0);
> 
> Where would you end up with old_dir_page != NULL and old_dir_entry == NULL?
> old_dir_page is initialized to NULL and the only place where it's altered
> is
>                 old_dir_entry = f2fs_parent_dir(old_inode, &old_dir_page);
> Which is immediately followed by
>                 if (!old_dir_entry) {
>                         if (IS_ERR(old_dir_page))
>                                 err = PTR_ERR(old_dir_page);
>                         goto out_old;
>                 }
> so we are *not* going to end up at that if (old_is_dir) in that case.

It seems [1] changed the condition of getting old_dir_page reference as below,
which made f2fs_put_page(old_dir_page, 0) voided.

-       if (S_ISDIR(old_inode->i_mode)) {
+       if (old_is_dir && old_dir != new_dir) {
                old_dir_entry = f2fs_parent_dir(old_inode, &old_dir_page);
                if (!old_dir_entry) {
                        if (IS_ERR(old_dir_page))

[1] 7deee77b993a ("f2fs: Avoid reading renamed directory if parent does not change")

> 
> Original would have been more clear as
> 	if (old_is_dir) {
> 		if (old_dir != new_dir) {
> 			/* we have .. in old_dir_page/old_dir_entry */
> 			if (!whiteout)
> 	                        f2fs_set_link(old_inode, old_dir_entry,
>                                                 old_dir_page, new_dir);
> 			else
> 	                        f2fs_put_page(old_dir_page, 0);
> 		}
>                 f2fs_i_links_write(old_dir, false);
> 	}
> - it is equivalent to what that code used to do.  And "don't update ..
> if we are leaving a whiteout behind" was teh bug fixed by commit
> in f2fs tree...
> 
> The bottom line: your variant is not broken, but only because
> f2fs_put_page() starts with
> static inline void f2fs_put_page(struct page *page, int unlock)
> {
>         if (!page)
>                 return;
> 
> IOW, you are doing f2fs_put_page(NULL, 0), which is an explicit no-op.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
