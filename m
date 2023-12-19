Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD2E6819464
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Dec 2023 00:12:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rFjGa-0005S1-5I;
	Tue, 19 Dec 2023 23:12:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1rFjGZ-0005Rv-NV
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Dec 2023 23:12:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jlhdP7ot4yqaCQdwafi312gLe4JCqDbg1cqzG4BqDYQ=; b=BD2BQW5sJugPZafcmdJ7boy95Q
 wcue1yjHaONUxYzAxUgiernd2F7kTHnyI6Jfq1p8pu0YR5FonbAfib2fFSGbPj6/9Ji1D1Cld4vGv
 1w5TROfmdPHcMhCC6rWR34vJRI1QU3brZ0FohbJXxnOSLQUuFMs5p3T599ojfTeeLSmk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jlhdP7ot4yqaCQdwafi312gLe4JCqDbg1cqzG4BqDYQ=; b=PcwgwEBDaGuosIX7Z3quM4PKQ5
 lvu3j8vqZvD10znygvD+GJgmrXl7tTyT83qn+hqxcKq+yJnsf/jSFn9SqnUw8eOYvcvrQLNYwn1Mw
 XPsrD4cqtFoWOdYHpYxLydrw6tDYkMsrY+o98HcQldILlJd/yqDK0PXenjs6O6FuB9fw=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rFjGX-0002fr-I6 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Dec 2023 23:12:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 007D1B8187E;
 Tue, 19 Dec 2023 23:12:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 448B3C433C8;
 Tue, 19 Dec 2023 23:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703027550;
 bh=Wg2vV1WjPN26p90HjDONXgzV+zjLmWbmNTPH4yZdHu0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BgASHxRMht1yVdThzcVChIXyhaA0hmjnv6wBuco/tp02f4A+1KJQ7m9qv4WW6S8qz
 MS1OawxaMbqCJm1+0nEWo7J3eoYYRdVF0Cdh5rD1LzMvmB15dKWMEKq/zzBPSbdH63
 vsJnEa9ugDB3eNEqw1+sJjRtHCP5UNDcG7rP0TLCyzXlrjwC6X6fMcEHARf5H9RXGb
 x1iGrGdRYpd2VRJx1t1pyHCD+uvvi5nwt9PfKdwKITPs2jwq+OFlYhue7mjynz3X6I
 /icTDMy/kSXz3RVIAukQEYJMBiRj5Q59aF78KDwHhlaBlg6KbHTQDWjp/V4Z3TMFbT
 wfsDDmO/jBCcw==
Date: Tue, 19 Dec 2023 16:12:22 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: Gabriel Krisman Bertazi <krisman@suse.de>
Message-ID: <20231219231222.GI38652@quark.localdomain>
References: <20231215211608.6449-1-krisman@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231215211608.6449-1-krisman@suse.de>
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Dec 15, 2023 at 04:16:00PM -0500, Gabriel Krisman
 Bertazi wrote: > [Apologies for the quick spin of a v2. The only difference
 are a couple > fixes to the build when CONFIG_UNICODE=n caught by [...] 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rFjGX-0002fr-I6
Subject: Re: [f2fs-dev] [PATCH v2 0/8] Revert setting casefolding dentry
 operations through s_d_op
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
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Dec 15, 2023 at 04:16:00PM -0500, Gabriel Krisman Bertazi wrote:
> [Apologies for the quick spin of a v2.  The only difference are a couple
> fixes to the build when CONFIG_UNICODE=n caught by LKP and detailed in
> each patch changelog.]
> 
> When case-insensitive and fscrypt were adapted to work together, we moved the
> code that sets the dentry operations for case-insensitive dentries(d_hash and
> d_compare) to happen from a helper inside ->lookup.  This is because fscrypt
> wants to set d_revalidate only on some dentries, so it does it only for them in
> d_revalidate.
> 
> But, case-insensitive hooks are actually set on all dentries in the filesystem,
> so the natural place to do it is through s_d_op and let d_alloc handle it [1].
> In addition, doing it inside the ->lookup is a problem for case-insensitive
> dentries that are not created through ->lookup, like those coming
> open-by-fhandle[2], which will not see the required d_ops.
> 
> This patchset therefore reverts to using sb->s_d_op to set the dentry operations
> for case-insensitive filesystems.  In order to set case-insensitive hooks early
> and not require every dentry to have d_revalidate in case-insensitive
> filesystems, it introduces a patch suggested by Al Viro to disable d_revalidate
> on some dentries on the fly.
> 
> It survives fstests encrypt and quick groups without regressions.  Based on
> v6.7-rc1.
> 
> [1] https://lore.kernel.org/linux-fsdevel/20231123195327.GP38156@ZenIV/
> [2] https://lore.kernel.org/linux-fsdevel/20231123171255.GN38156@ZenIV/
> 
> Gabriel Krisman Bertazi (8):
>   dcache: Add helper to disable d_revalidate for a specific dentry
>   fscrypt: Drop d_revalidate if key is available
>   libfs: Merge encrypted_ci_dentry_ops and ci_dentry_ops
>   libfs: Expose generic_ci_dentry_ops outside of libfs
>   ext4: Set the case-insensitive dentry operations through ->s_d_op
>   f2fs: Set the case-insensitive dentry operations through ->s_d_op
>   libfs: Don't support setting casefold operations during lookup
>   fscrypt: Move d_revalidate configuration back into fscrypt

Thanks Gabriel, this series looks good.  Sorry that we missed this when adding
the support for encrypt+casefold.

It's slightly awkward that some lines of code added by patches 5-6 are removed
in patch 8.  These changes look very hard to split up, though, so you've
probably done about the best that can be done.

One question/request: besides performance, the other reason we're so careful
about minimizing when ->d_revalidate is set for fscrypt is so that overlayfs
works on encrypted directories.  This is because overlayfs is not compatible
with ->d_revalidate.  I think your solution still works for that, since
DCACHE_OP_REVALIDATE will be cleared after the first call to
fscrypt_d_revalidate(), and when checking for usupported dentries overlayfs does
indeed check for DCACHE_OP_REVALIDATE instead of ->d_revalidate directly.
However, that does rely on that very first call to ->d_revalidate actually
happening before the check is done.  It would be nice to verify that
overlayfs+fscrypt indeed continues to work, and explicitly mention this
somewhere (I don't see any mention of overlayfs+fscrypt in the series).

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
