Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AC175A6B8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jul 2023 08:41:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qMNLf-0006SF-4q;
	Thu, 20 Jul 2023 06:41:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qMNLd-0006S8-PT
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jul 2023 06:41:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xPfDQnWVEYWyzCyaAVlpM3/f2ONEcTwcx2e8d4oWXe0=; b=k7s+GADiR4YJZBMEnsSqdcmcXn
 13hB5m+WI1dJskxkOOZ/AvIWFH/eOjV5QAVQC8BaLmQQkF6D40fH9bFo0wTqCYIvygzfMmGgYw+a4
 mdhbCdx4dc0RU2PWcjyG62IUYJzvK+GTD0yM53cPHHVFx1rZy+75yBQ9JE10ZjUaerbM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xPfDQnWVEYWyzCyaAVlpM3/f2ONEcTwcx2e8d4oWXe0=; b=W4WPSkLmZ/c1ulvdJ0nE2C3F0z
 BAsvptsvFiJdBB1a2Sm69EiUhk210PR279qTi2RoL22eELRSrFcPaUmxuU/GxAe2ZzogY4r/HN+9g
 KMDznrJ96tcxmLImSZEDZdXdJ/0hprO9sqHIOWy0zGoSeXo0tpyeYfFnhhgOfVLMsIa0=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qMNLb-00Dngt-DS for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jul 2023 06:41:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D0BDC618E6;
 Thu, 20 Jul 2023 06:41:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 552DCC433C8;
 Thu, 20 Jul 2023 06:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689835265;
 bh=Fwhi0QdXodruF3aPzC1ed/kg6TfNggfPfBJpEtC+W/0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=U3DUGZGhvBF3pagyXCkuIbkh9GWM1q9AYfi36o6jEgra1mWC3ycE0FPJbD082kCx3
 P/oGbwjAUdlYldRThWZ3uS7bSE3pkxaRIbXNmSdNi0UWDHivL6pTg29lFOKLTRthOU
 iC8s17z9eMP1NeOAk5z1f1a2VBpMxhEVLRaRGkv/UsbUZ8UsVG697+gvR+E6iJx+TP
 qJPnqqJd7pgTPkaxsFOSqAE0DL3TBxWu1mFZ/pC+jJLV8imrOEO1jR0DsOS528zxQE
 YfMrkx1zDkyMtYRIFowDoE4JzZiVyL0HyUkV+5s/v757AXZ8VSgRktKzdncdvmsR2+
 ceIDdIs4pcx2Q==
Date: Wed, 19 Jul 2023 23:41:03 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20230720064103.GC2607@sol.localdomain>
References: <20230719221918.8937-1-krisman@suse.de>
 <20230719221918.8937-4-krisman@suse.de>
 <20230720060657.GB2607@sol.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230720060657.GB2607@sol.localdomain>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jul 19, 2023 at 11:06:57PM -0700, Eric Biggers wrote:
 > > I'm also having trouble understanding exactly when ->d_name is stable
 here. > AFAICS, unfortunately the VFS has an edge case where a d [...] 
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
X-Headers-End: 1qMNLb-00Dngt-DS
Subject: Re: [f2fs-dev] [PATCH v3 3/7] libfs: Validate negative dentries in
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

On Wed, Jul 19, 2023 at 11:06:57PM -0700, Eric Biggers wrote:
> 
> I'm also having trouble understanding exactly when ->d_name is stable here.
> AFAICS, unfortunately the VFS has an edge case where a dentry can be moved
> without its parent's ->i_rwsem being held.  It happens when a subdirectory is
> "found" under multiple names.  The VFS doesn't support directory hard links, so
> if it finds a second link to a directory, it just moves the whole dentry tree to
> the new location.  This can happen if a filesystem image is corrupted and
> contains directory hard links.  Coincidentally, it can also happen in an
> encrypted directory due to the no-key name => normal name transition...

Sorry, I think I got this slightly wrong.  The move does happen with the
parent's ->i_rwsem held, but it's for read, not for write.  First, before
->lookup is called, the ->i_rwsem of the parent directory is taken for read.
->lookup() calls d_splice_alias() which can call __d_unalias() which does the
__d_move().  If the old alias is in a different directory (which cannot happen
in that fscrypt case, but can happen in the general "directory hard links"
case), __d_unalias() takes that directory's ->i_rwsem for read too.

So it looks like the parent's ->i_rwsem does indeed exclude moves of child
dentries, but only if it's taken for *write*.  So I guess you can rely on that;
it's just a bit more subtle than it first appears.  Though, some of your
explanation seems to assume that a read lock is sufficient ("In __lookup_slow,
either the parent inode is locked by the caller (lookup_slow) ..."), so maybe
there is still a problem.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
