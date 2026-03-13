Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLRfEv0gtGnahgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 15:36:45 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CF2028519A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Mar 2026 15:36:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Message-ID:Date:In-Reply-To:References:
	MIME-Version:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wzH5pyjbX8dxnhQ4mU6UZKy1MH5fbk0/2QAZQnjvTL8=; b=fDx5rdObcOrRKM8mzaSyEjC94w
	s627bVgCbxEjEPXNHI+y3L73C0RIVZwruEunJ3K3KNF2IRer2T0xW0jTvAHNyTm4peYx4qipPgHHp
	4rDtlD4iPlQAmcg/hZLBJcZ89IvUKOBZMkJeHKcmnBW8p3rUMz0ocO9V8T1D7hCwZWWE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w13ct-0000Ge-5n;
	Fri, 13 Mar 2026 14:36:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <agruenba@redhat.com>) id 1w13ch-0000FB-5g
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 14:36:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bJMneynKGatLodHqYQuBMM3+if+Rl1AvLNuNJYWpNo0=; b=WH/Y8Iztm+di3Et0venEyDVrWg
 CutjzO5VWLB7K18QOGx7PtCTC9jn9ZBUd4XyBWwoNnaVQt46T488rl/FZsvYUo2QX6kL8sq9ZJPlX
 gvGoXD6sju0ydDF+sDQtkgkvtOjsb5bt16+KDng8So3XkoPhbpJnQUzisXc+xozU/JQY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bJMneynKGatLodHqYQuBMM3+if+Rl1AvLNuNJYWpNo0=; b=agWZN45iXesINh2D2++AVofHyK
 Wcoan2JCTOK37RwtV1933tvO8n7YvFKP0mXV/Y8I3WJCtyN5+3/LK81C2bNPRXVlw4oRBNv9aG50f
 TPmOjKEksDYwWglM8SB6UFfJCbqRRqSy5ruHlHtjv0ebXk9DOZI2U3r1ryQ+oyX8cZM0=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w13cg-0001Am-Na for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Mar 2026 14:36:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1773412566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bJMneynKGatLodHqYQuBMM3+if+Rl1AvLNuNJYWpNo0=;
 b=bJDfwZvM3UuIGDgKB0x0JrhPhxpmFhmLgp3oZRZbbgjsp1rbzmSpXQIzo+B/NybSvhTFA1
 8hqM63LjMWvPpPkSLBq/UYcAlHZ+SiGbbX9iADAiWJaHjF0J0tsJDOjHqE1B8heL+cEif6
 McWmz+BkhqKrvdIeK0o8YxJb6QFJ7jA=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-94-wyTnMVW6OESGqnv5d59mLw-1; Fri, 13 Mar 2026 10:36:05 -0400
X-MC-Unique: wyTnMVW6OESGqnv5d59mLw-1
X-Mimecast-MFC-AGG-ID: wyTnMVW6OESGqnv5d59mLw_1773412565
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-79832285fa1so24540397b3.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 13 Mar 2026 07:36:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1773412565; x=1774017365;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=bJMneynKGatLodHqYQuBMM3+if+Rl1AvLNuNJYWpNo0=;
 b=XzbNy5/s20hzKAIDm7GuAXQwkjzqY1OGrlouej/8d16EavDwIi8NDGobjV4RUVLXA1
 lIwB23ZTmFsuSXnlFpP9UeiFHa/03/eQxOT/Bk/VdLwLMCrxqfxPWkjXWL9xSlgkm+yK
 mSKkyADv7xn57nm3iN/wV6nA9YZl2hAkAZ5GbsCBx2fEWvUtAS55z4d3s982wGa2wTlw
 HhyOz3TC0H0vOcD20TyZyj3eomdAmnNYp04+e4PIJVGNNr1BMesw1yTKSGXiDigoWv/x
 xGSsPeyPjWEQZCyuE/GiOmQAEwc5dasuk33b1Sr9/UeXvBv61y7MGeXvpesthsNtmF2U
 Y6Eg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIqXk61DauD9+NmyDze7B+IJ5saGSMIgESlHHKSqcg745H0LMo2ZW3/V8O+QIl1L0zrDkFUqRs58Yi0b6mvrTg@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyQWhAxKW9PehX3bA97StWTD5fFKi+v6QdlxUsb1TGecwsWlnIM
 C+KAXo5k8GT8FaVm6sGMVFmGknb3il4wnbw8U6/ofvVG7VhEiAgu4F/nfw9SzGFYEc+fpOtXIh+
 1DLiE0aeMHqFOubVtcRroCYO3UXWTr6vxAcmcgPu2tnk1qLoouNqcdG2QbcYP9GeO9JXnFsDkp/
 AsJvns6u5sbU8NQNuzFaMjW1f4DkaIk2ASLsLglhgknoQR5lbVpkS5LQ==
