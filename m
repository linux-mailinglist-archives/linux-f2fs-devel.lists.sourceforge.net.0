Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FDFE78306C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Aug 2023 20:53:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qYA24-0003Hs-11;
	Mon, 21 Aug 2023 18:53:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1qYA20-0003Hl-DG
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Aug 2023 18:53:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nd67bGfV1KhCemr7IE4Dyv8OFK+mAXQ8eNOnMuZJU1Y=; b=BDeZ/wY94s1HUWUI4A/T7KS5m9
 BI3J9b7JLChwOG8Ow5B9jl9Sm7Lbdct7DiTrCXadv10lmCdXBvzKTy3AcVY8qYmWlBPcGgjRdmzqU
 Lqe4i+kGN6qhkcUJvd7Yf/szSj/l5YB06Yi4zmROJrZ2UhYhoHTKyw5lV7SG8FKPOYOU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nd67bGfV1KhCemr7IE4Dyv8OFK+mAXQ8eNOnMuZJU1Y=; b=aZ/NgkC4sP9LjwHk3mGybRyMqF
 f5x3v8Dny8hLi7dC5R8om3ROL8G4t68sKhSZdr9YQc6yr1TzwJ3SJ9WXXplSFtZTJ4UOGZMeIyod6
 hBR3Ht+NjFG1Mi93SX0Skx67K7djNJajMvhhwfwE8AD3YhO8lB53t0ZR5yVC0WEaRQWc=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qYA1z-0004oA-C7 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Aug 2023 18:53:40 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 2D99B22BEF;
 Mon, 21 Aug 2023 18:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1692644008; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nd67bGfV1KhCemr7IE4Dyv8OFK+mAXQ8eNOnMuZJU1Y=;
 b=yOcguDz1a0LAVX4UvhR8ca45H5AahyHKyLZ45z0o2XxhR6AzDrq+Yrj+qu65l9TBNZm1p/
 1jJm3WZEmU6uIPiBvQYv57UtKHpvpY46ZnQyr8Hsiarzjgu03EKmBJBRtdn5C1tBRzZOwk
 W9Uh4nzQL+PC2ICwCg7yFnIFcrXcs1c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1692644008;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nd67bGfV1KhCemr7IE4Dyv8OFK+mAXQ8eNOnMuZJU1Y=;
 b=hVOmNCKJNw1sHxkFh1gX1fF+I762Xot715XhVhJDX41uM/onCZWkBV8mXdE4vpvbLnDlHa
 NqsN9DllNJfaObCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E9C391330D;
 Mon, 21 Aug 2023 18:53:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id Bw5hM6ey42QodQAAMHmgww
 (envelope-from <krisman@suse.de>); Mon, 21 Aug 2023 18:53:27 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Christian Brauner <brauner@kernel.org>
In-Reply-To: <20230821-derart-serienweise-3506611e576d@brauner> (Christian
 Brauner's message of "Mon, 21 Aug 2023 17:52:37 +0200")
Organization: SUSE
References: <20230816050803.15660-1-krisman@suse.de>
 <20230817170658.GD1483@sol.localdomain>
 <20230821-derart-serienweise-3506611e576d@brauner>
Date: Mon, 21 Aug 2023 14:53:26 -0400
Message-ID: <871qfwns61.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Christian Brauner <brauner@kernel.org> writes: > On Thu, Aug
 17, 2023 at 10:06:58AM -0700, Eric Biggers wrote: >> On Wed, Aug 16, 2023
 at 01:07:54AM -0400, Gabriel Krisman Bertazi wrote: >> > Hi, >> > >> > This
 is v6 of the negative dentry on case [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qYA1z-0004oA-C7
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
Cc: tytso@mit.edu, linux-f2fs-devel@lists.sourceforge.net,
 Eric Biggers <ebiggers@kernel.org>, viro@zeniv.linux.org.uk,
 linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Christian Brauner <brauner@kernel.org> writes:

> On Thu, Aug 17, 2023 at 10:06:58AM -0700, Eric Biggers wrote:
>> On Wed, Aug 16, 2023 at 01:07:54AM -0400, Gabriel Krisman Bertazi wrote:
>> > Hi,
>> > 
>> > This is v6 of the negative dentry on case-insensitive directories.
>> > Thanks Eric for the review of the last iteration.  This version
>> > drops the patch to expose the helper to check casefolding directories,
>> > since it is not necessary in ecryptfs and it might be going away.  It
>> > also addresses some documentation details, fix a build bot error and
>> > simplifies the commit messages.  See the changelog in each patch for
>> > more details.
>> > 
>> > Thanks,
>> > 
>> > ---
>> > 
>> > Gabriel Krisman Bertazi (9):
>> >   ecryptfs: Reject casefold directory inodes
>> >   9p: Split ->weak_revalidate from ->revalidate
>> >   fs: Expose name under lookup to d_revalidate hooks
>> >   fs: Add DCACHE_CASEFOLDED_NAME flag
>> >   libfs: Validate negative dentries in case-insensitive directories
>> >   libfs: Chain encryption checks after case-insensitive revalidation
>> >   libfs: Merge encrypted_ci_dentry_ops and ci_dentry_ops
>> >   ext4: Enable negative dentries on case-insensitive lookup
>> >   f2fs: Enable negative dentries on case-insensitive lookup
>> > 
>> 
>> Looks good,
>> 
>> Reviewed-by: Eric Biggers <ebiggers@google.com>
>
> Thanks! We're a bit too late for v6.6 with this given that this hasn't
> even been in -next. So this will be up for v6.7.

Targeting 6.7 is fine by me. will you pick it up through the vfs tree? I
prefer it goes through there since it mostly touches vfs.

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
