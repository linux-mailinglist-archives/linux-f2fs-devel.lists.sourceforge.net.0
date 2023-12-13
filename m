Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED49812047
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Dec 2023 21:55:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rDWFw-0003Zk-FF;
	Wed, 13 Dec 2023 20:55:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ngompa13@gmail.com>) id 1rDWFv-0003Za-9G
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Dec 2023 20:54:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uERSlmWABCloqqWZmq7G8mc4+2oSuJMPRYaQZcqODM8=; b=Sio0QQdUxlWQ5+Ki/ZsXEPneUi
 S9jRkzytN0rNI/K/ZDrXYNlSzAS4FpbPuq5hOxA6J7D3CuegOZYiwqwgSejvHI40ga82MonVlq7F6
 c9kkabWGv1nqlfV+XrOiAv4qOK0FR1QzLp3pmHqc03GSry4T7znYzhf15EYHhgejQDs8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uERSlmWABCloqqWZmq7G8mc4+2oSuJMPRYaQZcqODM8=; b=XeDOP266wpMTEy+kYMCUrwyo6m
 bQGs85ywwtXQ++9FTvtcO3nxd6mqrkmHvqE5ryYJXozaFd/hQW7XbZ7IifwTXF/9jGP5Wdeg/CNln
 YbBGRIqnbghCgRHNCtpRPbq3R0jOKB+3CYBHSCVTLcFGbP1xuNFIwjW9buEWdHB8bC80=;
