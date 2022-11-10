Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 845556243DE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Nov 2022 15:11:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ot8H8-0007o0-Si;
	Thu, 10 Nov 2022 14:11:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <arnd@arndb.de>) id 1ot8Gn-0007ni-GG
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Nov 2022 14:11:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Subject:Cc:
 To:From:Date:References:In-Reply-To:Message-Id:Mime-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=19++3Vi/MimtPuuPOkXfPImCVesnLn5qoCUVppmD3sc=; b=HJjVv8O0DBkVbCrwX6OcLiVfTd
 hAPxJ3dfs2uXFxwX4HpLNBlwItmXMzgqqlckOAo1USO5sE02i+nTkZAklXiDiZhav4yJpTIGq2Jge
 nJilr8DgME3Orm6pOIOjS0MjENRleA4GqH+xOy3zhbGVatDloKgCY5/vCYQE0VkB7cQ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Subject:Cc:To:From:Date:References
 :In-Reply-To:Message-Id:Mime-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=19++3Vi/MimtPuuPOkXfPImCVesnLn5qoCUVppmD3sc=; b=Esz76jx9b3E0jddMBIslqe+YF8
 x4uvFJtC//uyvgP4XPE5m+El1ebq4PMtPkPMz7d99Sm+frhYJf2kc2a7NKocpklAzecxiYFoXx2kI
 yNsNsBL1ezyNj6oaaFm47/7bHJuIDoFBDRjdB9+dMGQMbhjl4vScIbbRz1K+cD9VKV5o=;
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ot8Gj-0039fe-KU for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Nov 2022 14:11:05 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 1A8975C01C7;
 Thu, 10 Nov 2022 08:45:59 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute3.internal (MEProxy); Thu, 10 Nov 2022 08:45:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1668087959; x=
 1668174359; bh=19++3Vi/MimtPuuPOkXfPImCVesnLn5qoCUVppmD3sc=; b=K
 pt6mtxrmqu8dYU5O8qXui74BmqL5Y+eS9OXO8wQObK73ULI8UV7CjAmOZ+8e1L5P
 ZXBemJgycQNpr9Ynu0Nm1iU5Mapcij/Rz9uVJ404m2G61yxeo5Fzmw6gXAxRhChw
 KtMxZoeSTFdNmPivpkV4h9fUtqRzA0nWDwz91W2V9bd3u/LYXdlxjQLZwlYVTXOV
 nB9NW+DRv4GX4gNVws2w3rwojBl2tU1jV3lEMLZ44tPBIyW7l33ZQwcTu7VlHpi3
 nBmrWBfN7kzOzZLBs9wWw5Okegoe/QqPQzLujhmw3gkiIX2hG5lUFppG0Aib5mRt
 IgsweDBxzTv6HKC2wL1TQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668087959; x=
 1668174359; bh=19++3Vi/MimtPuuPOkXfPImCVesnLn5qoCUVppmD3sc=; b=G
 VyxyVl8Gvb030ftFEXyVojDyEl99IDEwlHrekl6WoJhWjqPcvf0L7XS+5BdSWQoh
 KIJDHLe3LwFXXBnGxHecUpzxnkQHTgJSeMLWG+r5DEtlZh+nqD/wZYUlzZTA1K2a
 kmPirOQ50Y1ERc9YJgBwqiArTSr1OSakFTZahTmSJtVJ7OZXX35Dsw6T5bcuImvN
 0PenvxUS/EPOKngxhQfzXx0EdI2DkurY4wQ/efmdVqOhsEdtXahevi8J5leuTYjb
 43acr8ev7Vzc+GfW6pR62YhhEhwgg/cpgrDUmh+MOyo7sZGM30bH2ZD7HdLAbqr1
 pe+D17FZkNv8hcikHEQQA==
