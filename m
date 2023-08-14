Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B18177C082
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Aug 2023 21:14:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qVd1P-0004gw-Ul;
	Mon, 14 Aug 2023 19:14:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qVd1O-0004gq-Dq
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 19:14:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oiwQCCD0pLpBUj4YRjZ2vRK9OVVXVISz1bTVt/WIuww=; b=i0b4NfK/PFOXusgay2Pik0KUnp
 UO8KA+VpK9DK0DbxjiesxIGbGfJ1Q3GqBawTrSsTxlzTpxMfitBIVdE3/MkNDdhLh8HNX2ByIRUVY
 Zt6CMJF/CUPTXOdPoMYZLCvyYhl5qbvqY2t4hWIJ/hwc23x7+Gplva0xy0h9hqW7qwQ0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oiwQCCD0pLpBUj4YRjZ2vRK9OVVXVISz1bTVt/WIuww=; b=FF8EbK7J4BfOKdwuF8WANljaqK
 B1nHO9C/Z3LyBsaW++8wtWClr36C9EAQk+WLQun+nxXecsXjiJuAK7xw5uQo9Y/OIzqIs1N5kNygC
 C5+GN3ZWGDhrI6HX4HJ731tHwcZg6zTGe2r48kPJwreHVWGbk5y1IIdSTmvAcv9g1S+4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qVd1O-005kDK-T9 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 19:14:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4C3BE6592D;
 Mon, 14 Aug 2023 19:14:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72C21C433C8;
 Mon, 14 Aug 2023 19:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692040468;
 bh=ZMrO9kHt31aBiTfDQ2I66UBLQJaflkcOw7L4HeyTWHY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NgKmMW/BOVD3WXzBa+PpThz/SSQJ3Eb8LrnQjRsWWDpOaRJL0zPCwC0XT9zQijHMu
 o9AZVkUFCPZKZahlPAexwJmqT9gxEM0WHxH9esoLU6mo5N30PV0Xfe3VhdaqL5Cyg5
 c+x6v2TlqR8VnZv+eE+L+DyTKE6Kobk5q4yDRYoUnTjjcXFN7vXznYcUm4r0SkoFHy
 kpRGyqtQPaCWzI9M0h0C/2+d21EtLWHLQAd6veW9pL1wrWfSpYNG4rOUzYMFV8GOZO
 abfj0sOO7DL9ivFSQkkjotZ6utGZEv070+imPLZch46B0sgGJAz54wxCAMqwQL42b+
 Yw/c1J/CJ0MHQ==
Date: Mon, 14 Aug 2023 12:14:26 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20230814191426.GC1171@sol.localdomain>
References: <20230812004146.30980-1-krisman@suse.de>
 <20230812004146.30980-2-krisman@suse.de>
 <20230812015915.GA971@sol.localdomain> <875y5h7jld.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <875y5h7jld.fsf@suse.de>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 14, 2023 at 11:02:38AM -0400, Gabriel Krisman
 Bertazi wrote: > > Also, this patchset has been sitting for years before the
 latest > discussions, and I'm tired of it, so I'm happy to keep t [...] 
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
X-Headers-End: 1qVd1O-005kDK-T9
Subject: Re: [f2fs-dev] [PATCH v5 01/10] fs: Expose helper to check if a
 directory needs casefolding
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
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Aug 14, 2023 at 11:02:38AM -0400, Gabriel Krisman Bertazi wrote:
> 
> Also, this patchset has been sitting for years before the latest
> discussions, and I'm tired of it, so I'm happy to keep this
> discussion for another time.  Will drop this patch and just check
> IS_CASEFOLDED in ecryptfs for the next iteration.
> 
> I'll follow up with another case-insensitive cleanup patchset I've been
> siting on forever, which includes this patch and will restart this
> discussion, among others.
> 

Well, as we know unfortunately filesystem developers are in short supply, and
doing proper reviews (identifying issues and working closely with the patchset
author over multiple iterations to address them, as opposed to just slapping on
a Reviewed-by) is very time consuming.  Earlier this year I tried to get the
Android Systems team, which is ostensibly responsible for Android's use of
casefolding, to take a look, but their entire feedback was just "looks good to
me".  Also, the fact that this patchset originally excluded the casefold+encrypt
case technically made it not applicable to Android, and discouraged me from
taking a look since encryption is my focus.  Sorry for not taking a look sooner.

Anyway, thanks for doing this, and I think it's near the finish line now.  Once
you address the latest feedback and get a couple acks, I think that Christian
should take this through the VFS tree.  BTW, in my opinion, as the maintainer of
the "Unicode subsystem" you are also authorized to send a pull request for this
to Linus yourself.  But VFS does seem ideal in this case, given the diffstat,
and Christian has been fairly active with taking patches.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
