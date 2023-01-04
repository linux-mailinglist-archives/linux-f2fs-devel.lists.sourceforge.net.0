Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1984B65CCED
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Jan 2023 07:18:36 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pCx6d-0003iS-6j;
	Wed, 04 Jan 2023 06:18:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1pCx6b-0003iM-5U
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 06:18:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gPlXcBEzWh8xY2NY5eoYT/zwnpzg8k+/ibjPqPIOXV4=; b=Kf/Kw6mleI9P7KXVGVhCTdKUjR
 KP3ZSKxSe5jAas8NMdTVgYQpwXgLVLwTSzUAwuVuSn9o7b5M4eqOS4Y0HK36GOuQhozr8zKuLiTw0
 KfvTQEw++eke/9CHINYOM4jS5xqjwgrZ2kz5/5KJSkO1Lqlp6bLHZaFPHyBquxrfQGKQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gPlXcBEzWh8xY2NY5eoYT/zwnpzg8k+/ibjPqPIOXV4=; b=ZQhIknFqdupSZb7KcVjWbP2SlK
 gfOyPK8LA3CCP4ViY+ELdBFW1pwC8gcMPLzi74uoNdFvROEsrgFgJOsRMBtjt8NO+eKSUdwmb4LXo
 P+FTdr6k/WGRM7lhTGWbbdoP8oN7Kvy3cFkbVu1xuFl+J2n0gOLSjXm2eT92FMdb8zxg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pCx6W-0048Kw-KH for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Jan 2023 06:18:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3A30D6159B;
 Wed,  4 Jan 2023 06:18:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D047C433D2;
 Wed,  4 Jan 2023 06:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1672813098;
 bh=DBY4jMEWOuEAJNxXAZ5rQGraJjDahePvtutNdyhGoYk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=OBmEiefA3TOk9FCHuqvw17zbZUJREr6j9bKMK1k2EJf0l3mgnCPAB28AQQbEfNKgU
 XtZViSO+OWn+QAfZvWJpzaz9UYxy5qrK6LLBG5DFYwy+sBBgXDT17fjM3MbbvyBsB+
 sdcELjlC2rBFGROjYj1nipCoSLz+rOUzykpsox0WVLZpbFRnhOV0dS4Xcia6cUQo9g
 TV/NYAhkxUXzDuF2Mr4tVMuLer6kpt/v9VSzrupmxtupwau7DWlN446lVja6CN6b+O
 l84fFh/w7n+zKdYEsOUkJiwFrTslui8UlO0sbfpDHwzP6hI6+heKBq4FeDXtFSFKpE
 yrAPd7EycKjpw==
Date: Tue, 3 Jan 2023 22:18:16 -0800
From: Eric Biggers <ebiggers@kernel.org>
To: Theodore Ts'o <tytso@mit.edu>
Message-ID: <Y7UaKGqKPHsZyZn8@sol.localdomain>
References: <Y5jRbLEJh3S46Jer@sol.localdomain>
 <Y6ObULdVm2UN5kw1@sol.localdomain> <Y6SLC9DG1s/4NhPL@mit.edu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <Y6SLC9DG1s/4NhPL@mit.edu>
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Dec 22, 2022 at 11:51:23AM -0500,
 Theodore Ts'o wrote:
 > On Wed, Dec 21, 2022 at 03:48:32PM -0800, Eric Biggers wrote: > > > What
 would people say about having a separate mailing list, git rep [...] 
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pCx6W-0048Kw-KH
Subject: Re: [f2fs-dev] Separate mailing list (and git and patchwork) for
 fsverity?
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Dec 22, 2022 at 11:51:23AM -0500, Theodore Ts'o wrote:
> On Wed, Dec 21, 2022 at 03:48:32PM -0800, Eric Biggers wrote:
> > > What would people say about having a separate mailing list, git repo, and
> > > patchwork project for fsverity?  So the fsverity entry would look like:
> > > 
> > > FSVERITY: READ-ONLY FILE-BASED AUTHENTICITY PROTECTION
> > > [...]
> > > L:      linux-fsverity@vger.kernel.org
> > > Q:      https://patchwork.kernel.org/project/linux-fsverity/list/
> > > T:      git git://git.kernel.org/pub/scm/fs/fsverity/fsverity.git
> > > [...]
> 
> This makes sense to me.  I wonder if we should use the new
> https://lists.linux.dev mailing list hosting service with a mailing
> list name fsverity@lsts.linux.dev?
> 
> The thinking was that we would eventually migrate lists from vger to
> the new list infrastructure, so it might make sense to just use it for
> a new list.  All mailing lists lists.linux.dev are archived on
> lore.kernel.org, so other than the e-mail address and using something
> a bit more modern than Majordomo for list management, it's mostly the
> same.
> 
> 						- Ted

Thanks Ted!  I'm half-tempted to still use linux-fsverity@vger.kernel.org, for
consistency with most of the existing lists...  But it does seem that the ship
on new lists using lists.linux.dev has already sailed.  So I think I'll go with
fsverity@lists.linux.dev.

Any other opinions from anyone on this, or on the proposed new git repo and
branches, before I send off the helpdesk request?

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
