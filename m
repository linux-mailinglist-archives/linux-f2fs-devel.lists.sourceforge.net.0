Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 19B1CB57F1A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Sep 2025 16:34:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x2SLuVOoX/taH0Vz2J1jdIdJRZgNYaus2xKQ2QOCFLw=; b=izzelhrVo6pXuh+2Gfm7SAsdli
	Gr1GnBY2VkS2jKhLL9ZLjf9y3p1WjPQJSilFfDm+LkT8rI1kN6jnchhHVcSo2c9hBVurVU90q3RVo
	tfOAdmcXiWkQdks5fwPjt0/UPcOzq0o2LFfKF5X8AcIjLNLMNZR5eYXnvLIJqc25IrEI=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uyAI4-0007WD-Gh;
	Mon, 15 Sep 2025 14:34:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1uyAI3-0007W7-5N
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Sep 2025 14:34:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qW1Vu9RJ88xxUobpW3px3is00onz5t8f9m62Tx27lxU=; b=hUnNpt+mlFORMqze9c4XtZMroe
 YgyEm9ZGmRuI0toHmBdBZtgEAEOBYO1GsfOsk+qmuggtbD4SyEnSRxudDSgC+cA2X6a6pzfm3qMwd
 Y6/80Ez/TBqXDd+esrlg9fkwORdtjId6bFcydhJRNkS5VrTrM7I5OkNjgTuBaHMrrE0Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qW1Vu9RJ88xxUobpW3px3is00onz5t8f9m62Tx27lxU=; b=YSNCD4ceolZixXZyBo9p+PvBgt
 4uBxDv+t/nUS4sDEJQ54Yhm554aljWbvWuTWXoBwLShatZLpxwmp/r66dKQqVNRSF4eitdgIV10Ka
 67J4o/NPGafDbDVTBDAqjvgwQBBl8IJr30QdcKBHrGQzqdWAPi3EVoSlVHflzStAAn/g=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uyAI2-000687-Kc for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Sep 2025 14:34:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3307243986;
 Mon, 15 Sep 2025 14:34:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58C3FC4CEF1;
 Mon, 15 Sep 2025 14:34:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1757946876;
 bh=gpkBymIM0PotRRa+sl8Mo38/j8spjGtGIICmzaHvpi8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZPaPXOycDJnkNwIUlcymPar2CNX/vPvjn4EaQM5bsCGBP8ZyGVaPcq8iIRLi15UfQ
 RxgDjG5KN4/R4B5GUodqa18zyfS8xQshfoPKhhEFFybLZHMOZOyLjRjGFDIZ5z5aTl
 9nvbenG0sPeA/Bp9ydKZJmW6nZvygqtCMEQeTwC9EK+cX1WTvL4I9F9C0bfgie2jrI
 mLDftSL5L7I0Av8kMLMxmke/RGrNQ6/HImOFK0ZxWc+wvwfzKayjWIWoTYhk/Gq9mX
 hz3MUFdIBhVal3LAkvYgZhJ/uddYUowVVtkgkGp3/wy8R1OSn3BjIimMt+5reQ+B/c
 Zqxp0DuJITLtg==
Date: Mon, 15 Sep 2025 09:34:30 -0500
To: Jan Prusakowski <jprusakowski@google.com>
Message-ID: <20250915143430.GA1993@quark>
References: <20250915100451.810719-1-jprusakowski@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250915100451.810719-1-jprusakowski@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Sep 15, 2025 at 12:04:50PM +0200, Jan Prusakowski
 wrote: > Changes in v2: (Thanks to Eric for the review) > - Instead of
 disabling
 the test entirely when file compression is used > we now ensu [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uyAI2-000687-Kc
Subject: Re: [f2fs-dev] [PATCH v2 0/1] Do not run
 _verify_ciphertext_for_encryption_policy on compressed FS
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: jaegeuk@kernel.org, Zorro Lang <zlang@kernel.org>, fstests@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Sep 15, 2025 at 12:04:50PM +0200, Jan Prusakowski wrote:
> Changes in v2: (Thanks to Eric for the review)
> - Instead of disabling the test entirely when file compression is used
>   we now ensure that compression of the test file is disabled.
> 
> Jan Prusakowski (1):
>   common/encrypt: Do not run _verify_ciphertext_for_encryption_policy on
>     compressed FS
> 
>  common/encrypt | 7 +++++++
>  1 file changed, 7 insertions(+)

FYI: for a single patch, there's no need for a cover letter.  If a
changelog is needed, it should be in the patch itself, just below the
"---" line.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
