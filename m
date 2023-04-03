Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4817A6D4F2A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Apr 2023 19:38:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjO80-0002qQ-3p;
	Mon, 03 Apr 2023 17:37:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <michalechner92@googlemail.com>) id 1pjO7o-0002qG-IR
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Apr 2023 17:37:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:To:Subject:
 Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=okTi1Qleayz1puyvyKRZQbHDtKE30jmQTu0ljzKKU7k=; b=kfCw/mzt3QUhkqhqotPIOQIVIL
 DCS6K8uD1pWRnOwuTfSxvViEndTBwz2Ugo6rsPE25VPyzN1/vr5W7SOcm8YRyDMOsCIfxZQ9l6nsL
 FjbGwqEP5nsZJ1uNW1Dgg85734Vj52uwExg97/NQBVWRmYftScXg1rIyCrPLLUxTh9g8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
 In-Reply-To:References:MIME-Version:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=okTi1Qleayz1puyvyKRZQbHDtKE30jmQTu0ljzKKU7k=; b=HYHAm8Qzysll6aYAHa1HN7rAU3
 sy4xN7h1pGpwCztLvktTPddetgycXGmM0ItSFs+963gigeDmXGJAjDy75tdFfz4RW5cBKw3el245v
 K0pyg8xym86S3wMVQSeMULh0qT/jVIShC/UjU/0bx5lxOHMy4rd9YryrL2+Y37+2JyXI=;
