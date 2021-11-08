Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 397AE4481CF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Nov 2021 15:30:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mk5fU-0008QX-DW; Mon, 08 Nov 2021 14:30:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1mk5fO-0008QM-5a
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Nov 2021 14:30:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G9c6icg0rCHqREM3gCLVHmH4Stdwd6DdC2gLHnr0esI=; b=MrsPCTp1kqwrvZWAq3RNO8IuMC
 70nAdQD6wasvcENnMt5qtuxFRke+26vAHsBbWwPQz76YyRqQKc3v5FfNC++42IqAKLkGq8Cc2pfNg
 cBFnBYzPk07BNbCzIzs17JV1spQmMe0HvQZeX5UAZq+baTrd73sQCXud6nvW6qox8cRQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G9c6icg0rCHqREM3gCLVHmH4Stdwd6DdC2gLHnr0esI=; b=TLjNts5O/YcTJKg8ytq7EeAhDL
 rGYV7iREaALu9rIrdCNonbB7dS6xlCvcz3kM140Jn3p+USW44XAqpfxoAUgDZ3dGlWw0/ErD9ENev
 CxfbgXrESHDAEsRFdE/YjwE4VdS+TVDzO1oWM6pncR3ZXaS1DF/kf0ek8WxZRXEh0htA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mk5fN-0001HC-Dm
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 08 Nov 2021 14:30:34 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0850C610E9;
 Mon,  8 Nov 2021 14:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636381827;
 bh=teSXmvT55Yru85Ve3wsi5RT8pweJUXPYK8qaNRYt0PY=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=M1STzeGVSB2LGrrkopscw6XEFpweF8vWOzHehtruvkuQgF8/zAhsnryYBP2fz6B6z
 ZgLO1EHD6wE5l69vlQGI4DZM+NlfQBtmB4MXZRq/DssXiNGrVyNBp6vd1yzWxFs0OP
 LdXDBbspMxIXS28i3eQWLk0NnwHzUEokCdPvoA46OsoQex2Clhqh/RxObeIE1FKRCB
 Xwd3rl5abhMq7zICvbKhQ1zlLedjyuD1vKiKHXM1CwlbTQOoy71xtIy00jM0zWnNpa
 Ta7NE2laJU5WKqDA1ayZay8fV/MTUzX6AQB2gEGFEXKnZAExllmi1LLY29lM4iNgZs
 mA6Ad3Txrp8ag==
