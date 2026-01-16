Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A592D2B6F4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Jan 2026 05:33:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x2WEF8ikE9P7f3/b9DR0d+Tzrc5byQK0sQIoGSiklvc=; b=ZW5Woqh3Tp4jEQ8usYnOFI/NZn
	u7g532VgZIrhU8GHwos2wArozgy//RL21uwlJ7d2qz2dXCVcbk68UygIzhfrjLEm0GdQOY3iz45u3
	WRgPZY/RVKb6w0SUPYu+EVVe5htPRBJiG/HPThlmmcuHN1MkL4o8Ph7AUpCU7/pCRaAA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vgbWs-0005XR-4f;
	Fri, 16 Jan 2026 04:33:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vgbWr-0005XK-3G
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 04:33:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FhZ/+qiSExPF0QNMfs6W15HcwaYUEuzG9NYE8gPVH08=; b=DfNLp8pBlLH/drShnLMH+az03u
 LVPuA4g8KPJgOkxtNKDjIXYfIu1akjN8KT1ij2eu3DMhed1Pk4jbuWIgzlp3G3kw7JAOSGjbLc4Sz
 kfpEUfL9GnH2iAB1JaHfrptrFRz/3+H+CtDlpn3lFh3hNxozJXGCh/dPartaUAulD6wY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FhZ/+qiSExPF0QNMfs6W15HcwaYUEuzG9NYE8gPVH08=; b=SZ6d/ifkwVSaZdwR6YifDvfoYy
 yYN+PkvLJi+98wDRoPbL628C7PmjdDKz/Fm+zMw+vzNSuChTNldlc86cuyCVjgqvxyczij2Ts5mGQ
 UuWFevWNMuKz/We4xGQYK+hhLcc8A5Ngi3c7dE7bcXHyJAjbX0vDxalbBFc6Tb09MzCg=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vgbWq-0003s5-GC for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Jan 2026 04:33:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BB2C160167;
 Fri, 16 Jan 2026 04:33:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3893DC16AAE;
 Fri, 16 Jan 2026 04:33:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1768538013;
 bh=8LRNBKrqbjTSHDGZsehazJKOM9y/E1l7Q8EziGaQHuM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ak9HsTWEUniypXNLg8ldodSz5anRVkUzf9ddXo2FrI9/WP9EHX/YO0NtFwe//tz6z
 3S4wsRSpzOtYDjCm4QKXXUAKQUhq6m36wydkStflcYRLD83qtgTkiR6W7bMWTCqqN1
 0FFLR9+guqe1ryBe90ML3dQoyLdi0SvSqmbpYEJYvfFtLlHIr6D29fu7TE5RDPsPkc
 kPHGyu4GdjIkhFAAxqpj2MKcf9ZeZN7B7yJKaVOWVEIK3PfiZtdrSraMpIOASR36Mx
 HuRcIaKrfoYsZZTe7WSd0O1ATk/6GzS8luWGiNJmAXpqiX+x6rJEDL+A84ACcHEb9y
 Hys9tU5SL3i8w==
Date: Fri, 16 Jan 2026 04:33:31 +0000
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <aWm_m0AsbUXcRB6l@google.com>
References: <20260111100941.119765-1-nzzhao@126.com>
 <20260111100941.119765-2-nzzhao@126.com>
 <aWaPzQ8JXNBdzb4U@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aWaPzQ8JXNBdzb4U@casper.infradead.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 01/13, Matthew Wilcox wrote: > On Sun, Jan 11, 2026 at
 06:09:40PM +0800, Nanzhe Zhao wrote: > > @@ -2545,6 +2548,11 @@ static int
 f2fs_read_data_large_folio(struct inode *inode, > > } > > trace_f2f [...]
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vgbWq-0003s5-GC
Subject: Re: [f2fs-dev] [PATCH v2 1/2] f2fs: add 'folio_in_bio' to handle
 readahead folios with no BIO submission
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Nanzhe Zhao <nzzhao@126.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 01/13, Matthew Wilcox wrote:
> On Sun, Jan 11, 2026 at 06:09:40PM +0800, Nanzhe Zhao wrote:
> > @@ -2545,6 +2548,11 @@ static int f2fs_read_data_large_folio(struct inode *inode,
> >  	}
> >  	trace_f2fs_read_folio(folio, DATA);
> >  	if (rac) {
> > +		if (!folio_in_bio) {
> > +			if (!ret)
> > +				folio_mark_uptodate(folio);
> > +			folio_unlock(folio);
> 
> 		folio_end_read(folio, ret == 0);

Thanks.

https://lore.kernel.org/linux-f2fs-devel/20260116043203.2313943-1-jaegeuk@kernel.org/T/#u

> 
> surely?


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
