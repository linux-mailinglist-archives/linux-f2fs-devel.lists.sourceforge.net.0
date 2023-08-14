Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D81EC77C0B6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Aug 2023 21:24:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qVdAo-00009k-HW;
	Mon, 14 Aug 2023 19:24:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qVdAk-00009c-Uo
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 19:24:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Wr0jlOrbqQZ4Ja8r3hNSjj2Kw1StEQwdvxiB/7DzNag=; b=RrhYXq4CIIIS0R6jnhyislIVw9
 1HjX/fyZYSE7lvtpUkciwd9fAeJevlK+mZy9p2ZChqNSbTKFpl4kYL7xmmMszFnkzWHW/o28gmwLY
 T3Vum1RHJJsddVis19Fh3knFfvxsx0T93K3DzFTeso/ALZ4tVbbhzOBidDl5yyNLMcs4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Wr0jlOrbqQZ4Ja8r3hNSjj2Kw1StEQwdvxiB/7DzNag=; b=g8GE9Hemdmmw68sIwyhCT7oCi2
 b/XYhSo82fNR9pDcMkDfcAX+ZGcUVQtLiw69Jmw1w+LLP4ybhIu9CABHKPn6f8SxAcw9zdfDeE9f/
 xYkRd6OzHzOL90SKInnjPqDEJlETvsV/BnRKmwyGqPsB7JkVlajSBZzr4cvEaM2vkbRY=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qVdAk-0005Kj-Ot for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 19:24:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 2B90762C15;
 Mon, 14 Aug 2023 19:24:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD7FC433C7;
 Mon, 14 Aug 2023 19:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692041048;
 bh=o3Hr6U8ctryPOyOYt2lVWBvOEWrDutJ89GR/VnTpMVY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OesZRZ9PiKG3L4wcz5xDW1Lc17kKT6aeN3dnVAkSQhARhNhfBUyE0oYpJ/gUTaoOq
 7JilTzw3/wuSlhdNjZBUa7rI+S4+p9MlFG/CiqXRp+AdBfPoe39cdJgls4yIpHxclK
 /OusVTJntyl8hB6HdZ0ao55bHLfQxMDfEcpH3Uiur2RirmnspkqQCNB87xR7WEoGWd
 OiHNr/1tNgHnwuczie1P8jvYZbbOAD9Va9fEChQCNma4Ho7ZoPB77zg3eqekSRThuO
 LQQtnT2DedPomEAg2K8Ig14ntksk+q6IVdLYsdYu4tv8gu2+Ro9loD+cNtfH5QJz7f
 rgQ7sXM/R7TwQ==
Date: Mon, 14 Aug 2023 12:24:06 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20230814192406.GD1171@sol.localdomain>
References: <20230814182903.37267-1-ebiggers@kernel.org>
 <20230814182903.37267-2-ebiggers@kernel.org>
 <87jztx5tle.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87jztx5tle.fsf@suse.de>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 14, 2023 at 03:09:33PM -0400, Gabriel Krisman
 Bertazi wrote: > Eric Biggers <ebiggers@kernel.org> writes: > > > From: Eric
 Biggers <ebiggers@google.com> > > > > It is invalid for the casef [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qVdAk-0005Kj-Ot
Subject: Re: [f2fs-dev] [PATCH 1/3] ext4: reject casefold inode flag without
 casefold feature
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
Cc: linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Aug 14, 2023 at 03:09:33PM -0400, Gabriel Krisman Bertazi wrote:
> Eric Biggers <ebiggers@kernel.org> writes:
> 
> > From: Eric Biggers <ebiggers@google.com>
> >
> > It is invalid for the casefold inode flag to be set without the casefold
> > superblock feature flag also being set.  e2fsck already considers this
> > case to be invalid and handles it by offering to clear the casefold flag
> > on the inode.  __ext4_iget() also already considered this to be invalid,
> > sort of, but it only got so far as logging an error message; it didn't
> > actually reject the inode.  Make it reject the inode so that other code
> > doesn't have to handle this case.  This matches what f2fs does.
> >
> > Note: we could check 's_encoding != NULL' instead of
> > ext4_has_feature_casefold().  This would make the check robust against
> > the casefold feature being enabled by userspace writing to the page
> > cache of the mounted block device.  However, it's unsolvable in general
> > for filesystems to be robust against concurrent writes to the page cache
> > of the mounted block device.  Though this very particular scenario
> > involving the casefold feature is solvable, we should not pretend that
> > we can support this model, so let's just check the casefold feature.
> > tune2fs already forbids enabling casefold on a mounted filesystem.
> 
> just because we can't fix the general issue for the entire filesystem
> doesn't mean this case *must not* ever be addressed. What is the
> advantage of making the code less robust against the syzbot code?  Just
> check sb->s_encoding and be safe later knowing the unicode map is
> available.
> 

Just to make sure, it sounds like you agree that the late checks of ->s_encoding
are not needed and only __ext4_iget() should handle it, right?  That simplifies
the code so it is obviously beneficial if we can do it.

As for whether __ext4_iget() should check the casefold feature or ->s_encoding,
we should simply go with the one that makes the code clearer, as per what I've
said.  I think it's casefold, but it could be ->s_encoding if others prefer.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
