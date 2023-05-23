Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F80470DF92
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 May 2023 16:44:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q1TF0-0001Pg-AN;
	Tue, 23 May 2023 14:43:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <SRS0=q/om=BM=goodmis.org=rostedt@kernel.org>)
 id 1q1TEy-0001PL-Hx for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 May 2023 14:43:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:MIME-Version
 :References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HMdRs4EVy6NjSK7M+XtSG8loeq8D7L+FTyQAmHNRI6I=; b=Z4LS4WFtyAFylSz8HvNscbB44S
 eq9azJTmgdWqvYt3UjKU8RgJY99oTJZ2+es2uzBoJPnqx/bpseRqnFqc6nXdlVZ4WfSJslOMUGI8p
 CEcRzQSh5V4e3i8ueQOfItOY1CLiwcNFYb/3i8rKuZzaDJzdYlQTEWl+NH02Be81qnB4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HMdRs4EVy6NjSK7M+XtSG8loeq8D7L+FTyQAmHNRI6I=; b=PiWxD0aHwzTP6t51bwYV6FRsJs
 Qip9L7L6Y6L2GPOwZRAHhaZv2iI939uVZAquG4UoegVuVe65I3rxxv+p1CtmXe4/IBGmSDchZbPIC
 nBzdwL/t0IP08WslHXT0Xf1FBX97dAVkSR/10ew59NWbMAitckfUI+3HN7B7xxm9Q2Zk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q1TEy-000Yf1-Fw for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 May 2023 14:43:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4BEFA60ACF;
 Tue, 23 May 2023 14:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E08C9C433D2;
 Tue, 23 May 2023 14:43:48 +0000 (UTC)
Date: Tue, 23 May 2023 10:43:47 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20230523104347.61149ecd@rorschach.local.home>
In-Reply-To: <ZFqWr3sSYMsHtHAC@google.com>
References: <CGME20230508081042epcms2p8a637deae7de1829f54614e09d5fde5e5@epcms2p8>
 <20230508081042epcms2p8a637deae7de1829f54614e09d5fde5e5@epcms2p8>
 <ZFqWr3sSYMsHtHAC@google.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-Spam-Score: -4.8 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Tue,
 9 May 2023 11:53:35 -0700 Jaegeuk Kim <jaegeuk@kernel.org>
 wrote: > On 05/08, Daejun Park wrote: > > v5 -> v6 > > Added trace_f2fs_iostat
 support for zone reset command. > > > > v4 -> v5 > > Added f2fs iostat for
 zone reset command. > > > > v3 -> v4 > > Fixed build [...] 
 Content analysis details:   (-4.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q1TEy-000Yf1-Fw
Subject: Re: [f2fs-dev] [PATCH v6] f2fs: add async reset zone command support
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
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>,
 Seokhwan Kim <sukka.kim@samsung.com>, beomsu kim <beomsu7.kim@samsung.com>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Tue, 9 May 2023 11:53:35 -0700
Jaegeuk Kim <jaegeuk@kernel.org> wrote:

> On 05/08, Daejun Park wrote:
> > v5 -> v6
> > Added trace_f2fs_iostat support for zone reset command.
> > 
> > v4 -> v5
> > Added f2fs iostat for zone reset command.
> > 
> > v3 -> v4
> > Fixed build error caused by unused function.
> > 
> > v2 -> v3
> > Modified arguments to be correct for ftrace parameter.
> > Changed __submit_zone_reset_cmd to void return.
> > Refactored the f2fs_wait_discard_bio function.
> > Fixed code that was previously incorrectly merged.
> > 
> > v1 -> v2
> > Changed to apply the optional async reset write pointer by default.  
> 
> Don't add the history in the patch description.

Well, you can (and should) ...

> 
> > 
> > This patch enables submit reset zone command asynchornously. It helps
> > decrease average latency of write IOs in high utilization scenario by
> > faster checkpointing.
> > 
> > Signed-off-by: Daejun Park <daejun7.park@samsung.com>
> > ---

But it must go below the three dashes above. That will keep 'git am'
from adding it to the change log.

-- Steve


> >  fs/f2fs/f2fs.h              |  1 +
> >  fs/f2fs/iostat.c            |  1 +
> >  fs/f2fs/segment.c           | 84 +++++++++++++++++++++++++++++++++++--
> >  include/trace/events/f2fs.h | 24 +++++++++--
> >  4 files changed, 104 insertions(+), 6 deletions(-)
> > 
> > diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
> > index d211ee89c158..51b68a629814 100644
> > --- a/fs/f2fs/f2fs.h
> > +++ b/fs/f2fs/f2fs.h
> > @@ -1175,6 +1175,7 @@ enum iostat_type {
> >  	/* other */
> >  	FS_DISCARD_IO,			/* discard */
> >  	FS_FLUSH_IO,			/* flush */
> > +	FS_ZONE_RESET_IO,		/* zone reset */
> >  	NR_IO_TYPE,
> >  };
> >  


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
