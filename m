Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CL4KJb2kemmN8wEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Jan 2026 01:07:25 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 396F5AA181
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Jan 2026 01:07:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GryarDsAL7k8ATv1Uccmr8f4SipZYuhjeq7tW93s0M0=; b=ifTfI9tK99gyfBwmsWx74y4zGU
	SKb/dzO9x5NFKRZu2iz/pXRAZkUi4Zh/1r5Pm36XFdv2pKIfEkaR+hkZr1D99949SNQfyYcQxwLBc
	+3FxyYOiQRj36o9R8ddIvW9wkov806cjxJZjQuRg2799sD+JfWXlVKRFROTezfPRyAgk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vlFZ8-0007HE-D3;
	Thu, 29 Jan 2026 00:07:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vlFZ7-0007H5-3g
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Jan 2026 00:07:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5uhaGGQYg9sDFitFxVU8fwHwzQRLcTpFUi/A96NRnUw=; b=AYv1Q7XfXZ7pjCO7Ok2z8/bac6
 cVgdyRiORwWCqp5ry96H5Cm7nElCJyJ5hKg5OEIfr3DovvGUE8tfZguRFQfOiK5u7BfT0N7OXxZbg
 Qv9ikSD2ZA3WQOwBMMPqyuqUZQKrULP+6Hhgzy32kEqnHL5gG56WfdGVAyfHdd/r2Src=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5uhaGGQYg9sDFitFxVU8fwHwzQRLcTpFUi/A96NRnUw=; b=Bd08jqPWlTA/xpRv5gxPhXMbn+
 7zroO6B55/VSN8ubeaEF1tjs2ahar/J07ov80JjgOZStrcvI5JAmIG6y5sBrJ+L0cK6RCXdkGza2P
 5uAcv2zwF/zxw/Rd5lTp1TY9ZMRTZ9nn1VcA5TVQG3YZRDNT1PiSqbiCZamCCYRXsiCc=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vlFZ6-0002gt-JG for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 Jan 2026 00:07:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id C74E56001A;
 Thu, 29 Jan 2026 00:07:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14440C4CEF1;
 Thu, 29 Jan 2026 00:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769645225;
 bh=lfyZ4POXsdioqMKuqaRNweLV2tFbTPixspZnM/3+dX8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bKz8kFRQJBfdfvCfeA6cBhYEmtB1jXZX00j6mhJEQDXw1lRBo20fCwU/y/V/bqbSb
 /jDa6Vi+dDa1h2NX3tKbReT6YMIxAwbcKFeCa4XMZKZc6LzRBWNGZN2XnNjmOIcNAX
 bkbBryG3mygwRoGxdjBG2xpw7K+RSg3eLDEaRG6rQbG3JVCo5xQYAikEY0soDafviF
 pMCltZTWO2X32rPUaXHsQsg00jKqqvzf35SU+geNxGNUNKcs4xA3iQboEHx1U/R0cw
 bG5tvNdATouuDeiMxQdNyHhvOfuYs3LfkFZIqbORMTNmsyQM8HQZRrlY9UanKM8dQQ
 4BQxOFUO2BlFw==
Date: Wed, 28 Jan 2026 16:07:02 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260129000702.GD2024@quark>
References: <20260128152630.627409-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260128152630.627409-1-hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, Jan 28, 2026 at 04:26:12PM +0100, Christoph Hellwig
 wrote: > Hi all, > > this series has a hodge podge of fsverity enhances that
 I looked into as > part of the review of the xfs fsverity suppo [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vlFZ6-0002gt-JG
Subject: Re: [f2fs-dev] fsverity cleanups,
 speedup and memory usage optimization v4
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
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org]
X-Rspamd-Queue-Id: 396F5AA181
X-Rspamd-Action: no action

On Wed, Jan 28, 2026 at 04:26:12PM +0100, Christoph Hellwig wrote:
> Hi all,
> 
> this series has a hodge podge of fsverity enhances that I looked into as
> part of the review of the xfs fsverity support series.
> 
> The first part calls fsverity code from VFS code instead of requiring
> boilerplate in the file systems.
> 
> The first patch fixes a bug in btrfs as part of that, as btrfs was missing
> a check.  An xfstests test case for this was submitted already.
> Can we expedite this fix?
> 
> The middle part optimizes the fsverity read path by kicking off readahead
> for the fsverity hashes from the data read submission context, which in my
> simply testing showed huge benefits for sequential reads using dd.
> I haven't been able to get fio to run on a preallocated fio file, but
> I expect random read benefits would be significantly better than that
> still.

To get things going, I've applied patches 1-6 to
https://git.kernel.org/pub/scm/fs/fsverity/linux.git/log/?h=for-next

I couldn't go further, due to the bugs in patches 7 and 8.

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
