Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 198C7614DC9
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Nov 2022 16:06:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1opsqr-000798-1D;
	Tue, 01 Nov 2022 15:06:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1opsqp-00078v-6v
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Nov 2022 15:06:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 Subject:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uUlhbLoa+5FNVXcP58mc7VzMk3Vxk9jyXYac1xw+2oU=; b=F/qdC4GQPsUZvqpuMv3za/iGC9
 w7Smozb6BsHxyOSitkbcquAcvbTceRA9magKhG2LykqmPOGkU9u7h34ERwkduCJFSiTx7+uqgjZEx
 TyxRN4Wi5RUq2QpJMfKDwwO09+df2hweujzRYNldmsYxfSe/ifQDd9XX/VzGB8jy8YTc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:Subject:From:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uUlhbLoa+5FNVXcP58mc7VzMk3Vxk9jyXYac1xw+2oU=; b=gUdzswOWczowthQCw7bMwQkmKE
 M+HJ+TBYHTG3SKRxFnnMhEByhcMlr+IdVgVhA6jr3czho+lGDVMNAfgXq9E7QSzZxuGhr/s0wRzAg
 8LgEBg9e1wnjKEMESkKw8AV09AA4sQgH2gxbRIdLsd800uqex9ST5iS7CQu4E1zA1vGU=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1opsqn-000186-Tc for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Nov 2022 15:06:51 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id CE644B81E65;
 Tue,  1 Nov 2022 15:06:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4BE9C433C1;
 Tue,  1 Nov 2022 15:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667315197;
 bh=rz4eFCHSGMuLuHIxQQe4wiL+S8qSJ6MrWWgMOv+E718=;
 h=Date:To:Cc:References:From:Subject:In-Reply-To:From;
 b=IvSZ8adnXPf5RbAm+lHWs3Cz2+Htl28kD74qHfRCtgAOTXY98x5rcWbCPmD9rjMnE
 u4mvlMnMeh3LeWs4NAgbsW4ZiFiIC/iHc3CC67WK1sTVOQb0xHZlC+dcdxLGBL7Mi3
 WmZM92Qr4Cpe7BJjD70ocha80WtXFQZl23zXSL77EbRdpvmzKvG0Sq+j1I7EZVruGN
 S5yNQID8dNJZTUoVFu6t8qPtZdq3ZNAHSw9njetLd54tNC69qCSK9i7dZhMEfEp0gH
 GFgmZLKnkuhVCVbBuWXlc1agnVhcYvgUY6Ry7qamMOzV2VTaA6PJDThRwQetbVZ3lx
 iWzkqlU+5zIRw==
Message-ID: <cae1e1e9-d528-496e-d89d-be47c4b8d0cb@kernel.org>
Date: Tue, 1 Nov 2022 23:06:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
To: fengnan chang <fengnanchang@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20220608134852.476876-1-fengnanchang@gmail.com>
 <96CE38DF-C3E7-4284-8C36-6F51D355343E@gmail.com>
 <CALWNXx9F+pZa9b7Bui=A9L66pO=64H6kwzNUtSfJsbLsvPBLMQ@mail.gmail.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <CALWNXx9F+pZa9b7Bui=A9L66pO=64H6kwzNUtSfJsbLsvPBLMQ@mail.gmail.com>
