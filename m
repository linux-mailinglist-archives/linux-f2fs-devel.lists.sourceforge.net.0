Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D972EA1AE
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Oct 2019 17:23:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iPqkV-0005l0-2B; Wed, 30 Oct 2019 16:23:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <tytso@mit.edu>) id 1iPqkT-0005ks-Kx
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Oct 2019 16:23:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4/Rv70w/+7EI+JMSXW7d1wcKcps9xuE+Taa/vCwFknY=; b=CT3C3GjGBqnasLj741nzURhuWt
 FsuuC5c0JBeOo1/8CL+24dUHlDpEK/TbFvBISsltyfhvAL0iJLJIlIc0XX2iGiPvWVfSoC5NCoNH1
 rvXM+SdKUYtkIvmEnULIyMicSQIHZ9A8HSXZfkzHt7v9aDIdtEj02Uo/+kV3/ca1vaxQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4/Rv70w/+7EI+JMSXW7d1wcKcps9xuE+Taa/vCwFknY=; b=h+ugNS9raHClMZFAgfhbWk35jY
 +8FtjqWri77tFDLgcrFfoOLZlDAOpfC04MYcSmrTH1C/fNqeHEdc5yrXmYuC6KXjvEc22Il6Rsod0
 +uUi3Hk/kbk3jQU0qFtvduvgM+9LMHq4avqPsW786nx+x+U7UePCyKs8gMZCGSGJrmig=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iPqkR-008zR6-63
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 30 Oct 2019 16:23:05 +0000
Received: from callcc.thunk.org (guestnat-104-133-0-98.corp.google.com
 [104.133.0.98] (may be forged)) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id x9UGMhhq017904
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 30 Oct 2019 12:22:44 -0400
Received: by callcc.thunk.org (Postfix, from userid 15806)
 id 2C3B8420456; Wed, 30 Oct 2019 12:22:43 -0400 (EDT)
Date: Wed, 30 Oct 2019 12:22:43 -0400
From: "Theodore Y. Ts'o" <tytso@mit.edu>
To: Gao Xiang <hsiangkao@aol.com>
Message-ID: <20191030162243.GA18729@mit.edu>
References: <20191030035518.65477-1-gaoxiang25@huawei.com>
 <20aa40bd-280d-d223-9f73-d9ed7dbe4f29@huawei.com>
 <20191030091542.GA24976@architecture4>
 <19a417e6-8f0e-564e-bc36-59bfc883ec16@huawei.com>
 <20191030104345.GB170703@architecture4>
 <20191030151444.GC16197@mit.edu>
 <20191030155020.GA3953@hsiangkao-HP-ZHAN-66-Pro-G1>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191030155020.GA3953@hsiangkao-HP-ZHAN-66-Pro-G1>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 MAY_BE_FORGED          Relay IP's reverse DNS does not resolve to IP
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iPqkR-008zR6-63
Subject: Re: [f2fs-dev] [PATCH] f2fs: bio_alloc should never fail
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
Cc: linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Wed, Oct 30, 2019 at 11:50:37PM +0800, Gao Xiang wrote:
> 
> So I'm curious about the original issue in commit 740432f83560
> ("f2fs: handle failed bio allocation"). Since f2fs manages multiple write
> bios with its internal fio but it seems the commit is not helpful to
> resolve potential mempool deadlock (I'm confused since no calltrace,
> maybe I'm wrong)...

Two possibilities come to mind.  (a) It may be that on older kernels
(when f2fs is backported to older Board Support Package kernels from
the SOC vendors) didn't have the bio_alloc() guarantee, so it was
necessary on older kernels, but not on upstream, or (b) it wasn't
*actually* possible for bio_alloc() to fail and someone added the
error handling in 740432f83560 out of paranoia.

(Hence my suggestion that in the ext4 version of the patch, we add a
code comment justifying why there was no error checking, to make it
clear that this was a deliberate choice.  :-)

						- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
