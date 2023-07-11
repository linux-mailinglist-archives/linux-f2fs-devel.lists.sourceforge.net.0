Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC32D74E71A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Jul 2023 08:20:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qJ6jH-0007Eg-LL;
	Tue, 11 Jul 2023 06:20:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hare@suse.de>) id 1qJ6jG-0007EZ-DM
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Jul 2023 06:20:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zVzsxiQ98RSmHXT12YjkKKL21vDieV95nWWwG2xBdp0=; b=G1XltYP5DMZRWCDrnGBNPG9DKW
 9fvoKpVwyuPXrQKvxfgCm3VfERH4OIMNpuf4iQm1CXN+57fqHHGWwDjL+FdrH40SiSqOiNhlfKGvc
 j3BmSe4k2py55CVoln61mEi3HaK745X2n6CrDhBfs9fEZele4k7SuyLT7def2li4tKKI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zVzsxiQ98RSmHXT12YjkKKL21vDieV95nWWwG2xBdp0=; b=LIhu2/s/sI+O4P2U0SgUnrllxx
 ++VVyb9m4RUrvhMpjzw33+7juYFvMhnj8Y+uDh/HwemhaU+4PJfdgIWmwYO4lDEBi2tA32YUJeVcG
 k/fRPwKwqMqCuni2HbFALnEfWbD04UVTK7513RNsBvXtQTxsvxmAWQ5szpcAvp+qhmwQ=;
Received: from smtp-out1.suse.de ([195.135.220.28])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qJ6jE-0003xV-KO for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Jul 2023 06:20:06 +0000
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 3002022434;
 Tue, 11 Jul 2023 06:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1689056392; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zVzsxiQ98RSmHXT12YjkKKL21vDieV95nWWwG2xBdp0=;
 b=jptecx4HSEQ8XXTn/IcgONrRRw/3DEcrO4mXNQE6gs6wNGNJhIS3ZL47HpFdvWdj4SPbJj
 zdWpt9i8aAlq7MiGFpbVlHUZAxk1qovD5Nep8Y+qu9YQs3Oky1G9XD1vlPQPdIqAoyOevv
 NMcekm8+Ti7WCS15d00JC9xsESCHH7I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1689056392;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zVzsxiQ98RSmHXT12YjkKKL21vDieV95nWWwG2xBdp0=;
 b=yNZvpPiHzBWcsh8Rbnb7FH6VeQmZ0bQMtYy10W6dCCtaILzPqy+RMnt6DAHsxVFWAcrm4P
 NLNVyFybD3iA1xDw==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E1F8F1390F;
 Tue, 11 Jul 2023 06:19:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id XapONYf0rGQNDAAAMHmgww
 (envelope-from <hare@suse.de>); Tue, 11 Jul 2023 06:19:51 +0000
Message-ID: <63766a54-54db-20a7-ba2f-d31fd230623d@suse.de>
Date: Tue, 11 Jul 2023 08:19:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Christoph Hellwig <hch@lst.de>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230707094028.107898-1-hch@lst.de> <ZKx2jVONy35B0/S1@google.com>
 <20230711050101.GA19128@lst.de>
