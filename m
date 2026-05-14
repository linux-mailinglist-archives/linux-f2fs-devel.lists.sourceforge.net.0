Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6MzDDlHeBWqjcwIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 May 2026 16:38:09 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58E4654344F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 May 2026 16:38:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LUOK3Yv6uKTADHGRlYiBopXtNz7gPQBbqN2a334p6Ro=; b=K5WLT6w+BDy4iBXzTdGu67BXh3
	49uRbhVCkuJcTl1jPOmXISTW7IFjvA4l0i40V/+LA8uof7x7qcoliNbEuHRy5UhQ6k/PBrAMV4RW5
	ZW3tfVBLiB2ci3AjlAQSUCvLLkQvAsyIJ++5YsOf9eJDheDfTxHr4fD9IJDwf/Sa+XME=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wNXCC-0000Xh-DF;
	Thu, 14 May 2026 14:37:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1wNXCA-0000XY-8W
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 May 2026 14:37:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HKEnSDOVlo6CEUHpYZMySiy8/gPT9lRBLUnGZhtoNUM=; b=eLeZdxQPgKv1BeEEDIIAw7yJqM
 hW9AhfDJeJ78rLsvRWvOtCkgGFvwIdmtW5iGykgWUwYgOCsrQqbXQ3q8bNQLjbCeBnzSRsv+DBvdD
 BO8VsRBdkX8lCwoiEtX9Mt5OcP7Nz5AcStj5xxgamPJa+urTCLEajTQ4gOZc5vmIs708=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HKEnSDOVlo6CEUHpYZMySiy8/gPT9lRBLUnGZhtoNUM=; b=BDTBL0mB8G14DJOUF401DwqExl
 H6NxyOPDpuxAYc0OfdLCIjXc3AvBoavcaiU4XkoCj5yPv2UTkbxQNDhk7LCq6VYOGEkZ2XLiNM9R2
 JbQL7Kh3EtcIPmm5IoZ4H5VOOY973AuAVkREWzEcHWRSKkNpQYjcKd32Z758Nn+Ym3ec=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wNXC8-00049A-8b for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 14 May 2026 14:37:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6D9BD42B12;
 Thu, 14 May 2026 14:37:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 451D6C2BCB3;
 Thu, 14 May 2026 14:37:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778769463;
 bh=rZgHzTbgnHHmJN6qZy+N8eVodksxfqXSK4VW1S+0K7I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WSzgITkmGehUccFbXTWsPk0QgXndYmpZfV7daj62F/XhP97o2McXRouYZH6CLLFwV
 gqggLlEnZ1PXfTjjROCChaOh3grRD106tHztsRAi1luciA9n5+Z6uR56rq/zS3XA3J
 YnLMKpNKptZSqQ+7fG/Q9tObtVhW9ctnptKEFbI0pchM2CLBhnLGtH34yqCKRQvOGW
 7tLS0IrpYKXpaGZv8TAHtOKGVHyfly3YPOjDQLKY9xULeUNIZ2PiNzkPf4rTYC4WT+
 mEMhTAGHxkOSdsjXj9RG0qveXJ811sNv6MaeF7a5Pg1xBtEyPItjOhZC5D9DOj0U/p
 Zv4alA42osiJw==
Date: Thu, 14 May 2026 07:37:42 -0700
To: Damien Le Moal <dlemoal@kernel.org>
Message-ID: <20260514143742.GB9531@frogsfrogsfrogs>
References: <20260512053625.2950900-1-hch@lst.de>
 <20260512053625.2950900-10-hch@lst.de>
 <20260512170846.GJ9555@frogsfrogsfrogs>
 <20260513055806.GC1236@lst.de>
 <acd6428b-a352-4f7b-a349-b2c9e341fd87@kernel.org>
 <20260513074608.GA3693@lst.de>
 <b37ca8a7-289e-45a0-8cbd-eb14d7453b97@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <b37ca8a7-289e-45a0-8cbd-eb14d7453b97@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Wed, May 13, 2026 at 04:58:37PM +0900,
 Damien Le Moal wrote:
 > On 5/13/26 16:46, Christoph Hellwig wrote: > > On Wed, May 13, 2026 at
 04:44:53PM +0900, Damien Le Moal wrote: > >> Hmmm... With zonef [...] 
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
X-Headers-End: 1wNXC8-00049A-8b
Subject: Re: [f2fs-dev] [PATCH 09/12] swap: push down setting sis->bdev into
 ->swap_activate
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
Cc: Paulo Alcantara <pc@manguebit.org>, linux-doc@vger.kernel.org,
 Carlos Maiolino <cem@kernel.org>, Hyunchul Lee <hyc.lee@gmail.com>,
 linux-mm@kvack.org, Christoph Hellwig <hch@lst.de>,
 Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 Chris Li <chrisl@kernel.org>, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christian Brauner <brauner@kernel.org>, Kairui Song <kasong@tencent.com>,
 Theodore Ts'o <tytso@mit.edu>, linux-cifs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 linux-btrfs@vger.kernel.org, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Trond Myklebust <trondmy@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 58E4654344F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[28];
	RCVD_TLS_LAST(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:dlemoal@kernel.org,m:pc@manguebit.org,m:linux-doc@vger.kernel.org,m:cem@kernel.org,m:hyc.lee@gmail.com,m:linux-mm@kvack.org,m:hch@lst.de,m:naohiro.aota@wdc.com,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:chrisl@kernel.org,m:linux-nfs@vger.kernel.org,m:linux-block@vger.kernel.org,m:dsterba@suse.com,m:jaegeuk@kernel.org,m:axboe@kernel.dk,m:brauner@kernel.org,m:kasong@tencent.com,m:tytso@mit.edu,m:linux-cifs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:sfrench@samba.org,m:linux-btrfs@vger.kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:akpm@linux-foundation.org,m:trondmy@kernel.org,m:hyclee@gmail.com,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[manguebit.org,vger.kernel.org,kernel.org,gmail.com,kvack.org,lst.de,wdc.com,suse.com,kernel.dk,tencent.com,mit.edu,lists.sourceforge.net,samba.org,linux-foundation.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[djwong@kernel.org]
X-Rspamd-Action: no action

On Wed, May 13, 2026 at 04:58:37PM +0900, Damien Le Moal wrote:
> On 5/13/26 16:46, Christoph Hellwig wrote:
> > On Wed, May 13, 2026 at 04:44:53PM +0900, Damien Le Moal wrote:
> >> Hmmm... With zonefs, swap files can be created on top of conventional zone
> >> files. So enforcing "no swap on zoned device" here would break that.
> > 
> > We can check that none of the extents fall onto sequential zones instead
> > of just devices.
> > 
> > I still wonder why you bother with swap to zonefs at all, though.
> 
> Yeah. I do not think anyone actually use that... But since it is there from the
> start, kind of stuck with it now.

Ahh, right, I forgot that zoned devices can have conventional zones
where swap would actually work.  Question withdrawn.

--D


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
