Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18161767C15
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 29 Jul 2023 06:21:08 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qPbRq-00036q-OY;
	Sat, 29 Jul 2023 04:20:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qPbRp-00036j-8z
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 29 Jul 2023 04:20:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hHdY+D4ZZqhmEPIhCQELLtMUSH90H9UsHRwgK5/AxJA=; b=bHarPwKymP915A4Z1vjKBYsQmV
 labeAQJ1O6t58KCvKjFEhXr4ijYbp5ykkv6u6mJJjwmOFYjpD10C/rpP0y9aoZGviPs1bk84pbOa7
 Fwfg5HNN1vFFBL3P5eEV7pVMoGMVidBhQ4IX1jn1E8A+/iu/H14XMHSZVQvrykkNkF+E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hHdY+D4ZZqhmEPIhCQELLtMUSH90H9UsHRwgK5/AxJA=; b=iINlK76mok6nV5wzbPX0sSVnWB
 Iy5esOQ3cFuSVDv0JqZAzP81H6UecB6vPUNvGX7XXZbGyeE/m+fHQ0gtJj9SMIaM6H3K3B5HgESUP
 ffs6iAqVbBzsv2+PvaAc82uSdEPEe+z/RSQyQjjU3dTiemcCjjbB34Pv9GH1z6bzeOug=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qPbRo-0005QF-M2 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 29 Jul 2023 04:20:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 17AC060C11;
 Sat, 29 Jul 2023 04:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3534EC433C8;
 Sat, 29 Jul 2023 04:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1690604450;
 bh=YIBg8ak2NqRa88/sTJp0e/BBEXgBNmBM+mfnhMOzXG4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EJ4rvZXkVfWvq6nmBVNai9EM9SQ8yhZZOS9uwKZYDy0igRd3ecA0PZMCP9acOGCE6
 mjhic6G4xsE1W0OxsNoARN3gq3hsmfvJ8B9wXnLNAJywgXNqht3wvO6LrHUbQLWSQg
 rdNY5KK7UFnAFlBrUFxmc20eaStE0+4Ge6+IR3TncVKSB1ebw8S5uz+Pjb2UyzUMja
 nbYR0uFc+1p6LGca0DcAJX5IaCdpD8RK5abIy1OlFHoky9to4BgwaSNSMsef4QvjZP
 WrBFveCdSbNfsi2jQklcEk4cYxjNZ5ClQPi+r/kYaDYVp+BbTTXZ+HMc0eMbAcEsfd
 61jY+FK/3U0yg==
Date: Fri, 28 Jul 2023 21:20:48 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20230729042048.GB4171@sol.localdomain>
References: <20230727172843.20542-1-krisman@suse.de>
 <20230727172843.20542-4-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230727172843.20542-4-krisman@suse.de>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jul 27, 2023 at 01:28:39PM -0400, Gabriel Krisman
 Bertazi wrote: > - In __lookup_slow, either the parent inode is read locked
 by the > caller (lookup_slow), or it is called with no flags (look [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qPbRo-0005QF-M2
Subject: Re: [f2fs-dev] [PATCH v4 3/7] libfs: Validate negative dentries in
 case-insensitive directories
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
Cc: brauner@kernel.org, tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org, Gabriel Krisman Bertazi <krisman@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 27, 2023 at 01:28:39PM -0400, Gabriel Krisman Bertazi wrote:
>   - In __lookup_slow, either the parent inode is read locked by the
>     caller (lookup_slow), or it is called with no flags (lookup_one*).
>     The read lock suffices to prevent ->d_name modifications, with the
>     exception of one case: __d_unalias, will call __d_move to fix a
>     directory accessible from multiple dentries, which effectively swaps
>     ->d_name while holding only the shared read lock.  This happens
>     through this flow:
> 
>     lookup_slow()  //LOOKUP_CREATE
>       d_lookup()
>         ->d_lookup()
>           d_splice_alias()
>             __d_unalias()
>               __d_move()
> 
>     Nevertheless, this case is not a problem because negative dentries
>     are not allowed to be moved with __d_move.

Isn't it possible for a negative dentry to become a positive one concurrently?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
