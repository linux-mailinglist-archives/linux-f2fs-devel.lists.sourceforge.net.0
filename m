Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E330B804132
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  4 Dec 2023 22:55:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rAGux-0000pa-Ux;
	Mon, 04 Dec 2023 21:55:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rAGuw-0000pO-SJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Dec 2023 21:55:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r8OsxNuHP/Mk0jzn3oUdmiDmSoUgRFcHUL7SKw08Lik=; b=d6q0ZVhKrjWyfqZlAWsl1fUnIM
 L3CltFS2DXT5703TPXjLYbdQ70E/eG9JkdA8JLaKQhhkwZ2fE0QoX/kOStpTf2iAka/wgnZ0mzchS
 s9mgEEPnba1pQ8RpGyJeXULcYZoRIrklPqDOH44sv+a0btoWn42lJTB0BNZSq+2C28Hc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r8OsxNuHP/Mk0jzn3oUdmiDmSoUgRFcHUL7SKw08Lik=; b=Wd/ZoKpQ0/gv8u8aIHsUf3NlTi
 0Peo8QoV7+iXY6xwHNcNpAi629nVBewfC62T/zsFjElGVkx06UwOprN7PDDXeWBYzwiFRiNr+v3jE
 DN7h3oGHUKmiFyHFk6qYmI3pMJYROtyFRxjRD+opmKvr14gFH1IMQXd4nc8Zk+aWTook=;
