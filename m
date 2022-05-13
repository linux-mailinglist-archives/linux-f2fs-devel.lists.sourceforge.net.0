Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AEEB2526D84
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 May 2022 01:26:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1npeg2-0008Sf-Tq; Fri, 13 May 2022 23:26:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1npefl-0008SS-Az
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 May 2022 23:26:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VdFC3+FADkegeQ4Fsgc4kbMVnpOxbix80ttX5F7DeRg=; b=SoU6BNIJkAOAf2HwBDqfBxOMIe
 Bv0Wj6rij1cmu9EwXz5G2LScmMT/k5BaAk6/Rq24Pya82snM5ajhQe3u2q3uNt7l3DocJKy7Gs1gC
 KLko6Aw0hoW8x42LoXH5XCzekI04IC90oqCa8cWKUrRv8Fasmt9gADMq+SHinlf16rhk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VdFC3+FADkegeQ4Fsgc4kbMVnpOxbix80ttX5F7DeRg=; b=akPOUPJCEi2T+3Qv1ZiJQHbjMM
 BQ8gHcR3sKdorVhAf6O4iC7wGQpPpg3OYQtHoE/L/5KRjXFIk5xjJjCMyGk3z2nG/CAYHJFyDGoH9
 /l0/UGpqgt18L4nhGWn3fkXDHnSMpy4Jx6v1/R3YZOsIhkQxeGWdzthuopbdo+pv7ZJw=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1npefi-00BPeQ-BH
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 May 2022 23:26:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0F8BEB83222;
 Fri, 13 May 2022 23:26:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65764C34113;
 Fri, 13 May 2022 23:26:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1652484362;
 bh=VEmygfrCHywucMVMmgrfbT8EmWJSME+dfPPcFKelPLA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=W1mydoCEeLrq4kdzHWmgByH7V3mGFRclrb3BjOdic8VR5jWGxXziLNZl0SgG/Tl4R
 9mI2Glau7zwC2K5uGiBtp4Mb1NBqhBoOlmdLy246xlRvDD0SrIU6ncQEahqS9ngvYc
 W5s/wrmQnTo/gTsbBuFXQpO6mslc2ElfmP1a/SW6UuuX+wy0lvQ8+1ByQn4ivkSx5V
 0pICcZ2hHbTDheOjaLYiKubqfttI2xjkLT/u+ZJcc6H8JZQNds/qfjjvD/3QHAJeAA
 KcIee4qgJEz2TwrQCq6cyAUdMy7FTlEbVeUE4r/RDvDM83chiTKERVQLLrpf9ErL/0
 A5HgYFOZWNbpg==
Date: Fri, 13 May 2022 16:26:00 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Message-ID: <Yn7pCEVAq0V4pcp7@sol.localdomain>
References: <20220501050857.538984-1-ebiggers@kernel.org>
 <Yn6zJR2peMo5hIcF@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Yn6zJR2peMo5hIcF@mit.edu>
X-Spam-Score: -5.8 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, May 13, 2022 at 03:36:05PM -0400,
 Theodore Ts'o wrote:
 > On Sat, Apr 30, 2022 at 10:08:50PM -0700, Eric Biggers wrote: > > We can
 either take all these patches through the fscrypt tree, or we [...] 
 Content analysis details:   (-5.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1npefi-00BPeQ-BH
Subject: Re: [f2fs-dev] [PATCH v2 0/7] test_dummy_encryption fixes and
 cleanups
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
Cc: Jeff Layton <jlayton@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Lukas Czerner <lczerner@redhat.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, May 13, 2022 at 03:36:05PM -0400, Theodore Ts'o wrote:
> On Sat, Apr 30, 2022 at 10:08:50PM -0700, Eric Biggers wrote:
> > We can either take all these patches through the fscrypt tree, or we can
> > take them in multiple cycles as follows:
> > 
> >     1. patch 1 via ext4, patch 2 via f2fs, patch 3-4 via fscrypt
> >     2. patch 5 via ext4, patch 6 via f2fs
> >     3. patch 7 via fscrypt
> > 
> > Ted and Jaegeuk, let me know what you prefer.
> 
> In order to avoid patch conflicts with other patch series, what I'd
> prefer is to take them in multiple cycles.  I can take patch #1 in my
> initial pull request to Linus, and then do a second pull request to
> Linus with patch #5 post -rc1 or -rc2 (depending on when patches #3
> and #4 hit Linus's tree).
> 
> Does that sound good?

That basically sounds fine.  I've just sent out v3 of this series, with the fix
for the memory leak in parse_apply_sb_mount_options() as its own patch.  That
patch can be applied now too, so you can take patches 1-2 of the v3 series in
your initial pull request.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
