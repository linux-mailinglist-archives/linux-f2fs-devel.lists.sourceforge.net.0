Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17BF07EBEA2
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Nov 2023 09:37:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r3BOs-0005Te-G6;
	Wed, 15 Nov 2023 08:37:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1r3BOo-0005TY-WE
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Nov 2023 08:37:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=CIYzeiU4xyjCJRPPUvfE/80bGrLhV3mDUos/X3sBOPg=; b=fjbu8l1pB7QVBCuTbowtKs6zn4
 JO4cqRGir6u/jXVaazESvznr2tNDROnQ12J+ZrrS35EywAFaLv56wBGXG14wOlQCNmij7OoJTCwPf
 00+BVSmxGo7llGEcPNnQ3SB0jC2Tq5J9JC//6QSpztAl8tm8XoAFdv3a9YNQZ8nlGPO8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=CIYzeiU4xyjCJRPPUvfE/80bGrLhV3mDUos/X3sBOPg=; b=l8s/G38jM5C14OTFm+uBc4jOxk
 v/yQPBxRXPJzjLGaAC6wD6fSr3ijO/JiVOowTt0Ya49IJ7d/Zfm0WS/FGhHjC/lguaNzNYuKX611I
 5UfHy0znAZ23dW5zocHngMNiQdNbfMHchj8SnRVdq8ANNOS9QYds2h0Iq3SovBhtF5uM=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r3BOn-0003jq-B7 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Nov 2023 08:37:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id EEF2FCE1C36
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 15 Nov 2023 08:37:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96B0FC433C7;
 Wed, 15 Nov 2023 08:37:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700037437;
 bh=SkmOEJc3ZMmlk40zseRFom9MYwq3z4ksll0TuRSO3Fc=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=ajxHST7TMSyUC1L3e6bHt/dONXiEH/XfRwX5KajIcKON0CaDPSlX20fkw0VcGLSxK
 hdDSvlzmQz+Wy0OcFigemfRzo95vfcA4HIaiagjJlnc+WsfcF3tbZHYcaiXykPdKrf
 eU9BSbptSpefHgBGkn9rE8hjANL/7D0ygU/X3HfWVrlpqRdbAhMftrhM1dNqbVEWmS
 acl4V2nfL1DwwueSBdphhqeahSh+m6+xpI/NilbJhPBntk3FoKbrXTspdy2WIQaaYq
 CtBIMPEKd4GYeVRldIvngSDe+tRqo2qVcawiOFEjO1UmYaTRBQnYeoYw7FjX2QQxKJ
 mUFtN9M3ZpBqQ==
Message-ID: <37667ef1-8cef-5eba-73f0-682af8d5363a@kernel.org>
Date: Wed, 15 Nov 2023 16:37:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Eric Biggers <ebiggers@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
References: <20231026025736.2193139-1-ebiggers@kernel.org>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <20231026025736.2193139-1-ebiggers@kernel.org>
X-Spam-Score: -4.5 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/10/26 10:57, Eric Biggers wrote: > From: Eric Biggers
 <ebiggers@google.com> > > Make fsck.f2fs zeroize the unused xattr space,
 i.e. the space after the > end of the zero-terminated xattr list, [...] 
 Content analysis details:   (-4.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.9 NICE_REPLY_A           Looks like a legit reply (A)
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r3BOn-0003jq-B7
Subject: Re: [f2fs-dev] [PATCH] f2fs-tools: ensure that unused xattr space
 is zeroized
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2023/10/26 10:57, Eric Biggers wrote:
> From: Eric Biggers <ebiggers@google.com>
> 
> Make fsck.f2fs zeroize the unused xattr space, i.e. the space after the
> end of the zero-terminated xattr list, if it isn't already zeroized.
> 
> This is important because the kernel currently does not explicitly
> zero-terminate the list when writing xattrs.  So, the kernel relies on
> the unused space containing zeroes.
> 
> Also, add a missing free() to fix a memory leak.
> 
> Signed-off-by: Eric Biggers <ebiggers@google.com>

Reviewed-by: Chao Yu <chao@kernel.org>

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
