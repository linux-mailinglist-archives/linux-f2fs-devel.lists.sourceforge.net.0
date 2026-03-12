Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sBRBBN7EsmmvPAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 14:51:26 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 282B9272EBC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2026 14:51:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Du5CyLrjeJ6cP4rFoqUzhOUSBw7QS11fyKK/g/YuRw=; b=PwQLk6woWxU9SeDLY8tJtOI5jG
	pl9OGzEv2zNf/g1l/DvOQM8srOJCE1UkEOA5bV1L3Ix4SDpjDznLp4KUad30m8qx2we5HHGdlqNPG
	sCq2h3yY79vCyvIjdqjdtZu4pV7Z9vdC7iLSiq5Ybm6pY1rQwfwh/kUyl/y+wBAOtCUc=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0gRS-0000Jc-BZ;
	Thu, 12 Mar 2026 13:51:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1w0gRR-0000JT-2C
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 13:51:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lusPCuwgPIO7EacrWQT9X+JN0PBRkgLuOI7TKiRgdsk=; b=ksLkJA0SoO+6beZUFyY65OPUQo
 WZBLsEFEfmV2KJd96WSD8mFXfAPPTHCdX7hUBI0TkNnVaQMSsmJossSCtsp2qeggPg6dqmKWUZO6S
 H3JBWHsB7U1HO4nDM8ivLvhDalxOUi5Sd7cOdEPhqLrNO9OzcwwKUIbTSGEQQ2LZ7guY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lusPCuwgPIO7EacrWQT9X+JN0PBRkgLuOI7TKiRgdsk=; b=U+OjYqSfEhgaJeTinQNrRGQo39
 H/GZNRtOZa7QrR9YrnCyGxMQSVku1bQF8sC1ovlTlzfSbQQDz1Lid6QAL1Clv+fed1vZOTu+YOpbU
 lCMuQn8bW4upAjSYlNFzKJJFo1TAiOifdvI2ktVplJy8PsswS1P5y/qDpaAftzINhQUo=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0gRQ-0007mZ-Lg for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 12 Mar 2026 13:51:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773323462;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lusPCuwgPIO7EacrWQT9X+JN0PBRkgLuOI7TKiRgdsk=;
 b=WlsVTztL9Q7LVBAKNoZOhRHsqYJFjMRLCEzzuXMvsNKwQYfyT1pwl/DnxPa9WNqHvUDBJo
 vyf28QBR4OzI7ioOciTAFIJxcTMoMe+DuhlB1u0efcGmlCkJP+4RnZN4MbtnH6hQCaHPg4
 TaKkerjrhWVgTFnzT0gTWQzXRiAvog0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-574-d5SC6BW7NW-zuDffcTtI8g-1; Thu, 12 Mar 2026 09:51:01 -0400
X-MC-Unique: d5SC6BW7NW-zuDffcTtI8g-1
X-Mimecast-MFC-AGG-ID: d5SC6BW7NW-zuDffcTtI8g_1773323460
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4837bfcfe0dso11874055e9.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 Mar 2026 06:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773323460; x=1773928260;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lusPCuwgPIO7EacrWQT9X+JN0PBRkgLuOI7TKiRgdsk=;
 b=cxwELK9Mxbxaek0+kKkLeCl6F0hO5Fgz2KH13Gp86JCNbQ164Vvc/qHTQJZDZuLCDm
 NLJCwnFea4ADQQ+gtCymaqOSHrtOcSXl/8xC8rIt6kHX/MpPWuPiPxXxDhGmxizbM2sJ
 1wlDcnKKg4VA1IBdj+sR4Ojaho296L+YFt+Rvs/ZyqIwDhT42SuddFdfFecBe7x5r/oj
 aZ2qr1jQEpLh3zQeWzJjEND6fZkTRcshLDN8T3v9kYl5Xhc5XlxIVc2CsMm7diH2hcrC
 AWF2ImoFI2xhneI3hQcFHzcx1TeIgYA9SkwaZwSvsxufYn1nQhTk+BO9FeJBQwv7LGXs
 6Zfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAGPMaYaUmHxq4P9OzMMjDZwDraAszNPtR4l1cAXwG41HHABF9VXk4rbcf9dk2n43L5iXKYVjT2LU8h3nxScCG@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzBxEbXBWiqOIPo5xcPRS4Eb1UqXWH6sRti3xq7ZIuDFXPGVVmS
 d3zORFBuvvatVxqI+dym59EwznhCcnXuUYlloXYylGdSdlfo+KX067yP6XIa8U3UYbSBE2g4Jt1
 O9XwMFF8q91Lxo4FmyZnzTlm4tlNvztruWoW4mTOLpzmKaEO0oAuUqLPcwKRhXX0H0ClxXnE8WQ
 q5HA==
