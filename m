Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DE576F026
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Aug 2023 18:56:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qRbcj-0006LK-QV;
	Thu, 03 Aug 2023 16:56:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <krisman@suse.de>) id 1qRbch-0006LE-AP
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Aug 2023 16:56:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:In-Reply-To:
 Date:References:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8jmGqv5VrNNN6mYDaT468r0ysSqZdLXbTiuCY1iyBvU=; b=dwD2rtJEa7ForCRx6OXYIh/QHd
 Rcbuf6z5YC7PXSMYjFIhJsuz4qE6StXtKR2kA2/5BTZLzs6cHnzCZmohLioQfsFV6fxg1t1YlKRYq
 TPEZxSl4eggSwGVyNAQReNWoV/SODd4BCMRS5YcDhBAmfDUDd3c1PjtzvMIu3z4/jLNw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:References:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8jmGqv5VrNNN6mYDaT468r0ysSqZdLXbTiuCY1iyBvU=; b=mW8Wx1lmtm7AFFNjeEu0hYoSAZ
 swY8e7Rh9FP2rVu5S4z76Tpc8r6yB9QyJI2G0+y+DMRyxegjXq+n1ob68FwzHMWF+JwbPhWsy9urW
 alFax5URzGZFKHAuBUXDR/02vHFMfH4hCQXd+iITwgfGFtFEKLK6qswFqm+/bLWIVWwM=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qRbcb-0004ld-Fd for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 03 Aug 2023 16:56:28 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 412A72190C;
 Thu,  3 Aug 2023 16:56:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1691081775; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8jmGqv5VrNNN6mYDaT468r0ysSqZdLXbTiuCY1iyBvU=;
 b=TxLd0HeM/26VTzN2RSiMjSK4UA3aEVWxf4yVMDutyM05qIwSgDCqDgsa4pgtOeWDs8bpE7
 9EQ/OYgGQZ9VHx8Z8vLkWVfbp9OSxthffiYgt4wEM0On5oXqPGKEaaO7IW4faSykVkUTPT
 846xrgWZ0KteXI9VCUKtPOuQyi8VRy0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1691081775;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8jmGqv5VrNNN6mYDaT468r0ysSqZdLXbTiuCY1iyBvU=;
 b=pcPBq4k4ZIU5vU52Pylta0bS+0mjQ8UQdrzUfpsvtxc3eFTqdyVquXgDMV3ksWRn7STD08
 pVxc2SYgy1TUyMAA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 090E01333C;
 Thu,  3 Aug 2023 16:56:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id xScbOC7cy2SpVwAAMHmgww
 (envelope-from <krisman@suse.de>); Thu, 03 Aug 2023 16:56:14 +0000
From: Gabriel Krisman Bertazi <krisman@suse.de>
To: Eric Biggers <ebiggers@kernel.org>
Organization: SUSE
References: <20230727172843.20542-1-krisman@suse.de>
 <20230727172843.20542-4-krisman@suse.de>
 <20230729045156.GD4171@sol.localdomain>
Date: Thu, 03 Aug 2023 12:56:13 -0400
In-Reply-To: <20230729045156.GD4171@sol.localdomain> (Eric Biggers's message
 of "Fri, 28 Jul 2023 21:51:56 -0700")
Message-ID: <87bkfo12vm.fsf@suse.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Eric Biggers <ebiggers@kernel.org> writes: > On Thu, Jul 27, 
 2023 at 01:28:39PM -0400, Gabriel Krisman Bertazi wrote: >> dentry->d_name
 is only checked by the case-insensitive d_revalidate hook >> in the
 LOOKUP_CREATE/LOOKUP_RENAME_TARGET case [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qRbcb-0004ld-Fd
Subject: Re: [f2fs-dev] [PATCH v4 3/7] libfs: Validate negative dentries in
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

Eric Biggers <ebiggers@kernel.org> writes:

> On Thu, Jul 27, 2023 at 01:28:39PM -0400, Gabriel Krisman Bertazi wrote:
>> dentry->d_name is only checked by the case-insensitive d_revalidate hook
>> in the LOOKUP_CREATE/LOOKUP_RENAME_TARGET case since, for these cases,
>> d_revalidate is always called with the parent inode read-locked, and
>> therefore the name cannot change from under us.
>
> "at least read-locked"?  Or do you actually mean write-locked?

No. I mean read-locked, as in holding the read-part of the inode lock.
This is the case for lookup_slow, which is safe, despite the d_add_ci
case we discussed in the previous iteration.  I'll reword to say "at
least read-locked and mention it is the case in lookup_slow".

>> +static inline int generic_ci_d_revalidate(struct dentry *dentry,
>> +					  const struct qstr *name,
>> +					  unsigned int flags)
>
> No need for inline here.

sorry, I missed the inline from your previuos review.  Will fix it up
for this one.


>
> - Eric

-- 
Gabriel Krisman Bertazi


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
