Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sNizMXpWsWmGtwIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 12:48:10 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 25AAD263153
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 12:48:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NiqYP76M0sD69mqeIdVG44zPg+0LOSVzoBiM+nkGZH4=; b=hvnesloQ04FT4VwtoQh0QmPaPk
	KY4/bzfn586EON5dljBchEMKwpPN6iGyDH2eAV2ShzI90mX6nzzyuAJnYZJMy0GWzv6ptmsCc8scG
	GOT/RwXcIzzeomREi13bYBh1gCsQnmIQ5hoancLl7RWV59iJ/XzI3IGirHQv8Y1lY/7k=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w0I2k-0000Wn-CF;
	Wed, 11 Mar 2026 11:48:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1w0I2j-0000WW-9X
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 11:48:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=asRPjwI5YmOjCP6UVRlsstGP3cgkUliMF2dXi85Qbqg=; b=bI8MP1xqF4kDoqNbNVmiNJHz1+
 0F9nswKk8U5T9Yd7c5+SZRUfQZDNN3idfo1MJW0Dcvt9dkpu4rjgXqEgeOgx7Hj2oiT6JcZHrhxfN
 q32gVkQVmoXqRNLQpNaOlO+d2xZF5GLshtNIdlWUTnwcywBxc7ILOpNHWnRD9XL2dHH8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=asRPjwI5YmOjCP6UVRlsstGP3cgkUliMF2dXi85Qbqg=; b=WXp45A07TEBCqHCeI69/ehMGYo
 0K+aBAsOx1PQB3iJ/LYd4f5XIMOGLPpX1pw8cbREYGihlEEf3cQmoiT26snrYKEyJHWhCqpeWxyzz
 oAYEkWNeaW723RWAIqT6Mc5RgpOAY9lpbfkZRQorBYuaG7BdFeS6xc1RMIyofdhxgaYQ=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w0I2i-0000c3-SL for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 11:48:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773229669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=asRPjwI5YmOjCP6UVRlsstGP3cgkUliMF2dXi85Qbqg=;
 b=bpDtRo8RGzTpUVtHbeV1Dfx0edUf99zv/AurKK0p6Dim+ZIAMOCXO7FMDOlawS4Rb8c/WA
 kDxSil3Q8EuN3ShfFOJ7Fgm/6/dGhp4m6qbLKVuxnItza5G0IH65V+pKHgmfh4icuuFJ0x
 ZNn6YPCSolzS/a0CWqsPLlfvyWO+pHk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-97kl7XBTNbi35PYjw6teSA-1; Wed, 11 Mar 2026 07:47:48 -0400
X-MC-Unique: 97kl7XBTNbi35PYjw6teSA-1
X-Mimecast-MFC-AGG-ID: 97kl7XBTNbi35PYjw6teSA_1773229667
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-4853ac455b2so29591625e9.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 Mar 2026 04:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1773229667; x=1773834467;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=asRPjwI5YmOjCP6UVRlsstGP3cgkUliMF2dXi85Qbqg=;
 b=mTigLpafsXgDqs45CdkgY4TBnPhBfc1VUCSIdcXpcR9ztPbniZZFVwII2GzcBu+Ssm
 OVJac6SotVvDw32eD+gzZ9NW8uWQLzSFl7arexRlCWnYccT6CFvV6ZLugw4tMHUXk1A5
 oOGySZouc/GPEnwH2254c3xoOkXHX2S2ImlWMzwIT42U7tbCqPFS4l0h+EXCqtcElh5n
 Z9ZdPU8zfCq0cZEAzxL8867bK+arNgj5aqdsoOWSm+EEDBqkZvoY0TphZ1KqN24Gfc30
 w3mAABb2esntcsRBbCFbYi3v6xu8eOyETpMTmYNM4SCaOHiXFMQEeshP6jhxGmqNjvgx
 Oimg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpJM0OMNE+SzxgrCzAwWwEGwfHeyZXFeRfOskpzHWib6IPzv1ZXzbg57wHBj3IQUa9k721EoNnIY4k4GqU6qe2@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw/uGKC4iEodNdYStQs9GG31uRaFfytLfw2ygAHAdA0NLot++O+
 5YkCX4xxAb2gyMz37KosxoIolC8lhOGMm36i/O7KdaYmBsa/u2lJon36Z/F612GyQv9ZjRRBhg9
 eimTLyJxgYClSx4KolaYMy6NYDQjxaAQafPaPCGoRfwwm8MRliPyvYASpd9Dj+2KdZS5MfK0KlI
 zhwg==
