Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B59D275084
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Sep 2020 07:57:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kKxmq-0001LS-48; Wed, 23 Sep 2020 05:57:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <BATV+f986b76a317b29d19e9e+6240+infradead.org+hch@casper.srs.infradead.org>)
 id 1kKxmn-0001Ky-Lr; Wed, 23 Sep 2020 05:57:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+xPayIM5KsnWTfKDPlxSGNgmE5Ab/DG3SsTYQ0nYWCA=; b=bxkxYcu92EwHOJmRqNj3uPdxTM
 scRlvcimqGoGBjkgMzWFjjPzXkkXw62arZTMy7FvZVnkTPb9NUV56B7V2YqeL7yYQHUOxHTij/zEy
 IqYfgiF2bcA/HkXQcMsfETyK2Bz+a5X6yscfpFaV/ofZYg0aE2BbqIAVm4IFgopIloTM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+xPayIM5KsnWTfKDPlxSGNgmE5Ab/DG3SsTYQ0nYWCA=; b=Wk0RilWOCJEcShi/XqBMIvIFE8
 aJ9X/xcIJAvfjds3X1uNgWZFUVcW4Qv9qZA6sPeIjHFN4tLtttN57G+bkpPxMHawBsSxBiOQlQN50
 MHzcF2+oe2JrM92nmS7DJDHAObMFUOne7wdW8JrSFkP3JcfrffAvKB5Ix0dlS790ltN0=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kKxma-0044Do-Ea; Wed, 23 Sep 2020 05:57:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=+xPayIM5KsnWTfKDPlxSGNgmE5Ab/DG3SsTYQ0nYWCA=; b=g/f91SGO92fFuYvJtguHCdSROs
 1Kl3jQYtC3DJmj9dFU+X/DxR2smj2rRxEiMVTCdpcVec1wTczcbnjIg4MRK5bGkoL38Dny+RvaB3g
 mdma3P/6FfdNyO8L2AQ1mZMCsPxdzEDJV4mfqL972CHGS7iqYA1ZKxm9Jklkqk2t48cWxc9wbvikZ
 89h2DQQYsF6wQTCjDfLCFb6eo9aX6Ql5xCzzbuZ+KS+SRmmlVEQD1kIF1BeFck/pwuOT8Ism12NW1
 IW033ZHgZHMiPVMGFmIaU7YkHWiPus6SQH2uk+BD2umQQFRbBX/aAyTuaGhJ6KLBgtsXGBf/DjjHX
 gbrdKdlA==;
Received: from hch by casper.infradead.org with local (Exim 4.92.3 #3 (Red Hat
 Linux)) id 1kKxmG-0002rE-HI; Wed, 23 Sep 2020 05:57:16 +0000
Date: Wed, 23 Sep 2020 06:57:16 +0100
From: Christoph Hellwig <hch@infradead.org>
To: Nick Terrell <nickrterrell@gmail.com>
Message-ID: <20200923055716.GA10796@infradead.org>
References: <20200922210924.1725-1-nickrterrell@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200922210924.1725-1-nickrterrell@gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 casper.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kKxma-0044Do-Ea
Subject: Re: [f2fs-dev] [PATCH v2 0/9] Update to zstd-1.4.6
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
Cc: squashfs-devel@lists.sourceforge.net,
 Herbert Xu <herbert@gondor.apana.org.au>, Yann Collet <cyan@fb.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Petr Malat <oss@malat.biz>, Chris Mason <clm@fb.com>,
 Nick Terrell <terrelln@fb.com>, linux-crypto@vger.kernel.org,
 Kernel Team <Kernel-team@fb.com>, Niket Agarwal <niketa@fb.com>,
 linux-btrfs@vger.kernel.org, Johannes Weiner <jweiner@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

FYI, as mentioned last time:  clear NAK for letting these bad APIs
slip into the overall kernel code.  Please provide proper kernel style
wrappers to avoid these kinds of updates and in the future just change
APIs on an as-needed basis.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
