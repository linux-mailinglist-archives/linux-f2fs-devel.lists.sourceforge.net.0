Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CDB21AF6B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2020 08:28:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtmWS-0008Fk-AU; Fri, 10 Jul 2020 06:28:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jtmWR-0008Fd-5D
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 06:28:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AXK65UWmfhsrsgJJWprbtmmlh2B8aXoqpdSpj1Nov/s=; b=N3K1PjJcSpXNtdVm9Br03C6Ybv
 gNrXWJQ/DzkzHDewjh4xh5w2+6hg3rjDqYKqHtee1B2GTD1jLjE9pNXi4rTNpX6ubNR9ql0tRK6F5
 7XdQiBrXtFA1JKIybn/8PWFfCgKo7f63GwRSzwJ/aZjSeOpoFn7neWV2XLfX/gXy2WOw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AXK65UWmfhsrsgJJWprbtmmlh2B8aXoqpdSpj1Nov/s=; b=IyZorY+yYpIJmBGT8aTu1Qn/36
 jaGgoh+LHGe0eIuvuDROH3eVwFMITSSbK/4h8zQLS4Em2fr73O7XOcNs5hTipKtQhMd8vegf5gZvv
 Ek7B5ldmIoShfdwrx5/8cwKfTa9DnVWdFcnAcHAEWErPc4QqKQcepjKvLk2TdQn4Hb8M=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jtmWN-00FuKR-IM
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 06:28:34 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4561F2077D;
 Fri, 10 Jul 2020 06:28:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594362501;
 bh=r5glTjQ2tpYOHg0/Fuo52C8jYr9Q/DQLLc2qnFph3hQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=h7SUtk950AlDITQRL+yk1Eu18pZ2FDz5q7VUBHaK7lYY+0o6OJWZt2hJIHkzscbvH
 5y4waUeoeH8qBkKEG7UOXOkVCfmlIas58rMz0TiI25Mp75dLsTpyQR35H6+5c+/oHZ
 rgmNF/vUOFzLd2TRCWd9irsN0JULCkGI4gVHQu9w=
Date: Thu, 9 Jul 2020 23:28:20 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: lampahome <pahome.chen@mirlab.org>
Message-ID: <20200710062820.GA1531501@google.com>
References: <CAB3eZftzcywNU-cf7mRWqtj-74VqgzLHC32a6v_CycVcRsiu0A@mail.gmail.com>
 <20200710034114.GG545837@google.com>
 <CAB3eZfv5k7cwFzMAOda7+cgHJzatRRhwyEg-8U9yt8TZ5s0=ww@mail.gmail.com>
 <20200710042502.GJ545837@google.com>
 <CAB3eZfvgEsv_T0AC6imnmFvTw3-hE6-BOd1TPqqqP5RS9bHLQA@mail.gmail.com>
 <20200710051429.GA864598@google.com>
 <CAB3eZfsm5Z7pvD1enSioHDUys7+SekkNOscW11WDjDPWF=ngog@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAB3eZfsm5Z7pvD1enSioHDUys7+SekkNOscW11WDjDPWF=ngog@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtmWN-00FuKR-IM
Subject: Re: [f2fs-dev] possible to allocate a full segment for a direct IO
 with blocksize 2MB?
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/10, lampahome wrote:
> >
> > I think so. You can check fibmap to see the block addresses. :)
> >
> > Execuse me, I'm a new to f2fs, how to check fibmap?
> You mean f2fs-tools?

It's generic ioctl.

hdparm --fibmap [file]

Or,

fibmap.f2fs [file]

> 
> thanks


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
