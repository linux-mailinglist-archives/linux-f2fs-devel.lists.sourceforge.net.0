Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CDBFE327049
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Feb 2021 06:01:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lGECc-0006MD-Dm; Sun, 28 Feb 2021 05:01:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lGECb-0006M6-9j
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Feb 2021 05:01:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+c6qGt/m7SehmWAD/KWO+4gdk8gn2h3vvPF+OSXyG5s=; b=Tfmz7S2u/F3Fb6ByfPEdsJp8+h
 hFT9b3WZNszwGpEYYFnf3TGwPxFJP1dBOA0qlhafbzdB+HH9f5xg1hQURPgPwrJWMjx15mMr8dkm6
 LpWcP5sNsdT5cSE4+5hITXkZjE7TNMOys2cqQcmOG+yE8/v/fU/085wZtg+PJ8480GTk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+c6qGt/m7SehmWAD/KWO+4gdk8gn2h3vvPF+OSXyG5s=; b=IbWeJ2GCydtfNTyUs99tNyMjt/
 uoLeS4IFklbqh8LOOSZsfmvuTAePdEhVA3LZg7Ayzq2sclA/rzZ6aqAy6hG5RacmWzvjZzyVH4tpE
 ejejdRQ2enIxf1MPYh4NmpFOuVoq1IH6+8tew6mXJlWfOzunbe3wS3Y9Ums7yiThueiw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lGECQ-0005nZ-RT
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 28 Feb 2021 05:01:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 37AE664DD3;
 Sun, 28 Feb 2021 05:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614488453;
 bh=xQkMVcApfL3t8q7iWpH6mY+eJIkLuQ6BUnZPCj+gU5w=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=BNyRoc/oZOtX9taoGATLjm2dxB0dYBTzztSuW5ONJGVMhWcto8jYx1xD2rtIzLmUd
 N2j5SVb40RAK7hqsrCSUkV0bJDe8w7Vd65nFTzpn3hBeW/py7LEw+bgoTGIa7TUzDP
 P511iZxGBzZZRn79KYKl/HzQ4KXlivbUr4nIDBwq6dkGkkaM1pDdaFUAW2ueh72ZsQ
 UknI/6Hbum4BrrSSKa4jmgC79g8cSvDGE7VBg1n7DJMLx72CtBs+Ncc5aOlLFxdQFS
 yFKlFCtlvUgmJwogKAUJQKAxhnKZtoA2u3PCrTYh3dzEU7TVRyXM2Xq6mcS9obXkP/
 ZUSfeO5eeH9/A==
Date: Sat, 27 Feb 2021 21:00:51 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <YDsjg1LqnkYIvvtB@google.com>
References: <20210224190313.GA144040@embeddedor>
 <bee16b72-f2e2-b113-9785-7f760be867df@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bee16b72-f2e2-b113-9785-7f760be867df@huawei.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wikipedia.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lGECQ-0005nZ-RT
