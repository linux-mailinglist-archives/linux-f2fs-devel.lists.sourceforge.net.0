Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDA7B1B0F1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  5 Aug 2025 11:23:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IAcIHNE2AP4+E6IQhQTWCTmQDKq0kr7JA7D7DQOrJ6Q=; b=KnD+7IL3N6MHLlpNWiY7mGEa+W
	0dXgqqZyO+8n876SmXqo/IITuKt4uNjC809FeTi6nv9Wy3IOgzGZKijdd3fPy9OcHAu317DhRIxVd
	jjea3QNseY2YS6j55xeRUWSlNpU9uZhF++R7P4opYV1SBSRtE5j6Jw0lVV3GloKDggsk=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujDt7-0004le-Uo;
	Tue, 05 Aug 2025 09:23:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Markus.Elfring@web.de>) id 1ujDsg-0004ku-Sr
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Aug 2025 09:22:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:Subject:References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pmk+bK4uF0SSkoIBiFcKkqv8UXyIF1fM2mtrECC2uuY=; b=gCh8B1lxXemSaeyrJrleJ6bJMY
 pFRPBGm3WcTFydNsRSI0FmiQPog3O/zdtXj7w9kX1lmAd0V6zUbKp3eMb3ppJVhdYyeAihRjH3rex
 CKT607d653YrwmVXj1nZo2yUNFxv2dP9S73qivEhG4okZDQkjiBx3NfeCASd/zszrhAY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:Subject:
 References:Cc:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pmk+bK4uF0SSkoIBiFcKkqv8UXyIF1fM2mtrECC2uuY=; b=KAHUq2ujkSwV2BcMn58RXSro4o
 k2z5xJq1WuKZK1NZAx3kY5fp7Ep5euvb/ubG2QYcDEVWGSyU9kotcaGZAkYGZrPwRKFmCqc77u+h0
 rUvo/CdZkbSA0tK8tYISK3a4A/YTvYoEyUOisbWOgrNCFzH6GA7i1UomKCbVaBbNIkWM=;