X-Gm-Gg: ATEYQzzcE6QLYpFFjno6hXqknunuIVZ1/yYkYpiy4KtONBHeSlksEZ94D2G7qqdevUd
 EKRQK8sdV2dTw7E1Zcq1tE5sx+9zNLW294x9SspVy1IEDaXf4Dnrv1Rxgx0N1WyE1iOridFMVHo
 TDkkPvVEqjIyf16GyDqVoyBGR2wjBwvXY+/Ud+vg94vcnc33ZcsbiZKbmAGribWvhHhz6pexRSW
 XRD7osYRE2w2xKGpAKH8DRdFLcUO93JDj3/auT0MEcRWJPcHUIl9hcoB4Lh4J/mQg==
X-Received: by 2002:a05:690c:c1d5:b0:798:711f:a0a5 with SMTP id
 00721157ae682-79a1c10febemr31150417b3.29.1773412565244; 
 Fri, 13 Mar 2026 07:36:05 -0700 (PDT)
X-Received: by 2002:a05:690c:c1d5:b0:798:711f:a0a5 with SMTP id
 00721157ae682-79a1c10febemr31150237b3.29.1773412564819; Fri, 13 Mar 2026
 07:36:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260304190424.291743-1-agruenba@redhat.com>
 <abQHNzJ0FR1EF0NX@shinmob>
