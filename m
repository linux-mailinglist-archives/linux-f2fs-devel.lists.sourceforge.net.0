Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEBC714994
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 May 2023 14:42:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q3cCW-0006Ae-Ql;
	Mon, 29 May 2023 12:42:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wubo.oduw@gmail.com>) id 1q3cCU-0006AX-Tn
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 May 2023 12:42:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JiOdIBLVGKvtg/C9FdawapFJuTlHE4wukHl5zvYnmt0=; b=flety86pfqqlDXNVyD3DBp2HHh
 lJCFyDg2iBK+a4Bsa4a6uN2Q6HwqctqYrjwjhbgpGI4iU/4KHWx4r01EtMg2xcb5B5QcMAfEewWdn
 Cu5qktSINiOkSNmmJu3elGEV4fXuTLki9U/Ze+5EnN92PEti/V6AWroC4/P7cGNcxSHE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JiOdIBLVGKvtg/C9FdawapFJuTlHE4wukHl5zvYnmt0=; b=RmRa86oWazDBj08ag7RmUfjpEG
 pnDpzi6fMDxWIIwDADkgDf9ll6rQrPJGMzoUvAvTdqafdeyb7C91Kh24OYoUPjNvj9uOhTU+z4Sbg
 ZGRcrkcSaps8WOw6hhHvp0gxTo7iNAqER7Za6MRBxkaFcklzwzjjtdmLVSHK1xqoesj8=;
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1q3cCR-005kCq-Ty for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 May 2023 12:42:15 +0000
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-25687f44385so738061a91.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 May 2023 05:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685364126; x=1687956126;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JiOdIBLVGKvtg/C9FdawapFJuTlHE4wukHl5zvYnmt0=;
 b=KoZjYFt8IeTHfSyrqPFZSa2kBfiEgm88FaOSQiqyWvo4Du1M1T/UCKv3f7q3Y3fRH9
 0hSlqo/xxtsbeeyuXQDZqE8Wwr39mDSe3UWVmA7ETWldwpSmTnVAYGv3eryTSfx4ONG9
 9rbu/LcPqp8kKiYfb2m/3tYvRQTUtJ1ez2CM/rC+N3BtoLZe1elHiPYEBwMIMVYHZ0e5
 WDh2OFMmp6xR7HE6XqmvWhp6lG9HyovzhiopwIZWbI+40xuRAqUUKdJ4QVEY/O1tv7LU
 6j7ioRADhw/XeL+CsgGCY0YESNewpEpv7kqW93HejJ3QGnuozMRLj2fmCu2m1J1TRtiJ
 uRuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685364126; x=1687956126;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JiOdIBLVGKvtg/C9FdawapFJuTlHE4wukHl5zvYnmt0=;
 b=W9XfnLzV580NqDFFCTcrTOx29qTLBlPuq7O9tNrgrWk4yuKv/+4AWw5klIhSzULaTm
 2UKqEBtTOZCUSrizHQlCWsPoDLTZp2t0twGSq0W1ZVZ/AUhCQktCahGypCqkcguPi2ei
 UhclkqRmFOvmYWZ1s1JnqGSWgCDfUKOEoRixkBW7ppg/97H/wUbbiSCegjNK/ZMgqgWl
 9ck2eqqu6kMSz3N0YvcduaGOVTjvP4C4azmNkok/yLUDa+kBhXwXwCjhYpVhX08Df9e0
 e1pV0Q6/1CBjmBxzgSoDaxf7LBExoei/BmFtI3lUg4suhJzUCApGcGzear3xX4S0FImL
 7WHQ==
X-Gm-Message-State: AC+VfDwLIQgkNTXre+wKO0vehUTAFpjZ25wURyNbGnaWXKCEzpnZiI8P
 LEgcDRwmmz1qknzFjECUURk=
X-Google-Smtp-Source: ACHHUZ5oKbIWcicO0Um2gUZ+e2poTfUAHet7wZPuLSCWfe9wgyKiSyhvz1qDtwgG5laJtek2WuJYsw==
X-Received: by 2002:a17:90a:2b0a:b0:255:6c22:5ccb with SMTP id
 x10-20020a17090a2b0a00b002556c225ccbmr9976113pjc.7.1685364126144; 
 Mon, 29 May 2023 05:42:06 -0700 (PDT)
