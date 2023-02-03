Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 252B0688C40
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Feb 2023 02:07:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pNkYD-0005e7-0R;
	Fri, 03 Feb 2023 01:07:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1pNkYB-0005e1-OZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Feb 2023 01:07:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XKBr5/nM94jPOmFZhzEzIUh6EP62++qk2FBmPinpCxU=; b=EQ73cNYaXC52tdiDsTk2QxGYnA
 Ozghw5jPpnOFL+8F08nOCcbdN1JednCzOCWPQDxJL5Jx45uMaU3F89ttNBUZhLwRY0MTu/McjHJaO
 ZspwbU7AOY3Bb0FTZm3om/aTIfc/gEcTehuMj9JGNXNP01uAW9Di5vDZ3u2hFxToON5Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XKBr5/nM94jPOmFZhzEzIUh6EP62++qk2FBmPinpCxU=; b=Bl+d2D+75/NcwN4Kh3J7hS1Zyx
 ZYiA2HCDyqyJC5s0ddyteqIsdjEtXNEP+MnR0AIcoiBLwPPCJDwcA0mcr80rvn5eNDY9i+h2vkxXo
 Q10s6SQLITJyXZK1YSXms0sd+F+OHMDFKGZRSkelzmZtJMkDJAYrObYZRldsnMcfE7MA=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pNkY9-00034y-Fd for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 03 Feb 2023 01:07:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EC26CB828DD;
 Fri,  3 Feb 2023 01:07:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5044BC433D2;
 Fri,  3 Feb 2023 01:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1675386446;
 bh=fz7m0oNp3+iBydgkgnlasJNzPQcxkPq6HJHHFp/eDmU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rOPBW7zi68EwVAEdF7hysr6oZSetdbFyWDQ38pu9afuQOyIaPfIj+GPMbinOGVKwF
 jOpH9BpW+bFA8vk7Oz4cWWpqnAqwPG7tuOwazTT8kOuxLoXmnkIa0biz8NiC8WUZfa
 NKuoTC94VJ+yKXU7LXEvM8Irk+XI3Mjv332MA4lkEK0Hqeyk7CSKdtUDdl/kqRWCGQ
 MbybtQGZhULhNZV0MFyzvrt8AOHC1Ggpkq2BaXFEA0/oNk8H6zxXUFJ64hcx5eS5OC
 MDxra6w/3V4tQGiLhEIhmdYs8ky9b8YHTMa4Rzj2vL9clXunI18/XZsl6ugnW/lVbd
 KSk8JF2n/4nFw==
Date: Thu, 2 Feb 2023 17:07:24 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Tejun Heo <tj@kernel.org>
Message-ID: <Y9xeTDOmMZ75G6cq@sol.localdomain>
References: <20230129121851.2248378-1-willy@infradead.org>
 <Y9a2m8uvmXmCVYvE@sol.localdomain>
 <Y9bkoasmAmtQ2nSV@casper.infradead.org>
 <Y9mH0PCcZoGPryXw@slm.duckdns.org>
 <Y9oHQ6MfRbfwmFyK@sol.localdomain>
 <Y9wrglzrfzTiCjh8@slm.duckdns.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y9wrglzrfzTiCjh8@slm.duckdns.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Feb 02, 2023 at 11:30:42AM -1000, Tejun Heo wrote:
 > > The bug we're discussing here is that when ext4 writes out a pagecache
 page in > > an encrypted file, it first encrypts the data into a b [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pNkY9-00034y-Fd
Subject: Re: [f2fs-dev] [PATCH] fscrypt: Copy the memcg information to the
 ciphertext page
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fscrypt@vger.kernel.org,
 stable@vger.kernel.org, cgroups@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Feb 02, 2023 at 11:30:42AM -1000, Tejun Heo wrote:
> > The bug we're discussing here is that when ext4 writes out a pagecache page in
> > an encrypted file, it first encrypts the data into a bounce page, then passes
> > the bounce page (which don't have a memcg) to wbc_account_cgroup_owner().  Maybe
> > the proper fix is to just pass the pagecache page to wbc_account_cgroup_owner()
> > instead?  See below for ext4 (a separate patch would be needed for f2fs):
> 
> Yeah, this makes sense to me and is the right thing to do no matter what.
> wbc_account_cgroup_owner() should be fed the origin page so that the IO can
> be blamed on the owner of that page.

Thanks.  These patches fix this for ext4 and f2fs:

    * https://lore.kernel.org/r/20230203005503.141557-1-ebiggers@kernel.org
    * https://lore.kernel.org/r/20230203010239.216421-1-ebiggers@kernel.org

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
