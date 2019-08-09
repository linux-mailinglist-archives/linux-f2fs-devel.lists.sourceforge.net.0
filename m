Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6664687E34
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Aug 2019 17:39:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hw6zB-0000nS-3k; Fri, 09 Aug 2019 15:39:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hw6z9-0000nI-PF
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Aug 2019 15:39:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a7oMwBpsDamzpaJq8CYS00iaVkDQghSnqWYNgitPQQI=; b=ktqinCb/QXiyBkuyhJYMfxFbrh
 6aqpCYlgr/wUQ4Z3G7S0B9aX7B5TP8rltqsTwXCyC2LLx1x0lucdlT6mH7EFndvnVYiDPzjVzALfi
 bvIGrrYiGXFIUStYjm7ycOKbXnRU6YSL5QE+Jnp9gVrojPFR5qSGJUYSSoZPA29maWjk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=a7oMwBpsDamzpaJq8CYS00iaVkDQghSnqWYNgitPQQI=; b=T3SuBHfw9lQSaAk8byTX922GpE
 I1WthhRpdrHEyUy1H1p0h6YVyG+vKRCXVlKu0KTdSJnSqsjT96aKu4ynoPzbhwy4RYCueRdKRU0vV
 jUzdpwZI0T4PEP1X8yc+lZ3nUENB37cTGzHcoiiqFfWZSBe/yjHs0clzFRyJ7Mg6m+eQ=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hw6z8-00HUnN-Cq
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Aug 2019 15:39:19 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ACF09208C4;
 Fri,  9 Aug 2019 15:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565365152;
 bh=6c0uw8sPwt+aNNGifz//kkI3LfuvIkUPJWpQk4PFYiY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=00e9lY40tdmXTUutPd9sc+cCVuSBCyNG2AMDGjKptxp9kSoMTTm7cLBChF1cHWwJz
 tHvsmyO7BEkGMwuRBbAwueEzNkKToerJp5d91btcJW9WWsJzirqcl+EIftcGzdpTm2
 71El3Y4kRuMrdVbIQaYLqlERxbcN+Ykn+VORAoLI=
Date: Fri, 9 Aug 2019 08:39:11 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Ju Hyung Park <qkrwngud825@gmail.com>
Message-ID: <20190809153911.GE93481@jaegeuk-macbookpro.roam.corp.google.com>
References: <20190808231108.75599-1-jaegeuk@kernel.org>
 <20190809151253.GA93481@jaegeuk-macbookpro.roam.corp.google.com>
 <CAD14+f2V=j8o=0sUGMgmJHmwKgm80WyzJC5yW7qmyffL=CBJhw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD14+f2V=j8o=0sUGMgmJHmwKgm80WyzJC5yW7qmyffL=CBJhw@mail.gmail.com>
