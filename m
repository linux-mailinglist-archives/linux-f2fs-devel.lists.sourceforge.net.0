Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CF346800B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Dec 2021 23:54:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mtHRe-0002SA-AC; Fri, 03 Dec 2021 22:54:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1mtHRc-0002Rz-NO
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Dec 2021 22:54:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qTRAlXcKx8A+3QE1SApJEeCQGX7QhdXt2RgTmF1pfAU=; b=DiLutOgbqnWJfjcXU2d3F6aW4+
 0x5eVOZNVe7pvCiFpW0ZDJdkC5jAamwszNkrOWKXHiItvd+G5RIh57oXvkvcMu0sTiDiVhKj1KLgx
 MIw1WoWUrcbI1i6q3RgAwH6o5Qb6j4v9hv5qdWKZOVLX5IPVrRXdutaAI51QHgYjeLYc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qTRAlXcKx8A+3QE1SApJEeCQGX7QhdXt2RgTmF1pfAU=; b=HSXOP+tBu1bd7DUdLC3KJ82caH
 fjqwHRySYKhBPxVsOdhfcrjIab+SmppnERlAj292skDnKwAWS5o3qKaBcezDRhJ6OEfw+J5kKPUqn
 dcDx95BOxW7wg4YCNMJvuocDYnqXsmdMW7aHjm1MR51dEIq3jNlsiRg4qCJf4cstXcKk=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mtHRY-003Chh-Cm
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Dec 2021 22:54:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 244B2B82972
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  3 Dec 2021 22:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE844C53FCB;
 Fri,  3 Dec 2021 22:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1638572040;
 bh=0Nq3eK1EEI4BHp89JkSQJpOmSVBEbjvQrCsq/hJiS/s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jee53ll8aeB8ZdkkI7W/fNhOJ23jS4RBsf64SP7H5RKtn+CZw52q+AFdVNQcAAJUJ
 aMioUD5WT0L4KykuJoAM+5C+f0ElUe8vYvmZ9sh78jEcziHG0iXdif6foBABhsQ8EH
 5T30MOwJNtIpwg/LXwdv8+YVX320IRI0XmvxlIvwemKNzwUNtMbO/orBgxm09BuBhq
 1beQ/crirSxMVHjvzwl7y+U6Aa4k/uijBVh/tVl5c7d1uhom7LQu20qW96erG0Br/t
 wURZuokhwYt7NrYynyingCRjMGl7d6lFqLPD3reUFh1cRgRkYD2X9TBOLcMe9qFXNN
 s7ZsxQjs3OIfQ==
Date: Fri, 3 Dec 2021 14:53:59 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <YaqgB17W+rdSe7Zc@google.com>
References: <20211116214510.2934905-1-jaegeuk@kernel.org>
 <20211116214510.2934905-2-jaegeuk@kernel.org>
 <6576ab84-7441-e594-a7c4-e5876a814df7@kernel.org>
 <YakMtRif1f0cXT6R@google.com>
 <9b637c29-f9c7-5928-cf2e-346253bb00c7@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9b637c29-f9c7-5928-cf2e-346253bb00c7@kernel.org>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/03, Chao Yu wrote: > On 2021/12/3 2:13, Jaegeuk Kim
 wrote: > > On 12/02, Chao Yu wrote: > > > On 2021/11/17 5:45, Jaegeuk Kim
 wrote: > > > > DIO preallocates physical blocks before writing data, [...]
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
X-Headers-End: 1mtHRY-003Chh-Cm
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