X-ME-Sender: <xms:lgBtY4mwwLcZ13VTE3P0unfzN6z67qCnD59miR8M_6BYaJJ0b4EWNA>
 <xme:lgBtY31c6C-dDgA3YTwDfOQjuyLq0CsmKo9E4YU-Bh2dz3YXhP1jCFk3yBJfuveA3
 aBKGbffK-QXbPyUe8A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrfeeggdehjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefofgggkfgjfhffhffvvefutgfgsehtqhertderreejnecuhfhrohhmpedftehr
 nhguuceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrth
 htvghrnhepgfekueelgeeigefhudduledtkeefffejueelheelfedutedttdfgveeufeef
 ieegnecuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpe
 dtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegrrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:lgBtY2oHpMlhxgops79KmpbdN3ul2qupJ9ljsgXlrf3j0281bXQqcQ>
 <xmx:lgBtY0nQG0CK1oUa7iVv5FQhv0lq5r0c2gD1l9EZ1yJlzVlJ6B6QbQ>
 <xmx:lgBtY20JidY8m5YltRT2hWb2hvxqe-RTW9SFNgl27Mc3tMqiMb4LJw>
 <xmx:lwBtYwpKzzI9UilXf38wfcQgPaHaoouKcHdxeQWUBzYqedcDvSb4_w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 52E30B60086; Thu, 10 Nov 2022 08:45:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <97c529f2-c5a2-4ed6-89eb-c79f020e9d0c@app.fastmail.com>
In-Reply-To: <CAHJ8P3+g7dr3PBZFQCD5HQLZ2b0WHe=b6Jt7ha1o7mqZJ7_-BQ@mail.gmail.com>
References: <1667889638-9106-1-git-send-email-zhiguo.niu@unisoc.com>
 <202211101659.j9z9jLHv-lkp@intel.com>
 <88fce16b-5092-4246-8bbf-23f2c03224f3@app.fastmail.com>
 <CAHJ8P3+g7dr3PBZFQCD5HQLZ2b0WHe=b6Jt7ha1o7mqZJ7_-BQ@mail.gmail.com>
