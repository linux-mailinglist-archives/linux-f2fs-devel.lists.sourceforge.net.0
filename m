Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F53CE9356
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Dec 2025 10:27:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=otgwSsuUD93Fug6qxg38CwZlozKMqhcru6EoMg8qYo8=; b=JG3lmWApozwIvT0fkGZfHpijZr
	7jHJOl5Ng9viq7cgHJviNq9/AnLk2wfY/HJQWTmfxRW2pCK8yODTLS21qhytsO0my28Yw2VuTb8iQ
	1+4qd6ZWns6H+SZMsPUvHRLFGTW7SJ+Cisa67m4NUq84QiKSynoUoVCrJuRqcHCjwMPs=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vaW0v-0005jf-7x;
	Tue, 30 Dec 2025 09:27:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vaW0t-0005jY-FE
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Dec 2025 09:27:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UITd8v7dERhSSqo9r4ajSEYVNfSYMZrDzRx9n3MNGuU=; b=DlPnfH8dBv2pY2QhmFu4cSV8zV
 QnkDqGaFivwmwoSqWOKg/Z11wj3pWlR//qSqJ2+ZpKK2biaCn7hmzw9CDtuy7K8tHgCeIf581WoZJ
 0KSjYTxZFPJhneJDhfOF/lX3/BAof3LKmOr+m46kiyOE7KbxBNSoo392Qskat6Ley93c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UITd8v7dERhSSqo9r4ajSEYVNfSYMZrDzRx9n3MNGuU=; b=Odio361CdspsZ4ubFe1YXBDF75
 wTT4wPrW4f374gtetNdqkqwom7X3XeWZAzNwUjBqBhXHYcj0iPXN4OabRFEdkPZW3qORp6G+vyNFl
 HV3RWFWQJVWWgd1//20Kxe9OuoYf0S5du4idNzBo0ZPRm03SX0MK7xC75yUdMaifKVFI=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vaW0s-0002Vb-W9 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 30 Dec 2025 09:27:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 9B5F144201;
 Tue, 30 Dec 2025 09:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C733C116C6;
 Tue, 30 Dec 2025 09:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1767086849;
 bh=mfqEohqL7TWMMnMvyKRo3p73IonKMFrOyhFeGU30svc=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Y/Lpm9tO50PyKww+bs9gyyyHybFTluhcM8cM4NDxHZDA7YwLljQ1IAucG45ifoGkC
 e68m+m39PWixdbT26IrQw1T8CRyFvgCdQ8t/jM1NawqLYTyMk+/15u7WxwIOxh+Aqg
 rrgmabVOAZxlemsNDHi81AldxeyAo/nqPrCsYWd7Mz2V3t704ry94mXcNKVzyQ8CV3
 H15uIIGzqstRde7UB1YlwN7/zihRlumcR1mPqhUUtBFxsBJV1ZPPRHZ9ZmQgVRH27o
 fHv+srfi3HGt3uyjdkzyQMpmNU6vaO5H8UtxePzxg+vDalfc3whOI8/nP9ZVse4KKa
 Uu0dFanA3FcRA==