Received: from [192.168.50.227] ([116.80.41.155])
 by smtp.gmail.com with ESMTPSA id
 f5-20020a17090ace0500b00253305f36c4sm3841935pju.18.2023.05.29.05.42.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 May 2023 05:42:05 -0700 (PDT)
Message-ID: <6ad8c3c7-a3e0-1a52-5a10-6b535b1ed7d3@gmail.com>
Date: Mon, 29 May 2023 20:41:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-US
To: Chao Yu <chao@kernel.org>, Wu Bo <bo.wu@vivo.com>
References: <2bb05623-9438-3b68-6ac8-4294f9676ff6@kernel.org>
 <20230529041337.36741-1-bo.wu@vivo.com>
 <0c15c662-903c-3504-d502-72f0a3b70cbf@kernel.org>
From: Wu Bo <wubo.oduw@gmail.com>
In-Reply-To: <0c15c662-903c-3504-d502-72f0a3b70cbf@kernel.org>
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/5/29 18:18, Chao Yu wrote: > On 2023/5/29 12:13, Wu
 Bo wrote: >> On Sat, May 27, 2023 at 09:01:41AM +0800, Chao Yu wrote: >>>
 On 2023/5/27 1:21, Jaegeuk Kim wrote: >>>> On 05/24, Wu Bo wrote: [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.45 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [wubo.oduw[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.45 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1q3cCR-005kCq-Ty
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: fix args passed to
 trace_f2fs_lookup_end
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Ck9uIDIwMjMvNS8yOSAxODoxOCwgQ2hhbyBZdSB3cm90ZToKPiBPbiAyMDIzLzUvMjkgMTI6MTMs
IFd1IEJvIHdyb3RlOgo+PiBPbiBTYXQsIE1heSAyNywgMjAyMyBhdCAwOTowMTo0MUFNICswODAw
LCBDaGFvIFl1IHdyb3RlOgo+Pj4gT24gMjAyMy81LzI3IDE6MjEsIEphZWdldWsgS2ltIHdyb3Rl
Ogo+Pj4+IE9uIDA1LzI0LCBXdSBCbyB3cm90ZToKPj4+Pj4gVGhlIE5VTEwgcmV0dXJuIG9mICdk
X3NwbGljZV9hbGlhcycgZG9zZW4ndCBtZWFuIGVycm9yLgo+Pj4+Pgo+Pj4+PiBTaWduZWQtb2Zm
LWJ5OiBXdSBCbyA8Ym8ud3VAdml2by5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiDCoMKgIGZzL2YyZnMv
bmFtZWkuYyB8IDIgKy0KPj4+Pj4gwqDCoCAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDEgZGVsZXRpb24oLSkKPj4+Pj4KPj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvbmFtZWkuYyBi
L2ZzL2YyZnMvbmFtZWkuYwo+Pj4+PiBpbmRleCA3N2E3MTI3NmVjYjEuLmU1YTNlMzljZTkwYyAx
MDA2NDQKPj4+Pj4gLS0tIGEvZnMvZjJmcy9uYW1laS5jCj4+Pj4+ICsrKyBiL2ZzL2YyZnMvbmFt
ZWkuYwo+Pj4+PiBAQCAtNTc3LDcgKzU3Nyw3IEBAIHN0YXRpYyBzdHJ1Y3QgZGVudHJ5ICpmMmZz
X2xvb2t1cChzdHJ1Y3QgaW5vZGUgCj4+Pj4+ICpkaXIsIHN0cnVjdCBkZW50cnkgKmRlbnRyeSwK
Pj4+Pj4gwqDCoCAjZW5kaWYKPj4+Pj4gwqDCoMKgwqDCoMKgIG5ldyA9IGMoaW5vZGUsIGRlbnRy
eSk7Cj4+Pj4+IMKgwqDCoMKgwqDCoCBlcnIgPSBQVFJfRVJSX09SX1pFUk8obmV3KTsKPj4+Pj4g
LcKgwqDCoCB0cmFjZV9mMmZzX2xvb2t1cF9lbmQoZGlyLCBkZW50cnksIGlubywgIW5ldyA/IC1F
Tk9FTlQgOiBlcnIpOwo+Pj4+PiArwqDCoMKgIHRyYWNlX2YyZnNfbG9va3VwX2VuZChkaXIsIG5l
dyA/IG5ldyA6IGRlbnRyeSwgaW5vLCBlcnIpOwo+Pj4+Cj4+Pj4gU2hvdWxkbid0IGdpdmUgYW4g
ZXJyb3IgcG9pbnRlciB0byB0aGUgZGVudHJ5IGZpZWxkLgo+Pj4+Cj4+Pj4gSG93IGFib3V0IGp1
c3QgZ2l2aW5nIHRoZSBlcnI/Cj4+Pj4KPj4+PiAtwqDCoMKgwqDCoMKgIGVyciA9IFBUUl9FUlJf
T1JfWkVSTyhuZXcpOwo+Pj4+IC3CoMKgwqDCoMKgwqAgdHJhY2VfZjJmc19sb29rdXBfZW5kKGRp
ciwgZGVudHJ5LCBpbm8sICFuZXcgPyAtRU5PRU5UIDogZXJyKTsKPj4+PiArwqDCoMKgwqDCoMKg
IHRyYWNlX2YyZnNfbG9va3VwX2VuZChkaXIsIGRlbnRyeSwgaW5vLCBQVFJfRVJSX09SX1pFUk8o
bmV3KSk7Cj4+Pgo+Pj4gc3RhdGljIGlubGluZSBpbnQgX19tdXN0X2NoZWNrIFBUUl9FUlJfT1Jf
WkVSTyhfX2ZvcmNlIGNvbnN0IHZvaWQgKnB0cikKPj4+IHsKPj4+IMKgwqDCoMKgaWYgKElTX0VS
UihwdHIpKQo+Pj4gwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUUl9FUlIocHRyKTsKPj4+IMKgwqDC
oMKgZWxzZQo+Pj4gwqDCoMKgwqDCoMKgwqAgcmV0dXJuIDA7Cj4+PiB9Cj4+Pgo+Pj4gRm9yIGJl
bG93IHR3byBjYXNlcywgUFRSX0VSUl9PUl9aRVJPKG5ldykgd2lsbCByZXR1cm4gemVybzoKPj4+
IGEpIGYyZnNfbG9va3VwIGZvdW5kIGV4aXN0ZWQgZGVudHJ5Cj4+PiBiKSBmMmZzX2xvb2t1cCBk
aWRuJ3QgZmluZCBleGlzdGVkIGRlbnRyeSAoLUVOT0VOVCBjYXNlKQo+Pj4KPj4+IFNvIGluIGJl
bG93IGNvbW1pdCwgSSBwYXNzZWQgLUVOT0VOVCB0byB0cmFjZXBvaW50IGZvciBjYXNlIGIpLCBz
byAKPj4+IHdlIGNhbgo+Pj4gZGlzdGluZ3Vpc2ggcmVzdWx0IG9mIGYyZnNfbG9va3VwIGluIHRy
YWNlcG9pbnQsIGFjdHVhbGx5LCAtRU5PRU5UIAo+Pj4gaXMgZXhwZWN0ZWQKPj4+IHZhbHVlIHdo
ZW4gd2UgY3JlYXRlIGEgbmV3IGZpbGUvZGlyZWN0b3J5Lgo+Pj4KPj4+IENvbW1pdCA4NDU5N2Ix
ZjliMDUgKCJmMmZzOiBmaXggd3JvbmcgdmFsdWUgb2YgdHJhY2Vwb2ludCBwYXJhbWV0ZXIiKQo+
PiBJIGNhbiBzZWUgdGhpcyBjb21taXQgaXMgdHJ5IHRvIGRpc3Rpbmd1aXNoIHRoZSBkZW50cnkg
bm90IGV4aXN0ZWQgY2FzZS4KPj4gQnV0IGEgbm9ybWFsIGNhc2Ugd2hpY2ggZGVudHJ5IGlzIGV4
YWN0bHkgZm91bmQgd2lsbCBhbHNvIGdvIHRocm91Z2gKPj4gJ2Rfc3BsaWNlX2FsaWFzJywgYW5k
IGl0cyByZXR1cm4gaXMgYWxzbyBOVUxMLiBUaGlzIG1ha2VzIHRoZSAKPj4gdHJhY2Vwb2ludCBh
bHdheXMKPj4gcHJpbnQgJ2VycjotMicgbGlrZSB0aGUgZm9sbG93aW5nOgo+PiDCoMKgwqDCoMKg
wqAgbHMtMTE2NzbCoMKgIFswMDRdIC4uLi4gMzI5MjgxLjk0MzExODogZjJmc19sb29rdXBfZW5k
OiBkZXYgPSAKPj4gKDI1NCwzOSksIHBpbm8gPSA0NDUxLCBuYW1lOkFsYXJtcywgaW5vOjcwOTMs
IGVycjotMgo+PiDCoMKgwqDCoMKgwqAgbHMtMTE2NzbCoMKgIFswMDRdIC4uLi4gMzI5MjgxLjk0
MzE0NTogZjJmc19sb29rdXBfZW5kOiBkZXYgPSAKPj4gKDI1NCwzOSksIHBpbm8gPSA0NDUxLCBu
YW1lOk5vdGlmaWNhdGlvbnMsIGlubzo3MDk0LCBlcnI6LTIKPj4gwqDCoMKgwqDCoMKgIGxzLTEx
Njc2wqDCoCBbMDA0XSAuLi4uIDMyOTI4MS45NDMxNzI6IGYyZnNfbG9va3VwX2VuZDogZGV2ID0g
Cj4+ICgyNTQsMzkpLCBwaW5vID0gNDQ1MSwgbmFtZTpQaWN0dXJlcywgaW5vOjcwOTUsIGVycjot
Mgo+PiBFdmVuIHRoZXNlIGxvb2t1cCBhcmUgYWNjdHVhbGx5IHN1Y2Nlc3NmdWwsIHRoaXMgaXMg
YSBiaXQgc3RyYW5nZS4KPgo+IEFoLCBJIG1pc3VuZGVyc3RhbmQgcmV0dXJuIHZhbHVlJ3MgbWVh
bmluZyBvZiAubG9va3VwLgo+Cj4gU28sIGhvdyBhYm91dCB0aGlzPyBpdCBvbmx5IHVwZGF0ZSBl
cnIgaWYgZF9zcGxpY2VfYWxpYXMoKSByZXR1cm5zIGEgCj4gbmVnYXRpdmUKPiB2YWx1ZT8KPgo+
IGlmIChJU19FUlIobmV3KSkKPiDCoMKgwqDCoGVyciA9IFBUUl9FUlIobmV3KTsKPiB0cmFjZV9m
MmZzX2xvb2t1cF9lbmQoZGlyLCBuZXcgPyBuZXcgOiBkZW50cnksIGlubywgZXJyKTsKPgo+IFRo
YW5rcywKPgpZZXMsIHRoaXMgd2lsbCBiZSBiZXR0ZXIuCgo+Pj4KPj4+Pgo+Pj4+Cj4+Pj4+IMKg
wqDCoMKgwqDCoCByZXR1cm4gbmV3Owo+Pj4+PiDCoMKgIG91dF9pcHV0Ogo+Pj4+PiDCoMKgwqDC
oMKgwqAgaXB1dChpbm9kZSk7Cj4+Pj4+IC0tIAo+Pj4+PiAyLjM1LjMKPj4+Cj4+Pgo+Pj4gX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4+IExpbnV4LWYy
ZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZv
cmdlLm5ldAo+Pj4gaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8v
bGludXgtZjJmcy1kZXZlbAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3Rz
L2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
