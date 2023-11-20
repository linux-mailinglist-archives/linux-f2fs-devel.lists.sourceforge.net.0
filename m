Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C5C887F16B3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Nov 2023 16:06:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r55r5-0000ub-I6;
	Mon, 20 Nov 2023 15:06:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <brauner@kernel.org>) id 1r55qz-0000u7-9O
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Nov 2023 15:06:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1F75UDdeWHvUyxXulge/S21c4tQRUJjGvMRV5PBrby0=; b=elvIPugimnUSU/aJoNY5svYq+e
 WaH2adECAGm4GBTTuAgwjkKuWikFLTfp70oiWBe/KInQjJQpuZ6ilK9tWJH05ll7BZ4LziIZmTTVy
 m3G/VPlnvHjl5cFQ7NI6wnLyMPPjtONZ7qRk7CrO/Nn/m/1hisSKsG26kO6zCvO6WMuY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1F75UDdeWHvUyxXulge/S21c4tQRUJjGvMRV5PBrby0=; b=B1nei218CyuupMaGds/f/9KtTz
 1B2HZd/HzVr8EypG2MUscFAQtEAo23BNGvejdZgc/i7fxGk8LGOEBs4EpXOc9KAjBwGfzcZRNAm14
 ca3P4NNAem6ASEwHY3nqFZYqIN0ei+A/v2emfoPUGlz55pzaPQ38ZsRVbg4XryIy7j+w=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1r55qv-00BAFX-OD for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Nov 2023 15:06:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 76174B81916;
 Mon, 20 Nov 2023 15:06:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8025FC433C9;
 Mon, 20 Nov 2023 15:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1700492774;
 bh=7t2WZjjvqByOeMC7OwZNB8LTlJ8j6xY5BoTSVtlNVBU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EF6Z/rtEhniaZrtGdJKsW3utjme11UiwENJ1Z56AsfL/01wu3w5rMsL48SRnxZZiG
 RXc6n24Hx6Nmbb8WwlcLcn0uKdVOGFV2go577Weg30nzhj7P+G0No5F59K+986q93d
 ++ji5ZXgDOju8wFsv3dAijcRlJJQruSMJsK1o3hhA6w954eVj3HPYsJDeM9eF2gI/6
 PrD2G9xqJQsF2ZR2CQwHumlIBDHpeJFmq9g0h1YEYKjhHdHhhFjEzYnJYoljtcP19w
 DNwM3t9vM4Bo/ZRsGQt9j41wn62PVmfCHID1frEQJsTGtDpcfBWT4BCF1PulMnEH1G
 ecbbA15TmOplw==
Date: Mon, 20 Nov 2023 16:06:09 +0100
From: Christian Brauner <brauner@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>, viro@zeniv.linux.org.uk,
 Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <20231120-nihilismus-verehren-f2b932b799e0@brauner>
References: <20230816050803.15660-1-krisman@suse.de>
 <20231025-selektiert-leibarzt-5d0070d85d93@brauner>
 <655a9634.630a0220.d50d7.5063SMTPIN_ADDED_BROKEN@mx.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <655a9634.630a0220.d50d7.5063SMTPIN_ADDED_BROKEN@mx.google.com>
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sun, Nov 19, 2023 at 06:11:39PM -0500, Gabriel Krisman
 Bertazi wrote: > Christian Brauner <brauner@kernel.org> writes: > > > On Wed, 
 16 Aug 2023 01:07:54 -0400, Gabriel Krisman Bertazi wrote: > >> [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1r55qv-00BAFX-OD
Subject: Re: [f2fs-dev] [PATCH v6 0/9] Support negative dentries on
 case-insensitive ext4 and f2fs
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
Cc: tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net, ebiggers@kernel.org,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, Nov 19, 2023 at 06:11:39PM -0500, Gabriel Krisman Bertazi wrote:
> Christian Brauner <brauner@kernel.org> writes:
> 
> > On Wed, 16 Aug 2023 01:07:54 -0400, Gabriel Krisman Bertazi wrote:
> >> This is v6 of the negative dentry on case-insensitive directories.
> >> Thanks Eric for the review of the last iteration.  This version
> >> drops the patch to expose the helper to check casefolding directories,
> >> since it is not necessary in ecryptfs and it might be going away.  It
> >> also addresses some documentation details, fix a build bot error and
> >> simplifies the commit messages.  See the changelog in each patch for
> >> more details.
> >> 
> >> [...]
> >
> > Ok, let's put it into -next so it sees some testing.
> > So it's too late for v6.7. Seems we forgot about this series.
> > Sorry about that.
> 
> Christian,
> 
> We are approaching -rc2 and, until last Friday, it didn't shown up in
> linux-next. So, to avoid turning a 6 month delay into 9 months, I pushed
> your signed tag to linux-next myself.
> 
> That obviously uncovered a merge conflict: in v6.6, ceph added fscrypt,
> and the caller had to be updated.  I fixed it and pushed again to
> linux-next to get more testing.
> 
> Now, I don't want to send it to Linus myself. This is 100% VFS/FS code,
> I'm not the maintainer and it will definitely raise eyebrows.  Can you
> please requeue and make sure it goes through this time?  I'm happy to

My current understanding is that core dcache stuff is usually handled by
Al. And he's got a dcache branches sitting in his tree.

So this isn't me ignoring you in any way. My hands are tied and so I
can't sort this out for you easily.

> drop my branch from linux-next once yours shows up.
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/krisman/unicode.git/log/?h=negative-dentries
> 
> This branch has the latest version with the ceph conflict folded in.  I
> did it this way because I'd consider it was never picked up and there is
> no point in making the history complex by adding a fix on top of your
> signed tag, since it already fails to build ceph.
> 
> I can send it as a v7; but I prefer you just pull from the branch
> above. Or you can ack and I'll send to Linus.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