Message-ID: <dcfc96ba-6654-4da2-3421-4c59c9bb9432@kernel.org>
Date: Mon, 8 Nov 2021 22:30:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Content-Language: en-US
To: =?UTF-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20211108035459.40139-1-changfengnan@vivo.com>
 <KL1PR0601MB4003615E989DEFDE86793B58BB919@KL1PR0601MB4003.apcprd06.prod.outlook.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <KL1PR0601MB4003615E989DEFDE86793B58BB919@KL1PR0601MB4003.apcprd06.prod.outlook.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2021/11/8 16:56, 常凤楠 wrote: > Anyway, I did some
   modify to verify my idea, and did some test, not found problem for now. Could
    you please consider: 1. pin file 2. fallocate file w/ filesize keeped - it
    will preallocate physical blocks aligned to segments 3. unpin file 4. overwrite
    compressed file 
 
 Content analysis details:   (-7.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [198.145.29.99 listed in list.dnswl.org]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mk5fN-0001HC-Dm
Subject: Re: [f2fs-dev] Do we need serial io for compress file?
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
Cc: "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMS8xMS84IDE2OjU2LCDluLjlh6TmpaAgd3JvdGU6Cj4gQW55d2F5LCBJIGRpZCBzb21l
IG1vZGlmeSB0byB2ZXJpZnkgbXkgaWRlYSwgYW5kIGRpZCBzb21lIHRlc3QsIG5vdCBmb3VuZCBw
cm9ibGVtIGZvciBub3cuCgpDb3VsZCB5b3UgcGxlYXNlIGNvbnNpZGVyOgoxLiBwaW4gZmlsZQoy
LiBmYWxsb2NhdGUgZmlsZSB3LyBmaWxlc2l6ZSBrZWVwZWQKICAtIGl0IHdpbGwgcHJlYWxsb2Nh
dGUgcGh5c2ljYWwgYmxvY2tzIGFsaWduZWQgdG8gc2VnbWVudHMKMy4gdW5waW4gZmlsZQo0LiBv
dmVyd3JpdGUgY29tcHJlc3NlZCBmaWxlCgpUaGFua3MsCgo+IAo+IFRoZSBtb2RpZnkgYXMgZm9s
bG93czoKPiAKPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYwo+
IGluZGV4IGY0ZmQ2YzI0NmM5YS4uMGVkNjc3ZWZlODIwIDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMv
ZGF0YS5jCj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPiBAQCAtMzE2NSw4ICszMTY1LDYgQEAgc3Rh
dGljIGlubGluZSBib29sIF9fc2hvdWxkX3NlcmlhbGl6ZV9pbyhzdHJ1Y3QgaW5vZGUgKmlub2Rl
LAo+ICAgCWlmIChJU19OT1FVT1RBKGlub2RlKSkKPiAgIAkJcmV0dXJuIGZhbHNlOwo+ICAgCj4g
LQlpZiAoZjJmc19uZWVkX2NvbXByZXNzX2RhdGEoaW5vZGUpKQo+IC0JCXJldHVybiB0cnVlOwo+
ICAgCWlmICh3YmMtPnN5bmNfbW9kZSAhPSBXQl9TWU5DX0FMTCkKPiAgIAkJcmV0dXJuIHRydWU7
Cj4gICAJaWYgKGdldF9kaXJ0eV9wYWdlcyhpbm9kZSkgPj0gU01fSShGMkZTX0lfU0IoaW5vZGUp
KS0+bWluX3NlcV9ibG9ja3MpCj4gQEAgLTMyMTgsMTEgKzMyMTYsMTYgQEAgc3RhdGljIGludCBf
X2YyZnNfd3JpdGVfZGF0YV9wYWdlcyhzdHJ1Y3QgYWRkcmVzc19zcGFjZSAqbWFwcGluZywKPiAg
IAkJbXV0ZXhfbG9jaygmc2JpLT53cml0ZXBhZ2VzKTsKPiAgIAkJbG9ja2VkID0gdHJ1ZTsKPiAg
IAl9Cj4gKwlpZiAoZjJmc19uZWVkX2NvbXByZXNzX2RhdGEoaW5vZGUpKQo+ICsJCW11dGV4X2xv
Y2soJihGMkZTX0koaW5vZGUpLT5jb21wcmVzc19sb2NrKSk7Cj4gICAKPiAgIAlibGtfc3RhcnRf
cGx1ZygmcGx1Zyk7Cj4gICAJcmV0ID0gZjJmc193cml0ZV9jYWNoZV9wYWdlcyhtYXBwaW5nLCB3
YmMsIGlvX3R5cGUpOwo+ICAgCWJsa19maW5pc2hfcGx1ZygmcGx1Zyk7Cj4gICAKPiArCWlmIChm
MmZzX25lZWRfY29tcHJlc3NfZGF0YShpbm9kZSkpCj4gKwkJbXV0ZXhfdW5sb2NrKCYoRjJGU19J
KGlub2RlKS0+Y29tcHJlc3NfbG9jaykpOwo+ICsKPiAgIAlpZiAobG9ja2VkKQo+ICAgCQltdXRl
eF91bmxvY2soJnNiaS0+d3JpdGVwYWdlcyk7Cj4gICAKPiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9m
MmZzLmggYi9mcy9mMmZzL2YyZnMuaAo+IGluZGV4IDAzOWEyMjllMTFjOS4uM2E2NTg3ZjEzZDJm
IDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMvZjJmcy5oCj4gKysrIGIvZnMvZjJmcy9mMmZzLmgKPiBA
QCAtNzYzLDYgKzc2Myw3IEBAIHN0cnVjdCBmMmZzX2lub2RlX2luZm8gewo+ICAgCXN0cnVjdCBs
aXN0X2hlYWQgaW5tZW1fcGFnZXM7CS8qIGlubWVtb3J5IHBhZ2VzIG1hbmFnZWQgYnkgZjJmcyAq
Lwo+ICAgCXN0cnVjdCB0YXNrX3N0cnVjdCAqaW5tZW1fdGFzazsJLyogc3RvcmUgaW5tZW1vcnkg
dGFzayAqLwo+ICAgCXN0cnVjdCBtdXRleCBpbm1lbV9sb2NrOwkvKiBsb2NrIGZvciBpbm1lbW9y
eSBwYWdlcyAqLwo+ICsJc3RydWN0IG11dGV4IGNvbXByZXNzX2xvY2s7CS8qIGxvY2sgZm9yIGNv
bXByZXNzIGZpbGUgKi8KPiAgIAlzdHJ1Y3QgZXh0ZW50X3RyZWUgKmV4dGVudF90cmVlOwkvKiBj
YWNoZWQgZXh0ZW50X3RyZWUgZW50cnkgKi8KPiAgIAo+ICAgCS8qIGF2b2lkIHJhY2luZyBiZXR3
ZWVuIGZvcmVncm91bmQgb3AgYW5kIGdjICovCj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3VwZXIu
YyBiL2ZzL2YyZnMvc3VwZXIuYwo+IGluZGV4IGExMzM5MzIzMzNjNS4uODU2NmU5YzM0NTQwIDEw
MDY0NAo+IC0tLSBhL2ZzL2YyZnMvc3VwZXIuYwo+ICsrKyBiL2ZzL2YyZnMvc3VwZXIuYwo+IEBA
IC0xMzIzLDYgKzEzMjMsNyBAQCBzdGF0aWMgc3RydWN0IGlub2RlICpmMmZzX2FsbG9jX2lub2Rl
KHN0cnVjdCBzdXBlcl9ibG9jayAqc2IpCj4gICAJSU5JVF9MSVNUX0hFQUQoJmZpLT5pbm1lbV9p
bGlzdCk7Cj4gICAJSU5JVF9MSVNUX0hFQUQoJmZpLT5pbm1lbV9wYWdlcyk7Cj4gICAJbXV0ZXhf
aW5pdCgmZmktPmlubWVtX2xvY2spOwo+ICsJbXV0ZXhfaW5pdCgmZmktPmNvbXByZXNzX2xvY2sp
Owo+ICAgCWluaXRfcndzZW0oJmZpLT5pX2djX3J3c2VtW1JFQURdKTsKPiAgIAlpbml0X3J3c2Vt
KCZmaS0+aV9nY19yd3NlbVtXUklURV0pOwo+ICAgCWluaXRfcndzZW0oJmZpLT5pX3hhdHRyX3Nl
bSk7Cj4gLS0KPiAKPj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4gRnJvbTog5bi45Yek
5qWgCj4+IFNlbnQ6IE1vbmRheSwgTm92ZW1iZXIgOCwgMjAyMSAxMTo1NSBBTQo+PiBUbzogamFl
Z2V1a0BrZXJuZWwub3JnOyBjaGFvQGtlcm5lbC5vcmcKPj4gQ2M6IGxpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cj4+IFN1YmplY3Q6IERvIHdlIG5lZWQgc2VyaWFsIGlvIGZv
ciBjb21wcmVzcyBmaWxlPwo+Pgo+PiBJbiBteSB0ZXN0LCBzZXJpYWwgaW8gZm9yIGNvbXByZXNz
IGZpbGUgd2lsbCBtYWtlIG11bHRpdGhyZWFkIHNtYWxsIHdyaXRlCj4+IHBlcmZvcm1hbmNlIGRy
b3AgYSBsb3QuCj4+Cj4+IEknbSB0cnkgdG8gZmluZ3VyZSBvdXQgd2h5IHdlIG5lZWQgX19zaG91
bGRfc2VyaWFsaXplX2lvLCBJTU8sIHdlIHVzZQo+PiBfX3Nob3VsZF9zZXJpYWxpemVfaW8gdG8g
YXZvaWQgZGVhZGxvY2sgb3IgdHJ5IHRvIGltcHJvdmUgc2VxdWVudGlhbAo+PiBwZXJmb3JtYW5j
ZSwgYnV0IEkgZG9uJ3QgdW5kZXJzdGFuZCB3aHkgd2Ugc2hvdWxkIGRvIHRoaXMgZm9yIGNvbXBy
ZXNzZWQKPj4gZmlsZS4gSW4gbXkgdGVzdCwgaWYgd2UganVzdCByZW1vdmUgdGhpcywgd3JpdGUg
c2FtZSBmaWxlIGluIG11bHRpdGhyZWFkIHdpbGwgaGF2ZQo+PiBwcm9ibGVtLCBidXQgcGFyYWxs
ZWwgd3JpdGUgZGlmZmVyZW50IGZpbGVzIGluIG11bHRpdGhyZWFkIGlzIG9rLiBTbyBJIHRoaW5r
Cj4+IG1heWJlIHdlIHNob3VsZCB1c2UgYW5vdGhlciBsb2NrIHRvIGFsbG93IHdyaXRlIGRpZmZl
cmVudCBmaWxlcyBpbgo+PiBtdWx0aXRocmVhZC4KCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51
eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZv
cmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
