Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BAFACCC05F4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Dec 2025 01:50:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=885Lliszmn4Y9UC/M5ZvnOm082FusWu7c++MHCIgJPQ=; b=M0UcbsgzuHjlcz1Ach5viOMosK
	JK4gwF1+G3ZKXOSbWXlRWyDh8jf1jHFxOwYPtLsodlzn/faJE801hF/8Bg//AJbRReMsJ8O//Wkq/
	9JWPk8JC0gSAeGKUjwC6sB8JImO8c62aoPzAqg8IrTEAlKDPlDh9q7DrppLFw8Ufigpw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vVJGd-0001gZ-1y;
	Tue, 16 Dec 2025 00:50:19 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vVJGb-0001gR-9h
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Dec 2025 00:50:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZrD9vGHdnuSBWJqvOyB1I5saNpwrIQs4pjkB3J/WLL0=; b=aP1jVJjghf5awA14hIQ+Ew7o3r
 kpme9IkmAdUVuQX/DI5kfEhx+bXVU8fi8HgAd6Axl75JB6agQClz8TZHup0ajR1P+ofyXcJBOblvf
 EhQKitIMHf191/cGplrWWgQm07ip/clWhCdqzxW2pG6R1Y31m2RoG4FFtpHpdnIBTIkA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZrD9vGHdnuSBWJqvOyB1I5saNpwrIQs4pjkB3J/WLL0=; b=GXGxDFLk9GbpQHQ6bovQGqkufG
 pTKdjbouyzYUGDvXnmu2VidzJlMW+8hks6bi0wa0rNk4zEcZXhkLIPilB3HjRi1yo9T6+pDsHVuiQ
 oa1xB0KvKtExT5t/ctTT2/Et0a93/LniWv8nkgvw23UJ8fx+0kjL9pMutZqNv36CAQOw=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vVJGa-0006TV-Ol for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Dec 2025 00:50:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6449F40629
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Dec 2025 00:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E63C4CEF5;
 Tue, 16 Dec 2025 00:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765846206;
 bh=i3fF8IfHjXbVX6x6r3oJMzyv2Oi/m6BgIm6upInTDg0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KAvSf43n8t0dCQFVQH/zLRFMppw++dpObyl2sj8kF4EHnGivPC/Dva2Hae6FoH4Zy
 4EHDnEzUymwCkXqhQVYmaS2Fi2w1PpfreK+aK98I1vBiU9VJICoPn8xkaeLI4ekYnJ
 yXa6kjLfO+EFvTM2E6il4lsvm1ftQCSk6RVV9saEvvSbsCa0mydqchu17f7dP7LEcv
 65R7ahkF2s2I/X1jxQux4MkiBacmwtiJa9YTZyMRzc/mZoYSXFVLk7wdRu+7DNTYBl
 Rur+70P/SSCb3L3FUO1OCaFYaYkXBuLh81p4Fox+4n7skIZ3/jE7nXpQwVDDH5ohpI
 PTCALveJRtXrg==
Date: Tue, 16 Dec 2025 00:50:04 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <aUCsvFUE0vF5ziX9@google.com>
References: <20251212005545.3912333-1-jaegeuk@kernel.org>
 <1a169058-245a-4ce7-8f95-83dc96fd90c2@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1a169058-245a-4ce7-8f95-83dc96fd90c2@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/15, Chao Yu wrote: > On 12/12/25 08:55, Jaegeuk Kim
 via Linux-f2fs-devel wrote: > > Signed-off-by: Jaegeuk Kim
 <jaegeuk@kernel.org>
 > > --- > > tools/f2fs_io/f2fs_io.c | 16 ++++++++++++++++ > > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vVJGa-0006TV-Ol
Subject: Re: [f2fs-dev] [PATCH 1/2] f2fs_io: add mlock() option in the read
 test
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 12/15, Chao Yu wrote:
> On 12/12/25 08:55, Jaegeuk Kim via Linux-f2fs-devel wrote:
> > Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> > ---
> >  tools/f2fs_io/f2fs_io.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> > 
> > diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> > index 4429e0b0459c..08f3c9b79cdf 100644
> > --- a/tools/f2fs_io/f2fs_io.c
> > +++ b/tools/f2fs_io/f2fs_io.c
> > @@ -938,6 +938,7 @@ static void do_write_advice(int argc, char **argv, const struct cmd_desc *cmd)
> >  "  dontcache: buffered IO + dontcache\n"		\
> >  "  dio      : direct IO\n"				\
> >  "  mmap     : mmap IO\n"				\
> > +"  mlock    : mmap + mlock\n"				\
> >  "  madvise  : mmap + mlock2 + madvise\n"		\
> >  "  fadvise  : mmap + fadvise + mlock\n"			\
> >  "advice can be\n"					\
> > @@ -956,6 +957,7 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
> >  	u64 mlock_time_start = 0, mlock_time_end = 0;
> >  	int flags = 0;
> >  	int do_mmap = 0;
> > +	int do_mlock = 0;
> >  	int do_fadvise = 0;
> >  	int do_madvise = 0;
> >  	int do_dontcache = 0;
> > @@ -981,6 +983,8 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
> >  		flags |= O_DIRECT;
> >  	else if (!strcmp(argv[4], "mmap"))
> >  		do_mmap = 1;
> > +	else if (!strcmp(argv[4], "mlock"))
> > +		do_mlock = 1;
> >  	else if (!strcmp(argv[4], "madvise"))
> >  		do_madvise = 1;
> >  	else if (!strcmp(argv[4], "fadvise"))
> > @@ -1027,6 +1031,18 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
> >  		mlock_time_end = get_current_us();
> >  		read_cnt = count * buf_size;
> >  		memcpy(print_buf, data, print_bytes);
> > +	} else if (do_mlock) {
> > +		data = mmap(NULL, count * buf_size, PROT_READ,
> > +				MAP_SHARED, fd, offset);
> > +		if (data == MAP_FAILED)
> > +			die("Mmap failed");
> > +
> > +		io_time_start = get_current_us();
> 
> mlock_time_start = get_current_us();

This is when IO happens, so IO.

> 
> > +		if (mlock(data, count * buf_size))
> > +			die_errno("mlock failed");
> > +		io_time_end = get_current_us();
> 
> mlock_time_end = get_current_us();
> 
> Thanks,
> 
> > +		read_cnt = count * buf_size;
> > +		memcpy(print_buf, data, print_bytes);
> >  	} else if (do_madvise) {
> >  		data = mmap(NULL, count * buf_size, PROT_READ,
> >  				MAP_SHARED, fd, offset);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
