Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ULJvKTb0w2lZvAQAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2026 15:41:58 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE5B7326EE0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 25 Mar 2026 15:41:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:MIME-Version:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CHU4PmDn12ZMQu2LIABIHqBVp6aj6R5D2ybPdaMJOIg=; b=GeA96Ksea5MSPvzVBSWdeey8hN
	8uGnE2iDVH90Pz2XdUIbOT6scWUqklmeiGgsh/84nWS87iowmrIPPQ61wu53LNghJxC8/eWzI2HU1
	O3i2Nf5eLst8SPYgaiFybIrE+VRfxdbv+8RD/UbZekUPCl2C0uLmTLO1IyEO8DwA/nw8=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w5PQa-000545-LF;
	Wed, 25 Mar 2026 14:41:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@redhat.com>) id 1w5PQH-00053S-L4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Mar 2026 14:41:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:In-Reply-To:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zq66uLldOzJDWwFuTQSicat9HZ9onClHiQ97FMgB8gk=; b=fU6coyJlZuIC0B1eO3kq2d12br
 sEx9iDcTWKrv2ndiWJHS9NdADSRcVeyU/Jc/cjf4RThR3PR/vTRiPpJeNnEzqKITnRVaLABPc9/+A
 3Fl3uYEuR0jrE6dnCUdc52TW8uiHD3GlIQ7SsIAuLi4cPF7HlTtcOzjglvYi5AaL241c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zq66uLldOzJDWwFuTQSicat9HZ9onClHiQ97FMgB8gk=; b=OB4+k8Fxksfyb8V4e0rUQc8mPt
 q9A2aJSB0u1Mi38CBxVlsMTacNOaUc/YgLb1guHjQFX7QeYCyV6uiUGhx+QUriR2ZNC2PflBIt0cP
 0+twGdbDam35TSzm/bw+a8IwpUfjGW2TjZTCfbFXzQw9H2LlWbH3nNyzV4DRlP+Sm86c=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w5PQ4-00037l-Id for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 25 Mar 2026 14:41:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1774449670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zq66uLldOzJDWwFuTQSicat9HZ9onClHiQ97FMgB8gk=;
 b=BLUxvSCFKQCFlHCyVWzeQNNRL1Wjjb7iM9BqcC731R37N3ETvJ3O1AZCnl4WFdLxiixBwB
 8njFUDfmxMebV5a7t1JGZ9N7wLV/d1Y+eFFaXg4VSh/J5+r3MqS3HTqfcpd2fByqWvgddr
 IYHFCedt4ngXuVV/hAP1mUtEv5m4ONs=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-87-1NGCXMEuXv2zGvxZAfg-1; Wed, 25 Mar 2026 08:38:11 -0400
X-MC-Unique: 87-1NGCXMEuXv2zGvxZAfg-1
X-Mimecast-MFC-AGG-ID: 87-1NGCXMEuXv2zGvxZAfg_1774442290
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-439af7ba802so4791888f8f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 25 Mar 2026 05:38:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774442290; x=1775047090;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zq66uLldOzJDWwFuTQSicat9HZ9onClHiQ97FMgB8gk=;
 b=WtpGLkr9YP6T91CSxIMXdRli7C3v3N9tVWlvXvuOFUgvW4HVJW8WIuOCrewdN0zVM3
 fwhSD39bOLl6y9rZg2zvtt+w4HhI1UuYMG78LP4qGudhBLz0R3kzceUsQClY9NO1tpcC
 Im5rQwL4TrulUf4TnQae82KCNJa47Ys19Hcxi3/f6hDxKCRTnI7Oh8mBV2DMxa6Xytrl
 xVWIGsOVjQP0XE6Vw54nrkgb+s+/1bZ8/vuXT7M4uO/8Z4n7RxYm0Lg1xyyAimzP3bi6
 PYI+KRCcB7hKzB79mi/c6UFdRWRTPAXsX/wOsL8czWJOGoZa4265PsZbWycB896SLzKt
 s3BQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUdA7Yqq3saVcTndD7kj+Z3prG+xwByojWNN/xgeBIWxRTqfHsvcoHqrgg1HbuqArolwNkOHPJCUrsmst0BO3zS@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzYxmusisWMB6+lc+Dro+tgvADjhPFf3BuC/wcKKDc+r1KQYTv1
 eOYzgy7kuS0AYW+gi0GthBjaVjlF0ko2sQgWC6K6RMQ0EAbmREQrifQoXBDXG08zSa6Yq4YpCqF
 iuRFLZV/SrMXKpLr7hQM0Z/Aa7IjJWLLBcYZ/LU3wEEVgSM0EFXMz0GM5qIx/xI684KWyp70KFV
 A64Q==
