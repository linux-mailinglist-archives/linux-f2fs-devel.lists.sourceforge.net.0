Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CJjzGxOBeWmqxQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jan 2026 04:22:59 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D079C9F5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jan 2026 04:22:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DsVF7UfJwtQXv4UbnO6vIuvk/CgUmlItw98cpIH7o4=; b=GMLYEYDpQy/rldOCRRc2BAphO4
	69RvAN38/ibPnrpBrYolcRDIUf2YEAuvZT9/s78QSELaUxtYmtDHlE2bcVaJ4Ml/pOLZ7NRMkmvRS
	W6NrIjz1cQva14Yu3votZoJwy6eejQ3OO3yansdJTsjJHBJ9Rk7QhHi88Qp5BW/cLQLw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vkw8n-0006bp-81;
	Wed, 28 Jan 2026 03:22:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vkw8l-0006bb-MR
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jan 2026 03:22:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TVhvVbdThnPo0xRe3vTfyj6eaegaPlTfci6mHYzteyQ=; b=PmNbR820vfD83DYGXO06sEqMGM
 s9NHxde8zIo9Byk7xzA4Ym+NQs4bPetWeISb2Se3rBryT46LpNDjlRU7EuzOA4/KdpMTpXjl9BG3M
 REBbSHeM+L6Ud/+cUmQfEfXVd+2qhOYbNoBmf7jmqE9Vhy5a6xz8gJwnexM/V8TclbjY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TVhvVbdThnPo0xRe3vTfyj6eaegaPlTfci6mHYzteyQ=; b=EicO/Wu+zBPsCjlTpY6Sz2FUCD
 DFJgPI8wQFdbU4OEbQ1WjfH1Wj4v1vDjmv2TEIiM2wgl99/UAiwkPtCm4b5c30g+ie2sGcbiAR8/P
 GK9gVc9QAJQ3IP+9nN1mQ9VDbBhKz6XZ9K0dNMy66lRBF/9QTsqEOUkuyFabA+nmZLuA=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vkw8l-0000Ho-4H for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jan 2026 03:22:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id B908242B03;
 Wed, 28 Jan 2026 03:22:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 305E8C4CEF1;
 Wed, 28 Jan 2026 03:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769570556;
 bh=hO7Dvp+n2fT8USiyWHCLLJZmQ5uqUDuWImmkAnQEdLg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GVoeY+wZx5buXBTIHSfGxUGQ57DrOaBRKk5U5A/3h9N3bozABH3DFmg7tGDTgOWXw
 8pOK+jle1pHoNNdSngnSz79EnorWBVoK6MUWSACqVy6ko4d52R0r+wZV7trXYk6oGr
 0tCJEH+MjaMQfWnMRpkSDQs5UBbaCv7/TXS1i9GYb4dVjHBTEAT7aHvgVCbaikQibv
 rbWHYIIBbH1JSEqLPkGm9OzuvkCKXHUmqSWwyY7bTLmDhrYTHiTNqyA6bU5sfS2NlY
 fB0DubjlJnjMafKhG51XCPpwFeVgmjXE8o8FQ03pRK/N+dEF22Vk5OOrn/DLTUWHuj
 bVPe2pm4VAhKw==
Date: Tue, 27 Jan 2026 19:22:03 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260128032203.GA2718@sol>
References: <20260126045212.1381843-1-hch@lst.de>
 <20260126045212.1381843-10-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260126045212.1381843-10-hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 26, 2026 at 05:50:55AM +0100, Christoph Hellwig
 wrote: > struct fsverity_info contains information that is only read in the
 > verification path. Apply the const qualifier to match various [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vkw8l-0000Ho-4H
Subject: Re: [f2fs-dev] [PATCH 09/16] fsverity: constify the vi pointer in
 fsverity_verification_context
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Andrey Albershteyn <aalbersh@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.71 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[14];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org]
X-Rspamd-Queue-Id: 04D079C9F5
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 05:50:55AM +0100, Christoph Hellwig wrote:
> struct fsverity_info contains information that is only read in the
> verification path.  Apply the const qualifier to match various explicitly
> passed arguments.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  fs/verity/verify.c | 15 ++++++++-------
>  1 file changed, 8 insertions(+), 7 deletions(-)

Did you consider that fsverity_info::hash_block_verified is written to?
It's a pointer to an array, so the 'const' doesn't apply to its
contents.  But logically it's still part of the fsverity information.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
