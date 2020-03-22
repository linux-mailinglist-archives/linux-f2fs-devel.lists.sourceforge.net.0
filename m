Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C1FC18E9A5
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 22 Mar 2020 16:30:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jG2Ye-0004Zt-ON; Sun, 22 Mar 2020 15:30:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <megi@xff.cz>) id 1jG2Yd-0004ZO-JI
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 22 Mar 2020 15:30:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eQkAwMUPPLvQ51yNu21HMbcimRGsbSNexABAehTgFmE=; b=EwbI6GIJvYj5JaleP0scloXuOY
 bXEK72OMl4d9mmD5ydRiHUsANc8wowcfiGOCd9+e/NUKySJU5xQalfGayZNDV8AZsh94u/6EJKSAM
 1EuJSzVza8tJNxTddAvQn6DkBNTV/jWmS5wDIRC81xYNwd+YjEnm4dFKOiZyURpr+JS0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eQkAwMUPPLvQ51yNu21HMbcimRGsbSNexABAehTgFmE=; b=ARjae3cn/eDeXlWeutqFUJipzl
 PjaDw3VyljAuzD2KzZ9G/fgtdNQpeSJnww+iqUw2tJoeo54JYeaCanr4LGCjupuiA550oI/LGmV7C
 4hQODOmQWrC4/JgwskiB/qiqayif385Loryoq93J21War9G0T6x8NxZZsTgXQxtZbfbQ=;
Received: from vps.xff.cz ([195.181.215.36])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jG2YT-003dbR-Mc
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 22 Mar 2020 15:30:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
 t=1584891015; bh=RoFPbFA3+ibWKe/oDKEUezK72UbjGOqeR5zVlBJwIws=;
 h=Date:From:To:Cc:Subject:References:X-My-GPG-KeyId:From;
 b=1LHl9RxrN4sRj7s3WgembJ8EhmKywDYj6P9hoQhr76RycVHZHFw3iq9T+zKTpF8FH
 opj1f8voTM7Bl9QzCkgRe+wYr7QrfdKoZgbq0J+0rzIXO+bpp5w/USelrJjaAH20tV
 0y3AUnMNaIEsaV2eiZEadG77iPQdjmULS7pUHmgA=
Date: Sun, 22 Mar 2020 16:30:14 +0100
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: Chao Yu <chao@kernel.org>
Message-ID: <20200322153014.czpca7ozhfy4ctdh@core.my.home>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>,
 Chao Yu <chao@kernel.org>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, Chao Yu <yuchao0@huawei.com>
