Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3F314108D7
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 Sep 2021 00:34:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mRiug-0006OI-61; Sat, 18 Sep 2021 22:34:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mRiue-0006O5-JX
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 18 Sep 2021 22:34:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mnab0fFExSbPdlLNmSKJdevEiud+Spg2PSpXzU/p+gA=; b=Ueb4vVo76bIvICmBve79hBqey5
 qZX/y84E+iZ/0irNuyMYMu+pGDY+3EPe2KFJKY2WTPyGs+sGDXhVwTktk6UMwu+PS0GlrByvY+kTd
 f7LIwGWpTp1eBK2PX6ObriPHA7gFYqp29pRSvB97+sy7cJ0xZCsByLZHMmQ7BVnG5stE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mnab0fFExSbPdlLNmSKJdevEiud+Spg2PSpXzU/p+gA=; b=HjvqqGVquKYpDgSTIrDDe3jV7g
 npeXznJNv6i9T/kU1suoQP4GadxVJXHxFXVzCC9/Rzh08oMfa2Ug4886kqXp8+Xwo9r9SIR45dqE1
 LeQs+U5FpHp40ZokGEmNLW9jY5SMi5lL+282NC3cH6xih61MhWyDymFrTLZe9mnElN+E=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mRiuY-00FDP6-H4
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 18 Sep 2021 22:34:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6F22460F6B;
 Sat, 18 Sep 2021 22:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1632004449;
 bh=bi67kEn/JDLZSOHCCfY0hbASgTOdL9cdzUUnRRvt8RA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=CKGJkLTHUdAQEBCP5/H4FaQwRYKdjdUZpRwWiXL3BwyBeXYpp3cX8YgLnqEilQYAP
 4I5cpjczCrqs/ZPlpcEnAnUMiUhyJdw6x2DScdVMmmxhVPwr9C9cM6WnT5CTfRFzLN
 6QhuSTPbH+KwIfoLdw8FUIHV1Rf2cuOxNNTlRFr3FILdCZDRdxRr/xDeywa+CR8vEy
 FMg/SSd6+ySw2gHrZ43CDtFKdvqK/RH61wdQufWTcyaqX2StzPd8AwFtNwZWWGs2Zr
 HZO4247PvLI5VmUllMWWC9G8KTb88Z2kz5C3KJEbVkpny6Le6FN53UDOnZR04+oaVv
 5//XHh3kF+jsQ==
To: =?UTF-8?B?5bi45Yek5qWg?= <changfengnan@vivo.com>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>
References: <20210916113026.378385-1-changfengnan@vivo.com>
 <20210916113026.378385-2-changfengnan@vivo.com>
 <AFQA*QDoEjqpHYJlWwMYT4qj.9.1631794201010.Hmail.changfengnan@vivo.com>
 <KL1PR0601MB400388BC823D5FD0558D43D2BBDC9@KL1PR0601MB4003.apcprd06.prod.outlook.com>
 <KL1PR0601MB40030D121F65550D690A776DBBDD9@KL1PR0601MB4003.apcprd06.prod.outlook.com>
 <ANgA6QClEsWrpLTMx5-VNqof.9.1631883577159.Hmail.changfengnan@vivo.com>
 <KL1PR0601MB40034B2A46C36B59B713B3E7BBDE9@KL1PR0601MB4003.apcprd06.prod.outlook.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <e78294a2-951c-7a6b-b471-5afe1437edaf@kernel.org>
