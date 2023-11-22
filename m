Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 03F077F5274
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Nov 2023 22:19:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r5ucs-0004Oy-SE;
	Wed, 22 Nov 2023 21:19:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <viro@ftp.linux.org.uk>) id 1r5ucs-0004Os-0D
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Nov 2023 21:19:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GbGgxXd0D6P3kK6eEYEOVB7NqqPtigeykui8LfkWNZM=; b=lrOEHb2P5XyXMqo6nyYSjcBwuB
 PCEHLD2IhzTukLuSftbjugTSy5ZScFjkerKhgYZhQtG9xdGGb6pvAoxbwkUPZXjaobi1WGufA4Yol
 TjayldLwDlkbG01oTrMJk5WsoUmE0pFsSzHwMtsXPqBHkuWuoH6RlrOsNowZsTdm7BlY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=GbGgxXd0D6P3kK6eEYEOVB7NqqPtigeykui8LfkWNZM=; b=IjC1IxAQ+ixcEXzVN5YJue7l04
 j17eb/EEnFouxi2UqHELOaMb+kqpRFQPv7AL2Ow+EYGLNPo99xuPeAW1sT/HZdPa75lJwKu5Lk6YR
 ZGhAmVHQaF9zY7nZXYILbpZkk11rjwD/zFu8aIwVozT5wcSZXBvqqOWKEqi93+SmFia4=;
Received: from zeniv.linux.org.uk ([62.89.141.173])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r5ucq-0000km-ER for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 22 Nov 2023 21:19:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=linux.org.uk; s=zeniv-20220401; h=Sender:In-Reply-To:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=GbGgxXd0D6P3kK6eEYEOVB7NqqPtigeykui8LfkWNZM=; b=mI/nBUzbuLRl8y71pGzGwG3AqE
 9nwjsJ2gz+NhHF9XD6iYO4i+9WjMVuzBqAY16Wd/yrssV0AaFAv02ZkujqU5S78p8rOPo/SUuyk4W
 8/nT5AO6eLxpRd56238mkk7z92XdfpSyf1N4qCYODg2gNDegCwfS36EIdJMnpzbyg7jIOIqlm60a2
 cN+L44mlhZcn4bOy1TdDvE3F2HyesD2+3TOjf/yriqIuoujbwk+Nw4r8tfbC6bs0khIm3iyEeR0VO
 hr8fiUavTzkDlQHsYuue1vVtFUt9QBG1qUpXfi8yRo5l95o54GwvPikZo1kq4tHNgUWZHJcpxjlAn
 H3hu8bYw==;
Received: from viro by zeniv.linux.org.uk with local (Exim 4.96 #2 (Red Hat
 Linux)) id 1r5ucf-001mtu-1r; Wed, 22 Nov 2023 21:19:01 +0000
Date: Wed, 22 Nov 2023 21:19:01 +0000
From: Al Viro <viro@zeniv.linux.org.uk>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20231122211901.GJ38156@ZenIV>
References: <20230816050803.15660-1-krisman@suse.de>
 <20231025-selektiert-leibarzt-5d0070d85d93@brauner>
 <655a9634.630a0220.d50d7.5063SMTPIN_ADDED_BROKEN@mx.google.com>
 <20231120-nihilismus-verehren-f2b932b799e0@brauner>
 <CAHk-=whTCWwfmSzv3uVLN286_WZ6coN-GNw=4DWja7NZzp5ytg@mail.gmail.com>
 <20231121022734.GC38156@ZenIV>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231121022734.GC38156@ZenIV>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Nov 21, 2023 at 02:27:34AM +0000, Al Viro wrote: >
 I will review that series; my impression from the previous iterations > had
 been fairly unpleasant, TBH, but I hadn't rechecked since April > or so. 
 Content analysis details:   (-0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r5ucq-0000km-ER
Subject: Re: [f2fs-dev] [PATCH v6 0/9] Support negative dentries on
 case-insensitive ext4 and f2fs
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
Cc: Gabriel Krisman Bertazi <krisman@suse.de>,
 Christian Brauner <brauner@kernel.org>, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Nov 21, 2023 at 02:27:34AM +0000, Al Viro wrote:

> I will review that series; my impression from the previous iterations
> had been fairly unpleasant, TBH, but I hadn't rechecked since April
> or so.

The serious gap, AFAICS, is the interplay with open-by-fhandle.
It's not unfixable, but we need to figure out what to do when
lookup runs into a disconnected directory alias.  d_splice_alias()
will move it in place, all right, but any state ->lookup() has
hung off the dentry that had been passed to it will be lost.

And I seriously suspect that we want to combine that state
propagation with d_splice_alias() (or its variant to be used in
such cases), rather than fixing the things up afterwards.

In particular, propagating ->d_op is really not trivial at that
point; it is safe to do to ->lookup() argument prior to d_splice_alias()
(even though that's too subtle and brittle, IMO), but after
d_splice_alias() has succeeded, the damn thing is live and can
be hit by hash lookups, revalidate, etc.

The only things that can't happen to it are ->d_delete(), ->d_prune(),
->d_iput() and ->d_init().  Everything else is fair game.

And then there's an interesting question about the interplay with
reparenting.  It's OK to return an error rather than reparent,
but we need some way to tell if we need to do so.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