Received: from mail-yb1-f170.google.com ([209.85.219.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rAGuv-0006jB-Lk for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 04 Dec 2023 21:55:55 +0000
Received: by mail-yb1-f170.google.com with SMTP id
 3f1490d57ef6-db4364ecd6aso2528159276.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 04 Dec 2023 13:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701726944; x=1702331744; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r8OsxNuHP/Mk0jzn3oUdmiDmSoUgRFcHUL7SKw08Lik=;
 b=fceZLmrr8r/XH+fRDdG8Cu90zq7dKKqIXgro2HDmR+XXe7OoTbbNHRgCy1VN98h4Ao
 1J1curPpYSoCa1NdUthh/xnN55A+Gaqy+8p1eRT67Cb5RZLPeZiC8yn/8d+vGXhouGPz
 iZiwLy7oiSntSF6PO4WWoImQUTNHO20NVptvBUNvqSEl+5QGexYO41ZLF7r92xj5HmRZ
 hBFzBb+xfkc+n4yarBSvcCA8errI9wuZ7M97s3k+VH8mTUGBl4odhEy5X2pGcjZgC+ut
 JgX1UR+x46hWd6YqQQp70eIpJ8961t+mJXsDbCn0zy/g/QQPkks7TIaqIPq8op73Nhij
 H9FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701726944; x=1702331744;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r8OsxNuHP/Mk0jzn3oUdmiDmSoUgRFcHUL7SKw08Lik=;
 b=wqhzt1l0+Il05M9MUH/zUZsm8UL1jhibLJoQ4xvAXPCmakenpCx79Yd0bozMt+J6Fg
 tAHqAu1/GOSz0Yho7x+1ESdfWA5svE0PVddoN06N0QVqcysHlccjmKSrhOM26wiVQWN5
 cqxIOzLUbUnYQ/L6eu9pEyhwFfkZNEa0v7FvwsgxK8TPiVXilvhbK1L6mSrCr8pr/oYe
 7RdY6D/Yv7t7a8fpAr48+YdLJk9N6KlQwaMEMJWov245DRe9ruxmVzV5P0ebdZYetDpB
 gwcUajZDaBbMh/qynKfkx2K6o5bokCPEpXG97SQtoNh2Yd1TOjXVyXMC/vuUUaX1IZQ7
 Vlhw==
X-Gm-Message-State: AOJu0Yz+pn7sn1ZQA1Ls92AkE7RSls5Tfw4Hj+As5qUfSH4yqSM/N6fm
 4OEm6OgSq2sWLD25LeHVxCQzonZxe72g5COJMIKrrBlFA7g=
X-Google-Smtp-Source: AGHT+IGP/1uzSO8EfURseQLuaM0LLow2VMvh1hhECiFS7K5uBiO+q456UysWI4/cbldZAQYS2uIEU+ulphXknhBVooA=
X-Received: by 2002:a05:6122:993:b0:4b2:e534:b5d1 with SMTP id
 g19-20020a056122099300b004b2e534b5d1mr1412281vkd.33.1701716597485; Mon, 04
 Dec 2023 11:03:17 -0800 (PST)
MIME-Version: 1.0
References: <20231204180428.925779-1-jaegeuk@kernel.org>
 <20231204180428.925779-3-jaegeuk@kernel.org>
In-Reply-To: <20231204180428.925779-3-jaegeuk@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 4 Dec 2023 11:03:06 -0800
Message-ID: <CACOAw_xo_73xxqUty_2e6mvPA8A45MXEefOe8gr7f7owU1XuXQ@mail.gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  LGTM On Mon, Dec 4, 2023 at 10:06 AM Jaegeuk Kim wrote:
   > > Even if f2fs was rebooted as staying checkpoint=disable, let's match the
    write > pointers all the time. > > Signed-off-by: Jaegeuk Kim > -- [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.219.170 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [209.85.219.170 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rAGuv-0006jB-Lk
Subject: Re: [f2fs-dev] [PATCH 3/4] f2fs: check write pointers when
 checkpoint=disable
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

TEdUTQoKT24gTW9uLCBEZWMgNCwgMjAyMyBhdCAxMDowNuKAr0FNIEphZWdldWsgS2ltIDxqYWVn
ZXVrQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gRXZlbiBpZiBmMmZzIHdhcyByZWJvb3RlZCBhcyBz
dGF5aW5nIGNoZWNrcG9pbnQ9ZGlzYWJsZSwgbGV0J3MgbWF0Y2ggdGhlIHdyaXRlCj4gcG9pbnRl
cnMgYWxsIHRoZSB0aW1lLgo+Cj4gU2lnbmVkLW9mZi1ieTogSmFlZ2V1ayBLaW0gPGphZWdldWtA
a2VybmVsLm9yZz4KPiAtLS0KPiAgZnMvZjJmcy9zdXBlci5jIHwgMyArLS0KPiAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2Zz
L2YyZnMvc3VwZXIuYyBiL2ZzL2YyZnMvc3VwZXIuYwo+IGluZGV4IDYxNzM0MGU5ZWE3Zi4uOWE4
NzRiNGQxNTAxIDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvc3VwZXIuYwo+ICsrKyBiL2ZzL2YyZnMv
c3VwZXIuYwo+IEBAIC00NzQxLDcgKzQ3NDEsNyBAQCBzdGF0aWMgaW50IGYyZnNfZmlsbF9zdXBl
cihzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCB2b2lkICpkYXRhLCBpbnQgc2lsZW50KQo+ICAjaWZk
ZWYgQ09ORklHX1FVT1RBCj4gICAgICAgICBmMmZzX3JlY292ZXJfcXVvdGFfZW5kKHNiaSwgcXVv
dGFfZW5hYmxlZCk7Cj4gICNlbmRpZgo+IC0KPiArcmVzZXRfY2hlY2twb2ludDoKPiAgICAgICAg
IC8qCj4gICAgICAgICAgKiBJZiB0aGUgZjJmcyBpcyBub3QgcmVhZG9ubHkgYW5kIGZzeW5jIGRh
dGEgcmVjb3Zlcnkgc3VjY2VlZHMsCj4gICAgICAgICAgKiBjaGVjayB6b25lZCBibG9jayBkZXZp
Y2VzJyB3cml0ZSBwb2ludGVyIGNvbnNpc3RlbmN5Lgo+IEBAIC00NzUyLDcgKzQ3NTIsNiBAQCBz
dGF0aWMgaW50IGYyZnNfZmlsbF9zdXBlcihzdHJ1Y3Qgc3VwZXJfYmxvY2sgKnNiLCB2b2lkICpk
YXRhLCBpbnQgc2lsZW50KQo+ICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gZnJlZV9tZXRh
Owo+ICAgICAgICAgfQo+Cj4gLXJlc2V0X2NoZWNrcG9pbnQ6Cj4gICAgICAgICBmMmZzX2luaXRf
aW5tZW1fY3Vyc2VnKHNiaSk7Cj4KPiAgICAgICAgIC8qIGYyZnNfcmVjb3Zlcl9mc3luY19kYXRh
KCkgY2xlYXJlZCB0aGlzIGFscmVhZHkgKi8KPiAtLQo+IDIuNDMuMC5yYzIuNDUxLmc4NjMxYmM3
NDcyLWdvb2cKPgo+Cj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vm
b3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