User-Agent: Mutt/1.8.2 (2017-04-18)
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hw6z8-00HUnN-Cq
Subject: Re: [f2fs-dev] [PATCH v2] mkfs.f2fs: check zeros in first 16MB for
 Android
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDgvMTAsIEp1IEh5dW5nIFBhcmsgd3JvdGU6Cj4gSGkgSmFlZ2V1aywKPiAKPiBKdXN0IG91
dCBvZiBjdXJpb3NpdHksIHdoYXQncyB0aGUgcG9pbnQgb2YgdGhpcz8KPiAKPiBJIHRob3VnaHQg
Zmxhc2ggY2hpcHMgc2tpcCBlcmFzaW5nIGJsb2NrcyBpZiBpdCdzIGFscmVhZHkgZXJhc2VkIHRv
Cj4gcHJlc2VydmUgUC9FIGN5Y2xlcyBhcyBtdWNoIGFzIHBvc3NpYmxlLgo+IEFsbCBBbmRyb2lk
IGRldmljZXMgSSBoYWQodmFyaW91cyB2ZXJzaW9ucyBvZiBlTU1DIGFuZCBVRlMpIHJhbiBmdWxs
IHJhbmdlCj4gYmxvY2stbGV2ZWwgZGlzY2FyZHMgcHJldHR5IGZhc3QgdG9vLgoKVW5mb3J0dW5h
dGVseSwgc29tZSBvZiB0aGVtIGFyZSBnaXZpbmcgbG9uZyBkZWxheXMgb24gYSBidW5jaCBvZiB1
bm1hcCBjb21tYW5kcwpyZXN1bHRpbmcgaW4gdXNlciBqYW5reSBpc3N1ZS4KCj4gCj4gVGhhbmtz
Lgo+IAo+IDIwMTnrhYQgOOyblCAxMOydvCAo7YagKSDsmKTsoIQgMTI6MTMsIEphZWdldWsgS2lt
IDxqYWVnZXVrQGtlcm5lbC5vcmc+64uY7J20IOyekeyEsToKPiAKPiA+IFdlIGFjdHVhbGx5IGRv
bid0IG5lZWQgdG8gaXNzdWUgdHJpbSBvbiBlbnRpcmUgZGlzayBieSBjaGVja2luZyBmaXJzdAo+
ID4gYmxvY2tzIGhhdmluZyB6ZXJvcy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBKYWVnZXVrIEtp
bSA8amFlZ2V1a0BrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiB2MiBmcm9tIHYxOgo+ID4gIC0gY2xl
YW4gdXAKPiA+Cj4gPiAgbWtmcy9mMmZzX2Zvcm1hdF91dGlscy5jIHwgNTMgKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKystLQo+ID4gIDEgZmlsZSBjaGFuZ2VkLCA1MSBpbnNl
cnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9ta2ZzL2YyZnNf
Zm9ybWF0X3V0aWxzLmMgYi9ta2ZzL2YyZnNfZm9ybWF0X3V0aWxzLmMKPiA+IGluZGV4IDhiZjEy
OGMuLmYyZDU1YWQgMTAwNjQ0Cj4gPiAtLS0gYS9ta2ZzL2YyZnNfZm9ybWF0X3V0aWxzLmMKPiA+
ICsrKyBiL21rZnMvZjJmc19mb3JtYXRfdXRpbHMuYwo+ID4gQEAgLTI1LDYgKzI1LDcgQEAKPiA+
ICAjaW5jbHVkZSA8c3RkaW8uaD4KPiA+ICAjaW5jbHVkZSA8dW5pc3RkLmg+Cj4gPiAgI2luY2x1
ZGUgPHN0ZGxpYi5oPgo+ID4gKyNpbmNsdWRlIDxzdGRib29sLmg+Cj4gPiAgI2lmbmRlZiBBTkRS
T0lEX1dJTkRPV1NfSE9TVAo+ID4gICNpbmNsdWRlIDxzeXMvaW9jdGwuaD4KPiA+ICAjZW5kaWYK
PiA+IEBAIC0xMTAsMTMgKzExMSw2MSBAQCBzdGF0aWMgaW50IHRyaW1fZGV2aWNlKGludCBpKQo+
ID4gICAgICAgICByZXR1cm4gMDsKPiA+ICB9Cj4gPgo+ID4gK3N0YXRpYyBib29sIGlzX3dpcGVk
X2RldmljZShpbnQgaSkKPiA+ICt7Cj4gPiArI2lmZGVmIFdJVEhfQU5EUk9JRAo+ID4gKyAgICAg
ICBzdHJ1Y3QgZGV2aWNlX2luZm8gKmRldiA9IGMuZGV2aWNlcyArIGk7Cj4gPiArICAgICAgIGlu
dCBmZCA9IGRldi0+ZmQ7Cj4gPiArICAgICAgIGNoYXIgKmJ1ZiwgKnplcm9fYnVmOwo+ID4gKyAg
ICAgICBib29sIHdpcGVkID0gdHJ1ZTsKPiA+ICsgICAgICAgaW50IG5ibG9ja3MgPSA0MDk2OyAg
ICAgLyogMTZNQiBzaXplICovCj4gPiArICAgICAgIGludCBqOwo+ID4gKwo+ID4gKyAgICAgICBi
dWYgPSBtYWxsb2MoRjJGU19CTEtTSVpFKTsKPiA+ICsgICAgICAgaWYgKGJ1ZiA9PSBOVUxMKSB7
Cj4gPiArICAgICAgICAgICAgICAgTVNHKDEsICJcdEVycm9yOiBNYWxsb2MgRmFpbGVkIGZvciBi
dWYhISFcbiIpOwo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+ICsgICAgICAg
fQo+ID4gKyAgICAgICB6ZXJvX2J1ZiA9IGNhbGxvYygxLCBGMkZTX0JMS1NJWkUpOwo+ID4gKyAg
ICAgICBpZiAoemVyb19idWYgPT0gTlVMTCkgewo+ID4gKyAgICAgICAgICAgICAgIE1TRygxLCAi
XHRFcnJvcjogQ2FsbG9jIEZhaWxlZCBmb3IgemVybyBidWYhISFcbiIpOwo+ID4gKyAgICAgICAg
ICAgICAgIGZyZWUoYnVmKTsKPiA+ICsgICAgICAgICAgICAgICByZXR1cm4gZmFsc2U7Cj4gPiAr
ICAgICAgIH0KPiA+ICsKPiA+ICsgICAgICAgaWYgKGxzZWVrKGZkLCAwLCBTRUVLX1NFVCkgPCAw
KSB7Cj4gPiArICAgICAgICAgICAgICAgZnJlZSh6ZXJvX2J1Zik7Cj4gPiArICAgICAgICAgICAg
ICAgZnJlZShidWYpOwo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPiA+ICsgICAg
ICAgfQo+ID4gKwo+ID4gKyAgICAgICAvKiBjaGVjayBmaXJzdCBuIGJsb2NrcyAqLwo+ID4gKyAg
ICAgICBmb3IgKGogPSAwOyBqIDwgbmJsb2NrczsgaisrKSB7Cj4gPiArICAgICAgICAgICAgICAg
aWYgKHJlYWQoZmQsIGJ1ZiwgRjJGU19CTEtTSVpFKSAhPSBGMkZTX0JMS1NJWkUgfHwKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgbWVtY21wKGJ1ZiwgemVyb19idWYsIEYyRlNf
QkxLU0laRSkpIHsKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgIHdpcGVkID0gZmFsc2U7Cj4g
PiArICAgICAgICAgICAgICAgICAgICAgICBicmVhazsKPiA+ICsgICAgICAgICAgICAgICB9Cj4g
PiArICAgICAgIH0KPiA+ICsgICAgICAgZnJlZSh6ZXJvX2J1Zik7Cj4gPiArICAgICAgIGZyZWUo
YnVmKTsKPiA+ICsKPiA+ICsgICAgICAgaWYgKHdpcGVkKQo+ID4gKyAgICAgICAgICAgICAgIE1T
RygwLCAiSW5mbzogRm91bmQgYWxsIHplcm9zIGluIGZpcnN0ICVkIGJsb2Nrc1xuIiwKPiA+IG5i
bG9ja3MpOwo+ID4gKyAgICAgICByZXR1cm4gd2lwZWQ7Cj4gPiArI2Vsc2UKPiA+ICsgICAgICAg
cmV0dXJuIGZhbHNlOwo+ID4gKyNlbmRpZgo+ID4gK30KPiA+ICsKPiA+ICBpbnQgZjJmc190cmlt
X2RldmljZXModm9pZCkKPiA+ICB7Cj4gPiAgICAgICAgIGludCBpOwo+ID4KPiA+IC0gICAgICAg
Zm9yIChpID0gMDsgaSA8IGMubmRldnM7IGkrKykKPiA+IC0gICAgICAgICAgICAgICBpZiAodHJp
bV9kZXZpY2UoaSkpCj4gPiArICAgICAgIGZvciAoaSA9IDA7IGkgPCBjLm5kZXZzOyBpKyspIHsK
PiA+ICsgICAgICAgICAgICAgICBpZiAoIWlzX3dpcGVkX2RldmljZShpKSAmJiB0cmltX2Rldmlj
ZShpKSkKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIHJldHVybiAtMTsKPiA+ICsgICAgICAg
fQo+ID4gICAgICAgICBjLnRyaW1tZWQgPSAxOwo+ID4gICAgICAgICByZXR1cm4gMDsKPiA+ICB9
Cj4gPiAtLQo+ID4gMi4xOS4wLjYwNS5nMDFkMzcxZjc0MS1nb29nCj4gPgo+ID4KPiA+Cj4gPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+ID4gTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiA+IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNl
Zm9yZ2UubmV0Cj4gPiBodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCj4gPgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMt
ZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0
L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
