Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A1CA477A424
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 13 Aug 2023 01:07:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qUxhU-0006kl-Ro;
	Sat, 12 Aug 2023 23:07:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <tytso@mit.edu>) id 1qUxhT-0006kf-Ii
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Aug 2023 23:07:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9bn+ohKg+ghUW2txD551p5T3wS+9+MovG54qvNqbRtM=; b=kT6TBnWslU7vVRNiPn1vMYv6FZ
 vWtN98NDnqN6eWmQiheYipul1uNmrBYdp2OtTAw+I19tILkpHDSLtaBiOJXaVVkyQfhDd4oKKclTt
 geaDN6vytvNt+4Eve+t+9pk72SbiHOMt8mHJ3vjL6KPBPx0DWx2e+kl5n4G0bzD2XqAs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9bn+ohKg+ghUW2txD551p5T3wS+9+MovG54qvNqbRtM=; b=OkMn9fbZnminiNbMQ6MkaSx6lI
 +Hmpay20qSV9QnLnNEZCEiB6hdZcyB7mM9Zj0q4k7AG8DrczyV4RiEFP9P0y9U2ANYItB2vpteP5j
 Dd+aLLd1+Bbvu7y5NyGPNEB+CXiaiHXDOmHrDPbYAafZiw5I5LHA0pUJQ3tUzUMl+Id8=;
Received: from outgoing-auth-1.mit.edu ([18.9.28.11] helo=outgoing.mit.edu)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qUxhS-003own-TJ for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 12 Aug 2023 23:07:15 +0000
Received: from cwcc.thunk.org (pool-173-48-82-92.bstnma.fios.verizon.net
 [173.48.82.92]) (authenticated bits=0)
 (User authenticated as tytso@ATHENA.MIT.EDU)
 by outgoing.mit.edu (8.14.7/8.12.4) with ESMTP id 37CN6mVO014307
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Sat, 12 Aug 2023 19:06:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mit.edu; s=outgoing;
 t=1691881612; bh=9bn+ohKg+ghUW2txD551p5T3wS+9+MovG54qvNqbRtM=;
 h=Date:From:Subject:Message-ID:MIME-Version:Content-Type;
 b=mvguaUSTYs57TQv3jE1NcPKPtmbX+5P1FJK3x4qCT7X7+bxjdR9Da7i5n+Wdwgk5p
 HpWEh4oW7R+ksSyDy2MW1+MdMprUA+1ehBahLGxtHI0tPTXxx0MMyU7N/cjN5Z0A//
 yDGDWbI6O4TXx++t1HdBSgudrdO3uxUME72iHJ4jasVdEhIt3X4MpaY4aJRILqC3xz
 cXOYr7kDi2j76PJzGU5v7aSZ6J0OkWPbcuqxJHFfsfRSLb4X8LhfuuWBz8HDJjt8BC
 nPvbXt4W4hDMoNjHJ5DgNDZIndXKWXXSVRPp2ihQmnHlSZNeoeUi73hQTpExwxBDaQ
 QEnWpIsLP0MDw==
Received: by cwcc.thunk.org (Postfix, from userid 15806)
 id 8E17015C04FF; Sat, 12 Aug 2023 19:06:47 -0400 (EDT)
Date: Sat, 12 Aug 2023 19:06:47 -0400
From: "Theodore Ts'o" <tytso@mit.edu>
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20230812230647.GB2247938@mit.edu>
References: <20230812004146.30980-1-krisman@suse.de>
 <20230812004146.30980-2-krisman@suse.de>
 <20230812015915.GA971@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230812015915.GA971@sol.localdomain>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Aug 11, 2023 at 06:59:15PM -0700, Eric Biggers wrote:
 > > To be honest I've always been confused about why the ->s_encoding check
 is > there. It looks like Ted added it in 6456ca6520ab ("ext4: [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [18.9.28.11 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qUxhS-003own-TJ
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
Cc: Gabriel Krisman Bertazi <krisman@suse.de>, brauner@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Aug 11, 2023 at 06:59:15PM -0700, Eric Biggers wrote:
> 
> To be honest I've always been confused about why the ->s_encoding check is
> there.  It looks like Ted added it in 6456ca6520ab ("ext4: fix kernel oops
> caused by spurious casefold flag") to address a fuzzing report for a filesystem
> that had a casefolded directory but didn't have the casefold feature flag set.
> It seems like an unnecessarily complex fix, though.  The filesystem should just
> reject the inode earlier, in __ext4_iget().  And likewise for f2fs.  Then no
> other code has to worry about this problem.

It's not enough to check it in ext4_iget, since the casefold flag can
get set *after* the inode has been fetched, but before you try to use
it.  This can happen because syzbot has opened the block device for
writing, and edits the superblock while it is mounted.

One could say that this is an insane threat model, but the syzbot team
thinks that this can be used to break out of a kernel lockdown after a
UEFI secure boot.  Which is fine, except I don't think I've been able
to get any company (including Google) to pay for headcount to fix
problems like this, and the unremitting stream of these sorts of
syzbot reports have already caused one major file system developer to
burn out and step down.

So problems like this get fixed on my own time, and when I have some
free time.  And if we "simplify" the code, it will inevitably cause
more syzbot reports, which I will then have to ignore, and the syzbot
team will write more "kernel security disaster" slide deck
presentations to senior VP's, although I'll note this has never
resulted in my getting any additional SWE's to help me fix the
problem...

> So just __ext4_iget() needs to be fixed.  I think we should consider doing that
> before further entrenching all the extra ->s_encoding checks.

If we can get an upstream kernel consensus that syzbot reports caused
by writing to a mounted file system aren't important, and we can
publish this somewhere where hopefully the syzbot team will pay
attention to it, sure...


						- Ted


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
