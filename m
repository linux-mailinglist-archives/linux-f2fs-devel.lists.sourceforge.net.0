Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EB00E1F5F26
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jun 2020 02:23:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jjB0R-0003W4-2h; Thu, 11 Jun 2020 00:23:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jjB0Q-0003Vu-4v
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jun 2020 00:23:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zV/9caxagCyIgNigVOFFt2aaFjY9J+PRXT/oGFhZoBA=; b=ilI2qHtqqR6yHi6RnJvNJWfKRW
 76DB5HC9qzCdSm22oCAPK7i3F0J3Mj1NIpsq0wxudiKzX4ruSrk5T2rtUp8vn6UmZNG+k+A83N85y
 923EQ1zZ82kbI3tEnDxbX7P2Fmp+JUrTxsr8xw752Ws02lb+RHMYYm82XGEQQagXQtr0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zV/9caxagCyIgNigVOFFt2aaFjY9J+PRXT/oGFhZoBA=; b=dJpF14m94Dqlg9gCofq3qW0SDw
 itQFqOrImW3VKsEsHcDHvXx3gErrsyiAvMzA0BmLQB99gs8HBOu8i6+UFOUab+PRdimSNsCrfB7jf
 hNeLOQci97OKQqonJ3r3ky7Hy2TMvirKlywc0DeXQMeAO/9FDR5FsX8+N1F/r6EQFDrI=;
Received: from mail-lj1-f194.google.com ([209.85.208.194])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jjB0O-001VtQ-W8
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jun 2020 00:23:42 +0000
Received: by mail-lj1-f194.google.com with SMTP id x18so4786075lji.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 10 Jun 2020 17:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zV/9caxagCyIgNigVOFFt2aaFjY9J+PRXT/oGFhZoBA=;
 b=te1Hv+GHACPwT4DA++rJFJ/v3/XNg3hh/4gDbj8OIzHkNr69uTfNOUJPCX06fhhN8/
 kx0MeincOnv3n4QRO5/8bwLa4/tWIrRZRTU8G3iiZ4Ehg6Y3Dx91VusjFvthPDoJzBoj
 OyrIMXYKoas2GuSrSdKE5Qc4UZ9uKao2ehjk1gdTyELWoJugx1o+NDTb/Da/XQAU6sti
 oBgKbMA5vqbo3hCgKilnS4Jkdt3tUlLDntipU88NvPr7lQvVU1nrgC6BHCq9SEh5hnMm
 AXTspRe3VFtgvuzE77N/L65s1LZqVrT0X0jSPEgjo5B1n1cONZpcATOv0qShKzuXT0zJ
 svNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zV/9caxagCyIgNigVOFFt2aaFjY9J+PRXT/oGFhZoBA=;
 b=iW4VRZvXZM/Z8proBn/RDM0kL+phWFrjBfLLycD82ZWR+ivs+wZAF4jxdsFIIHe3j2
 ESlD3oz8MitUq5sJskKroCGtx3o7St9/IEiKlpAzSCdrRGMBjJ3PZQxHol+kUdiXW8Pq
 thcyR0kwEKT0mhSO/xa8mfE8HbjZnVt1g4VEEawmYp5vPP/eo8NnK/b1EJzpF3plR2kx
 UX3I9DaU2/x52JfrGvJtKWzPAOed1ZpUOU25287c+PiXeIoTXS8ofylB2nWJ9KzSzbMq
 +bMRvpc0X9k/dzQ0C4gPl/fHfIDPZwWy7E3hD2oYEivH7g8WdwRZMCFHX2+4jap12gUR
 h0Pg==
X-Gm-Message-State: AOAM531BwL9Q7ZX6s28Nro6t9sk2AgP7SQPHQwEWf3iik48tP71cTMnx
 B02o4L6jvJQoeAypO4QTgZF0MHnMOqgawriwpUU=
