Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA9AA1D2688
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 May 2020 07:11:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jZ69E-0002Cw-Ov; Thu, 14 May 2020 05:11:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1jZ69D-0002Cp-RN
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 May 2020 05:11:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aRUYfH1npGUt0W6zi8sjTImq1S1FjUnkANXJktv4/fQ=; b=F60OiqBy73Fic04/52jlNa7lsY
 XHejC1v1vnW7zYaoFusmctwEByAnoqjnUt63yY7y5e+1KFTXfS5z8CKePW53ja5s37Wk2T9DKT9s/
 Pqfv8Yglu1Fvxt+WKzzD9NwL7SL1YeFFkpwXCqpacFEhAFtp7N1NbhhbtWYreDOop7rA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aRUYfH1npGUt0W6zi8sjTImq1S1FjUnkANXJktv4/fQ=; b=j6ITS2CMU3rtyadHeywcRRcaHi
 ImqPdBz6e+AMpLs5ruIS2MYXXKDojx9aWAspTMXZfftjFFuqde0DHqrd5u3AnHl/TtqH8FYJnNfaX
 TYpoWfTedaa0jKFSx8DMUYrwyBWIn+ic0JWT6CMC+YMuaFvVYvtJqPuWv6ChOD2cvtgc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jZ69C-009Q5J-IT
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 May 2020 05:11:07 +0000
Received: from sol.localdomain (c-107-3-166-239.hsd1.ca.comcast.net
 [107.3.166.239])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 36449206D4;
 Thu, 14 May 2020 05:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1589433055;
 bh=+7Nv0uff65CHEgSOICQgU3aX0Fv+NjHfAe+0Cmtlgvw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=vwp8gJPPTHeKccZV7k1yrahp5FPT66Y2DslfqT+lmRhxMP08GBwTz6gcKkzO/spv5
 dhRVa4d1xmYyCiUYotjlwDl+6Yx1Cl63diCalWTluZtVzGJY6PAaIGGs0O5HxHccw8
 N7KmznuBnLJh5eiG0UuJOhCVU3xxHn0DpMuEAsGQ=
Date: Wed, 13 May 2020 22:10:53 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Satya Tangirala <satyat@google.com>, Jens Axboe <axboe@kernel.dk>
Message-ID: <20200514051053.GA14829@sol.localdomain>
References: <20200514003727.69001-1-satyat@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200514003727.69001-1-satyat@google.com>
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jZ69C-009Q5J-IT
Subject: Re: [f2fs-dev] [PATCH v13 00/12] Inline Encryption Support
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
Cc: linux-scsi@vger.kernel.org, Kim Boojin <boojin.kim@samsung.com>,
 Kuohong Wang <kuohong.wang@mediatek.com>,
 Barani Muthukumaran <bmuthuku@qti.qualcomm.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, May 14, 2020 at 12:37:15AM +0000, Satya Tangirala wrote:
> This patch series adds support for Inline Encryption to the block layer,
> UFS, fscrypt, f2fs and ext4. It has been rebased onto linux-block/for-next.
> 
> Note that the patches in this series for the block layer (i.e. patches 1,
> 2, 3, 4 and 5) can be applied independently of the subsequent patches in
> this series.

Thanks, the (small) changes from v12 look good.  As usual, I made this available
in git at:

        Repo: https://git.kernel.org/pub/scm/fs/fscrypt/fscrypt.git
        Tag: inline-encryption-v13

Jens, do you have any feedback on this patchset?  Is there any chance at taking
the block layer part (patches 1-5) for 5.8?  That part needs to go upstream
first, since patches 6-12 depend on them.  Then patches 6-12 can go upstream via
the SCSI and fscrypt trees in the following release.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
