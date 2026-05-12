Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cC83C2rXAmppyAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 May 2026 09:31:54 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C85EC51BE21
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 May 2026 09:31:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gI1V4cwEfqu6UfA7W5zeOFogrYurBaZJUWgmRi81m48=; b=djzpHJwBcYTo2UTRvsEVVHQUTW
	S2cBvuQGAtj/sR6HfYBbXEhYNFUy/hRJzWR8q3SiqkjDX2uvIFg7V+FHreVEGzBSAdUEtBtsHVOIk
	dsBQ0dUxYjhbRLPZk8fyhixJCtargeroDxczwHckOtrWP7pj7oQSG9mFA75wWUdtG8P4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wMhan-0005fi-PD;
	Tue, 12 May 2026 07:31:50 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dlemoal@kernel.org>) id 1wMham-0005fb-0X
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 May 2026 07:31:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ita3d5CJVmYPF+eclMsnCvsqN2sPxc0IzPuSVfoqbk4=; b=JuQ8yvYHcdbZkv66J3GQxPESlo
 xuLfZPoyKcPrzjgsdJf1F9/7hVwm+0pg3+aWYDA48GtryUahsawepAPD4rtykODkKyM89xlzwlPt/
 ZtcdXksuLoJ2qcv/hHZXEGNrQ5XlTD8uaFO51L50NLqU1EuqOEURRYFnAmOXMi3oHVwY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ita3d5CJVmYPF+eclMsnCvsqN2sPxc0IzPuSVfoqbk4=; b=gnEeScB9XYkRkNj9WsQucL7gWN
 b3Hj6f6QI4tz8piJykFfe2MGoqql5QckEqdo3It3ZylspQiqkiRHdnPeQXPXTbwjDkCSjzIyvgFv4
 KnDf1DiIn2hDHDIvDNyPziZshCyUg5fFSMbU68SiapbKA5hDje3HjDMuX30g0brbWQpc=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wMhal-0002Ny-Qa for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 12 May 2026 07:31:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7D1996001A;
 Tue, 12 May 2026 07:31:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA3FBC2BCB0;
 Tue, 12 May 2026 07:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1778571097;
 bh=aowACr2p+6rSwpChoE3EadCBPCPgSF8E8psfVlXgrO8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=gAiB8tFXXabdPEPYhwa+Fm9YFauBqF8VyymvDAAZmCoURFlvvPu6j0sz4KZ788AbA
 /Gilye7p4N5y9ZjRoSrFQ6s+fsXJaBGyl0DIg6af6KSVL52pIRTR4QBciuGyf4cE11
 H2ZLNauyCJw7sUXtWJPUlSY8C+xQSZQ+BLvRl3T6nGZyl3bJmm+w8TMzbUXKvLQq/d
 867M4z2uhgR5hdCFZzD5aMDreoTDa9a/idDEIGy972SC8TvrPs9rAgOOqsDOp6CIPd
 afxA9vC7uam6EfUpw1RehUPquNGm1COUq7xNl82JZuOUABbJMJoXu3JE4ABKO33E1I
 Huh7jhSU82cPw==
Message-ID: <88cdaac7-05a9-41a7-bae4-443db26b7082@kernel.org>
Date: Tue, 12 May 2026 16:31:31 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Christoph Hellwig <hch@lst.de>, Andrew Morton
 <akpm@linux-foundation.org>, Chris Li <chrisl@kernel.org>,
 Kairui Song <kasong@tencent.com>
References: <20260512053625.2950900-1-hch@lst.de>
 <20260512053625.2950900-9-hch@lst.de>
Content-Language: en-US
Organization: Western Digital Research
In-Reply-To: <20260512053625.2950900-9-hch@lst.de>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 5/12/26 14:35, Christoph Hellwig wrote: > add_swap_extent
 already coalesces multiple extents, no need to duplicate > that in the caller.
 > > Signed-off-by: Christoph Hellwig <hch@lst.de> Looks OK to me. 
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
X-Headers-End: 1wMhal-0002Ny-Qa
Subject: Re: [f2fs-dev] [PATCH 08/12] swap,
 iomap: simplify iomap_swapfile_iter
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
From: Damien Le Moal via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Damien Le Moal <dlemoal@kernel.org>
Cc: Paulo Alcantara <pc@manguebit.org>, linux-doc@vger.kernel.org,
 "Darrick J . Wong" <djwong@kernel.org>, Carlos Maiolino <cem@kernel.org>,
 Hyunchul Lee <hyc.lee@gmail.com>, linux-mm@kvack.org,
 Naohiro Aota <naohiro.aota@wdc.com>, linux-xfs@vger.kernel.org,
 linux-ext4@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 linux-cifs@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-block@vger.kernel.org, David Sterba <dsterba@suse.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Jens Axboe <axboe@kernel.dk>,
 Christian Brauner <brauner@kernel.org>, Theodore Ts'o <tytso@mit.edu>,
 linux-f2fs-devel@lists.sourceforge.net, Steve French <sfrench@samba.org>,
 Trond Myklebust <trondmy@kernel.org>, Anna Schumaker <anna@kernel.org>,
 linux-fsdevel@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: C85EC51BE21
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[28];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:akpm@linux-foundation.org,m:chrisl@kernel.org,m:kasong@tencent.com,m:pc@manguebit.org,m:linux-doc@vger.kernel.org,m:djwong@kernel.org,m:cem@kernel.org,m:hyc.lee@gmail.com,m:linux-mm@kvack.org,m:naohiro.aota@wdc.com,m:linux-xfs@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linkinjeon@kernel.org,m:linux-cifs@vger.kernel.org,m:linux-nfs@vger.kernel.org,m:linux-block@vger.kernel.org,m:dsterba@suse.com,m:jaegeuk@kernel.org,m:axboe@kernel.dk,m:brauner@kernel.org,m:tytso@mit.edu,m:linux-f2fs-devel@lists.sourceforge.net,m:sfrench@samba.org,m:trondmy@kernel.org,m:anna@kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-btrfs@vger.kernel.org,m:hyclee@gmail.com,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	FREEMAIL_CC(0.00)[manguebit.org,vger.kernel.org,kernel.org,gmail.com,kvack.org,wdc.com,suse.com,kernel.dk,mit.edu,lists.sourceforge.net,samba.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[dlemoal@kernel.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,lists.sourceforge.net:rdns,lists.sourceforge.net:helo,lists.sourceforge.net:dkim]
X-Rspamd-Action: no action

On 5/12/26 14:35, Christoph Hellwig wrote:
> add_swap_extent already coalesces multiple extents, no need to duplicate
> that in the caller.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Looks OK to me.

Reviewed-by: Damien Le Moal <dlemoal@kernel.org>

-- 
Damien Le Moal
Western Digital Research


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