X-Google-Smtp-Source: ABdhPJwBgNDz9TnVUBsL2EOIQbMcDqxr3+qfLLpfzqynJHiVW5HH249mUncGSSbG+NEqUaB9xbjqBXNlLtk2WrVwa9A=
X-Received: by 2002:a2e:a0cc:: with SMTP id f12mr2812617ljm.250.1591835014295; 
 Wed, 10 Jun 2020 17:23:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200609060137.143501-1-daeho43@gmail.com>
 <20200609165107.GA228564@gmail.com>
 <CACOAw_xEZ+au9yhFerq9amkRO62Dzxj7h71gEc=i16ReYu5xrg@mail.gmail.com>
 <20200610031532.GA6286@sol.localdomain>
 <CACOAw_wErOPC=Kf3UU8nFGhWRy84ZnCeJbsyPhSCcXv51B_XxQ@mail.gmail.com>
 <CACOAw_zka6d06RxFOUTwEV7B6o8A2-_6FvqWh_A1nJ0+7FU9yQ@mail.gmail.com>
 <CACOAw_yc4hxdyxyO+Lb4MArHek1tP4wxCq0tezWOocgqvK+tqg@mail.gmail.com>
 <20200611000037.GC1339@sol.localdomain>
In-Reply-To: <20200611000037.GC1339@sol.localdomain>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 11 Jun 2020 09:23:23 +0900
Message-ID: <CACOAw_xqHnL0MthPykSrKJ8OXez-XigCFgC-vwm_keEZh_g8zw@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.194 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.194 listed in wl.mailspike.net]
X-Headers-End: 1jjB0O-001VtQ-W8
Subject: Re: [f2fs-dev] [PATCH] f2fs: add F2FS_IOC_SEC_TRIM_FILE ioctl
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

