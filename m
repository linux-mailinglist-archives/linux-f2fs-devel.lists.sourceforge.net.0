Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4408F3900F3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 May 2021 14:26:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1llW8e-0004Pa-LG; Tue, 25 May 2021 12:26:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1llW8c-0004PB-3v
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 May 2021 12:26:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G8StVrWd5hXEDvabr6vIueWLToNkJJzP5uyiTI7r9Ms=; b=Z5koJzaJvQ8DvDuAad/YGtENwZ
 bpLyk/b7ETvy3Rtb1NllrQ+/I+7eEyqXAa/e6DdBGsMwq+RoRJsf4/ijNy71YtAmaC5zHhKnk1uAa
 3xcpd4yM6tigtkU28pP6wEUmLKhrC5Kq29/1dvysjmaGYmXnSu449loBNunqiRBtWXwk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G8StVrWd5hXEDvabr6vIueWLToNkJJzP5uyiTI7r9Ms=; b=YX6ZLSGcQMzESmm7JNXkd6NJP6
 9x10aa34rvvlELmaH8Jiu4HN268ZFUNJhgnYHpi+U4h8RbYGx9wULvXvH2IWjaTqPtqAgumpmZVee
 EgaDoioNZ1uBPlVjTjpV36V1sXjQ1cVKb7hQnsSS+jWTR9Th8IIdRfRRVKN2mGwHe0/M=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1llW8R-0007gW-Je
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 25 May 2021 12:26:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 280FD613F5;
 Tue, 25 May 2021 12:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621945567;
 bh=EtIFUMHmD3veRiC7K2Y+/790eFrQYN42I/c+VbXM3IA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oRii/JRdixaYK3XunQGlbcCvmInWA/L0Ultgkk/FcxhZ973x/vMozlr5n087UAxzi
 vPV799WYkWuZT+PnuCUFVsZc4qVnVkpn80XGUiPoupPqLIvTSY4apSC0kfyMeJXzMu
 0dH/csW93PiDVVRQv7vGUfgnSzMciCPICxUb1RK6rqBZLzXeA2pvo4OfELRm5dPS7r
 /Hova4G8bE5o9AF7OwvE5KfsZYg+QXw2cfHlcRDwgXcpcLfbHPQ8Cafi97AeJnT7IS
 FHZi5l6Nc9JXozP0OSNembwUo3fXBJXgeyMZTN9rbgaNmLz6EsC5B+7zGR7fJ0cJGe
 S03DJ15HJhHtQ==
Date: Tue, 25 May 2021 05:26:05 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YKzs3anQwxEjs0tk@google.com>
References: <20210518095458.99728-1-yuchao0@huawei.com>
 <YKXHo0LAdE5fa77J@google.com>
 <96cc500d-18df-e9b5-98aa-066a2acfacc9@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <96cc500d-18df-e9b5-98aa-066a2acfacc9@huawei.com>
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1llW8R-0007gW-Je
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs: compress: fix to disallow wildcard
 extension for hot/cold file
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

On 05/20, Chao Yu wrote:
> On 2021/5/20 10:21, Jaegeuk Kim wrote:
> > On 05/18, Chao Yu wrote:
> > > If all files are hot or cold, hot/cold separation is not needed anymore,
> > > so let's disallow configure wildcard extension.
> > 
> > We need to be able to set hot/cold on the fly?
> 
> I got your concern, so do you prefer to keep "*" extension configuration
> for hot/cold file?

I'm fine with "*".

> 
> Thanks,
> 
> > 
> > > 
> > > Fixes: 4c8ff7095bef ("f2fs: support data compression")
> > > Signed-off-by: Chao Yu <yuchao0@huawei.com>
> > > ---
> > >   fs/f2fs/f2fs.h  |  1 +
> > >   fs/f2fs/namei.c | 12 ++++++++----
> > >   fs/f2fs/sysfs.c |  3 +++
> > >   3 files changed, 12 insertions(+), 4 deletions(-)
> > > 
> > > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > > index b753cc88c77e..ecb13c3b458d 100644
> > > --- a/fs/f2fs/f2fs.h
> > > +++ b/fs/f2fs/f2fs.h
> > > @@ -3322,6 +3322,7 @@ void f2fs_handle_failed_inode(struct inode *inode);
> > >   /*
> > >    * namei.c
> > >    */
> > > +bool f2fs_is_wildcard_char(const char *ext);
> > >   int f2fs_update_extension_list(struct f2fs_sb_info *sbi, const char *name,
> > >   							bool hot, bool set);
> > >   struct dentry *f2fs_get_parent(struct dentry *child);
> > > diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
> > > index a9cd9cf97229..8d78b96a8b3b 100644
> > > --- a/fs/f2fs/namei.c
> > > +++ b/fs/f2fs/namei.c
> > > @@ -153,15 +153,17 @@ static struct inode *f2fs_new_inode(struct inode *dir, umode_t mode)
> > >   	return ERR_PTR(err);
> > >   }
> > > +bool f2fs_is_wildcard_char(const char *ext)
> > > +{
> > > +	return *ext == '*' && strlen(ext) == 1;
> > > +}
> > > +
> > >   static inline int is_extension_exist(const unsigned char *s, const char *sub)
> > >   {
> > >   	size_t slen = strlen(s);
> > >   	size_t sublen = strlen(sub);
> > >   	int i;
> > > -	if (sublen == 1 && *sub == '*')
> > > -		return 1;
> > > -
> > >   	/*
> > >   	 * filename format of multimedia file should be defined as:
> > >   	 * "filename + '.' + extension + (optional: '.' + temp extension)".
> > > @@ -306,9 +308,11 @@ static void set_compress_inode(struct f2fs_sb_info *sbi, struct inode *inode,
> > >   	ext = F2FS_OPTION(sbi).extensions;
> > >   	for (i = 0; i < ext_cnt; i++) {
> > > +		if (f2fs_is_wildcard_char(ext[i]))
> > > +			goto set_compress;
> > >   		if (!is_extension_exist(name, ext[i]))
> > >   			continue;
> > > -
> > > +set_compress:
> > >   		set_compress_context(inode);
> > >   		return;
> > >   	}
> > > diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
> > > index dc71bc968c72..ff5acb4de1b6 100644
> > > --- a/fs/f2fs/sysfs.c
> > > +++ b/fs/f2fs/sysfs.c
> > > @@ -343,6 +343,9 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
> > >   		if (strlen(name) >= F2FS_EXTENSION_LEN)
> > >   			return -EINVAL;
> > > +		if (f2fs_is_wildcard_char(name))
> > > +			return -EINVAL;
> > > +
> > >   		down_write(&sbi->sb_lock);
> > >   		ret = f2fs_update_extension_list(sbi, name, hot, set);
> > > -- 
> > > 2.29.2
> > .
> > 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