Message-ID: <c28020f1-e2f2-42e8-9c0c-0ff70ec219cd@kernel.org>
Date: Tue, 30 Dec 2025 17:27:26 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Jeuk Kim <jeuk20.kim@gmail.com>, jaegeuk@kernel.org
References: <CAPjHTeSsvb7UOAn9mWoqXwWTw1J9SEEDo1k=8KVcAxwVsys+Og@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAPjHTeSsvb7UOAn9mWoqXwWTw1J9SEEDo1k=8KVcAxwVsys+Og@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi Jeuk, On 12/29/2025 2:33 PM, Jeuk Kim wrote: > Hi F2FS
   maintainers, > > Sorry for the duplicate — I’m resending this because
   the previous > message was sent in HTML format. > > I’ve been looking into
    [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vaW0s-0002Vb-W9
Subject: Re: [f2fs-dev] Question: batching block allocation in f2fs DIO path
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Jeuk Kim <jeuk20.kim@samsung.com>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGkgSmV1aywKCk9uIDEyLzI5LzIwMjUgMjozMyBQTSwgSmV1ayBLaW0gd3JvdGU6Cj4gSGkgRjJG
UyBtYWludGFpbmVycywKPiAKPiBTb3JyeSBmb3IgdGhlIGR1cGxpY2F0ZSDigJQgSeKAmW0gcmVz
ZW5kaW5nIHRoaXMgYmVjYXVzZSB0aGUgcHJldmlvdXMKPiBtZXNzYWdlIHdhcyBzZW50IGluIEhU
TUwgZm9ybWF0Lgo+IAo+IEnigJl2ZSBiZWVuIGxvb2tpbmcgaW50byB0aGUgRElPIGFsbG9jYXRp
b24gcGF0aCBpbiBmMmZzLCBzcGVjaWZpY2FsbHkKPiB3aGVuIGEgRElPIHdyaXRlIG5lZWRzIHRv
IGFsbG9jYXRlIG5ldyBibG9ja3MgKGUuZy4sIGhvbGUtZmlsbGluZykuCj4gIEZyb20gZjJmc19t
YXBfYmxvY2tzKCkgdGhyb3VnaCBfX2FsbG9jYXRlX2RhdGFfYmxvY2soKSDihpIKPiBmMmZzX2Fs
bG9jYXRlX2RhdGFfYmxvY2soKSwgaXQgc2VlbXMgZWFjaCBibG9jayBhbGxvY2F0aW9uIGlzIGhh
bmRsZWQKPiBvbmUtYnktb25lLCB0YWtpbmcgY3Vyc2VnX2xvY2svY3Vyc2VnX211dGV4IGFuZCB0
aGUgU0lUIHNlbnRyeSBsb2NrCj4gcGVyIGJsb2NrLgo+IAo+IEnigJltIHdvbmRlcmluZyB3aGV0
aGVyIGJhdGNoaW5nIGFsbG9jYXRpb25zIChhIGJvdW5kZWQgYmF0Y2gsIGUuZy4sIGEKPiBzbWFs
bCBydW4gd2l0aGluIHRoZSBjdXJyZW50IHNlZ21lbnQpIGNvdWxkIGJlIGZlYXNpYmxlIGluIHRo
ZSBESU8KPiBwYXRoLiBNeSBpbnR1aXRpb24gaXMgdGhhdCB3aXRoIG11bHRpcGxlIHRocmVhZHMg
ZG9pbmcgRElPLCByZWR1Y2luZwo+IHBlci1ibG9jayBsb2NrIGNvbnRlbnRpb24gYW5kIGltcHJv
dmluZyBzZXF1ZW50aWFsaXR5IGNvdWxkIGhlbHAKPiB0aHJvdWdocHV0LgoKSSBhZ3JlZSB3LyB5
b3UuCgo+IAo+IFF1ZXN0aW9uczoKPiAKPiBJcyB0aGVyZSBhIHRlY2huaWNhbCBvciBjb3JyZWN0
bmVzcyByZWFzb24gdGhhdCBtYWtlcyBiYXRjaGluZyBmb3IgRElPCj4gaW5mZWFzaWJsZSAoZS5n
LiwgTEZTL1NTUi9HQyBpbnRlcmFjdGlvbnMsIHN1bW1hcnkvU0lUIHVwZGF0ZQo+IG9yZGVyaW5n
LCBldGMuKT8KPiAKPiBPciBpcyB0aGlzIHNpbXBseSBhbiBvcHRpbWl6YXRpb24gdGhhdCBoYXNu
4oCZdCBiZWVuIGltcGxlbWVudGVkPwoKSSd2ZSBpbXBsZW1lbnRlZCBhIHByb3RvdHlwZSBvZiBt
dWx0aXBsZSBibG9jayBhbGxvY2F0aW9uIGZvciBhbnkgcG90ZW50aWFsCnVzZSBjYXNlczogcGlu
ZmlsZSBmYWxsb2NhdGlvbiwgZGlyZWN0IElPIGFuZCBidWZmZXJlZCBJTy4gSSBjYW4gc2VlIGJl
bmVmaXRzCmZyb20gbXkgcHJldmlvdXMgdGVzdC4KCkkgcGxhbiB0byB1cHN0cmVhbSBhbGwgaW1w
bGVtZW50YXRpb25zLCBidXQgSSB0aGluayBJIG5lZWQgbW9yZSB0aW1lIHRvIGNsZWFuCnVwIHRo
ZSBkcmFmdCBjb2RlcyBhbmQgY2hlY2sgYWxsIGNvcm5lciBjYXNlcy4KCllvdSBjYW4gY2hlY2sg
dGhlIE1CQSBpbXBsZW1lbnRhdGlvbiBmb3IgcGluZmlsZSB1c2UgY2FzZSBpbiBiZWxvdyBsaW5r
LCBJCmd1ZXNzIHRoaXMgdmVyc2lvbiBpcyBjbG9zZSB0byB1cHN0cmVhbS4KCmh0dHBzOi8vZ2l0
aHViLmNvbS9jaGFzZXl1L2YyZnMtZGV2L2NvbW1pdHMvZmVhdHVyZS9pbmJhdGNoX3dyaXRlCgpU
aGFua3MsCgo+IAo+IElmIHRoaXMgc2VlbXMgYWNjZXB0YWJsZSwgd291bGQgeW91IGNvbnNpZGVy
IHBhdGNoZXMgaW4gdGhpcyBkaXJlY3Rpb24/Cj4gCj4gSWYgdGhlcmUgYXJlIHByaW9yIGRpc2N1
c3Npb25zIG9yIGtub3duIGlzc3VlcyBvbiB0aGlzLCBJ4oCZZCBhcHByZWNpYXRlIHBvaW50ZXJz
Lgo+IAo+IFRoYW5rcyBmb3IgeW91ciB0aW1lLgo+IAo+IEJlc3QgcmVnYXJkcywKPiBKZXVrIEtp
bQoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51
eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51
eC1mMmZzLWRldmVsCg==