WWVzLCBJIHNhdyB0aGUgaW1wbGVtZW50YXRpb24gaW4gdmZzX3dyaXRlKCkuCkJ1dCBpZiB3ZSB1
c2UgbW50X3dhbnRfd3JpdGVfZmlsZSgpIGhlcmUsIGl0J2xsIGNhbGwgbW50X2Nsb25lX3dyaXRl
KCkKaW50ZXJuYWxseSBpZiB0aGUgZmlsZSBpcyBhbHJlYWR5IG9wZW4gaW4gd3JpdGUgbW9kZS4K
RG9uJ3QgeW91IHRoaW5rIHRoZSBiZWxvdyB0aGluZyBpcyBuZWVkZWQ/IFdlIGNhbiBpbmNyZWFz
ZSB0aGUgY291bnRlcgplYWNoIG9mIHRoZW0sIG9wZW4gYW5kIGlvY3RsLCBsaWtlIG90aGVyIGZp
bGVzeXN0ZW1zIHN1Y2ggYXMgZXh0NC4KCmludCBtbnRfY2xvbmVfd3JpdGUoc3RydWN0IHZmc21v
dW50ICptbnQpCnsKICAgICAgICAvKiBzdXBlcmJsb2NrIG1heSBiZSByL28gKi8KICAgICAgICBp
ZiAoX19tbnRfaXNfcmVhZG9ubHkobW50KSkKICAgICAgICAgICAgICAgIHJldHVybiAtRVJPRlM7
CiAgICAgICAgcHJlZW1wdF9kaXNhYmxlKCk7CiAgICAgICAgbW50X2luY193cml0ZXJzKHJlYWxf
bW91bnQobW50KSk7CiAgICAgICAgcHJlZW1wdF9lbmFibGUoKTsKICAgICAgICByZXR1cm4gMDsK
fQoKMjAyMOuFhCA27JuUIDEx7J28ICjrqqkpIOyYpOyghCA5OjAwLCBFcmljIEJpZ2dlcnMgPGVi
aWdnZXJzQGtlcm5lbC5vcmc+64uY7J20IOyekeyEsToKPgo+IE9uIFRodSwgSnVuIDExLCAyMDIw
IGF0IDA4OjUzOjEwQU0gKzA5MDAsIERhZWhvIEplb25nIHdyb3RlOgo+ID4gPiA+ID4gPiBVc2lu
ZyBGTU9ERV9XUklURSBpcyBtb3JlIHByb3BlciBmb3IgdGhpcyBjYXNlLCBzaW5jZSB3ZSdyZSBn
b2luZyB0bwo+ID4gPiA+ID4gPiBtb2RpZnkgdGhlIGRhdGEuIEJ1dCBJIHRoaW5rIG1udF93YW50
X3dyaXRlX2ZpbGUoKSBpcyBzdGlsbCByZXF1aXJlZAo+ID4gPiA+ID4gPiB0byBwcmV2ZW50IHRo
ZSBmaWxlc3lzdGVtIGZyb20gZnJlZXppbmcgb3Igc29tZXRoaW5nIGVsc2UuCj4gPiA+ID4gPgo+
ID4gPiA+ID4gUmlnaHQsIHRoZSBmcmVlemluZyBjaGVjayBpcyBhY3R1YWxseSBzdGlsbCBuZWNl
c3NhcnkuICBCdXQgZ2V0dGluZyB3cml0ZSBhY2Nlc3MKPiA+ID4gPiA+IHRvIHRoZSBtb3VudCBp
cyBub3QgbmVjZXNzYXJ5LiAgSSB0aGluayB5b3Ugc2hvdWxkIHVzZSBmaWxlX3N0YXJ0X3dyaXRl
KCkgYW5kCj4gPiA+ID4gPiBmaWxlX2VuZF93cml0ZSgpLCBsaWtlIHZmc193cml0ZSgpIGRvZXMu
Cj4gPiA+Cj4gPiA+IEkndmUgY2hlY2tlZCB0aGlzIGFnYWluLgo+ID4gPgo+ID4gPiBCdXQgSSB0
aGluayBtbnRfd2FudF93cml0ZV9maWxlKCkgbG9va3MgYmV0dGVyIHRoYW4gdGhlIGNvbWJpbmF0
aW9uIG9mCj4gPiA+IGNoZWNraW5nIEZNT0RFX1dSSVRFIGFuZCBmaWxlX3N0YXJ0X3dyaXRlKCks
IGJlY2F1c2UKPiA+ID4gbW50X3dhbnRfd3JpdGVfZmlsZSgpIGhhbmRsZXMgYWxsIHRoZSB0aGlu
Z3Mgd2UgbmVlZC4KPiA+ID4gSXQgY2hlY2tzIEZNT0RFX1dSSVRFUiwgd2hpY2ggaXMgc2V0IGlu
IGRvX2RlbnRyeV9vcGVuKCkgd2hlbgo+ID4gPiBGTU9ERV9XUklURSBpcyBhbHJlYWR5IHNldCwg
YW5kIGRvZXMgdGhlIHN0dWZmIHRoYXQgZmlsZV9zdGFydF93cml0ZSgpCj4gPiA+IGlzIGRvaW5n
LiBUaGlzIGlzIHdoeSB0aGUgb3RoZXIgZmlsZXN5c3RlbSBzeXN0ZW0gY2FsbHMgdXNlIGl0Lgo+
ID4gPgo+ID4gPiBXaGF0IGRvIHlvdSB0aGluaz8KPiA+Cj4gPiBIbW0sIHdlIHN0aWxsIG5lZWQg
Rk1PREVfV1JJVEUgY2hlY2suCj4gPiBCdXQgbW50X3dhbnRfd3JpdGVfZmlsZSgpIGxvb2tzIGJl
dHRlciwgYmVjYXVzZSBpdCdsbCBjYWxsCj4gPiBtbnRfY2xvbmVfd3JpdGUoKSBpbnRlcm5hbGx5
LCBpZiB0aGUgZmlsZSBpcyBvcGVuIGZvciB3cml0ZSBhbHJlYWR5Lgo+Cj4gVGhlcmUncyBubyBu
ZWVkIHRvIGdldCB3cml0ZSBhY2Nlc3MgdG8gdGhlIG1vdW50IGlmIHlvdSBhbHJlYWR5IGhhdmUg
YSB3cml0YWJsZQo+IGZkLiAgWW91IGp1c3QgbmVlZCBmaWxlX3N0YXJ0X3dyaXRlKCkgZm9yIHRo
ZSBmcmVlemUgcHJvdGVjdGlvbi4gIEFnYWluLCBzZWUKPiB2ZnNfd3JpdGUoKS4KPgo+IC0gRXJp
YwoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwK
