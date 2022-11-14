Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC38627A4E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 14 Nov 2022 11:18:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ouWXp-0007y5-SD;
	Mon, 14 Nov 2022 10:18:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <arnd@arndb.de>) id 1ouWXn-0007xx-OK
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Nov 2022 10:18:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Subject:Cc:
 To:From:Date:References:In-Reply-To:Message-Id:Mime-Version:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Sqoo4IjMdLl+gwYK44DprelnuA9DnGWY/ANBVWRBeWM=; b=dGPZDnkKeau+rSRPOR7VL0yi3i
 lSOa31XJhDz7iXsLJrtX77jPavRo28ga0ek8xsNJ/2nxTgvCjMYKCYRn8YMD8MBNe59JZMbke8Wkf
 jVAZD13QEzovA0tKKx00ys1Ef5q8V6ZJKar6Fll0NXfT1Acf2qGZnMSvtW2wOry9gorc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Subject:Cc:To:From:Date:References
 :In-Reply-To:Message-Id:Mime-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Sqoo4IjMdLl+gwYK44DprelnuA9DnGWY/ANBVWRBeWM=; b=bYeB2x4wUlvVEk19mwhw/q/07N
 5qDFEg43gM1Yu0GztCPHdfZBf/3A4KyLt/s1f9uLNLZamTVPa75fp2DYW+UAQXJxWdSDjaG5uPfp3
 4ofx/epF5pdF7RIWaaV6iDHHvnsYTKpM+BE3O0gOUPQp6q9TgcTRuvyObBd5SS5aYK10=;
