Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B96B477A4CC
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 13 Aug 2023 05:09:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qV1Tv-0005td-8t;
	Sun, 13 Aug 2023 03:09:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1qV1Ts-0005tX-BU
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 13 Aug 2023 03:09:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BEzokEGDV8Z/KhPlVETBC4Xu08qiNAIU3oQjqwzGpSo=; b=DvxTKqcn61iuYHT/yjQPNs6Wv5
 484+CSHf7IWC75pyG7KoDSG/V94obkTPek64/cIcuRgTCRy869ZO6hi3uW32F5pHZlQxabaUUH3ms
 cluJd7vzq2Doe3ghR3JedOxoTje7QuT09qov7V0t24Dvp/vwan20665eVL5ZRvc9qnS0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BEzokEGDV8Z/KhPlVETBC4Xu08qiNAIU3oQjqwzGpSo=; b=dh2Tir5OVVg0DYyN3MrOY0eE1V
 syBdcsVVC5FKhpyhJcXA2ZPl67+T0yO+k9UODEzjcZylGRec9dirDv0gneG4rJQ9xPtQGMGefFLQQ
 jPTzSWnXY+zMV6iyegB1/pVNzWgpv+l2qZGOazUvCVN0Sj/CovBkbz4DADz+pY0nLOYg=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qV1Tn-0001Lo-4M for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 13 Aug 2023 03:09:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=BEzokEGDV8Z/KhPlVETBC4Xu08qiNAIU3oQjqwzGpSo=; b=CPH0By8KvU3QAQSOoC5aoHHBao
 +atYp8bN33Y1sXIIu6UxrMr4Vz9LCJeWwKGRBwRQrJwrHOGe2fyDiIs6HCFwz34qN01EP1gOHLnwv
 Y9MzZzm6MbYvg3+KumE2ROSB1CT19chq7afRjgpyHL9xLAkVYKYedLeIUPsAg4XcKnmM/z51bgRsh
 CguhIdziP4UdNH40BUq1es42KhEazO2fU7jGzyf0XihcTp/YcUhetwz1lC0Hiv180ctWe3NZtqETz
 HQXGWBBZgESQsTvufIIL3JZ35BqNhVXVOhQZQjDWUpJHkj+h0YfnIVowf2VCplRyQbAGfDaIV0Y+G
 5zvxXrEw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1qV1TO-00B6TH-Lq; Sun, 13 Aug 2023 03:08:58 +0000
Date: Sun, 13 Aug 2023 04:08:58 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Theodore Ts'o <tytso@mit.edu>
Message-ID: <ZNhJSlaLEExcoIiT@casper.infradead.org>
References: <20230812004146.30980-1-krisman@suse.de>
 <20230812004146.30980-2-krisman@suse.de>
 <20230812015915.GA971@sol.localdomain>
 <20230812230647.GB2247938@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230812230647.GB2247938@mit.edu>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Aug 12, 2023 at 07:06:47PM -0400,
 Theodore Ts'o wrote:
 > One could say that this is an insane threat model, but the syzbot team
 > thinks that this can be used to break out of a kernel lockdown [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1qV1Tn-0001Lo-4M
Subject: Re: [f2fs-dev] [PATCH v5 01/10] fs: Expose helper to check if a
 directory needs casefolding
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
Cc: Gabriel Krisman Bertazi <krisman@suse.de>, brauner@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Aug 12, 2023 at 07:06:47PM -0400, Theodore Ts'o wrote:
> One could say that this is an insane threat model, but the syzbot team
> thinks that this can be used to break out of a kernel lockdown after a
> UEFI secure boot.  Which is fine, except I don't think I've been able
> to get any company (including Google) to pay for headcount to fix
> problems like this, and the unremitting stream of these sorts of
> syzbot reports have already caused one major file system developer to
> burn out and step down.
> 
> So problems like this get fixed on my own time, and when I have some
> free time.  And if we "simplify" the code, it will inevitably cause
> more syzbot reports, which I will then have to ignore, and the syzbot
> team will write more "kernel security disaster" slide deck
> presentations to senior VP's, although I'll note this has never
> resulted in my getting any additional SWE's to help me fix the
> problem...
> 
> > So just __ext4_iget() needs to be fixed.  I think we should consider doing that
> > before further entrenching all the extra ->s_encoding checks.
> 
> If we can get an upstream kernel consensus that syzbot reports caused
> by writing to a mounted file system aren't important, and we can
> publish this somewhere where hopefully the syzbot team will pay
> attention to it, sure...

What the syzbot team don't seem to understand is that more bug reports
aren't better.  I used to investigate one most days, but the onslaught is
relentless and I just ignore syzbot reports now.  I appreciate maintainers
don't necessarily get that privilege.

They seem motivated to find new and exciting ways to break the kernel
without realising that they're sapping the will to work on the bugs that
we already have.

Hm.  Maybe this is a topic for kernel-summit?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
