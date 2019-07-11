Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4B865E2B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jul 2019 19:07:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hlcX6-0005Zo-0t; Thu, 11 Jul 2019 17:07:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hlcX4-0005Zg-PK
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jul 2019 17:06:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mibbf2HcgQa7HsX2qFQcE3uKZXtNskgUDvtkIIr61Uk=; b=F3dCNrFPPAk4Hp90BFS6iNmLgL
 rjmFAQwugz76xgr0GU5x1QVFIg60vSrNml9zRXaD4YHMYH7cMdet428ALHXrRyFohl2b5ggVqMhBz
 HegA84pj9fn4VrA3Di0tuZ13kOhxwJW91IY6p3fUXwhUDxmR2LgpxjcCgPHI31mhmF1w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Mibbf2HcgQa7HsX2qFQcE3uKZXtNskgUDvtkIIr61Uk=; b=bK2wpP7mtO4owGQAIgVrFWyWj8
 vpgu0Mlffeh2w6SxKqGCjEnnWpywp87c4N/BoZdwIf1/Y791DvX2AsR4l6uVep5My+Wb+hbdSzQ1B
 zCYKpgF0SgnQWL8Bvttx5iMPxv5s9S12ve/Wt8nvBzU3u84ATx2Zq+hVUMsmDi799f2A=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hlcX1-00FOeo-Hk
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jul 2019 17:06:58 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id DF9F12084B;
 Thu, 11 Jul 2019 17:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562864810;
 bh=oQdDYrfRZcly3MKtrpuIGslW0qjClMveQ4492eu8my8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=nxtnK/mlq2ex/Ho1qtYzpg3QPmWwzBd21Cns8e11VzNN+FU0SLhP5IdfMV1hnaeWT
 fGycnprYrXfNWze/bLf5/PVSiBXP0Ehi8NOeWys3xcSbO6E6mVuEDvDNMp5dgdNmXZ
 nyqpPHeDheaxA1Vsj+GM4D6I8JZ50ODGyp8sP4N8=
Date: Thu, 11 Jul 2019 10:06:47 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Ju Hyung Park <qkrwngud825@gmail.com>
Message-ID: <20190711170647.GA65508@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190711150617.124660-1-qkrwngud825@gmail.com>
 <CAD14+f3pxEqC-Kqt0-9+Xb_+Jwr_=NjQmsVoLXz9YTAZJo12zg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD14+f3pxEqC-Kqt0-9+Xb_+Jwr_=NjQmsVoLXz9YTAZJo12zg@mail.gmail.com>
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
X-Headers-End: 1hlcX1-00FOeo-Hk
Subject: Re: [f2fs-dev] [PATCH] f2fs: use kmem_cache pool during xattr
 lookups
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/12, Ju Hyung Park wrote:
> Hi everyone.
> 
> This is a RFC patch.
> 
> This patch introduces an even bigger problem, which is forcing all
> xattr lookup memory allocations to be made in 4076B, when in reality,
> 4076B allocations are only made during initial mounts and the rests
> are made in 204B, unnecessarily wasting memory.
> 
> In my testing, 4076B allocations are only done 4 times during mount
> and the rests(millions) are in 204B.
> 
> I'd like to ask the maintainers to suggest some bright ideas on how to
> tackle this correctly.
> (e.g. Use kmem pool only for 204B allocations and fallback to regular
> kzalloc() if (*base_size != 204)?)

How about adding two paths? One is kzalloc() for normal case, and the other
is slab alloc for inline_xattr case?