Received: from mail-lf1-f43.google.com ([209.85.167.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rDWFr-0004zZ-Is for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Dec 2023 20:54:59 +0000
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-50c0f6b1015so8687090e87.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 13 Dec 2023 12:54:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702500883; x=1703105683;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uERSlmWABCloqqWZmq7G8mc4+2oSuJMPRYaQZcqODM8=;
 b=lTodw2+e00PXKStXnStf6fFUqy3b6rZj0EyEwMYhGlvc8hTs3dOINqGxAZEaThcSnj
 6cdBWqaXcDEw/vtM/ZhRWU6F3OC4P8mPMjhBMJpn2J3SKbyFAnX0jPMk9D1gNx6D5OGx
 CqCEmiVvLXTo8NZ4f8Cw1EvwLaPzFtEQs1nVQXxW5Aw4FiUg4CKJpKPfwoVdkhHt0GIO
 oRKgt6/wCL3xcYy06YtV4qfSa7Ht+vJ850bS9V0J3BvQLvcssKprCYMToELXHaIs9fnX
 tHkvDsw8HbiEJKveccflhn9R3OAA4IazL8wt04eRkR/wzfEPCYiErzfZWbiQBCvCi+iC
 c8gA==
X-Gm-Message-State: AOJu0Yy9pBqzVtmTj9/IWB0bbbAZfOjb6LmlO/EuGY33popS/ybyv9hg
 V4Zw38CHf3/d4EbMP+dIgnil6BNpOju0WQ==
X-Google-Smtp-Source: AGHT+IHIQL3Wg5GQsxwSCRzHKrYNF9NWVy9+KejswNVGudQHgG+S99sZnuGuijvjfAosue+LdRjaRg==
X-Received: by 2002:a05:6512:b0d:b0:50c:bd0:870f with SMTP id
 w13-20020a0565120b0d00b0050c0bd0870fmr5104441lfu.73.1702500882996; 
 Wed, 13 Dec 2023 12:54:42 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com.
 [209.85.208.51]) by smtp.gmail.com with ESMTPSA id
 ty8-20020a170907c70800b00a1e026ac542sm8482856ejc.10.2023.12.13.12.54.42
 for <linux-f2fs-devel@lists.sourceforge.net>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Dec 2023 12:54:42 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-551437d5344so4818137a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 13 Dec 2023 12:54:42 -0800 (PST)
X-Received: by 2002:a50:d657:0:b0:54c:f9e6:e40f with SMTP id
 c23-20020a50d657000000b0054cf9e6e40fmr4717255edj.7.1702500882554; Wed, 13 Dec
 2023 12:54:42 -0800 (PST)
MIME-Version: 1.0
References: <20231213040018.73803-1-ebiggers@kernel.org>
 <20231213040018.73803-4-ebiggers@kernel.org>
In-Reply-To: <20231213040018.73803-4-ebiggers@kernel.org>
From: Neal Gompa <neal@gompa.dev>
Date: Wed, 13 Dec 2023 15:54:05 -0500
X-Gmail-Original-Message-ID: <CAEg-Je9K=i80N7-UpJG=XUMVtA_c5bv6DscXw+326wANLvXV2w@mail.gmail.com>
Message-ID: <CAEg-Je9K=i80N7-UpJG=XUMVtA_c5bv6DscXw+326wANLvXV2w@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.7 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Tue, Dec 12, 2023 at 11:01 PM Eric Biggers <ebiggers@kernel.org>
    wrote: > > From: Josef Bacik <josef@toxicpanda.com> > > btrfs has a variety
    of asynchronous things we do with inodes that can > po [...] 
 
 Content analysis details:   (0.7 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.167.43 listed in list.dnswl.org]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [ngompa13[at]gmail.com]
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [ngompa13[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
                             mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.167.43 listed in wl.mailspike.net]
  0.2 FREEMAIL_FORGED_FROMDOMAIN 2nd level domains in From and
                             EnvelopeFrom freemail headers are
                             different
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rDWFr-0004zZ-Is
Subject: Re: [f2fs-dev] [PATCH 3/3] fs: move fscrypt keyring destruction to
 after ->put_super
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
Cc: Josef Bacik <josef@toxicpanda.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBEZWMgMTIsIDIwMjMgYXQgMTE6MDHigK9QTSBFcmljIEJpZ2dlcnMgPGViaWdnZXJz
QGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gRnJvbTogSm9zZWYgQmFjaWsgPGpvc2VmQHRveGljcGFu
ZGEuY29tPgo+Cj4gYnRyZnMgaGFzIGEgdmFyaWV0eSBvZiBhc3luY2hyb25vdXMgdGhpbmdzIHdl
IGRvIHdpdGggaW5vZGVzIHRoYXQgY2FuCj4gcG90ZW50aWFsbHkgbGFzdCB1bnRpbCAtPnB1dF9z
dXBlciwgd2hlbiB3ZSBzaHV0IGV2ZXJ5dGhpbmcgZG93biBhbmQKPiBjbGVhbiB1cCBhbGwgb2Yg
b3VyIGFzeW5jIHdvcmsuICBEdWUgdG8gdGhpcyB3ZSBuZWVkIHRvIG1vdmUKPiBmc2NyeXB0X2Rl
c3Ryb3lfa2V5cmluZygpIHRvIGFmdGVyIC0+cHV0X3N1cGVyLCBvdGhlcndpc2Ugd2UgZ2V0Cj4g
d2FybmluZ3MgYWJvdXQgc3RpbGwgaGF2aW5nIGFjdGl2ZSByZWZlcmVuY2VzIG9uIHRoZSBtYXN0
ZXIga2V5Lgo+Cj4gU2lnbmVkLW9mZi1ieTogSm9zZWYgQmFjaWsgPGpvc2VmQHRveGljcGFuZGEu
Y29tPgo+IFNpZ25lZC1vZmYtYnk6IEVyaWMgQmlnZ2VycyA8ZWJpZ2dlcnNAZ29vZ2xlLmNvbT4K
PiAtLS0KPiAgZnMvc3VwZXIuYyB8IDEyICsrKysrKy0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2ZzL3N1cGVy
LmMgYi9mcy9zdXBlci5jCj4gaW5kZXggMDc2MzkyMzk2ZTcyNC4uZmFmN2QyNDgxNDVkMiAxMDA2
NDQKPiAtLS0gYS9mcy9zdXBlci5jCj4gKysrIGIvZnMvc3VwZXIuYwo+IEBAIC02NzQsMzQgKzY3
NCwzNCBAQCB2b2lkIGdlbmVyaWNfc2h1dGRvd25fc3VwZXIoc3RydWN0IHN1cGVyX2Jsb2NrICpz
YikKPiAgICAgICAgICAgICAgICAgLyogRXZpY3QgYWxsIGlub2RlcyB3aXRoIHplcm8gcmVmY291
bnQuICovCj4gICAgICAgICAgICAgICAgIGV2aWN0X2lub2RlcyhzYik7Cj4KPiAgICAgICAgICAg
ICAgICAgLyoKPiAgICAgICAgICAgICAgICAgICogQ2xlYW4gdXAgYW5kIGV2aWN0IGFueSBpbm9k
ZXMgdGhhdCBzdGlsbCBoYXZlIHJlZmVyZW5jZXMgZHVlCj4gICAgICAgICAgICAgICAgICAqIHRv
IGZzbm90aWZ5IG9yIHRoZSBzZWN1cml0eSBwb2xpY3kuCj4gICAgICAgICAgICAgICAgICAqLwo+
ICAgICAgICAgICAgICAgICBmc25vdGlmeV9zYl9kZWxldGUoc2IpOwo+ICAgICAgICAgICAgICAg
ICBzZWN1cml0eV9zYl9kZWxldGUoc2IpOwo+Cj4gLSAgICAgICAgICAgICAgIC8qCj4gLSAgICAg
ICAgICAgICAgICAqIE5vdyB0aGF0IGFsbCBwb3RlbnRpYWxseS1lbmNyeXB0ZWQgaW5vZGVzIGhh
dmUgYmVlbiBldmljdGVkLAo+IC0gICAgICAgICAgICAgICAgKiB0aGUgZnNjcnlwdCBrZXlyaW5n
IGNhbiBiZSBkZXN0cm95ZWQuCj4gLSAgICAgICAgICAgICAgICAqLwo+IC0gICAgICAgICAgICAg
ICBmc2NyeXB0X2Rlc3Ryb3lfa2V5cmluZyhzYik7Cj4gLQo+ICAgICAgICAgICAgICAgICBpZiAo
c2ItPnNfZGlvX2RvbmVfd3EpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICBkZXN0cm95X3dv
cmtxdWV1ZShzYi0+c19kaW9fZG9uZV93cSk7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgc2It
PnNfZGlvX2RvbmVfd3EgPSBOVUxMOwo+ICAgICAgICAgICAgICAgICB9Cj4KPiAgICAgICAgICAg
ICAgICAgaWYgKHNvcC0+cHV0X3N1cGVyKQo+ICAgICAgICAgICAgICAgICAgICAgICAgIHNvcC0+
cHV0X3N1cGVyKHNiKTsKPgo+ICsgICAgICAgICAgICAgICAvKgo+ICsgICAgICAgICAgICAgICAg
KiBOb3cgdGhhdCBhbGwgcG90ZW50aWFsbHktZW5jcnlwdGVkIGlub2RlcyBoYXZlIGJlZW4gZXZp
Y3RlZCwKPiArICAgICAgICAgICAgICAgICogdGhlIGZzY3J5cHQga2V5cmluZyBjYW4gYmUgZGVz
dHJveWVkLgo+ICsgICAgICAgICAgICAgICAgKi8KPiArICAgICAgICAgICAgICAgZnNjcnlwdF9k
ZXN0cm95X2tleXJpbmcoc2IpOwo+ICsKPiAgICAgICAgICAgICAgICAgaWYgKENIRUNLX0RBVEFf
Q09SUlVQVElPTighbGlzdF9lbXB0eSgmc2ItPnNfaW5vZGVzKSwKPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICJWRlM6IEJ1c3kgaW5vZGVzIGFmdGVyIHVubW91bnQgb2YgJXMgKCVz
KSIsCj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzYi0+c19pZCwgc2ItPnNfdHlw
ZS0+bmFtZSkpIHsKPiAgICAgICAgICAgICAgICAgICAgICAgICAvKgo+ICAgICAgICAgICAgICAg
ICAgICAgICAgICAqIEFkZGluZyBhIHByb3BlciBiYWlsb3V0IHBhdGggaGVyZSB3b3VsZCBiZSBo
YXJkLCBidXQKPiAgICAgICAgICAgICAgICAgICAgICAgICAgKiB3ZSBjYW4gYXQgbGVhc3QgbWFr
ZSBpdCBtb3JlIGxpa2VseSB0aGF0IGEgbGF0ZXIKPiAgICAgICAgICAgICAgICAgICAgICAgICAg
KiBpcHV0X2ZpbmFsKCkgb3Igc3VjaCBjcmFzaGVzIGNsZWFubHkuCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICovCj4gICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGlub2RlICppbm9k
ZTsKPgo+IC0tCj4gMi40My4wCj4KPgoKVGhpcyBtYWtlcyBzZW5zZSB0byBtZS4KClJldmlld2Vk
LWJ5OiBOZWFsIEdvbXBhIDxuZWFsQGdvbXBhLmRldj4KCgoKLS0K55yf5a6f44Gv44GE44Gk44KC
5LiA44Gk77yBLyBBbHdheXMsIHRoZXJlJ3Mgb25seSBvbmUgdHJ1dGghCgoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWls
aW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9s
aXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
