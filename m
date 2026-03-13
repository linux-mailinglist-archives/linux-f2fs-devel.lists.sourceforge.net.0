Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CRfKFjys2nYdgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 12:17:44 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D3B2F282183
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 12:17:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KIvsBEN/8R/0g9klD9VN/5lS5t4eOplGsN09zVEu7kg=; b=ULV6hA6MvQwnXOVP0f+UTDmjGJ
	OpwMK/CkWQr6OlFJTjJd1vWfiCG5H2uFmhrXModoUlDzDqhnrux2FZGtAWjMyYqK3bxsbPVRd6gjO
	lUbRfqFoTY54VaLTG1jPl/MHhSb57FKml3HhcPTCwsziWzlzyXyON8yT6Fcwzk910ATg=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w10WM-0002fP-7u;
	Fri, 13 Mar 2026 11:17:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1w10WK-0002fI-EH
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 11:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G3aAJby17/qDvpdgHW3BwLZTyLi3K99yUle4/tTAV/E=; b=iCBK3B0hJY4qoU/yKc346TLDF1
 +3inHczzRgTFjtdSpjA4lu9q92Uv//A1KP+8koGaWRHdHfryfMgMUW5XigeM5JRgoapUSZ1kdKTxu
 lJJCJ3iEWMZIQVmajF3AlXuxxm/jnbzpdGhpmOmT2DcVoE03AO68jVj1L9cRGpLI+egw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G3aAJby17/qDvpdgHW3BwLZTyLi3K99yUle4/tTAV/E=; b=aeYJuuWVKhD5mKIWnF2dp921CK
 H+kltRNyXva7reeJFhM2+yhBp91VmsoNoW2/z2TuRJEZVKQ+rohDjj6j61PAGHiTV1GW9AAdIcrYh
 OLgmalMF9XyHQWkLrRDQCqH4aNU+QsRCLskKNiMXx7H3Ge7qIEE3NLMrTO7WeZ0oJ72c=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w10WJ-0006Fn-QL for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 11:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773400640;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G3aAJby17/qDvpdgHW3BwLZTyLi3K99yUle4/tTAV/E=;
 b=OKrNARqwkYelqWGSTRuXPia0Hk9bJllMK93J6bCZsenFBTr2yAP8WoHr5HIUq1yJmxnNzJ
 roRty5ThfMb56It1GF+ACxR58ERoxghdXQPbE/9WcJewxFRFNdhw7EVsgVA6EO8b0CpQt3
 rB0HRscEx8F6ofgjV8gqmn6Stxp+rIE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-O4K4YjiRNEy0Csgm1tZg7g-1; Fri, 13 Mar 2026 07:17:19 -0400
X-MC-Unique: O4K4YjiRNEy0Csgm1tZg7g-1
X-Mimecast-MFC-AGG-ID: O4K4YjiRNEy0Csgm1tZg7g_1773400638
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-439db9da59eso1498702f8f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 13 Mar 2026 04:17:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773400638; x=1774005438;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=G3aAJby17/qDvpdgHW3BwLZTyLi3K99yUle4/tTAV/E=;
 b=o3jRFkwkzwC2aeGldXGvT1LwuerPjpSSsFd7CiXHJpWvlCWwS+WUbQTDFSXUpJ4eM8
 WPoy/a2ZvS4G+L8EYrJVQjq5/VN9s0fEgwcgqwb1XOm/8qEaeI8cADjEKJ6w36Xmd3vZ
 THgbX7xUCXC3eSmI2bO4+nLFlkOldrylXrYNgR1gjasVWvM1M5JqcRpLQB67zw7jPDYr
 QdA6gmz9anGdlaLNj3tvd8BNexANcicZHROPDUpR/1dkWcNSKWs8BioP1g2/s5OQG7KW
 3A7utlgBPow0PakY232y9Xk6zzV17cDCGM++JvDjQaJEnPTI0lxERW5Pspqw9U2SyWv1
 om0Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/XZK4jfGO2JNZPo6YxBy8fR/5dwlf+EaCfwhh1sym4yEc2ypGj09EScTw5lM4wRuv8wq7kyocz7v+mi5/e1hk@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzLEKKOMgmV8UvKY9kS9JhavBW1gwd1t0MHUYPQV7SsSg+urxst
 JtNFb4Q/ioKnE9VSZlAYw3Jwdb0HReKtP/GSXPxc0/C17+dDHwxpIl5uTXHEsTdD4F51wxkPtJv
 7Fu5dEKP9niI9EiIM3Zw+GlesGFGCPl009j6BDJdhJCsZENd3/CCzZ4Zl3PA8T6eecHd2w8pzyq
 CJJQ==
X-Gm-Gg: ATEYQzwlGeCwTS9egNneshfGSvibxGPA18yRWoc94629OGOsvppvGpisMGM6KQJjn7s
 qcbFnKbecgmnNM64N1FyTCgpxQ048ku/bG9VUgzpZtPLr+X+LkMh2YOhGSEonJjBHpo/CUmSmoY
 EW0TKsKZQPeoA4thkADrTAy6T5DOeTG/RUgIZtQRHN9GC8PxHlEm3HJQmiaaWRXIgZlscz4CUo2
 k0r+H3jTKqQEHo1KlZHLsNccUnUaa+KItTiPf0la4JZ9yWeGbItrFXqDEP0Cv7IopQFebH6QhVG
 cP/puyvEYiw+cHmJA5UqvSmNj+Yooquno0ERN/d/apmFnWuaYxiE/q8ILSytd3CbveKhyvRf6A4
 hPhkLqYirqk4=
