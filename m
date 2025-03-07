Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCD5A574CB
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 Mar 2025 23:14:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tqfx7-0001eP-BK;
	Fri, 07 Mar 2025 22:13:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1tqfwp-0001e0-Nm
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Mar 2025 22:13:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Svzuvlpo0h0p7BuFiPXz7W2Os4v1+OTLg5Dda9Ae7sg=; b=NWTQ1N3R0WoxXnmXj9gKNq0lCZ
 CCdCu+HMePxHRSlCzLjBcb7OpmJcG2gDdCs+WgVBA84qzVwUfAR9u/eqOGOrljcpqVrl4wUtX1nb3
 Am6qI9Y4//YnAR2o2PAGuTata96xEzEBEKJufebFhdFqvP/87D15TdbPh7Auex+GryQU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Svzuvlpo0h0p7BuFiPXz7W2Os4v1+OTLg5Dda9Ae7sg=; b=IKMNkzwRiiKrxj6iKdoO5LQKhH
 dmQSXUsrv/ZBUwqGvEtArd615iKa1KVlzT7fIzt0LSLafN1z9T9p3ShmGu3edY6I3ygUIGp/ZMOwS
 ZGEzAgQ7qzJfqYs5nKTN9UntTBgJodZ5QYH8TdZ1ODxR3BohRINHSichdsjPnjUl786M=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tqfwi-0003OY-U6 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 07 Mar 2025 22:13:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B8B0D5C6465;
 Fri,  7 Mar 2025 22:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3532C4CED1;
 Fri,  7 Mar 2025 22:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741385602;
 bh=KwMRxmpn3XtE8ZpVcpFAihi8HdPo5E6ucnQWdOKO/SQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p60q3+O1Bw45+FzqN10htD1erTlhZIhwNiQ4LbvxJzzVssT1awvJriLLX0KH64z7Q
 6P1TVdWx9jOIkasX98/opa7pquMAiS5N8sidDnShnkCHvx0Yb8cNi018IZNVjGMfrH
 iqY8trVUTALAbw7+gv8NJchd4S3gkhWZ0CYdAnRNvqId8DkVIUSUyRACm0PkiLQhil
 NGT5EAr0Kyk0vDh6t4OFTYdB6lCoLAXxD6gCMDCSFeDx5jOqvCXlyMC2UF6kgGnBWc
 GGk8LND4rrpBmlOisEpBzeRvvGOq5XIxKPwP091lA2OIpP1ThnMrb7sDss6Uto83p4
 P6tiT7Ni5X8LA==
Date: Fri, 7 Mar 2025 22:13:20 +0000
To: Matthew Wilcox <willy@infradead.org>
Message-ID: <Z8tvgKBYOKfYoVku@google.com>
References: <20250307182151.3397003-1-willy@infradead.org>
 <Z8tZnN-CAS20Dpi7@google.com>
 <Z8tbrL1OKN8pqhNe@casper.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Z8tbrL1OKN8pqhNe@casper.infradead.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 03/07, Matthew Wilcox wrote: > On Fri, Mar 07, 2025 at
 08:39:56PM +0000, Jaegeuk Kim wrote: > > On 03/07, Matthew Wilcox (Oracle)
 wrote: > > > I was planning on sending this next cycle, but maybe t [...]
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tqfwi-0003OY-U6
Subject: Re: [f2fs-dev] [PATCH 0/4] f2fs: Remove uses of writepage
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
Cc: linux-fsdevel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 03/07, Matthew Wilcox wrote:
> On Fri, Mar 07, 2025 at 08:39:56PM +0000, Jaegeuk Kim wrote:
> > On 03/07, Matthew Wilcox (Oracle) wrote:
> > > I was planning on sending this next cycle, but maybe there's time to
> > > squeeze these patches into the upcoming merge window?
> > > 
> > > f2fs already implements writepages and migrate_folio for all three
> > > address_space_operations, so either ->writepage will never be called (by
> > > migration) or it will only be harmful (if called from pageout()).
> > 
> > My tree sitting on [1] doesn't have mm-next, which looks difficult to test this
> > series for test alone. Matthew, can you point which patches I need to apply
> > in mm along with this for test?
> > 
> > [1] f286757b644c "Merge tag 'timers-urgent-2025-02-03' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip"
> 
> Oh, you don't need any extra patches.  The ->writepage removal has been
> going on since mid-2021 (commit 21b4ee7029c9 was the first removal, I
> believe).

Ah, I see. Thank you for the confirmation. Let me apply them and test a quick.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
