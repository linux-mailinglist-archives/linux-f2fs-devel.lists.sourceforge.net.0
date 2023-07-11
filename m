Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 472B274E3CC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Jul 2023 03:58:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qJ2du-0005s3-El;
	Tue, 11 Jul 2023 01:58:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1qJ2dt-0005rP-0F
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Jul 2023 01:58:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x5ftIMhpt3reUAkGZ+yGJgT5N78eh3LETM/wm8wOlM0=; b=dK/FVH9yW/S+9C3YRMD9DxmSBR
 Zsn/AmfWEZojU5dHzCzfa0mVMgmZmDMbOGceMuNsDS4V2UymMoBcsMUBsrlXk8ipeaR2ep4QegZEB
 YFwNM6UhBqnUrHtsW7gvkNxqt2khqHiG/Mi9VA/bKdFI810NDJWOZYuoz4jsx2n5WfQg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x5ftIMhpt3reUAkGZ+yGJgT5N78eh3LETM/wm8wOlM0=; b=c26stPngahOfVgME4oOslrc/mU
 oBvdgkf08+/up+4iC/sBxKB1usJACrYjXilnRBROaokrbiJgpErYDWzACQqSDjeGezz55XfRh5Sen
 U0P/v5b+s0zOFf9rb8rxuhNJiZBHJDIMn/nnB4p/ou56TTS1VVO9fh6DoWNYcA8uQwmo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qJ2dv-0000g5-AP for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Jul 2023 01:58:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CB44C612B9;
 Tue, 11 Jul 2023 01:58:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF2ADC433C8;
 Tue, 11 Jul 2023 01:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689040691;
 bh=5NFSp/Ms8MiLdis39kMTeTKdirOZ67rP66yVZppz8bY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Oopqct5uK2y1SEE/uat6lKmyr5e+bCqvqQO1VmUsaGnoEm5oYfe8+xJgiMeHNn1eQ
 nB7PjcEtqeGxySR9AgM0ZoBF7gjJhCKTxmEfbVLxh92SWGi3RZ6pPqO/izAGuJ5KCr
 A4qJ0YD+1nEIl5j30PdEafC8q8BbvBe/kQzXj+X/MQLWGIr6q8xS0bubDDFjTyh/+X
 vRB7u4G/31EJtu24CysP+t/LGSRd6jR/0awyl512zkk7lJxUHE8GXB4ks8lW99dmuB
 nZdQDVCIUGQtoRcQZQPl8V/ABmB5V7zf20IrmU7E/GQAIYC7Pf0s0yLFsWSqyjcA+S
 s3tDfj4u+/X7Q==
Date: Mon, 10 Jul 2023 18:58:09 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Message-ID: <ZKy3MQ4zRlvLwE1D@google.com>
References: <20230628150243.17771-1-andriy.shevchenko@linux.intel.com>
 <20230710184353.09640aee@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230710184353.09640aee@gandalf.local.home>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 07/10, Steven Rostedt wrote: > On Wed,
 28 Jun 2023 18:02:43
 +0300 > Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote: > > >
 Since strreplace() returns the pointer to the string itself, > > [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qJ2dv-0000g5-AP
Subject: Re: [f2fs-dev] [PATCH v1 1/1] f2fs: Use return value of strreplace()
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
 Masami Hiramatsu <mhiramat@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-trace-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/10, Steven Rostedt wrote:
> On Wed, 28 Jun 2023 18:02:43 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> > Since strreplace() returns the pointer to the string itself,
> > we may use it directly in the code.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  include/trace/events/f2fs.h | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> > 
> > diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
> > index 793f82cc1515..f5994515290c 100644
> > --- a/include/trace/events/f2fs.h
> > +++ b/include/trace/events/f2fs.h
> > @@ -2234,13 +2234,11 @@ DECLARE_EVENT_CLASS(f2fs__rw_start,
> >  		 * because this screws up the tooling that parses
> >  		 * the traces.
> >  		 */
> > -		__assign_str(pathbuf, pathname);
> > -		(void)strreplace(__get_str(pathbuf), ' ', '_');
> > +		__assign_str(pathbuf, strreplace(pathname, ' ', '_'));
> 
> But this modifies the pathname that is passed into the trace event, which
> is something that a trace point should never do! In fact, the char
> *pathname, really should be a const char * (for which this would fail to
> build).
> 
> Note, I went to look for these events and I can not find where they are
> used. Should these events just be deleted?

Hmm, this was a part of upstream effort to replace the previous android_fs
tracepoints like:
https://android-review.git.corp.google.com/c/platform/system/extras/+/2223339

> 
> -- Steve
> 
> 
> >  		__entry->offset = offset;
> >  		__entry->bytes = bytes;
> >  		__entry->i_size = i_size_read(inode);
> > -		__assign_str(cmdline, command);
> > -		(void)strreplace(__get_str(cmdline), ' ', '_');
> > +		__assign_str(cmdline, strreplace(command, ' ', '_'));
> >  		__entry->pid = pid;
> >  		__entry->ino = inode->i_ino;
> >  	),


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
