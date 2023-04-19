Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B02DB6E8210
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Apr 2023 21:45:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ppDkP-000442-9j;
	Wed, 19 Apr 2023 19:45:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1ppDkN-00043u-Nb
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Apr 2023 19:45:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xdUAPCZoCZKyxTXxBNBTgEYlJ+oLtQj3t6vumFGrHXk=; b=LWkTkgMl1xJJQtgNk9mLsQ8KHe
 0FBcStl0fCNA7IXa8D8MHI6aCV9QGnOGFoES22Mnj2hbFt57cgQxPNKIh/e3JaOEKMdKZ8mdKu+qn
 p6EctiJ3LYZmu4u7bkX5OTAcaalXJr0S5xnuLJpywofMuOKMa0kRXR9MVroHQ4L40lh0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xdUAPCZoCZKyxTXxBNBTgEYlJ+oLtQj3t6vumFGrHXk=; b=k9tA5AcPrftAuHMfXe7eslXxTv
 dwncRmyaBZrdJ/v9OEpjLd6axL2A3zSBauRrGD8+LLFoxT74hBOh9KWVNwaKEfpF/Or4Lg7POorjN
 /611JWudEsElQNFcDRQ5aL2iEjwRyzKsskJ8ng1A2Ig/j7brw2CIM/nXdsWXkIycxspk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ppDkH-0004eY-UI for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Apr 2023 19:45:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 7CDD5641F0;
 Wed, 19 Apr 2023 19:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9E80C433EF;
 Wed, 19 Apr 2023 19:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681933531;
 bh=ug0VpQZbuLIIcHgv/qpf5I+wi9aKnmeASPKgGIfd2mo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yv+iCzyL9LeLRsYG57Z3orpkDNfmifRvzVjZbaEf0NuAy1RkKQgFCNFID89kf4C9V
 hdXerFOalds4WN/raivtgQJnaCOP7JyOHwy62ewAx/0llU0UwHLdrAvmfqO81ILQtk
 Pf+Z/frZbEe6wa9gS1Oy/NbZjMk+yeBnKS6tjVFwwO2rB1av9z0fUyCTwOco3lXthy
 jWY9FtvYE53vo3llf2+5Vg36dDW+6Th+u0LkSDiY37kTxUoYd9nwCc1W5rH690+3Hy
 4JOf8jwXOv/fTqG/0kvV6YX/Y/YEJvoQUeZ5aVdb4WT/R33zhQ9/lSlu8KZFAHcRap
 ayHReteR/1p6Q==
Date: Wed, 19 Apr 2023 12:45:30 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZEBE2iT/fKhnhrhg@google.com>
References: <20230414104308.6591-1-bo.wu@vivo.com>
 <e2ec7e19-634c-a065-fe7a-b052d02d4752@kernel.org>
 <ZD7AJT7ZYPji8TWk@google.com>
 <91a05857-c916-cae5-d61d-bbec6f1ae052@kernel.org>
 <ZEAwcaVlYq+PNwEK@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZEAwcaVlYq+PNwEK@google.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/19, Jaegeuk Kim wrote: > On 04/19, Chao Yu wrote: >
 > On 2023/4/19 0:07, Jaegeuk Kim wrote: > > > On 04/18, Chao Yu wrote: > >
 > > On 2023/4/14 18:43, Wu Bo wrote: > > > > > It would be better t [...]
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
X-Headers-End: 1ppDkH-0004eY-UI
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

