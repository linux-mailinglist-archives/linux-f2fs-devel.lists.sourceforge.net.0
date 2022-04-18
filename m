Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A36D2504D2E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 18 Apr 2022 09:22:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ngLiJ-0003ac-Ms; Mon, 18 Apr 2022 07:22:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1ngLi8-0003aJ-4a
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 Apr 2022 07:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vZrBvc+3AMzJ6j/hOfxVRHIqdgGKR9mwx8QRd1nmCT4=; b=jnt7Q0w2+lSYbnqkBpn72IpTiE
 YA4iffPVOqmkavX/OXt3ccVoDRQWkqJUVfebv9wbgnQ4IMR501BHHQfCSc8z8BImDd4F+VbwiksbH
 thDsDVUbV/FfqvjdUM+TYjqu38oNmuEUtCslluo/SERvokU/tCMzVl+Gc8rmY5zVn9aQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vZrBvc+3AMzJ6j/hOfxVRHIqdgGKR9mwx8QRd1nmCT4=; b=XmtyYK+biNbRD3uQjxn2Eii7eW
 fCgTK8d2NNP2EQgN6s1HKMHRalkYh3xxqpEMu9gC7Jb1qom12ZOH51KsVo3Lxy4wBBmQpFPGQCyOn
 hm20EUZQBkinyPuY7gCYy5Bbpzzi5VNqNK+0sjax6Y6TxGKSCXKX1Bz4IbcF+BrhWWNg=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1ngLi7-002qTQ-Ad
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 18 Apr 2022 07:22:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 89AAFB80E41;
 Mon, 18 Apr 2022 07:22:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5CE9C385A1;
 Mon, 18 Apr 2022 07:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650266523;
 bh=WB0hDSq33uWzhf8ZYeluPQDa2r3gGlOJliR7GwrV2NA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ErE79ArV4+vZoQCN0ISqsipGetzHRrkIVd8pWwhFjn23X7Vx3VIwim9Fj9bCPsA0v
 di4M8ckLmb9pU+i6akjE5rxuT6pGSxjetluYIx2qnRnYgktqcFLRXmKqhVyIwvNlrs
 ENgF7SPs1tfpeWYTXCPyTaT1xf3S/+ab9oeRppisFBrF2zIfO3YRkrN6+JMAnlZfRx
 2ewTh/KOm3zU7dpsJPPnHk0E7BPNiEHsga6bLMK1PGDXeJVRCeJFpO8xF5ohvq57Ce
 MoRJBJd5q+sNxXLexpTDEJyKi9iC0uihK3PC79c5NQjUoIKG76MWHN+5MSl/Ys9559
 B9HWXHdHfsywA==
Date: Mon, 18 Apr 2022 00:22:01 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Fengnan Chang <changfengnan@vivo.com>
Message-ID: <Yl0RmUoZypbVmayj@sol.localdomain>
References: <20220418063312.63181-1-changfengnan@vivo.com>
 <20220418063312.63181-2-changfengnan@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220418063312.63181-2-changfengnan@vivo.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Apr 18, 2022 at 02:33:11PM +0800, Fengnan Chang via
 Linux-f2fs-devel wrote: > Notify when mount filesystem with -o inlinecrypt
 option, but the device > not support inlinecrypt. > > Signed-off- [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ngLi7-002qTQ-Ad
Subject: Re: [f2fs-dev] [PATCH 2/3] f2fs: notify when device not supprt
 inlinecrypt
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
Cc: axboe@kernel.dk, tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, adilger.kernel@dilger.ca, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Apr 18, 2022 at 02:33:11PM +0800, Fengnan Chang via Linux-f2fs-devel wrote:
> Notify when mount filesystem with -o inlinecrypt option, but the device
> not support inlinecrypt.
> 
> Signed-off-by: Fengnan Chang <changfengnan@vivo.com>

You didn't include a cover letter in this patchset.  Can you explain what
problem this patchset is meant to solve?

Note that there are multiple factors that affect whether inline encryption can
be used with a particular file, such as whether the device supports the required
encryption mode, data unit size, and data unit number size.  So your warning
might not trigger even if inline encryption can't be used.  Also, your warning
will never trigger if the kernel has CONFIG_BLK_INLINE_ENCRYPTION_FALLBACK=y.

I recently sent out a patch that makes fs/crypto/ consistently log a message
when starting to use an encryption implementation for the first time:
https://lore.kernel.org/r/20220414053415.158986-1-ebiggers@kernel.org.  It
already did this for the crypto API, but not blk-crypto.  Being silent for
blk-crypto was somewhat of an oversight.  These log messages make it clear which
encryption implementations are in use.

Does that patch solve the problem you are trying to solve?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
