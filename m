Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FF297D86E4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Oct 2023 18:45:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qw3Ti-0004Qx-41;
	Thu, 26 Oct 2023 16:45:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qw3Tg-0004Qb-HS
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Oct 2023 16:45:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tNpga17SOvfenn497hnU2DxJQ7/tEPaQwi325saBToA=; b=IgrGtHQG1a85qcro3huOqvpMRN
 Xpq9GhNB3MbaqOdifhe2yv9MxZoltuVz9gzEFwJ4wpYUliAjSauraIVTkWvS8ATIvCb4QHRfJHv+Y
 +CYdsm8Z/GJVB3ig0v6jZlLhE32+bpvRKS+/Vjkz7CQG9cAIa3Dc8Itb2mItAzZckx8g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tNpga17SOvfenn497hnU2DxJQ7/tEPaQwi325saBToA=; b=X7+ApQO2dItF5mL/MNTmH+vwaL
 lGxNGVP0lrhbbjCqEzMA5HXt1TU4mCpnEAILFFdkzS5ipqGp56wqwHKvzBECzXvYi4fZ69pVwCcwu
 4yvWcnw3P2VBxo24DOsES5K17fpO2BcdGIXk5fhEO3rayDNEUZW9Y8BVrE5pW9BIBDzU=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qw3Tc-0000WR-KQ for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 26 Oct 2023 16:45:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 355AA60F23;
 Thu, 26 Oct 2023 16:44:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 921A0C433C8;
 Thu, 26 Oct 2023 16:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1698338690;
 bh=VkmD28XmKapcsmkLaNHg30vEdJW4Z2Gx2cq73Aex2YI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Y35dPWwUPLw+ExW99iaMXX/vYLtPHLPJnv2fEAO15fceuuI0FGyHEbdtgFMELLuhD
 l7Hj3Sy65wEyGS9JIhIgfqzKQw1ZUtWqBdULoDLrvRgKE4/Zrshcad6xatPlbQj/Q5
 on145ggPLMZzsDfEDyn/WpNdOefr5uMcY2aj62i7hbsXXf4SgYrSbOtREHx3fBzU78
 8N82x/gvxVPC9jVyFfwOT+Iji+05/84++zaAH2Xj1B5g/rkw8DyjgMKq9ntAZR/eZT
 PvHvKZOIon9Sl6kdCTtQohChP1j+wUG707WezLfeJFShpfFjaN0MEEUZ1HghXqOTEi
 TwMYTUFE/90Zg==
Date: Thu, 26 Oct 2023 09:44:49 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Jan Kara <jack@suse.cz>
Message-ID: <ZTqXgdiK7DAyz_IB@google.com>
References: <CAHk-=wjSbompMCgMwR2-MB59QDB+OZ7Ohp878QoDc9o7z4pbNg@mail.gmail.com>
 <20231011215138.GX800259@ZenIV> <20231011230105.GA92231@ZenIV>
 <CAHfrynNbfPtAjY4Y7N0cyWyH35dyF_BcpfR58ASCCC7=-TfSFw@mail.gmail.com>
 <20231012050209.GY800259@ZenIV>
 <20231012103157.mmn6sv4e6hfrqkai@quack3>
 <20231012145758.yopnkhijksae5akp@quack3>
 <20231012191551.GZ800259@ZenIV> <20231017055040.GN800259@ZenIV>
 <20231026161653.cunh4ojohq6mw2ye@quack3>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231026161653.cunh4ojohq6mw2ye@quack3>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/26, Jan Kara wrote: > Jaegeuk, Chao, any comment on
 this? It really looks like a filesystem > corruption issue in f2fs when
 whiteouts
 are used... Thanks Al and Jan for headsup. Let us take a look as soon as
 possible. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qw3Tc-0000WR-KQ
Subject: Re: [f2fs-dev] [RFC] weirdness in f2fs_rename() with RENAME_WHITEOUT
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
Cc: linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/26, Jan Kara wrote:
> Jaegeuk, Chao, any comment on this? It really looks like a filesystem
> corruption issue in f2fs when whiteouts are used...

Thanks Al and Jan for headsup.
Let us take a look as soon as possible.

> 
> 								Honza
> 
> On Tue 17-10-23 06:50:40, Al Viro wrote:
> > [f2fs folks Cc'd]
> > 
> > 	There's something very odd in f2fs_rename();
> > this:
> >         f2fs_down_write(&F2FS_I(old_inode)->i_sem);
> >         if (!old_dir_entry || whiteout)
> >                 file_lost_pino(old_inode);
> >         else   
> >                 /* adjust dir's i_pino to pass fsck check */
> >                 f2fs_i_pino_write(old_inode, new_dir->i_ino);
> >         f2fs_up_write(&F2FS_I(old_inode)->i_sem);
> > and this:
> >                 if (old_dir != new_dir && !whiteout)
> >                         f2fs_set_link(old_inode, old_dir_entry,
> >                                                 old_dir_page, new_dir);
> >                 else
> >                         f2fs_put_page(old_dir_page, 0);
> > The latter really stinks, especially considering
> > struct dentry *f2fs_get_parent(struct dentry *child)
> > {
> >         struct page *page;
> >         unsigned long ino = f2fs_inode_by_name(d_inode(child), &dotdot_name, &page);
> > 
> >         if (!ino) {
> >                 if (IS_ERR(page))
> >                         return ERR_CAST(page);
> >                 return ERR_PTR(-ENOENT);
> >         }
> >         return d_obtain_alias(f2fs_iget(child->d_sb, ino));
> > }
> > 
> > You want correct inumber in the ".." link.  And cross-directory
> > rename does move the source to new parent, even if you'd been asked
> > to leave a whiteout in the old place.
> > 
> > Why is that stuff conditional on whiteout?  AFAICS, that went into the
> > tree in the same commit that added RENAME_WHITEOUT support on f2fs,
> > mentioning "For now, we just try to follow the way that xfs/ext4 use"
> > in commit message.  But ext4 does *NOT* do anything of that sort -
> > at the time of that commit the relevant piece had been
> >         if (old.dir_bh) {
> > 		retval = ext4_rename_dir_finish(handle, &old, new.dir->i_ino);
> > and old.dir_bh is set by
> >                 retval = ext4_rename_dir_prepare(handle, &old);
> > a few lines prior, which is not conditional upon the whiteout.
> > 
> > What am I missing there?
> -- 
> Jan Kara <jack@suse.com>
> SUSE Labs, CR


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