Date: Sun, 19 Sep 2021 06:34:08 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <KL1PR0601MB40034B2A46C36B59B713B3E7BBDE9@KL1PR0601MB4003.apcprd06.prod.outlook.com>
Content-Language: en-US
X-Spam-Score: -8.1 (--------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2021/9/18 14:46, 常凤楠 wrote: > > >> 
 
 Content analysis details:   (-8.1 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [198.145.29.99 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -2.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mRiuY-00FDP6-H4
Subject: Re: [f2fs-dev] [PATCH v2 2/2] f2fs: fix missing inplace count in
 overwrite with direct io
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

T24gMjAyMS85LzE4IDE0OjQ2LCDluLjlh6TmpaAgd3JvdGU6Cj4gCj4gCj4+IC0tLS0tT3JpZ2lu
YWwgTWVzc2FnZS0tLS0tCj4+IEZyb206IGNoYW5nZmVuZ25hbkB2aXZvLmNvbSA8Y2hhbmdmZW5n
bmFuQHZpdm8uY29tPiBPbiBCZWhhbGYgT2YKPj4gQ2hhbyBZdQo+PiBTZW50OiBGcmlkYXksIFNl
cHRlbWJlciAxNywgMjAyMSA5OjAwIFBNCj4+IFRvOiDluLjlh6TmpaAgPGNoYW5nZmVuZ25hbkB2
aXZvLmNvbT47IGphZWdldWtAa2VybmVsLm9yZwo+PiBDYzogbGludXgtZjJmcy1kZXZlbEBsaXN0
cy5zb3VyY2Vmb3JnZS5uZXQKPj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAyLzJdIGYyZnM6IGZp
eCBtaXNzaW5nIGlucGxhY2UgY291bnQgaW4gb3ZlcndyaXRlIHdpdGgKPj4gZGlyZWN0IGlvCj4+
Cj4+IE9uIDIwMjEvOS8xNyAxODoxOSwg5bi45Yek5qWgIHdyb3RlOgo+Pj4KPj4+Cj4+Pj4gLS0t
LS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0KPj4+PiBGcm9tOiDluLjlh6TmpaAKPj4+PiBTZW50OiBU
aHVyc2RheSwgU2VwdGVtYmVyIDE2LCAyMDIxIDg6NDYgUE0KPj4+PiBUbzogQ2hhbyBZdSA8Y2hh
b0BrZXJuZWwub3JnPjsgamFlZ2V1a0BrZXJuZWwub3JnCj4+Pj4gQ2M6IGxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4+Pj4gU3ViamVjdDogUkU6IFtQQVRDSCB2MiAyLzJd
IGYyZnM6IGZpeCBtaXNzaW5nIGlucGxhY2UgY291bnQgaW4KPj4+PiBvdmVyd3JpdGUgd2l0aCBk
aXJlY3QgaW8KPj4+Pgo+Pj4+Cj4+Pj4KPj4+Pj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0K
Pj4+Pj4gRnJvbTogY2hhbmdmZW5nbmFuQHZpdm8uY29tIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+
IE9uIEJlaGFsZiBPZgo+Pj4+IENoYW8KPj4+Pj4gWXUKPj4+Pj4gU2VudDogVGh1cnNkYXksIFNl
cHRlbWJlciAxNiwgMjAyMSA4OjEwIFBNCj4+Pj4+IFRvOiDluLjlh6TmpaAgPGNoYW5nZmVuZ25h
bkB2aXZvLmNvbT47IGphZWdldWtAa2VybmVsLm9yZwo+Pj4+PiBDYzogbGludXgtZjJmcy1kZXZl
bEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4+Pj4gU3ViamVjdDogUmU6IFtQQVRDSCB2MiAyLzJd
IGYyZnM6IGZpeCBtaXNzaW5nIGlucGxhY2UgY291bnQgaW4KPj4+Pj4gb3ZlcndyaXRlIHdpdGgg
ZGlyZWN0IGlvCj4+Pj4+Cj4+Pj4+IE9uIDIwMjEvOS8xNiAxOTozMCwgRmVuZ25hbiBDaGFuZyB3
cm90ZToKPj4+Pj4+IEZvciBub3csIG92ZXJ3cml0ZSBmaWxlIHdpdGggZGlyZWN0IGlvIHVzZSBp
bnBsYWNlIHBvbGljeSwgYnV0IG5vdAo+Pj4+Pj4gY291bnRlZCwgZml4IGl0LiBBbmQgdXNlIHN0
YXRfYWRkX2lucGxhY2VfYmxvY2tzKHNiaSwgMSwgKSBpbnN0ZWFkCj4+Pj4+PiBvZiBzdGF0X2lu
Y19pbnBsYWNlX2Jsb2NrcyhzYiwgKS4KPj4+Pj4+Cj4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBGZW5n
bmFuIENoYW5nIDxjaGFuZ2ZlbmduYW5Adml2by5jb20+Cj4+Pj4+PiAtLS0KPj4+Pj4+ICAgICBm
cy9mMmZzL2RhdGEuYyAgICB8IDcgKysrKysrLQo+Pj4+Pj4gICAgIGZzL2YyZnMvZjJmcy5oICAg
IHwgOCArKysrLS0tLQo+Pj4+Pj4gICAgIGZzL2YyZnMvc2VnbWVudC5jIHwgMiArLQo+Pj4+Pj4g
ICAgIDMgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKPj4+
Pj4+Cj4+Pj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJmcy9kYXRhLmMgYi9mcy9mMmZzL2RhdGEuYyBp
bmRleAo+Pj4+Pj4gYzE0OTBiOWExMzQ1Li4wYzU3MjhkNjNjMzMgMTAwNjQ0Cj4+Pj4+PiAtLS0g
YS9mcy9mMmZzL2RhdGEuYwo+Pj4+Pj4gKysrIGIvZnMvZjJmcy9kYXRhLmMKPj4+Pj4+IEBAIC0x
NDkxLDYgKzE0OTEsOSBAQCBpbnQgZjJmc19tYXBfYmxvY2tzKHN0cnVjdCBpbm9kZSAqaW5vZGUs
Cj4+Pj4+PiBzdHJ1Y3QKPj4+Pj4gZjJmc19tYXBfYmxvY2tzICptYXAsCj4+Pj4+PiAgICAgCQlp
ZiAoZmxhZyA9PSBGMkZTX0dFVF9CTE9DS19ESU8pCj4+Pj4+PiAgICAgCQkJZjJmc193YWl0X29u
X2Jsb2NrX3dyaXRlYmFja19yYW5nZShpbm9kZSwKPj4+Pj4+ICAgICAJCQkJCQltYXAtPm1fcGJs
aywgbWFwLT5tX2xlbik7Cj4+Pj4+PiArCQlpZiAoIWYyZnNfbGZzX21vZGUoc2JpKSAmJiBmbGFn
ID09IEYyRlNfR0VUX0JMT0NLX0RJTyAmJgo+Pj4+Pj4gKwkJCQltYXAtPm1fbWF5X2NyZWF0ZSkK
Pj4+Pj4+ICsJCQlzdGF0X2FkZF9pbnBsYWNlX2Jsb2NrcyhzYmksIG1hcC0+bV9sZW4sIHRydWUp
Owo+Pj4+Pj4gICAgIAkJZ290byBvdXQ7Cj4+Pj4+PiAgICAgCX0KPj4+Pj4+Cj4+Pj4+PiBAQCAt
MTU1Myw3ICsxNTU2LDkgQEAgaW50IGYyZnNfbWFwX2Jsb2NrcyhzdHJ1Y3QgaW5vZGUgKmlub2Rl
LAo+Pj4+Pj4gc3RydWN0Cj4+Pj4+IGYyZnNfbWFwX2Jsb2NrcyAqbWFwLAo+Pj4+Pj4gICAgIAkJ
CQlnb3RvIHN5bmNfb3V0Owo+Pj4+Pj4gICAgIAkJCWJsa2FkZHIgPSBkbi5kYXRhX2Jsa2FkZHI7
Cj4+Pj4+PiAgICAgCQkJc2V0X2lub2RlX2ZsYWcoaW5vZGUsIEZJX0FQUEVORF9XUklURSk7Cj4+
Pj4+PiAtCQl9Cj4+Pj4+PiArCQl9IGVsc2UgaWYgKCFjcmVhdGUgJiYgIWYyZnNfbGZzX21vZGUo
c2JpKSAmJiBmbGFnID09Cj4+Pj4+IEYyRlNfR0VUX0JMT0NLX0RJTyAmJgo+Pj4+Pj4gKwkJCQlt
YXAtPm1fbWF5X2NyZWF0ZSkKPj4+Pj4KPj4+Pj4gV2h5IG5vdAo+Pj4+Pgo+Pj4+PiB9IGVsc2Ug
aWYgeyFmMmZzX2xmc19tb2RlKHNiaSkgJiYgZmxhZyA9PSBGMkZTX0dFVF9CTE9DS19ESU8gJiYK
Pj4+Pj4gCQkJCQltYXAtPm1fbWF5X2NyZWF0ZSkKPj4+Pj4KPj4+Pgo+Pj4+IFlvdSBhcmUgcmln
aHQsIG5vIG5lZWQgdG8gY2hlY2sgY3JlYXRlIC4KPj4+Pgo+Pj4gVGhlcmUgaXMgYSBwcm9ibGVt
IGhlcmUsIGlmIHJlbW92ZSBjcmVhdGUgY2hlY2ssIHdoZW4gY3JlYXRlIGZpbGUgYW5kCj4+PiB3
cml0ZSB3aXRoIGRpcmVjdCBpbywgSXQgd2lsbCBjb3VudCBpbiBMRlMgYW5kIElQVSBib3RoLCBi
ZWNhdXNlCj4+PiBwcmVhbGxvY2F0ZSBibG9jayBhZGRyIGZpcnN0LiBTbywgV2Ugc3RpbGwgbmVl
ZCBjaGVjayBjcmVhdGUuCj4+PiBBbSBJIHJpZ2h0Pwo+Pgo+PiBDb3VsZCB5b3UgcGxlYXNlIGNo
ZWNrIGJlbG93IGNhc2Ugdy8geW91ciBvcmlnaW5hbCBwYXRjaDoKPj4KPj4geGZzX2lvIC1mIGZp
bGUgLWMgInB3cml0ZSAwIDhrIiAtYyAiZnN5bmMiCj4+IHhmc19pbyBmaWxlIC1jICJmcHVuY2gg
MCA0ayIKPj4geGZzX2lvICAtYyAib3BlbiAtZCBmaWxlIiAtYyAicHdyaXRlIC1iIDRrIDAgOGsi
Cj4+Cj4+IEl0IGFjY291bnRzIG9uIGJvdGggSVBVIGFuZCBMRlMgc3RhdHMuCj4gCj4gTXkgb3Jp
Z2luIHBhdGNoIGlzIG5lZWQgY2hlY2sgY3JlYXRlOgo+IEBAIC0xNTUzLDcgKzE1NTYsOSBAQCBp
bnQgZjJmc19tYXBfYmxvY2tzKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmMmZzX21hcF9i
bG9ja3MgKm1hcCwKPiAgIAkJCQlnb3RvIHN5bmNfb3V0Owo+ICAgCQkJYmxrYWRkciA9IGRuLmRh
dGFfYmxrYWRkcjsKPiAgIAkJCXNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9BUFBFTkRfV1JJVEUp
Owo+IC0JCX0KPiArCQl9IGVsc2UgaWYgKCFjcmVhdGUgJiYgIWYyZnNfbGZzX21vZGUoc2JpKSAm
JiBmbGFnID09IEYyRlNfR0VUX0JMT0NLX0RJTyAmJgo+ICsJCQkJbWFwLT5tX21heV9jcmVhdGUp
Cj4gKwkJCXN0YXRfYWRkX2lucGxhY2VfYmxvY2tzKHNiaSwgMSwgdHJ1ZSk7Cj4gCj4gQW5kIGJl
bG93IGNhc2UgbG9va3MgY29ycmVjdCwgU28gSSB0aGluayBjaGVjayBjcmVhdGUgaXMgbmVjZXNz
YXJ5Lgo+IAo+IHJvb3RAa3ZtLXhmc3Rlc3RzOi9tbnQvdGVzdCMgY2F0IC9zeXMva2VybmVsL2Rl
YnVnL2YyZnMvc3RhdHVzIHxncmVwIFNTUiAtQyAzCj4gCj4gICAgICAgICAgICAgYnVmZmVyICAg
ICBkaXJlY3QgICBzZWdtZW50cwo+IElQVTogICAgICAgICAgICAwICAgICAgICAgIDAgICAgICAg
IE4vQQo+IFNTUjogICAgICAgICAgICAwICAgICAgICAgIDAgICAgICAgICAgMAo+IExGUzogICAg
ICAgICAgNTQyICAgICAgICAgIDAgICAgICAgICAgMQo+IAo+IEJERjogOTksIGF2Zy4gdmJsb2Nr
czogNDg4Cj4gcm9vdEBrdm0teGZzdGVzdHM6L21udC90ZXN0IyB4ZnNfaW8gLWYgZmlsZSAtYyAi
cHdyaXRlIDAgOGsiIC1jICJmc3luYyIKPiB3cm90ZSA4MTkyLzgxOTIgYnl0ZXMgYXQgb2Zmc2V0
IDAKPiA4IEtpQiwgMiBvcHM7IDAuMDA3OCBzZWMgKDEwMTQuMDcwIEtpQi9zZWMgYW5kIDI1My41
MTc2IG9wcy9zZWMpCj4gcm9vdEBrdm0teGZzdGVzdHM6L21udC90ZXN0IyBjYXQgL3N5cy9rZXJu
ZWwvZGVidWcvZjJmcy9zdGF0dXMgfGdyZXAgU1NSIC1DIDMKPiAKPiAgICAgICAgICAgICBidWZm
ZXIgICAgIGRpcmVjdCAgIHNlZ21lbnRzCj4gSVBVOiAgICAgICAgICAgIDAgICAgICAgICAgMCAg
ICAgICAgTi9BCj4gU1NSOiAgICAgICAgICAgIDAgICAgICAgICAgMCAgICAgICAgICAwCj4gTEZT
OiAgICAgICAgICA1NDUgICAgICAgICAgMCAgICAgICAgICAxCj4gCj4gQkRGOiA5OSwgYXZnLiB2
YmxvY2tzOiA0ODgKPiByb290QGt2bS14ZnN0ZXN0czovbW50L3Rlc3QjIHhmc19pbyBmaWxlIC1j
ICJmcHVuY2ggMCA0ayIKPiByb290QGt2bS14ZnN0ZXN0czovbW50L3Rlc3QjIGNhdCAvc3lzL2tl
cm5lbC9kZWJ1Zy9mMmZzL3N0YXR1cyB8Z3JlcCBTU1IgLUMgMwo+IAo+ICAgICAgICAgICAgIGJ1
ZmZlciAgICAgZGlyZWN0ICAgc2VnbWVudHMKPiBJUFU6ICAgICAgICAgICAgMCAgICAgICAgICAw
ICAgICAgICBOL0EKPiBTU1I6ICAgICAgICAgICAgMCAgICAgICAgICAwICAgICAgICAgIDAKPiBM
RlM6ICAgICAgICAgIDU0NSAgICAgICAgICAwICAgICAgICAgIDEKPiAKPiBCREY6IDk5LCBhdmcu
IHZibG9ja3M6IDQ4OAo+IHJvb3RAa3ZtLXhmc3Rlc3RzOi9tbnQvdGVzdCMgeGZzX2lvICAtYyAi
b3BlbiAtZCBmaWxlIiAtYyAicHdyaXRlIC1iIDRrIDAgOGsiCj4gd3JvdGUgODE5Mi84MTkyIGJ5
dGVzIGF0IG9mZnNldCAwCj4gOCBLaUIsIDIgb3BzOyAwLjAzMjIgc2VjICgyNDguMTg1IEtpQi9z
ZWMgYW5kIDYyLjA0NjMgb3BzL3NlYykKPiByb290QGt2bS14ZnN0ZXN0czovbW50L3Rlc3QjIGNh
dCAvc3lzL2tlcm5lbC9kZWJ1Zy9mMmZzL3N0YXR1cyB8Z3JlcCBTU1IgLUMgMwo+IAo+ICAgICAg
ICAgICAgIGJ1ZmZlciAgICAgZGlyZWN0ICAgc2VnbWVudHMKPiBJUFU6ICAgICAgICAgICAgMCAg
ICAgICAgICAyICAgICAgICBOL0EKPiBTU1I6ICAgICAgICAgICAgMCAgICAgICAgICAwICAgICAg
ICAgIDAKPiBMRlM6ICAgICAgICAgIDU0NSAgICAgICAgICAxICAgICAgICAgIDEKClNob3VsZG4n
dCB0aGlzIGJlIElQVTogMSBhbmQgTEZTOiAxPyBkdWUgdG8gWzAsIDRrXSB3YXMgYSBob2xlLCBh
bmQgWzRrLCA4a10gbWFwcGVkCnRvIGEgdmFsaWQgYmxrYWRkci4KClRoYW5rcywKCj4gCj4gQkRG
OiA5OSwgYXZnLiB2YmxvY2tzOiA0ODgKPiAKPiAKPj4KPj4gVGhhbmtzLAo+Pgo+Pj4KPj4+IFRo
YW5rcy4KPj4+Cj4+Pj4gVGhhbmtzLgo+Pj4+PiBUaGFua3MsCj4+Pj4+Cj4+Pj4+PiArCQkJc3Rh
dF9hZGRfaW5wbGFjZV9ibG9ja3Moc2JpLCAxLCB0cnVlKTsKPj4+Pj4+ICAgICAJfSBlbHNlIHsK
Pj4+Pj4+ICAgICAJCWlmIChjcmVhdGUpIHsKPj4+Pj4+ICAgICAJCQlpZiAodW5saWtlbHkoZjJm
c19jcF9lcnJvcihzYmkpKSkgeyBkaWZmIC0tZ2l0Cj4+Pj4+PiBhL2ZzL2YyZnMvZjJmcy5oIGIv
ZnMvZjJmcy9mMmZzLmggaW5kZXggM2Q0ZWU0NDRkYjI3Li4yZDgxZTlmMGEwZWUKPj4+Pj4+IDEw
MDY0NAo+Pj4+Pj4gLS0tIGEvZnMvZjJmcy9mMmZzLmgKPj4+Pj4+ICsrKyBiL2ZzL2YyZnMvZjJm
cy5oCj4+Pj4+PiBAQCAtMzc4NSwxMiArMzc4NSwxMiBAQCBzdGF0aWMgaW5saW5lIHN0cnVjdCBm
MmZzX3N0YXRfaW5mbwo+Pj4+PiAqRjJGU19TVEFUKHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSkK
Pj4+Pj4+ICAgICAJCWVsc2UJCQkJCQkJCVwKPj4+Pj4+ICAgICAJCQkoKHNiaSktPmJsb2NrX2Nv
dW50WzFdWyhjdXJzZWcpLT5hbGxvY190eXBlXSsrKTsJXAo+Pj4+Pj4gICAgIAl9IHdoaWxlICgw
KQo+Pj4+Pj4gLSNkZWZpbmUgc3RhdF9pbmNfaW5wbGFjZV9ibG9ja3Moc2JpLCBkaXJlY3RfaW8p
CQkJCQlcCj4+Pj4+PiArI2RlZmluZSBzdGF0X2FkZF9pbnBsYWNlX2Jsb2NrcyhzYmksIGNvdW50
LCBkaXJlY3RfaW8pCQkJXAo+Pj4+Pj4gICAgIAlkbyB7CQkJCQkJCQlcCj4+Pj4+PiAgICAgCQlp
ZiAoZGlyZWN0X2lvKQkJCQkJCVwKPj4+Pj4+IC0JCQkoYXRvbWljX2luYygmKHNiaSktPmlucGxh
Y2VfY291bnRbMF0pKTsJCVwKPj4+Pj4+ICsJCQkoYXRvbWljX2FkZChjb3VudCwgJihzYmkpLT5p
bnBsYWNlX2NvdW50WzBdKSk7ICBcCj4+Pj4+PiAgICAgCQllbHNlCQkJCQkJCQlcCj4+Pj4+PiAt
CQkJKGF0b21pY19pbmMoJihzYmkpLT5pbnBsYWNlX2NvdW50WzFdKSk7CQlcCj4+Pj4+PiArCQkJ
KGF0b21pY19hZGQoY291bnQsICYoc2JpKS0+aW5wbGFjZV9jb3VudFsxXSkpOwlcCj4+Pj4+PiAg
ICAgCX0gd2hpbGUgKDApCj4+Pj4+PiAgICAgI2RlZmluZSBzdGF0X3VwZGF0ZV9tYXhfYXRvbWlj
X3dyaXRlKGlub2RlKQkJCQlcCj4+Pj4+PiAgICAgCWRvIHsJCQkJCQkJCVwKPj4+Pj4+IEBAIC0z
ODc3LDcgKzM4NzcsNyBAQCB2b2lkIGYyZnNfdXBkYXRlX3NpdF9pbmZvKHN0cnVjdCBmMmZzX3Ni
X2luZm8KPj4+Pj4gKnNiaSk7Cj4+Pj4+PiAgICAgI2RlZmluZSBzdGF0X2luY19tZXRhX2NvdW50
KHNiaSwgYmxrYWRkcikJCWRvIHsgfSB3aGlsZSAoMCkKPj4+Pj4+ICAgICAjZGVmaW5lIHN0YXRf
aW5jX3NlZ190eXBlKHNiaSwgY3Vyc2VnKQkJCWRvIHsgfSB3aGlsZSAoMCkKPj4+Pj4+ICAgICAj
ZGVmaW5lIHN0YXRfaW5jX2Jsb2NrX2NvdW50KHNiaSwgY3Vyc2VnKQkJZG8geyB9IHdoaWxlICgw
KQo+Pj4+Pj4gLSNkZWZpbmUgc3RhdF9pbmNfaW5wbGFjZV9ibG9ja3Moc2JpKQkJCWRvIHsgfSB3
aGlsZSAoMCkKPj4+Pj4+ICsjZGVmaW5lIHN0YXRfYWRkX2lucGxhY2VfYmxvY2tzKHNiaSwgY291
bnQsIGRpcmVjdF9pbykJCWRvIHsgfQo+PiB3aGlsZQo+Pj4+PiAoMCkKPj4+Pj4+ICAgICAjZGVm
aW5lIHN0YXRfaW5jX3NlZ19jb3VudChzYmksIHR5cGUsIGdjX3R5cGUpCQlkbyB7IH0gd2hpbGUK
Pj4gKDApCj4+Pj4+PiAgICAgI2RlZmluZSBzdGF0X2luY190b3RfYmxrX2NvdW50KHNpLCBibGtz
KQkJZG8geyB9IHdoaWxlICgwKQo+Pj4+Pj4gICAgICNkZWZpbmUgc3RhdF9pbmNfZGF0YV9ibGtf
Y291bnQoc2JpLCBibGtzLCBnY190eXBlKQlkbyB7IH0gd2hpbGUKPj4gKDApCj4+Pj4+PiBkaWZm
IC0tZ2l0IGEvZnMvZjJmcy9zZWdtZW50LmMgYi9mcy9mMmZzL3NlZ21lbnQuYyBpbmRleAo+Pj4+
Pj4gZGVkNzQ0ZTg4MGQwLi5jNTQyYzRiNjg3Y2EgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS9mcy9mMmZz
L3NlZ21lbnQuYwo+Pj4+Pj4gKysrIGIvZnMvZjJmcy9zZWdtZW50LmMKPj4+Pj4+IEBAIC0zNjEx
LDcgKzM2MTEsNyBAQCBpbnQgZjJmc19pbnBsYWNlX3dyaXRlX2RhdGEoc3RydWN0Cj4+Pj4+PiBm
MmZzX2lvX2luZm8KPj4+Pj4gKmZpbykKPj4+Pj4+ICAgICAJCWdvdG8gZHJvcF9iaW87Cj4+Pj4+
PiAgICAgCX0KPj4+Pj4+Cj4+Pj4+PiAtCXN0YXRfaW5jX2lucGxhY2VfYmxvY2tzKGZpby0+c2Jp
LCBmYWxzZSk7Cj4+Pj4+PiArCXN0YXRfYWRkX2lucGxhY2VfYmxvY2tzKHNiaSwgMSwgZmFsc2Up
Owo+Pj4+Pj4KPj4+Pj4+ICAgICAJaWYgKGZpby0+YmlvICYmICEoU01fSShzYmkpLT5pcHVfcG9s
aWN5ICYgKDEgPDwKPj4+PiBGMkZTX0lQVV9OT0NBQ0hFKSkpCj4+Pj4+PiAgICAgCQllcnIgPSBm
MmZzX21lcmdlX3BhZ2VfYmlvKGZpbyk7Cj4+Pj4+PgoKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Ckxp
bnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
