Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C25246E811F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Apr 2023 20:18:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ppCO5-0008WE-2D;
	Wed, 19 Apr 2023 18:18:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ppCO2-0008W8-T9
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Apr 2023 18:18:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ct54S1EPeQeqsM0jzfC6ICg2pSHMQUwFBp/nbEbaGzo=; b=cszjtO8NJhC+BauMojIVM6JCRh
 exNeeez+9ldX3wnqJFl4LBHn590mw0vQJTlH+FiCb3YRwlC3fp7yRk1FcF018s7Ll4quaQuZdAy8r
 WyL4SDSPuvzUnx5xHAKlg0MWL9k2UAxYVFriHGvxlBrV4ED08fvId3SkPVqtFna/UfGs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ct54S1EPeQeqsM0jzfC6ICg2pSHMQUwFBp/nbEbaGzo=; b=O3SVikVLHgAO6WwZA0MecWNep8
 cQe0EHNLQrZL9VJ3VYRv83WLHFUX6xjVViIo8PBSsrpGSZ5NTS4EwmTfjCV3YWLpvDW6L83jBXaRd
 8ch8KPiNY5N2K2N92/d978F2/l4QBDlO5MzuxtQ3V8Pr9k3SPJz/vdSFpqyEm8ZcPPeY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ppCO1-00023c-6i for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Apr 2023 18:18:33 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D3E2B63DC4;
 Wed, 19 Apr 2023 18:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C89FC433D2;
 Wed, 19 Apr 2023 18:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681928307;
 bh=vukysRz5NaE4LWG2Afd718xz2x+dfOXM5QhEspRpdV4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mttGhr1fE3I4rQPspXFezgqjHKtEFBHw2zgAsS/d2nixmB8nbZEpr1d8eZELF2LWU
 hBhV8h3aK/Ni1erlpop8dgsSU0yL+4ZObYry16T8eXE8TXWljLiEZTUS73kdmH+KXO
 JUeeXS63T0EKBUvm+Yuf3IHrFOqux5kU/nOIAo5IDEdNfWr9VTYeT9/BjAqWTUv8lM
 5qWJS/ghcvRK3YDmgq5uknqCQetmV2JxhIXN0dURTP0SgEpv3QnK9I4V77BKrJJe5r
 CUsE7nRN4dMiByr5/QJqUxjapMkSD7iHlibTHm1243YT3WdqBTMK0x/quopK7qJ86y
 5HmA5IoUTp0DA==
