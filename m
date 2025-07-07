Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B29AFAAE2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Jul 2025 07:27:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:MIME-Version:References:Message-ID:To:From:Date:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=moTsV63TJjvYLVw3mrMw1sHbXzW4qBAtny1veypQOFU=; b=aWUz8MxCD+eVQ3lZnz6UBdSMSk
	gO0taG6GSb0thPbYW8T78Qb3I1po8/4WCxlEXmkpfmVt8QhYjhsLvyCysKFp72tjE/THUtOBDkl3o
	7QzbDfI3MhteULbBKV8BbCpZEQv3nlC1Op4qRQ2yUQGYe7x69A61e/oYG24Bjl1erNwc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uYeO5-00076T-JZ;
	Mon, 07 Jul 2025 05:27:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+7c4dbc6fc51c0acbb13f+7988+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1uYeO4-00076N-Ed for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Jul 2025 05:27:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yjYpPsb1PlpJ4trdF82+OwKClS+X6SpzN0bYgE8MEi8=; b=YV9kenK/pV63xlwOs+JzZkEPp9
 88aBBwmYV58JkeDe5tr28Lfr3Gf3IS1e3WFiMn7JYjQqxu0o6rDqM9lBcYLilvNtEsL9JiGYVJLm2
 pWa5vRKIoHDXsy7NCndofztGe588eKaX7S2/XUFWbLuQUd1NPtGc0ua8QvbSaVXJ/aNg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=yjYpPsb1PlpJ4trdF82+OwKClS+X6SpzN0bYgE8MEi8=; b=hmxxGfgnyULQimKDXkw9f5qYKl
 4329fbzudl3fyQ31JZJS2yqOog8UobLT3eoRLHsaObiq31j4E1xilM4pCOzsx/Qvgk8SA2yX4n50c
 jF8izUzxcem0hzAWYy/KAJ8IpzY1EUhJRgVvY1TXJh9WzLRWxL1kRXAPB+kU0zkPInwQ=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uYeO4-0000lu-0o for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Jul 2025 05:27:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=yjYpPsb1PlpJ4trdF82+OwKClS+X6SpzN0bYgE8MEi8=; b=mJbJX81LkHLWenjyVpDOEV6th/
 0RXfvxzyDfXyzQ8ca97WJZaSBp6QXvcMxkje3u9wyL519KCvFaNGie7tG+MMdv61u5rMtVk1g7RUT
 qKmGSYAluEIaCApNI/pUdpBZdoFPjeSZXpwM/jxfVf+4CeDVBpisv1p8VuSvgZjod0WrWry/D/pms
 fCfCIuOW7tLKdVEAjnWyab0OruZA5cEBzvlWm0FEZI29mwl/7jtKshwJHzIIbTP4kNScBGkwDtoiZ
 4J9eGct4fcMVrsYgIJ6MDtv1Lh9lvLtlGP0fjin0VJSvDTsILqnkesaH05sCeEPxpU+VIACEY/Cem
 iHAZuwLg==;
Received: from hch by bombadil.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uYeNp-00000001QwP-15D7;
 Mon, 07 Jul 2025 05:27:17 +0000
Date: Sun, 6 Jul 2025 22:27:17 -0700
From: Christoph Hellwig <hch@infradead.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <aGtatW8g2fV6bFkm@infradead.org>
References: <aGZFtmIxHDLKL6mc@infradead.org>
 <tencent_82716EB4F15F579C738C3CC3AFE62E822207@qq.com>
 <20250704060259.GB4199@sol>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250704060259.GB4199@sol>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jul 03, 2025 at 11:02:59PM -0700, Eric Biggers wrote:
 [Can you trim your replies to the usual 73 characters? The long lines make
 them quite hard to read without first reflowing them] > The real problem
 is, once again, the legacy crypto_skcipher API, which requires > that the
 source/destination buffers be provided as scatterlists. In Linux, the > kernel
 stack can be in the vmalloc [...] 
 Content analysis details:   (-0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uYeO4-0000lu-0o
Subject: Re: [f2fs-dev] [PATCH v3 1/2] libfs: reduce the number of memory
 allocations in generic_ci_match
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
Cc: brauner@kernel.org, linux-ext4@vger.kernel.org, tytso@mit.edu,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 hch@infradead.org, adilger.kernel@dilger.ca, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 Yuwen Chen <ywen.chen@foxmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 03, 2025 at 11:02:59PM -0700, Eric Biggers wrote:

[Can you trim your replies to the usual 73 characters?  The long lines
make them quite hard to read without first reflowing them]

> The real problem is, once again, the legacy crypto_skcipher API, which requires
> that the source/destination buffers be provided as scatterlists.  In Linux, the
> kernel stack can be in the vmalloc area.  Thus, the buffers passed to
> crypto_skcipher cannot be stack buffers unless the caller actually is aware of
> how to turn a vmalloc'ed buffer into a scatterlist, which is hard to do.  (See
> verity_ahash_update() in drivers/md/dm-verity-target.c for an example.)

I don't think setting up a scatterlist for vmalloc data is hard.  But it is
extra boilerplate code that is rather annoying and adds overhead.

> code in the kernel uses is something that would be worth adopting for
> now in fname_decrypt().  As I mentioned above, it's hard to do (you
> have to go page by page), but it's possible.  That would allow
> immediately moving generic_ci_match() to use a stack allocation, which
> would avoid adding all the complexity of the preallocation that you
> have in this patchset.

I suspect that all the overhead required for that get close to that of a
memory allocation.

But I wonder why generic_ci_match is even called that often.  Both ext4
and f2fs support hashed lookups, so you should usually only see it called
for the main match, plus the occasional hash false positive, which should
be rate if the hash works.

Yuwen, are you using f2fs in the mode where it does a linear scan on a
hash lookup miss?  That was added as a workaround for the utf8 code point
changes, but is a completely broken idea the defeats hashed lookups and
IIRC only was default for a very short time.

Note that even with this fixed, using an on-stack allocation would be
nice eventually when moving the crypto library API, as it would still
avoid the allocation entirely.  But caching shouldn't be worth it if the
number of generic_ci_match per lookup is just slightly above 1.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
