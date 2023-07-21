Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B6D75BCAD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Jul 2023 05:12:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qMgZO-0001yd-AK;
	Fri, 21 Jul 2023 03:12:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qMgZM-0001yX-O7
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Jul 2023 03:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DQtu7PWQOcFIri4wCECQqLc7M9aQJ79hJrvfOpmCFMo=; b=eKU2zjayY4NvWd9YeI9KFqKCWg
 eqxSY2cW07vdQ70ITQ2sttNGVGr6MFFYlGcN+buHZ6AT6zzB78Fwv+6DOfk7CrFtAvVjWfZPpx4oU
 GLbIkIlZHVimkJViOO/OjKawjErmFQto9vgNPQHGFqmBO6tiOI1KHwrXHppGfL2GKtH0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DQtu7PWQOcFIri4wCECQqLc7M9aQJ79hJrvfOpmCFMo=; b=DSE+eOkpdvffulI84K5BdTkxf6
 wPbzDUEGN4m7b/l+Vm7ngRf30TSsmMh8wkVVyidBKKUHxH1Z2GuDZ8sgB4XsywmlEMY07falks8Xa
 /J0qjesOBXimIAsruXukreXMFkZgIACOQetGS2VqeOqe3lUqt1+LCY0HVFthgZN8nKCs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qMgZK-00013w-99 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Jul 2023 03:12:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B0A4761CD6;
 Fri, 21 Jul 2023 03:12:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB997C433C9;
 Fri, 21 Jul 2023 03:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689909152;
 bh=P5PD4WZdZoh4pNtL4TIN7fX5fHYnGq0RuYxMKGgCGno=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rcQnlg/RpT+yJL8B+6Vo2Kzu3FNEcBcT+fvC2InxQjcmOp3MmcAQER/qSX4LrFwsh
 b+b//akbq3N+YiK4oeizbbruyqPk4zQfphMsarDQk7BK+jgE6Yhn0uuTEETn6yRLQv
 mAq5r6NP0DGVy0q5EXiqTCBT9Xml1uKDiBW56GgKNZjBOld2tzFRDJY3khxpoN5uef
 JazRSzDOTLAqko4CIxmw+N04KXPyvwukfjAHmL2zYTBR4sDvsPVwWKuhhko1UnU1nb
 QeuTN9sw8DkD2JU0osKGLDPKeM1adSD52pKcuvv3MBkltj+O1kKMZfx6qHG7MOPAV3
 IPOKZ5dA+uSlQ==
Date: Thu, 20 Jul 2023 20:12:30 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20230721031230.GA847@sol.localdomain>
References: <20230719221918.8937-1-krisman@suse.de>
 <20230720074318.GA56170@sol.localdomain> <87y1ja4hau.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87y1ja4hau.fsf@suse.de>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Jul 20, 2023 at 01:35:37PM -0400, Gabriel Krisman
 Bertazi wrote: > Eric Biggers <ebiggers@kernel.org> writes: > > >> Another
 problem exists when turning a negative dentry to positive. If > >> [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qMgZK-00013w-99
Subject: Re: [f2fs-dev] [PATCH v3 0/7] Support negative dentries on
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
Cc: brauner@kernel.org, tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Thu, Jul 20, 2023 at 01:35:37PM -0400, Gabriel Krisman Bertazi wrote:
> Eric Biggers <ebiggers@kernel.org> writes:
> 
> >> Another problem exists when turning a negative dentry to positive.  If
> >> the negative dentry has a different case than what is currently being
> >> used for lookup, the dentry cannot be reused without changing its name,
> >> in order to guarantee filename-preserving semantics to userspace.  We
> >> need to either change the name or invalidate the dentry. This issue is
> >> currently avoided in mainline, since the negative dentry mechanism is
> >> disabled.
> >
> > Are you sure this problem even needs to be solved?
> 
> Yes, because we promise name-preserving semantics.  If we don't do it,
> the name on the disk might be different than what was asked for, and tools
> that rely on it (they exist) will break.  During initial testing, I've
> had tools breaking with case-insensitive ext4 because they created a
> file, did getdents and wanted to see exactly the name they used.
> 
> > It actually isn't specific to negative dentries.  If you have a file "foo"
> > that's not in the dcache, and you open it (or look it up in any other way) as
> > "FOO", then the positive dentry that gets created is named "FOO".
> >
> > As a result, the name that shows up in /proc/$pid/fd/ for anyone who has the
> > file open is "FOO", not the true name "foo".  This is true even for processes
> > that open it as "foo", as long as the dentry remains in the dcache.
> >
> > No negative dentries involved at all!
> 
> I totally agree it is goes beyond negative dentries, but this case is
> particularly important because it is the only one (that I know of) where
> the incorrect case might actually be written to the disk.  other cases,
> like /proc/<pid>/fd/ can just display a different case to userspace,
> which is confusing.  Still, the disk has the right version, exactly as
> originally created.
> 
> I see the current /proc/$pid/fd/ semantics as a bug. In fact, I have/had
> a bug report for bwrap/flatkpak breaking because it was mounting
> something and immediately checking /proc/mounts to confirm it worked.  A
> former team member tried fixing it a while ago, but we didn't follow up,
> and I don't really love the way they did it.  I need to look into that.
> 
> > Or, it looks like the positive dentry case is solvable using d_add_ci().
> > So maybe you are planning to do that?  It's not clear to me.
> 
> I want to use d_add_ci for the future, yes. It is not hard, but not
> trivial, because there is an infinite recursion if d_add_ci uses
> ->d_compare() when doing the lookup for a duplicate.  We sent a patch to
> fix d_add_ci a while ago, but it was rejected.  I need to revisit.
> 

Thanks, I missed that choosing a different-case dentry actually changes the name
given to the new file.  This is because the filesystem is told about the name of
the file to create via the negative dentry that gets found/created -- not via
the original user-specified string.  It would help if you made this clear in a
code comment.  Taking the comment I suggested, I'd maybe revise it to:

			/*
			 * If the lookup is for creation, then a negative dentry
			 * can only be reused if it's a case-sensitive match,
                         * not just a case-insensitive one.  This is needed to
                         * make the new file be created with the name the user
                         * specified, preserving case.
			 *

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
