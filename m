Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C3E316099A3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Oct 2022 07:07:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ompgi-0007UC-9N;
	Mon, 24 Oct 2022 05:07:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mhiramat@kernel.org>) id 1ompgg-0007Ty-Mj
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Oct 2022 05:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3q0CINBNaTYL2eK/aXYDAWkD/fmxGRY1Et0RhJv0rKs=; b=QaN31guT4Cn738zcy46I8TCfsw
 HbfPS6ClkIhq64aq67DyBJn5+lkqMr5lE0zmfJfBSt4rzHulIqz86QG0ayIIKuhl7OK2YG8tNnsvK
 f0YYIi9YzYKHe0gGwzZYY7kM4W/Cps4y10b8lau2Y2OtLR1wmduY09ThRNdaKwO08r5Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3q0CINBNaTYL2eK/aXYDAWkD/fmxGRY1Et0RhJv0rKs=; b=PXLVaM0+0cBZJDOQSkG988j2rP
 Lvo+z89o1NJsAYsW6T+CT1N+DRL/pCpZFFClOBtodOYgwiJXxI3Q/zG5ep3RzSKUxYZvX9ZlQQCEF
 DMEGtLNnen8p7pSAxLjd6W79l8TrPA0VquATh8Q+mDfZtEQ+/Y1Udylbbd0x0VFBMPdw=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ompgf-00FMR6-6c for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Oct 2022 05:07:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2669C60EB4;
 Mon, 24 Oct 2022 05:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2858FC433D6;
 Mon, 24 Oct 2022 05:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1666588053;
 bh=E9gsmaix32fRhlDsYD3bZbwKOSx691rFhwaVWGAoDKc=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YF8PguP4yT5kNWPIrTp4OawuxpJcbjxagVI0d7xVBF64POMoUhm6KhkcGVvJspWUb
 qb5n71mVswsmsyU/Fbc6hUjv6pDv1NN8bfEvpfK5cDM6JwenUsHFWDxWInwfE+z/kv
 rLGHAfAIHw9Sz5EKJmKiX1eZp3Iew02h5xbd7gnZFq38XfZ5XjYlfX056oPXjQWU0Z
 mXKf/oixeU1NsyxzsPFlaOnvuDLNaJZhiqOQqXxATlXSBtgM1LoFaIM1s+k3Oaw9Ga
 7X+7F6vAUYd+6LpgoOD11uwtcNDFKwYTX0b8f2c0/IFT5547+w3nkIkjQHdAAkghii
 rTheq6xIBoKDg==
Date: Mon, 24 Oct 2022 14:07:30 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Pavan Kondeti <quic_pkondeti@quicinc.com>
Message-Id: <20221024140730.904089a5736f9fe3d6893ccc@kernel.org>
In-Reply-To: <20221021050046.GA31858@hu-pkondeti-hyd.qualcomm.com>
References: <1666196277-27014-1-git-send-email-quic_mojha@quicinc.com>
 <20221021050046.GA31858@hu-pkondeti-hyd.qualcomm.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Spam-Score: -5.7 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri,
 21 Oct 2022 10:30:46 +0530 Pavan Kondeti <quic_pkondeti@quicinc.com>
 wrote: > Hi Mukesh, > > On Wed, Oct 19, 2022 at 09:47:57PM +0530, Mukesh
 Ojha wrote: > > commit 18ae8d12991b ("f2fs: show more DIO information in
 tracepoint")
 > > introduces iocb field in 'f2fs_direct_IO_ent [...] 
 Content analysis details:   (-5.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ompgf-00FMR6-6c
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix the assign logic of iocb
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Mukesh Ojha <quic_mojha@quicinc.com>, jaegeuk@kernel.org, mhiramat@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, 21 Oct 2022 10:30:46 +0530
Pavan Kondeti <quic_pkondeti@quicinc.com> wrote:

> Hi Mukesh,
> 
> On Wed, Oct 19, 2022 at 09:47:57PM +0530, Mukesh Ojha wrote:
> > commit 18ae8d12991b ("f2fs: show more DIO information in tracepoint")
> > introduces iocb field in 'f2fs_direct_IO_enter' trace event
> > And it only assigns the pointer and later it accesses its field
> > in trace print log.
> > 
> > Fix it by correcting data type and memcpy the content of iocb.
> > 
> > Fixes: 18ae8d12991b ("f2fs: show more DIO information in tracepoint")
> > Signed-off-by: Mukesh Ojha <quic_mojha@quicinc.com>
> > ---
> >  include/trace/events/f2fs.h | 10 +++++-----
> >  1 file changed, 5 insertions(+), 5 deletions(-)
> > 
> > diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> > index c6b3724..7727ec9 100644
> > --- a/include/trace/events/f2fs.h
> > +++ b/include/trace/events/f2fs.h
> > @@ -940,7 +940,7 @@ TRACE_EVENT(f2fs_direct_IO_enter,
> >  	TP_STRUCT__entry(
> >  		__field(dev_t,	dev)
> >  		__field(ino_t,	ino)
> > -		__field(struct kiocb *,	iocb)
> > +		__field_struct(struct kiocb,	iocb)
> >  		__field(unsigned long,	len)
> >  		__field(int,	rw)
> >  	),
> > @@ -948,17 +948,17 @@ TRACE_EVENT(f2fs_direct_IO_enter,
> >  	TP_fast_assign(
> >  		__entry->dev	= inode->i_sb->s_dev;
> >  		__entry->ino	= inode->i_ino;
> > -		__entry->iocb	= iocb;
> > +		 memcpy(&__entry->iocb, iocb, sizeof(*iocb));
> >  		__entry->len	= len;
> >  		__entry->rw	= rw;
> >  	),
> >  
> 
> Why copy the whole structure (48 bytes)? cache the three members you
> need.

+1. If this only prints ki_pos, ki_flags and ki_ioprio, I recommend you
to save those 3 fields to the entry. It should not expose in-kernel
data structure because it can be changed.

Thank you,

> 
> Thanks,
> Pavan


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
