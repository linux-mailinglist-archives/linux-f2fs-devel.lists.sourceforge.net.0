Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SGWmOPwhc2mUsgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 08:23:40 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 97D3371AA3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Jan 2026 08:23:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hqAOJ+ez3unHiGLKZlLQR2SEC6izs446Oj5p6oVizWg=; b=Gw3U33vutRtr95LBA3+S8QMcZS
	LoKYkJLNxxLft6mPYw6kepVduY+jCZLQ3KZQeXywrNkM5WZ6VAFP4p19W88AcamAuCK4P8lfdzzcg
	ikICBzdfZWhxg3JZzUSBDo/foFvtkbH947i3wmNdTncDSL+X91Qz4sG/kIIpKj1ZStGA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vjBW5-0003Fe-6D;
	Fri, 23 Jan 2026 07:23:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vjBW3-0003FX-Mf
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 07:23:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2WSbWq8LHLFUvWKQa+bE3PsGmr4yva4HdxVUbKq6I/k=; b=VC44HwIfkLU+nt/UN0tJ/phg5B
 4ITDpPVQMjEDdf7iIe27pjgSybY86IKNgS5+IG+pTxvCWhQUi9Yhuo7T4V1VaxoCRGY5/UuP2kvyh
 eGQE//ftWQUQl9pAtOCfiRL4XXdcpVcMtnepnNJSIrDilBnzYJF+7toK0oTx2S9TR5PY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2WSbWq8LHLFUvWKQa+bE3PsGmr4yva4HdxVUbKq6I/k=; b=bcydELvkGtNrlvkpdf2xSva3se
 lLcz/yLbUQmZjpd+XXs1MpGQjFNmDYdWbJkmY9fH8wUZ9e4UA/VvSsGf3gCGVfj6eneITPaAE0iC0
 VYZ11ZbybJPb6iDyV3mqiroYUr8HDO3ByzgS7SaxFG9IzeO1Eo/zjHt6N/lwRAhjUrP4=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vjBW3-000360-BY for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Jan 2026 07:23:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0E655419AA;
 Fri, 23 Jan 2026 07:23:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7360C4CEF1;
 Fri, 23 Jan 2026 07:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769153009;
 bh=9WSu0IShfB8L33nlGdfGlGnVbVsdHwxggXUIvcPUkfs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Sz+tzjHgSoGj68dWGCbxnG7wcFHUG1sGFGWKjsbQ/1x7HSKc5fJNRTcRC9Od2hckn
 naES6wfe0DYNlM1sr7uZj2Y657/PL/BObMRodBGNhJIFWij85Qti4tVTs0PdkQ4xpU
 IFW2dANl8T8sHv/DJMJS1GkN0olprh61KoB7iNREK+3wTtLWxJUwbjypyc8/adli/J
 s6BB3xJBuuNvU4NCwykwSCs5KcbYdC6Ks4YnYRmQTKuPaXqtfC/91C4K0NtI0z+o1/
 +QO59h0EiDTF+LLjacD30R+GU7/IVvcKb1fdVjBsiUk8XCgJ41Epg8k2yOgsyFeY3/
 MU1BEeBUnyEhA==
Date: Thu, 22 Jan 2026 23:23:29 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260123072329.GL5910@frogsfrogsfrogs>
References: <20260122082214.452153-1-hch@lst.de>
 <20260122082214.452153-8-hch@lst.de>
 <20260122214958.GG5910@frogsfrogsfrogs>
 <20260123051556.GC24123@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260123051556.GC24123@lst.de>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Jan 23, 2026 at 06:15:56AM +0100, Christoph Hellwig
 wrote: > On Thu, Jan 22, 2026 at 01:49:58PM -0800, Darrick J. Wong wrote:
 > > Well this is no longer a weird ext4ism, since f2fs also needs [...] 
 Content analysis details:   (-0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vjBW3-000360-BY
Subject: Re: [f2fs-dev] [PATCH 07/11] fs: consolidate fsverity_info lookup
 in buffer.c
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
From: "Darrick J. Wong via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Darrick J. Wong" <djwong@kernel.org>
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Jan Kara <jack@suse.cz>, Andrey Albershteyn <aalbersh@redhat.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:jack@suse.cz,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:ebiggers@kernel.org,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:tytso@mit.edu,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.962];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 97D3371AA3
X-Rspamd-Action: no action

On Fri, Jan 23, 2026 at 06:15:56AM +0100, Christoph Hellwig wrote:
> On Thu, Jan 22, 2026 at 01:49:58PM -0800, Darrick J. Wong wrote:
> > Well this is no longer a weird ext4ism, since f2fs also needs this,
> > right?  Maybe this comment should read:
> 
> f2fs doesn't use buffer heads.  So this is just because ext4 only
> implements the easy parts of ->read_folio and ->readahead itself and
> falls back onto the generic code for the rest, which then had to be
> grow hacky ext4-specific bits like this for it :(

Yikes.  So I guess we shouldn't genericise the comment to encourage more
people to do the same thing ext4 did?

--D


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
