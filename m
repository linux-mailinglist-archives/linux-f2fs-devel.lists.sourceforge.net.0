Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1136A50BD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Feb 2023 02:30:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pWopS-0003qc-PY;
	Tue, 28 Feb 2023 01:30:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1pWopR-0003qW-Sh
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Feb 2023 01:30:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H20lhBwnpDIs8FVkfXg23QMJHlzfwM7VoI+KlPU7mQo=; b=I1nWFMNrJJzRudW48q46T86vzh
 jCusKPjB8YH1bIWyg0OR8YY735j55yGBYZfAbRtG2FtHBjAoz9H8lkqUDfBibSEOp0yYPI+4+Pv6e
 mgQ2DfD5QquA+tYNz4wkYkuNlw33id9G9C7wEGHE+sLR0L/JyH42rZ973jwM96g/37Pg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H20lhBwnpDIs8FVkfXg23QMJHlzfwM7VoI+KlPU7mQo=; b=ChdWRrruhFHWRgvfzDjgcBshNs
 WDbUEe6BsxOX8BOUKXuTMdnniTnwQL5BE9c776MFOEZ91aQe8D23Oo7XYq9jBXCiomse9Yck/D6i3
 L/tAZjuXpePfU3AXLb9rPaZe/lYfx8imdz+RU8yxcc8stfQU1kKIzR1tNVCBCRhmRo+o=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pWopL-0006LH-Q9 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Feb 2023 01:30:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 48EA7B80DDB;
 Tue, 28 Feb 2023 01:30:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDDCCC433EF;
 Tue, 28 Feb 2023 01:30:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677547840;
 bh=6EQygXN8kukb7xm8ElTC1sWTx2fOUPnzwfRnnHir0SI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X5G2bH9NLF+y6DAWm3C4skJJzRgvigSXnX2FpEPoftZkh4Js4TJhQz39F0yfuBc4+
 wGYJfgnaQn8OApX8WXE/A6K8i+AGLRrm02Bb974d0Gie8HBYP6K5kVgAcESKSGoK4b
 VMD2nG9gLw8XmVoBgmBGuNo2fgQUM4ahH7KLi/1vzO5/s9G7I++hxYqixvJqJwCe3k
 R5WzZB6PDMETiydk3l4+LebgKGAg0irUwXQbDy5gnZ0eJNydQYu++C0S6uXcWm4/Zz
 sO2RyTarFPwlvvZVqsQ32RCohoZPZZ5cmrjyynzZYyzdWRV40lvgGyTBJuAvesw34a
 8vNGxrE3bAgvA==
Date: Tue, 28 Feb 2023 01:30:39 +0000
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <Y/1ZP9pc1Zw9xh/L@gmail.com>
References: <20221223203638.41293-1-ebiggers@kernel.org>
 <167754611492.27916.393758892204411776.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <167754611492.27916.393758892204411776.git-patchwork-notify@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Feb 28, 2023 at 01:01:54AM +0000,
 patchwork-bot+f2fs@kernel.org
 wrote: > Hello: > > This series was applied to jaegeuk/f2fs.git (dev) > by
 Eric Biggers <ebiggers@google.com>: > > On Fri, 23 De [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pWopL-0006LH-Q9
Subject: Re: [f2fs-dev] [PATCH v2 00/11] fsverity: support for non-4K pages
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
Cc: patchwork-bot+f2fs@kernel.org, aalbersh@redhat.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Feb 28, 2023 at 01:01:54AM +0000, patchwork-bot+f2fs@kernel.org wrote:
> Hello:
> 
> This series was applied to jaegeuk/f2fs.git (dev)
> by Eric Biggers <ebiggers@google.com>:
> 
> On Fri, 23 Dec 2022 12:36:27 -0800 you wrote:
> > [This patchset applies to mainline + some fsverity cleanups I sent out
> >  recently.  You can get everything from tag "fsverity-non4k-v2" of
> >  https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git ]
> > 
> > Currently, filesystems (ext4, f2fs, and btrfs) only support fsverity
> > when the Merkle tree block size, filesystem block size, and page size
> > are all the same.  In practice that means 4K, since increasing the page
> > size, e.g. to 16K, forces the Merkle tree block size and filesystem
> > block size to be increased accordingly.  That can be impractical; for
> > one, users want the same file signatures to work on all systems.
> > 
> > [...]
> 
> Here is the summary with links:
>   - [f2fs-dev,v2,01/11] fsverity: use unsigned long for level_start
>     https://git.kernel.org/jaegeuk/f2fs/c/284d5db5f99e
>   - [f2fs-dev,v2,02/11] fsverity: simplify Merkle tree readahead size calculation
>     https://git.kernel.org/jaegeuk/f2fs/c/9098f36b739d
>   - [f2fs-dev,v2,03/11] fsverity: store log2(digest_size) precomputed
>     https://git.kernel.org/jaegeuk/f2fs/c/579a12f78d88
>   - [f2fs-dev,v2,04/11] fsverity: use EFBIG for file too large to enable verity
>     https://git.kernel.org/jaegeuk/f2fs/c/55eed69cc8fd
>   - [f2fs-dev,v2,05/11] fsverity: replace fsverity_hash_page() with fsverity_hash_block()
>     https://git.kernel.org/jaegeuk/f2fs/c/f45555bf23cf
>   - [f2fs-dev,v2,06/11] fsverity: support verification with tree block size < PAGE_SIZE
>     https://git.kernel.org/jaegeuk/f2fs/c/5306892a50bf
>   - [f2fs-dev,v2,07/11] fsverity: support enabling with tree block size < PAGE_SIZE
>     https://git.kernel.org/jaegeuk/f2fs/c/56124d6c87fd
>   - [f2fs-dev,v2,08/11] ext4: simplify ext4_readpage_limit()
>     https://git.kernel.org/jaegeuk/f2fs/c/5e122148a3d5
>   - [f2fs-dev,v2,09/11] f2fs: simplify f2fs_readpage_limit()
>     https://git.kernel.org/jaegeuk/f2fs/c/feb0576a361a
>   - [f2fs-dev,v2,10/11] fs/buffer.c: support fsverity in block_read_full_folio()
>     https://git.kernel.org/jaegeuk/f2fs/c/4fa512ce7051
>   - [f2fs-dev,v2,11/11] ext4: allow verity with fs block size < PAGE_SIZE
>     https://git.kernel.org/jaegeuk/f2fs/c/db85d14dc5c5
> 
> You are awesome, thank you!
> -- 
> Deet-doot-dot, I am a bot.
> https://korg.docs.kernel.org/patchwork/pwbot.html
> 

These commits reached the f2fs tree through mainline, not through being applied
to the f2fs tree.  So this email shouldn't have been sent.  Jaegeuk, can you
look into fixing the configuration of the f2fs patchwork bot to prevent this?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
