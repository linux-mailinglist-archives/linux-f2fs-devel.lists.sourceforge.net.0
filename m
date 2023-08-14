Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4584B77BED6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Aug 2023 19:23:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qVbHP-0007Kn-KR;
	Mon, 14 Aug 2023 17:23:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qVbHO-0007Kh-Po
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 17:22:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ymN1NRitGFEa+h05AoYQGrpirsEaAyJB9fgdbGL2Cw4=; b=THu5sDay38OugHyamwLHQ/TAV9
 g8L/d2Y7OsrwgS0NxG3KWv3+h2twTT+L4phIxAWbgoc6aptLZVKu1ymX4p+9Rc9CLk38qveNYxwbx
 B8Z18blNfa//RJLhR+Tk1PfKybC1jS5gI3LFZXeaf76FCes7K6g1jYJ0smp2P6tvvKMo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ymN1NRitGFEa+h05AoYQGrpirsEaAyJB9fgdbGL2Cw4=; b=fTR0bvtTmpDtwivstvAdNV9dD7
 Vohd0iP6oeVSa/FGUSNaUrcu3KshH3roL9QuCJZMDBATQ3C7MXd/kJ6eV5SIwKei999/RNRdeEy9j
 lL+H4TIWY5vk6r4XuvnWkB1Yr1f4Ht38bovc/ZD5gU9JUA1yRKqvbwg809W/+5FvLrlc=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qVbHJ-005YV0-TG for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 17:22:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AF36562DB9;
 Mon, 14 Aug 2023 17:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBFFCC433C8;
 Mon, 14 Aug 2023 17:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692033766;
 bh=HcH8g72IkEwqVXV3lVVbi32T8H+EA8+1qJxaP105Xfc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=hrOYKvFiqhixgSM3rPYD6HDsAi1fNiaEvml5tIsXeUZuaYCMdhBJy+xLXaA1boJcX
 bWCVTn/8F1xBm3i27RgrGdjLTC+cHeHejNbeKLT5R5u9OOqRtCmz8EBcn2tIvR+RaD
 ACVydvxnj5JQdh5euSNa9NvD3133Jfjhcifv5rpQ3u26XLs2LNwbTD//oaT3DmPdHi
 44XdHIPj6FEn7hGOppi2pHVrZT0EXHC5wH7Ax0YQ+fJyVPdo6LHiysFbvgMjezMGyL
 Yu+T2qJjzcXnDKtNVPNKo20MtYo9Uyv+C9LToeSxQeOEzeoeYfQAQmKC156z0kIEyK
 EIHXNkzekshKw==
Date: Mon, 14 Aug 2023 10:22:44 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Message-ID: <20230814172244.GA1171@sol.localdomain>
References: <20230812004146.30980-1-krisman@suse.de>
 <20230812004146.30980-2-krisman@suse.de>
 <20230812015915.GA971@sol.localdomain>
 <20230812230647.GB2247938@mit.edu>
 <ZNhJSlaLEExcoIiT@casper.infradead.org>
 <20230813043022.GA3545@sol.localdomain>
 <20230814113852.GD2247938@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230814113852.GD2247938@mit.edu>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 14, 2023 at 07:38:52AM -0400,
 Theodore Ts'o wrote:
 > On Sat, Aug 12, 2023 at 09:30:22PM -0700, Eric Biggers wrote: > > Well,
 one thing that the kernel community can do to make things bette [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qVbHJ-005YV0-TG
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
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Aug 14, 2023 at 07:38:52AM -0400, Theodore Ts'o wrote:
> On Sat, Aug 12, 2023 at 09:30:22PM -0700, Eric Biggers wrote:
> > Well, one thing that the kernel community can do to make things better is
> > identify when a large number of bug reports are caused by a single issue
> > ("userspace can write to mounted block devices"), and do something about that
> > underlying issue (https://lore.kernel.org/r/20230704122727.17096-1-jack@suse.cz)
> > instead of trying to "fix" large numbers of individual "bugs".  We can have 1000
> > bugs or 1 bug, it is actually our choice in this case.
> 
> That's assuming the syzbot folks are willing to enable the config in
> Jan's patch.  The syzbot folks refused to enable it, unless the config
> was gated on CONFIG_INSECURE, which I object to, because that's
> presuming a threat model that we have not all agreed is valid.
> 
> Or rather, if it *is* valid some community members (or cough, cough,
> **companies**) need to step up and supply patches.  As the saying
> goes, "patches gratefully accepted".  It is *not* the maintainer's
> responsibility to grant every single person whining about a feature
> request, or even a bug fix.

They did disable CONFIG_XFS_SUPPORT_V4.  Yes, there was some pushback, but they
are very understandably (and correctly) concerned about ending up in a situation
where buggy code is disabled for syzkaller but enabled for everyone else.  They
eventually did accept the proposal to disable CONFIG_XFS_SUPPORT_V4, for reasons
including the fact that there is a concrete deprecation plan.  (FWIW, the XFS
maintainers had also pushed back strongly when I suggested adding a kconfig
option for XFS v4 support back in 2018.  Sometimes these things just take time.)

Anyway, syzkaller is just the messenger that is reminding us of a problem.  The
actual problem here is that "make filesystems robust against concurrent changes
to block device's page cache" is effectively unsolvable.  *Every* memory access
to the cache would need to use READ_ONCE/WRITE_ONCE, and *every* re-read of
every field would need to be fully re-validated.  PageChecked would need to go
away for metadata, as it would be invalid to cache the checked status at all.
There's basically zero chance of getting this correct; filesystems struggle to
validate even the metadata read from disk correctly, so how are they going to
successfully continually revalidate all cached metadata in memory?

I don't understand why we would waste time trying to do that instead of focusing
on an actual solution.  Sure, probably The Linux Filesystem Maintainers(TM)
don't have time to help with migrating legacy use cases of writing to mounted
block devices, but that just means that someone needs to step up to do it.  It
doesn't mean that they need to instead waste time on pointless "fixes".

Keep in mind, the syzkaller team isn't asking for these pointless "fixes"
either.  They'd very much prefer 1 fix to 1000 fixes.  I think some confusion
might be arising from the very different types of problems that syzkaller finds.
Sometimes 1 syzkaller report == 1 bug == 1 high-priority "must fix" bug == 1
vulnerability == 1 fix needed.  But in general syzkaller is just letting kernel
developers know about a problem, and it is up to them to decide what to do about
it.  In this case there is one underlying issue that needs to be fixed, and the
individual syzkaller reports that result from that issue are not important.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