Received: from mout.web.de ([212.227.17.12])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ujDsW-0007c6-Uw for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 05 Aug 2025 09:22:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
 s=s29768273; t=1754385749; x=1754990549; i=markus.elfring@web.de;
 bh=pmk+bK4uF0SSkoIBiFcKkqv8UXyIF1fM2mtrECC2uuY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=OAAbBvHgfPiRqlN3V1JD7A5hIrH7b7YB8bjskKm+zf56z4DojyMc3CShLf9m9Ubs
 YgqrhDKN4WfheSYADUF9lbTOUvvkl8GllOrJzbtH+6Qe9WrRfZoNyFVsdLGr2yLQc
 rXMZyrtwTc4ahZebfCCuHSpGSdnZPVlUc7uh7IuV4RubHh2GmEsK83rCYs0kYBgbl
 TEpMaH8QkKLjmCjNJRZK2xjH8IXTU1MV9Y/UwOGEgKb4w+WGq8PfgQ6LfdIHdpeZ4
 H0ddFSjWqG3NN5iFXpR5BAQpfCpHx/3irimO4SfHZAkuFlaJQ78exuNmZBik5buGE
 Ij0yYCfZzAowhRD1Yw==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.245]) by smtp.web.de (mrweb106
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MPrLN-1uwdlM1qdP-00VxIU; Tue, 05
 Aug 2025 11:16:39 +0200
Message-ID: <d60910fc-a327-4ebc-ac24-42a668ac1402@web.de>
Date: Tue, 5 Aug 2025 11:16:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20250805061733.3067254-1-chao@kernel.org>
Content-Language: en-GB, de-DE
In-Reply-To: <20250805061733.3067254-1-chao@kernel.org>
X-Provags-ID: V03:K1:RtE7uzgtu+SdJzqnp9v738IXqW8VLSElJep+tlJJ/RTytXNyOZv
 6SGzMKRoaHShXWWucqIrAm6AjNfC+C5UfD0vZW2fFvwnIHgIS7XWTNiLH1iAlaJad1VQRwP
 WO/YztFmhqM3FpaT2dMvQk4xWQRAaPSt+qZaTlktgJyeOFqmj6LwdUSaEhPqzwwCp1dka1F
 /zEHCd26T9EdW2C54/kVg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:R/Ukq/X/C3w=;XWIsEf9REzy3X2HO/UPj3Kkdog3
 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
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  > f2fs doesn't support uncached write yet, for write() w/
 IOCB_DONTCACHE > flag,
 let's return -EOPNOTSUPP instead of ignoring IOCB_DONTCACHE
 flag > and write w/o uncached IO. See also once more:
 https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/process/submitting-patches.rst?h=v6.16#n94
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [markus.elfring(at)web.de]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [212.227.17.12 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ujDsW-0007c6-Uw
Subject: Re: [f2fs-dev] [PATCH v?] f2fs: fix to return -EOPNOTSUPP for
 uncached write
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
From: Markus Elfring via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Markus Elfring <Markus.Elfring@web.de>
Cc: Jens Axboe <axboe@kernel.dk>, Qi Han <hanqi@vivo.com>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

PiBmMmZzIGRvZXNuJ3Qgc3VwcG9ydCB1bmNhY2hlZCB3cml0ZSB5ZXQsIGZvciB3cml0ZSgpIHcv
IElPQ0JfRE9OVENBQ0hFCj4gZmxhZywgbGV0J3MgcmV0dXJuIC1FT1BOT1RTVVBQIGluc3RlYWQg
b2YgaWdub3JpbmcgSU9DQl9ET05UQ0FDSEUgZmxhZwo+IGFuZCB3cml0ZSB3L28gdW5jYWNoZWQg
SU8uCgpTZWUgYWxzbyBvbmNlIG1vcmU6Cmh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9s
aW51eC9rZXJuZWwvZ2l0L3RvcnZhbGRzL2xpbnV4LmdpdC90cmVlL0RvY3VtZW50YXRpb24vcHJv
Y2Vzcy9zdWJtaXR0aW5nLXBhdGNoZXMucnN0P2g9djYuMTYjbjk0CgoK4oCmCj4gLS0tCj4gdjI6
CuKApgoKU2hvdWxkIGEgY29ycmVzcG9uZGluZyBpbmZvcm1hdGlvbiBhcHBlYXIgaW4gdGhlIHBh
dGNoIHN1YmplY3Q/CgoK4oCmCj4gKysrIGIvZnMvZjJmcy9maWxlLmMKPiBAQCAtNTE4NSw2ICs1
MTg1LDExIEBAIHN0YXRpYyBzc2l6ZV90IGYyZnNfZmlsZV93cml0ZV9pdGVyKHN0cnVjdCBraW9j
YiAqaW9jYiwgc3RydWN0IGlvdl9pdGVyICpmcm9tKQo+ICAJCWdvdG8gb3V0Owo+ICAJfQo+ICAK
PiArCWlmIChpb2NiLT5raV9mbGFncyAmIElPQ0JfRE9OVENBQ0hFKSB7Cj4gKwkJcmV0ID0gLUVP
UE5PVFNVUFA7Cj4gKwkJZ290byBvdXQ7Cj4gKwl9Cj4gKwo+ICAJaWYgKCFmMmZzX2lzX2NvbXBy
ZXNzX2JhY2tlbmRfcmVhZHkoaW5vZGUpKSB7Cj4gIAkJcmV0ID0gLUVPUE5PVFNVUFA7Cj4gIAkJ
Z290byBvdXQ7CgpDYW4gaXQgYmUgYXZvaWRlZCB0byBzcGVjaWZ5IGR1cGxpY2F0ZSBleGNlcHRp
b24gaGFuZGxpbmc/Ck1heSB0aGUgY29uZGl0aW9uIGNoZWNrcyBiZSBtZXJnZWQgZm9yIHRoZXNl
IGlmIHN0YXRlbWVudHM/CgpSZWdhcmRzLApNYXJrdXMKCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApM
aW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJj
ZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
