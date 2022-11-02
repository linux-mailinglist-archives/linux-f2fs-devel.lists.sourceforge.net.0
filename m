Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 65D396159D1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  2 Nov 2022 04:19:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oq4HX-0001DE-Lq;
	Wed, 02 Nov 2022 03:19:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1oq4HW-0001D7-UB
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 03:19:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RtdDu1XhjukA5//tIV86zSScnRsxCvfkD1+2VtLIZBg=; b=MVQgCzjp79mLlD+ZM2FLQk8pv+
 NsWi1ioxuChWncTtFMbDFrJxBXslJMYLQ94hqB/tVVmPexMXGdXlpGfMsP2IbSYqxsVOV15Z7QFZY
 T7PbPLD5EBd0vWasYyFvF8CYk2OJT6ZdNaBqX6EuIA81tOCqliicPzICGLqShvPulojw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RtdDu1XhjukA5//tIV86zSScnRsxCvfkD1+2VtLIZBg=; b=YMaaXnHpz9+kXh64yMaSrCFdWJ
 D87bmo3U8Y4+g59UmPW4FB97ap/IWqwZOJQ7FpbGXnTN4oqKFgP9pgxeumFU6tc/udxp1rzkrmafL
 +FUcWBmDcXQCE5ovFnIE82nnWJonvRJ8m9e7i6ZWZ9HoIO9f0aSa8ThZEf0WYKpTPN38=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oq4HV-0007uh-6h for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 02 Nov 2022 03:19:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0474B6172F;
 Wed,  2 Nov 2022 03:18:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F689C433D6;
 Wed,  2 Nov 2022 03:18:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667359138;
 bh=KcGiTRaZfmlEo5IKwLcw1/1BbTGoEkzktFrFYhCPxg4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=s/FBQFXDsDtahB2rzcooMQFziT53s6otnpCKRzohdV6fzU7aOfgMnlIUn5NPhyugm
 D0gHZkbBTX9mvdb6fmIWT0SoxXjRy2xCb+dVner4UNtu5tHDTosu33k4FGkFmwMn3k
 lh0iqoAi+yVBPfcC60Umf8bqDkISnyAjDAcG8rxcmj1RApBKocmlLUnCanuV+Mn1Cn
 HnsPg/iEn6uQWdKKdnKRKEHEXxQ4WRd3/UWbKPH4NAN7I0FGugDRIhtlDRThrqYGMM
 y8kSQ7ts3hcuERKBh9X3DKctEIfz5BqLNa9gOrdHjSjTJ2ebeArEs0cHpyPM1MDCrH
 Wlq0X9IwO5Jaw==
Date: Tue, 1 Nov 2022 20:18:56 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: fengnan chang <fengnanchang@gmail.com>
Message-ID: <Y2HhoBnocFff1WFB@sol.localdomain>
References: <20220608134852.476876-1-fengnanchang@gmail.com>
 <Y2HQftXirAxvab6M@sol.localdomain>
 <694663F8-701D-4318-94D0-A1F532DDF6F9@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <694663F8-701D-4318-94D0-A1F532DDF6F9@gmail.com>
