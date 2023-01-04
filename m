Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E671965CD6D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jan 2023 07:59:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pCxjl-0004PV-Sf;
	Wed, 04 Jan 2023 06:58:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1pCxjl-0004PP-9I
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 06:58:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HVIAWYILR+5EU2tvIgAaJBt+h2tt6V4jE3TZ1pYxjm8=; b=GD1je2M29C2q7+NqGApmzVut0o
 vxOs3pulWFW+sA0pI7boBdsUqmuKTo3HsKZ6/GOpP9nwDqqSSrTI9JhMrVsX6Gb6f5+8y6ZxjGcdj
 CRe0sY7ApITzKZnFVB0a+JB0G9LnfjgGjh6Tk8rrtbXKfXNaA/x5xvwrexFCMuw7MpCk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HVIAWYILR+5EU2tvIgAaJBt+h2tt6V4jE3TZ1pYxjm8=; b=SDVgcjNwI4ScDnC3VbGdyeJiuJ
 V+Nt+eD16QwSvu7wXNojc2JXDO7FODQ3lvnS7EyG+OsZuzWz2zghW9aTSS101jqRcma0YAg8b3j3h
 OmjNKziXIvcgDnCazbJhYof4sq1uE1tg7exhLH75fF1pShNezCMVg4+cWHl5ZEVrusL0=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pCxjh-0006uL-PH for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 06:58:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7B6C7B81205
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed,  4 Jan 2023 06:58:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE594C433D2;
 Wed,  4 Jan 2023 06:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672815526;
 bh=A5Zfogc/sz6TcmE5utXwOgFFIovnnjMqVtADVSdFIFk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g352m9v8ZhEtl9aFsgP0fB9nHIZGxJuNzYxlZeLr2QMuZ2xwZJNHIVoD/kK/wTJvG
 80A4d6n8rDCqYtZseIKP79DS/7GH6uAn1B8HjiP+sP7o+tkQtcCyx8gtpHROcTA6rj
 ev1K67aJPcJoqKHnfoKervDOk1KZpjDNlgehvmzGJKh6Y7vZAtmqfgFi55upmJDIKs
 XOcNz8B3Ble4MqcQxjghsLWiS5xfqajlSP4KE0UCAH8ezWGVt394GK5mDu+QInmZVX
 DSWGRLTWlh6QD6viJcScz3vfFjAkj0J/mYNopPHarc2ruFRZacaKmOOY8prQzO61YY
 ozGcEBBedHU1g==
Date: Tue, 3 Jan 2023 22:58:44 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Message-ID: <Y7UjpFWy6R+J4BLV@sol.localdomain>
References: <20221215060420.60692-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221215060420.60692-1-ebiggers@kernel.org>
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Dec 14, 2022 at 10:04:20PM -0800, Eric Biggers wrote:
 > From: Eric Biggers <ebiggers@google.com> > > I've gotten very little use
 out of these debug messages, and I'm not > aware of anyone else [...] 
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pCxjh-0006uL-PH
Subject: Re: [f2fs-dev] [PATCH] fsverity: remove debug messages and
 CONFIG_FS_VERITY_DEBUG
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
Cc: linux-xfs@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Dec 14, 2022 at 10:04:20PM -0800, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> I've gotten very little use out of these debug messages, and I'm not
> aware of anyone else having used them.
> 
> Indeed, sprinkling pr_debug around is not really a best practice these
> days, especially for filesystem code.  Tracepoints are used instead.
> 
> Let's just remove these and start from a clean slate.
> 
> This change does not affect info, warning, and error messages.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>
> ---
>  fs/verity/Kconfig            |  8 --------
>  fs/verity/enable.c           | 11 -----------
>  fs/verity/fsverity_private.h |  4 ----
>  fs/verity/init.c             |  1 -
>  fs/verity/open.c             | 21 ++-------------------
>  fs/verity/signature.c        |  2 --
>  fs/verity/verify.c           | 13 -------------
>  7 files changed, 2 insertions(+), 58 deletions(-)

Applied for 6.3.  (To
https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git/log/?h=fsverity for now,
but there might be a new git repo soon, as is being discussed elsewhere.)

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
