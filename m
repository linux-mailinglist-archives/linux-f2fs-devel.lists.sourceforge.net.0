Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE3F112447
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Dec 2019 09:17:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1icPqA-0007p6-QW; Wed, 04 Dec 2019 08:16:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <javier@javigon.com>) id 1icPq9-0007oy-39
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Dec 2019 08:16:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Transfer-Encoding:Content-Type:
 MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A3EjttU8t1DCaxtv3QmwTcUqJUdcBQEbi7gg5HzyUUg=; b=ce6YQ4Gqjms7+tiqClzc3o0x76
 aCGHE2R/3UnNDD9yAPYO2Epbj6CcmfF0LRUfLHXKi0Qpv8uRtM1PY2wb+Bi/Fzw9GWtqGaSz401ZT
 DQO7MBP87kx4FNC953yOu9kgse5n5QlbSigUV2Jhx9Kna/mISVAAYzsXYw8u9rKpruyg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Transfer-Encoding:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A3EjttU8t1DCaxtv3QmwTcUqJUdcBQEbi7gg5HzyUUg=; b=mvLyirnkNt9EfoHhLRmnsF036v
 4yqkZUJQi3kI/8xLkxEAhnnZ8tAAtpLLgJUAmYPwK+09g9TrfZcepb0e0yS903KutZc9+X3Z1cV5U
 WlVttzeI1COz8OKr+dNwYHIx09p9z5mzjBReoIqc+HbZ9dQuUtkjG4yM//F4MM94J9AQ=;
Received: from mail-wr1-f68.google.com ([209.85.221.68])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1icPq6-007UgN-TO
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Dec 2019 08:16:53 +0000
Received: by mail-wr1-f68.google.com with SMTP id w15so7390367wru.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 04 Dec 2019 00:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=javigon-com.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=A3EjttU8t1DCaxtv3QmwTcUqJUdcBQEbi7gg5HzyUUg=;
 b=XC4SD8Nm/CJsVX2cNdH7LMWWN1jdVbSSfwd5CoVNQMApFZ+METGkcdcOx2Hm/HnLn7
 p5o53EPcTISnscB7YQ3Y9dglaKVNaQnve9q4h2ZwxJQR/MdFfdC7o6AjnJqXsi6eElZb
 ejtUwfloOEdNVnXzKDxOgjYzLHhO7l8WMX0SUBahb/mhtCnl7eci/+AVJn47kzjbCiU1
 0fQJ7xnwFY8h0qKjFkKbjGbtsPtZdZVX/M6S6QuBjuls6n7ouePAkdN4MP43579p06dk
 9gEW0OmWqbL+XeR8HcAhI4UJJo3BdbQW3STwibFTMTinesHQFa0m1amtrRRmaOOo2Cs5
 LJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=A3EjttU8t1DCaxtv3QmwTcUqJUdcBQEbi7gg5HzyUUg=;
 b=BIbvYaA6wr7+hPbIdBaqZykj9y9hDXMm8WaGvhqr11ZYXYkG+NlN3pE7CQg86hodAr
 D/obk8xt0ef8H5vagX2Xrgt41OdP7lkVgWfbVwZoG7iwBcn94YE87iRirbo5+91QH+XG
 WiaHf0IM4R5ruHUDSFHF4RwTXEQTCz2Dnq5owaBkgT44QKAxUK8SK3i+qCdM29x6tO0X
 dLPv/R6cYS3ssfASVkqWrWck7WfQsBWJcZXvymeGkHHb+KF26qql/7pECq/D/K+IOEmG
 X+DS4vGGpdt0JvOT4y5xLG5YnQlUbkh+aetqLZ8leo31lnNQfHzpiDcJ7zwrNwF7WPWA
 jfWQ==
X-Gm-Message-State: APjAAAVMlz3Zq8xegM3kf1mgeHRuCOamwmFKv55az1+zJw5sRAdlJB4u
 7/liNz6pVCXO+FBY6eoEQzMb9Q==
X-Google-Smtp-Source: APXvYqxhYn0nwnicejVfpeVuMHpPYxIZfRC6Yv6j4V8Gy/5U1lyQHKa9KaXdhFUr/j++Rc1R50CEyg==
X-Received: by 2002:adf:dd46:: with SMTP id u6mr2599078wrm.13.1575447404312;
 Wed, 04 Dec 2019 00:16:44 -0800 (PST)
Received: from localhost ([194.62.217.57])
 by smtp.gmail.com with ESMTPSA id g21sm8286034wrb.48.2019.12.04.00.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 00:16:43 -0800 (PST)