From: Hannes Reinecke <hare@suse.de>
In-Reply-To: <20230711050101.GA19128@lst.de>
X-Spam-Score: -4.5 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 7/11/23 07:01, Christoph Hellwig wrote: > I think that's
 because it doesn't look at sbi->s_ndevs in > destroy_device_list. Let's try
 the variant below, which also fixes > the buildbot warning for n [...] 
 Content analysis details:   (-4.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [195.135.220.28 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1qJ6jE-0003xV-KO
Subject: Re: [f2fs-dev] [PATCH] f2fs: don't reopen the main block device in
 f2fs_scan_devices
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
Cc: linux-block@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNy8xMS8yMyAwNzowMSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gSSB0aGluayB0aGF0
J3MgYmVjYXVzZSBpdCBkb2Vzbid0IGxvb2sgYXQgc2JpLT5zX25kZXZzIGluCj4gZGVzdHJveV9k
ZXZpY2VfbGlzdC4gIExldCdzIHRyeSB0aGUgdmFyaWFudCBiZWxvdywgd2hpY2ggYWxzbyBmaXhl
cwo+IHRoZSBidWlsZGJvdCB3YXJuaW5nIGZvciBub24tem9uZWQgY29uZmlnZnM6Cj4gCj4gLS0t
Cj4gIEZyb20gNjQ1ZDhkY2VhYTk3YjZlZTczYmUwNjc0OTViMTExYjE1YjE4NzQ5OCBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKPiBGcm9tOiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4K
PiBEYXRlOiBGcmksIDcgSnVsIDIwMjMgMTA6MzE6NDkgKzAyMDAKPiBTdWJqZWN0OiBmMmZzOiBk
b24ndCByZW9wZW4gdGhlIG1haW4gYmxvY2sgZGV2aWNlIGluIGYyZnNfc2Nhbl9kZXZpY2VzCj4g
Cj4gZjJmc19zY2FuX2RldmljZXMgcmVvcGVucyB0aGUgbWFpbiBkZXZpY2Ugc2luY2UgdGhlIHZl
cnkgYmVnaW5uaW5nLCB3aGljaAo+IGhhcyBhbHdheXMgYmVlbiB1c2VsZXNzLCBhbmQgYWxzbyBt
ZWFucyB0aGF0IHdlIGRvbid0IHBhc3MgdGhlIHJpZ2h0Cj4gaG9sZGVyIGZvciB0aGUgcmVvcGVu
LCB3aGljaCBub3cgbGVhZHMgdG8gYSB3YXJuaW5nIGFzIHRoZSBjb3JlIHN1cGVyLmMKPiBob2xk
ZXIgb3BzIGFyZW4ndCBwYXNzZWQgaW4gZm9yIHRoZSByZW9wZW4uCj4gCj4gRml4ZXM6IDNjNjJi
ZTE3ZDRmNSAoImYyZnM6IHN1cHBvcnQgbXVsdGlwbGUgZGV2aWNlcyIpCj4gRml4ZXM6IDA3MThh
ZmQ0N2Y3MCAoImJsb2NrOiBpbnRyb2R1Y2UgaG9sZGVyIG9wcyIpCj4gU2lnbmVkLW9mZi1ieTog
Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gLS0tCj4gICBibG9jay9ibGstZmx1c2gu
YyB8ICAyICstCj4gICBmcy9mMmZzL3N1cGVyLmMgICB8IDIwICsrKysrKysrLS0tLS0tLS0tLS0t
Cj4gICAyIGZpbGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvc3VwZXIuYyBiL2ZzL2YyZnMvc3VwZXIuYwo+IGluZGV4
IGNhMzExNjNkYTAwYTU1Li4zMDg4M2JlYjc1MGE1OSAxMDA2NDQKPiAtLS0gYS9mcy9mMmZzL3N1
cGVyLmMKPiArKysgYi9mcy9mMmZzL3N1cGVyLmMKPiBAQCAtMTU2MSw3ICsxNTYxLDggQEAgc3Rh
dGljIHZvaWQgZGVzdHJveV9kZXZpY2VfbGlzdChzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmkpCj4g
ICAJaW50IGk7Cj4gICAKPiAgIAlmb3IgKGkgPSAwOyBpIDwgc2JpLT5zX25kZXZzOyBpKyspIHsK
PiAtCQlibGtkZXZfcHV0KEZERVYoaSkuYmRldiwgc2JpLT5zYi0+c190eXBlKTsKPiArCQlpZiAo
aSA+IDApCj4gKwkJCWJsa2Rldl9wdXQoRkRFVihpKS5iZGV2LCBzYmktPnNiLT5zX3R5cGUpOwpZ
b3UgY291bGQgaGF2ZSBzdGFydGVkIHRoZSBsb29wIGF0ICcxJywgYW5kIGF2b2lkIHRoZSBjdXJp
b3VzICdpZicgCmNsYXVzZSAuLi4KCj4gICAjaWZkZWYgQ09ORklHX0JMS19ERVZfWk9ORUQKPiAg
IAkJa3ZmcmVlKEZERVYoaSkuYmxrel9zZXEpOwo+ICAgI2VuZGlmCj4gQEAgLTQxOTAsMTYgKzQx
OTEsMTIgQEAgc3RhdGljIGludCBmMmZzX3NjYW5fZGV2aWNlcyhzdHJ1Y3QgZjJmc19zYl9pbmZv
ICpzYmkpCj4gICAJc2JpLT5hbGlnbmVkX2Jsa3NpemUgPSB0cnVlOwo+ICAgCj4gICAJZm9yIChp
ID0gMDsgaSA8IG1heF9kZXZpY2VzOyBpKyspIHsKPiAtCj4gLQkJaWYgKGkgPiAwICYmICFSREVW
KGkpLnBhdGhbMF0pCj4gKwkJaWYgKGkgPT0gMCkKPiArCQkJRkRFVigwKS5iZGV2ID0gc2JpLT5z
Yi0+c19iZGV2Owo+ICsJCWVsc2UgaWYgKCFSREVWKGkpLnBhdGhbMF0pCj4gICAJCQlicmVhazsK
PiAgIAo+IC0JCWlmIChtYXhfZGV2aWNlcyA9PSAxKSB7Cj4gLQkJCS8qIFNpbmdsZSB6b25lZCBi
bG9jayBkZXZpY2UgbW91bnQgKi8KPiAtCQkJRkRFVigwKS5iZGV2ID0KPiAtCQkJCWJsa2Rldl9n
ZXRfYnlfZGV2KHNiaS0+c2ItPnNfYmRldi0+YmRfZGV2LCBtb2RlLAo+IC0JCQkJCQkgIHNiaS0+
c2ItPnNfdHlwZSwgTlVMTCk7Cj4gLQkJfSBlbHNlIHsKPiArCQlpZiAobWF4X2RldmljZXMgPiAx
KSB7Cj4gICAJCQkvKiBNdWx0aS1kZXZpY2UgbW91bnQgKi8KPiAgIAkJCW1lbWNweShGREVWKGkp
LnBhdGgsIFJERVYoaSkucGF0aCwgTUFYX1BBVEhfTEVOKTsKPiAgIAkJCUZERVYoaSkudG90YWxf
c2VnbWVudHMgPQpTaW1pbGFyIGhlcmU7IHdvdWxkbid0IGl0IGJlIGJldHRlciB0byB1bnJvbGwg
dGhlIGxvb3AsIGFuZCBoYXZlIHRoZSAKY2hlY2sgZm9yICdtYXhfZGV2aWNlcycgb3V0c2lkZSBv
ZiB0aGUgbG9vcD8KVGhlbiB0aGUgbG9vcCBjYW4gYmUgY29kZWQgZm9yIHRoZSAnbWF4X2Rldmlj
ZSA+IDEnIGNhc2Ugb25seSwgYW5kIGF2b2lkIAphbGwgdGhlIHNwZWNpYWwgY2FzaW5nIGluIHRo
ZSBsb29wIC4uLgoKPiBAQCAtNDIxNSwxMCArNDIxMiw5IEBAIHN0YXRpYyBpbnQgZjJmc19zY2Fu
X2RldmljZXMoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+ICAgCQkJCUZERVYoaSkuZW5kX2Js
ayA9IEZERVYoaSkuc3RhcnRfYmxrICsKPiAgIAkJCQkJKEZERVYoaSkudG90YWxfc2VnbWVudHMg
PDwKPiAgIAkJCQkJc2JpLT5sb2dfYmxvY2tzX3Blcl9zZWcpIC0gMTsKPiArCQkJCUZERVYoaSku
YmRldiA9IGJsa2Rldl9nZXRfYnlfcGF0aChGREVWKGkpLnBhdGgsCj4gKwkJCQkJbW9kZSwgc2Jp
LT5zYi0+c190eXBlLCBOVUxMKTsKPiAgIAkJCX0KPiAtCQkJRkRFVihpKS5iZGV2ID0gYmxrZGV2
X2dldF9ieV9wYXRoKEZERVYoaSkucGF0aCwgbW9kZSwKPiAtCQkJCQkJCSAgc2JpLT5zYi0+c190
eXBlLAo+IC0JCQkJCQkJICBOVUxMKTsKPiAgIAkJfQo+ICAgCQlpZiAoSVNfRVJSKEZERVYoaSku
YmRldikpCj4gICAJCQlyZXR1cm4gUFRSX0VSUihGREVWKGkpLmJkZXYpOwoKQ2hlZXJzLAoKSGFu
bmVzCi0tIApEci4gSGFubmVzIFJlaW5lY2tlICAgICAgICAgICAgICAgIEtlcm5lbCBTdG9yYWdl
IEFyY2hpdGVjdApoYXJlQHN1c2UuZGUgICAgICAgICAgICAgICAgICAgICAgICAgICAgICArNDkg
OTExIDc0MDUzIDY4OApTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHbWJILCBNYXhmZWxkc3RyLiA1
LCA5MDQwOSBOw7xybmJlcmcKSFJCIDM2ODA5IChBRyBOw7xybmJlcmcpLCBHZXNjaMOkZnRzZsO8
aHJlcjogSXZvIFRvdGV2LCBBbmRyZXcKTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgTWFydGplIEJv
dWRpZW4gTW9lcm1hbgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxp
c3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9s
aXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
