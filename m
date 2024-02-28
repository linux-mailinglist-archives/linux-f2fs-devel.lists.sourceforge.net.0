Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CE43086AECC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Feb 2024 13:09:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rfIkQ-0007P6-1v;
	Wed, 28 Feb 2024 12:09:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yizhan@redhat.com>) id 1rfIkO-0007Os-Fl
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Feb 2024 12:09:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g6EL9cPhTMAyWmeokXzsYJmYvM8R42YEQq03/6rpHG0=; b=FAJetYEgsrgElXWcnba32kOqBO
 PalwsMVbeh6nO2/j5R69CRxYAjY841RoB78c7P43nPZaVP9mxyjQUJDfLzAvQ8kI/VxKqGRt3gz4B
 hjq21Af62j3f/60hiqONoygCV6f2bbPJzKiYdrMCPjS4Dp6d/2njPcDfpL7aiCww8LqY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g6EL9cPhTMAyWmeokXzsYJmYvM8R42YEQq03/6rpHG0=; b=kL0l7ennHf3EN4o5O7Zcnngx4g
 BkrfTrrd8MIjbtaHVfebcMlDIVRAP0MRUKQd3acy7HiqrTEqjzIvrunGdTOA+nlXQURPA6L08OP4K
 q06+aNpznsTF9GwM0lMQ6Tj7ywwvOH4tmG0FIbNq+ygZrxa+RqJDyL+2TSSv3+AZC8FE=;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rfIkL-0006Rs-Kl for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Feb 2024 12:09:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1709122147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=g6EL9cPhTMAyWmeokXzsYJmYvM8R42YEQq03/6rpHG0=;
 b=F0DUWNarMEvkxgK6EE3kJy2O/GpeLv4pCM60R/Sz2KrEFGc10dV+hf5mEux5sl4rOAErcU
 o+4qncGAPD8XieqO9XkHeht+jtnrlirsWKpdwt9KblQKRn6pbNiQFECN58kigMOSNskPzF
 AN3ktRl9XuKPVa0Jt9YQT0unbNjhCz0=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-S47Atf7NMnKxiV0z1xmXyA-1; Wed, 28 Feb 2024 07:09:06 -0500
X-MC-Unique: S47Atf7NMnKxiV0z1xmXyA-1
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-299cae4f36bso4896715a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 28 Feb 2024 04:09:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709122145; x=1709726945;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g6EL9cPhTMAyWmeokXzsYJmYvM8R42YEQq03/6rpHG0=;
 b=SeHPFENw/alpn6ZMceol0WXBuu2E4lNY8/zTdtWF8Ss5VIucahataOFrhH569fuIai
 BM/KVWUFsShoez7kd6VqvmXRrnzmYgtvHbYIQ8GUAT9eATBPPT2d00O/rVIx0f7tBYZF
 89NrIVolH2uki5dCDSx1+SxLWcC6TedZ68tiqBllEm58JL7GlLDcbLONH+cl7fDwR8mY
 XyrcyFHOp+UmWjwm2oeYUTv/NftHIza5IFfRJbuSsvyrlIE9Caykx/C97zZSeACyMnTM
 YtkZ6wDzbQtm+a9gt4IE1cnZQ9FGZfXkoC/7fN+JpojmU8KJtqt5llD9Z6/7AvEqviU0
 2hLQ==
X-Gm-Message-State: AOJu0Yw+rr+rcx8Gvi+YTtXeLxC72IvJUt+8vXprOawP2GpOC1qryiXx
 Tpqq59vxZTLe9rIko4McX1Mqz3uM2r4yyZ7KGQSBMvie0eXxHK6biKKiHx1qqshWzJBih6/de3G
 NMS/MeeHEMatcduw5V92gmzFMjNrJjkqcSLgMIReGAQrpbLdoMyKXHiEuV6dTOSGG3y3iboF5/P
 n6dKTmuS5qzqCirR4fZvUXHxyqWyu14TrusRBRe93PD9IDryrKjQ==
X-Received: by 2002:a17:90b:ed7:b0:29a:f766:7eb1 with SMTP id
 gz23-20020a17090b0ed700b0029af7667eb1mr970903pjb.23.1709122145147; 
 Wed, 28 Feb 2024 04:09:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGAL2NtuIcb1ggSrgscHzABaov8tWR7lb72b2oO4vsqSCcqUkgX1bnMWtBqKcToHJBlyYlRqIr4Do4MxvqDWMk=
X-Received: by 2002:a17:90b:ed7:b0:29a:f766:7eb1 with SMTP id
 gz23-20020a17090b0ed700b0029af7667eb1mr970880pjb.23.1709122144830; Wed, 28
 Feb 2024 04:09:04 -0800 (PST)
MIME-Version: 1.0
References: <CAHj4cs-kfojYC9i0G73PRkYzcxCTex=-vugRFeP40g_URGvnfQ@mail.gmail.com>
 <esesb6dg5omj7e5sdnltnapuuzgmbdfmezcz6owsx2waqayc5q@36yhz4dmrxh6>
