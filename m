Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ENHFEoHNqWl+FQEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 19:37:53 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 790432170BC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 19:37:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cid67RHHautGZiLEwBlOekryk7WLOQPsHlyOtJ0IoJk=; b=fD0MoexBDOBvGpbcRe5RYfdJ/o
	31MXAjlpON3cRdr47XBgVfg9sSr9HikoLNIzPtWhZh4Y0eJZfIvuib0QOYhy1U9CIY5Mnlh/7hlUP
	eRjXByCSZcf4JknuSmPpSqxHmoGX3h3XHtLealO8EiJNgHEPN1NV20eIhi9+5RHUsYDQ=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vyDZy-0001xA-VV;
	Thu, 05 Mar 2026 18:37:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <agruenba@redhat.com>) id 1vyDZy-0001x3-4Y
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 18:37:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R6dH8XgJiObtxOpcsUX3tskHijiwulWb20uGf7t+NqY=; b=JXWceTLqu2sNLyoYsNSi/gH6RH
 c4GnHFReQesbIweqXdlUS3chhkXzXlIHgmO4GWTRC4V2rdhbPLPZhYObcBHiYM9wp14gK8MqyL3oG
 v13M1MDTIY6t2KHcpTPVyZppsueomtTQfFOnlIZgNWpekYVLUwCmPMGZ9g1E/KE7iRTU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=R6dH8XgJiObtxOpcsUX3tskHijiwulWb20uGf7t+NqY=; b=PWbpdbfHB0lEzqqPVW4uABkgiK
 /4NcI+fruDQLxd9iw6z/aLldsy6q3bs0MVEANC8xfAyQ6JYKT3Y71axufGV9ClDHuWisMdU88S1lk
 t2hgHPmPzORtNtWnkY+qZv/V3aj/3BNe7gBdIu5X40FnP3EWO7QigzCQMeOjFTd8QJGU=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vyDZx-0000Qb-OG for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 18:37:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1772735859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=R6dH8XgJiObtxOpcsUX3tskHijiwulWb20uGf7t+NqY=;
 b=GMSvzMawyK+f5DnL6FSGjgCNefvwZroZ0qrfMOOLKMI2sg0Ig/xOie+TP4mLL41GABAdCR
 VUNjfZBvncRkNVM+OQ0xk+g26CqSDtQnm/jgIUItcrp/g+4dZHxxy7o8U7KuzljAnWeoNy
 k25ysmExwfRBSAtcnRTksL9kAzVMUTs=