> 
> Thanks.
> 
> On Fri, Jul 12, 2019 at 12:06 AM Park Ju Hyung <qkrwngud825@gmail.com> wrote:
> >
> > It's been observed that kzalloc() on lookup_all_xattrs() are called millions
> > of times on Android, quickly becoming the top abuser of slub memory allocator.
> >
> > Use a dedicated kmem cache pool for xattr lookups to mitigate this.
> >
> > Signed-off-by: Park Ju Hyung <qkrwngud825@gmail.com>
> > ---
> >  fs/f2fs/f2fs.h  |  6 ++++++
> >  fs/f2fs/super.c |  8 +++++++-
> >  fs/f2fs/xattr.c | 33 ++++++++++++++++++++++++---------
> >  3 files changed, 37 insertions(+), 10 deletions(-)
> >
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index 9c6388253c9d2..3046ca2ebd121 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -3510,6 +3510,12 @@ void f2fs_exit_sysfs(void);
> >  int f2fs_register_sysfs(struct f2fs_sb_info *sbi);
> >  void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi);
> >
> > +/*
> > + * xattr.c
> > + */
> > +int __init f2fs_init_xattr_caches(void);
> > +void f2fs_destroy_xattr_caches(void);
> > +
> >  /*
> >   * crypto support
> >   */
> > diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
> > index 6d262d13251cf..abb59d9e25848 100644
> > --- a/fs/f2fs/super.c
> > +++ b/fs/f2fs/super.c
> > @@ -3614,9 +3614,12 @@ static int __init init_f2fs_fs(void)
> >         err = init_inodecache();
> >         if (err)
> >                 goto fail;
> > -       err = f2fs_create_node_manager_caches();
> > +       err = f2fs_init_xattr_caches();
> >         if (err)
> >                 goto free_inodecache;
> > +       err = f2fs_create_node_manager_caches();
> > +       if (err)
> > +               goto fail_xattr_caches;
> >         err = f2fs_create_segment_manager_caches();
> >         if (err)
> >                 goto free_node_manager_caches;
> > @@ -3656,6 +3659,8 @@ static int __init init_f2fs_fs(void)
> >         f2fs_destroy_segment_manager_caches();
> >  free_node_manager_caches:
> >         f2fs_destroy_node_manager_caches();
> > +fail_xattr_caches:
> > +       f2fs_destroy_xattr_caches();
> >  free_inodecache:
> >         destroy_inodecache();
> >  fail:
> > @@ -3673,6 +3678,7 @@ static void __exit exit_f2fs_fs(void)
> >         f2fs_destroy_checkpoint_caches();
> >         f2fs_destroy_segment_manager_caches();
> >         f2fs_destroy_node_manager_caches();
> > +       f2fs_destroy_xattr_caches();
> >         destroy_inodecache();
> >         f2fs_destroy_trace_ios();
> >  }
> > diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
> > index e791741d193b8..635b50ea3e5e8 100644
> > --- a/fs/f2fs/xattr.c
> > +++ b/fs/f2fs/xattr.c
> > @@ -22,6 +22,23 @@
> >  #include "f2fs.h"
> >  #include "xattr.h"
> >
> > +static struct kmem_cache *f2fs_xattr_cachep;
> > +
> > +int __init f2fs_init_xattr_caches(void)
> > +{
> > +       f2fs_xattr_cachep = f2fs_kmem_cache_create("xattr_entry",
> > +                       VALID_XATTR_BLOCK_SIZE + XATTR_PADDING_SIZE);
> > +       if (!f2fs_xattr_cachep)
> > +               return -ENOMEM;
> > +
> > +       return 0;
> > +}
> > +
> > +void f2fs_destroy_xattr_caches(void)
> > +{
> > +       kmem_cache_destroy(f2fs_xattr_cachep);
> > +}
> > +
> >  static int f2fs_xattr_generic_get(const struct xattr_handler *handler,
> >                 struct dentry *unused, struct inode *inode,
> >                 const char *name, void *buffer, size_t size)
> > @@ -312,7 +329,7 @@ static int lookup_all_xattrs(struct inode *inode, struct page *ipage,
> >                 return -ENODATA;
> >
> >         *base_size = XATTR_SIZE(xnid, inode) + XATTR_PADDING_SIZE;
> > -       txattr_addr = f2fs_kzalloc(F2FS_I_SB(inode), *base_size, GFP_NOFS);
> > +       txattr_addr = kmem_cache_zalloc(f2fs_xattr_cachep, GFP_NOFS);
> >         if (!txattr_addr)
> >                 return -ENOMEM;
> >
> > @@ -358,7 +375,7 @@ static int lookup_all_xattrs(struct inode *inode, struct page *ipage,
> >         *base_addr = txattr_addr;
> >         return 0;
> >  out:
> > -       kvfree(txattr_addr);
> > +       kmem_cache_free(f2fs_xattr_cachep, txattr_addr);
> >         return err;
> >  }
> >
> > @@ -367,13 +384,11 @@ static int read_all_xattrs(struct inode *inode, struct page *ipage,
> >  {
> >         struct f2fs_xattr_header *header;
> >         nid_t xnid = F2FS_I(inode)->i_xattr_nid;
> > -       unsigned int size = VALID_XATTR_BLOCK_SIZE;
> >         unsigned int inline_size = inline_xattr_size(inode);
> >         void *txattr_addr;
> >         int err;
> >
> > -       txattr_addr = f2fs_kzalloc(F2FS_I_SB(inode),
> > -                       inline_size + size + XATTR_PADDING_SIZE, GFP_NOFS);
> > +       txattr_addr = kmem_cache_zalloc(f2fs_xattr_cachep, GFP_NOFS);
> >         if (!txattr_addr)
> >                 return -ENOMEM;
> >
> > @@ -401,7 +416,7 @@ static int read_all_xattrs(struct inode *inode, struct page *ipage,
> >         *base_addr = txattr_addr;
> >         return 0;
> >  fail:
> > -       kvfree(txattr_addr);
> > +       kmem_cache_free(f2fs_xattr_cachep, txattr_addr);
> >         return err;
> >  }
> >
> > @@ -528,7 +543,7 @@ int f2fs_getxattr(struct inode *inode, int index, const char *name,
> >         }
> >         error = size;
> >  out:
> > -       kvfree(base_addr);
> > +       kmem_cache_free(f2fs_xattr_cachep, base_addr);
> >         return error;
> >  }
> >
> > @@ -574,7 +589,7 @@ ssize_t f2fs_listxattr(struct dentry *dentry, char *buffer, size_t buffer_size)
> >         }
> >         error = buffer_size - rest;
> >  cleanup:
> > -       kvfree(base_addr);
> > +       kmem_cache_free(f2fs_xattr_cachep, base_addr);
> >         return error;
> >  }
> >
> > @@ -712,7 +727,7 @@ static int __f2fs_setxattr(struct inode *inode, int index,
> >         if (!error && S_ISDIR(inode->i_mode))
> >                 set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_CP);
> >  exit:
> > -       kvfree(base_addr);
> > +       kmem_cache_free(f2fs_xattr_cachep, base_addr);
> >         return error;
> >  }
> >
> > --
> > 2.21.0
> >
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