Date: Thu, 10 Nov 2022 14:45:31 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zhiguo Niu" <niuzhiguo84@gmail.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-1.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Thu, Nov 10, 2022, at 11:20, Zhiguo Niu wrote: > Arnd Bergmann
    <arnd@arndb.de> 于2022年11月10日周四 17:07写道： >> On Thu, Nov
   10, 2022, at 09:33, kernel test robot wrote: >> > base: >> > [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
                             low trust
                             [66.111.4.29 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
X-Headers-End: 1ot8Gj-0039fe-KU
Subject: Re: [f2fs-dev] [PATCH V2] f2fs: fix atgc bug on issue in 32bits
 platform
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
Cc: llvm@lists.linux.dev, kernel test robot <lkp@intel.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 "zhiguo.niu" <zhiguo.niu@unisoc.com>, oe-kbuild-all@lists.linux.dev,
 jaegeuk@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gVGh1LCBOb3YgMTAsIDIwMjIsIGF0IDExOjIwLCBaaGlndW8gTml1IHdyb3RlOgo+IEFybmQg
QmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+IOS6jjIwMjLlubQxMeaciDEw5pel5ZGo5ZubIDE3OjA3
5YaZ6YGT77yaCj4+IE9uIFRodSwgTm92IDEwLCAyMDIyLCBhdCAwOTozMywga2VybmVsIHRlc3Qg
cm9ib3Qgd3JvdGU6Cj4+ID4gYmFzZTogICAKPj4gPiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1
Yi9zY20vbGludXgva2VybmVsL2dpdC9qYWVnZXVrL2YyZnMuZ2l0IAo+PiA+IGRldi10ZXN0Cj4+
ID4gcGF0Y2ggbGluazogICAgCj4+ID4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8xNjY3ODg5
NjM4LTkxMDYtMS1naXQtc2VuZC1lbWFpbC16aGlndW8ubml1JTQwdW5pc29jLmNvbQo+PiA+IHBh
dGNoIHN1YmplY3Q6IFtQQVRDSCBWMl0gZjJmczogZml4IGF0Z2MgYnVnIG9uIGlzc3VlIGluIDMy
Yml0cyBwbGF0Zm9ybQo+PiA+IEFsbCB3YXJuaW5ncyAobmV3IG9uZXMgcHJlZml4ZWQgYnkgPj4p
Ogo+PiA+Cj4+ID4gICAgSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGZzL2YyZnMvZ2MuYzoyMjoKPj4g
Pj4+IGZzL2YyZnMvZ2MuaDo2NToyOiB3YXJuaW5nOiBmaWVsZCAgd2l0aGluICdzdHJ1Y3Qgdmlj
dGltX2VudHJ5JyBpcyBsZXNzIGFsaWduZWQgdGhhbiAndW5pb24gdmljdGltX2VudHJ5OjooYW5v
bnltb3VzIGF0IGZzL2YyZnMvZ2MuaDo2NToyKScgYW5kIGlzIHVzdWFsbHkgZHVlIHRvICdzdHJ1
Y3QgdmljdGltX2VudHJ5JyBiZWluZyBwYWNrZWQsIHdoaWNoIGNhbiBsZWFkIHRvIHVuYWxpZ25l
ZCBhY2Nlc3NlcyBbLVd1bmFsaWduZWQtYWNjZXNzXQo+PiA+ICAgICAgICAgICAgdW5pb24gewo+
PiAKPj4gSXQgbG9va3MgbGlrZSB0aGUgcHJvYmxlbSBpcyB0aGUgZXh0cmEgdW5xdWFsaWZpZWQg
X19wYWNrZWQgYW5ub3RhdGlvbgo+PiBpbnNpZGUgb2YgJ3N0cnVjdCByYl9lbnRyeScuIAo+IHll
cywgSSBhZ3JlZSwgYnV0IHRoaXMgbW9kaWZpY2F0aW9uIGlzIGFib3V0IHRoZSBmb2xsb3dpbmcg
Y29tbWl0Ogo+IGYyZnM6IGZpeCBtZW1vcnkgYWxpZ25tZW50IHRvIHN1cHBvcnQgMzJiaXQgCj4g
KDQ4MDQ2Y2I1NWQyMDhlYWU2NzI1OTg4N2IyOWIzMDk3YmNmNDRjYWbvvIkKCkFoLCBJIHNlZS4g
U28gaW4gdGhpcyBjYXNlLCB0aGUgbGluZQoKICAgICAgICBlbiA9IChzdHJ1Y3QgZXh0ZW50X25v
ZGUgKilmMmZzX2xvb2t1cF9yYl90cmVlX3JldCgmZXQtPnJvb3QsCgpyZXF1aXJlcyB0aGUgc2Vj
b25kIGZpZWxkIG9mICdzdHJ1Y3QgZXh0ZW50X25vZGUnIHRvIGJlCmluIHRoZSBzYW1lIHBsYWNl
IGFzIHRoZSBjb3JyZXNwb25kaW5nIGZpZWxkIG9mICdzdHJ1Y3QgcmJfZW50cnknLgoKVGhpcyBz
ZWVtcyBoYXJtbGVzcyB0aGVuLCB0aG91Z2ggSSB3b3VsZCBoYXZlIHB1dCB0aGUgX19wYWNrZWQK
YW5ub3RhdGlvbiBvbiB0aGUgJ2tleScgbWVtYmVyIGluc3RlYWQgb2YgdGhlIHVuaW9uIHRvCmJl
dHRlciBkb2N1bWVudCB3aGF0IGlzIGdvaW5nIG9uLiBJZGVhbGx5IHRoZSBjYXN0cyBiZXR3ZWVu
CnN0cnVjdHVyZXMgc2hvdWxkIG5vdCBiZSB1c2VkIGF0IGFsbCwgYnV0IEkgZG9uJ3Qga25vdyBp
ZgpjaGFuZ2luZyBmMmZzIGZvciB0aGlzIHdvdWxkIGludm9sdmUgYSBtYWpvciByZXdyaXRlIG9m
IHRoYXQKY29kZS4KCj4gc28gSSB0aGluayBpcyB0aGUgZm9sbG93aW5nIG1vZGlmaWN0aW9uIG1v
cmUgYmV0dGVyPyAKPgo+IEBAIC02OCw3ICs2OCw3IEBAIHN0cnVjdCB2aWN0aW1fZW50cnkgewo+
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IHNlZ25vOyAgICAgICAgIC8q
IHNlZ21lbnQgTm8uICovCj4KPiAgICAgICAgICAgICAgICAgfTsKPgo+ICAgICAgICAgICAgICAg
ICBzdHJ1Y3QgdmljdGltX2luZm8gdmk7ICAgICAgIC8qIHZpY3RpbSBpbmZvICovCj4KPiAtICAg
ICAgIH07Cj4KPiArICAgICAgfSBfX3BhY2tlZDsKClNvIGhlcmUgaXMgdGhlIGNvbnN0cnVjdCB3
aXRoCgogICAgICAgIHZlID0gKHN0cnVjdCB2aWN0aW1fZW50cnkgKilyZTsKCnRoYXQgcmVsaWVz
IG9uIHZpLT5tdGltZSB0byBvdmVybGF5IHJlLT5rZXksIHJpZ2h0PwoKSSdtIG5vdCBzdXJlIHdo
eSB0aGVyZSBpcyBhIHVuaW9uIGluIHZpY3RpbV9lbnRyeSwgaXQgd291bGQKYmUgYSBsaXR0bGUg
ZWFzaWVyIHdpdGhvdXQgdGhhdC4gQ2xlYXJseSBib3RoIHNpZGVzCm9mIHRoZSB1bmlvbiBuZWVk
IHRoZSBzYW1lIGFsaWdubWVudCBjb25zdHJhaW50cywgc28KeW91IGNvdWxkIGFubm90YXRlIHRo
ZSB0d28gJ210aW1lJyBtZW1iZXJzIGFzIF9fcGFja2VkLAp3aGljaCBnaXZlcyB0aGUgYW5vbnlt
b3VzIHN0cnVjdCBhbmQgdGhlIHN0cnVjdCB2aWN0aW1faW5mbwozMi1iaXQgYWxpZ25tZW50IGFu
ZCBhdm9pZHMgdGhlIHdhcm5pbmcuIEhhdmluZyB0aGUgCl9fcGFja2VkIGF0IHRoZSBlbmQgb2Yg
dGhlIHN0cnVjdHVyZSBvciB1bmlvbiB3b3VsZApyZXN1bHQgaW4gb25seSBzaW5nbGUtYnl0ZSBh
bGlnbm1lbnQgZm9yIHN0cnVjdHVyZQphbmQgbm90IHNvbHZlIHRoZSBwcm9ibGVtIHRoYXQgdGhl
IGNvbXBpbGVyIHdhcm5zIGFib3V0LgoKVGhlIG90aGVyIGFsdGVybmF0aXZlIGlzIHRvIHJldmVy
dCByYl9lbnRyeSBiYWNrIHRvCmhhdmluZyA2NC1iaXQgYWxpZ25tZW50IG9uIHRoZSBrZXksIGJ1
dCB0aGVuIGFsc28gbWFyawpleHRlbnRfbm9kZSBhcyByZXF1aXJpbmcgdGhlIHNhbWUgYWxpZ25t
ZW50IG9uIHRoZQonZXh0ZW50X2luZm8nIG1lbWJlciBmb3IgY29uc2lzdGVuY3k6CgotLS0gYS9m
cy9mMmZzL2YyZnMuaAorKysgYi9mcy9mMmZzL2YyZnMuaApAQCAtNTgwLDExICs1ODAsMTEgQEAg
c3RydWN0IHJiX2VudHJ5IHsKICAgICAgICAgICAgICAgICAgICAgICAgdW5zaWduZWQgaW50IGxl
bjsgICAgICAgLyogbGVuZ3RoIG9mIHRoZSBlbnRyeSAqLwogICAgICAgICAgICAgICAgfTsKICAg
ICAgICAgICAgICAgIHVuc2lnbmVkIGxvbmcgbG9uZyBrZXk7ICAgICAgICAgLyogNjQtYml0cyBr
ZXkgKi8KLSAgICAgICB9IF9fcGFja2VkOworICAgICAgIH07CiB9OwogCiBzdHJ1Y3QgZXh0ZW50
X2luZm8gewotICAgICAgIHVuc2lnbmVkIGludCBmb2ZzOyAgICAgICAgICAgICAgLyogc3RhcnQg
b2Zmc2V0IGluIGEgZmlsZSAqLworICAgICAgIHVuc2lnbmVkIGludCBmb2ZzIF9fYWxpZ25lZCg4
KTsgLyogc3RhcnQgb2Zmc2V0IGluIGEgZmlsZSAqLwogICAgICAgIHVuc2lnbmVkIGludCBsZW47
ICAgICAgICAgICAgICAgLyogbGVuZ3RoIG9mIHRoZSBleHRlbnQgKi8KICAgICAgICB1MzIgYmxr
OyAgICAgICAgICAgICAgICAgICAgICAgIC8qIHN0YXJ0IGJsb2NrIGFkZHJlc3Mgb2YgdGhlIGV4
dGVudCAqLwogI2lmZGVmIENPTkZJR19GMkZTX0ZTX0NPTVBSRVNTSU9OCgogICAgICBBcm5kCgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=
