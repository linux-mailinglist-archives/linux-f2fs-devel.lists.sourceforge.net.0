Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7AF1D3A32C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Jan 2026 10:38:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gXNnqQuGrpUnqGaVtYP8UqO7aefm8PlfZivHA/UgMuc=; b=mLZIPEv7gxMBisktJRYrtrnxrq
	6mneLcxg19s9jnCy3C+GzqgJzpo/4+U4oPWsipt1lqylAUtfDuhbvr03a6tt1WH7Dc3imhoo650Pf
	ommqNSMdJO/MPmhZu7q0jze5puzllwLV1qvWszSHincgEeMQqvXyZ3ET84JmBqtcFuzs=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vhlhx-0007PQ-0D;
	Mon, 19 Jan 2026 09:38:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1vhlhv-0007PD-SI
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 09:38:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MHnUxAz6kj+WD+7S/r9pqzz51F8zgw9GDfq3RDDAaQA=; b=KshQ/mPInStxWOo7PNx0m91NOT
 EK4x9ah0TLHSkytbuRSicLqbpZM2jPa7CWdxYzZR7RsA/Ef/emfvEb0AyBWzqZ2iR8w3lBF5nogrT
 s34dkKx0wTJAGN3o7uerxKZlR+oJjnk7UZSutNcgJjdLM4eE06M1t4rjqd/nijEsBKC4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MHnUxAz6kj+WD+7S/r9pqzz51F8zgw9GDfq3RDDAaQA=; b=IT6d4LotCmdQ6jut8drfG17Ixz
 pKbFn9jFW6f8Zuv1SPipbJDzAI4kWNjK91jEynTkIBc1qcessroWhvlhYIP1TIHnTIjyxLC4IxlZT
 fo9sBkZQch8fAMyqqdmhD0JaahkQPRCS+ZP5hfhsF6S4vDU2zIvY+6YCd2ZEdYtyA+WQ=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vhlhw-0000wM-0X for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Jan 2026 09:38:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5599160135;
 Mon, 19 Jan 2026 09:37:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED57CC116C6;
 Mon, 19 Jan 2026 09:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768815469;
 bh=RBf2VbnimtIf34RceomGgms6yWFk5LJNOn2qSQZujus=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SznYM39MkbNuPjE6GgyD2JDTC4+48wgplvb8cx+6psn4rh7Y1aesUKbwOwZQTFpkN
 HSPlYMd1MuzFdC8gdjQDs2O8APVXPZAi2LdWc9mBoYWJVC6OQU0MPBX1tYx4Q5ym/i
 PFjf8YRuS3iXWHT+TbxabZ5il8ocO56LvnPHDsmqncWz6/o7GG+7Quyl6uEJrgoIUs
 HypWSK9Au2tf21pmlRpqPXdqvdHU6Mz2xPl+CBSOil9rNeI1Lf7CXMEwxnljxWO7JT
 Nzs5gkzPQsHSntoMuq30y8sjPR9EOXA+qopE3oe8T504I/Owgv7GJnRqz8j67kX5R9
 UhAzhi2xIS+sQ==
Date: Mon, 19 Jan 2026 10:37:43 +0100
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260119-nordhalbkugel-filmabend-7c76091f3a7c@brauner>
References: <20260119062250.3998674-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260119062250.3998674-1-hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 19, 2026 at 07:22:41AM +0100, Christoph Hellwig
 wrote: > Hi all, > > this series has a hodge podge of fsverity enhances that
 I looked into as > part of the review of the xfs fsverity suppo [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vhlhw-0000wM-0X
Subject: Re: [f2fs-dev] fsverity optimzations and speedups
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
From: Christian Brauner via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Christian Brauner <brauner@kernel.org>
Cc: Theodore Ts'o <tytso@mit.edu>, fsverity@lists.linux.dev,
 Jan Kara <jack@suse.cz>, Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 19, 2026 at 07:22:41AM +0100, Christoph Hellwig wrote:
> Hi all,
> 
> this series has a hodge podge of fsverity enhances that I looked into as
> part of the review of the xfs fsverity support series.
> 
> The first three patches call fsverity code from VFS code instead of
> requiring a lot of boilerplate in the file systems.  The first fixes a

While I'm not super excited about that I can see that it's beneficial.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