X-Gm-Gg: ATEYQzz7JVmfBkmuk7hkd/L1jqq2vlGinCMqQ8bVE/ZOECd2ITnrYlvZp7kQEkHdFqO
 kqLBHYZQz2zZ9pX6dBtUCSx4TpMkp2tivvusXZ0bDrxdESVfgO/xeUjvpCuaMH6bn59I5AE9tYj
 kfdLHAFrJrqlUDghhomMdDoanzYqx/AuJpdebeXcZosnoSDEmUeBjwkrQ7HJvWPYV7ZvMgvG5UR
 D1TRTHNOV0GHfHJ55ZD2ugBpuVTWsP4zuFUfKsYHf5/CpiYExA6J6NjXCiK3zL+ZQP0J/eqkXV/
 sbLdNRXNkroq73YKAEfQvTYYbWfONFjRuO2pi8o20BLMqpFSfCD/G0pEL33zqFCjBTtbWPARzze
 5GMu70v1tUec=
X-Received: by 2002:a05:600c:6818:b0:485:3ca4:4eee with SMTP id
 5b1f17b1804b1-4854b144e6dmr35215615e9.34.1773229667257; 
 Wed, 11 Mar 2026 04:47:47 -0700 (PDT)
X-Received: by 2002:a05:600c:6818:b0:485:3ca4:4eee with SMTP id
 5b1f17b1804b1-4854b144e6dmr35215345e9.34.1773229666807; 
 Wed, 11 Mar 2026 04:47:46 -0700 (PDT)
Received: from thinky ([217.30.74.39]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4854ad5ee37sm37540885e9.2.2026.03.11.04.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Mar 2026 04:47:46 -0700 (PDT)
Date: Wed, 11 Mar 2026 12:47:45 +0100
To: "Darrick J. Wong" <djwong@kernel.org>
Message-ID: <jezqpw7mjdren3gzvmkxv7dzviisf7mx2n6dwtq3iwgypghvne@z76sdkkk2x7n>
References: <20260309192355.176980-1-aalbersh@kernel.org>
 <20260309192355.176980-2-aalbersh@kernel.org>
 <20260310004627.GV6033@frogsfrogsfrogs>
MIME-Version: 1.0
In-Reply-To: <20260310004627.GV6033@frogsfrogsfrogs>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LTZSr_r3LCqeEgfdqoUMtGLAwCFhuem5XSFvDknsePg_1773229667
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026-03-09 17:46:27, Darrick J. Wong wrote: > On Mon, Mar
 09, 2026 at 08:23:16PM +0100,
 Andrey Albershteyn wrote: > > Reported verification
 errors to fsnotify through recently added fserror > > int [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w0I2i-0000c3-SL
Subject: Re: [f2fs-dev] [PATCH v4 01/25] fsverity: report validation errors
 through fserror to fsnotify
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
X-Rspamd-Queue-Id: 25AAD263153
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:djwong@kernel.org,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,redhat.com:s=mimecast20190719];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,redhat.com:-];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[aalbersh@redhat.com];
	RCPT_COUNT_SEVEN(0.00)[10];
	MISSING_XM_UA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Action: no action

On 2026-03-09 17:46:27, Darrick J. Wong wrote:
> On Mon, Mar 09, 2026 at 08:23:16PM +0100, Andrey Albershteyn wrote:
> > Reported verification errors to fsnotify through recently added fserror
> > interface.
> > 
> > Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
> > ---
> >  fs/verity/verify.c | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/fs/verity/verify.c b/fs/verity/verify.c
> > index 4004a1d42875..99276053d3bb 100644
> > --- a/fs/verity/verify.c
> > +++ b/fs/verity/verify.c
> > @@ -9,6 +9,7 @@
> >  
> >  #include <linux/bio.h>
> >  #include <linux/export.h>
> > +#include <linux/fserror.h>
> >  
> >  #define FS_VERITY_MAX_PENDING_BLOCKS 2
> >  
> > @@ -312,6 +313,7 @@ static bool verify_data_block(struct fsverity_info *vi,
> >  		data_pos, level - 1, params->hash_alg->name, hsize, want_hash,
> >  		params->hash_alg->name, hsize,
> >  		level == 0 ? dblock->real_hash : real_hash);
> > +	fserror_report_data_lost(inode, data_pos, params->block_size, GFP_NOFS);
> 
> Don't we also need to cover the "if (unlikely(data_pos >= inode->i_size))"
> around line 199 in verify_data_block?

make sense, will add it there too

-- 
- Andrey



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
