Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EECB52DE3F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 19 May 2022 22:21:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nrme0-0008IQ-B8; Thu, 19 May 2022 20:21:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nrmdy-0008IE-G0
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 20:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NS+Rv8r6YfOEuq9hz+eGmBKqZlWz2qvkbXCwkXMDPPg=; b=Ymv+oKWiDumxWT2K0Fjzm5fFPD
 Jewp5nfnQyUg28+whMdsc9sKWEt4Jtnxm19EjdMf8mjzGv6a6C8UIJTykSGfKnNPKutE6kRKfPX23
 4PwiFGddBV/sHa5iPX8GXpVl1k6Wn4N/d0EsYi5cF614g+6vcWL/AT6yqhEiB/4a+5zY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NS+Rv8r6YfOEuq9hz+eGmBKqZlWz2qvkbXCwkXMDPPg=; b=NJFbDrBCTHrIwl6BktL9YWdhP4
 PYsj/9ke7eLpOhDbdS591eegrBx391j7o/fHT8MHOfc5mSfNO2M9+yfOu7+dzSO4X/kG6jiUTnCLv
 cex260hRiAJZoyrOrGBYDl+YHuOpcOP0oF9aoC+zQFYuIkZcm8C1HlWlJGdWpV6B+HlY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nrmdw-00AP4P-AK
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 19 May 2022 20:21:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4605461B6F;
 Thu, 19 May 2022 20:20:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C6B5C34100;
 Thu, 19 May 2022 20:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652991656;
 bh=3neDrjbhF/v/T8oE/KKYbgKDEEyXfJi6xod+XBBWABY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sLekZtrCpwOLi2xPkq359pjCu+X0238sgCYEYWRoQT8r1MnsrNst2Cd22UP35QjCs
 YuM73pwQQnnuQSG0YscHSQ9/gM6f/e8MWaymRjHDT2mCUUQjSo4/gx+sZx2SjnHM16
 EgWYeA9L1/2v4rIZBrdVj9sABN5paTLRPUtua64+1r/Tno+XJ7rc6DoAMvPrapivr9
 VhvwG4Mh7EbTFwwJbhiyqqYy0Y8+V09A3Yz1IZSksocM+g9DbQvVFwHh/tdrlaxajs
 dRiIPEg+ifX1tzzk0dHWOsXp/1kQesydrpxJvzwLBGkxVStW8ToFxu4fFmWUBszU/G
 do5jUTgObEroQ==
Date: Thu, 19 May 2022 13:20:54 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@collabora.com>
Message-ID: <YoampjUJ9Qe060AH@sol.localdomain>
References: <20220519014044.508099-1-krisman@collabora.com>
 <20220519014044.508099-5-krisman@collabora.com>
 <YoW8yx9Fw9Rwiaja@sol.localdomain> <87h75lnvv9.fsf@collabora.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87h75lnvv9.fsf@collabora.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, May 19, 2022 at 03:52:10PM -0400, Gabriel Krisman
 Bertazi wrote: > > It's hard to reason about, though. f2fs does things in
 a much cleaner way, as > > I've mentioned before, since it decides w [...]
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nrmdw-00AP4P-AK
Subject: Re: [f2fs-dev] [PATCH v6 4/8] ext4: Reuse generic_ci_match for ci
 comparisons
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
Cc: linux-ext4@vger.kernel.org, tytso@mit.edu,
 linux-f2fs-devel@lists.sourceforge.net, adilger.kernel@dilger.ca,
 jaegeuk@kernel.org, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, May 19, 2022 at 03:52:10PM -0400, Gabriel Krisman Bertazi wrote:
> > It's hard to reason about, though.  f2fs does things in a much cleaner way, as
> > I've mentioned before, since it decides which type of match it wants at the
> > beginning, when initializing struct f2fs_filename.
> 
> Yes, this is quite confusing. Are these implementation documented
> anywhere?
> 

Not very well.  The f2fs implementation has some comments, though.  E.g. see
struct f2fs_filename and f2fs_setup_filename().

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
