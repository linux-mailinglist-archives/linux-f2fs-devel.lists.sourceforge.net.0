Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E030277C0C3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Aug 2023 21:27:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qVdDV-0005Qh-Nl;
	Mon, 14 Aug 2023 19:27:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1qVdDT-0005QV-Ru
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 19:27:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=70L9iOyz+3hTot7rtrqY5ZGrPx0NyLuz59HdeX7c6Mk=; b=Yartm1hq/6nzW5HQT20ublmcMl
 TzZD4uCdS61b0Iuhig/4mkGZRwj/7a8EgF6dcJ+d27NyK/yt7VzO/8qDgq43+bhEoPm9tX5GyUuTj
 l1v2T872dqBrBocIbgYcbYKXt+AH3my7I1rvA1BDmBoiM5ooZ0LIjLJSO4ypGR2k0ZNA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=70L9iOyz+3hTot7rtrqY5ZGrPx0NyLuz59HdeX7c6Mk=; b=h6OLmQTmAvKtcECDrjUxxrJbsb
 636oby7ntxc3pGgr5i+rbv6+FhcvA2GDPvWnXwQKNtEnjtEPxrAU3dAxdSU5dCcHZKarYYz7w8mlq
 aQ1AX3FGpI3XgsfNH1d8xpBa9g/K2FzqJH9PEVnmFeVd4OSVNLbpAfCsi6KvJNp3Dtcg=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qVdDS-005lEe-0L for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Aug 2023 19:27:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6D6C9644F2;
 Mon, 14 Aug 2023 19:26:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99FC3C433C7;
 Mon, 14 Aug 2023 19:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692041215;
 bh=fjg4DjZzMYIVF7iw7C5dHBm34b2v2P4Jmnd1pWojAaA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=IxFaMJ9s/uADemNqFKoXvhhIhBt8PlFreQ3fm8aaV+KmgTwvSwcZ5qsDiQouPBGCq
 sPuJQs5g5hBM617V6qDCWSn5v/GFI7RNDbWZyGH/Zxl8tngrJrTJZw5gyJQ+oBX9/H
 5XpdcW26nThq4heeV5ygOCcIvQjnhEGLQMB2MYf1xv6PKMXCTwiybjSn9yNZiWxkI0
 P7qmEYql2qoQUJM0DxIeHubgVBVTevljUbcU9CV7hXkaeRL9CLGwhGdRkdLy3BZZ5Z
 R3EgLxCYjafUnO17Hhdzj+c0YF4gIJ2rc30qU/3UVKQpaYyPOl8IJ6XPKACtnp5sBy
 N2+KxU3PROCTw==
Date: Mon, 14 Aug 2023 12:26:54 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20230814192654.GE1171@sol.localdomain>
References: <20230812004146.30980-1-krisman@suse.de>
 <20230812004146.30980-7-krisman@suse.de>
 <20230812024145.GD971@sol.localdomain> <87a5ut7k62.fsf@suse.de>
 <20230814184214.GB1171@sol.localdomain> <87fs4l5t1e.fsf@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87fs4l5t1e.fsf@suse.de>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Aug 14, 2023 at 03:21:33PM -0400, Gabriel Krisman
 Bertazi wrote: > Eric Biggers <ebiggers@kernel.org> writes: > > > On Mon,
 Aug 14, 2023 at 10:50:13AM -0400, Gabriel Krisman Bertazi wrote: > > [...]
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
 0.0 T_FILL_THIS_FORM_SHORT Fill in a short form with personal
 information
X-Headers-End: 1qVdDS-005lEe-0L
Subject: Re: [f2fs-dev] [PATCH v5 06/10] libfs: Validate negative dentries
 in case-insensitive directories
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

