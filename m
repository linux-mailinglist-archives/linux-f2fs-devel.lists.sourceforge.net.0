Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B72EF6539E6
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Dec 2022 00:49:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p88pX-0003pH-7v;
	Wed, 21 Dec 2022 23:48:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1p88pV-0003pB-H4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 23:48:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bQLb2XHOR3/VImIsPbeZY6XNF6O9qLIo20u8RNoVleM=; b=QNUvx4gskC5h0maDufFR2SMLMH
 tHnYfnE7RF3Fv9cejrq9NTPTLNKKydYWru2zAmfAsiRlFuXgTcn7I9l1JjBKj3wjOuWOExhLwq83T
 VxglZLpwQPjcbLbpTegjOkAZuqqazvjHPD0pC/A6LEtIieMA4KsRUGD3+3wQ26BG2Izw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bQLb2XHOR3/VImIsPbeZY6XNF6O9qLIo20u8RNoVleM=; b=ScJO5m8UmQcS/LO5EcKfA+tLrp
 5y72ZyiwkeQny0w3jLevOjXskOjnxMNo1bCkl0M9KeFFc8nqtEcXA+UlcjQJxjtSva6CnsPqsmOqP
 HaaWF02D7HUHuviHYKgT1l0psGjkuDZb0QiBn2MNMe8Q3XBMKJsndfg+TlUoGSPnGjFg=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p88pQ-007I8x-4v for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Dec 2022 23:48:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 698C5CE1810;
 Wed, 21 Dec 2022 23:48:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68B06C433D2;
 Wed, 21 Dec 2022 23:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671666514;
 bh=dfwaApWQ0HHasq7Na874WL021J+XeyqZRnuKNQdoIeg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lbiOFI5ce6MhuC0e2A8vQiFx/g2qB5m5bAuRy9qk5Mm6jsrk+zWBi3jlAng6HxqRS
 tkK0WMTApgo6M0Jbg3095s4Q1pMoYgKZS/ZWlc2VENkPe/bJziiHDjmGYr3gWqg0q/
 P5+W7XUBFaQXduCjSECo0Fbaa9symmfh45iWALREkyJEsVUmBrV0KR4cgEcWC69XAU
 8kNNFUCCnqTZJM2oskc545+E3tIgEQDhY12cdfhUl6fXV7rYVW+Hdy9jUErqQrqK/S
 rcWGayoxy12exGtux3xcFCjCAkcRBWcdnXHle4L7F66IcCQHm+yINcrctCpSdkJen2
 YhHnAN0ngueAA==
Date: Wed, 21 Dec 2022 15:48:32 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org, "Theodore Y. Ts'o" <tytso@mit.edu>
Message-ID: <Y6ObULdVm2UN5kw1@sol.localdomain>
References: <Y5jRbLEJh3S46Jer@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y5jRbLEJh3S46Jer@sol.localdomain>
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue, Dec 13, 2022 at 11:24:28AM -0800, Eric Biggers wrote:
 > Currently, fsverity development is reusing the same mailing list, git repo
 > (though a different branch), and patchwork project as fscry [...] 
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p88pQ-007I8x-4v
Subject: Re: [f2fs-dev] Separate mailing list (and git and patchwork) for
 fsverity?
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
Cc: linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, Dec 13, 2022 at 11:24:28AM -0800, Eric Biggers wrote:
> Currently, fsverity development is reusing the same mailing list, git repo
> (though a different branch), and patchwork project as fscrypt --- mainly just
> because I was a little lazy and didn't bother to ask for new ones:
> 
> FSCRYPT: FILE SYSTEM LEVEL ENCRYPTION SUPPORT
> [...]
> L:      linux-fscrypt@vger.kernel.org
> Q:      https://patchwork.kernel.org/project/linux-fscrypt/list/
> T:      git git://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
> [...]
> 
> FSVERITY: READ-ONLY FILE-BASED AUTHENTICITY PROTECTION
> [...]
> L:      linux-fscrypt@vger.kernel.org
> Q:      https://patchwork.kernel.org/project/linux-fscrypt/list/
> T:      git git://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git fsverity
> [...]
> 
> I think this is causing some confusion.  It also makes it so that people can't
> subscribe to the list for just one or the other.
> 
> What would people say about having a separate mailing list, git repo, and
> patchwork project for fsverity?  So the fsverity entry would look like:
> 
> FSVERITY: READ-ONLY FILE-BASED AUTHENTICITY PROTECTION
> [...]
> L:      linux-fsverity@vger.kernel.org
> Q:      https://patchwork.kernel.org/project/linux-fsverity/list/
> T:      git git://git.kernel.org/pub/scm/fs/fsverity/fsverity.git
> [...]
> 
> For the branches in the git repo, I'm thinking of using 'for-next' and
> 'for-current'.  (I'd also update the fscrypt ones to match; currently they are
> 'master' and 'for-stable'.)
> 
> If people are okay with these changes, I'll send off the needed requests to
> helpdesk and linux-next to make these changes, and send Linus a pull request to
> update MAINTAINERS.  (And update fsverity-utils to point to the new list.)
> 

Any thoughts on this from anyone?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
