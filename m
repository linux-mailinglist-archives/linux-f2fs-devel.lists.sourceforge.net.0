Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B77AF878D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Jul 2025 08:03:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qFekAPiRUnr0Z3zRugrBa2oZT3ZKvAcJ0GEZGzpb530=; b=jTwsT3hCnyvWWakphMJBQdG/kG
	gIHxoGlutWuVV5JLEA8Jp5kcwb8r/YfK3vENvYzyDxE+tyZArPwoLMLXMBOXHJQKxJd5g8NyVqAlo
	SMUdTYJGaXGfW4AirsUfkVGccaOBy8T1jTb4dEmcXc8CLqmFkxYmkKECYCMqpVWrxxdA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uXZWY-0001L9-Oz;
	Fri, 04 Jul 2025 06:03:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1uXZWX-0001L0-Gp
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Jul 2025 06:03:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CtD7irt4irYOnkQVxr3R0pu9WMu5KAzQSCoAhtwFKAo=; b=ZzLJPPgzQwilfY7Nq/BScL8/LW
 ebqH6VVLULxaYjH2/FkbRLvZD3CkmN7cgffGLGkWRdbUaNfw9ed/4s0GGJ2JT58EzUCbupVseFsZN
 xOFsaU/IWaD3F1RwBYj4K6wcci17rm9Q071KJLjYwUNEqTPo4u/Vbqa5x0b2MgPl8gKY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CtD7irt4irYOnkQVxr3R0pu9WMu5KAzQSCoAhtwFKAo=; b=ILJRsnNyLJMEvhazi257e8qax3
 msqadpqkW+5A7kYe1vYoVI3Hp7zbap9FmFaD3N55PwEf/YigTbjquYruMJDbM3L11rEhyHt5sgn1g
 C55hbg5eGZqYd0h/A8/1fp4Di5olT0SzrMNUJgwDp46efh+sQVIAAzVWHXLz6bX8ADzk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uXZWW-0005tL-WE for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Jul 2025 06:03:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5312861455;
 Fri,  4 Jul 2025 06:03:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AC1EEC4CEE3;
 Fri,  4 Jul 2025 06:03:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1751609023;
 bh=TOAqevWd5ctBWJ93LJwpcNQVBzN27/vAb8SLM1CQQF4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l/nBVVGIZV6R2rKe/b6EN6IwJcS5QZtZii8YIAru6zwzSiCc5t34PTnJ43d1gfTg5
 YMriRqpfzpYsgKj6fhb7GFDQx7Kmy2y3zHaF3EYHiyRsZDdEJTuwwiWbI4z4/LThG1
 STJ1IccRKGfpVCIOpRZziDMEBhogSYHzjjLkbUiajktff+Lq08EheL9jk+2lecELO5
 iTH4BWawxZjzZjU1QeBz3OqKjeEkTEY08NhKyDFaqwDE2qt7HnI57TLK7p+kx8qI9R
 S76OZLOK4S48W4dg3QHYpHp8h54m1Jb3kCaUy+5TUKQC6vTd62OrWLZsNjRRVA8uK7
 FGKwJ8KU6wG2w==
Date: Thu, 3 Jul 2025 23:02:59 -0700
To: Yuwen Chen <ywen.chen@foxmail.com>
Message-ID: <20250704060259.GB4199@sol>
References: <aGZFtmIxHDLKL6mc@infradead.org>
 <tencent_82716EB4F15F579C738C3CC3AFE62E822207@qq.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <tencent_82716EB4F15F579C738C3CC3AFE62E822207@qq.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jul 04, 2025 at 10:43:57AM +0800, Yuwen Chen wrote:
 > During path traversal, the generic_ci_match function may be called > multiple
 times. The number of memory allocations and releases > in it [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uXZWW-0005tL-WE
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: brauner@kernel.org, tytso@mit.edu, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, hch@infradead.org,
 adilger.kernel@dilger.ca, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Jul 04, 2025 at 10:43:57AM +0800, Yuwen Chen wrote:
> During path traversal, the generic_ci_match function may be called
> multiple times. The number of memory allocations and releases
> in it accounts for a relatively high proportion in the flamegraph.
> This patch significantly reduces the number of memory allocations
> in generic_ci_match through pre - allocation.
> 
> Signed-off-by: Yuwen Chen <ywen.chen@foxmail.com>
> ---
>  fs/ext4/namei.c    |  2 +-
>  fs/f2fs/dir.c      |  2 +-
>  fs/libfs.c         | 33 ++++++++++++++++++++++++++++++---
>  include/linux/fs.h |  8 +++++++-
>  4 files changed, 39 insertions(+), 6 deletions(-)
> 

The reason the allocation is needed at all is because generic_ci_match() has to
decrypt the encrypted on-disk filename from the dentry that it's matching
against.  It can't decrypt in-place, since the source buffer is in the pagecache
which must not be modified.  Hence, a separate destination buffer is needed.

Filenames have a maximum length of NAME_MAX, i.e. 255, bytes.

It would be *much* simpler to just allocate that on the stack.

And we almost can.  255 bytes is on the high end of what can be acceptable to
allocate on the stack in the kernel.  However, here it would give a lot of
benefit and would always occur close to the leaves in the call graph.  So the
size is not a barrier here, IMO.

The real problem is, once again, the legacy crypto_skcipher API, which requires
that the source/destination buffers be provided as scatterlists.  In Linux, the
kernel stack can be in the vmalloc area.  Thus, the buffers passed to
crypto_skcipher cannot be stack buffers unless the caller actually is aware of
how to turn a vmalloc'ed buffer into a scatterlist, which is hard to do.  (See
verity_ahash_update() in drivers/md/dm-verity-target.c for an example.)

Fortunately, I'm currently in the process of introducing library APIs that will
supersede these legacy crypto APIs.  They'll be simpler and faster and won't
have these silly limitations like not working on virtual addresses...  I plan to
make fscrypt use the library APIs instead of the legacy crypto API.

It will take some time to land everything, though.  We can consider this
patchset as a workaround in the mean time.  But it's sad to see the legacy
crypto API continue to cause problems and more time be wasted on these problems.

I do wonder if the "turn a vmalloc'ed buffer into a scatterlist" trick that some
code in the kernel uses is something that would be worth adopting for now in
fname_decrypt().  As I mentioned above, it's hard to do (you have to go page by
page), but it's possible.  That would allow immediately moving
generic_ci_match() to use a stack allocation, which would avoid adding all the
complexity of the preallocation that you have in this patchset.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
