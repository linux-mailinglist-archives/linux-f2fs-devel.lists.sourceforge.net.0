Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3689D8AAE0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Aug 2019 00:59:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hxJHK-00083A-OY; Mon, 12 Aug 2019 22:59:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hxJHJ-00082o-34
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Aug 2019 22:59:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hK9vNLGU8e4a6MF3S6Rujx/7CaaHA90NTgESYSahhrM=; b=HSCMonqMBSawATpd6Mkw6GE+tF
 7fEfZJmtAL+PNB1yygVYeHrKZZsskzZaWALq3hzYqmTtf8DCk/v7lws7uHxOlgjFY8/7QzfGzfTsE
 x6z9y1MdSTbXPnwBKbidfzVkPq9CCFti/ZAdmJ9h5IcYqTHswKoK2n+cdOB9jaAB9Yw0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hK9vNLGU8e4a6MF3S6Rujx/7CaaHA90NTgESYSahhrM=; b=hxbsgPpoHgwTPxW+NTy6EnNEnT
 +5xRMqJdlXS8EVZDueep9aVW9DuOQMKwsGimyMb7HcCRvmdB6sZRZ4sHEnCdpqGYBYI5KSZsrpr0b
 pW37Oz/lTuXjpADPsFItovs/oX6RDOIKrmWE7/XfLyhvQzhw44SAqxOhFkVHUwkFahcs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hxJHG-003Hgm-Kq
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Aug 2019 22:59:01 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4DC06206A2;
 Mon, 12 Aug 2019 22:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565650731;
 bh=Ron4sxTEpdo3+tpd+CjwxdTV+/gJhLyorORoDwJgP+Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=paZ4tvByJADBX3s27FaJRrB5Ej2g8FmLvUxijggpEnAqzN/w4/EHi3nLjltk5O7ac
 34S/LLZzrFMatbOCPVVfEvQgfRT0oOd/9Da1W1dmXXDYBmTco5QM2ITb/lKh7b5/ZQ
 XZ0B4OmQnZ1PxsCIS/KHU9xEfZS0QCiia6NLmDPM=
Date: Mon, 12 Aug 2019 15:58:49 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20190812225848.GA175194@gmail.com>
Mail-Followup-To: Chao Yu <yuchao0@huawei.com>,
 linux-fscrypt@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
References: <20190811213557.1970-1-ebiggers@kernel.org>
 <20190811213557.1970-4-ebiggers@kernel.org>
 <e5d57ee4-f022-12ca-7f09-e4b8ef86c6b6@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e5d57ee4-f022-12ca-7f09-e4b8ef86c6b6@huawei.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 3.0 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 3.1 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hxJHG-003Hgm-Kq
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

Hi Chao,

On Mon, Aug 12, 2019 at 08:25:33PM +0800, Chao Yu wrote:
> Hi Eric,
> 
> On 2019/8/12 5:35, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > When an error (e.g. ENOSPC) occurs during f2fs_write_begin() when called
> > from f2fs_write_merkle_tree_block(), skip truncating the file.  i_size
> > is not meaningful in this case, and the truncation is handled by
> > f2fs_end_enable_verity() instead.
> > 
> > Fixes: 60d7bf0f790f ("f2fs: add fs-verity support")
> > Signed-off-by: Eric Biggers <ebiggers@google.com>
> > ---
> >  fs/f2fs/data.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
> > index 3f525f8a3a5fa..00b03fb87bd9b 100644
> > --- a/fs/f2fs/data.c
> > +++ b/fs/f2fs/data.c
> > @@ -2476,7 +2476,7 @@ static void f2fs_write_failed(struct address_space *mapping, loff_t to)
> >  	struct inode *inode = mapping->host;
> >  	loff_t i_size = i_size_read(inode);
> >  
> > -	if (to > i_size) {
> 
> Maybe adding one single line comment to mention that it's redundant/unnecessary
> truncation here is better, if I didn't misunderstand this.
> 
> Thanks,
> 
> > +	if (to > i_size && !f2fs_verity_in_progress(inode)) {
> >  		down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
> >  		down_write(&F2FS_I(inode)->i_mmap_sem);
> >  

Do you mean add a comment instead of the !f2fs_verity_in_progress() check, or in
addition to it?  ->write_begin(), ->writepages(), and ->write_end() are all
supposed to ignore i_size when verity is in progress, so I don't think this
particular part should be different, even if technically it's still correct to
truncate twice.  Also, ext4 needs this check in its ->write_begin() for locking
reasons; we should keep f2fs similar.

How about having both a comment and the check, like:

        /* In the fs-verity case, f2fs_end_enable_verity() does the truncate */
        if (to > i_size && !f2fs_verity_in_progress(inode)) {

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
