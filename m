Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 220B3CC4FCD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Dec 2025 20:13:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eth6F00Nk8Id7z7PsDV3FWkQ09vIJ/sZdqno97RFw6s=; b=iD46OoNr2lcQ33DAQFDovXzTyb
	nPA6CBQ/LvAwBbphcehqPJYlK3FWV/i2dgGKzyZJXL2o7DsSy3YOMmvtVgW9lBZsdin2XfeXBlHfd
	Kd5ou/EWeMRYGnXHEP4k7G11GMufm3I3SPjdUtqq0yVXQesiDyw1VQPXHirBr0hy1M+E=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vVaTy-0006gM-Gb;
	Tue, 16 Dec 2025 19:13:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vVaTx-0006gG-6J
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Dec 2025 19:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6M4zPN3h5zPc1iTO7us1uiKi33JV/kFcaftDMBAOGgw=; b=ETP9JokZMHcmGQMAvZW6Nz25Zf
 e3QejL2evtX9KC4sMdYz4nj8CP4Tt7Egf/199EFnuhrYU+g2SQHdhC94lpEYMeZOy1RHD1zdl9LXt
 7FqdieR7pgFgLdMSQbnypUhQD3MPvQXbSF7prE7QJvZPh1BB/3+t/Ki+kRNuYtDGBpFo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6M4zPN3h5zPc1iTO7us1uiKi33JV/kFcaftDMBAOGgw=; b=hjGaBl5nytnuTPyhy0I6OSuQsv
 Cj48EjoN+/9bw6R/Yt6Zqu2j35b8zZFyDhvJOy1Lwx+6KI3NE82e9ks5lUC0dQdbXh7+gCkfIhIb5
 gQ9pUTmhwufKled2YaTRiIjuzmsww31PuP5IL+aVo67sOnHXqBStPzrvR0/6nPdXnG2Y=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vVaTw-0004HL-Gy for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 16 Dec 2025 19:13:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BD6F16017E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 16 Dec 2025 19:13:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A313C4CEF1;
 Tue, 16 Dec 2025 19:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1765912381;
 bh=Qau7M53pmNmEXu0xqiyuzfQy8q2XezjjuBu4vrK8Th0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O2ww1awBxWOjEbVHtXXgR09XOwUDHC7lRl/Ro3NAHAwd0fIavKTvaE+DqaPFFL8Tg
 XuVFBT882LBPJRmB69SLKyL5djk6vqHDbsR9N1xFEfuMNYAzfK8hzbyc/yEp5iwoDX
 wKZRU/pp2MmtagAGLgOGRscO2FdyYg2NNMyJlZv6WrpMYB8M/4/yXKRZyAFrPUumJs
 cBYvb7wxU15h7e+X0PBXRQm0Ibd9sOcQwPdBR34xblgGv4pi7+z6D+da/4ISQ2keBC
 tgvWTIA+cF3W8510fmLU1QGxOY/VWLkUeuBZXl0TeBDN3Hh3l5OcbztZSJNgwyNpfy
 l8SKQdqdRNGGA==
Date: Tue, 16 Dec 2025 19:12:59 +0000
To: Chao Yu <chao@kernel.org>
Message-ID: <aUGvOz97LL811CPn@google.com>
References: <20251212005545.3912333-1-jaegeuk@kernel.org>
 <1a169058-245a-4ce7-8f95-83dc96fd90c2@kernel.org>
 <aUCsvFUE0vF5ziX9@google.com>
 <81f16443-c980-4834-b5ef-4f4c4a7f9f3e@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <81f16443-c980-4834-b5ef-4f4c4a7f9f3e@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/16, Chao Yu wrote: > On 12/16/25 08:50, Jaegeuk Kim
 wrote: > > On 12/15, Chao Yu wrote: > >> On 12/12/25 08:55, Jaegeuk Kim via
 Linux-f2fs-devel wrote: > >>> Signed-off-by: Jaegeuk Kim <jaegeuk@ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vVaTw-0004HL-Gy
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

On 12/16, Chao Yu wrote:
> On 12/16/25 08:50, Jaegeuk Kim wrote:
> > On 12/15, Chao Yu wrote:
> >> On 12/12/25 08:55, Jaegeuk Kim via Linux-f2fs-devel wrote:
> >>> Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
> >>> ---
> >>>  tools/f2fs_io/f2fs_io.c | 16 ++++++++++++++++
> >>>  1 file changed, 16 insertions(+)
> >>>
> >>> diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
> >>> index 4429e0b0459c..08f3c9b79cdf 100644
> >>> --- a/tools/f2fs_io/f2fs_io.c
> >>> +++ b/tools/f2fs_io/f2fs_io.c
> >>> @@ -938,6 +938,7 @@ static void do_write_advice(int argc, char **argv, const struct cmd_desc *cmd)
> >>>  "  dontcache: buffered IO + dontcache\n"		\
> >>>  "  dio      : direct IO\n"				\
> >>>  "  mmap     : mmap IO\n"				\
> >>> +"  mlock    : mmap + mlock\n"				\
> >>>  "  madvise  : mmap + mlock2 + madvise\n"		\
> >>>  "  fadvise  : mmap + fadvise + mlock\n"			\
> >>>  "advice can be\n"					\
> >>> @@ -956,6 +957,7 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
> >>>  	u64 mlock_time_start = 0, mlock_time_end = 0;
> >>>  	int flags = 0;
> >>>  	int do_mmap = 0;
> >>> +	int do_mlock = 0;
> >>>  	int do_fadvise = 0;
> >>>  	int do_madvise = 0;
> >>>  	int do_dontcache = 0;
> >>> @@ -981,6 +983,8 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
> >>>  		flags |= O_DIRECT;
> >>>  	else if (!strcmp(argv[4], "mmap"))
> >>>  		do_mmap = 1;
> >>> +	else if (!strcmp(argv[4], "mlock"))
> >>> +		do_mlock = 1;
> >>>  	else if (!strcmp(argv[4], "madvise"))
> >>>  		do_madvise = 1;
> >>>  	else if (!strcmp(argv[4], "fadvise"))
> >>> @@ -1027,6 +1031,18 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
> >>>  		mlock_time_end = get_current_us();
> >>>  		read_cnt = count * buf_size;
> >>>  		memcpy(print_buf, data, print_bytes);
> >>> +	} else if (do_mlock) {
> >>> +		data = mmap(NULL, count * buf_size, PROT_READ,
> >>> +				MAP_SHARED, fd, offset);
> >>> +		if (data == MAP_FAILED)
> >>> +			die("Mmap failed");
> >>> +
> >>> +		io_time_start = get_current_us();
> >>
> >> mlock_time_start = get_current_us();
> > 
> > This is when IO happens, so IO.
> 
> Okay, but it seems later we will print "mlock time = 0" which doesn't match the code?

It may be okay to show the same time on IO and mlock?

> 
> Thanks,
> 
> > 
> >>
> >>> +		if (mlock(data, count * buf_size))
> >>> +			die_errno("mlock failed");
> >>> +		io_time_end = get_current_us();
> >>
> >> mlock_time_end = get_current_us();
> >>
> >> Thanks,
> >>
> >>> +		read_cnt = count * buf_size;
> >>> +		memcpy(print_buf, data, print_bytes);
> >>>  	} else if (do_madvise) {
> >>>  		data = mmap(NULL, count * buf_size, PROT_READ,
> >>>  				MAP_SHARED, fd, offset);


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
