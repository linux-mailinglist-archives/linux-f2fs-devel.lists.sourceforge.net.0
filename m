Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D5C91989
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 18 Aug 2019 22:24:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hzRj9-0002We-Sm; Sun, 18 Aug 2019 20:24:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hzRj8-0002WS-Cr
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 18 Aug 2019 20:24:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BKfPVZhKRmjWNRpZBHRB88td9UQAM7XeZBne0SW+Wfs=; b=YT80UEGxGgXrIYWKnj03+hmjC7
 mWaFqdhNwtSEVQ76AodljzehR/l8kCIOoD4RbaG/RAEMfIRl2GPfag6bKjL0L2homCdsFqzQeounh
 Cyn9fiFsVXdL68DUpk/3Q/hAE2WBQV/5L8NBt3G7oJXH/HT214YOTetQy05p1MBPC78s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BKfPVZhKRmjWNRpZBHRB88td9UQAM7XeZBne0SW+Wfs=; b=ELlVEs2KEXGj6E25OaHb2P/wXy
 1kmX4OXc/F8YL/gBg8xSA4+khou97uODltKqghOaJzKQ+CX12mbsKN0ygbj6uyy12B9B+nx6rChki
 uX8pn2Fc7FZWj3URkxt95W1bzCrVPbl3Zvcaefg4vD2yu1zQiu/C8mNZJnez/vDHC1U4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hzRj7-008337-5w
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 18 Aug 2019 20:24:34 +0000
Received: from zzz.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6A5BE206BB;
 Sun, 18 Aug 2019 20:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1566159867;
 bh=Jh5Ix1Is82ONb8wHIbToD8YP+ZDZW+pBP6C/nAQhTzg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ylz/BQ2XWLsri1rObtepn8jOl/INXaYtOJ7hD5K8gZSWxNJ9jDnpkV5yf6N+OubrE
 4ugxzItfLzY1NdgYWeFyANbTx9QogPOYg3MT3ntXDSuH7aMg+bwi8/Fi4DYj6Z+Jgh
 vQxHqN5ocmzElOA7PsGNfK3ZRD/gaKXwKP8wVT94=
Date: Sun, 18 Aug 2019 13:24:26 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190818202426.GB1824@zzz.localdomain>
Mail-Followup-To: Chao Yu <yuchao0@huawei.com>,
 linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20190811213557.1970-1-ebiggers@kernel.org>
 <20190811213557.1970-4-ebiggers@kernel.org>
 <e5d57ee4-f022-12ca-7f09-e4b8ef86c6b6@huawei.com>
 <20190812225848.GA175194@gmail.com>
 <13be698c-1a3d-9f6a-66d8-b9024b7963f3@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <13be698c-1a3d-9f6a-66d8-b9024b7963f3@huawei.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
X-Headers-End: 1hzRj7-008337-5w
Subject: Re: [f2fs-dev] [PATCH 3/6] f2fs: skip truncate when verity in
 progress in ->write_begin()
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
Cc: linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Aug 13, 2019 at 10:40:39AM +0800, Chao Yu wrote:
> Hi Eric,
> 
> On 2019/8/13 6:58, Eric Biggers wrote:
> > Hi Chao,
> > 
> > On Mon, Aug 12, 2019 at 08:25:33PM +0800, Chao Yu wrote:
> >> Hi Eric,
> >>
> >> On 2019/8/12 5:35, Eric Biggers wrote:
> >>> From: Eric Biggers <ebiggers@google.com>
> >>>
> >>> When an error (e.g. ENOSPC) occurs during f2fs_write_begin() when called
> >>> from f2fs_write_merkle_tree_block(), skip truncating the file.  i_size
> >>> is not meaningful in this case, and the truncation is handled by
> >>> f2fs_end_enable_verity() instead.
> >>>
> >>> Fixes: 60d7bf0f790f ("f2fs: add fs-verity support")
> >>> Signed-off-by: Eric Biggers <ebiggers@google.com>
> >>> ---
> >>>  fs/f2fs/data.c | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> >>> index 3f525f8a3a5fa..00b03fb87bd9b 100644
> >>> --- a/fs/f2fs/data.c
> >>> +++ b/fs/f2fs/data.c
> >>> @@ -2476,7 +2476,7 @@ static void f2fs_write_failed(struct address_space *mapping, loff_t to)
> >>>  	struct inode *inode = mapping->host;
> >>>  	loff_t i_size = i_size_read(inode);
> >>>  
> >>> -	if (to > i_size) {
> >>
> >> Maybe adding one single line comment to mention that it's redundant/unnecessary
> >> truncation here is better, if I didn't misunderstand this.
> >>
> >> Thanks,
> >>
> >>> +	if (to > i_size && !f2fs_verity_in_progress(inode)) {
> >>>  		down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> >>>  		down_write(&F2FS_I(inode)->i_mmap_sem);
> >>>  
> > 
> > Do you mean add a comment instead of the !f2fs_verity_in_progress() check, or in
> > addition to it?  ->write_begin(), ->writepages(), and ->write_end() are all
> 
> Sorry, I didn't make this very clear, I meant adding the comment in addition on
> above change.
> 
> > supposed to ignore i_size when verity is in progress, so I don't think this
> > particular part should be different, even if technically it's still correct to
> > truncate twice.  Also, ext4 needs this check in its ->write_begin() for locking
> > reasons; we should keep f2fs similar.
> 
> Agreed.
> 
> > 
> > How about having both a comment and the check, like:
> > 
> >         /* In the fs-verity case, f2fs_end_enable_verity() does the truncate */
> >         if (to > i_size && !f2fs_verity_in_progress(inode)) {
> 
> The comment looks good to me. :)
> 
> Thanks,
> 
> > 
> > - Eric
> > .
> > 
> 

Okay, this is what I applied:

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 3f525f8a3a5f..54cad80acb7d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2476,7 +2476,8 @@ static void f2fs_write_failed(struct address_space *mapping, loff_t to)
 	struct inode *inode = mapping->host;
 	loff_t i_size = i_size_read(inode);
 
-	if (to > i_size) {
+	/* In the fs-verity case, f2fs_end_enable_verity() does the truncate */
+	if (to > i_size && !f2fs_verity_in_progress(inode)) {
 		down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 		down_write(&F2FS_I(inode)->i_mmap_sem);
 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
