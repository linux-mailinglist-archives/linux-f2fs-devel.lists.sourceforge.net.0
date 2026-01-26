Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cFofNFbRd2mFlwEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 21:40:54 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 813D38D2B6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 21:40:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lz0Dq78WdU5H9UPEIlsydaPxV+N971aeMXVr+xvSqoo=; b=SA7PWvldA0pN2l7IP5uRVzA3fN
	0FEaUrL+uiDIlVhWz5Ky9JYFg9AqIMb8/WPMNe0W/vZ+qyLdpgVd0iJnAYslKkK/wOCuUPGKCkivN
	ixAzdhN6v1MT9laJT8ZTsLcsZpLk4xB0QZLkjNUCc08C/KRfnvnqv05m1Gn2p/YnnWN4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vkTOB-0007b5-Kj;
	Mon, 26 Jan 2026 20:40:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vkTO7-0007ao-S6
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 20:40:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5+mdCDHTLKUZStslE45M6d/w7r8i6cIFsJ8N6HjjaF8=; b=e0a7M0yHV6Ni77Pt4HgdoJ69CU
 FM3sKaulAxu7jRoOBW48rDo9EQSahNek1NaB9Pv80m3uRQsb/kvo7yzkH4M6fHYshxOruUrQWQpw9
 qL0Vx6S2mdA5w/ofW1bF8y5P6W1vYh7Ob/xsT3vk08gbIfDJD9+K87pvKphO13SLY3/I=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5+mdCDHTLKUZStslE45M6d/w7r8i6cIFsJ8N6HjjaF8=; b=dhFeBlY3YhLju/aHznqH0qBgqr
 A0a/W9UT7e5OflU6aG2hJ57Efv4BrRimlSAylJHpjU5tZ0kkq6/dZmwtVzYQ80+nYAkEnXQDazWsi
 wHoJhz/pp0bLU1ZUEyyZRmsnCYMfKOr3hy0d0iWu0WQU9GmTxNBgUNWdayMprYdrQBzA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vkTO8-0001Sr-8o for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 20:40:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 9AE3A60097;
 Mon, 26 Jan 2026 20:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27EF5C19425;
 Mon, 26 Jan 2026 20:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769460033;
 bh=l9LtVaA6nSgchLlbWTin67CmDN89iXVzMWWCdcxjYtQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GvCXJa1wvGHyoJV9yOd66dqhtlHhRupqhUfh5O2T0Ya8SFJbAMSYNmVfKko3GIlzu
 GZ4v7xk90vOaiMqntDQZxal2LJHyMdqlrfA2VrpO1g1ONf3CaidthkaAO/8WSMijUC
 nRhLsxhFiOQKBR46zuWB+3wSNaEv0N1t9HVvogXMcgvEXPJsyzsH3D7nLjEGus2NDu
 BtuiviqxabzsOo6QlqNqbiaPJMyPcakCnf391arUowfEXOpSoV5GY9Xab/cmuxIRhp
 MtOqb7XafJGEURKGFxcUFt7JsLfBHierdMIOntMx4UUkCnLxHWHNc05ScL7mmULr5F
 7Ls1cBic34NrA==
Date: Mon, 26 Jan 2026 12:40:30 -0800
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20260126204030.GC30838@quark>
References: <20260126045212.1381843-1-hch@lst.de>
 <20260126045212.1381843-17-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260126045212.1381843-17-hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 26, 2026 at 05:51:02AM +0100, Christoph Hellwig
 wrote: > The file open path uses rhashtable_lookup_get_insert_fast, > which
 can either find an existing object for the hash key or insert a [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vkTO8-0001Sr-8o
Subject: Re: [f2fs-dev] [PATCH 16/16] fsverity: use a hashtable to find the
 fsverity_info
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
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[];
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
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 813D38D2B6
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 05:51:02AM +0100, Christoph Hellwig wrote:
> The file open path uses rhashtable_lookup_get_insert_fast,
> which can either find an existing object for the hash key or insert a
> new one in a single atomic operation, so that concurrent opens never
> allocate duplicate fsverity_info structure.

They still do, though.  But that's unchanged from before.
ensure_verity_info() frees the one it allocated if it finds that one got
set concurrently.

> Because insertion into the hash table now happens before S_VERITY is set,
> fsverity just becomes a barrier and a flag check and doesn't have to look
> up the fsverity_info at all, so there is only a single lookup per
> ->read_folio or ->readahead invocation.  For btrfs there is an additional
> one for each bio completion, while for ext4 and f2fs the fsverity_info
> is stored in the per-I/O context and reused for the completion workqueue.

btrfs actually still looks up the verity info once per folio.  See:

    btrfs_readahead()
        -> btrfs_do_readpage()
            -> fsverity_get_info()

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
