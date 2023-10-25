Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E50E67D70A7
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Oct 2023 17:19:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qvffI-00081X-8H;
	Wed, 25 Oct 2023 15:19:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1qvffE-00081G-LU
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Oct 2023 15:19:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:
 References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=44S3QBGX+n9gobdLgmc7FmUctQwHLf+32LFQcUsZ8hs=; b=JWpctkiUsKqg0V+HgGn2HyGtLu
 DxXgf3I6Qx45Uc4ddK2wXzQG3j/5YIzQDe3SuOq69ogtF7ybp2BMYaW7t9+fqVMp0YaYvwx5nZD+i
 Qcq1bIrrQjR0JM5yscFQgEq+c99Z3XgiiArizdcumybXAnAtgYkoEkciiz+f2El8Zxgs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=44S3QBGX+n9gobdLgmc7FmUctQwHLf+32LFQcUsZ8hs=; b=P3T84ep3PXMMTYLfRWsBamie0s
 NADDFtYnnR6pftwVA4XQ38Yg3ypWc/xo0uE0pnbAUvAIxM+JFLwmR2vObCgL29JJw4wwtkUwQfwZG
 wdsiYIiHDS7gO55/8VhNjfqPAM7AYR37hSEJ176amu7QTjAJcd3ImDTE08J1ZdKpCxFw=;
Received: from smtp-out2.suse.de ([195.135.220.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qvffD-0094nW-OF for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Oct 2023 15:19:20 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 93B471FF79;
 Wed, 25 Oct 2023 15:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1698247150; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=44S3QBGX+n9gobdLgmc7FmUctQwHLf+32LFQcUsZ8hs=;
 b=ZuUVTMSGCJV3/GjgIHBAWf/Wn+ejp6Qv9xr/USGSYEgpSurICPnUuHeQxgsmqNhp1me2Gk
 xKukBly7nlvuilbb+9FdptbW/aJiHOl7LjCGCeEH28BzfzGq2dcZTODLUFoCV5VZ7Gy5Xj
 l3xJyuldDfYBmQ1U+MhV9vzA9Aa6lPw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1698247150;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=44S3QBGX+n9gobdLgmc7FmUctQwHLf+32LFQcUsZ8hs=;
 b=cjhZlYDYIlya0fQ102Sh8CVhReRGICuKHsHkxeFbQi0AkT34Exg25H9DyKhExGILgmBAz+
 mg5KmCzXK8kVmjBw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 5B082138E9;
 Wed, 25 Oct 2023 15:19:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id bB1IEO4xOWVtNAAAMHmgww
 (envelope-from <krisman@suse.de>); Wed, 25 Oct 2023 15:19:10 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Christian Brauner <brauner@kernel.org>
In-Reply-To: <20231025-selektiert-leibarzt-5d0070d85d93@brauner> (Christian
 Brauner's message of "Wed, 25 Oct 2023 15:32:02 +0200")
Organization: SUSE
References: <20230816050803.15660-1-krisman@suse.de>
 <20231025-selektiert-leibarzt-5d0070d85d93@brauner>
Date: Wed, 25 Oct 2023 11:19:09 -0400
Message-ID: <87lebq91ci.fsf@>
User-Agent: Gnus/5.13 (Gnus v5.13)
MIME-Version: 1.0
X-Spam-Score: -1.3 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Christian Brauner <brauner@kernel.org> writes: > On Wed, 16
 Aug 2023 01:07:54 -0400, Gabriel Krisman Bertazi wrote: >> This is v6 of
 the negative dentry on case-insensitive directories. >> Thanks Eric for the
 review of the last iteration. This ver [...] 
 Content analysis details:   (-1.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.29 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 1.2 INVALID_MSGID          Message-Id is not valid, according to RFC 2822
X-Headers-End: 1qvffD-0094nW-OF
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
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Christian Brauner <brauner@kernel.org> writes:

> On Wed, 16 Aug 2023 01:07:54 -0400, Gabriel Krisman Bertazi wrote:
>> This is v6 of the negative dentry on case-insensitive directories.
>> Thanks Eric for the review of the last iteration.  This version
>> drops the patch to expose the helper to check casefolding directories,
>> since it is not necessary in ecryptfs and it might be going away.  It
>> also addresses some documentation details, fix a build bot error and
>> simplifies the commit messages.  See the changelog in each patch for
>> more details.
>> 
>> [...]
>
> Ok, let's put it into -next so it sees some testing.
> So it's too late for v6.7. Seems we forgot about this series.
> Sorry about that.

Ah, that's a bummer :(. I wanted to ping earlier but stupidly assumed it
was intentional for any reason.

Considering this has been on the list since 2022 and only slightly
changed, mostly touches case-insensitive enabled filesystems, and that
we still didn't enter the merge window (let the alone the -rc stabilization
period), would you consider queueing it on Linux-next today and, provided
there are no merge conflicts, include it in the 6.7 pull request?  I'd
rather not have it sit for another 3 months before inclusion.

>
> ---
>
> Applied to the vfs.casefold branch of the vfs/vfs.git tree.
> Patches in the vfs.casefold branch should appear in linux-next soon.
>
> Please report any outstanding bugs that were missed during review in a
> new review to the original patch series allowing us to drop it.
>
> It's encouraged to provide Acked-bys and Reviewed-bys even though the
> patch has now been applied. If possible patch trailers will be updated.
>
> Note that commit hashes shown below are subject to change due to rebase,
> trailer updates or similar. If in doubt, please check the listed branch.
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git
> branch: vfs.casefold
>
> [1/9] ecryptfs: Reject casefold directory inodes
>       https://git.kernel.org/vfs/vfs/c/8512e7c7e665
> [2/9] 9p: Split ->weak_revalidate from ->revalidate
>       https://git.kernel.org/vfs/vfs/c/17f4423cb24a
> [3/9] fs: Expose name under lookup to d_revalidate hooks
>       https://git.kernel.org/vfs/vfs/c/24084e50e579
> [4/9] fs: Add DCACHE_CASEFOLDED_NAME flag
>       https://git.kernel.org/vfs/vfs/c/2daa2df800f8
> [5/9] libfs: Validate negative dentries in case-insensitive directories
>       https://git.kernel.org/vfs/vfs/c/8d879ccaf0f7
> [6/9] libfs: Chain encryption checks after case-insensitive revalidation
>       https://git.kernel.org/vfs/vfs/c/314e925d5a2c
> [7/9] libfs: Merge encrypted_ci_dentry_ops and ci_dentry_ops
>       https://git.kernel.org/vfs/vfs/c/07f820b77c58
> [8/9] ext4: Enable negative dentries on case-insensitive lookup
>       https://git.kernel.org/vfs/vfs/c/2562ec77f11e
> [9/9] f2fs: Enable negative dentries on case-insensitive lookup
>       https://git.kernel.org/vfs/vfs/c/39d2dd36a065

Thanks,

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