Subject: Re: [f2fs-dev] [PATCH][next] f2fs: Replace one-element array with
 flexible-array member
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDIvMjUsIENoYW8gWXUgd3JvdGU6Cj4gSGVsbG8sIEd1c3Rhdm8sCj4gCj4gT24gMjAyMS8y
LzI1IDM6MDMsIEd1c3Rhdm8gQS4gUi4gU2lsdmEgd3JvdGU6Cj4gPiBUaGVyZSBpcyBhIHJlZ3Vs
YXIgbmVlZCBpbiB0aGUga2VybmVsIHRvIHByb3ZpZGUgYSB3YXkgdG8gZGVjbGFyZSBoYXZpbmcK
PiA+IGEgZHluYW1pY2FsbHkgc2l6ZWQgc2V0IG9mIHRyYWlsaW5nIGVsZW1lbnRzIGluIGEgc3Ry
dWN0dXJlLiBLZXJuZWwgY29kZQo+ID4gc2hvdWxkIGFsd2F5cyB1c2Ug4oCcZmxleGlibGUgYXJy
YXkgbWVtYmVyc+KAnVsxXSBmb3IgdGhlc2UgY2FzZXMuIFRoZSBvbGRlcgo+ID4gc3R5bGUgb2Yg
b25lLWVsZW1lbnQgb3IgemVyby1sZW5ndGggYXJyYXlzIHNob3VsZCBubyBsb25nZXIgYmUgdXNl
ZFsyXS4KPiAKPiBJIHByb3Bvc2FsIHRvIGRvIHRoZSBzaW1pbGFyIGNsZWFudXAsIGFuZCBJJ3Zl
IG5vIG9iamVjdGlvbiBvbiBkb2luZyB0aGlzLgo+IAo+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3Jn
L3BhdGNod29yay9wYXRjaC84Njk0NDAvCj4gCj4gTGV0J3MgYXNrIGZvciBKYWVnZXVrJyBvcGlu
aW9uLgoKTWVyZ2VkLCB0aGFua3MuClRoaXMgbG9va3MgYmV0dGVyIHJlYXNvbiB0aGFuIGNvZGUg
cmVhZGFiaWxpdHkuIDopCgo+IAo+ID4gCj4gPiBSZWZhY3RvciB0aGUgY29kZSBhY2NvcmRpbmcg
dG8gdGhlIHVzZSBvZiBhIGZsZXhpYmxlLWFycmF5IG1lbWJlciBpbgo+ID4gc3RydWN0IGYyZnNf
Y2hlY2twb2ludCwgaW5zdGVhZCBvZiBhIG9uZS1lbGVtZW50IGFycmF5cy4KPiA+IAo+ID4gTm90
aWNlIHRoYXQgYSB0ZW1wb3JhcnkgcG9pbnRlciB0byB2b2lkICcqdG1wX3B0cicgd2FzIHVzZWQg
aW4gb3JkZXIgdG8KPiA+IGZpeCB0aGUgZm9sbG93aW5nIGVycm9ycyB3aGVuIHVzaW5nIGEgZmxl
eGlibGUgYXJyYXkgaW5zdGVhZCBvZiBhIG9uZQo+ID4gZWxlbWVudCBhcnJheSBpbiBzdHJ1Y3Qg
ZjJmc19jaGVja3BvaW50Ogo+ID4gCj4gPiAgICBDQyBbTV0gIGZzL2YyZnMvZGlyLm8KPiA+IElu
IGZpbGUgaW5jbHVkZWQgZnJvbSBmcy9mMmZzL2Rpci5jOjEzOgo+ID4gZnMvZjJmcy9mMmZzLmg6
IEluIGZ1bmN0aW9uIOKAmF9fYml0bWFwX3B0cuKAmToKPiA+IGZzL2YyZnMvZjJmcy5oOjIyMjc6
NDA6IGVycm9yOiBpbnZhbGlkIHVzZSBvZiBmbGV4aWJsZSBhcnJheSBtZW1iZXIKPiA+ICAgMjIy
NyB8ICAgcmV0dXJuICZja3B0LT5zaXRfbmF0X3ZlcnNpb25fYml0bWFwICsgb2Zmc2V0ICsgc2l6
ZW9mKF9fbGUzMik7Cj4gPiAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBeCj4gPiBmcy9mMmZzL2YyZnMuaDoyMjI3OjQ5OiBlcnJvcjogaW52YWxpZCB1c2Ug
b2YgZmxleGlibGUgYXJyYXkgbWVtYmVyCj4gPiAgIDIyMjcgfCAgIHJldHVybiAmY2twdC0+c2l0
X25hdF92ZXJzaW9uX2JpdG1hcCArIG9mZnNldCArIHNpemVvZihfX2xlMzIpOwo+ID4gICAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXgo+ID4g
ZnMvZjJmcy9mMmZzLmg6MjIzODo0MDogZXJyb3I6IGludmFsaWQgdXNlIG9mIGZsZXhpYmxlIGFy
cmF5IG1lbWJlcgo+ID4gICAyMjM4IHwgICByZXR1cm4gJmNrcHQtPnNpdF9uYXRfdmVyc2lvbl9i
aXRtYXAgKyBvZmZzZXQ7Cj4gPiAgICAgICAgfCAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBeCj4gPiBtYWtlWzJdOiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6Mjg3
OiBmcy9mMmZzL2Rpci5vXSBFcnJvciAxCj4gPiBtYWtlWzFdOiAqKiogW3NjcmlwdHMvTWFrZWZp
bGUuYnVpbGQ6NTMwOiBmcy9mMmZzXSBFcnJvciAyCj4gPiBtYWtlOiAqKiogW01ha2VmaWxlOjE4
MTk6IGZzXSBFcnJvciAyCj4gPiAKPiA+IFsxXSBodHRwczovL2VuLndpa2lwZWRpYS5vcmcvd2lr
aS9GbGV4aWJsZV9hcnJheV9tZW1iZXIKPiA+IFsyXSBodHRwczovL3d3dy5rZXJuZWwub3JnL2Rv
Yy9odG1sL3Y1LjkvcHJvY2Vzcy9kZXByZWNhdGVkLmh0bWwjemVyby1sZW5ndGgtYW5kLW9uZS1l
bGVtZW50LWFycmF5cwo+ID4gCj4gPiBMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vS1NQUC9saW51
eC9pc3N1ZXMvNzkKPiA+IEJ1aWxkLXRlc3RlZC1ieToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBp
bnRlbC5jb20+Cj4gPiBMaW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9sa21sLzYwMzY0N2U0
LkRlRUZibDRlcWxqdXdBVWUlMjVsa3BAaW50ZWwuY29tLwo+ID4gU2lnbmVkLW9mZi1ieTogR3Vz
dGF2byBBLiBSLiBTaWx2YSA8Z3VzdGF2b2Fyc0BrZXJuZWwub3JnPgo+ID4gLS0tCj4gPiAgIGZz
L2YyZnMvZjJmcy5oICAgICAgICAgIHwgNSArKystLQo+ID4gICBpbmNsdWRlL2xpbnV4L2YyZnNf
ZnMuaCB8IDIgKy0KPiA+ICAgMiBmaWxlcyBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDMgZGVs
ZXRpb25zKC0pCj4gPiAKPiA+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2YyZnMuaCBiL2ZzL2YyZnMv
ZjJmcy5oCj4gPiBpbmRleCBlMmQzMDJhZTNhNDYuLjNmNWNiMDk3YzMwZiAxMDA2NDQKPiA+IC0t
LSBhL2ZzL2YyZnMvZjJmcy5oCj4gPiArKysgYi9mcy9mMmZzL2YyZnMuaAo+ID4gQEAgLTIyMTUs
NiArMjIxNSw3IEBAIHN0YXRpYyBpbmxpbmUgYmxvY2tfdCBfX2NwX3BheWxvYWQoc3RydWN0IGYy
ZnNfc2JfaW5mbyAqc2JpKQo+ID4gICBzdGF0aWMgaW5saW5lIHZvaWQgKl9fYml0bWFwX3B0cihz
dHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGludCBmbGFnKQo+ID4gICB7Cj4gPiAgIAlzdHJ1Y3Qg
ZjJmc19jaGVja3BvaW50ICpja3B0ID0gRjJGU19DS1BUKHNiaSk7Cj4gPiArCXZvaWQgKnRtcF9w
dHIgPSAmY2twdC0+c2l0X25hdF92ZXJzaW9uX2JpdG1hcDsKPiA+ICAgCWludCBvZmZzZXQ7Cj4g
PiAgIAlpZiAoaXNfc2V0X2NrcHRfZmxhZ3Moc2JpLCBDUF9MQVJHRV9OQVRfQklUTUFQX0ZMQUcp
KSB7Cj4gPiBAQCAtMjIyNCw3ICsyMjI1LDcgQEAgc3RhdGljIGlubGluZSB2b2lkICpfX2JpdG1h
cF9wdHIoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBpbnQgZmxhZykKPiA+ICAgCQkgKiBpZiBs
YXJnZV9uYXRfYml0bWFwIGZlYXR1cmUgaXMgZW5hYmxlZCwgbGVhdmUgY2hlY2tzdW0KPiA+ICAg
CQkgKiBwcm90ZWN0aW9uIGZvciBhbGwgbmF0L3NpdCBiaXRtYXBzLgo+ID4gICAJCSAqLwo+ID4g
LQkJcmV0dXJuICZja3B0LT5zaXRfbmF0X3ZlcnNpb25fYml0bWFwICsgb2Zmc2V0ICsgc2l6ZW9m
KF9fbGUzMik7Cj4gPiArCQlyZXR1cm4gdG1wX3B0ciArIG9mZnNldCArIHNpemVvZihfX2xlMzIp
Owo+ID4gICAJfQo+ID4gICAJaWYgKF9fY3BfcGF5bG9hZChzYmkpID4gMCkgewo+ID4gQEAgLTIy
MzUsNyArMjIzNiw3IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCAqX19iaXRtYXBfcHRyKHN0cnVjdCBm
MmZzX3NiX2luZm8gKnNiaSwgaW50IGZsYWcpCj4gPiAgIAl9IGVsc2Ugewo+ID4gICAJCW9mZnNl
dCA9IChmbGFnID09IE5BVF9CSVRNQVApID8KPiA+ICAgCQkJbGUzMl90b19jcHUoY2twdC0+c2l0
X3Zlcl9iaXRtYXBfYnl0ZXNpemUpIDogMDsKPiA+IC0JCXJldHVybiAmY2twdC0+c2l0X25hdF92
ZXJzaW9uX2JpdG1hcCArIG9mZnNldDsKPiA+ICsJCXJldHVybiB0bXBfcHRyICsgb2Zmc2V0Owo+
ID4gICAJfQo+ID4gICB9Cj4gPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9mMmZzX2ZzLmgg
Yi9pbmNsdWRlL2xpbnV4L2YyZnNfZnMuaAo+ID4gaW5kZXggYzZjYzBhNTY2ZWY1Li41NDg3YTgw
NjE3YTMgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL2xpbnV4L2YyZnNfZnMuaAo+ID4gKysrIGIv
aW5jbHVkZS9saW51eC9mMmZzX2ZzLmgKPiA+IEBAIC0xNjgsNyArMTY4LDcgQEAgc3RydWN0IGYy
ZnNfY2hlY2twb2ludCB7Cj4gPiAgIAl1bnNpZ25lZCBjaGFyIGFsbG9jX3R5cGVbTUFYX0FDVElW
RV9MT0dTXTsKPiA+ICAgCS8qIFNJVCBhbmQgTkFUIHZlcnNpb24gYml0bWFwICovCj4gPiAtCXVu
c2lnbmVkIGNoYXIgc2l0X25hdF92ZXJzaW9uX2JpdG1hcFsxXTsKPiA+ICsJdW5zaWduZWQgY2hh
ciBzaXRfbmF0X3ZlcnNpb25fYml0bWFwW107Cj4gPiAgIH0gX19wYWNrZWQ7Cj4gPiAgICNkZWZp
bmUgQ1BfQ0hLU1VNX09GRlNFVAk0MDkyCS8qIGRlZmF1bHQgY2hrc3VtIG9mZnNldCBpbiBjaGVj
a3BvaW50ICovCj4gPiAKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
