Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6055E6D8AD1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  6 Apr 2023 00:54:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pkC1I-0003Kx-6z;
	Wed, 05 Apr 2023 22:54:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1pkC1E-0003Kq-3u
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 22:54:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6JUsAGKEXzuNd3ZoMR2OtLIul6CggHLj09DSy7aat6U=; b=NJfQQ6bFQEif/AeEIWpqnfCfE2
 FIB8bUDul9BeBw0vTdH+95JNlvrWNdjT0YpvZl3Q91OLBRwqBK5fZLtHIJiTVuuaHjJZiIMRVHfac
 NCfknsN6tQLtaeccLUpKPwpk6csiIxEP3INIGHPoYw0/OfXynhazaug6wdfHO1G31lZY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6JUsAGKEXzuNd3ZoMR2OtLIul6CggHLj09DSy7aat6U=; b=L/esK5rbM5gdgRICn0jghXBKX6
 UOBpZKA2agUyM9zGSKhTNdUa1E8gkiyLzTQIavfSY9a8YkKyZ+Mk/GAGSDgjB1fK9eZoNs5L0pBV0
 tA9D/b4alQYGLjE7i14eHFEQbsHUCKU4MlEIo7s3PdoSFYE5eNUmHxD4RYddCkP8Qs60=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pkC1B-00GM0Z-Au for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 05 Apr 2023 22:54:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 588C86413E;
 Wed,  5 Apr 2023 22:54:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 722A6C433EF;
 Wed,  5 Apr 2023 22:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680735247;
 bh=y5XoOju2yBDL4YDibMiieXpA89mTn+Rteq91AiPxCaU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LovyRg/EAV0o26rHWyr3wwdJKBIWeqs2RWTqBiuMA93Uopo6KQP/kuk5d1BnGrKHX
 eXiQmEFzna6WH31jznXOQEsuU8fCZaqbF53Fy9IDiBzVWVzNlq3Fcms5RC/AHMk3CM
 OAU4zbey8PXa+toYXE1InTyNADGV791ee94FuTsdJtQmtxfk26JoNlrEZbAnyuI7RM
 Tdnt072GBeEL29vP8V8lyr806zJWwdzwvcrm09fKje0OdHL52/Fkji9DdhPvGeeRQZ
 JSFgndGfwhFR5/2N8nLhm2oMnQAOUpmI5ryVtmOxxrkwIl3UfC3Gz24KpM4fDrDRV4
 EANBOVoAcG1Tg==
Date: Wed, 5 Apr 2023 22:54:06 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Dave Chinner <david@fromorbit.com>
Message-ID: <ZC38DkQVPZBuZCZN@gmail.com>
References: <20230404145319.2057051-1-aalbersh@redhat.com>
 <20230404145319.2057051-22-aalbersh@redhat.com>
 <20230404163602.GC109974@frogsfrogsfrogs>
 <20230405160221.he76fb5b45dud6du@aalbersh.remote.csb>
 <20230405163847.GG303486@frogsfrogsfrogs>
 <ZC264FSkDQidOQ4N@gmail.com>
 <20230405222646.GR3223426@dread.disaster.area>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230405222646.GR3223426@dread.disaster.area>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Apr 06, 2023 at 08:26:46AM +1000, Dave Chinner wrote:
 > > We could certainly think about moving to a design where fs/verity/ asks
 the > > filesystem to just *read* a Merkle tree block, without [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pkC1B-00GM0Z-Au
Subject: Re: [f2fs-dev] [PATCH v2 21/23] xfs: handle merkle tree block size
 != fs blocksize != PAGE_SIZE
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
Cc: fsverity@lists.linux.dev, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, agruenba@redhat.com,
 "Darrick J. Wong" <djwong@kernel.org>,
 Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, hch@infradead.org,
 cluster-devel@redhat.com, dchinner@redhat.com, rpeterso@redhat.com,
 xiang@kernel.org, jth@kernel.org, linux-erofs@lists.ozlabs.org,
 damien.lemoal@opensource.wdc.com, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Apr 06, 2023 at 08:26:46AM +1000, Dave Chinner wrote:
> > We could certainly think about moving to a design where fs/verity/ asks the
> > filesystem to just *read* a Merkle tree block, without adding it to a cache, and
> > then fs/verity/ implements the caching itself.  That would require some large
> > changes to each filesystem, though, unless we were to double-cache the Merkle
> > tree blocks which would be inefficient.
> 
> No, that's unnecessary.
> 
> All we need if for fsverity to require filesystems to pass it byte
> addressable data buffers that are externally reference counted. The
> filesystem can take a page reference before mapping the page and
> passing the kaddr to fsverity, then unmap and drop the reference
> when the merkle tree walk is done as per Andrey's new drop callout.
> 
> fsverity doesn't need to care what the buffer is made from, how it
> is cached, what it's life cycle is, etc. The caching mechanism and
> reference counting is entirely controlled by the filesystem callout
> implementations, and fsverity only needs to deal with memory buffers
> that are guaranteed to live for the entire walk of the merkle
> tree....

Sure.  Just a couple notes:

First, fs/verity/ does still need to be able to tell whether the buffer is newly
instantiated or not.

Second, fs/verity/ uses the ahash API to do the hashing.  ahash is a
scatterlist-based API.  Virtual addresses can still be used (see sg_set_buf()),
but the memory cannot be vmalloc'ed memory, since virt_to_page() needs to work.
Does XFS use vmalloc'ed memory for these buffers?

BTW, converting fs/verity/ from ahash to shash is an option; I've really never
been a fan of the scatterlist-based crypto APIs!  The disadvantage of doing
this, though, would be that it would remove support for all the hardware crypto
drivers.  That *might* actually be okay, as that approach to crypto acceleration
has mostly fallen out of favor, in favor of CPU-based acceleration.  But I do
worry about e.g. someone coming out of the woodwork and saying they need to use
fsverity on a low-powered ARM board that has a crypto accelerator like CAAM, and
they MUST use their crypto accelerator to get acceptable performance.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