In-Reply-To: <abQHNzJ0FR1EF0NX@shinmob>
Date: Fri, 13 Mar 2026 15:35:53 +0100
X-Gm-Features: AaiRm50KyYlBUXDBLdnEEHXDx37wzlGjPP-UmRDDKX74QQoo2rYJKifETYROgh4
Message-ID: <CAHc6FU7bab0+snOVBog-FZkn_sy3AHoEP2SNFxdZ-n13tAE5Ng@mail.gmail.com>
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YaVLSIfbuVLd11y2iRMXq6jLkdj7Y-2wzkQWcRvGsj0_1773412565
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Mar 13,
 2026 at 1:54 PM Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
 wrote: > On Mar 04, 2026 / 20:04, Andreas Gruenbacher wrote: > > Jens, >
 > > > here are some simple bio related cleanu [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [170.10.133.124 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1w13cg-0001Am-Na
Subject: Re: [f2fs-dev] [PATCH 0/4] simple bio cleanups
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
Cc: Jens Axboe <axboe@kernel.dk>,
 "dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.51 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:shinichiro.kawasaki@wdc.com,m:axboe@kernel.dk,m:dm-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:linux-bcache@vger.kernel.org,m:drbd-dev@lists.linbit.com,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	TO_DN_EQ_ADDR_SOME(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,redhat.com:s=mimecast20190719];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,redhat.com:-];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[agruenba@redhat.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_SENDER_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[wdc.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 8CF2028519A
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

T24gRnJpLCBNYXIgMTMsIDIwMjYgYXQgMTo1NOKAr1BNIFNoaW5pY2hpcm8gS2F3YXNha2kKPHNo
aW5pY2hpcm8ua2F3YXNha2lAd2RjLmNvbT4gd3JvdGU6Cj4gT24gTWFyIDA0LCAyMDI2IC8gMjA6
MDQsIEFuZHJlYXMgR3J1ZW5iYWNoZXIgd3JvdGU6Cj4gPiBKZW5zLAo+ID4KPiA+IGhlcmUgYXJl
IHNvbWUgc2ltcGxlIGJpbyByZWxhdGVkIGNsZWFudXBzLiAgQW55IHRob3VnaHRzPyAgQ2FuIHRo
b3NlIGdvCj4gPiBpbiB2aWEgeW91ciB0cmVlPwo+ID4KPiA+IFRoYW5rcywKPiA+IEFuZHJlYXMK
PiA+Cj4gPiBBbmRyZWFzIEdydWVuYmFjaGVyICg0KToKPiA+ICAgYmxvY2s6IGNvbnNlY3V0aXZl
IGJsa19zdGF0dXNfdCBlcnJvciBjb2Rlcwo+ID4gICBibG9jazogZ2V0IHJpZCBvZiBibGtfc3Rh
dHVzX3RvX3tlcnJubyxzdHJ9IGluY29uc2lzdGVuY3kKPiA+ICAgYmlvOiByZW5hbWUgYmlvX2No
YWluIGFyZ3VtZW50cwo+ID4gICBiaW86IHVzZSBiaW9faW9fZXJyb3IgbW9yZSBvZnRlbgo+Cj4g
SGVsbG8gQW5kcmVhcywgZHVyaW5nIGJsa3Rlc3RzIENJIHRyaWFsIHJ1bnMsIEkgbm90aWNlZCB0
aGF0IHRoaXMgcGF0Y2ggc2VyaWVzCj4gdHJpZ2dlcmVkIGZhaWx1cmVzIG9mIHRocmVlIGJsa3Rl
c3RzIHRlc3QgY2FzZXM6IHNjc2kvMDA0LCBzY3NpLzAwNyBhbmQKPiB0aHJvdGwvMDA0LiBEbyB5
b3Ugc2VlIHdoaWNoIHBhdGNoIHRyaWdnZXJlZCB0aGVzZSBmYWlsdXJlcz8KCkhlbGxvIFNoaW5p
Y2hpcm8sCgp0aGFua3MgYSBsb3QgZm9yIHRoZSByZXBvcnQuIEkgbm93IHNlZSB0aGF0IHBhdGNo
ICJibG9jazogZ2V0IHJpZCBvZgpibGtfc3RhdHVzX3RvX3tlcnJubyxzdHJ9IGluY29uc2lzdGVu
Y3kiIGlzIGJyb2tlbiBpbiBpdHMgY3VycmVudApmb3JtLgoKQW5kcmVhcwoKPgo+Cj4gc2NzaS8w
MDQgKGVuc3VyZSByZXBlYXRlZCBUQVNLIFNFVCBGVUxMIHJlc3VsdHMgaW4gRUlPIG9uIHRpbWlu
ZyBvdXQgY29tbWFuZCkgW2ZhaWxlZF0KPiAgICAgcnVudGltZSAgICAuLi4gIDMuODU1cwo+ICAg
ICAtLS0gdGVzdHMvc2NzaS8wMDQub3V0ICAgICAgMjAyNi0wMy0xMiAxNToyMzo1NC42NjQ0MzU2
MzkgKzAwMDAKPiAgICAgKysrIC9ob21lL2ZlZG9yYS9ibGt0ZXN0cy9yZXN1bHRzL25vZGV2L3Nj
c2kvMDA0Lm91dC5iYWQgICAgMjAyNi0wMy0xMiAxODoxMzo0MC4wNTk3NDc5ODkgKzAwMDAKPiAg
ICAgQEAgLTEsMyArMSwyIEBACj4gICAgICBSdW5uaW5nIHNjc2kvMDA0Cj4gICAgIC1JbnB1dC9v
dXRwdXQgZXJyb3IKPiAgICAgIFRlc3QgY29tcGxldGUKPgo+IHNjc2kvMDA3IChUcmlnZ2VyIHRo
ZSBTQ1NJIGVycm9yIGhhbmRsZXIpICAgICAgICAgICAgICAgICAgICBbZmFpbGVkXQo+ICAgICBy
dW50aW1lICAgIC4uLiAgMTE1LjM4NXMKPiAgICAgLS0tIHRlc3RzL3Njc2kvMDA3Lm91dCAgICAg
IDIwMjYtMDMtMTIgMTU6MjM6NTQuNjY4NDM1NjQ0ICswMDAwCj4gICAgICsrKyAvaG9tZS9mZWRv
cmEvYmxrdGVzdHMvcmVzdWx0cy9ub2Rldi9zY3NpLzAwNy5vdXQuYmFkICAgIDIwMjYtMDMtMTIg
MTg6MTU6NTUuMDU0OTQ0NTM3ICswMDAwCj4gICAgIEBAIC0xLDMgKzEsMyBAQAo+ICAgICAgUnVu
bmluZyBzY3NpLzAwNwo+ICAgICAtUmVhZGluZyBmcm9tIHNjc2lfZGVidWcgZmFpbGVkCj4gICAg
ICtSZWFkaW5nIGZyb20gc2NzaV9kZWJ1ZyBzdWNjZWVkZWQKPiAgICAgIFRlc3QgY29tcGxldGUK
Pgo+IHRocm90bC8wMDQgKG51bGxiKSAoZGVsZXRlIGRpc2sgd2hpbGUgSU8gaXMgdGhyb3R0bGVk
KSAgICAgICBbZmFpbGVkXQo+ICAgICBydW50aW1lICAgIC4uLiAgMS42NDNzCj4gICAgIC0tLSB0
ZXN0cy90aHJvdGwvMDA0Lm91dCAgICAyMDI2LTAzLTEyIDE1OjIzOjU0LjcxMDQzNTY5NSArMDAw
MAo+ICAgICArKysgL2hvbWUvZmVkb3JhL2Jsa3Rlc3RzL3Jlc3VsdHMvbm9kZXZfbnVsbGIvdGhy
b3RsLzAwNC5vdXQuYmFkICAgIDIwMjYtMDMtMTIgMTg6MjA6NDYuMzE0MzY4NTgxICswMDAwCj4g
ICAgIEBAIC0xLDMgKzEsMiBAQAo+ICAgICAgUnVubmluZyB0aHJvdGwvMDA0Cj4gICAgIC1JbnB1
dC9vdXRwdXQgZXJyb3IKPiAgICAgIFRlc3QgY29tcGxldGUKPgoKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcg
bGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3Rz
LnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