On 04/19, Jaegeuk Kim wrote:
> On 04/19, Chao Yu wrote:
> > On 2023/4/19 0:07, Jaegeuk Kim wrote:
> > > On 04/18, Chao Yu wrote:
> > > > On 2023/4/14 18:43, Wu Bo wrote:
> > > > > It would be better to use the dedicated slab to store path.
> > > > > 
> > > > > Signed-off-by: Wu Bo <bo.wu@vivo.com>
> > > > > ---
> > > > >    fs/f2fs/file.c | 4 ++--
> > > > >    1 file changed, 2 insertions(+), 2 deletions(-)
> > > > > 
> > > > > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > > > > index 15dabeac4690..27137873958f 100644
> > > > > --- a/fs/f2fs/file.c
> > > > > +++ b/fs/f2fs/file.c
> > > > > @@ -4361,7 +4361,7 @@ static void f2fs_trace_rw_file_path(struct kiocb *iocb, size_t count, int rw)
> > > > >    	struct inode *inode = file_inode(iocb->ki_filp);
> > > > >    	char *buf, *path;
> > > > > -	buf = f2fs_kmalloc(F2FS_I_SB(inode), PATH_MAX, GFP_KERNEL);
> > > > > +	buf = __getname();
> > > > 
> > > > How about:
> > > > 
> > > > buf = f2fs_kmem_cache_alloc(names_cachep, GFP_KERNEL, NULL, F2FS_I_SB(inode));
> > > 
> > > This looks like a hack using names_cachep?
> > 
> > names_cachep was exported in fs.h.
> 
> I think that's for __getname() in general, which doesn't indicate you can hack.
> No one is using like that.
> 
> $ grep names_cachep fs/* -R
> fs/dcache.c:struct kmem_cache *names_cachep __read_mostly;
> fs/dcache.c:EXPORT_SYMBOL(names_cachep);
> fs/dcache.c:	names_cachep = kmem_cache_create_usercopy("names_cache", PATH_MAX, 0,
> 
> $ grep __getname fs/* -R
> fs/ceph/mds_client.c:	path = __getname();
> fs/cifs/cifsproto.h:	return __getname();
> fs/dcache.c:/* SLAB cache for __getname() consumers */
> fs/d_path.c:	char *page = __getname();
> fs/exfat/dir.c:	nb->lfn = __getname();
> fs/f2fs/file.c:	buf = __getname();
> fs/fat/dir.c:		*unicode = __getname();
> fs/fat/namei_vfat.c:	uname = __getname();
> fs/hostfs/hostfs_kern.c:	char *name = __getname();
> fs/namei.c:	result = __getname();
> fs/namei.c:	result = __getname();
> fs/ntfs3/dir.c:	name = __getname();
> fs/ntfs3/xattr.c:	buf = __getname();
> fs/ntfs3/inode.c:	new_de = __getname();
> fs/ntfs3/inode.c:	de = __getname();
> fs/ntfs3/inode.c:	de = __getname();
> fs/ntfs3/namei.c:	struct cpu_str *uni = __getname();
> fs/ntfs3/namei.c:	de = __getname();
> fs/ntfs3/namei.c:	struct cpu_str *uni = __getname();
> fs/ntfs3/namei.c:	uni = __getname();
> fs/ntfs3/namei.c:	uni1 = __getname();
> fs/vboxsf/utils.c: * Returns a shfl_string allocated through __getname (must be freed using
> fs/vboxsf/utils.c:	buf = __getname();
> fs/vboxsf/utils.c:		shfl_path = __getname();
> 
> > 
> > > Using f2fs_kmem_cache_alloc is able to inject malloc error.
> > > But here is a trace event, is it ok to inject error in a trace path?
> > 
> > Yes, the fail path handling is very simple, so it's fine to leave it
> > as it is.
> > 
> > Reviewed-by: Chao Yu <chao@kernel.org>
> 
> What is this for?
> 

If we want to keep the error injection, how about this?

Signed-off-by: Wu Bo <bo.wu@vivo.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/f2fs.h | 13 +++++++++++++
 fs/f2fs/file.c |  4 ++--
 2 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 6cae94d51821..d87044516fe9 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3347,6 +3347,19 @@ static inline void *f2fs_kmalloc(struct f2fs_sb_info *sbi,
 	return kmalloc(size, flags);
 }
 
+static inline void *f2fs_getname(struct f2fs_sb_info *sbi)
+{
+	if (time_to_inject(sbi, FAULT_KMALLOC))
+		return NULL;
+
+	return __getname();
+}
+
+static inline void f2fs_putname(char *buf)
+{
+	__putname(buf);
+}
+
 static inline void *f2fs_kzalloc(struct f2fs_sb_info *sbi,
 					size_t size, gfp_t flags)
 {
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 1b4411271f54..5ac53d2627d2 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4372,7 +4372,7 @@ static void f2fs_trace_rw_file_path(struct kiocb *iocb, size_t count, int rw)
 	struct inode *inode = file_inode(iocb->ki_filp);
 	char *buf, *path;
 
-	buf = f2fs_kmalloc(F2FS_I_SB(inode), PATH_MAX, GFP_KERNEL);
+	buf = f2fs_getname(F2FS_I_SB(inode));
 	if (!buf)
 		return;
 	path = dentry_path_raw(file_dentry(iocb->ki_filp), buf, PATH_MAX);
@@ -4385,7 +4385,7 @@ static void f2fs_trace_rw_file_path(struct kiocb *iocb, size_t count, int rw)
 		trace_f2fs_dataread_start(inode, iocb->ki_pos, count,
 				current->pid, path, current->comm);
 free_buf:
-	kfree(buf);
+	f2fs_putname(buf);
 }
 
 static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
-- 
2.40.0.634.g4ca3ef3211-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