Received: from mail-yw1-f197.google.com (mail-yw1-f197.google.com
 [209.85.128.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-440-E_QEA81IP7eC1uH9sZGYIQ-1; Thu, 05 Mar 2026 13:37:38 -0500
X-MC-Unique: E_QEA81IP7eC1uH9sZGYIQ-1
X-Mimecast-MFC-AGG-ID: E_QEA81IP7eC1uH9sZGYIQ_1772735858
Received: by mail-yw1-f197.google.com with SMTP id
 00721157ae682-7987861595eso148963587b3.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 05 Mar 2026 10:37:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772735858; x=1773340658;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=R6dH8XgJiObtxOpcsUX3tskHijiwulWb20uGf7t+NqY=;
 b=h3TySz5LC94mkj6/rwwUmn06B3CCHKYLQpuGlpxdTPOIrcNAPiLozs7qA0j8un7tvL
 5lRD9kZ14LC/MWTglqCe+U8mNGXOHc7AO+PMydwDCy4F3PIxCew8hiDLNrqDej904JOy
 bfv3FlydPavBFL8sfpLD1JZVZvfNutBkTS8f9Ujb0v220Cnt1UL8LkcpSp7U9UkNeopm
 LgwZJFvZ3D/L3UbS8S6tLG0XLmkeYehqtLGjJ8nFDEzCpG3cJX1cXa3tTN4lhaElTbrR
 9Lluu/8hZ9tF9d0hI7aJteg5Q5wso5rBXKvZJU+TQVUAZwoHaH2o/NuXkHHhirZmRdP8
 ezBg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXi+HWbuulYOFHX/OyzqCnzopOUlzPoNKUiC9IAygvJ3AnYjg5T3B/w/+K4VxslzBe8KEuOZ7S2Rbq3hyB7tRUA@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyuFjbMwu1m79+ljvNyc2+4kBOgRDK9vf98xhVAMvMsajaHxSbv
 H8jRCZEgDkqgzg4ZseG130pi84PPXd0ZHuoVc0kEOtFQp/pTFQtxqNEzq9iB4ztopvst+3jAE2x
 MzQu9PqMBPIqB+s/cJtG8eqBekW90OmKjPseEqLL7wE0zViQJRNSezkl8SaKzZG4vAlqLxcyMVU
 cXJDqM+cyU0GLWAoS+xBjiJ6OM+kZ9TpIb+VvJjp38K0/1jGCWyN88yA==
X-Gm-Gg: ATEYQzxXRrhB9D6nZVgDoOrbzNczaf6FKTWTAgDUIQ5LIkHYw0DA6O/4i057oTDE6R8
 eAP5hynAk2VepvkV/W5ztfQWYUu2WCVxjH/KMlVeDIHwh94OyZ1yhdE5dXVZQ6cJYBpVUqtwK4K
 vNNUpcOqfhrU4eb2AnD9OIZlxIfHvxyoil2TWkM9TtRsnhKxzfU2psnTF/WyiSvHjrqAX7f4HEM
 CHJdaT9AK2NEbP9VW0G9d33qHXWUSQf/fuse0NhCKaNJHABuu4ImgutFJWfvKt9hg==
X-Received: by 2002:a05:690c:c513:b0:798:647f:239 with SMTP id
 00721157ae682-798c6c01a87mr55056827b3.21.1772735858038; 
 Thu, 05 Mar 2026 10:37:38 -0800 (PST)
X-Received: by 2002:a05:690c:c513:b0:798:647f:239 with SMTP id
 00721157ae682-798c6c01a87mr55056657b3.21.1772735857680; Thu, 05 Mar 2026
 10:37:37 -0800 (PST)
MIME-Version: 1.0
References: <20260304190424.291743-1-agruenba@redhat.com>
 <20260304190424.291743-5-agruenba@redhat.com>
 <aamP2qNKEmiyXQQH@infradead.org>
In-Reply-To: <aamP2qNKEmiyXQQH@infradead.org>
Date: Thu, 5 Mar 2026 19:37:26 +0100
X-Gm-Features: AaiRm500QkwsYOPyC8DDeTtG7W1JPyGlNX5bDWdmiHocLDeSRR23AHcZAF5cQWI
Message-ID: <CAHc6FU5sEivMqj38xrAXuTxZ0d19LJjxbvoWtsPqm6NYigAEhA@mail.gmail.com>
To: Christoph Hellwig <hch@infradead.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zdfR-T7b0_Lq0_CWS8gWCaVgyui5UfVP7gqHP34qEpY_1772735858
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Thu, Mar 5,
 2026 at 3:14 PM Christoph Hellwig <hch@infradead.org>
 wrote: > On Wed, Mar 04, 2026 at 08:04:09PM +0100, Andreas Gruenbacher wrote:
 > > Instead of setting bio->bi_status to BLK_STS_IOER [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vyDZx-0000Qb-OG
Subject: Re: [f2fs-dev] [PATCH 4/4] bio: use bio_io_error more often
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
From: Andreas Gruenbacher via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Andreas Gruenbacher <agruenba@redhat.com>
Cc: Jens Axboe <axboe@kernel.dk>, dm-devel@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, linux-bcache@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, drbd-dev@lists.linbit.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 790432170BC
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,redhat.com:s=mimecast20190719];
	FORGED_RECIPIENTS(0.00)[m:hch@infradead.org,m:axboe@kernel.dk,m:dm-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:linux-bcache@vger.kernel.org,m:hch@lst.de,m:drbd-dev@lists.linbit.com,s:lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,redhat.com:-];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[agruenba@redhat.com]
X-Rspamd-Action: no action

T24gVGh1LCBNYXIgNSwgMjAyNiBhdCAzOjE04oCvUE0gQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBp
bmZyYWRlYWQub3JnPiB3cm90ZToKPiBPbiBXZWQsIE1hciAwNCwgMjAyNiBhdCAwODowNDowOVBN
ICswMTAwLCBBbmRyZWFzIEdydWVuYmFjaGVyIHdyb3RlOgo+ID4gSW5zdGVhZCBvZiBzZXR0aW5n
IGJpby0+Ymlfc3RhdHVzIHRvIEJMS19TVFNfSU9FUlIgYW5kIGNhbGxpbmcKPiA+IGJpb19lbmRp
byhiaW8pLCB1c2UgdGhlIHNob3J0aGFuZCBiaW9faW9fZXJyb3IoYmlvKS4KPgo+IEknbSBhIGxp
dHRsZSB0b3JuIGhvdyBnb29kIHRoZXNlIGhlbHBlcnMgYWN0dWFsbHkgYXJlLCBhcwo+IGhhcmQg
Y29kaW5nIG9uZSBzcGVjaWZpYyB0eXBlIG9mIGVycm9yIHNlZW1zIHRvIGNyZWF0ZSB3ZWlyZAo+
IGNvZGUgYW5kIGxlYWQgdG8gYnVncyBsaWtlIHRoZSB4ZnMgb25lIHlvdSBmaXhlZCB5ZXN0ZXJk
YXkuCj4KPiBNYXliZSB3ZSBqdXN0IG5lZWQgYSBiaW9fZW5kaW9fc3RhdHVzKCkgdGhhdCBhbGxv
d3MgcGFzc2luZyB0aGUKPiBzdGF0dXM/CgpJJ20gbm90IHBhcnRpY3VsYXJseSBhdHRhY2hlZCB0
byBiaW9faW9fZXJyb3IoYmlvKTsgaXQncyBiZWVuIGFyb3VuZApmb3JldmVyIGJ1dCBpdCBjYW4g
YmUgY29uZnVzaW5nLiBBbnkgdGhvdWdodHMgb24gcmVwbGFjaW5nIGl0IHdpdGggYQpuZXcgYmlv
X2VuZGlvX3N0YXR1cyhiaW8sIEJMS19TVFNfSU9FUlIpIGhlbHBlciBpbnN0ZWFkIG9mIGtlZXBp
bmcgdHdvCm1lY2hhbmlzbXMgZm9yIGRvaW5nIHRoZSBzYW1lIHRoaW5nPwoKPiBBbHNvIHlvdSBy
ZWFsbHkgbmVlZCB0byBzZW5kIG9uZSBwYXRjaCBwZXIgc3Vic3lzdGVtLgoKSSdtIHJlYWxseSB0
cnlpbmcgdG8gYXZvaWQgdGhhdCBmb3Igc2ltcGxlLCBvYnZpb3VzbHkgY29ycmVjdCwKbWVjaGFu
aWNhbCBjaGFuZ2VzIHRoYXQgY2FuIGJlIHJlY3JlYXRlZCBmcm9tIHNjcmF0Y2ggYW55IHRpbWUu
CgpUaGFua3MsCkFuZHJlYXMKCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlz
dHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