X-Spam-Score: -6.3 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Fengnan, Sorry for the delay. I guess we can merge this
 patch, but let me check whether there is another solution, since mm guys
 want to remove PG_error usage to save one bit slot in page.flags. 
 Content analysis details:   (-6.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 NICE_REPLY_A           Looks like a legit reply (A)
 -1.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1opsqn-000186-Tc
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgRmVuZ25hbiwKClNvcnJ5IGZvciB0aGUgZGVsYXkuCgpJIGd1ZXNzIHdlIGNhbiBtZXJnZSB0
aGlzIHBhdGNoLCBidXQgbGV0IG1lIGNoZWNrIHdoZXRoZXIgdGhlcmUKaXMgYW5vdGhlciBzb2x1
dGlvbiwgc2luY2UgbW0gZ3V5cyB3YW50IHRvIHJlbW92ZSBQR19lcnJvciB1c2FnZQp0byBzYXZl
IG9uZSBiaXQgc2xvdCBpbiBwYWdlLmZsYWdzLgoKT24gMjAyMi8xMS8xIDE3OjQxLCBmZW5nbmFu
IGNoYW5nIHdyb3RlOgo+IGZyaWVuZGx5IHBpbmcuLi4KPiAKPiBmZW5nbmFuIGNoYW5nIDxmZW5n
bmFuY2hhbmdAZ21haWwuY29tPiDkuo4yMDIy5bm0MTDmnIgxNOaXpeWRqOS6lCAxNjo0NuWGmemB
k++8mgo+Pgo+PiBwaW5nLCAgaXQgc2VlbXMgdGhpcyBoYWQgYmVlbiBmb3Jnb3R0ZW4uCj4+Cj4+
PiAyMDIy5bm0NuaciDjml6UgMjE6NDjvvIxGZW5nbmFuIENoYW5nIDxmZW5nbmFuY2hhbmdAZ21h
aWwuY29tPiDlhpnpgZPvvJoKPj4+Cj4+PiBXaGVuIGRlY29tcHJlc3NlZCBmYWlsZWQsIGYyZnNf
cHJlcGFyZV9jb21wcmVzc19vdmVyd3JpdGUgd2lsbCBlbnRlcgo+Pj4gZW5kbGVzcyBsb29wLCBt
YXkgY2FzdWUgaHVuZ3Rhc2suCj4+Pgo+Pj4gWyAgIDE0LjA4ODY2NV0gRjJGUy1mcyAobnZtZTBu
MSk6IGx6NCBkZWNvbXByZXNzIGZhaWxlZCwgcmV0Oi00MTU1Cj4+PiBbICAgMTQuMDg5ODUxXSBG
MkZTLWZzIChudm1lMG4xKTogbHo0IGRlY29tcHJlc3MgZmFpbGVkLCByZXQ6LTQxNTUKPj4+Cj4+
PiBTaWduZWQtb2ZmLWJ5OiBGZW5nbmFuIENoYW5nIDxmZW5nbmFuY2hhbmdAZ21haWwuY29tPgo+
Pj4gLS0tCj4+PiBmcy9mMmZzL2NvbXByZXNzLmMgfCAyMSArKysrKysrKysrKysrKysrLS0tLS0K
Pj4+IDEgZmlsZSBjaGFuZ2VkLCAxNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+Pj4K
Pj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL2NvbXByZXNzLmMgYi9mcy9mMmZzL2NvbXByZXNzLmMK
Pj4+IGluZGV4IDI0ODI0Y2Q5NmYzNi4uMTc2NGUzODU5MjYyIDEwMDY0NAo+Pj4gLS0tIGEvZnMv
ZjJmcy9jb21wcmVzcy5jCj4+PiArKysgYi9mcy9mMmZzL2NvbXByZXNzLmMKPj4+IEBAIC0xMDYw
LDcgKzEwNjAsNyBAQCBzdGF0aWMgaW50IHByZXBhcmVfY29tcHJlc3Nfb3ZlcndyaXRlKHN0cnVj
dCBjb21wcmVzc19jdHggKmNjLAo+Pj4gICAgICAgIHNlY3Rvcl90IGxhc3RfYmxvY2tfaW5fYmlv
Owo+Pj4gICAgICAgIHVuc2lnbmVkIGZncF9mbGFnID0gRkdQX0xPQ0sgfCBGR1BfV1JJVEUgfCBG
R1BfQ1JFQVQ7Cj4+PiAgICAgICAgcGdvZmZfdCBzdGFydF9pZHggPSBzdGFydF9pZHhfb2ZfY2x1
c3RlcihjYyk7Cj4+PiAtICAgICBpbnQgaSwgcmV0Owo+Pj4gKyAgICAgaW50IGksIHJldCwgcmV0
cnlfY291bnQgPSAzOwoKV3JhcCBtYWdpYyBudW1iZXIgdy8gbWFjcm8/Cgo+Pj4KPj4+IHJldHJ5
Ogo+Pj4gICAgICAgIHJldCA9IGYyZnNfaXNfY29tcHJlc3NlZF9jbHVzdGVyKGNjLT5pbm9kZSwg
c3RhcnRfaWR4KTsKPj4+IEBAIC0xMTIwLDcgKzExMjAsMTIgQEAgc3RhdGljIGludCBwcmVwYXJl
X2NvbXByZXNzX292ZXJ3cml0ZShzdHJ1Y3QgY29tcHJlc3NfY3R4ICpjYywKPj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgZjJmc19wdXRfcnBhZ2VzKGNjKTsKPj4+ICAgICAgICAgICAgICAgICAg
ICAgICAgZjJmc191bmxvY2tfcnBhZ2VzKGNjLCBpICsgMSk7Cj4+PiAgICAgICAgICAgICAgICAg
ICAgICAgIGYyZnNfZGVzdHJveV9jb21wcmVzc19jdHgoY2MsIHRydWUpOwo+Pj4gLSAgICAgICAg
ICAgICAgICAgICAgIGdvdG8gcmV0cnk7Cj4+PiArICAgICAgICAgICAgICAgICAgICAgcmV0cnlf
Y291bnQtLTsKPj4+ICsgICAgICAgICAgICAgICAgICAgICBpZiAoUGFnZUVycm9yKHBhZ2UpICYm
ICFyZXRyeV9jb3VudCkgewo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0ID0g
LUVJTzsKPj4+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdvdG8gb3V0Owo+Pj4gKyAg
ICAgICAgICAgICAgICAgICAgIH0gZWxzZQo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgZ290byByZXRyeTsKCn0gZWxzZSB7Cglnb3RvIHJldHJ5Owp9Cgo+Pj4gICAgICAgICAgICAg
ICAgfQo+Pj4gICAgICAgIH0KPj4+Cj4+PiBAQCAtMTY1NywxMCArMTY2MiwxNiBAQCBzdGF0aWMg
dm9pZCBfX2YyZnNfZGVjb21wcmVzc19lbmRfaW8oc3RydWN0IGRlY29tcHJlc3NfaW9fY3R4ICpk
aWMsIGJvb2wgZmFpbGVkKQo+Pj4gICAgICAgICAgICAgICAgaWYgKCFycGFnZSkKPj4+ICAgICAg
ICAgICAgICAgICAgICAgICAgY29udGludWU7Cj4+Pgo+Pj4gLSAgICAgICAgICAgICAvKiBQR19l
cnJvciB3YXMgc2V0IGlmIHZlcml0eSBmYWlsZWQuICovCj4+PiAtICAgICAgICAgICAgIGlmIChm
YWlsZWQgfHwgUGFnZUVycm9yKHJwYWdlKSkgewo+Pj4gKyAgICAgICAgICAgICBpZiAoZmFpbGVk
KSB7Cj4+PiArICAgICAgICAgICAgICAgICAgICAgLyogZGVjb21wcmVzcyBwYWdlIGZhaWxlZCAq
Lwo+Pj4gKyAgICAgICAgICAgICAgICAgICAgIENsZWFyUGFnZVVwdG9kYXRlKHJwYWdlKTsKPj4+
ICsgICAgICAgICAgICAgICAgICAgICBTZXRQYWdlRXJyb3IocnBhZ2UpOwo+Pj4gKyAgICAgICAg
ICAgICB9IGVsc2UgaWYgKFBhZ2VFcnJvcihycGFnZSkpIHsKPj4+ICsgICAgICAgICAgICAgICAg
ICAgICAvKgo+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAqIFBHX2Vycm9yIHdhcyBzZXQgaWYg
dmVyaXR5IGZhaWxlZC4KPj4+ICsgICAgICAgICAgICAgICAgICAgICAgKiB3aWxsIHJlLXJlYWQg
YWdhaW4gbGF0ZXIuCj4+PiArICAgICAgICAgICAgICAgICAgICAgICovCj4+PiAgICAgICAgICAg
ICAgICAgICAgICAgIENsZWFyUGFnZVVwdG9kYXRlKHJwYWdlKTsKPj4+IC0gICAgICAgICAgICAg
ICAgICAgICAvKiB3aWxsIHJlLXJlYWQgYWdhaW4gbGF0ZXIgKi8KPj4+ICAgICAgICAgICAgICAg
ICAgICAgICAgQ2xlYXJQYWdlRXJyb3IocnBhZ2UpOwo+Pj4gICAgICAgICAgICAgICAgfSBlbHNl
IHsKPj4+ICAgICAgICAgICAgICAgICAgICAgICAgU2V0UGFnZVVwdG9kYXRlKHJwYWdlKTsKPj4+
IC0tCj4+PiAyLjI1LjEKPj4+Cj4+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
