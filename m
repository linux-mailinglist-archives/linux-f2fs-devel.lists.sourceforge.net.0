Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC3DB1F709C
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jun 2020 00:49:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jjW0w-0005Su-Us; Thu, 11 Jun 2020 22:49:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jjW0w-0005Sn-6i
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jun 2020 22:49:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oZz4Kx4San+/C3xZHFDOh06j3X07sR49zOOViMY8pNY=; b=OfHUGk+4BpFlDzkLn0EzL/YubP
 avYHkgqI0WQO84zI91P58PsMyzH5DqV5dCwQdPXsVJgWNvWLxuGrCoXATzWw3xI/RGmmkMTQPUYjd
 50F0ZKF+1VIhIxTgAe+cV9tgJtPwVAMWghFyyOI1nkhJS8mGqKcIDcbmxhrs4ktVa0Ps=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oZz4Kx4San+/C3xZHFDOh06j3X07sR49zOOViMY8pNY=; b=bBM0k/9EO0WfssKurmUW7pr5hv
 OsBPxKEkD59LHwFW9jx+Arvu3VqzDqJ2CcBSmFLBtlissd2wa8Xd6j8g7wnCSb1xa4a8KHElpwSHm
 z650J5ZE5fYIDXaOTyj27rDXqrK47GdH2mdTHvSX59aBOixxBviSG6k0hckybfP0AyUQ=;