Date: Wed, 19 Apr 2023 11:18:25 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZEAwcaVlYq+PNwEK@google.com>
References: <20230414104308.6591-1-bo.wu@vivo.com>
 <e2ec7e19-634c-a065-fe7a-b052d02d4752@kernel.org>
 <ZD7AJT7ZYPji8TWk@google.com>
 <91a05857-c916-cae5-d61d-bbec6f1ae052@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <91a05857-c916-cae5-d61d-bbec6f1ae052@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/19, Chao Yu wrote: > On 2023/4/19 0:07, Jaegeuk Kim
 wrote: > > On 04/18, Chao Yu wrote: > > > On 2023/4/14 18:43, Wu Bo wrote:
 > > > > It would be better to use the dedicated slab to store path. [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ppCO1-00023c-6i
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: allocate trace path buffer from
 names_cache
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
Cc: wubo.oduw@gmail.com, linux-kernel@vger.kernel.org, Wu Bo <bo.wu@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 04/19, Chao Yu wrote:
> On 2023/4/19 0:07, Jaegeuk Kim wrote:
> > On 04/18, Chao Yu wrote:
> > > On 2023/4/14 18:43, Wu Bo wrote:
> > > > It would be better to use the dedicated slab to store path.
> > > > 
> > > > Signed-off-by: Wu Bo <bo.wu@vivo.com>
> > > > ---
> > > >    fs/f2fs/file.c | 4 ++--
> > > >    1 file changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > > > index 15dabeac4690..27137873958f 100644
> > > > --- a/fs/f2fs/file.c
> > > > +++ b/fs/f2fs/file.c
> > > > @@ -4361,7 +4361,7 @@ static void f2fs_trace_rw_file_path(struct kiocb *iocb, size_t count, int rw)
> > > >    	struct inode *inode = file_inode(iocb->ki_filp);
> > > >    	char *buf, *path;
> > > > -	buf = f2fs_kmalloc(F2FS_I_SB(inode), PATH_MAX, GFP_KERNEL);
> > > > +	buf = __getname();
> > > 
> > > How about:
> > > 
> > > buf = f2fs_kmem_cache_alloc(names_cachep, GFP_KERNEL, NULL, F2FS_I_SB(inode));
> > 
> > This looks like a hack using names_cachep?
> 
> names_cachep was exported in fs.h.

I think that's for __getname() in general, which doesn't indicate you can hack.
No one is using like that.

$ grep names_cachep fs/* -R
fs/dcache.c:struct kmem_cache *names_cachep __read_mostly;
fs/dcache.c:EXPORT_SYMBOL(names_cachep);
fs/dcache.c:	names_cachep = kmem_cache_create_usercopy("names_cache", PATH_MAX, 0,

$ grep __getname fs/* -R
fs/ceph/mds_client.c:	path = __getname();
fs/cifs/cifsproto.h:	return __getname();
fs/dcache.c:/* SLAB cache for __getname() consumers */
fs/d_path.c:	char *page = __getname();
fs/exfat/dir.c:	nb->lfn = __getname();
fs/f2fs/file.c:	buf = __getname();
fs/fat/dir.c:		*unicode = __getname();
fs/fat/namei_vfat.c:	uname = __getname();
fs/hostfs/hostfs_kern.c:	char *name = __getname();
fs/namei.c:	result = __getname();
fs/namei.c:	result = __getname();
fs/ntfs3/dir.c:	name = __getname();
fs/ntfs3/xattr.c:	buf = __getname();
fs/ntfs3/inode.c:	new_de = __getname();
fs/ntfs3/inode.c:	de = __getname();
fs/ntfs3/inode.c:	de = __getname();
fs/ntfs3/namei.c:	struct cpu_str *uni = __getname();
fs/ntfs3/namei.c:	de = __getname();
fs/ntfs3/namei.c:	struct cpu_str *uni = __getname();
fs/ntfs3/namei.c:	uni = __getname();
fs/ntfs3/namei.c:	uni1 = __getname();
fs/vboxsf/utils.c: * Returns a shfl_string allocated through __getname (must be freed using
fs/vboxsf/utils.c:	buf = __getname();
fs/vboxsf/utils.c:		shfl_path = __getname();

> 
> > Using f2fs_kmem_cache_alloc is able to inject malloc error.
> > But here is a trace event, is it ok to inject error in a trace path?
> 
> Yes, the fail path handling is very simple, so it's fine to leave it
> as it is.
> 
> Reviewed-by: Chao Yu <chao@kernel.org>

What is this for?

> 
> Thanks,
> 
> > 
> > > 
> > > >    	if (!buf)
> > > >    		return;
> > > >    	path = dentry_path_raw(file_dentry(iocb->ki_filp), buf, PATH_MAX);
> > > > @@ -4374,7 +4374,7 @@ static void f2fs_trace_rw_file_path(struct kiocb *iocb, size_t count, int rw)
> > > >    		trace_f2fs_dataread_start(inode, iocb->ki_pos, count,
> > > >    				current->pid, path, current->comm);
> > > >    free_buf:
> > > > -	kfree(buf);
> > > > +	__putname(buf);
> > > 
> > > kmem_cache_free(names_cachep, buf);
> > > 
> > > Thanks,
> > > 
> > > >    }
> > > >    static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
