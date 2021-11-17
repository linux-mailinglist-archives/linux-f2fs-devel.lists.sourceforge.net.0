Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AEC84454DE8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Nov 2021 20:32:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mnQfo-0004wh-L8; Wed, 17 Nov 2021 19:32:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1mnQfn-0004wb-A8
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Nov 2021 19:32:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BxcA/tNabowp/B9JQwhqaW4pSpFBWOrUQFLZDHvMt0Y=; b=iuGnNMpcht6p5nWueHD2RXgnhh
 sdH4WBqnVZrE9LH8sb1LCZeix5sQC60btiWjGqhBQhPOvubuQA+5y//bEJ2Po4+YHZVzPAfT6jhV6
 DytNYjM7VaLr51busDYYh7R7l0I+AibO0+vhLR8NJ2d7emMEN6rwHhcvWO2tvbfr5rw0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BxcA/tNabowp/B9JQwhqaW4pSpFBWOrUQFLZDHvMt0Y=; b=J4nbCPDPWeD+IiqNQ4rJ+pQeCk
 e5M9XoeJ+0wq5G48SdfnVGD3GXD7GmDW3jbJ2uMNH779HuRYUX+rUPj1uFYSIDDQW8Gw4SbREojs7
 agdxHb6HGYLX8Egt3KHzsqCOgbBa2l7jSiml7y0unpj/xOhQTV35RHdJDSkpmoEQ4+LA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mnQfm-00Gdl5-Kj
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Nov 2021 19:32:47 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2712160EC0;
 Wed, 17 Nov 2021 19:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637177561;
 bh=g00KGiwKq0c5GKG/NMxsXMBFgM4TzSJPcq+6DQgNKQg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=n2j6y12alc2/GCrEV9hC34AFz/ikE5v2/atx/7IQYbP2mWLTs5//I1nPwrQRGVKuc
 zhSUYteBhLF5rAzUp9f+x86MDF+7BXmg74EzoaPWLRANvSiXf/hIj1VViZRMDYW9fw
 7zeWfVmibAeBC9O4FXWjnM6R5GFTAgBwlcetofWmgg0OzUdiHT6jnC/VV1BtCTpLfw
 UL8c9GLGqbJC/mzz2Gp7MB4RAxjLSnQz7TMRF08cXup1IV7Qe/nwnl5Zw6V+QnXLag
 MQV8/3fgwr2RPXjfwKhkzJlrU4GEgW9UlSA57nRpN2OVoHhvDwZ/+KJkizVNnKaGF9
 S6BN/F0QmozNw==
Date: Wed, 17 Nov 2021 11:32:39 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YZVY1w7HgtLTS9ye@google.com>
References: <20211116214510.2934905-1-jaegeuk@kernel.org>
 <20211116214510.2934905-2-jaegeuk@kernel.org>
 <a28ca53e-f356-baa5-b5c2-968620e81b43@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a28ca53e-f356-baa5-b5c2-968620e81b43@kernel.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/17, Chao Yu wrote: > On 2021/11/17 5:45, Jaegeuk Kim
 wrote: > > DIO preallocates physical blocks before writing data, but if an
 error occurrs > > or power-cut happens, we can see block contents [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mnQfm-00Gdl5-Kj
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

On 11/17, Chao Yu wrote:
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
> 
> We will leave FADVISE_TRUNC_BIT flag in below call path, is this as expected?
> 
> - fallocate
>  - expand_inode_data
>   - f2fs_map_blocks(F2FS_GET_BLOCK_PRE_DIO)

I missed it. :)

--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1698,6 +1698,7 @@ static int expand_inode_data(struct inode *inode, loff_t offset,

                map.m_seg_type = CURSEG_COLD_DATA_PINNED;
                err = f2fs_map_blocks(inode, &map, 1, F2FS_GET_BLOCK_PRE_DIO);
+               file_dont_truncate(inode);

                up_write(&sbi->pin_sem);

> 
> Thanks,
> 
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
> >   		}
> > +
> >   		clear_inode_flag(inode, FI_PREALLOCATED_ALL);
> >   		if (ret > 0)
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
