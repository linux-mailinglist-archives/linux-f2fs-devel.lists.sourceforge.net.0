Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C3EAC97487E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Sep 2024 05:13:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1soDn7-00019D-T0;
	Wed, 11 Sep 2024 03:13:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1soDn7-000197-7H
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 03:13:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VWAqhzZMTqDKY56n9tvyt9q9Yw6aK39qh3PgztT4pnU=; b=MebB3kNVguNiH3IA/liMHl5juZ
 q0CoOntq1o9uKVrGmhgrnuv0BYI8csRyL8IEFluIPjoQC9yooi/C0+MZU6A6DsMPT50injRtLjQWm
 eSmlCQmResXmgWJt2Nj2T4dl7HW3GOnauc/Wp2v7jHQOkw2TClPhK0CU8emLXiJ4Zpws=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VWAqhzZMTqDKY56n9tvyt9q9Yw6aK39qh3PgztT4pnU=; b=Qtxp6LBFNils32rFosh6GDXiZK
 4LTI+u0/Q+cfsILo5jx2cWGIEQ7Cl8/p8ldzS6lmBk9MgCxeNP9hmda9Iug+ctDzGeep18Ygv3giV
 XKJlTDA1yRTbHUoeBcF+Use4Z8cH7F7m/HafCeHzVgsNF6wI25v81YgosAW82k0lCYVk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1soDn4-0007OZ-OO for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 03:13:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id C1D145C0655
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 Sep 2024 03:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07C87C4CECD;
 Wed, 11 Sep 2024 03:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726024385;
 bh=r/VWMEcY649DSLSlsVg09/ckGhtXpJQl4tLw6/IicS4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BClD5guezY3ZzSEZGN/fqRQZCXm/azwSJV60BYnhoyWy7ouXyaFIM2qrnLIGINXNc
 d2SQ6lCoT6SkEMrJAxHFNol6cqAVw1IYHOmTsKPiZBn2zWlmVjqiNE/RRsakCnBIYx
 6XGtlObO4iTucHtnsrpCy69/6jL4pWPsiBuri5x4Vm/4DK7F5gv0Rlz7pIPr7r/qUb
 2vNqdhVcvnrdkvlpIFmcr815gt+aFrNLnxiSstVN7o/UXhnxcVNKmDUXoyROjUJFpg
 6104nKvoslXoEw8YQdEGU6NXvbJ3q426JqlCcqGNrCyAMtP+HI/gIfGj+idSADlzAi
 eB1eBXV4OCR2g==
