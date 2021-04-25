Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3ABD936A5C0
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 25 Apr 2021 10:36:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1laaFz-0002pU-Sd; Sun, 25 Apr 2021 08:36:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1laaFx-0002pB-GP
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 25 Apr 2021 08:36:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZaQX5Wdp7AVf5dMCRYMu16xdbVTPbjHbFb48z0WIXXg=; b=FF0Xn8DfPgJEMJHcv2KBxwWoVc
 dWl9sHDbD6fahbx/kfszKMfPk97fi7oKoo8ft2lOWK5IXjegRqLGJoC2UHXx/hdjBjJmGIt4n5tsp
 KBWgjF3kfSJW5K7FKbs0ZtOmQwol1gYGX9fUAKaDHwUaK2wNXLaxLQldZXltIL35epLA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZaQX5Wdp7AVf5dMCRYMu16xdbVTPbjHbFb48z0WIXXg=; b=loYz2Py3AGGS0G5Si4qwLrC2wr
 /46FsavhqVqEEpVHCakLNY+vZhUHRfjDviJZisbYNoHFaxZCD+ep9iTobXHVuiOHmV6eKD/8khDLY
 MZ0HMC6yqhsblgXG1F/WNnVOeMX4rMRXbI5pKp2sx0SPExLhCQe1A8Xqqe0E3mPBTIuQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1laaFp-005nfd-AL
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 25 Apr 2021 08:36:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E13E161077;
 Sun, 25 Apr 2021 00:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1619311936;
 bh=0sswosJp2T+Ha8GIlRrAqjFW2LwIt2yXsBEDotu6Aw0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RdLJc3QDG+4o1Br1BkmefK5OSH4qO1GMA42lQjzm61zfZzaYYwxufX3YhEARrDDjl
 PP34vzqw2XXO8xYKhJPJfEDXCx97G5AJ/OPlH7T3X8BS5EEwwDJUq9B9467bTrsbnL
 7Jsrv9QnypGV0y+vFzyjc9OnGOMen7q7Se3Lj9jIae1pccohfR8/7CIE2ml7g/vKfq
 jrgWMSQnTyEMd1QQP0ORPDUBW51zX4g3turtBKp5CuWBAnjqb8EbRfwC4rJKEs4eNb
 Yl8+O5JVWwn8ulZttBG8ZtQSxYpqi2/yp7nuznHm722eDdK2Y1stzH8ux5F8bkdC8n
 d7eBktaCMzC4g==
Date: Sat, 24 Apr 2021 17:52:14 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YIS9PtDRSfmpKAJU@google.com>
References: <20210416095838.29568-1-yuchao0@huawei.com>
 <YID2TOCsgKdi0aLf@google.com>
 <733ba2da-4047-045b-5223-05012b980603@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <733ba2da-4047-045b-5223-05012b980603@huawei.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1laaFp-005nfd-AL
Subject: Re: [f2fs-dev] [RFC PATCH] f2fs: reduce expensive checkpoint
 trigger frequency
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