Date: Wed, 4 Dec 2019 09:16:42 +0100
From: Javier Gonzalez <javier@javigon.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Message-ID: <20191204081642.gnd55byogedrhfoz@MacBook-Pro.gnusmas>
References: <20191126075719.1046485-1-damien.lemoal@wdc.com>
 <20191126234428.GB20652@jaegeuk-macbookpro.roam.corp.google.com>
 <20191203173308.GA41093@jaegeuk-macbookpro.roam.corp.google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191203173308.GA41093@jaegeuk-macbookpro.roam.corp.google.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: javigon.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.221.68 listed in list.dnswl.org]
 -0.1 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.221.68 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1icPq6-007UgN-TO
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: Fix direct IO handling
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
Cc: Damien Le Moal <damien.lemoal@wdc.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMDMuMTIuMjAxOSAwOTozMywgSmFlZ2V1ayBLaW0gd3JvdGU6Cj5UaGFuayB5b3UgZm9yIGNo
ZWNraW5nIHRoZSBwYXRjaC4KPkkgZm91bmQgc29tZSByZWdyZXNzaW9ucyBpbiB4ZnN0ZXN0cywg
c28gd2FudCB0byBmb2xsb3cgdGhlIERhbWllbidzIG9uZQo+bGlrZSBiZWxvdy4KPgo+VGhhbmtz
LAo+Cj49PT0KPkZyb20gOWRmNmYwOWUzYTA5ZWQ4MDRhYmE0YjU2ZmY3Y2Q5NTI0YzAwMmU2OSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKPkZyb206IEphZWdldWsgS2ltIDxqYWVnZXVrQGtlcm5l
bC5vcmc+Cj5EYXRlOiBUdWUsIDI2IE5vdiAyMDE5IDE1OjAxOjQyIC0wODAwCj5TdWJqZWN0OiBb
UEFUQ0hdIGYyZnM6IHByZWFsbG9jYXRlIERJTyBibG9ja3Mgd2hlbiBmb3JjaW5nIGJ1ZmZlcmVk
X2lvCj4KPlRoZSBwcmV2aW91cyBwcmVhbGxvY2F0aW9uIGFuZCBESU8gZGVjaXNpb24gbGlrZSBi
ZWxvdy4KPgo+ICAgICAgICAgICAgICAgICAgICAgICAgIGFsbG93X291dHBsYWNlX2RpbyAgICAg
ICAgICAgICAgIWFsbG93X291dHBsYWNlX2Rpbwo+ZjJmc19mb3JjZV9idWZmZXJlZF9pbyAgICgq
KSBOb19QcmVhbGxvYyAvIEJ1ZmZlcmVkX0lPICAgUHJlYWxsb2MgLyBCdWZmZXJlZF9JTwo+IWYy
ZnNfZm9yY2VfYnVmZmVyZWRfaW8gIE5vX1ByZWFsbG9jIC8gRElPICAgICAgICAgICAgICAgUHJl
YWxsb2MgLyBESU8KPgo+QnV0LCBKYXZpZXIgcmVwb3J0ZWQgQ2FzZSAoKikgd2hlcmUgem9uZWQg
ZGV2aWNlIGJ5cGFzc2VkIHByZWFsbG9jYXRpb24gYnV0Cj5mZWxsIGJhY2sgdG8gYnVmZmVyZWQg
d3JpdGVzIGluIGYyZnNfZGlyZWN0X0lPKCksIHJlc3VsdGluZyBpbiBzdGFsZSBkYXRhCj5iZWlu
ZyByZWFkLgo+Cj5JbiBvcmRlciB0byBmaXggdGhlIGlzc3VlLCBhY3R1YWxseSB3ZSBuZWVkIHRv
IHByZWFsbG9jYXRlIGJsb2NrcyB3aGVuZXZlcgo+d2UgZmFsbCBiYWNrIHRvIGJ1ZmZlcmVkIElP
IGxpa2UgdGhpcy4gTm8gY2hhbmdlIGlzIG1hZGUgaW4gdGhlIG90aGVyIGNhc2VzLgo+Cj4gICAg
ICAgICAgICAgICAgICAgICAgICAgYWxsb3dfb3V0cGxhY2VfZGlvICAgICAgICAgICAgICAhYWxs
b3dfb3V0cGxhY2VfZGlvCj5mMmZzX2ZvcmNlX2J1ZmZlcmVkX2lvICAgKCopIFByZWFsbG9jIC8g
QnVmZmVyZWRfSU8gICAgICBQcmVhbGxvYyAvIEJ1ZmZlcmVkX0lPCj4hZjJmc19mb3JjZV9idWZm
ZXJlZF9pbyAgTm9fUHJlYWxsb2MgLyBESU8gICAgICAgICAgICAgICBQcmVhbGxvYyAvIERJTwo+
Cj5SZXBvcnRlZC1hbmQtdGVzdGVkLWJ5OiBKYXZpZXIgR29uemFsZXogPGphdmllckBqYXZpZ29u
LmNvbT4KPlNpZ25lZC1vZmYtYnk6IERhbWllbiBMZSBNb2FsIDxkYW1pZW4ubGVtb2FsQHdkYy5j
b20+Cj5UZXN0ZWQtYnk6IFNoaW4naWNoaXJvIEthd2FzYWtpIDxzaGluaWNoaXJvLmthd2FzYWtp
QHdkYy5jb20+Cj5TaWduZWQtb2ZmLWJ5OiBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3Jn
Pgo+LS0tCj4gZnMvZjJmcy9kYXRhLmMgfCAxMyAtLS0tLS0tLS0tLS0tCj4gZnMvZjJmcy9maWxl
LmMgfCA0MyArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tCj4gMiBm
aWxlcyBjaGFuZ2VkLCAzMyBpbnNlcnRpb25zKCspLCAyMyBkZWxldGlvbnMoLSkKPgo+ZGlmZiAt
LWdpdCBhL2ZzL2YyZnMvZGF0YS5jIGIvZnMvZjJmcy9kYXRhLmMKPmluZGV4IGEwMzRjZDBjZTAy
MS4uZmM0MGE3MmY3ODI3IDEwMDY0NAo+LS0tIGEvZnMvZjJmcy9kYXRhLmMKPisrKyBiL2ZzL2Yy
ZnMvZGF0YS5jCj5AQCAtMTE4MCwxOSArMTE4MCw2IEBAIGludCBmMmZzX3ByZWFsbG9jYXRlX2Js
b2NrcyhzdHJ1Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCBpb3ZfaXRlciAqZnJvbSkKPiAJaW50IGVy
ciA9IDA7Cj4gCWJvb2wgZGlyZWN0X2lvID0gaW9jYi0+a2lfZmxhZ3MgJiBJT0NCX0RJUkVDVDsK
Pgo+LQkvKiBjb252ZXJ0IGlubGluZSBkYXRhIGZvciBEaXJlY3QgSS9PKi8KPi0JaWYgKGRpcmVj
dF9pbykgewo+LQkJZXJyID0gZjJmc19jb252ZXJ0X2lubGluZV9pbm9kZShpbm9kZSk7Cj4tCQlp
ZiAoZXJyKQo+LQkJCXJldHVybiBlcnI7Cj4tCX0KPi0KPi0JaWYgKGRpcmVjdF9pbyAmJiBhbGxv
d19vdXRwbGFjZV9kaW8oaW5vZGUsIGlvY2IsIGZyb20pKQo+LQkJcmV0dXJuIDA7Cj4tCj4tCWlm
IChpc19pbm9kZV9mbGFnX3NldChpbm9kZSwgRklfTk9fUFJFQUxMT0MpKQo+LQkJcmV0dXJuIDA7
Cj4tCj4gCW1hcC5tX2xibGsgPSBGMkZTX0JMS19BTElHTihpb2NiLT5raV9wb3MpOwo+IAltYXAu
bV9sZW4gPSBGMkZTX0JZVEVTX1RPX0JMSyhpb2NiLT5raV9wb3MgKyBpb3ZfaXRlcl9jb3VudChm
cm9tKSk7Cj4gCWlmIChtYXAubV9sZW4gPiBtYXAubV9sYmxrKQo+ZGlmZiAtLWdpdCBhL2ZzL2Yy
ZnMvZmlsZS5jIGIvZnMvZjJmcy9maWxlLmMKPmluZGV4IGMwNTYwZDYyZGJlZS4uMGUxYjEyYTRh
NGQ2IDEwMDY0NAo+LS0tIGEvZnMvZjJmcy9maWxlLmMKPisrKyBiL2ZzL2YyZnMvZmlsZS5jCj5A
QCAtMzM4NiwxOCArMzM4Niw0MSBAQCBzdGF0aWMgc3NpemVfdCBmMmZzX2ZpbGVfd3JpdGVfaXRl
cihzdHJ1Y3Qga2lvY2IgKmlvY2IsIHN0cnVjdCBpb3ZfaXRlciAqZnJvbSkKPiAJCQkJcmV0ID0g
LUVBR0FJTjsKPiAJCQkJZ290byBvdXQ7Cj4gCQkJfQo+LQkJfSBlbHNlIHsKPi0JCQlwcmVhbGxv
Y2F0ZWQgPSB0cnVlOwo+LQkJCXRhcmdldF9zaXplID0gaW9jYi0+a2lfcG9zICsgaW92X2l0ZXJf
Y291bnQoZnJvbSk7Cj4rCQkJZ290byB3cml0ZTsKPisJCX0KPgo+LQkJCWVyciA9IGYyZnNfcHJl
YWxsb2NhdGVfYmxvY2tzKGlvY2IsIGZyb20pOwo+LQkJCWlmIChlcnIpIHsKPi0JCQkJY2xlYXJf
aW5vZGVfZmxhZyhpbm9kZSwgRklfTk9fUFJFQUxMT0MpOwo+LQkJCQlpbm9kZV91bmxvY2soaW5v
ZGUpOwo+LQkJCQlyZXQgPSBlcnI7Cj4tCQkJCWdvdG8gb3V0Owo+LQkJCX0KPisJCWlmIChpc19p
bm9kZV9mbGFnX3NldChpbm9kZSwgRklfTk9fUFJFQUxMT0MpKQo+KwkJCWdvdG8gd3JpdGU7Cj4r
Cj4rCQlpZiAoaW9jYi0+a2lfZmxhZ3MgJiBJT0NCX0RJUkVDVCkgewo+KwkJCS8qCj4rCQkJICog
Q29udmVydCBpbmxpbmUgZGF0YSBmb3IgRGlyZWN0IEkvTyBiZWZvcmUgZW50ZXJpbmcKPisJCQkg
KiBmMmZzX2RpcmVjdF9JTygpLgo+KwkJCSAqLwo+KwkJCWVyciA9IGYyZnNfY29udmVydF9pbmxp
bmVfaW5vZGUoaW5vZGUpOwo+KwkJCWlmIChlcnIpCj4rCQkJCWdvdG8gb3V0X2VycjsKPisJCQkv
Kgo+KwkJCSAqIElmIGZvcmNlX2J1ZmZlcmVfaW8oKSBpcyB0cnVlLCB3ZSBoYXZlIHRvIGFsbG9j
YXRlCj4rCQkJICogYmxvY2tzIGFsbCB0aGUgdGltZSwgc2luY2UgZjJmc19kaXJlY3RfSU8gd2ls
bCBmYWxsCj4rCQkJICogYmFjayB0byBidWZmZXJlZCBJTy4KPisJCQkgKi8KPisJCQlpZiAoIWYy
ZnNfZm9yY2VfYnVmZmVyZWRfaW8oaW5vZGUsIGlvY2IsIGZyb20pICYmCj4rCQkJCQlhbGxvd19v
dXRwbGFjZV9kaW8oaW5vZGUsIGlvY2IsIGZyb20pKQo+KwkJCQlnb3RvIHdyaXRlOwo+KwkJfQo+
KwkJcHJlYWxsb2NhdGVkID0gdHJ1ZTsKPisJCXRhcmdldF9zaXplID0gaW9jYi0+a2lfcG9zICsg
aW92X2l0ZXJfY291bnQoZnJvbSk7Cj4rCj4rCQllcnIgPSBmMmZzX3ByZWFsbG9jYXRlX2Jsb2Nr
cyhpb2NiLCBmcm9tKTsKPisJCWlmIChlcnIpIHsKPitvdXRfZXJyOgo+KwkJCWNsZWFyX2lub2Rl
X2ZsYWcoaW5vZGUsIEZJX05PX1BSRUFMTE9DKTsKPisJCQlpbm9kZV91bmxvY2soaW5vZGUpOwo+
KwkJCXJldCA9IGVycjsKPisJCQlnb3RvIG91dDsKPiAJCX0KPit3cml0ZToKPiAJCXJldCA9IF9f
Z2VuZXJpY19maWxlX3dyaXRlX2l0ZXIoaW9jYiwgZnJvbSk7Cj4gCQljbGVhcl9pbm9kZV9mbGFn
KGlub2RlLCBGSV9OT19QUkVBTExPQyk7Cj4KPi0tIAo+Mi4xOS4wLjYwNS5nMDFkMzcxZjc0MS1n
b29nCj4KPgoKTG9va3MgZ29vZCB0byBtZS4gSXQgYWxzbyBmaXhlcyB0aGUgcHJvYmxlbSB3ZSBz
ZWUgaW4gb3VyIGVuZC4KClJldmlld2VkLWJ5OiBKYXZpZXIgR29uesOhbGV6IDxqYXZpZXJAamF2
aWdvbi5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5z
b3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGlu
Zm8vbGludXgtZjJmcy1kZXZlbAo=