On 12/03, Chao Yu wrote:
> On 2021/12/3 2:13, Jaegeuk Kim wrote:
> > On 12/02, Chao Yu wrote:
> > > On 2021/11/17 5:45, Jaegeuk Kim wrote:
> > > > DIO preallocates physical blocks before writing data, but if an error occurrs
> > > > or power-cut happens, we can see block contents from the disk. This patch tries
> > > > to fix it by 1) turning to buffered writes for DIO into holes, 2) truncating
> > > > unwritten blocks from error or power-cut.
> > > > 
> > > > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > > > ---
> > > >    fs/f2fs/data.c |  5 ++++-
> > > >    fs/f2fs/f2fs.h |  5 +++++
> > > >    fs/f2fs/file.c | 24 +++++++++++++++++++++++-
> > > >    3 files changed, 32 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > > > index 3b27fb7daa8b..7ac1a39fcad2 100644
> > > > --- a/fs/f2fs/data.c
> > > > +++ b/fs/f2fs/data.c
> > > > @@ -1543,8 +1543,11 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
> > > >    					flag != F2FS_GET_BLOCK_DIO);
> > > >    				err = __allocate_data_block(&dn,
> > > >    							map->m_seg_type);
> > > > -				if (!err)
> > > > +				if (!err) {
> > > > +					if (flag == F2FS_GET_BLOCK_PRE_DIO)
> > > > +						file_need_truncate(inode);
> > > >    					set_inode_flag(inode, FI_APPEND_WRITE);
> > > > +				}
> > > >    			}
> > > >    			if (err)
> > > >    				goto sync_out;
> > > > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > > > index be871a79c634..14bea669f87e 100644
> > > > --- a/fs/f2fs/f2fs.h
> > > > +++ b/fs/f2fs/f2fs.h
> > > > @@ -654,6 +654,7 @@ enum {
> > > >    #define FADVISE_KEEP_SIZE_BIT	0x10
> > > >    #define FADVISE_HOT_BIT		0x20
> > > >    #define FADVISE_VERITY_BIT	0x40
> > > > +#define FADVISE_TRUNC_BIT	0x80
> > > >    #define FADVISE_MODIFIABLE_BITS	(FADVISE_COLD_BIT | FADVISE_HOT_BIT)
> > > > @@ -681,6 +682,10 @@ enum {
> > > >    #define file_is_verity(inode)	is_file(inode, FADVISE_VERITY_BIT)
> > > >    #define file_set_verity(inode)	set_file(inode, FADVISE_VERITY_BIT)
> > > > +#define file_should_truncate(inode)	is_file(inode, FADVISE_TRUNC_BIT)
> > > > +#define file_need_truncate(inode)	set_file(inode, FADVISE_TRUNC_BIT)
> > > > +#define file_dont_truncate(inode)	clear_file(inode, FADVISE_TRUNC_BIT)
> > > > +
> > > >    #define DEF_DIR_LEVEL		0
> > > >    enum {
> > > > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > > > index 4bf77a5bf998..ec8de0662437 100644
> > > > --- a/fs/f2fs/file.c
> > > > +++ b/fs/f2fs/file.c
> > > > @@ -960,10 +960,21 @@ int f2fs_setattr(struct user_namespace *mnt_userns, struct dentry *dentry,
> > > >    		down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> > > >    		filemap_invalidate_lock(inode->i_mapping);
> > > > +		/*
> > > > +		 * Truncate stale preallocated blocks used by the previous DIO.
> > > > +		 */
> > > > +		if (file_should_truncate(inode)) {
> > > > +			err = f2fs_truncate(inode);
> > > > +			if (err)
> > > > +				goto out_unlock;
> > > > +			file_dont_truncate(inode);
> > > > +		}
> > > > +
> > > >    		truncate_setsize(inode, attr->ia_size);
> > > >    		if (attr->ia_size <= old_size)
> > > >    			err = f2fs_truncate(inode);
> > > > +out_unlock:
> > > >    		/*
> > > >    		 * do not trim all blocks after i_size if target size is
> > > >    		 * larger than i_size.
> > > > @@ -4257,6 +4268,13 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter)
> > > >    	/* If it will be an out-of-place direct write, don't bother. */
> > > >    	if (dio && f2fs_lfs_mode(sbi))
> > > >    		return 0;
> > > > +	/*
> > > > +	 * Don't preallocate holes aligned to DIO_SKIP_HOLES which turns into
> > > > +	 * buffered IO, if DIO meets any holes.
> > > > +	 */
> > > > +	if (dio && i_size_read(inode) &&
> > > > +		(F2FS_BYTES_TO_BLK(pos) < F2FS_BLK_ALIGN(i_size_read(inode))))
> > > > +		return 0;
> > > >    	/* No-wait I/O can't allocate blocks. */
> > > >    	if (iocb->ki_flags & IOCB_NOWAIT)
> > > > @@ -4366,10 +4384,14 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
> > > >    		if (preallocated > 0 && i_size_read(inode) < target_size) {
> > > >    			down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> > > >    			filemap_invalidate_lock(inode->i_mapping);
> > > > -			f2fs_truncate(inode);
> > > > +			if (!f2fs_truncate(inode))
> > > > +				file_dont_truncate(inode);
> > > >    			filemap_invalidate_unlock(inode->i_mapping);
> > > >    			up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> > > > +		} else {
> > > > +			file_dont_truncate(inode);
> > > 
> > > How about this case:
> > > 
> > > - touch file
> > > - DIO write [0, 8kb] to file
> > >   - preallocate 2 physical blocks
> > >   - set FADVISE_TRUNC_BIT
> > >   - SPO
> > > - BUFIO write [0, 4kb] to file
> > >   - file_dont_truncate -- it leaks unwritten [4kb, 8kb] to user after
> > > truncating file to 8kb
> > 
> > i_size should be 4kb, no?
> 
> - BUFIO write [0, 4kb] to file
>  - file_dont_truncate()
> i_size should be 4kb, w/ FADVISE_TRUNC_BIT
> 
> - setattr 8kb
> i_size should be 8kb, last [4kb, 8kb] is unwritten

How about this to truncate it in f2fs_iget() inestead of f2fs_setattr()?

DIO preallocates physical blocks before writing data, but if an error occurrs
or power-cut happens, we can see block contents from the disk. This patch tries
to fix it by 1) turning to buffered writes for DIO into holes, 2) truncating
unwritten blocks from error or power-cut.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/data.c  |  5 ++++-
 fs/f2fs/f2fs.h  |  5 +++++
 fs/f2fs/file.c  | 14 +++++++++++++-
 fs/f2fs/inode.c |  8 ++++++++
 4 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 3db0f3049b90..9c867de1ec29 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1543,8 +1543,11 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 					flag != F2FS_GET_BLOCK_DIO);
 				err = __allocate_data_block(&dn,
 							map->m_seg_type);
-				if (!err)
+				if (!err) {
+					if (flag == F2FS_GET_BLOCK_PRE_DIO)
+						file_need_truncate(inode);
 					set_inode_flag(inode, FI_APPEND_WRITE);
+				}
 			}
 			if (err)
 				goto sync_out;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 6f196621f772..d7435fcb9658 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -654,6 +654,7 @@ enum {
 #define FADVISE_KEEP_SIZE_BIT	0x10
 #define FADVISE_HOT_BIT		0x20
 #define FADVISE_VERITY_BIT	0x40
+#define FADVISE_TRUNC_BIT	0x80
 
 #define FADVISE_MODIFIABLE_BITS	(FADVISE_COLD_BIT | FADVISE_HOT_BIT)
 
@@ -681,6 +682,10 @@ enum {
 #define file_is_verity(inode)	is_file(inode, FADVISE_VERITY_BIT)
 #define file_set_verity(inode)	set_file(inode, FADVISE_VERITY_BIT)
 
+#define file_should_truncate(inode)	is_file(inode, FADVISE_TRUNC_BIT)
+#define file_need_truncate(inode)	set_file(inode, FADVISE_TRUNC_BIT)
+#define file_dont_truncate(inode)	clear_file(inode, FADVISE_TRUNC_BIT)
+
 #define DEF_DIR_LEVEL		0
 
 enum {
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index fc87d0f5b82b..689720b612f7 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1687,6 +1687,7 @@ static int expand_inode_data(struct inode *inode, loff_t offset,
 
 		map.m_seg_type = CURSEG_COLD_DATA_PINNED;
 		err = f2fs_map_blocks(inode, &map, 1, F2FS_GET_BLOCK_PRE_DIO);
+		file_dont_truncate(inode);
 
 		up_write(&sbi->pin_sem);
 
@@ -4257,6 +4258,13 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter)
 	/* If it will be an out-of-place direct write, don't bother. */
 	if (dio && f2fs_lfs_mode(sbi))
 		return 0;
+	/*
+	 * Don't preallocate holes aligned to DIO_SKIP_HOLES which turns into
+	 * buffered IO, if DIO meets any holes.
+	 */
+	if (dio && i_size_read(inode) &&
+		(F2FS_BYTES_TO_BLK(pos) < F2FS_BLK_ALIGN(i_size_read(inode))))
+		return 0;
 
 	/* No-wait I/O can't allocate blocks. */
 	if (iocb->ki_flags & IOCB_NOWAIT)
@@ -4367,10 +4375,14 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		if (preallocated > 0 && i_size_read(inode) < target_size) {
 			down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 			filemap_invalidate_lock(inode->i_mapping);
-			f2fs_truncate(inode);
+			if (!f2fs_truncate(inode))
+				file_dont_truncate(inode);
 			filemap_invalidate_unlock(inode->i_mapping);
 			up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+		} else {
+			file_dont_truncate(inode);
 		}
+
 		clear_inode_flag(inode, FI_PREALLOCATED_ALL);
 
 		if (ret > 0)
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 0f8b2df3e1e0..6998eb1d6bdb 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -544,6 +544,14 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
 		goto bad_inode;
 	}
 	f2fs_set_inode_flags(inode);
+
+	if (file_should_truncate(inode)) {
+		ret = f2fs_truncate(inode);
+		if (ret)
+			goto bad_inode;
+		file_dont_truncate(inode);
+	}
+
 	unlock_new_inode(inode);
 	trace_f2fs_iget(inode);
 	return inode;
-- 
2.34.1.400.ga245620fadb-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