In-Reply-To: <esesb6dg5omj7e5sdnltnapuuzgmbdfmezcz6owsx2waqayc5q@36yhz4dmrxh6>
From: Yi Zhang <yi.zhang@redhat.com>
Date: Wed, 28 Feb 2024 20:08:49 +0800
Message-ID: <CAHj4cs874FivTdmw=VMJwTzzLFZWb4OKqvNGRN0R0O+Oiv4aYA@mail.gmail.com>
To: Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed, Feb 28, 2024 at 7:09 PM Shinichiro Kawasaki <shinichiro.kawasaki@wdc.com>
    wrote: > > On Feb 19, 2024 / 00:58, Yi Zhang wrote: > > Hello > > I reproduced
    this issue on the latest linux-block/ [...] 
 
 Content analysis details:   (-0.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [170.10.133.124 listed in list.dnswl.org]
  0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
                             [170.10.133.124 listed in wl.mailspike.net]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rfIkL-0006Rs-Kl
Subject: Re: [f2fs-dev] [bug report]WARNING: CPU: 22 PID: 44011 at
 fs/iomap/iter.c:51 iomap_iter+0x32b observed with blktests zbd/010
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
Cc: linux-block <linux-block@vger.kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBGZWIgMjgsIDIwMjQgYXQgNzowOeKAr1BNIFNoaW5pY2hpcm8gS2F3YXNha2kKPHNo
aW5pY2hpcm8ua2F3YXNha2lAd2RjLmNvbT4gd3JvdGU6Cj4KPiBPbiBGZWIgMTksIDIwMjQgLyAw
MDo1OCwgWWkgWmhhbmcgd3JvdGU6Cj4gPiBIZWxsbwo+ID4gSSByZXByb2R1Y2VkIHRoaXMgaXNz
dWUgb24gdGhlIGxhdGVzdCBsaW51eC1ibG9jay9mb3ItbmV4dCwgcGxlYXNlCj4gPiBoZWxwIGNo
ZWNrIGl0IGFuZCBsZXQgbWUga25vdyBpZiB5b3UgbmVlZCBtb3JlIGluZm8vdGVzdCwgdGhhbmtz
Lgo+Cj4gWy4uLl0KPgo+ID4gWyA0MzgxLjI3ODg1OF0gLS0tLS0tLS0tLS0tWyBjdXQgaGVyZSBd
LS0tLS0tLS0tLS0tCj4gPiBbIDQzODEuMjgzNDg0XSBXQVJOSU5HOiBDUFU6IDIyIFBJRDogNDQw
MTEgYXQgZnMvaW9tYXAvaXRlci5jOjUxCj4gPiBpb21hcF9pdGVyKzB4MzJiLzB4MzUwCj4KPiBJ
IGNhbiBub3QgcmVjcmVhdGUgdGhlIFdBUk4gYW5kIHRoZSBmYWlsdXJlIG9uIG15IHRlc3QgbWFj
aGluZXMuIE9uIHRoZSBvdGhlcgo+IGhhbmQsIGl0IGlzIHJlcGVhdGVkbHkgcmVjcmVhdGVkIG9u
IENLSSB0ZXN0IG1hY2hpbmVzIHNpbmNlIEZlYi8xOS8yMDI0IFsxXS4KPgo+ICAgWzFdIGh0dHBz
Oi8vZGF0YXdhcmVob3VzZS5ja2ktcHJvamVjdC5vcmcvaXNzdWUvMjUwOAo+Cj4gSSBhc3N1bWUg
dGhhdCBhIGtlcm5lbCBjaGFuZ2UgdHJpZ2dlcmVkIHRoZSBmYWlsdXJlLgo+Cj4gWWksIGlzIGl0
IHBvc3NpYmxlIHRvIGJpc2VjdCBhbmQgaWRlbnRpZnkgdGhlIHRyaWdnZXIgY29tbWl0IHVzaW5n
IENLSSB0ZXN0Cj4gbWFjaGluZXM/IFRoZSBmYWlsdXJlIGlzIG9ic2VydmVkIHdpdGggdjYuNi4x
NyBhbmQgdjYuNi4xOCBrZXJuZWwuIEkgZ3Vlc3MgdGhlCj4gZmFpbHVyZSB3YXMgbm90IG9ic2Vy
dmVkIHdpdGggdjYuNi4xNiBrZXJuZWwsIHNvIEkgc3VnZ2VzdCB0byBiaXNlY3QgYmV0d2VlbgoK
U3VyZSwgd2lsbCB0cnkgdG8gYmlzZWN0IGl0IGxhdGVyIHRoaXMgd2Vlay4gOikKCj4gdjYuNi4x
NiBhbmQgdjYuNi4xNy4KPgoKCi0tIApCZXN0IFJlZ2FyZHMsCiAgWWkgWmhhbmcKCgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZl
bCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0
cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZl
bAo=
