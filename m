Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F7BC80F38
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Nov 2025 15:16:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gny3NbRoEMTr11pchSgHCdWlPRUjCZC7yd6D6Hh8kvo=; b=RqFY0myE0bZjGZoKtVIegsXU6X
	mN4cs+0ACTNvNk+2M/w7F5tPZ1qmBkH/6ZVytTKJWyWvYJf5qOnKF4NXy7a73YlPm6k4qJFU5GbWc
	GT8sBbLUklYmEymIuPdHy5m/SsQmPYDRlQaczHWhqlZ/kJHh7Sk742oYgw610hB1p0u8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNXMl-0004Mq-W4;
	Mon, 24 Nov 2025 14:16:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hch@lst.de>) id 1vNXMk-0004Ma-D7
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 14:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fdA2FhyYdi8hZTZFvKBurmQdMwX5PNBD1lO8r3J2lVM=; b=dPwnl4ZZG1JSkL3qaWxcQWeMUj
 wtEaLMvq8NgsmWVtvi6PZHuhC/ca95TIRnOuXtioMItF11kExNH4XxA/JGWIlzcNlxLA9U8fiKvU4
 TH3WYnjzI6AKhGh0R/8H41nj7JfQWW3JjuJL29jOvgECe2AAtkOwNDspAmq8bvp7/A8M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fdA2FhyYdi8hZTZFvKBurmQdMwX5PNBD1lO8r3J2lVM=; b=L6LurqjltI9TzDfXCtKxuFwHSe
 pQBZPrhhzn2/S6VBUPN80WS8xUk+p025s5ALpldt38pBYXDjvr4QckGRAuMTYi9YWwhgyMoLmNBhy
 5oAyPJJxSWL0ThqdQSSfgeW81LgbibOmg4frSjTzEaL0QCY/2KYOr44q78t0ac2LxZVA=;
Received: from verein.lst.de ([213.95.11.211])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vNXMk-0003Zk-Lh for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 14:16:31 +0000
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0436768B05; Mon, 24 Nov 2025 15:16:21 +0100 (CET)
Date: Mon, 24 Nov 2025 15:16:21 +0100
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20251124141621.GC14417@lst.de>
References: <20251118062159.2358085-1-hch@lst.de>
 <20251118062159.2358085-5-hch@lst.de> <20251122181717.GA1626@quark>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251122181717.GA1626@quark>
User-Agent: Mutt/1.5.17 (2007-11-01)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Nov 22, 2025 at 10:17:17AM -0800, Eric Biggers wrote:
 > On Tue, Nov 18, 2025 at 07:21:47AM +0100, Christoph Hellwig wrote: > >
 diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
X-Headers-End: 1vNXMk-0003Zk-Lh
Subject: Re: [f2fs-dev] [PATCH 04/11] fscrypt: pass a byte offset to
 fscrypt_mergeable_bio
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
Cc: Christian Brauner <brauner@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 "Darrick J. Wong" <djwong@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Nov 22, 2025 at 10:17:17AM -0800, Eric Biggers wrote:
> On Tue, Nov 18, 2025 at 07:21:47AM +0100, Christoph Hellwig wrote:
> > diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
> > index 1773dd7ea7cf..aba830e0827d 100644
> > --- a/fs/crypto/inline_crypt.c
> > +++ b/fs/crypto/inline_crypt.c
> > @@ -361,7 +361,7 @@ EXPORT_SYMBOL_GPL(fscrypt_set_bio_crypt_ctx_bh);
> >   * fscrypt_mergeable_bio() - test whether data can be added to a bio
> >   * @bio: the bio being built up
> >   * @inode: the inode for the next part of the I/O
> > - * @next_lblk: the next file logical block number in the I/O
> > + * @pos: the next file logical offset (in bytes) in the I/O
> 
> In comments, maybe call it a "file position" instead of "file logical
> offset" to match the variable name?

Doing a quick grep, "file offset" seems to be a bit more than twice
as common as "file position" in the kernel.  Logical offset, even
without file is barely used.  So I think "file offset' might be best
here, but if you prefer "file position" I can switch to that as well.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
