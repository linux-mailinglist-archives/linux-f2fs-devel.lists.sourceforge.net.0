Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C62736637A6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Jan 2023 04:05:24 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pF4ww-0000R8-DJ;
	Tue, 10 Jan 2023 03:05:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1pF4wu-0000R2-Dl
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jan 2023 03:05:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zydx2zT/2+rGugRBlHcAkvU+Etp+KzuuvR2AUjqrsB8=; b=f4jI8Oa5ocM1p51Fo6YtfdEURy
 qz/kF6xpScd9voZQC93d+FyOBQrtKk9lDLhAdvaK7KiGu2hcP/IaOy09nOT3nGHzLT4n6ck6w+Mw5
 kseSg84raAOOAUyWNAgQtBOlyW/b+0sswPOGXxeqhV4pjdIB0q+dOsg6fEGb/HLCy0GM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zydx2zT/2+rGugRBlHcAkvU+Etp+KzuuvR2AUjqrsB8=; b=WfvRkM0MdNEEGQHe3iNj1Lr7sd
 Qy1uPjY4lE4gJ0ZfqC5zJ3a4luikCKSL1xuK0gassXrCVOKE94Lze9Tkuu8h6I/Isg3LPr2msovXG
 ppV39y+5sMlmAulcihYh7DHqdGy3VtbE4YNNIE3uEiP1S36TgReknsZP/agtBmDeMkbY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pF4wt-00CNqX-Bh for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Jan 2023 03:05:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EE9F161366;
 Tue, 10 Jan 2023 03:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0912AC433D2;
 Tue, 10 Jan 2023 03:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1673319909;
 bh=kIb/pMavnQ/vJQ+FDHSwaaxR738wNTcTTT1E+SUl1A8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RNq1t8iRPejlvRTCQMEhKhCDLCOKf5Jp4Ihc4JA9Ww5kWoHmVuz/HaadQrbwCYoXS
 wBHPTrrMnEsVJjQyQBnGSh3I5TkYE5In5LdNUDM2ccl9oLRGf6KDCw8krhrzptwfpZ
 tZjwuO6TIZlm+pn/NVgxbZxxJcLPH16fuDDn3BzyGkSeXZXzgVnfjqxbJSWozmLZWr
 9fSuQemymDUhxgek/Fq/VNuXu7LKEa9tmz8QRmpre+hKxe4qZ9UNmTohQUqy5DtJpo
 6tO1ost8hxl+kAoshWAIoEriwAixYgU82IEs8nAL+67KgsmEey9aqSw+Ajroxaetvt
 lEKEei6L858Kg==
Date: Mon, 9 Jan 2023 19:05:07 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Message-ID: <Y7zV41MQWSUGo4fw@sol.localdomain>
References: <20221223203638.41293-1-ebiggers@kernel.org>
 <20221223203638.41293-11-ebiggers@kernel.org>
 <20230109183759.c1e469f5f2181e9988f10131@linux-foundation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230109183759.c1e469f5f2181e9988f10131@linux-foundation.org>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 09, 2023 at 06:37:59PM -0800,
 Andrew Morton wrote:
 > On Fri, 23 Dec 2022 12:36:37 -0800 Eric Biggers <ebiggers@kernel.org> wrote:
 > > > After each filesystem block (as represented by a buf [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pF4wt-00CNqX-Bh
Subject: Re: [f2fs-dev] [PATCH v2 10/11] fs/buffer.c: support fsverity in
 block_read_full_folio()
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
Cc: Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jan 09, 2023 at 06:37:59PM -0800, Andrew Morton wrote:
> On Fri, 23 Dec 2022 12:36:37 -0800 Eric Biggers <ebiggers@kernel.org> wrote:
> 
> > After each filesystem block (as represented by a buffer_head) has been
> > read from disk by block_read_full_folio(), verify it if needed.  The
> > verification is done on the fsverity_read_workqueue.  Also allow reads
> > of verity metadata past i_size, as required by ext4.
> 
> Sigh.  Do we reeeeealy need to mess with buffer.c in this fashion?  Did
> any other subsystems feel a need to do this?

ext4 is currently the only filesystem that uses block_read_full_folio() and that
supports fsverity.  However, since fsverity has a common infrastructure across
filesystems, in fs/verity/, it makes sense to support it in the other filesystem
infrastructure so that things aren't mutually exclusive for no reason.

Note that this applies to fscrypt too, which block_read_full_folio() (previously
block_read_full_page()) already supports since v5.5.

If you'd prefer that block_read_full_folio() be copied into ext4, then modified
to support fscrypt and fsverity, and then the fscrypt support removed from the
original copy, we could do that.  That seems more like a workaround to avoid
modifying certain files than an actually better solution, but it could be done.

> 
> > This is needed to support fsverity on ext4 filesystems where the
> > filesystem block size is less than the page size.
> 
> Does any real person actually do this?

Yes, on systems with the page size larger than 4K, the ext4 filesystem block
size is often smaller than the page size.  ext4 encryption (fscrypt) originally
had the same limitation, and Chandan Rajendra from IBM did significant work to
solve it a few years ago, with the changes landing in v5.5.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
