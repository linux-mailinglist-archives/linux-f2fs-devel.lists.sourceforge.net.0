Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAF51A3CE1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Apr 2020 01:33:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jMgfc-00075z-JF; Thu, 09 Apr 2020 23:33:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <kilobyte@angband.pl>) id 1jMgfZ-00075q-Lw
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Apr 2020 23:33:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i0uShhVoG7vyD8y8J0ePLbFJ2sLMhfnf1yODXJ51vQE=; b=GsGHERB1EUf3I+9/07h01Q3A9A
 XZwjh0ij+A1FuzbtY01/zbwTyfKKtMZSH89PPtp15nxZaLLHq2KVf+8jgTC3uCTOPocbpRkhO+3cR
 HL1PQE1GUOri+bV7TETN2FGjdwAw8ZNCIvM2q9aIp9eh2MNZyKtCOhRuPeT8KN9Ls3oU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i0uShhVoG7vyD8y8J0ePLbFJ2sLMhfnf1yODXJ51vQE=; b=JLRMAjpPZ/8ptXHuRA8VyPxrSG
 lN6Vj6IOnqpX1soLPN8o4+V8jeFcwS0KHdsNO+n0MFU+va5IJKOWfzBpFdztLjVEGzKG4DxaJD1TU
 QUKb/WLdstUepyT5iL8iLW41Nn64SXPq0recbxou01idLblmWXGiFwFJcDpBBrnRAAcc=;
Received: from tartarus.angband.pl ([54.37.238.230])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jMgfU-00A91z-PM
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Apr 2020 23:33:13 +0000
Received: from kilobyte by tartarus.angband.pl with local (Exim 4.92)
 (envelope-from <kilobyte@angband.pl>)
 id 1jMgfH-0003yc-1F; Fri, 10 Apr 2020 01:32:55 +0200
Date: Fri, 10 Apr 2020 01:32:55 +0200
From: Adam Borowski <kilobyte@angband.pl>
To: Chao Yu <yuchao0@huawei.com>
Message-ID: <20200409233255.GA14286@angband.pl>
References: <158582888648.9053.2167684001695943018.reportbug@umbar.angband.pl>
 <20200402191658.GR768293@mit.edu>
 <20200403024535.GA23417@angband.pl>
 <58dd64a1-4f2b-3201-6cb7-215b420f804b@huawei.com>
 <45149351-4c07-ba55-dec3-9a0872bb159f@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <45149351-4c07-ba55-dec3-9a0872bb159f@huawei.com>