X-Gm-Gg: ATEYQzx23saWK06bh99x7a9oH7C86IQ1qFJCYoq6a3f4+EVcxaclkATqsn7je5creNw
 Da1Y1pa/xUGKvXSnl5Lqy5fQ0IA/TMdtHCTZahnJV5Tsbvd+VnnCLu/fOHW/XAfojIIhHh19X1P
 eaDoG6/Dbv+3w70HkzGANq+WvNI41i4b7TS6b9g9d8W2qj/PC2ctIrIqjOUNI+rT4KJNPoJurEd
 oK0p+MFyRGzoNs70QZsEyq0xjx4nMaG3XRC8HypayaAU08jlmYYrI6fkLD1aUXcB8psLNflJ/gp
 5JfxOhNERf9fTsKwUM3uXJAKgaVIHthzVbStJRKMVKLvdMSoJdQk/7zd9qQI7NJJZdgFgw6dgAO
 mCF0ZGNu6Alc=
X-Received: by 2002:a05:600c:1e8f:b0:485:2ce2:4c8a with SMTP id
 5b1f17b1804b1-4854b0a4c24mr109097975e9.1.1773323459797; 
 Thu, 12 Mar 2026 06:50:59 -0700 (PDT)
X-Received: by 2002:a05:600c:1e8f:b0:485:2ce2:4c8a with SMTP id
 5b1f17b1804b1-4854b0a4c24mr109097485e9.1.1773323459224; 
 Thu, 12 Mar 2026 06:50:59 -0700 (PDT)
Received: from thinky ([217.30.74.39]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-439fdf09abesm8106385f8f.0.2026.03.12.06.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Mar 2026 06:50:58 -0700 (PDT)
Date: Thu, 12 Mar 2026 14:50:57 +0100
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <ymisdrze3ohdnxa4inqfwp4riaz4qk5nmtil33adn5ukhngq7v@f3tcv3hbzobz>
References: <20260309192355.176980-1-aalbersh@kernel.org>
 <20260309192355.176980-20-aalbersh@kernel.org>
 <20260310012914.GG1105363@frogsfrogsfrogs>
MIME-Version: 1.0
In-Reply-To: <20260310012914.GG1105363@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CMXNrEKYO87B-ZqZOGU4ggXrCot75M4sCgn3yAVPvqE_1773323460
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026-03-09 18:29:14,
 Darrick J. Wong wrote: > > XFS preallocates
 spaces during writes. In normal I/O this space, if > > unused, is removed
 by truncate. For files with fsverity, XFS does not > > use [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1w0gRQ-0007mZ-Lg
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
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	TO_DN_SOME(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,redhat.com:s=mimecast20190719];
	FORGED_RECIPIENTS(0.00)[m:djwong@kernel.org,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,redhat.com:-];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[aalbersh@redhat.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: 282B9272EBC
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-09 18:29:14, Darrick J. Wong wrote:
> > XFS preallocates spaces during writes. In normal I/O this space, if
> > unused, is removed by truncate. For files with fsverity, XFS does not
> > use truncate as fsverity metadata is stored past EOF.
> > 
> > After we're done with writing fsverity metadata iterate over extents in
> > that region and remove any unwritten ones. These would be preallocation
> > leftovers in the merkle tree holes and past fsverity descriptor.
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > ---

> There's an upper limit on the number of blocks you can unmap/free in a
> single transaction.  Maybe move the xfs_trans_{alloc,commit} into the
> loop body?
> 
> Oh wait, you skip the written extents.  Ok, so maybe just roll it after
> you've done a bunmapi.

I see, I will add a rolling transaction. Btw, why skipping the
written extents let's us use rolling here?

> 
> Do you need to purge the cow fork too?

hmm, what case are you thinking about here? The fsverity is written
in past EOF region, I don't see how COW extent could be left there.
Can they somehow be left mapped for blocks past i_size?

-- 
- Andrey



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
