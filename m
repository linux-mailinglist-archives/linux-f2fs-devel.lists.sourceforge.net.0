Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oB/MIzFbeGkupgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Jan 2026 07:29:05 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D03C39064D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Jan 2026 07:29:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3b1fxFIb/6uyhnbUuxGxJaKPjD3yqpziLyvYyUmCOBc=; b=HGarVpudEmhboMM8jxIDBsJQCe
	dViMtAkXGflrfTDT5JebZVinNoGtwRLDErsOFV0cL7ZZ6K4GGwOpTwAT8Y+n4AaJGzM54mEnDLZ8p
	+r11QJhVZtVDdWQD0j2bGKIBeXLlVTjLEYavfQnX9MfB8TF8/cZ2cde2gEh2uF3FTjfA=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vkcZN-0002DL-Qi;
	Tue, 27 Jan 2026 06:28:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <djwong@kernel.org>) id 1vkcZM-0002DB-1F
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Jan 2026 06:28:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=InuT1teCqkuJlyq04Sv/IYBRgfdMeq53JcvXkbrUDNE=; b=PCekkFGv7Xn1MIhVx2CNuxs8Jy
 mMTGLV8XXw0q/E1V2fZO037McX4UaB1kklmn8Nd9KMlW7PEaG6amSwS16iNL/1eYABJuPaz/CevJx
 DXrwetym36fkGmGTe/+tIUMuE/zO8vDB3EZSYMZy426zNV/ge8Ph9sN/1ieYim339exY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=InuT1teCqkuJlyq04Sv/IYBRgfdMeq53JcvXkbrUDNE=; b=UrJvHlzaVuxq7OAtDV5094RNK4
 E7+JiOCCxPwSJAjPmeqW6moHpvRuMcz5XgCUnbVszGh0SZdEKkx4pM9h/KkA57P/4+SG5YY1BaZaq
 vLabTkKLOyrGTUjZ+s8hDOL+J/hLGfPe6cOr1e69st1iobnBrZLs/oxY3X5nBcgBirJQ=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vkcZL-0002Hc-MT for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 27 Jan 2026 06:28:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 595B842AE3;
 Tue, 27 Jan 2026 06:28:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3043DC116C6;
 Tue, 27 Jan 2026 06:28:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769495330;
 bh=B1kq0mimRXX8LQj8FS8Moi/visceHxddCmzC7rqxylg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qR32wjGxWRHt4sD8mPbI7rcQeLPnFCSuBoyBOLMWuV6cfAXqq2hqcyoCNuTuVwXNI
 8LAEzwYd4U2vqsThpgKu7kD34zAEBrj/JW6F8l3rrkgR/yNBydoRkbbx7n2QVP3BxB
 lM+TrT14AtPXT1eEet5gRIvAcOx6Y7SITQCVjaP7uG7u2RbA+pkICqumStpVRj3zFX
 I4SUvd4HjDRdbPhg9apW+UFxMtUsuoTt4LR9zjW4gmx0NKsrraVG8yyJVHBe0tteEu
 DHwKninryNHDNzdhQlmMZ2GodmOjmOLqR4oHNQlTmMxMEIkpjP1NfFh/zsRVbLrYLV
 6GpiKRa4Jr3wg==
Date: Mon, 26 Jan 2026 22:28:49 -0800
To: Eric Biggers <ebiggers@kernel.org>
Message-ID: <20260127062849.GX5966@frogsfrogsfrogs>
References: <20260126045212.1381843-1-hch@lst.de>
 <20260126045212.1381843-8-hch@lst.de>
 <20260126191102.GO5910@frogsfrogsfrogs>
 <20260126205301.GD30838@quark> <20260127060039.GA25321@lst.de>
 <20260127062055.GA90735@sol>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260127062055.GA90735@sol>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jan 26, 2026 at 10:20:55PM -0800, Eric Biggers wrote:
 > On Tue, Jan 27, 2026 at 07:00:39AM +0100, Christoph Hellwig wrote: > >
 > - if (PTR_ERR(folio) == -ENOENT || > > > - !(IS_ERR(folio) && ! [...] 
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
X-Headers-End: 1vkcZL-0002Hc-MT
Subject: Re: [f2fs-dev] [PATCH 07/16] fsverity: don't issue readahead for
 non-ENOENT errors from __filemap_get_folio
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
 Theodore Ts'o <tytso@mit.edu>, Andrey Albershteyn <aalbersh@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.71 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	REPLYTO_DOM_EQ_TO_DOM(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[216.105.38.7:from];
	HAS_REPLYTO(0.00)[djwong@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: D03C39064D
X-Rspamd-Action: no action

On Mon, Jan 26, 2026 at 10:20:55PM -0800, Eric Biggers wrote:
> On Tue, Jan 27, 2026 at 07:00:39AM +0100, Christoph Hellwig wrote:
> > > -	if (PTR_ERR(folio) == -ENOENT ||
> > > -	    !(IS_ERR(folio) && !folio_test_uptodate(folio))) {
> > > +	if (folio == ERR_PTR(-ENOENT) ||
> > > +	    (!IS_ERR(folio) && !folio_test_uptodate(folio))) {
> > > 
> > > (Note that PTR_ERR() shouldn't be used before it's known that the
> > > pointer is an error pointer.)
> > 
> > That's new to me, and I can't find anything in the documentation or
> > implementation suggesting that.  Your example code above also does
> > this as does plenty of code in the kernel elsewhere.
> 
> Not sure why this is controversial.  The documentation for PTR_ERR() is
> clear that it's for error pointers:
> 
> /**
>  * PTR_ERR - Extract the error code from an error pointer.
>  * @ptr: An error pointer.
>  * Return: The error code within @ptr.
>  */
> static inline long __must_check PTR_ERR(__force const void *ptr)
> {
>         return (long) ptr;
> }
> 
> Yes, it's really just a cast, and 'PTR_ERR(folio) == -ENOENT' actually
> still works when folio isn't necessarily an error pointer.  But normally
> it would be written as a pointer comparison as I suggested.

How does one know that a pointer is an error pointer?  Oughtn't there be
some kind of obvious marker, or is IS_ERR the only tool we've got?

--D

> - Eric


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