X-Gm-Gg: ATEYQzwWhUBLiPVCDuabhl6MFDoQwhrOU+IRe/14Suv9h6a67kWnp1Dfaf0WJy1n60P
 4ZgiyJnybhnhQ2iyRI557rfG9U8lUlTnJEJ/ozkyTwufihFHbaQy7SOJetPbwexQZZd1d0BEF6p
 NiBJEQzTaNB45bi3ZLKHTfBSgUSaAbXlc/4Wk5P4UZoNk7udR5vz3NjhZu6QLNWfU0/mO5mPXkb
 SuX7TmmoFMD/mdl6vs8LCsqGM5up3ALBdLln4iGRorgwF5nbAjn6GChehki2Fayy2dsj4L/9vNy
 OcVKumH3FT7SIr34KQFpn+H9rPkUJZxJhc1zP2Y/xFcXJBz9vDDKPldUWYeuv8FsQ6czw3FmQnn
 ovw6U0wuPvc1q4Q==
X-Received: by 2002:a05:600c:3f16:b0:483:6d42:25c6 with SMTP id
 5b1f17b1804b1-4871606db4amr51426145e9.23.1774442289647; 
 Wed, 25 Mar 2026 05:38:09 -0700 (PDT)
X-Received: by 2002:a05:600c:3f16:b0:483:6d42:25c6 with SMTP id
 5b1f17b1804b1-4871606db4amr51425715e9.23.1774442289131; 
 Wed, 25 Mar 2026 05:38:09 -0700 (PDT)
Received: from thinky ([91.245.205.131]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-487116ee57esm120806865e9.14.2026.03.25.05.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Mar 2026 05:38:08 -0700 (PDT)
Date: Wed, 25 Mar 2026 13:38:07 +0100
To: Christoph Hellwig <hch@lst.de>
Message-ID: <std5dib2mf5nfd2gf3jbrhujvqr2tytczplopwfy4zrxrrmrgj@py7g4alrifbi>
References: <20260319170231.1455553-1-aalbersh@kernel.org>
 <20260319170231.1455553-8-aalbersh@kernel.org>
 <20260325080021.GF952@lst.de>
MIME-Version: 1.0
In-Reply-To: <20260325080021.GF952@lst.de>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Rs1v4AOYp_K1wHkehZuYZmh8OGOePRQYYNtum2qaQ88_1774442290
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2026-03-25 09:00:21, Christoph Hellwig wrote: > > @@ -353,
 9 +353,
 16 @@ static inline bool iomap_block_needs_zeroing(const struct iomap_iter
 *iter, > > { > > const struct iomap *srcmap = iomap_iter_ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [170.10.129.124 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w5PQ4-00037l-Id
Subject: Re: [f2fs-dev] [PATCH v5 07/25] iomap: introduce IOMAP_F_FSVERITY
 and teach writeback to handle fsverity
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
 Andrey Albershteyn <aalbersh@kernel.org>, djwong@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
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
	FORGED_RECIPIENTS(0.00)[m:hch@lst.de,m:fsverity@lists.linux.dev,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-xfs@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim]
X-Rspamd-Queue-Id: EE5B7326EE0
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On 2026-03-25 09:00:21, Christoph Hellwig wrote:
> > @@ -353,9 +353,16 @@ static inline bool iomap_block_needs_zeroing(const struct iomap_iter *iter,
> >  {
> >  	const struct iomap *srcmap = iomap_iter_srcmap(iter);
> >  
> > -	return srcmap->type != IOMAP_MAPPED ||
> > -		(srcmap->flags & IOMAP_F_NEW) ||
> > -		pos >= i_size_read(iter->inode);
> > +	if (srcmap->type != IOMAP_MAPPED)
> > +		return true;
> > +
> > +	if (srcmap->flags & IOMAP_F_NEW)
> > +		return true;
> > +
> > +	if (srcmap->flags & IOMAP_F_FSVERITY)
> > +		return false;
> > +
> > +	return pos >= i_size_read(iter->inode);
> 
> This might be a good time to document the various reasons for needing
> zeroing.

something like this?

--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -344,9 +344,27 @@ static inline bool iomap_block_needs_zeroing(const struct iomap_iter *iter,
 {
        const struct iomap *srcmap = iomap_iter_srcmap(iter);
 
-       return srcmap->type != IOMAP_MAPPED ||
-               (srcmap->flags & IOMAP_F_NEW) ||
-               pos >= i_size_read(iter->inode);
+       /*
+        * If this block is not mapped, we don't have any backing blocks to read
+        * yet
+        */
+       if (srcmap->type != IOMAP_MAPPED)
+               return true;
+
+       /*
+        * This block just got allocated and does not contain any meaningful data
+        */
+       if (srcmap->flags & IOMAP_F_NEW)
+               return true;
+
+       /*
+        * fsverity metadata is stored past i_size, we need to read it instead of
+        * zeroing
+        */
+       if (srcmap->flags & IOMAP_F_FSVERITY)
+               return false;
+
+       return pos >= i_size_read(iter->inode);
 }

> 
> > +/*
> > + * IO happens beyond inode EOF, fsverity metadata is stored there
> > + */
> > +#define IOMAP_F_FSVERITY	(1U << 10)
> 
> This comment feels a bit too sparse.  Here is my interpretation of what
> this flag does:
> 
> /*
>  * Indicates reads and writes of fsverity metadata.
>  *
>  * Fsverity metadata is stored after the regular file data and thus beyond
>  * i_size.
>  */

Thanks! I will update it

-- 
- Andrey



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
