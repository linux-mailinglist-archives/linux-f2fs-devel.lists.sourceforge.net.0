Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4D1229D9C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 Jul 2020 18:58:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jyI42-00082Q-KV; Wed, 22 Jul 2020 16:57:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jyI40-00082I-QJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 16:57:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oIqpHmzZPlwC7G9pZZRr/b8ogrWOGYzaen2RJVTC2tE=; b=OoGboytPmGhFRQB+GAxdPWy2xO
 aZk2a0bXnhQGvWGtNXkQPNRCODC+VyQkB+bXueJibve3klgaFTQDEkNsoygGpKJoMDuD1hL5YSBGl
 nftuzfAAhGigvIrT2Me96DKgbym4ItS0zoJrQXxrPzpIwlmPGA/dKz84wEI5Ge1ose5M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oIqpHmzZPlwC7G9pZZRr/b8ogrWOGYzaen2RJVTC2tE=; b=hOmbs2HTl5vHw7qI7iGlRJDu8R
 x4fgPizcM7AOTeqI+Y7ukiT43lidru8pLJcMZxNWtcSjpUZ9EPXdmA7KbyZKPFLzsE4KksJSL9Zvl
 xjRm2B0y/lIc9I3q8s6lIoLkQ+zLnRP2Y2ForoTbXC2ApxF+q81gsIe6Ghtddi0E8Z6c=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jyI3z-00Gloz-M3
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 Jul 2020 16:57:52 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2B5C0207CD;
 Wed, 22 Jul 2020 16:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595437054;
 bh=foafLTKTSs4eRv6H8DFW8ktlWYvdIzYz280w9TzcoZQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XAQyYh1QpMNzwzJvzhVIQQzkEjb96TUxGGx+IOEEUuuul6uaTDQ6wBXoBfdlrenHv
 M3vDPkxQ0CSYm7iQ9K8pcC4z2TTyTV/awLhUxetG6+hNGTSDBoJ9DsvCCFFvifzfdJ
 /c3bcsGQXknw8yBFX32wBWp5ul8DeISsD/1Z8yug=
Date: Wed, 22 Jul 2020 09:57:33 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20200722165733.GB3912099@google.com>
References: <20200720233739.824943-1-satyat@google.com>
 <20200720233739.824943-8-satyat@google.com>
 <20200721004701.GD7464@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200721004701.GD7464@sol.localdomain>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jyI3z-00Gloz-M3
Subject: Re: [f2fs-dev] [PATCH v4 7/7] fscrypt: update documentation for
 direct I/O support
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
Cc: Satya Tangirala <satyat@google.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/20, Eric Biggers wrote:
> On Mon, Jul 20, 2020 at 11:37:39PM +0000, Satya Tangirala wrote:
> > Update fscrypt documentation to reflect the addition of direct I/O support
> > and document the necessary conditions for direct I/O on encrypted files.
> > 
> > Signed-off-by: Satya Tangirala <satyat@google.com>
> 
> Reviewed-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
