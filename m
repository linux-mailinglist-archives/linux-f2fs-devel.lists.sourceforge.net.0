Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iHOEEbNspmnMPgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 03 Mar 2026 06:08:03 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B9AA21E91DD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 03 Mar 2026 06:08:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RxK1l8HyJ11hHQtY/wJWVeFr1OJGS5jpygSPzKcfSGM=; b=MUbc3Xwl25j2fiOPlMEhegMCTO
	MU6ctDuSgzLOcWxSi4Fg4UMmg7xkg8ZVpb3v91ye1SiUqAbY6X0LBIGprAar6zDKEsYf8VTimrGU6
	Wn7sJdnjk0mR+9TyY4pUHT7UlcaKKDDuqhgXLknCCm/Y04VYdlQHkvTW+9YYrLetxAWk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxHz6-0006qg-I3;
	Tue, 03 Mar 2026 05:07:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1vxHz4-0006qa-TO
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Mar 2026 05:07:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=duvYbjHr/e99DzAt8jHMV2GrEA+A0/pyMGJkOfXwBGQ=; b=Lwr3+eKK9MDRCwR8oedW5fhBBZ
 eVid8LqJG7OTJvhXxaqMQxpZzbgRuGSt4RdJ86es9+xbd+zL6QxbbquZtCScP02/cFCN1QVvL+7Gj
 KpKeljMTq+FBGtu9oszD4PFbmEYHm/zENT4pdT11tt5aNSbBD2F1HFsCwlvj4ryEgLLc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=duvYbjHr/e99DzAt8jHMV2GrEA+A0/pyMGJkOfXwBGQ=; b=HVvXFntUunbxbmzV+RpWkOV7zm
 hkKQ5ReT085m75LGPa2JUu5h7JpfLT9fXRRk6VihfAJy7m4IIm/cb8FS2tOAN0tB3IJX1ZL+Mxslx
 C1dTqk+EJ6vCiDPhVqFb/dyoi4b6N6aDPPS6vIGBwwnHuOz/S2zx8h7ZFaEAAlKSLjn8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxHz4-0001IK-DE for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Mar 2026 05:07:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0AC6E40631;
 Tue,  3 Mar 2026 05:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9718C116C6;
 Tue,  3 Mar 2026 05:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772514459;
 bh=1+kKr9w9x1B4o6FcZ1XAvN36pB8iYMy5wzHr3wwx+6k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=tdQvKpp2K/r35zCm0W6gRUwl4ZY8UaHyBvOYJzXsf+L4J1r9LKC9hjhf65BPuwGyT
 yFqYzMK3vuokKly0l+YjMr6k9NLrJqehKXW6ixHMLnjx0Td9v48Id/KH88HW2Qr3dX
 gZJiIgJImQMR05aCpC/CSHA9uu2aW7xULTrYcoYfdKxDvrf0C89CM68j5f0Y2NBExz
 YAyM1VTwIUq9LfTSzFFm5csRWadKv1uqGQCDYG9T6IexWwAWJsxzPcOxhHI3l4l40n
 NJWMj2kZ6/NzBXgrX4gJu32wP6r0+aZ9FdYIT+GQetCDHQeo09ckyuhro60zCH/OPH
 AjlXlLdik735A==
Date: Mon, 2 Mar 2026 21:06:44 -0800
To: fsverity@lists.linux.dev
Message-ID: <20260303050644.GC5238@sol>
References: <20260221204525.30426-1-ebiggers@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260221204525.30426-1-ebiggers@kernel.org>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, Feb 21, 2026 at 12:45:25PM -0800, Eric Biggers wrote:
 > Currently, all filesystems that support fsverity (ext4, f2fs, and btrfs)
 > cache the Merkle tree in the pagecache at a 64K aligned offse [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vxHz4-0001IK-DE
Subject: Re: [f2fs-dev] [PATCH] fsverity: add dependency on 64K or smaller
 pages
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
Cc: Arnd Bergmann <arnd@arndb.de>, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: B9AA21E91DD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:fsverity@lists.linux.dev,m:arnd@arndb.de,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[8];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

On Sat, Feb 21, 2026 at 12:45:25PM -0800, Eric Biggers wrote:
> Currently, all filesystems that support fsverity (ext4, f2fs, and btrfs)
> cache the Merkle tree in the pagecache at a 64K aligned offset after the
> end of the file data.  This offset needs to be a multiple of the page
> size, which is guaranteed only when the page size is 64K or smaller.
> 
> 64K was chosen to be the "largest reasonable page size".  But it isn't
> the largest *possible* page size: the hexagon and powerpc ports of Linux
> support 256K pages, though that configuration is rarely used.
> 
> For now, just disable support for FS_VERITY in these odd configurations
> to ensure it isn't used in cases where it would have incorrect behavior.
> 
> Fixes: 671e67b47e9f ("fs-verity: add Kconfig and the helper functions for hashing")
> Reported-by: Christoph Hellwig <hch@lst.de>
> Closes: https://lore.kernel.org/r/20260119063349.GA643@lst.de
> Signed-off-by: Eric Biggers <ebiggers@kernel.org>
> ---
>  fs/verity/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)

Applied to https://git.kernel.org/pub/scm/fs/fsverity/linux.git/log/?h=for-current

- Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
