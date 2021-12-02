Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0FAC4669AB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Dec 2021 19:13:25 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1msqa7-0000Nn-RB; Thu, 02 Dec 2021 18:13:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1msqa6-0000Nd-Am
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Dec 2021 18:13:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l0Kw321G14DtaXAqvw1CMAVzJIljOy+vf7bFYVB4HRI=; b=KOK4Y0Vy+Pg14tyY40YRdtjP4C
 PAs9McDKD2ue3uXdLQcaqFVZ2NG0FV88UoiHD0PnUG1+PLjyz7o0FgzEOOCsVglwf6KwJVUImbq12
 rBGZqh+9gSd6FTRSq4xkexXqaup9WPG2IK/rdxIqajJc7wXBMOGb8n224k4ipLNOKOqo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l0Kw321G14DtaXAqvw1CMAVzJIljOy+vf7bFYVB4HRI=; b=ZgspQvSrvL+WhYcLyYSh5CR+BC
 eLXtAGW4Av2GLNI31On9ZmjMibcBFPet2rqKdtBmPkIm6v+F8XUzk6vLwcsBI3K2HARYW2P2jP21G
 cCsRY5JNa51GrrLd3v3iWJKq/nj6C6InQ+Ny2A/balI+vCPFiWFqTNLfIXsvRZBiB7Yg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1msqa5-0007Mm-EP
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 02 Dec 2021 18:13:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 166996279C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu,  2 Dec 2021 18:13:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A258C00446;
 Thu,  2 Dec 2021 18:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638468791;
 bh=m+ZbylS5VCgMMr0/cLLi4oUbGnPEJYr8motS6DdZotQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sALKktU0NlrjrFrpZSQlWO2BbnQTq5wgSMv4uhSgOLR+nu7eYeTOVS+uycvhFCtFe
 6H+MK3Vam/o2IQ1u+mnfczUab9PCdh7bI6gldPweVZpMcOI5KMXbon7FMUvKpoZ0pV
 8fyjtGi4uoFeigsJXCVzvlADH99HTvh4BzLwrErHO0Cb0wswhtEBvTczx7LwGmV5g2
 Ekz0PGliaUzMAeAkM6/Jl/MOstJUWLan1/Y7XXmQvpFFyuqp0zzyCAs/VToOjApRkZ
 z81cM68C36Iz7YbotDiFLKKlnN+Wqtt39K6LFoO3e6quLgu9y0eZx+Sxrf8JzYADeS
 +mhcc0jZhDZjA==