X-Junkbait: aaron@angband.pl, zzyx@angband.pl
User-Agent: Mutt/1.10.1 (2018-07-13)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: kilobyte@angband.pl
X-SA-Exim-Scanned: No (on tartarus.angband.pl); SAEximRunCond expanded to false
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1jMgfU-00A91z-PM
Subject: Re: [f2fs-dev] Bug#955549: f2fs-tools: fsck.f2fs segfaults
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
Cc: 955549@bugs.debian.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVHVlLCBBcHIgMDcsIDIwMjAgYXQgMDY6MjI6MTlQTSArMDgwMCwgQ2hhbyBZdSB3cm90ZToK
PiBJIGZpZ3VyZWQgb3V0IHR3byBwYXRjaGVzIHRvIGZpeCBzZWdmYXVsdCBpc3N1ZXMsIGNvdWxk
IHlvdSBwbGVhc2UgaGF2ZQo+IGEgdHJ5Ogo+IAo+IAlmc2NrLmYyZnM6IGZpeCB0byBjaGVjayB2
YWxpZGF0aW9uIG9mIGlfeGF0dHJfbmlkCj4gCWZzY2suZjJmczogZml4IHRvIGNoZWNrIHZhbGlk
YXRpb24gb2YgYmxvY2sgYWRkcmVzcwo+IAo+IEluIGFkZGl0aW9uLCBJIGZvdW5kIHRoYXQgZnNj
ayBtYWluIGZsb3cgZmFpbGVkIGJlY2F1c2UgaXQgY2FuIG5vdCBsb2FkIHJvb3QKPiBpbm9kZSBi
YXNlZCBvbiB3cm9uZyBibG9jayBhZGRyZXNzIGluIG5hdCwgc28gSSB3cm90ZSBhbm90aGVyIHBh
dGNoIHRvIGVuYWJsZQo+IGZzY2sgdG8gbG9va3VwIHJvb3QgaW5vZGUgYnkgdHJhdmVyc2luZyBh
bGwgbm9kZXMgaW4gZjJmcyBtYWluIGFyZWEsIGFuZCByZWxpbmsKPiBuYXQgdG8gcm9vdCBpbm9k
ZSBjb3JyZWN0bHkuCj4gCj4gCWZzY2suZjJmczogbG9va3VwIGFuZCByZWxpbmsgcm9vdCBpbm9k
ZQoKSSBzdGlsbCBnZXQgYSBzZWdmYXVsdDoKClByb2dyYW0gcmVjZWl2ZWQgc2lnbmFsIFNJR1NF
R1YsIFNlZ21lbnRhdGlvbiBmYXVsdC4KMHgwMDAwNTU1NTU1NTY0NDQ0IGluIHByaW50X2lub2Rl
X2luZm8gKHNiaT0weDU1NTU1NTU4NGNhMCA8Z2ZzY2s+LCBub2RlPTB4NTU1NTU1NThmMTcwLCBu
YW1lPTxvcHRpbWl6ZWQgb3V0PikgYXQgbW91bnQuYzoyNDAKMjQwCQkJYmxvY2tfdCBibGthZGRy
ID0gbGUzMl90b19jcHUoaW5vZGUtPmlfYWRkcltpICsgb2ZzXSk7CihnZGIpIGJ0CiMwICAweDAw
MDA1NTU1NTU1NjQ0NDQgaW4gcHJpbnRfaW5vZGVfaW5mbyAoc2JpPTB4NTU1NTU1NTg0Y2EwIDxn
ZnNjaz4sIG5vZGU9MHg1NTU1NTU1OGYxNzAsIG5hbWU9PG9wdGltaXplZCBvdXQ+KSBhdCBtb3Vu
dC5jOjI0MAojMSAgMHgwMDAwNTU1NTU1NTY0YzRlIGluIHByaW50X25vZGVfaW5mbyAoc2JpPTxv
cHRpbWl6ZWQgb3V0Piwgbm9kZV9ibG9jaz08b3B0aW1pemVkIG91dD4sIHZlcmJvc2U9PG9wdGlt
aXplZCBvdXQ+KSBhdCBtb3VudC5jOjI3OAojMiAgMHgwMDAwNTU1NTU1NTYzMTdmIGluIGR1bXBf
bm9kZSAoc2JpPXNiaUBlbnRyeT0weDU1NTU1NTU4NGNhMCA8Z2ZzY2s+LCBuaWQ9bmlkQGVudHJ5
PTI4NjEsIGZvcmNlPWZvcmNlQGVudHJ5PTEpIGF0IGR1bXAuYzo1MTEKIzMgIDB4MDAwMDU1NTU1
NTU2MTA2MCBpbiBmc2NrX3ZlcmlmeSAoc2JpPTB4NTU1NTU1NTg0Y2EwIDxnZnNjaz4pIGF0IGZz
Y2suYzozMjU5CiM0ICAweDAwMDA1NTU1NTU1NTc5OWEgaW4gZG9fZnNjayAoc2JpPTB4NTU1NTU1
NTg0Y2EwIDxnZnNjaz4pIGF0IG1haW4uYzo2OTgKIzUgIG1haW4gKGFyZ2M9PG9wdGltaXplZCBv
dXQ+LCBhcmd2PTxvcHRpbWl6ZWQgb3V0PikgYXQgbWFpbi5jOjg2NAoKPiBXaXRoIHRoaXMgcGF0
Y2gsIGltYWdlIGNhbiBiZSBmaXhlZCBhbmQgbW91bnRlZCBsYXRlciwgYWx0aG91Z2gsIG1vc3Qg
b2YgZmlsZXMKPiB3ZXJlIGRlbGV0ZWQgZHVlIHRvIHNlcmlvdXNseSBkYW1hZ2VkIGYyZnMgbWV0
YWRhdGEuLi4uCgpZZWFoLCBJJ3ZlIGxhdGVyIHRlc3RlZCB0aGUgaGFyZHdhcmUgLS0gd3JpdGVz
IHRvIGl0IGFyZSBib3JrZWQsIHNvIG5vCmNvbXBsYWludCBhZ2FpbnN0IHRoZSBmaWxlc3lzdGVt
IGZhaWxpbmcuICBJIGdvdCBiYWNrdXBzLiA6KQoKPiBUaGUgcGF0Y2hlcyB3ZXJlIG1hZGUgb24g
dG9wIG9mIGRldi10ZXN0IGJyYW5jaCBvZiBKYWVnZXVrJ3MgdHJlZToKPiBodHRwczovL2dpdC5r
ZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9qYWVnZXVrL2YyZnMtdG9vbHMuZ2l0
L2xvZy8/aD1kZXYtdGVzdAoKPiA+Pj4+ICMwICAweDAwMDA1NTU1NTU1NTkzZWMgaW4gbWVtY3B5
IChfX2xlbj0xODQ0Njc0NDA3MzMyMzg5MjczNiwgX19zcmM9MHg1NTU1NTU2MDc2MGMsIF9fZGVz
dD0weDdmZmZmZmZmZTAwMCkgYXQgL3Vzci9pbmNsdWRlL3g4Nl82NC1saW51eC1nbnUvYml0cy9z
dHJpbmdfZm9ydGlmaWVkLmg6MzQKPiA+IAo+ID4gQXQgYSBnbGFuY2UsIGltbWVkaWF0ZSByZWFz
b24gb2YgdGhpcyBpc3N1ZSBpcyB3ZSBkaWRuJ3QgY2hlY2sgaW5vZGUuaV9uYW1lbGVuJ3MKPiA+
IHZhbGlkYXRpb24uCj4gPiAKPiA+Pj4+ICMxICBjb252ZXJ0X2VuY3J5cHRlZF9uYW1lIChuYW1l
PW5hbWVAZW50cnk9MHg1NTU1NTU2MDc2MGMgIiAiLCBsZW49LTM4NTY1ODg4MCwgbmV3PW5ld0Bl
bnRyeT0weDdmZmZmZmZmZTAwMCAiICIsIGVuY19uYW1lPTxvcHRpbWl6ZWQgb3V0PikgYXQgZnNj
ay5jOjExMzIKPiA+Pj4+ICMyICAweDAwMDA1NTU1NTU1NjIyODYgaW4gcHJpbnRfaW5vZGVfaW5m
byAoc2JpPTB4NTU1NTU1NTdkYjIwIDxnZnNjaz4sIG5vZGU9MHg1NTU1NTU2MDc1YjAsIG5hbWU9
MSkgYXQgbW91bnQuYzoxODMKPiA+Pj4+ICMzICAweDAwMDA1NTU1NTU1NjJhNDYgaW4gcHJpbnRf
bm9kZV9pbmZvIChzYmk9PG9wdGltaXplZCBvdXQ+LCBub2RlX2Jsb2NrPTxvcHRpbWl6ZWQgb3V0
PiwgdmVyYm9zZT08b3B0aW1pemVkIG91dD4pIGF0IG1vdW50LmM6Mjc3Cj4gPj4+PiAjNCAgMHgw
MDAwNTU1NTU1NTYwZDNmIGluIGR1bXBfbm9kZSAoc2JpPXNiaUBlbnRyeT0weDU1NTU1NTU3ZGIy
MCA8Z2ZzY2s+LCBuaWQ9bmlkQGVudHJ5PTI0Mjc0LCBmb3JjZT1mb3JjZUBlbnRyeT0xKSBhdCBk
dW1wLmM6NTIwCj4gPj4+PiAjNSAgMHgwMDAwNTU1NTU1NTVlOTRjIGluIGZzY2tfdmVyaWZ5IChz
Ymk9MHg1NTU1NTU1N2RiMjAgPGdmc2NrPikgYXQgZnNjay5jOjI1NjgKPiA+Pj4+ICM2ICAweDAw
MDA1NTU1NTU1NTY5OWIgaW4gZG9fZnNjayAoc2JpPTB4NTU1NTU1NTdkYjIwIDxnZnNjaz4pIGF0
IG1haW4uYzo1NjkKCgpNZW93IQotLSAK4qKA4qO04qC+4qC74qK24qOm4qCACuKjvuKggeKioOKg
kuKggOKjv+KhgSBpbiB0aGUgYmVnaW5uaW5nIHdhcyB0aGUgYm9vdCBhbmQgcm9vdCBmbG9wcGll
cyBhbmQgdGhleSB3ZXJlIGdvb2QuCuKiv+KhhOKgmOKgt+KgmuKgi+KggCAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC0tIDx3aWxsbW9yZT4gb24gI2xpbnV4LXN1bnhpCuKg
iOKgs+KjhOKggOKggOKggOKggAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