On Mon, Aug 14, 2023 at 03:21:33PM -0400, Gabriel Krisman Bertazi wrote:
> Eric Biggers <ebiggers@kernel.org> writes:
> 
> > On Mon, Aug 14, 2023 at 10:50:13AM -0400, Gabriel Krisman Bertazi wrote:
> >> Eric Biggers <ebiggers@kernel.org> writes:
> >> 
> >> > On Fri, Aug 11, 2023 at 08:41:42PM -0400, Gabriel Krisman Bertazi wrote:
> >> >> +	/*
> >> >> +	 * Filesystems will call into d_revalidate without setting
> >> >> +	 * LOOKUP_ flags even for file creation (see lookup_one*
> >> >> +	 * variants).  Reject negative dentries in this case, since we
> >> >> +	 * can't know for sure it won't be used for creation.
> >> >> +	 */
> >> >> +	if (!flags)
> >> >> +		return 0;
> >> >> +
> >> >> +	/*
> >> >> +	 * If the lookup is for creation, then a negative dentry can
> >> >> +	 * only be reused if it's a case-sensitive match, not just a
> >> >> +	 * case-insensitive one.  This is needed to make the new file be
> >> >> +	 * created with the name the user specified, preserving case.
> >> >> +	 */
> >> >> +	if (flags & (LOOKUP_CREATE | LOOKUP_RENAME_TARGET)) {
> >> >> +		/*
> >> >> +		 * ->d_name won't change from under us in the creation
> >> >> +		 * path only, since d_revalidate during creation and
> >> >> +		 * renames is always called with the parent inode
> >> >> +		 * locked.  It isn't the case for all lookup callpaths,
> >> >> +		 * so ->d_name must not be touched outside
> >> >> +		 * (LOOKUP_CREATE|LOOKUP_RENAME_TARGET) context.
> >> >> +		 */
> >> >> +		if (dentry->d_name.len != name->len ||
> >> >> +		    memcmp(dentry->d_name.name, name->name, name->len))
> >> >> +			return 0;
> >> >> +	}
> >> >
> >> > This is still really confusing to me.  Can you consider the below?  The code is
> >> > the same except for the reordering, but the explanation is reworked to be much
> >> > clearer (IMO).  Anything I am misunderstanding?
> >> >
> >> > 	/*
> >> > 	 * If the lookup is for creation, then a negative dentry can only be
> >> > 	 * reused if it's a case-sensitive match, not just a case-insensitive
> >> > 	 * one.  This is needed to make the new file be created with the name
> >> > 	 * the user specified, preserving case.
> >> > 	 *
> >> > 	 * LOOKUP_CREATE or LOOKUP_RENAME_TARGET cover most creations.  In these
> >> > 	 * cases, ->d_name is stable and can be compared to 'name' without
> >> > 	 * taking ->d_lock because the caller holds dir->i_rwsem for write.
> >> > 	 * (This is because the directory lock blocks the dentry from being
> >> > 	 * concurrently instantiated, and negative dentries are never moved.)
> >> > 	 *
> >> > 	 * All other creations actually use flags==0.  These come from the edge
> >> > 	 * case of filesystems calling functions like lookup_one() that do a
> >> > 	 * lookup without setting the lookup flags at all.  Such lookups might
> >> > 	 * or might not be for creation, and if not don't guarantee stable
> >> > 	 * ->d_name.  Therefore, invalidate all negative dentries when flags==0.
> >> > 	 */
> >> > 	if (flags & (LOOKUP_CREATE | LOOKUP_RENAME_TARGET)) {
> >> > 		if (dentry->d_name.len != name->len ||
> >> > 		    memcmp(dentry->d_name.name, name->name, name->len))
> >> > 			return 0;
> >> > 	}
> >> > 	if (!flags)
> >> > 		return 0;
> >> 
> >> I don't see it as particularly better or less confusing than the
> >> original. but I also don't mind taking it into the next iteration.
> >> 
> >
> > Your commit message is still much longer and covers some quite different details
> > which seem irrelevant to me.  So if you don't see my explanation as being much
> > different, I think we're still not on the same page.  I hope that I'm not
> > misunderstanding anything, in which I believe that what I wrote above is a good
> > explanation and your commit message should be substantially simplified.
> > Remember, longer != better.  Keep things as simple as possible.
> 
> I think we are on the same page regarding the code.  I was under the
> impression your suggestion was regarding the *code comment* you proposed
> to replace, and not the commit message.  I don't see your code comment
> to be much different than the original.
> 
> The commit message has information accumulated on previous discussions,
> including the conclusions from the locking discussion Viro requested.
> I'll reword it too for the next iteration to see if I can make it more
> concise.
> 

Yes, I was talking about the code comment, but the commit message is explaining
the same thing so it needs to be consistent (or have the commit message just
reference the code).  As-is they seem to be in contradiction.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