X-Received: by 2002:a05:6000:2010:b0:439:ddc0:4bee with SMTP id
 ffacd0b85a97d-43a04d86228mr5317855f8f.16.1773400637601; 
 Fri, 13 Mar 2026 04:17:17 -0700 (PDT)
X-Received: by 2002:a05:6000:2010:b0:439:ddc0:4bee with SMTP id
 ffacd0b85a97d-43a04d86228mr5317761f8f.16.1773400636834; 
 Fri, 13 Mar 2026 04:17:16 -0700 (PDT)
Received: from thinky ([217.30.74.39]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43a03cfd18fsm8558495f8f.36.2026.03.13.04.17.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Mar 2026 04:17:16 -0700 (PDT)
Date: Fri, 13 Mar 2026 12:17:15 +0100
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <dz3va7indkh4to2pingopyndck737qvyxvlfomkqqothzj4pdk@wu26ba5stnf6>
References: <20260309192355.176980-1-aalbersh@kernel.org>
 <20260309192355.176980-20-aalbersh@kernel.org>
 <20260310012914.GG1105363@frogsfrogsfrogs>
 <ymisdrze3ohdnxa4inqfwp4riaz4qk5nmtil33adn5ukhngq7v@f3tcv3hbzobz>
 <20260312145250.GE6069@frogsfrogsfrogs>
MIME-Version: 1.0
In-Reply-To: <20260312145250.GE6069@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: MptQ1xrINgPhx6Dyj2HzbP-nYXkUCgwHtnx0uOklCgg_1773400638
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026-03-12 07:52:50, Darrick J. Wong wrote: > On Thu, Mar
 12, 2026 at 02:50:57PM +0100, Andrey Albershteyn wrote: > > On 2026-03-09
 18:29:14, Darrick J. Wong wrote: > > > > XFS preallocates spaces [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [170.10.129.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w10WJ-0006Fn-QL
Subject: Re: [f2fs-dev] [PATCH v4 19/25] xfs: remove unwritten extents after
 preallocations in fsverity metadata
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
From: Andrey Albershteyn via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Andrey Albershteyn <aalbersh@redhat.com>
Cc: fsverity@lists.linux.dev, ebiggers@kernel.org,
 Andrey Albershteyn <aalbersh@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org, hch@lst.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
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
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:djwong@kernel.org,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	DKIM_MIXED(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,redhat.com:s=mimecast20190719];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,redhat.com:-];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[aalbersh@redhat.com]
X-Rspamd-Queue-Id: D3B2F282183
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-12 07:52:50, Darrick J. Wong wrote:
> On Thu, Mar 12, 2026 at 02:50:57PM +0100, Andrey Albershteyn wrote:
> > On 2026-03-09 18:29:14, Darrick J. Wong wrote:
> > > > XFS preallocates spaces during writes. In normal I/O this space, if
> > > > unused, is removed by truncate. For files with fsverity, XFS does not
> > > > use truncate as fsverity metadata is stored past EOF.
> > > > 
> > > > After we're done with writing fsverity metadata iterate over extents in
> > > > that region and remove any unwritten ones. These would be preallocation
> > > > leftovers in the merkle tree holes and past fsverity descriptor.
> > > > 
> > > > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > > > ---
> > 
> > > There's an upper limit on the number of blocks you can unmap/free in a
> > > single transaction.  Maybe move the xfs_trans_{alloc,commit} into the
> > > loop body?
> > > 
> > > Oh wait, you skip the written extents.  Ok, so maybe just roll it after
> > > you've done a bunmapi.
> > 
> > I see, I will add a rolling transaction. Btw, why skipping the
> > written extents let's us use rolling here?
> 
> Hrmm.  At first I thought: why can't xfs_fsverity_cancel_unwritten
> allocate (and commit) the transaction inside the loop body?  Then I
> thought "well, it's only conditionally unmapping things, and it's sort
> of a pain to allocate a transaction only then to find out if you
> actually want to run one".
> 
> OTOH there could be billions of extents in the data fork, so holding the
> ILOCK for that many transactions isn't a good thing because tr_write
> only preallocates space for a certain number of transaction rolls.
> fsverity already holds IOLOCK_EXCL so there can't be any other programs
> using the file.
> 
> So now I arrive back at "The transaction allocation and commit/cancel
> should be inside the loop body, since crashing midway through wouldn't
> result in user-visible changes to the file data".
> 
> > > Do you need to purge the cow fork too?
> > 
> > hmm, what case are you thinking about here? The fsverity is written
> > in past EOF region, I don't see how COW extent could be left there.
> > Can they somehow be left mapped for blocks past i_size?
> 
> I was talking about speculative cow fork preallocations below i_size.
> They'll eventually get purged by blockgc, but you could give the space
> back once you've committed enabling the fsverity file flag.

hmm, if they're purged by blockgc, then why to do it here? I'm
iterating and removing unwritten extents here only because
xfs_inode_free_eofblocks() will skip fsverity inodes, the check in
xfs_can_free_eofblocks():

	if (IS_VERITY(VFS_I(ip)))
		return false;

The skipping is done to not remove all the fsverity metadata
extents. With preallocations enabled there could be unwritten
extents left in the metadata.

Am I missing something?

-- 
- Andrey



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
