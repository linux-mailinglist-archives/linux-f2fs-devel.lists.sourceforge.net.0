Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6569321AE6A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Jul 2020 07:14:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtlMx-0004mT-Qh; Fri, 10 Jul 2020 05:14:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1jtlMx-0004mM-3S
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 05:14:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0euGV4lIfcW1t7xNAnPOTJCCSvFd+RTcTutvkRqgcjI=; b=PfgvRYKOaGzW6EMdLGybf6hTun
 fyuERGH3x51qb525MzShfYACXxeahz/Cb9ar6AM0pYObhUiivPJjFybbvuy8C99Pzuhi8KTICwATX
 sXI6apkTbHby5ZG+wNaATxh0m2L2oQ22pFN9FhsCO2VcWRl53GeKLP2Nk6p86YLRmgjg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0euGV4lIfcW1t7xNAnPOTJCCSvFd+RTcTutvkRqgcjI=; b=UGGdISGl3RAwkue4siptvZ17XD
 MKMouvSV7Q1Nl650MvOaHujkGwccg8r5UGptZs9w57KfcwNhGtawNabrBE/Rzf+j44MQMVqJcULb7
 Du3WK4t512ZAa0GYKiHd0yDfbll2R0AJioIjuh5FmDD7LPS8bfQk4Eh/e01EeS+SbBW4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jtlMu-00Cs1L-BN
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Jul 2020 05:14:43 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 14845206E2;
 Fri, 10 Jul 2020 05:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1594358070;
 bh=0euGV4lIfcW1t7xNAnPOTJCCSvFd+RTcTutvkRqgcjI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=SV4vyCTCsNZg/qA25icqhcnkjRjFjVH/SztkCOTA9uRK4uvdIVNkoXJz2sNp/si+f
 tLLUHd+1aje1yyoS915lfpjkfubObXTkhMsFSg6iQvAtpbPYi5c5TgB1Rz2RVn3XQ8
 dw2q4jJU62JMYitwSdR34V4kHlV48DCoGmJaQatM=
Date: Thu, 9 Jul 2020 22:14:29 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: lampahome <pahome.chen@mirlab.org>
Message-ID: <20200710051429.GA864598@google.com>
References: <CAB3eZftzcywNU-cf7mRWqtj-74VqgzLHC32a6v_CycVcRsiu0A@mail.gmail.com>
 <20200710034114.GG545837@google.com>
 <CAB3eZfv5k7cwFzMAOda7+cgHJzatRRhwyEg-8U9yt8TZ5s0=ww@mail.gmail.com>
 <20200710042502.GJ545837@google.com>
 <CAB3eZfvgEsv_T0AC6imnmFvTw3-hE6-BOd1TPqqqP5RS9bHLQA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAB3eZfvgEsv_T0AC6imnmFvTw3-hE6-BOd1TPqqqP5RS9bHLQA@mail.gmail.com>
X-Spam-Score: -0.2 (/)
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
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jtlMu-00Cs1L-BN
Subject: Re: [f2fs-dev] possible to allocate a full segment for a direct IO
 with blocksize 2MB?
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 07/10, lampahome wrote:
> >
> > Previously, fallocate doesn't allocate block addressess, but pinned file
> > allows
> > to allocate them aligned to 2MB-sized segment.
> >
> > So I create a pin file such as 10MB and it needs 5 segments.
> Maybe the 5 segments are not continuous, but I can make sure the all
> 4k-blocks of the file are all in full segments.
> Am I right?

I think so. You can check fibmap to see the block addresses. :)



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