On 04/22, Chao Yu wrote:
> On 2021/4/22 12:06, Jaegeuk Kim wrote:
> > On 04/16, Chao Yu wrote:
> > > We may trigger high frequent checkpoint for below case:
> > > 1. mkdir /mnt/dir1; set dir1 encrypted
> > > 2. touch /mnt/file1; fsync /mnt/file1
> > > 3. mkdir /mnt/dir2; set dir2 encrypted
> > > 4. touch /mnt/file2; fsync /mnt/file2
> > > ...
> > > 
> > > Although, newly created dir and file are not related, due to
> > > commit bbf156f7afa7 ("f2fs: fix lost xattrs of directories"), we will
> > > trigger checkpoint whenever fsync() comes after a new encrypted dir
> > > created.
> > 
> > It'll happen once? How much impact will we hit due to this?
> 
> Yunlei reports me this issue, the problems here in Honer device's specified
> environment, most fsync() on regular file triggers a checkpoint() when mkdir()
> happened concurrently, result in causing the performance issue.
> 
> Yunlei could explain more about details of this issue. @Yunlei
> 
> > 
> > > 
> > > In order to avoid such condition, let's record an entry including
> > > directory's ino into global cache when we initialize encryption policy
> > > in a checkpointed directory, and then only trigger checkpoint() when
> > > target file's parent has non-persisted encryption policy, for the case
> > > its parent is not checkpointed, need_do_checkpoint() has cover that
> > > by verifying it with f2fs_is_checkpointed_node().
> > > 
> > > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > > ---
> > >   fs/f2fs/f2fs.h              | 2 ++
> > >   fs/f2fs/file.c              | 3 +++
> > >   fs/f2fs/xattr.c             | 6 ++++--
> > >   include/trace/events/f2fs.h | 3 ++-
> > >   4 files changed, 11 insertions(+), 3 deletions(-)
> > > 
> > > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > > index 87d734f5589d..34487e527d12 100644
> > > --- a/fs/f2fs/f2fs.h
> > > +++ b/fs/f2fs/f2fs.h
> > > @@ -246,6 +246,7 @@ enum {
> > >   	APPEND_INO,		/* for append ino list */
> > >   	UPDATE_INO,		/* for update ino list */
> > >   	TRANS_DIR_INO,		/* for trasactions dir ino list */
> > > +	ENC_DIR_INO,		/* for encrypted dir ino list */
> > >   	FLUSH_INO,		/* for multiple device flushing */
> > >   	MAX_INO_ENTRY,		/* max. list */
> > >   };
> > > @@ -1090,6 +1091,7 @@ enum cp_reason_type {
> > >   	CP_FASTBOOT_MODE,
> > >   	CP_SPEC_LOG_NUM,
> > >   	CP_RECOVER_DIR,
> > > +	CP_ENC_DIR,
> > >   };
> > >   enum iostat_type {
> > > diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
> > > index 6284b2f4a60b..a6c38d8b1ec3 100644
> > > --- a/fs/f2fs/file.c
> > > +++ b/fs/f2fs/file.c
> > > @@ -218,6 +218,9 @@ static inline enum cp_reason_type need_do_checkpoint(struct inode *inode)
> > >   		f2fs_exist_written_data(sbi, F2FS_I(inode)->i_pino,
> > >   							TRANS_DIR_INO))
> > >   		cp_reason = CP_RECOVER_DIR;
> > > +	else if (f2fs_exist_written_data(sbi, F2FS_I(inode)->i_pino,
> > > +							ENC_DIR_INO))
> > > +		cp_reason = CP_ENC_DIR;
> > >   	return cp_reason;
> > >   }
> > > diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
> > > index c8f34decbf8e..38796d488d15 100644
> > > --- a/fs/f2fs/xattr.c
> > > +++ b/fs/f2fs/xattr.c
> > > @@ -630,6 +630,7 @@ static int __f2fs_setxattr(struct inode *inode, int index,
> > >   			const char *name, const void *value, size_t size,
> > >   			struct page *ipage, int flags)
> > >   {
> > > +	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
> > >   	struct f2fs_xattr_entry *here, *last;
> > >   	void *base_addr, *last_base_addr;
> > >   	int found, newsize;
> > > @@ -745,8 +746,9 @@ static int __f2fs_setxattr(struct inode *inode, int index,
> > >   			!strcmp(name, F2FS_XATTR_NAME_ENCRYPTION_CONTEXT))
> > >   		f2fs_set_encrypted_inode(inode);
> > >   	f2fs_mark_inode_dirty_sync(inode, true);
> > > -	if (!error && S_ISDIR(inode->i_mode))
> > > -		set_sbi_flag(F2FS_I_SB(inode), SBI_NEED_CP);
> > > +	if (!error && S_ISDIR(inode->i_mode) &&
> > > +			f2fs_is_checkpointed_node(sbi, inode->i_ino))
> > > +		f2fs_add_ino_entry(sbi, inode->i_ino, ENC_DIR_INO);
> > 
> > Is it right to say ENC_DIR_INO in this case?
> 
> Sorry, I didn't get it.

I mean, this case includes non-encrypted directory as well.

> 
> Thanks,
> 
> > 
> > >   same:
> > >   	if (is_inode_flag_set(inode, FI_ACL_MODE)) {
> > > diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> > > index 56b113e3cd6a..ca0cf12226e9 100644
> > > --- a/include/trace/events/f2fs.h
> > > +++ b/include/trace/events/f2fs.h
> > > @@ -145,7 +145,8 @@ TRACE_DEFINE_ENUM(CP_RESIZE);
> > >   		{ CP_NODE_NEED_CP,	"node needs cp" },		\
> > >   		{ CP_FASTBOOT_MODE,	"fastboot mode" },		\
> > >   		{ CP_SPEC_LOG_NUM,	"log type is 2" },		\
> > > -		{ CP_RECOVER_DIR,	"dir needs recovery" })
> > > +		{ CP_RECOVER_DIR,	"dir needs recovery" },		\
> > > +		{ CP_ENC_DIR,		"persist encryption policy" })
> > >   #define show_shutdown_mode(type)					\
> > >   	__print_symbolic(type,						\
> > > -- 
> > > 2.29.2
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