X-Spam-Score: -6.3 (------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Wed, Nov 02, 2022 at 11:06:17AM +0800, fengnan chang wrote:
    > > > > 2022年11月2日 10:05，Eric Biggers <ebiggers@kernel.org> 写道：
    > > > > On Wed, Jun 08, 2022 at 09:48:52PM +0800, Fengnan C [...] 
 
 Content analysis details:   (-6.3 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -1.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1oq4HV-0007uh-6h
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: fix hungtask when decompressed fail
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gV2VkLCBOb3YgMDIsIDIwMjIgYXQgMTE6MDY6MTdBTSArMDgwMCwgZmVuZ25hbiBjaGFuZyB3
cm90ZToKPiAKPiAKPiA+IDIwMjLlubQxMeaciDLml6UgMTA6MDXvvIxFcmljIEJpZ2dlcnMgPGVi
aWdnZXJzQGtlcm5lbC5vcmc+IOWGmemBk++8mgo+ID4gCj4gPiBPbiBXZWQsIEp1biAwOCwgMjAy
MiBhdCAwOTo0ODo1MlBNICswODAwLCBGZW5nbmFuIENoYW5nIHdyb3RlOgo+ID4+IFdoZW4gZGVj
b21wcmVzc2VkIGZhaWxlZCwgZjJmc19wcmVwYXJlX2NvbXByZXNzX292ZXJ3cml0ZSB3aWxsIGVu
dGVyCj4gPj4gZW5kbGVzcyBsb29wLCBtYXkgY2FzdWUgaHVuZ3Rhc2suCj4gPj4gCj4gPj4gWyAg
IDE0LjA4ODY2NV0gRjJGUy1mcyAobnZtZTBuMSk6IGx6NCBkZWNvbXByZXNzIGZhaWxlZCwgcmV0
Oi00MTU1Cj4gPj4gWyAgIDE0LjA4OTg1MV0gRjJGUy1mcyAobnZtZTBuMSk6IGx6NCBkZWNvbXBy
ZXNzIGZhaWxlZCwgcmV0Oi00MTU1Cj4gPj4gCj4gPj4gU2lnbmVkLW9mZi1ieTogRmVuZ25hbiBD
aGFuZyA8ZmVuZ25hbmNoYW5nQGdtYWlsLmNvbT4KPiA+IAo+ID4gVGhpcyBjb21taXQgbWVzc2Fn
ZSBvbmx5IGV4cGxhaW5zIHRoZSBwcm9ibGVtLCBub3QgdGhlIHNvbHV0aW9uLiAgSXQgc2hvdWxk
Cj4gPiBleHBsYWluIHRoZSBzb2x1dGlvbiB0b28uCj4gPiAKPiA+IEFsc28sIGlmIGl0J3MgZml4
aW5nIGEgYnVnLCBpdCBuZWVkcyAnRml4ZXMnIGFuZCAnQ2Mgc3RhYmxlJyB0YWdzLgo+IAo+IEni
gJlsbCBhZGQgbW9yZSBleHBsYW5hdGlvbiBhbmQgdGFncywgdGhhbmtzLgo+IAo+ID4gCj4gPj4g
ZGlmZiAtLWdpdCBhL2ZzL2YyZnMvY29tcHJlc3MuYyBiL2ZzL2YyZnMvY29tcHJlc3MuYwo+ID4+
IGluZGV4IDI0ODI0Y2Q5NmYzNi4uMTc2NGUzODU5MjYyIDEwMDY0NAo+ID4+IC0tLSBhL2ZzL2Yy
ZnMvY29tcHJlc3MuYwo+ID4+ICsrKyBiL2ZzL2YyZnMvY29tcHJlc3MuYwo+ID4+IEBAIC0xMDYw
LDcgKzEwNjAsNyBAQCBzdGF0aWMgaW50IHByZXBhcmVfY29tcHJlc3Nfb3ZlcndyaXRlKHN0cnVj
dCBjb21wcmVzc19jdHggKmNjLAo+ID4+IAlzZWN0b3JfdCBsYXN0X2Jsb2NrX2luX2JpbzsKPiA+
PiAJdW5zaWduZWQgZmdwX2ZsYWcgPSBGR1BfTE9DSyB8IEZHUF9XUklURSB8IEZHUF9DUkVBVDsK
PiA+PiAJcGdvZmZfdCBzdGFydF9pZHggPSBzdGFydF9pZHhfb2ZfY2x1c3RlcihjYyk7Cj4gPj4g
LQlpbnQgaSwgcmV0Owo+ID4+ICsJaW50IGksIHJldCwgcmV0cnlfY291bnQgPSAzOwo+ID4+IAo+
ID4+IHJldHJ5Ogo+ID4+IAlyZXQgPSBmMmZzX2lzX2NvbXByZXNzZWRfY2x1c3RlcihjYy0+aW5v
ZGUsIHN0YXJ0X2lkeCk7Cj4gPj4gQEAgLTExMjAsNyArMTEyMCwxMiBAQCBzdGF0aWMgaW50IHBy
ZXBhcmVfY29tcHJlc3Nfb3ZlcndyaXRlKHN0cnVjdCBjb21wcmVzc19jdHggKmNjLAo+ID4+IAkJ
CWYyZnNfcHV0X3JwYWdlcyhjYyk7Cj4gPj4gCQkJZjJmc191bmxvY2tfcnBhZ2VzKGNjLCBpICsg
MSk7Cj4gPj4gCQkJZjJmc19kZXN0cm95X2NvbXByZXNzX2N0eChjYywgdHJ1ZSk7Cj4gPj4gLQkJ
CWdvdG8gcmV0cnk7Cj4gPj4gKwkJCXJldHJ5X2NvdW50LS07Cj4gPj4gKwkJCWlmIChQYWdlRXJy
b3IocGFnZSkgJiYgIXJldHJ5X2NvdW50KSB7Cj4gPj4gKwkJCQlyZXQgPSAtRUlPOwo+ID4+ICsJ
CQkJZ290byBvdXQ7Cj4gPj4gKwkJCX0gZWxzZQo+ID4gCj4gPiBXaGF0IGlzIHRoZSBwdXJwb3Nl
IG9mIHVzaW5nIFBHX2Vycm9yIGhlcmU/Cj4gCj4gSW4gdGhpcyB2ZXJzaW9uLCB3ZSBzZXQgUEdf
ZXJyb3Igd2hlbiBjb21wcmVzc2VkIGZhaWxlZCwgc28gY2hlY2sgUEdfZXJyb3IgaGVyZS4KPiBN
YXliZSB3ZSBjYW4gcmVtb3ZlIFBHX2Vycm9yIGluIGxhdGVyPwo+IAoKUmVhZCBJL08gZXJyb3Jz
IGNhbiBiZSBkZXRlY3RlZCB2aWEgUEdfdXB0b2RhdGUgbm90IGJlaW5nIHNldC4gIFRoZXJlIHNo
b3VsZG4ndApiZSBhbnkgbmVlZCBmb3IgUEdfZXJyb3IgaGVyZS4KCi0gRXJpYwoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwg
bWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBz
Oi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
