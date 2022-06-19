Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 75515550D64
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Jun 2022 00:13:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o33A6-0007rR-Si; Sun, 19 Jun 2022 22:12:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <jaegeuk@kernel.org>) id 1o33A5-0007rH-Gq
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 Jun 2022 22:12:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RycWWnQO4utr5/chv080AcNxEHJr5K3SA/0P6k70GKk=; b=iOirHpooF8/2LeA8ZqMKw8gf4m
 IRvPyW4IP3m4CUPKRU0eM0CWeONblAr/5eIpX6cbSwzLX7C6A+MOA/48pDY6tK/Zbw5U8UdV85fPR
 0//AhWM7gHGLQ9vzHUAqQgnIU0GlpyfmmkV3x1BDNMetRXH9MisIJ2A9re+fl0cHz3xc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RycWWnQO4utr5/chv080AcNxEHJr5K3SA/0P6k70GKk=; b=jJuEOVp+0keK/iAtwddofIL+X9
 WhshvbEgZUDmfEMIMNJYpBC19tgDp8P2t5NHAdf8+kg5AJs2p4+R6j4LXfKQs1pV4c7PQXJSJX/Xg
 vOdSu/BgyWQLp9D3H4hm8HV5tYW7dOsKqjp28VlEiU59j3A4bbgfTMoPU6TpC7PKxOmA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o33A2-0007Bh-Qm
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 19 Jun 2022 22:12:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D3AF5B80E08;
 Sun, 19 Jun 2022 22:12:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 459EEC341C4;
 Sun, 19 Jun 2022 22:12:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655676764;
 bh=fmK57EE1MK2zsSoMv93mMRybXZ59QBvd+tAuprhOZbM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pPmW/wO2GcjK6ejEcfYRPOjcn6JcLVS3PteA0v+NjK3VMB1qiVZMOxH0MocrfaxxH
 D2URqrtYSW3yT8uxyKIUcQT4J0l7uQsinzJDkfrN+LdPRLLrbSjAe8HQ5KL38NVO2N
 BV4oIpQvjvl0NAOWY6BfJBFJT/P4/ZyMKmjFryjuJiN0HbmrUDRTfRv71CfkwZqT8l
 SNdrVXkgjHFz3yjmDY6lIcda+eExpmyK/R5cVL/qhRKb3fRXI+kDjZvNyLgg8QBYip
 0dDaOYo2WDoKvfcb40yLDLjyxRX8bMivn6xeat47D8ukHn0O9JawLqWuqhFY6BaxVn
 lJpcxt+ZoaRMQ==
Date: Sun, 19 Jun 2022 15:12:42 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Peter Collingbourne <pcc@google.com>
Message-ID: <Yq+fWr6abg3gSQCI@google.com>
References: <20220614231724.776264-1-bvanassche@acm.org>
 <20220614231724.776264-2-bvanassche@acm.org>
 <0bf9bc18-99a9-e0a0-bb4c-dc398361c23d@kernel.org>
 <CAMn1gO4=iy7tzvvcx6n5DLBM+V4f9Kj=_U1abRf4Cm8XAL+gCA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMn1gO4=iy7tzvvcx6n5DLBM+V4f9Kj=_U1abRf4Cm8XAL+gCA@mail.gmail.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 06/18, Peter Collingbourne wrote: > On Sat, Jun 18, 2022, 
 16:41 Chao Yu <chao@kernel.org> wrote: > > > On 2022/6/15 7:17, Bart Van
 Assche wrote: > > > Fix the f2fs-tools build on systems for which [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o33A2-0007Bh-Qm
Subject: Re: [f2fs-dev] [PATCH 1/3] Fix the struct f2fs_dentry_block size
 check
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
Cc: Bart Van Assche <bvanassche@acm.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 06/18, Peter Collingbourne wrote:
> On Sat, Jun 18, 2022, 16:41 Chao Yu <chao@kernel.org> wrote:
> 
> > On 2022/6/15 7:17, Bart Van Assche wrote:
> > > Fix the f2fs-tools build on systems for which PAGE_SIZE != 4096.
> > >
> > > Cc: Peter Collingbourne <pcc@google.com>
> > > Reported-by: Peter Collingbourne <pcc@google.com>
> > > Signed-off-by: Bart Van Assche <bvanassche@acm.org>
> >
> > Reviewed-by: Chao Yu <chao@kernel.org>
> >
> 
> I'm not sure if this is the correct fix. From what I was able to figure out
> this is actually an on-disk data structure so it needs to be sized the same
> way as in the kernel. The kernel implementation of the file system requires
> a 4K page size which means that it only makes sense for this to be sized as
> if PAGE_SIZE was defined to 4096. It should at least be possible to use
> this tool on a non-4K page size kernel to create a file system that can be
> read on a 4K page size kernel, so I think the right fix would be to change
> the definition of this struct to use F2FS_BLKSIZE (or just hardcode 4096).

Yeah, since F2FS support 4KB page size, we need F2FS_BLKSIZE.

> 
> Peter


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