References: <20200322101327.5979-1-chao@kernel.org>
 <20200322121434.i2jea6o5tzanip7z@core.my.home>
 <47c71fe9-e168-8080-d0ed-2cfaa9a77e5e@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <47c71fe9-e168-8080-d0ed-2cfaa9a77e5e@kernel.org>
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
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
X-Headers-End: 1jG2YT-003dbR-Mc
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix potential .flags overflow on 32bit
 architecture
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
Cc: jaegeuk@kernel.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gU3VuLCBNYXIgMjIsIDIwMjAgYXQgMDk6MTg6NTZQTSArMDgwMCwgQ2hhbyBZdSB3cm90ZToK
PiBIaSwKPiAKPiBPbiAyMDIwLTMtMjIgMjA6MTQsIE9uZMWZZWogSmlybWFuIHdyb3RlOgo+ID4g
SGVsbG8sCj4gPiAKPiA+IE9uIFN1biwgTWFyIDIyLCAyMDIwIGF0IDA2OjEzOjI3UE0gKzA4MDAs
IENoYW8gWXUgd3JvdGU6Cj4gPiA+IEZyb206IENoYW8gWXUgPHl1Y2hhbzBAaHVhd2VpLmNvbT4K
PiA+ID4gCj4gPiA+IGYyZnNfaW5vZGVfaW5mby5mbGFncyBpcyB1bnNpZ25lZCBsb25nIHZhcmlh
YmxlLCBpdCBoYXMgMzIgYml0cwo+ID4gPiBpbiAzMmJpdCBhcmNoaXRlY3R1cmUsIHNpbmNlIHdl
IGludHJvZHVjZWQgRklfTU1BUF9GSUxFIGZsYWcKPiA+ID4gd2hlbiB3ZSBzdXBwb3J0IGRhdGEg
Y29tcHJlc3Npb24sIHdlIG1heSBhY2Nlc3MgbWVtb3J5IGNyb3NzCj4gPiA+IHRoZSBib3JkZXIg
b2YgLmZsYWdzIGZpZWxkLCBjb3JydXB0aW5nIC5pX3NlbSBmaWVsZCwgcmVzdWx0IGluCj4gPiA+
IGJlbG93IGRlYWRsb2NrLgo+ID4gPiAKPiA+ID4gVG8gZml4IHRoaXMgaXNzdWUsIGxldCdzIGlu
dHJvZHVjZSAuZXh0cmFfZmxhZ3MgdG8gZ3JhYiBleHRyYQo+ID4gPiBzcGFjZSB0byBzdG9yZSB0
aG9zZSBuZXcgZmxhZ3MuCj4gPiA+IAo+ID4gPiBDYWxsIFRyYWNlOgo+ID4gPiAgX19zY2hlZHVs
ZSsweDhkMC8weDEzZmMKPiA+ID4gID8gbWFya19oZWxkX2xvY2tzKzB4YWMvMHgxMDAKPiA+ID4g
IHNjaGVkdWxlKzB4Y2MvMHgyNjAKPiA+ID4gIHJ3c2VtX2Rvd25fd3JpdGVfc2xvd3BhdGgrMHgz
YWIvMHg2NWQKPiA+ID4gIGRvd25fd3JpdGUrMHhjNy8weGUwCj4gPiA+ICBmMmZzX2Ryb3Bfbmxp
bmsrMHgzZC8weDYwMCBbZjJmc10KPiA+ID4gIGYyZnNfZGVsZXRlX2lubGluZV9lbnRyeSsweDMw
MC8weDQ0MCBbZjJmc10KPiA+ID4gIGYyZnNfZGVsZXRlX2VudHJ5KzB4M2ExLzB4N2YwIFtmMmZz
XQo+ID4gPiAgZjJmc191bmxpbmsrMHg1MDAvMHg3OTAgW2YyZnNdCj4gPiA+ICB2ZnNfdW5saW5r
KzB4MjExLzB4NDkwCj4gPiA+ICBkb191bmxpbmthdCsweDQ4My8weDUyMAo+ID4gPiAgc3lzX3Vu
bGluaysweDRhLzB4NzAKPiA+ID4gIGRvX2Zhc3Rfc3lzY2FsbF8zMisweDEyYi8weDY4Mwo+ID4g
PiAgZW50cnlfU1lTRU5URVJfMzIrMHhhYS8weDEwMgo+ID4gPiAKPiA+ID4gRml4ZXM6IDRjOGZm
NzA5NWJlZiAoImYyZnM6IHN1cHBvcnQgZGF0YSBjb21wcmVzc2lvbiIpCj4gPiA+IFNpZ25lZC1v
ZmYtYnk6IENoYW8gWXUgPHl1Y2hhbzBAaHVhd2VpLmNvbT4KPiA+ID4gLS0tCj4gPiA+ICBmcy9m
MmZzL2YyZnMuaCAgfCAyNiArKysrKysrKysrKysrKysrKysrKy0tLS0tLQo+ID4gPiAgZnMvZjJm
cy9pbm9kZS5jIHwgIDEgKwo+ID4gPiAgMiBmaWxlcyBjaGFuZ2VkLCAyMSBpbnNlcnRpb25zKCsp
LCA2IGRlbGV0aW9ucygtKQo+ID4gPiAKPiA+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5o
IGIvZnMvZjJmcy9mMmZzLmgKPiA+ID4gaW5kZXggZmNhZmE2ODIxMmViLi5mY2QyMmRmMmU5Y2Eg
MTAwNjQ0Cj4gPiA+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4gPiA+ICsrKyBiL2ZzL2YyZnMvZjJm
cy5oCj4gPiA+IEBAIC02OTUsNiArNjk1LDcgQEAgc3RydWN0IGYyZnNfaW5vZGVfaW5mbyB7Cj4g
PiA+IAo+ID4gPiAgCS8qIFVzZSBiZWxvdyBpbnRlcm5hbGx5IGluIGYyZnMqLwo+ID4gPiAgCXVu
c2lnbmVkIGxvbmcgZmxhZ3M7CQkvKiB1c2UgdG8gcGFzcyBwZXItZmlsZSBmbGFncyAqLwo+ID4g
PiArCXVuc2lnbmVkIGxvbmcgZXh0cmFfZmxhZ3M7CS8qIGV4dHJhIGZsYWdzICovCj4gPiA+ICAJ
c3RydWN0IHJ3X3NlbWFwaG9yZSBpX3NlbTsJLyogcHJvdGVjdCBmaSBpbmZvICovCj4gPiA+ICAJ
YXRvbWljX3QgZGlydHlfcGFnZXM7CQkvKiAjIG9mIGRpcnR5IHBhZ2VzICovCj4gPiA+ICAJZjJm
c19oYXNoX3QgY2hhc2g7CQkvKiBoYXNoIHZhbHVlIG9mIGdpdmVuIGZpbGUgbmFtZSAqLwo+ID4g
PiBAQCAtMjU2OSw3ICsyNTcwLDcgQEAgZW51bSB7Cj4gPiA+ICB9Owo+ID4gPiAKPiA+ID4gIHN0
YXRpYyBpbmxpbmUgdm9pZCBfX21hcmtfaW5vZGVfZGlydHlfZmxhZyhzdHJ1Y3QgaW5vZGUgKmlu
b2RlLAo+ID4gPiAtCQkJCQkJaW50IGZsYWcsIGJvb2wgc2V0KQo+ID4gPiArCQkJCQl1bnNpZ25l
ZCBsb25nIGxvbmcgZmxhZywgYm9vbCBzZXQpCj4gPiA+ICB7Cj4gPiA+ICAJc3dpdGNoIChmbGFn
KSB7Cj4gPiA+ICAJY2FzZSBGSV9JTkxJTkVfWEFUVFI6Cj4gPiA+IEBAIC0yNTg4LDIwICsyNTg5
LDMzIEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX21hcmtfaW5vZGVfZGlydHlfZmxhZyhzdHJ1Y3Qg
aW5vZGUgKmlub2RlLAo+ID4gPiAKPiA+ID4gIHN0YXRpYyBpbmxpbmUgdm9pZCBzZXRfaW5vZGVf
ZmxhZyhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBpbnQgZmxhZykKPiA+ID4gIHsKPiA+ID4gLQlpZiAo
IXRlc3RfYml0KGZsYWcsICZGMkZTX0koaW5vZGUpLT5mbGFncykpCj4gPiA+IC0JCXNldF9iaXQo
ZmxhZywgJkYyRlNfSShpbm9kZSktPmZsYWdzKTsKPiA+ID4gKwlpZiAoKDEgPDwgZmxhZykgPD0g
c2l6ZW9mKHVuc2lnbmVkIGxvbmcpKSB7Cj4gPiAKPiA+IF4gdGhpcyBpcyB3cm9uZy4gTWF5YmUg
eW91IG1lYW50IGZsYWcgPD0gQklUU19QRVJfTE9ORwo+IAo+IE9oLCBteSBiYWQsIEkgbWVhbnQg
dGhhdCwgdGhhbmtzIGZvciBwb2ludGluZyBvdXQgdGhpcy4gOikKPiAKPiA+IAo+ID4gQW5kIGRp
dHRvIGZvciB0aGUgc2FtZSBjaGVja3MgYmVsb3cuIE1heWJlIHlvdSBjYW4gbWFrZSBmbGFncyBh
biBhcnJheSBvZgo+ID4gQklUX1dPUkQobWF4X2ZsYWdfdmFsdWUpICsgMSBhbmQgc2tpcCB0aGUg
YnJhbmNoZXMgYWx0b2dldGhlcj8KCkkndmUgZm91bmQgbWF5YmUgYSBjbGVhcmVyIG1hY3JvIGZv
ciB0aGlzOiAKCiAgaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vbGludXgvbGF0ZXN0L3NvdXJj
ZS9pbmNsdWRlL2xpbnV4L2JpdG9wcy5oI0wxNQoKICBCSVRTX1RPX0xPTkdTKG5yKQoKQnV0IGl0
IHRha2VzIHRoZSBudW1iZXIgb2YgYml0cyBpbiB0aGUgYml0bWFwLCB3aGljaCB3b3VsZCBiZSAK
Im1heF9mbGFnX3ZhbHVlICsgMSIuCgpyZWdhcmRzLAoJby4KCj4gVGhhdCB3aWxsIGJlIGJldHRl
ciwgbGV0IG1lIHJldmlzZSB0aGlzIHBhdGNoLgo+IAo+IFRoYW5rcywKPiAKPiA+IAo+ID4gdGhh
bmsgeW91IGFuZCByZWdhcmRzLAo+ID4gCW8uCj4gPiAKPiA+ID4gKwkJaWYgKCF0ZXN0X2JpdChm
bGFnLCAmRjJGU19JKGlub2RlKS0+ZmxhZ3MpKQo+ID4gPiArCQkJc2V0X2JpdChmbGFnLCAmRjJG
U19JKGlub2RlKS0+ZmxhZ3MpOwo+ID4gPiArCX0gZWxzZSB7Cj4gPiA+ICsJCWlmICghdGVzdF9i
aXQoZmxhZyAtIDMyLCAmRjJGU19JKGlub2RlKS0+ZXh0cmFfZmxhZ3MpKQo+ID4gPiArCQkJc2V0
X2JpdChmbGFnIC0gMzIsICZGMkZTX0koaW5vZGUpLT5leHRyYV9mbGFncyk7Cj4gPiA+ICsJfQo+
ID4gPiAgCV9fbWFya19pbm9kZV9kaXJ0eV9mbGFnKGlub2RlLCBmbGFnLCB0cnVlKTsKPiA+ID4g
IH0KPiA+ID4gCj4gPiA+ICBzdGF0aWMgaW5saW5lIGludCBpc19pbm9kZV9mbGFnX3NldChzdHJ1
Y3QgaW5vZGUgKmlub2RlLCBpbnQgZmxhZykKPiA+ID4gIHsKPiA+ID4gLQlyZXR1cm4gdGVzdF9i
aXQoZmxhZywgJkYyRlNfSShpbm9kZSktPmZsYWdzKTsKPiA+ID4gKwlpZiAoKDEgPDwgZmxhZykg
PD0gc2l6ZW9mKHVuc2lnbmVkIGxvbmcpKQo+ID4gPiArCQlyZXR1cm4gdGVzdF9iaXQoZmxhZywg
JkYyRlNfSShpbm9kZSktPmZsYWdzKTsKPiA+ID4gKwllbHNlCj4gPiA+ICsJCXJldHVybiB0ZXN0
X2JpdChmbGFnIC0gMzIsICZGMkZTX0koaW5vZGUpLT5leHRyYV9mbGFncyk7Cj4gPiA+ICB9Cj4g
PiA+IAo+ID4gPiAgc3RhdGljIGlubGluZSB2b2lkIGNsZWFyX2lub2RlX2ZsYWcoc3RydWN0IGlu
b2RlICppbm9kZSwgaW50IGZsYWcpCj4gPiA+ICB7Cj4gPiA+IC0JaWYgKHRlc3RfYml0KGZsYWcs
ICZGMkZTX0koaW5vZGUpLT5mbGFncykpCj4gPiA+IC0JCWNsZWFyX2JpdChmbGFnLCAmRjJGU19J
KGlub2RlKS0+ZmxhZ3MpOwo+ID4gPiArCWlmICgoMSA8PCBmbGFnKSA8PSBzaXplb2YodW5zaWdu
ZWQgbG9uZykpIHsKPiA+ID4gKwkJaWYgKHRlc3RfYml0KGZsYWcsICZGMkZTX0koaW5vZGUpLT5m
bGFncykpCj4gPiA+ICsJCQljbGVhcl9iaXQoZmxhZywgJkYyRlNfSShpbm9kZSktPmZsYWdzKTsK
PiA+ID4gKwl9IGVsc2Ugewo+ID4gPiArCQlpZiAodGVzdF9iaXQoZmxhZyAtIDMyLCAmRjJGU19J
KGlub2RlKS0+ZXh0cmFfZmxhZ3MpKQo+ID4gPiArCQkJY2xlYXJfYml0KGZsYWcgLSAzMiwgJkYy
RlNfSShpbm9kZSktPmV4dHJhX2ZsYWdzKTsKPiA+ID4gKwl9Cj4gPiA+ICAJX19tYXJrX2lub2Rl
X2RpcnR5X2ZsYWcoaW5vZGUsIGZsYWcsIGZhbHNlKTsKPiA+ID4gIH0KPiA+ID4gCj4gPiA+IGRp
ZmYgLS1naXQgYS9mcy9mMmZzL2lub2RlLmMgYi9mcy9mMmZzL2lub2RlLmMKPiA+ID4gaW5kZXgg
NDRlMDhiZjJlMmI0Li5jYTkyNGQ3ZTBlMzAgMTAwNjQ0Cj4gPiA+IC0tLSBhL2ZzL2YyZnMvaW5v
ZGUuYwo+ID4gPiArKysgYi9mcy9mMmZzL2lub2RlLmMKPiA+ID4gQEAgLTM2Myw2ICszNjMsNyBA
QCBzdGF0aWMgaW50IGRvX3JlYWRfaW5vZGUoc3RydWN0IGlub2RlICppbm9kZSkKPiA+ID4gIAlp
ZiAoU19JU1JFRyhpbm9kZS0+aV9tb2RlKSkKPiA+ID4gIAkJZmktPmlfZmxhZ3MgJj0gfkYyRlNf
UFJPSklOSEVSSVRfRkw7Cj4gPiA+ICAJZmktPmZsYWdzID0gMDsKPiA+ID4gKwlmaS0+ZXh0cmFf
ZmxhZ3MgPSAwOwo+ID4gPiAgCWZpLT5pX2FkdmlzZSA9IHJpLT5pX2FkdmlzZTsKPiA+ID4gIAlm
aS0+aV9waW5vID0gbGUzMl90b19jcHUocmktPmlfcGlubyk7Cj4gPiA+ICAJZmktPmlfZGlyX2xl
dmVsID0gcmktPmlfZGlyX2xldmVsOwo+ID4gPiAtLQo+ID4gPiAyLjIyLjAKPiA+ID4gCgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=
