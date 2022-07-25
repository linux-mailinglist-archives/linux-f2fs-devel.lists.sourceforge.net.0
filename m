Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D273A5803D9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 25 Jul 2022 20:12:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oG2ZQ-0002ul-Fd; Mon, 25 Jul 2022 18:12:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1oG2ZJ-0002ud-7v
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Jul 2022 18:12:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uJRtfrElba5CLxcxh8D4VlMCc+DhA3Y0CvzSiB09Tcw=; b=MFZygcN2RrI2Rief5f49lNZqr1
 Y17p6eOR43QizDBRrlJzV5GoyvFvN64sRqDyCnxJrxZ0bzNiZeTTM5TqjGcR8wdAqd4bG4X/45FZM
 sDx3SFUOXoAuoRGIx2wV1pzJXYUQ8eEcab/3kseb2k6sB29BKJxLUJXKtfhDQ5ZB6G3g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uJRtfrElba5CLxcxh8D4VlMCc+DhA3Y0CvzSiB09Tcw=; b=hIqpnLxUvQies6JvD3VNmUTYmm
 6Hqz13neQ/D9zCqGyyPMXRO7f+F02VhBqLmRompN6OQRMA/BYHslp/b0wXU0qCb/O6vhGku1o5asb
 HltcQuTjHrt8f02N+0u0PlI0n2VEWbtxzNmmkixrd/KCzCOuQd/ZOSJzgJeh46PymQKM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1oG2ZH-0000xZ-39
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 25 Jul 2022 18:12:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C4E1B613CA
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 25 Jul 2022 18:12:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7248C341C6;
 Mon, 25 Jul 2022 18:12:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1658772747;
 bh=qdWMQQKR8B6EADa6U6NBfxlIzi/aeUuQEIWc4wTtIJ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XWhXckPekmLTNg1ZhroIC3wMS4JVLPCYsXHe5Fd86LEkStVLlwKwuRERjnfWICZBs
 KwdMl4Ubwhhxz/SNyupEpf5ZQdsMAQipiMg8H4g3GRNnXlc6S8etHe+wcJ0+4ymVG7
 ro6EoyxIDImJMuJQ98IuU3u3IslYx4Q3X1JEQSRvvWlmdxM/olx+9jEVK83Sgxk3S9
 yrYLuIoHLs+3h9t2gNY/JPYpZ5OmfpnUkgYBFfvl+qFCxil+mzDEHaZVnrgR1UGvMP
 HB/lbSEc1W8W/iVFQNNW3Ql/QUIkQRPG2kXFJXQBnfnZD5V0YIrLvKPLE06jEgA/hW
 D6q+HLHyj18Tg==
Date: Mon, 25 Jul 2022 11:12:25 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <Yt7dCcG0ns85QqJe@sol.localdomain>
References: <20220722071228.146690-1-ebiggers@kernel.org>
 <20220722071228.146690-7-ebiggers@kernel.org>
 <YtyoF89iOg8gs7hj@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YtyoF89iOg8gs7hj@google.com>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Jul 23, 2022 at 07:01:59PM -0700, Jaegeuk Kim wrote:
 > On 07/22, Eric Biggers wrote: > > From: Eric Biggers <ebiggers@google.com>
 > > > > Currently, if an f2fs filesystem is mounted with the m [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oG2ZH-0000xZ-39
Subject: Re: [f2fs-dev] [PATCH v4 6/9] f2fs: don't allow DIO reads but not
 DIO writes
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
Cc: linux-block@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, Keith Busch <kbusch@kernel.org>,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, Jul 23, 2022 at 07:01:59PM -0700, Jaegeuk Kim wrote:
> On 07/22, Eric Biggers wrote:
> > From: Eric Biggers <ebiggers@google.com>
> > 
> > Currently, if an f2fs filesystem is mounted with the mode=lfs and
> > io_bits mount options, DIO reads are allowed but DIO writes are not.
> > Allowing DIO reads but not DIO writes is an unusual restriction, which
> > is likely to be surprising to applications, namely any application that
> > both reads and writes from a file (using O_DIRECT).  This behavior is
> > also incompatible with the proposed STATX_DIOALIGN extension to statx.
> > Given this, let's drop the support for DIO reads in this configuration.
> 
> IIRC, we allowed DIO reads since applications complained a lower performance.
> So, I'm afraid this change will make another confusion to users. Could
> you please apply the new bahavior only for STATX_DIOALIGN?
> 

Well, the issue is that the proposed STATX_DIOALIGN fields cannot represent this
weird case where DIO reads are allowed but not DIO writes.  So the question is
whether this case actually matters, in which case we should make STATX_DIOALIGN
distinguish between DIO reads and DIO writes, or whether it's some odd edge case
that doesn't really matter, in which case we could just fix it or make
STATX_DIOALIGN report that DIO is unsupported.  I was hoping that you had some
insight here.  What sort of applications want DIO reads but not DIO writes?
Is this common at all?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