Received: from mail-ed1-f41.google.com ([209.85.208.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pjO7m-0005bH-V1 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Apr 2023 17:37:47 +0000
Received: by mail-ed1-f41.google.com with SMTP id b20so120458460edd.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 03 Apr 2023 10:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112; t=1680543460;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=okTi1Qleayz1puyvyKRZQbHDtKE30jmQTu0ljzKKU7k=;
 b=FTD+WEgdwQARRxC4buqPjjuw/rWV41xmQqMAsfzpf5xxdaH6Zb4sh6td5TORrV45CP
 4mxE6hljwYG//ufFOdJyMx4ks28bcXYIiH4DJ8YdjNXL+ROlBM/G77n836o6KkS33nuZ
 T7ZwHXMEhCJEgFhrWxT1r0YHKVv04t5z/i8HbTsY/Td+oCceXDVheBCjChjSgwrEDfar
 T7PbiXCmdrFbDGKpDa/lMbpV+Y1i0chfRIDM7o9aHkDUg6GR8xF6io6+cxrE/cKjw89b
 bvqvvdwoSvfKZIwIWmG0zigvkUtjkYWuMgb7p3QKhkzGHNGLPZLD8FxjTaLd1aEE+tsN
 gBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680543460;
 h=content-transfer-encoding:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=okTi1Qleayz1puyvyKRZQbHDtKE30jmQTu0ljzKKU7k=;
 b=S4jrNyiQg0jYLq8LqdlcqS5Vrkx9e97lb8xsoZ8b+idEN9UUZdShVn8I2U82w3wo0V
 lsXt7os4dkpGJpJDqoIRUpaxMhP8Dk8oXcU02UVm3JgRQv2Ffz3n0Y9TfOAXnnVCIklR
 dek4+1YGHeENIFca2l10PNms1b1Y+CY+xd6h4i+MsiHOZmQ/DTrSri3kwfxzyRcOgwWC
 zDYBmzT+t8QtzEdhaUbq0Nkv2FgHUrnefs6SbKxfFgD1MnOYoYWsQiG1xrCXTKE7cIIt
 ZxFky/LiILUVpiy/8qKd27SE40bYHgL7oNAGlwlEJY+yPsP+h/x4FTz6n4C8qj3zcScX
 CDtw==
X-Gm-Message-State: AAQBX9fA34yUnfIP7Kd4Bu/ukbMQIOeM6qApBqv7KkDL/+B7wojD9tUw
 HlksvrQK+E6dr/2LIaVbmQueF2viD9AwPV00+uE=
X-Google-Smtp-Source: AKy350ZWwmQ8PTenOO7X6f70A7GCZQPkSXZWO6JwyFVWqaIREXU3KYxhotQIM729wIKu2T6kkn7PKbZcMXGtJSyZgAU=
X-Received: by 2002:a50:8d54:0:b0:4fa:7e99:9e2c with SMTP id
 t20-20020a508d54000000b004fa7e999e2cmr63099edt.0.1680543460355; Mon, 03 Apr
 2023 10:37:40 -0700 (PDT)
MIME-Version: 1.0
References: <bug-217266-202145@https.bugzilla.kernel.org/>
 <bug-217266-202145-16z3yxLWhk@https.bugzilla.kernel.org/>
In-Reply-To: <bug-217266-202145-16z3yxLWhk@https.bugzilla.kernel.org/>
Date: Mon, 3 Apr 2023 19:37:29 +0200
Message-ID: <CAJ5GUv=Jw=7yYM93NeoBHGHOrV_i18z64PJAC=GhDK5_kf-K1w@mail.gmail.com>
To: bugzilla-daemon@kernel.org, linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Am Mo.,
 3. Apr. 2023 um 16:08 Uhr schrieb : > >
 https://bugzilla.kernel.org/show_bug.cgi?id=217266
 > > Chao Yu (chao@kernel.org) changed: > > What |Removed |Added > [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [michalechner92[at]googlemail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [michalechner92[at]googlemail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.41 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.41 listed in wl.mailspike.net]
X-Headers-End: 1pjO7m-0005bH-V1
Subject: Re: [f2fs-dev] [Bug 217266] kernel panic on f2fs filesystem when
 f2fs_commit_atomic_write
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
From: Micha L via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Micha L <michalechner92@googlemail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

QW0gTW8uLCAzLiBBcHIuIDIwMjMgdW0gMTY6MDggVWhyIHNjaHJpZWIgPGJ1Z3ppbGxhLWRhZW1v
bkBrZXJuZWwub3JnPjoKPgo+IGh0dHBzOi8vYnVnemlsbGEua2VybmVsLm9yZy9zaG93X2J1Zy5j
Z2k/aWQ9MjE3MjY2Cj4KPiBDaGFvIFl1IChjaGFvQGtlcm5lbC5vcmcpIGNoYW5nZWQ6Cj4KPiAg
ICAgICAgICAgIFdoYXQgICAgfFJlbW92ZWQgICAgICAgICAgICAgICAgICAgICB8QWRkZWQKPiAt
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tCj4gICAgICAgICAgICAgIFN0YXR1c3xORVcgICAgICAgICAgICAg
ICAgICAgICAgICAgfEFTU0lHTkVECj4gICAgICAgICAgICAgICAgICBDQ3wgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgfGNoYW9Aa2VybmVsLm9yZwo+Cj4gLS0tIENvbW1lbnQgIzUgZnJvbSBD
aGFvIFl1IChjaGFvQGtlcm5lbC5vcmcpIC0tLQo+IEhpIHNoaWxrYSwgTWljaGEgTCwKPgo+IERv
IHlvdSBoYXZlIGEgcmVwcm9kdWNlcj8KPgo+IC0tCj4gWW91IG1heSByZXBseSB0byB0aGlzIGVt
YWlsIHRvIGFkZCBhIGNvbW1lbnQuCj4KPiBZb3UgYXJlIHJlY2VpdmluZyB0aGlzIG1haWwgYmVj
YXVzZToKPiBZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25lZSBvZiB0aGUgYnVnLgo+Cj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2Uu
bmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAoKSGV5IENoYW8sCgpJIGRvbsK0dCBoYXZlIGEgcmVwcm9kdWNlci4gSXQganVz
dCBzZWVtcyB0byBoYXBwZW4gcmFuZG9tbHkgd2hpbGUKdXNpbmcgdGhlIGRldmljZSB2ZXJ5IHJh
cmVseS4KCgpBbSBNby4sIDMuIEFwci4gMjAyMyB1bSAxOTowMCBVaHIgc2NocmllYiA8YnVnemls
bGEtZGFlbW9uQGtlcm5lbC5vcmc+Ogo+Cj4gaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3No
b3dfYnVnLmNnaT9pZD0yMTcyNjYKPgo+IEphZWdldWsgS2ltIChqYWVnZXVrQGtlcm5lbC5vcmcp
IGNoYW5nZWQ6Cj4KPiAgICAgICAgICAgIFdoYXQgICAgfFJlbW92ZWQgICAgICAgICAgICAgICAg
ICAgICB8QWRkZWQKPiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4gICAgICAgICAgICAgICAgICBDQ3wg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgfGphZWdldWtAa2VybmVsLm9yZwo+Cj4gLS0tIENv
bW1lbnQgIzYgZnJvbSBKYWVnZXVrIEtpbSAoamFlZ2V1a0BrZXJuZWwub3JnKSAtLS0KPiBJIHRo
aW5rIHRoaXMgZml4ZXMgdGhlIHBhbmljLgo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xpbnV4
LWYyZnMtZGV2ZWwvWkNzRXl0RGpxRWpRRFBpT0Bnb29nbGUuY29tL1QvI3UKPgo+IC0tCj4gWW91
IG1heSByZXBseSB0byB0aGlzIGVtYWlsIHRvIGFkZCBhIGNvbW1lbnQuCj4KPiBZb3UgYXJlIHJl
Y2VpdmluZyB0aGlzIG1haWwgYmVjYXVzZToKPiBZb3UgYXJlIHdhdGNoaW5nIHRoZSBhc3NpZ25l
ZSBvZiB0aGUgYnVnLgo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+IExpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAoKSGV5IEphZWdldWssCgpUaGFua3MgZm9y
IHRoZSBsaW5rIGFuZCB0YWtpbmcgYSBsb29rISBJIHdpbGwgY2hlcnJ5LXBpY2sgdGhlIGZpeCB0
bwpteSB0cmVlIGFuZCBzaGlwIGl0IG9uIHRoZSBuZXh0IHJlbGVhc2Ugb24gWERBLgoKScK0bGwg
cmVwb3J0IGJhY2sgaW4gY2FzZSBJIGdldCBtb3JlIGxvZ3Mgd2l0aCB0aGUgcGFuaWMgSSBzaGFy
ZWQgZWFybGllci4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3Rz
LnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0
aW5mby9saW51eC1mMmZzLWRldmVsCg==