Date: Thu, 2 Dec 2021 10:13:09 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YakMtRif1f0cXT6R@google.com>
References: <20211116214510.2934905-1-jaegeuk@kernel.org>
 <20211116214510.2934905-2-jaegeuk@kernel.org>
 <6576ab84-7441-e594-a7c4-e5876a814df7@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6576ab84-7441-e594-a7c4-e5876a814df7@kernel.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/02, Chao Yu wrote: > On 2021/11/17 5:45, Jaegeuk Kim
 wrote: > > DIO preallocates physical blocks before writing data, but if an
 error occurrs > > or power-cut happens, we can see block contents [...] 
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
X-Headers-End: 1msqa5-0007Mm-EP
Subject: Re: [f2fs-dev] [PATCH 2/6] f2fs: do not expose unwritten blocks to
 user by DIO
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/02, Chao Yu wrote:
> On 2021/11/17 5:45, Jaegeuk Kim wrote:
> > DIO preallocates physical blocks before writing data, but if an error occurrs
> > or power-cut happens, we can see block contents from the disk. This patch tries
> > to fix it by 1) turning to buffered writes for DIO into holes, 2) truncating
> > unwritten blocks from error or power-cut.
> > 
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >   fs/f2fs/data.c |  5 ++++-
> >   fs/f2fs/f2fs.h |  5 +++++
> >   fs/f2fs/file.c | 24 +++++++++++++++++++++++-
> >   3 files changed, 32 insertions(+), 2 deletions(-)
> > 
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index 3b27fb7daa8b..7ac1a39fcad2 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -1543,8 +1543,11 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
> >   					flag != F2FS_GET_BLOCK_DIO);
> >   				err = __allocate_data_block(&dn,
> >   							map->m_seg_type);
> > -				if (!err)
> > +				if (!err) {
> > +					if (flag == F2FS_GET_BLOCK_PRE_DIO)
> > +						file_need_truncate(inode);
> >   					set_inode_flag(inode, FI_APPEND_WRITE);
> > +				}
> >   			}
> >   			if (err)
> >   				goto sync_out;
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index be871a79c634..14bea669f87e 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -654,6 +654,7 @@ enum {
> >   #define FADVISE_KEEP_SIZE_BIT	0x10
> >   #define FADVISE_HOT_BIT		0x20
> >   #define FADVISE_VERITY_BIT	0x40
> > +#define FADVISE_TRUNC_BIT	0x80
> >   #define FADVISE_MODIFIABLE_BITS	(FADVISE_COLD_BIT | FADVISE_HOT_BIT)
> > @@ -681,6 +682,10 @@ enum {
> >   #define file_is_verity(inode)	is_file(inode, FADVISE_VERITY_BIT)
> >   #define file_set_verity(inode)	set_file(inode, FADVISE_VERITY_BIT)
> > +#define file_should_truncate(inode)	is_file(inode, FADVISE_TRUNC_BIT)
> > +#define file_need_truncate(inode)	set_file(inode, FADVISE_TRUNC_BIT)
> > +#define file_dont_truncate(inode)	clear_file(inode, FADVISE_TRUNC_BIT)
> > +
> >   #define DEF_DIR_LEVEL		0
> >   enum {
> > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > index 4bf77a5bf998..ec8de0662437 100644
> > --- a/fs/f2fs/file.c
> > +++ b/fs/f2fs/file.c
> > @@ -960,10 +960,21 @@ int f2fs_setattr(struct user_namespace *mnt_userns, struct dentry *dentry,
> >   		down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> >   		filemap_invalidate_lock(inode->i_mapping);
> > +		/*
> > +		 * Truncate stale preallocated blocks used by the previous DIO.
> > +		 */
> > +		if (file_should_truncate(inode)) {
> > +			err = f2fs_truncate(inode);
> > +			if (err)
> > +				goto out_unlock;
> > +			file_dont_truncate(inode);
> > +		}
> > +
> >   		truncate_setsize(inode, attr->ia_size);
> >   		if (attr->ia_size <= old_size)
> >   			err = f2fs_truncate(inode);
> > +out_unlock:
> >   		/*
> >   		 * do not trim all blocks after i_size if target size is
> >   		 * larger than i_size.
> > @@ -4257,6 +4268,13 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter)
> >   	/* If it will be an out-of-place direct write, don't bother. */
> >   	if (dio && f2fs_lfs_mode(sbi))
> >   		return 0;
> > +	/*
> > +	 * Don't preallocate holes aligned to DIO_SKIP_HOLES which turns into
> > +	 * buffered IO, if DIO meets any holes.
> > +	 */
> > +	if (dio && i_size_read(inode) &&
> > +		(F2FS_BYTES_TO_BLK(pos) < F2FS_BLK_ALIGN(i_size_read(inode))))
> > +		return 0;
> >   	/* No-wait I/O can't allocate blocks. */
> >   	if (iocb->ki_flags & IOCB_NOWAIT)
> > @@ -4366,10 +4384,14 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
> >   		if (preallocated > 0 && i_size_read(inode) < target_size) {
> >   			down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> >   			filemap_invalidate_lock(inode->i_mapping);
> > -			f2fs_truncate(inode);
> > +			if (!f2fs_truncate(inode))
> > +				file_dont_truncate(inode);
> >   			filemap_invalidate_unlock(inode->i_mapping);
> >   			up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> > +		} else {
> > +			file_dont_truncate(inode);
> 
> How about this case:
> 
> - touch file
> - DIO write [0, 8kb] to file
>  - preallocate 2 physical blocks
>  - set FADVISE_TRUNC_BIT
>  - SPO
> - BUFIO write [0, 4kb] to file
>  - file_dont_truncate -- it leaks unwritten [4kb, 8kb] to user after
> truncating file to 8kb

i_size should be 4kb, no?

> 
> Thanks,
> 
> >   		}
> > +
> >   		clear_inode_flag(inode, FI_PREALLOCATED_ALL);
> >   		if (ret > 0)
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