Received: from mail-lj1-f194.google.com ([209.85.208.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jjW0u-00H7Pn-Tc
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jun 2020 22:49:38 +0000
Received: by mail-lj1-f194.google.com with SMTP id y11so8902227ljm.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 11 Jun 2020 15:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=oZz4Kx4San+/C3xZHFDOh06j3X07sR49zOOViMY8pNY=;
 b=Qu6Ko60GtYwxe10GyVE0B3zOM0FY4oYGLYqqY9ggoIhFeONimPFed3eHImN+Nyw5et
 b3Sg0Uc0tND60uWSleH/sfpcz/gQowNVnvIjmzqHxdnpJI9BZbqe3/FBHDpcwbj9Hgch
 aXPMPWbA/tUAt2UsYEmwABgmb/tP/1UwJ6ODEhahCS4DqzluL8AwjH8NBkhrEdlZG1pK
 5r9pKghrnu0nDCsScxsVBgD+x8P+QF2G7nif8yPMsG7EhsoZFqzMkQQzpcjPv0b+xINM
 dfI/U3F8KhB9nWWibplZggS+Bwgk8iP51DqotfpobqLvCqefK7nOEPVES65kIkT5woYN
 RX6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=oZz4Kx4San+/C3xZHFDOh06j3X07sR49zOOViMY8pNY=;
 b=F0hXOEk/GbhAGrUYrOYPedwnJjJopmsX7iMwyDl6O4aTdnTS0Qf8QiO54WUHGWpSjR
 jdlD35JfclObp3KDoDUbbUdkp7umtqH9Y5lUWKN0qk5dxwpyMk/lXOwDGbXZj/YO7fqJ
 p3iAxjZimjoUPqMkgTKVg+MPMN99/GGQG+yWgEKAzdE6pu2GtdNLQ0FJu7NY60B3/wle
 BYveXbEvD50QtN5wFhg8kvMHzX27TCNPS0NkV+9WLh5Qzl1MakjuTDitxbJJQR08npWB
 3bxLDDeMOLeZTt1DLwTvN+BXxpdQhss6k9wRZiy2Zf+Nw8E1ROvt3eP2g7D+AbCE4SVX
 qa7g==
X-Gm-Message-State: AOAM531l26rNZ+A7VuICXa5gF/FRafhz/c0hBhwJ/8sdjm676/bsWTBs
 5y92D5WE+N21pYiiyWueLDfSYVYJAh1yeuhe6stCu4G4
X-Google-Smtp-Source: ABdhPJxotYa08x+IXQk//DpZvBytYpY74otnzwBVCWx2x1BiGgFN0nOGmdF1b/UgAwnCb8RcTKF8c5onJyU5yCjs1+A=
X-Received: by 2002:a2e:8107:: with SMTP id d7mr5712031ljg.363.1591915763067; 
 Thu, 11 Jun 2020 15:49:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200611031652.200401-1-daeho43@gmail.com>
 <20200611162721.GB1152@sol.localdomain>
In-Reply-To: <20200611162721.GB1152@sol.localdomain>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 12 Jun 2020 07:49:12 +0900
Message-ID: <CACOAw_zKC24BhNOF2BpuRfuYzBEsis82MafU9HqXwLj2sZ3Azg@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.194 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jjW0u-00H7Pn-Tc
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: add F2FS_IOC_SEC_TRIM_FILE ioctl
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

MjAyMOuFhCA27JuUIDEy7J28ICjquIgpIOyYpOyghCAxOjI3LCBFcmljIEJpZ2dlcnMgPGViaWdn
ZXJzQGtlcm5lbC5vcmc+64uY7J20IOyekeyEsToKPgo+IE9uIFRodSwgSnVuIDExLCAyMDIwIGF0
IDEyOjE2OjUyUE0gKzA5MDAsIERhZWhvIEplb25nIHdyb3RlOgo+ID4gKyAgICAgZm9yIChpbmRl
eCA9IHBnX3N0YXJ0OyBpbmRleCA8IHBnX2VuZDspIHsKPiA+ICsgICAgICAgICAgICAgc3RydWN0
IGRub2RlX29mX2RhdGEgZG47Cj4gPiArICAgICAgICAgICAgIHVuc2lnbmVkIGludCBlbmRfb2Zm
c2V0Owo+ID4gKwo+ID4gKyAgICAgICAgICAgICBzZXRfbmV3X2Rub2RlKCZkbiwgaW5vZGUsIE5V
TEwsIE5VTEwsIDApOwo+ID4gKyAgICAgICAgICAgICByZXQgPSBmMmZzX2dldF9kbm9kZV9vZl9k
YXRhKCZkbiwgaW5kZXgsIExPT0tVUF9OT0RFKTsKPiA+ICsgICAgICAgICAgICAgaWYgKHJldCkK
PiA+ICsgICAgICAgICAgICAgICAgICAgICBnb3RvIG91dDsKPiA+ICsKPiA+ICsgICAgICAgICAg
ICAgZW5kX29mZnNldCA9IEFERFJTX1BFUl9QQUdFKGRuLm5vZGVfcGFnZSwgaW5vZGUpOwo+ID4g
KyAgICAgICAgICAgICBpZiAocGdfZW5kIDwgZW5kX29mZnNldCArIGluZGV4KQo+ID4gKyAgICAg
ICAgICAgICAgICAgICAgIGVuZF9vZmZzZXQgPSBwZ19lbmQgLSBpbmRleDsKPiA+ICsKPiA+ICsg
ICAgICAgICAgICAgZm9yICg7IGRuLm9mc19pbl9ub2RlIDwgZW5kX29mZnNldDsKPiA+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIGRuLm9mc19pbl9ub2RlKyssIGluZGV4KyspIHsKPiA+
ICsgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgYmxvY2tfZGV2aWNlICpjdXJfYmRldjsKPiA+
ICsgICAgICAgICAgICAgICAgICAgICBibG9ja190IGJsa2FkZHIgPSBmMmZzX2RhdGFfYmxrYWRk
cigmZG4pOwo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGlmIChfX2lzX3ZhbGlkX2Rh
dGFfYmxrYWRkcihibGthZGRyKSkgewo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
aWYgKCFmMmZzX2lzX3ZhbGlkX2Jsa2FkZHIoRjJGU19JX1NCKGlub2RlKSwKPiA+ICsgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgYmxrYWRkciwgREFUQV9HRU5FUklDX0VOSEFO
Q0UpKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHJldCA9IC1F
RlNDT1JSVVBURUQ7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdv
dG8gb3V0Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIH0gZWxzZQo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgY29u
dGludWU7Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgICAgICAgY3VyX2JkZXYgPSBmMmZzX3Rh
cmdldF9kZXZpY2Uoc2JpLCBibGthZGRyLCBOVUxMKTsKPiA+ICsgICAgICAgICAgICAgICAgICAg
ICBpZiAoZjJmc19pc19tdWx0aV9kZXZpY2Uoc2JpKSkgewo+ID4gKyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgaW50IGkgPSBmMmZzX3RhcmdldF9kZXZpY2VfaW5kZXgoc2JpLCBibGthZGRy
KTsKPiA+ICsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGJsa2FkZHIgLT0gRkRF
VihpKS5zdGFydF9ibGs7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgfQo+ID4gKwo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgIGlmIChsZW4pIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGlmIChwcmV2X2JkZXYgPT0gY3VyX2JkZXYgJiYKPiA+ICsgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgYmxrYWRkciA9PSBwcmV2X2Jsb2NrICsgbGVuKSB7Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGxlbisrOwo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgfSBlbHNlIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgcmV0ID0gZjJmc19zZWN1cmVfZXJhc2UocHJldl9iZGV2LAo+ID4gKyAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcHJldl9i
bG9jaywgbGVuLCBmbGFncyk7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGlmIChyZXQpCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgZ290byBvdXQ7Cj4gPiArCj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGxlbiA9IDA7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICB9Cj4gPiAr
ICAgICAgICAgICAgICAgICAgICAgfQo+ID4gKwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIGlm
ICghbGVuKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBwcmV2X2JkZXYgPSBj
dXJfYmRldjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHByZXZfYmxvY2sgPSBi
bGthZGRyOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbGVuID0gMTsKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICB9Cj4gPiArICAgICAgICAgICAgIH0KPiA+ICsKPiA+ICsgICAg
ICAgICAgICAgZjJmc19wdXRfZG5vZGUoJmRuKTsKPiA+ICsgICAgIH0KPgo+IFRoaXMgbG9vcCBw
cm9jZXNzZXMgdGhlIGVudGlyZSBmaWxlLCB3aGljaCBtYXkgYmUgdmVyeSBsYXJnZS4gIFNvIGl0
IGNvdWxkIHRha2UKPiBhIHZlcnkgbG9uZyB0aW1lIHRvIGV4ZWN1dGUuCj4KPiBJdCBzaG91bGQg
YXQgbGVhc3QgdXNlIHRoZSBmb2xsb3dpbmcgdG8gbWFrZSB0aGUgdGFzayBraWxsYWJsZSBhbmQg
cHJlZW1wdGlibGU6Cj4KPiAgICAgICAgICAgICAgICAgaWYgKGZhdGFsX3NpZ25hbF9wZW5kaW5n
KGN1cnJlbnQpKSB7Cj4gICAgICAgICAgICAgICAgICAgICAgICAgZXJyID0gLUVJTlRSOwo+ICAg
ICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+ICAgICAgICAgICAgICAgICB9Cj4gICAg
ICAgICAgICAgICAgIGNvbmRfcmVzY2hlZCgpOwo+CgpHb29kIHBvaW50IQoKPiBBbHNvLCBwZXJo
YXBzIHRoaXMgaW9jdGwgc2hvdWxkIGJlIG1hZGUgaW5jcmVtZW50YWwsIGkuZS4gdGFrZSBpbiBh
bgo+IChvZmZzZXQsIGxlbmd0aCkgbGlrZSBwd3JpdGUoKT8KPgo+IC0gRXJpYwoKRGlzY2FyZCBh
bmQgWmVyb2luZyB3aWxsIGJlIHRyZWF0ZWQgaW4gYSB1bml0IG9mIGJsb2NrLCB3aGljaCBpcyA0
S0IKaW4gRjJGUyBjYXNlLgpEbyB5b3UgcmVhbGx5IG5lZWQgdGhlIChvZmZzZXQsIGxlbmd0aCkg
b3B0aW9uIGhlcmUgZXZlbiBpZiB0aGUgdW5pdAppcyBhIDRLQiBibG9jaz8gSSBndWVzcyB0aGlz
IG9wdGlvbiBtaWdodCBtYWtlIHRoZSB1c2VyIGV2ZW4KaW5jb252ZW5pZW5jZWQgdG8gdXNlIHRo
aXMgaW9jdGwsIGJlY2F1c2UgdGhleSBoYXZlIHRvIGJlYXIgNEtCCmFsaWdubWVudCBpbiBtaW5k
LgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4
LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9y
Z2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4
LWYyZnMtZGV2ZWwK
