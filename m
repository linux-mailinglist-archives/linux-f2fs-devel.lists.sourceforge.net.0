Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 266643792D6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 May 2021 17:36:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lg7xQ-0007dE-9X; Mon, 10 May 2021 15:36:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lg7xO-0007d6-Uu
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 15:36:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JBzY8ay06JDDvh/W+83qId//q1iBpSK94GL5/bnvmoA=; b=cckM1P+hIVC+gfBRUJBK9jTwsF
 09oyjdSi2P4xMBciuPz/KKix7hJW25WrChrHOu38Pig/VDJrWjsfOSYC8YmpN0TDylgQoD6V1UT8H
 gWw+WLCcBSdgY4pIvijsXpmpYRCwynv7kURM01IGd7JgcWdYOOhuD1Mz2IJRtl3IjfN4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JBzY8ay06JDDvh/W+83qId//q1iBpSK94GL5/bnvmoA=; b=iYzTtxYKr/h2kIGNkN1FJ3L5Cq
 qJHCNa7IPbN43+6/VHnUHXkAnuD+FcvstDl++ANXv0FnM2BfZfZd9Xcd8SMHMT3KsR8e8A89igUy2
 S5YlIENpCkVNZTW0NVGfFO8ni51jnTtK6LhXUUMI+8LPAVxxcOkqmwaEYRyvg2SKT8+8=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lg7xM-002IwF-SV
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 May 2021 15:36:32 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id DF2ED60FE4;
 Mon, 10 May 2021 15:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620660978;
 bh=SSbmPaBwUQxBDz0hBnJOy8+pP90gPRaPkX9NvKJj0AI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=up4RZ/0zy6xdHfwZOCqPjLPFjTLkiMmmrepsehUO0Qi8m+ocqiAd17pv4GHjAmmuU
 HxoZVuRG6eIL1zT7LHc9Rj/Q+6qfFKz0GYVRwOGDZ9nFZJx77ndS3pyUAf3l/pQPUX
 Ch6VqYBUdG1lQVHt0QnHzES1dhpcvdyT0FJ+AAlmGoPH02MomcjJzQX0+rySkMQ09E
 lS3tj4RpveHAFVTXUOwdHBF2FXlDFHheLlfJ2MsM+PQTAbMNLFVljRG4Ct6ZUcH3hP
 mGHb4X4hUyvCpoUAWohmn/BfRbq6hXBlmv7P/uIc5ZqQ/887syYoNAZF4g5bkwLrmo
 AV6cQBAKNGEAw==
Date: Mon, 10 May 2021 08:36:16 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YJlS8CldaPiT42d8@google.com>
References: <20210425011053.44436-1-yuchao0@huawei.com>
 <YIbzwPGOJoKZvFnv@google.com>
 <3338f2bc-6985-c1a4-9f3d-e59a474027f9@huawei.com>
 <YJFb5GWijGzHOAV6@google.com>
 <912459e6-3eef-59b7-e8a3-1097efd22750@huawei.com>
 <YJNz6YJC1oSF8wL4@google.com>
 <591a2572-8025-5c9f-13ce-a90f26733775@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <591a2572-8025-5c9f-13ce-a90f26733775@huawei.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lg7xM-002IwF-SV
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: reduce expensive checkpoint trigger
 frequency
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

On 05/06, Chao Yu wrote:
> On 2021/5/6 12:43, Jaegeuk Kim wrote:
> > On 05/06, Chao Yu wrote:
> > > On 2021/5/4 22:36, Jaegeuk Kim wrote:
> > > > On 04/27, Chao Yu wrote:
> > > > > On 2021/4/27 1:09, Jaegeuk Kim wrote:
> > > > > > On 04/25, Chao Yu wrote:
> > > > > > > We may trigger high frequent checkpoint for below case:
> > > > > > > 1. mkdir /mnt/dir1; set dir1 encrypted
> > > > > > > 2. touch /mnt/file1; fsync /mnt/file1
> > > > > > > 3. mkdir /mnt/dir2; set dir2 encrypted
> > > > > > > 4. touch /mnt/file2; fsync /mnt/file2
> > > > > > > ...
> > > > > > > 
> > > > > > > Although, newly created dir and file are not related, due to
> > > > > > > commit bbf156f7afa7 ("f2fs: fix lost xattrs of directories"), we will
> > > > > > > trigger checkpoint whenever fsync() comes after a new encrypted dir
> > > > > > > created.
> > > > > > > 
> > > > > > > In order to avoid such condition, let's record an entry including
> > > > > > > directory's ino into global cache when we initialize encryption policy
> > > > > > > in a checkpointed directory, and then only trigger checkpoint() when
> > > > > > > target file's parent has non-persisted encryption policy, for the case
> > > > > > > its parent is not checkpointed, need_do_checkpoint() has cover that
> > > > > > > by verifying it with f2fs_is_checkpointed_node().
> > > > > > > 
> > > > > > > Reported-by: Yunlei He <heyunlei@hihonor.com>
> > > > > > > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > > > > > > ---
> > > > > > > v2:
> > > > > > > - fix to set ENC_DIR_INO only for encrypted directory
> > > > > > >     fs/f2fs/f2fs.h              | 2 ++
> > > > > > >     fs/f2fs/file.c              | 3 +++
> > > > > > >     fs/f2fs/xattr.c             | 6 ++++--
> > > > > > >     include/trace/events/f2fs.h | 3 ++-
> > > > > > >     4 files changed, 11 insertions(+), 3 deletions(-)
> > > > > > > 
> > > > > > > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > > > > > > index b9d5317db0a7..0fe881309a20 100644
> > > > > > > --- a/fs/f2fs/f2fs.h
> > > > > > > +++ b/fs/f2fs/f2fs.h
> > > > > > > @@ -246,6 +246,7 @@ enum {
> > > > > > >     	APPEND_INO,		/* for append ino list */
> > > > > > >     	UPDATE_INO,		/* for update ino list */
> > > > > > >     	TRANS_DIR_INO,		/* for trasactions dir ino list */
> > > > > > > +	ENC_DIR_INO,		/* for encrypted dir ino list */
> > > > > > >     	FLUSH_INO,		/* for multiple device flushing */
> > > > > > >     	MAX_INO_ENTRY,		/* max. list */
> > > > > > >     };
> > > > > > > @@ -1090,6 +1091,7 @@ enum cp_reason_type {
> > > > > > >     	CP_FASTBOOT_MODE,
> > > > > > >     	CP_SPEC_LOG_NUM,
> > > > > > >     	CP_RECOVER_DIR,
> > > > > > > +	CP_ENC_DIR,
> > > > > > >     };
> > > > > > >     enum iostat_type {
> > > > > > > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > > > > > > index a595050c56d3..62af29ec0879 100644
> > > > > > > --- a/fs/f2fs/file.c
> > > > > > > +++ b/fs/f2fs/file.c
> > > > > > > @@ -218,6 +218,9 @@ static inline enum cp_reason_type need_do_checkpoint(struct inode *inode)
> > > > > > >     		f2fs_exist_written_data(sbi, F2FS_I(inode)->i_pino,
> > > > > > >     							TRANS_DIR_INO))
> > > > > > >     		cp_reason = CP_RECOVER_DIR;
> > > > > > > +	else if (f2fs_exist_written_data(sbi, F2FS_I(inode)->i_pino,
> > > > > > > +							ENC_DIR_INO))
> > > > > > > +		cp_reason = CP_ENC_DIR;
> > > > > > >     	return cp_reason;
> > > > > > >     }
> > > > > > > diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
> > > > > > > index c8f34decbf8e..70615d504f7e 100644
> > > > > > > --- a/fs/f2fs/xattr.c
> > > > > > > +++ b/fs/f2fs/xattr.c
> > > > > > > @@ -630,6 +630,7 @@ static int __f2fs_setxattr(struct inode *inode, int index,
> > > > > > >     			const char *name, const void *value, size_t size,
> > > > > > >     			struct page *ipage, int flags)
> > > > > > >     {
> > > > > > > +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> > > > > > >     	struct f2fs_xattr_entry *here, *last;
> > > > > > >     	void *base_addr, *last_base_addr;
> > > > > > >     	int found, newsize;
> > > > > > > @@ -745,8 +746,9 @@ static int __f2fs_setxattr(struct inode *inode, int index,
> > > > > > >     			!strcmp(name, F2FS_XATTR_NAME_ENCRYPTION_CONTEXT))
> > > > > > >     		f2fs_set_encrypted_inode(inode);
> > > > > > >     	f2fs_mark_inode_dirty_sync(inode, true);
> > > > > > > -	if (!error && S_ISDIR(inode->i_mode))
> > > > > > > -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_CP);
> > > > > > > +	if (!error && S_ISDIR(inode->i_mode) && f2fs_encrypted_file(inode) &&
> > > > > > > +			f2fs_is_checkpointed_node(sbi, inode->i_ino))
> > > > > > > +		f2fs_add_ino_entry(sbi, inode->i_ino, ENC_DIR_INO);
> > > > > > 
> > > > > > What will happen, if we need to checkpoint xattr_nid on this directory?
> > > > > 
> > > > > need_do_checkpoint()
> > > > > 
> > > > > a)	else if (!f2fs_is_checkpointed_node(sbi, F2FS_I(inode)->i_pino))
> > > > > 		cp_reason = CP_NODE_NEED_CP;
> > > > 
> > > > This will change the current behavior which does checkpoint regardless of the
> > > > parent being checkpointed. If i_pino was checkpointed but xnid wasn't, can we
> > > > get xnid being checkpointed?
> > > 
> > > Yes,
> > > 
> > > > > If parent is checkpointed, after converting parent to encrypted directory
> > > > > and create the file in parent, fsync this file will trigger checkpoint() due
> > > > > to b)
> > > 
> > > If i_pino was checkpointed, but xnid wasn't due to enable encryption on this
> > 
> > I keep asking no encryption case where
> > 1) parent is checkpointed
> > 2) set_xattr(dir) w/ new new xnid
> > 3) create(file)
> > 4) fsync(file)
> > 
> > In that case, previousely we do checkpoint, but this change does not. Yes?
> 
> In this case, we won't checkpoint xnid, instead, just flushing file's data/node.
> 
> So yes, actually this patch will change the policy, which looks posix compliance,
> that mean we only persist the file's meta/data after fsync(file).
> 
> How about keeping original policy in FSYNC_MODE_STRICT mode, and using current
> policy in FSYNC_MODE_POSIX mode?

IIRC, it'd be much important to keep directory's xnid, so worry about stability
regression. Is that case a really performance blocker?

> 
> Thanks,
> 
> > 
> > > directory, fsync() this file will trigger checkpoint() to make sure xnid
> > > checkpointed due to b) case.
> > > 
> > > Thanks,
> > > 
> > > > 
> > > > > 
> > > > > b)	else if (f2fs_exist_written_data(sbi, F2FS_I(inode)->i_pino,
> > > > > 							ENC_DIR_INO))
> > > > > 		cp_reason = CP_ENC_DIR;
> > > > > 
> > > > > If parent is not checkpointed, after converting parent to encrypted directory
> > > > > and create the file in parent, fsync this file will trigger checkpoint() due
> > > > > to a)
> > > > > 
> > > > > If parent is checkpointed, after converting parent to encrypted directory
> > > > > and create the file in parent, fsync this file will trigger checkpoint() due
> > > > > to b)
> > > > > 
> > > > > Am I missing any cases?
> > > > > 
> > > > > Thanks,
> > > > > 
> > > > > > 
> > > > > > >     same:
> > > > > > >     	if (is_inode_flag_set(inode, FI_ACL_MODE)) {
> > > > > > > diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> > > > > > > index 56b113e3cd6a..ca0cf12226e9 100644
> > > > > > > --- a/include/trace/events/f2fs.h
> > > > > > > +++ b/include/trace/events/f2fs.h
> > > > > > > @@ -145,7 +145,8 @@ TRACE_DEFINE_ENUM(CP_RESIZE);
> > > > > > >     		{ CP_NODE_NEED_CP,	"node needs cp" },		\
> > > > > > >     		{ CP_FASTBOOT_MODE,	"fastboot mode" },		\
> > > > > > >     		{ CP_SPEC_LOG_NUM,	"log type is 2" },		\
> > > > > > > -		{ CP_RECOVER_DIR,	"dir needs recovery" })
> > > > > > > +		{ CP_RECOVER_DIR,	"dir needs recovery" },		\
> > > > > > > +		{ CP_ENC_DIR,		"persist encryption policy" })
> > > > > > >     #define show_shutdown_mode(type)					\
> > > > > > >     	__print_symbolic(type,						\
> > > > > > > -- 
> > > > > > > 2.29.2
> > > > > > .
> > > > > > 
> > > > .
> > > > 
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