Received: from wout1-smtp.messagingengine.com ([64.147.123.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ouWXm-0005o7-Gq for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 14 Nov 2022 10:18:23 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 5E8CD3200927;
 Mon, 14 Nov 2022 05:18:11 -0500 (EST)
Received: from imap51 ([10.202.2.101])
 by compute3.internal (MEProxy); Mon, 14 Nov 2022 05:18:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm3; t=1668421090; x=
 1668507490; bh=Sqoo4IjMdLl+gwYK44DprelnuA9DnGWY/ANBVWRBeWM=; b=O
 4HviMU7BF8TBeb9tfyMcLULD0aVhJ7koWP772po3dNCAycEcSgGfVlruglHjEzDa
 4WGTa404Jt7Cxeg0saCJ1u0O2rWYzJqekU9mj8aObr6JsrWU2vONPI56yoXGxb0p
 r7wWU7HdyneKkwPXG8CrHJMtDs7qpx977S6ZzL3p2PUgTrTRn4qemzIxZY1l3ZSV
 v+AtV8Ekj7YQ//H0PO1bmZyeou4LGa5yWTbaA410DudlqpVTcfgGFi3kxgl0NAkL
 o5T6iqOIH96GwIwZb9M3q4SDa9cyfAD9Yx6OvHT5ufCK7xKSwEyYf0+syzpPPjCc
 H/LV0jLMI/7GXuuuyMEcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668421090; x=
 1668507490; bh=Sqoo4IjMdLl+gwYK44DprelnuA9DnGWY/ANBVWRBeWM=; b=F
 qScHq0ujafwzGkr779E18cB59whIxm5LcmWTz6Q2fBThdEuUkGZnIfQvqPRbv7gY
 14UuBRHofadY1DLFaC76caHTIEGpgQQwqzygWMLy5DNzY1xPLjcoE9HwH8UdtPu3
 UFovcZn1NVfWBNqAhJcQUth8oTxMFgCerTDWyBYIabyBDvpw8kxdMO1i2SXqyrtb
 AmHV2LuvOmPZOKH60wSK33+O1WBSiGmtNkXCFoW3H1iLyha+af4dfte0jGbvFmrd
 3Wr1nHazxxF+ZOdnQ4gvumABx+y6QhIAI5Jvh2bkOXQz3N317azoN/OBN3o4qcSv
 bBEiUBgD4Rc8WDTCQFjMA==
X-ME-Sender: <xms:4hVyY0j_bIq4eU9mHK9KJ86oEPuq_wCdANSEojuo8IYqv6IY6u23_w>
 <xme:4hVyY9B9GexXuEo3cH1PA2fc_vWT3qxoPubyfR9o4uvtO2YaAFAhejRtJ-Gv4nyIY
 a2RsSjOeNAWsfZQ1Ec>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgedugddugeefucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepofgfggfkjghffffhvfevufgtgfesthhqredtreerjeenucfhrhhomhepfdet
 rhhnugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrg
 htthgvrhhnpeegfeejhedvledvffeijeeijeeivddvhfeliedvleevheejleetgedukedt
 gfejveenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 grrhhnugesrghrnhgusgdruggv
X-ME-Proxy: <xmx:4hVyY8HJA8F9bhpB-rNfcIBLSTniCbrHtzzdrqwKohf6-Hl5sjJ_Kg>
 <xmx:4hVyY1S5rzYR7A3utjDTX-qJEH4kDoLCjq9jiSRbeaJ2YMkHGot5LA>
 <xmx:4hVyYxwlBxdrRto32c7Yf454A2ECiH6t4Tp65kLPGhq6H6l7iIKGjg>
 <xmx:4hVyY4nGuFfQ0rBtdF6FbD1-uEKuEpHfaOHMjPZ3CxiEH-dGbP4U_A>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 28ACFB60086; Mon, 14 Nov 2022 05:18:10 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <d6cf3090-ac0c-4627-b3cb-268fd213056f@app.fastmail.com>
In-Reply-To: <CAHJ8P3JHVu=Qy0ft9Sorq2Zxvu7whFV72OU+NVMhvK8SK6+6MA@mail.gmail.com>
References: <1667889638-9106-1-git-send-email-zhiguo.niu@unisoc.com>
 <202211101659.j9z9jLHv-lkp@intel.com>
 <88fce16b-5092-4246-8bbf-23f2c03224f3@app.fastmail.com>
 <CAHJ8P3+g7dr3PBZFQCD5HQLZ2b0WHe=b6Jt7ha1o7mqZJ7_-BQ@mail.gmail.com>
 <97c529f2-c5a2-4ed6-89eb-c79f020e9d0c@app.fastmail.com>
 <CAHJ8P3KU4NBr9ftqp1J_QWxGUjusoUZo6JjefPN-4YazD4mrUQ@mail.gmail.com>
 <cd818e0c-4c8c-421e-ae39-c7cea79eeb7e@app.fastmail.com>
 <CAHJ8P3JHVu=Qy0ft9Sorq2Zxvu7whFV72OU+NVMhvK8SK6+6MA@mail.gmail.com>
Date: Mon, 14 Nov 2022 11:17:48 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Zhiguo Niu" <niuzhiguo84@gmail.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Nov 14, 2022, at 10:23, Zhiguo Niu wrote: > Arnd Bergmann
    <arnd@arndb.de> 于2022年11月11日周五 17:57写道： > so I just modify
    struct victim_entry as your suggestion: > diff --git a/fs/f2fs/gc.h b/fs/f2fs/gc.h
    > index 19b956c2d697..e2f25b8fd865 100644 > --- a/fs/f2fs/gc.h > +++ b/fs/f2fs/gc.h
    > @@ -56,16 +5 [...] 
 
 Content analysis details:   (-0.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
                             [64.147.123.24 listed in wl.mailspike.net]
 -0.7 RCVD_IN_DNSWL_LOW      RBL: Sender listed at https://www.dnswl.org/,
                             low trust
                             [64.147.123.24 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
X-Headers-End: 1ouWXm-0005o7-Gq
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

T24gTW9uLCBOb3YgMTQsIDIwMjIsIGF0IDEwOjIzLCBaaGlndW8gTml1IHdyb3RlOgo+IEFybmQg
QmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+IOS6jjIwMjLlubQxMeaciDEx5pel5ZGo5LqUIDE3OjU3
5YaZ6YGT77yaCgo+IHNvIEkganVzdCBtb2RpZnkgc3RydWN0IHZpY3RpbV9lbnRyeSBhcyB5b3Vy
IHN1Z2dlc3Rpb246Cj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZ2MuaCBiL2ZzL2YyZnMvZ2MuaAo+
IGluZGV4IDE5Yjk1NmMyZDY5Ny4uZTJmMjViOGZkODY1IDEwMDY0NAo+IC0tLSBhL2ZzL2YyZnMv
Z2MuaAo+ICsrKyBiL2ZzL2YyZnMvZ2MuaAo+IEBAIC01NiwxNiArNTYsMTYgQEAgc3RydWN0IGdj
X2lub2RlX2xpc3Qgewo+ICB9Owo+IAo+ICBzdHJ1Y3QgdmljdGltX2luZm8gewo+IC0gdW5zaWdu
ZWQgbG9uZyBsb25nIG10aW1lOyAvKiBtdGltZSBvZiBzZWN0aW9uICovCj4gLSB1bnNpZ25lZCBp
bnQgc2Vnbm87IC8qIHNlY3Rpb24gTm8uICovCj4gKyB1bnNpZ25lZCBsb25nIGxvbmcgbXRpbWUg
X19wYWNrZWQ7IC8qIG10aW1lIG9mIHNlY3Rpb24gKi8KPiArIHVuc2lnbmVkIGludCBzZWdubzsg
Lyogc2VjdGlvbiBOby4gKi8KPiAgfTsKPiAKPiAgc3RydWN0IHZpY3RpbV9lbnRyeSB7Cj4gICBz
dHJ1Y3QgcmJfbm9kZSByYl9ub2RlOyAvKiByYiBub2RlIGxvY2F0ZWQgaW4gcmItdHJlZSAqLwo+
ICAgdW5pb24gewo+ICAgc3RydWN0IHsKPiAtIHVuc2lnbmVkIGxvbmcgbG9uZyBtdGltZTsgLyog
bXRpbWUgb2Ygc2VjdGlvbiAqLwo+IC0gdW5zaWduZWQgaW50IHNlZ25vOyAvKiBzZWdtZW50IE5v
LiAqLwo+ICsgdW5zaWduZWQgbG9uZyBsb25nIG10aW1lIF9fcGFja2VkOyAvKiBtdGltZSBvZiBz
ZWN0aW9uICovCj4gKyB1bnNpZ25lZCBpbnQgc2Vnbm87IC8qIHNlZ21lbnQgTm8uICovCj4gICB9
Owo+ICAgc3RydWN0IHZpY3RpbV9pbmZvIHZpOyAvKiB2aWN0aW0gaW5mbyAqLwo+ICAgfTsKClJp
Z2h0LCB0aGlzIHNob3VsZCB3b3JrLiBJJ20gc3RpbGwgdW5zdXJlIHdoZXJlIHlvdSBuZWVkCmEg
dW5pb24gaW5zaWRlIG9mIHZpY3RpbV9lbnRyeSByYXRoZXIgdGhhbiBqdXN0IGhhdmluZyB0aGUK
J3ZpY3RpbV9pbmZvJyBwb3J0aW9uIGluIHRoZXJlIGJ5IGl0c2VsZiwgYnV0IHRoYXQgaXMgbm90
CmEgbWF0dGVyIG9mIGNvcnJlY3RuZXNzLgoKPiBUaGVyZSBpcyBubyBwcm9ibGVtIHdpdGggZnVu
Y3Rpb25hbCB2ZXJpZmljYXRpb24gaW4gYm90aCA2NGJpdCBhbmQgCj4gMzJiaXQgcGxhdGZvcm1z
LCAKPiBzb3JyeSBJIGRvbid0IGhhdmUgdGhlIGVudmlyb25tZW50IHRvIHZlcmlmeSBpcyAgYnVp
bGQgd2FybmlnIHJlcG9ydGVkIAo+IGJ5IHRoZSBrZXJuZWwgdGVzdCByb2JvdCBzdGlsbCB0aGVy
ZS4KCkkgaGFkIGEgYml0IHRyb3VibGUgcmVwcm9kdWNpbmcgdGhpcyBhcyB3ZWxsLiBJdCBsb29r
cyBsaWtlIHRoaXMKb25seSBoYXBwZW5zIHdoZW4gLVd1bmFsaWduZWQtYWNjZXNzIGlzIGVuYWJs
ZWQgZm9yIGEgY29uZmlnLCBidXQKdGhhdCByZXF1aXJlcyB0d28gdGhpbmdzOgoKLSBidWlsZGlu
ZyB3aXRoIENDPWNsYW5nIGZvciBhIHRhcmdldCBhcmNoaXRlY3R1cmUgdGhhdCBkb2VzCiAgbm90
IHN1cHBvcnQgdW5hbGlnbmVkIGFjY2VzcyBuYXRpdmVseSwgc3VjaCBhcyBBUk12NS4KICBBUk12
NyBpcyBpbnRlcmVzdGluZyBiZWNhdXNlIGl0IGRpc2FibGVzIHRoZSB3YXJuaW5nLCB0aG91Z2gK
ICBpdCBvbmx5IHN1cHBvcnRzIHVuYWxpZ25lZCBsb2FkL3N0b3JlIG9uIDMyLWJpdCBhbmQgMTYt
Yml0CiAgd29yZHMgYnV0IG5vdCA2NC1iaXQgd29yZHMgdXNpbmcgdGhlIGxkcmQvc3RyZCBpbnN0
cnVjdGlvbnMuCgotIEV2ZW4gb24gYXJjaGl0ZWN0dXJlcyB3aXRoIG5vIHVuYWxpZ25lZCBsb2Fk
L3N0b3JlLCB0aGUKICB3YXJuaW5nIGlzIGRpc2FibGVkIGJ5IGRlZmF1bHQgdW5sZXNzIHlvdSB1
c2UgIm1ha2UgVz0xIiB0bwogIGVuYWJsZSBleHRyYSB3YXJuaW5ncy4KCkFsdGVybmF0aXZlbHks
IHlvdSBjYW4gZW5hYmxlIHRoZSB3YXJuaW5nIG1hbnVhbGx5IGJ5IHBhc3NpbmcKIkNGTEFHU19N
T0RVTEU9LVd1bmFsaWduZWQtYWNjZXNzIiB0byBtYWtlLCB3aGljaCBzaG91bGQgdHJpZ2dlcgp0
aGUgd2FybmluZyBvbiBhbnkgMzItYml0IGFyY2hpdGVjdHVyZS4KCiAgICAgIEFybmQKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==
