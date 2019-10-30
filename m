Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 661C9EA2BD
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Oct 2019 18:47:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iPs4A-0000Hc-F1; Wed, 30 Oct 2019 17:47:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iPs49-0000HK-0t
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Oct 2019 17:47:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+iiXv8M9Suc+ehqvAs0gM0SbNLQiqYJf/bW8qd4koKs=; b=ZsCd9Ln6toUnND40Y8up8mYdX/
 wVbpvZhY5g5C5OgpsIOZ+eW7Trdff6djMnadJsU4F2tlFYNK7RHVDiU+0hB7XnCxcK8jcS8MDql+A
 Jog2lo2VCB6+AjxfsyYLWwppVCOCjexAVa1L+imIehUzEdr6q4vgVBZIwhM3P2v1VKNo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+iiXv8M9Suc+ehqvAs0gM0SbNLQiqYJf/bW8qd4koKs=; b=faYaLByLXVqwDOhh/ZOKhtGEAB
 N9BdKBaMdTTjxz6QlrvcCoC67TsIT8ISDWNpuaK9Y3oeBY9YRwwJY/sA+zcohk2U7Er8Kz+VYNYfm
 EPYHUg5ZBOOt0pI+p8b0SMhI2k2sXulnNdOLLzuMwke/89fU7e0ocAO6NAIHCYL3VyTg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iPs42-00BACL-Te
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Oct 2019 17:47:28 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9DB3820659;
 Wed, 30 Oct 2019 17:47:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1572457635;
 bh=sjprPqg2PbaiKLXjdDkpF8WMp02FewdHM7IhqCH/KBY=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=qvf5Q3NhTT110wh2br44Y/15LJDDHIw6tTyaIc8WfsAp9TgtRSJZq1Mq29zfD47I5
 Bgnzk6Iyez0hE4pGF4Iy/UfvI8iffKZxEG3+J1wiKpGuajR11oficmHqOe2eYmZDjH
 GA2kpzpig2Q225fjWLu+HBSsUUk0UnkPOJfub28Y=
Date: Wed, 30 Oct 2019 10:47:14 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Message-ID: <20191030174714.GA36729@jaegeuk-macbookpro.roam.corp.google.com>
References: <20191022171602.93637-1-jaegeuk@kernel.org>
 <20191022171602.93637-2-jaegeuk@kernel.org>
 <20191027225006.GA321938@sol.localdomain>
 <da214cdc-0074-b7bf-7761-d4c4ad3d4f6a@huawei.com>
 <20191030025512.GA4791@sol.localdomain>
 <97c33fa1-15af-b319-29a1-22f254a26c0a@huawei.com>
 <20191030165056.GA693@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191030165056.GA693@sol.localdomain>
User-Agent: Mutt/1.8.2 (2017-04-18)
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iPs42-00BACL-Te
Subject: Re: [f2fs-dev] [PATCH 2/2] f2fs: support data compression
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 10/30, Eric Biggers wrote:
> On Wed, Oct 30, 2019 at 04:43:52PM +0800, Chao Yu wrote:
> > On 2019/10/30 10:55, Eric Biggers wrote:
> > > On Tue, Oct 29, 2019 at 04:33:36PM +0800, Chao Yu wrote:
> > >> On 2019/10/28 6:50, Eric Biggers wrote:
> > >>>> +bool f2fs_is_compressed_page(struct page *page)
> > >>>> +{
> > >>>> +	if (!page_private(page))
> > >>>> +		return false;
> > >>>> +	if (IS_ATOMIC_WRITTEN_PAGE(page) || IS_DUMMY_WRITTEN_PAGE(page))
> > >>>> +		return false;
> > >>>> +	return *((u32 *)page_private(page)) == F2FS_COMPRESSED_PAGE_MAGIC;
> > >>>> +}
> > >>>
> > >>> This code implies that there can be multiple page private structures each of
> > >>> which has a different magic number.  But I only see F2FS_COMPRESSED_PAGE_MAGIC.
> > >>> Where in the code is the other one(s)?
> > >>
> > >> I'm not sure I understood you correctly, did you mean it needs to introduce
> > >> f2fs_is_atomic_written_page() and f2fs_is_dummy_written_page() like
> > >> f2fs_is_compressed_page()?
> > >>
> > > 
> > > No, I'm asking what is the case where the line
> > > 
> > > 	*((u32 *)page_private(page)) == F2FS_COMPRESSED_PAGE_MAGIC
> > > 
> > > returns false?
> > 
> > Should be this?
> > 
> > if (!page_private(page))
> > 	return false;
> > f2fs_bug_on(*((u32 *)page_private(page)) != F2FS_COMPRESSED_PAGE_MAGIC)
> > return true;
> 
> Yes, that makes more sense, unless there are other cases.
> 
> > 
> > > 
> > >>>
> > >>>> +
> > >>>> +static void f2fs_set_compressed_page(struct page *page,
> > >>>> +		struct inode *inode, pgoff_t index, void *data, refcount_t *r)
> > >>>> +{
> > >>>> +	SetPagePrivate(page);
> > >>>> +	set_page_private(page, (unsigned long)data);
> > >>>> +
> > >>>> +	/* i_crypto_info and iv index */
> > >>>> +	page->index = index;
> > >>>> +	page->mapping = inode->i_mapping;
> > >>>> +	if (r)
> > >>>> +		refcount_inc(r);
> > >>>> +}
> > >>>
> > >>> It isn't really appropriate to create fake pagecache pages like this.  Did you
> > >>> consider changing f2fs to use fscrypt_decrypt_block_inplace() instead?
> > >>
> > >> We need to store i_crypto_info and iv index somewhere, in order to pass them to
> > >> fscrypt_decrypt_block_inplace(), where did you suggest to store them?
> > >>
> > > 
> > > The same place where the pages are stored.
> > 
> > Still we need allocate space for those fields, any strong reason to do so?
> > 
> 
> page->mapping set implies that the page is a pagecache page.  Faking it could
> cause problems with code elsewhere.

I've checked it with minchan, and it seems to be fine that filesystem uses
this page internally only, not in pagecache.

> 
> > > 
> > >>>> +
> > >>>> +void f2fs_destroy_compress_ctx(struct compress_ctx *cc)
> > >>>> +{
> > >>>> +	kvfree(cc->rpages);
> > >>>> +}
> > >>>
> > >>> The memory is allocated with kzalloc(), so why is it freed with kvfree() and not
> > >>> just kfree()?
> > >>
> > >> It was allocated by f2fs_*alloc() which will fallback to kvmalloc() once
> > >> kmalloc() failed.
> > > 
> > > This seems to be a bug in f2fs_kmalloc() -- it inappropriately falls back to
> > > kvmalloc().  As per its name, it should only use kmalloc().  f2fs_kvmalloc()
> > > already exists, so it can be used when the fallback is wanted.
> > 
> > We can introduce f2fs_memalloc() to wrap f2fs_kmalloc() and f2fs_kvmalloc() as
> > below:
> > 
> > f2fs_memalloc()
> > {
> > 	mem = f2fs_kmalloc();
> > 	if (mem)
> > 		return mem;
> > 	return f2fs_kvmalloc();
> > }
> > 
> > It can be used in specified place where we really need it, like the place
> > descirbied in 5222595d093e ("f2fs: use kvmalloc, if kmalloc is failed") in where
> > we introduced original logic.
> 
> No, just use kvmalloc().  The whole point of kvmalloc() is that it tries
> kmalloc() and then falls back to vmalloc() if it fails.
> 
> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