Date: Tue, 10 Sep 2024 20:13:03 -0700
To: Chao Yu <chao@kernel.org>
Message-ID: <20240911031303.GA50432@sol.localdomain>
References: <20240910125753.80502-1-chao@kernel.org>
 <20240910170600.GB2642@sol.localdomain>
 <44f5168e-3931-438e-8a85-3866f797f9b6@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <44f5168e-3931-438e-8a85-3866f797f9b6@kernel.org>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Sep 11, 2024 at 11:06:22AM +0800, Chao Yu wrote: >
 On 2024/9/11 1:06, Eric Biggers wrote: > > On Tue, Sep 10, 2024 at 08:57:53PM
 +0800, Chao Yu via Linux-f2fs-devel wrote: > > > After commit 5 [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1soDn4-0007OZ-OO
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to tag STATX_DIOALIGN only if
 inode support dio
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Sep 11, 2024 at 11:06:22AM +0800, Chao Yu wrote:
> On 2024/9/11 1:06, Eric Biggers wrote:
> > On Tue, Sep 10, 2024 at 08:57:53PM +0800, Chao Yu via Linux-f2fs-devel wrote:
> > > After commit 5c8764f8679e ("f2fs: fix to force buffered IO on inline_data
> > > inode"), f2fs starts to force using buffered IO on inline_data inode.
> > > 
> > > And also, it will cause f2fs_getattr() returning invalid zeroed value on
> > > .dio_mem_align and .dio_offset_align fields, however, STATX_DIOALIGN flag
> > > was been tagged. User may use zeroed .stx_dio_offset_align value
> > > since STATX_DIOALIGN was been tagged, then it causes a deadloop during
> > > generic/465 test due to below logic:
> > > 
> > > align=stx_dio_offset_align(it equals to zero)
> > > page_size=4096
> > > while [ $align -le $page_size ]; do
> > > 	echo "$AIO_TEST -a $align -d $testfile.$align" >> $seqres.full
> > > 	$AIO_TEST -a $align -d $testfile.$align 2>&1 | tee -a $seqres.full
> > > 	align=$((align * 2))
> > > done
> > > 
> > > Quoted from description of statx manual:
> > > 
> > > " If  a  filesystem  does  not support a field or if it has an
> > >    unrepresentable value (for instance, a file with an exotic type),
> > >    then the mask bit corresponding to that field will be cleared in
> > >    stx_mask even if the user asked for it and a dummy value will be
> > >    filled in for compatibility purposes if one is available (e.g.,
> > >    a dummy UID and GID may be specified to mount under some
> > >    circumstances)."
> > > 
> > > We should not set STATX_DIOALIGN flag in kstat.stx_mask if inode
> > > does not support DIO, so that it can indicate related fields contain
> > > dummy value, and avoid following incorrect use of them.
> > > 
> > > Fixes: c8c02272a9f7 ("f2fs: support STATX_DIOALIGN")
> > 
> > When claiming to be Fixing a commit, please make sure to Cc the author of that
> > commit.
> 
> No problem, will make sure they were Cced.
> 
> > 
> > > Signed-off-by: Chao Yu <chao@kernel.org>
> > > ---
> > >   fs/f2fs/file.c | 11 ++++-------
> > >   1 file changed, 4 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > > index 99903eafa7fe..f0b8b77e93ba 100644
> > > --- a/fs/f2fs/file.c
> > > +++ b/fs/f2fs/file.c
> > > @@ -906,14 +906,11 @@ int f2fs_getattr(struct mnt_idmap *idmap, const struct path *path,
> > >   	 * f2fs sometimes supports DIO reads but not DIO writes.  STATX_DIOALIGN
> > >   	 * cannot represent that, so in that case we report no DIO support.
> > >   	 */
> > > -	if ((request_mask & STATX_DIOALIGN) && S_ISREG(inode->i_mode)) {
> > > -		unsigned int bsize = i_blocksize(inode);
> > > -
> > > +	if ((request_mask & STATX_DIOALIGN) && S_ISREG(inode->i_mode) &&
> > > +				!f2fs_force_buffered_io(inode, WRITE)) {
> > > +		stat->dio_mem_align = F2FS_BLKSIZE;
> > > +		stat->dio_offset_align = F2FS_BLKSIZE;
> > >   		stat->result_mask |= STATX_DIOALIGN;
> > > -		if (!f2fs_force_buffered_io(inode, WRITE)) {
> > > -			stat->dio_mem_align = bsize;
> > > -			stat->dio_offset_align = bsize;
> > > -		}
> > >   	}
> > >   	flags = fi->i_flags;
> > 
> > No, this patch is wrong and the existing code is correct.  The cases are:
> 
> Yes, you're right, thanks for pointing out this!
> 
> > 
> >      STATX_DIOALIGN set and stx_dio_*_align nonzero:
> >          File supports DIO.
> > 
> >      STATX_DIOALIGN set and stx_dio_*_align zero:
> >          File doesn't support DIO.
> > 
> >      STATX_DIOALIGN unset:
> >          Filesystem doesn't support STATX_DIOALIGN, so it's unknown whether the
> >          file supports DIO or not.
> 
> Above description is clear to me.
> 
> > 
> > Please see the statx(2) manual page which explains this too.
> 
> However, below manual seems not very clear about explaining what does it
> mean about STATX_DIOALIGN is set or not? At least not so clear like above
> description.
> 

It just works the same way that the other statx mask bits work.  See the
following paragraph:

    If a filesystem does not support a field or if it has an unrepresentable
    value (for instance, a file with an exotic type), then the mask bit
    corresponding to that field will be cleared in stx_mask even if the user
    asked for it and a dummy value will be filled in for compatibility purposes
    if one is available (e.g., a dummy UID and GID may be specified to mount
    under some circumstances).

It might be worth an explicit note in the documentation for stx_dio_mem_align,
but I considered it to be covered by the above.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
