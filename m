Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F6BA854EE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 11 Apr 2025 09:05:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u38SJ-0002Fi-E4;
	Fri, 11 Apr 2025 07:05:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1u38SH-0002Fc-Sx
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 07:05:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=u5ZCoqPpdXRbW5H3UR1qWIxwzMTmHgJEDM+tf4tbbCQ=; b=BqH1sK4EZpwkbseaZk6tVqZ5QJ
 i6yXxc60otZ3TbngbMBBgIsp0vQjWX5ZRyA8FSCjUMyglSbiq81W93VN7jqVJmNDYvsfyHEsFeyNT
 c0J6WzwJ/OXWrTXOMq3dHJWUW+SW/0vZ0ZpvXfKAq8L8CCPI111gmwP3+aPGahLGb+vs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=u5ZCoqPpdXRbW5H3UR1qWIxwzMTmHgJEDM+tf4tbbCQ=; b=ZjCyC4VU8rIBM9Z6XIuUJhmD+i
 hnz8aXPLQx/uzZSSJSpuFbhfiM2SEohaAGkI+LKf6zsjV9vxbtBQmMNkZBpqKTEMQ+7amE063z/Ug
 t0VcdbddnJM+D0FXbbQCQheJTJvT7fQXUJ4jSrkt14P+SuD+yP7IIqpOYmq2a8QkX/Wk=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1u38S2-0007qc-HA for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 11 Apr 2025 07:05:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id D6D50614BC;
 Fri, 11 Apr 2025 07:05:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DF79C4CEE2;
 Fri, 11 Apr 2025 07:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1744355111;
 bh=In9TX2wj2szMvYBM21Y355ZUZyWkcAlyW3feFZqgku8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Wjfs1MhxtXzrMDALo9s1iwCt2KXU5XVsIGNgsHw9m748g711ZMQaHizU02/Iv0pYV
 FUANuz/hHxkcZBAB9tPleIPWojeUovDjoQNRm6OGESmrNMK9TqBOC9EsOUEAFG7k8T
 DmlLMWtzsOEJGPOFXfbph3hXPETArBOOJ6YB7hom4qoqN2zjL5imMmMgLWQbaqPVfe
 vATpJb70MXM/ob7VxiONhcM+0qzirozb1hXpTBrs5uTgzQIwHfUh6ZQ8iPmH4KP1BH
 Ab3gIZsPss9h1Bt/zztOqzk4DOCeFzsV6XN2hQXaVJoePuCf4qf0UiQEGAQcA0XjtD
 cSrmKnhv9LYTw==
Message-ID: <99dee2ef-d325-47bd-ae6e-c2af15fa6121@kernel.org>
Date: Fri, 11 Apr 2025 15:05:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Juhyung Park <qkrwngud825@gmail.com>
References: <88f281ff9ff9b1fb899c92d6b32f52b7@airmail.cc>
 <CAD14+f1CYZ-OyKg36b_=VPmbBK0LSiieq1pgtXUy4OV2+KrR_g@mail.gmail.com>
 <6e929f78-ab82-434b-a553-6e56d38fcfcc@kernel.org>
 <80e1ae8eddff0536f09ca07e802fb983@airmail.cc>
 <46507541-7e11-435e-b57a-7ed945ddc182@kernel.org>
 <CAD14+f06qKLefutNfLFRC4ZbJ2wcn0r1TL3Qx95B14u-XokyZQ@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAD14+f06qKLefutNfLFRC4ZbJ2wcn0r1TL3Qx95B14u-XokyZQ@mail.gmail.com>
X-Spam-Score: -0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2025/4/11 13:26, Juhyung Park wrote: > Hi Chao. > > Good
 news! > > It appears that by some miracle, @uplinkr managed to dodge all
 odds: > 1. gparted did not perform shrink as they didn't write the [...] 
 Content analysis details:   (-0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [172.105.4.254 listed in bl.score.senderscore.com]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1u38S2-0007qc-HA
Subject: Re: [f2fs-dev] Resize metadata corruption
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
Cc: uplinkr@airmail.cc, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyNS80LzExIDEzOjI2LCBKdWh5dW5nIFBhcmsgd3JvdGU6Cj4gSGkgQ2hhby4KPiAKPiBH
b29kIG5ld3MhCj4gCj4gSXQgYXBwZWFycyB0aGF0IGJ5IHNvbWUgbWlyYWNsZSwgQHVwbGlua3Ig
bWFuYWdlZCB0byBkb2RnZSBhbGwgb2RkczoKPiAxLiBncGFydGVkIGRpZCBub3QgcGVyZm9ybSBz
aHJpbmsgYXMgdGhleSBkaWRuJ3Qgd3JpdGUgdGhlIGZvb2wtcHJvb2YKPiBzaHJpbmsgc2l6ZSBj
YWxjdWxhdGlvbiBjb2RlIHlldAo+IDIuIFRoZSBuZXcgbG9jYXRpb24gd2l0aGluIHRoZSBwYXJ0
aXRpb24gdGFibGUgZGlkIG5vdCBvdmVybGFwIHdpdGgKPiB0aGUgb2xkIHBhcnRpdGlvbgo+IDMu
IFRoZSBmYXVsdHkgZnNjayBydW4gZGlkIG5vdCB0b3VjaCB0aGUgb2xkIHBhcnRpdGlvbidzIGFy
ZWEKPiAKPiBXZSBtYW5hZ2VkIHRvIGdldCB0aGUgb2xkZXIgcGFydGl0aW9uJ3MgbG9jYXRpb24g
dmlhIHRlc3RkaXNrICh3aGljaAo+IGxvb2tzIGZvciBmMmZzIG1hZ2ljIGNvZGUpIGFuZCByZXN0
b3JlIHRoZSBlbnRpcmUgcGFydGl0aW9uLgoKSnVoeXVuZywKCkdyZWF0ISBUaGF0J3MgcmVhbGx5
IGdvb2QgbmV3cy4KCkknbSB0b28gZm9jdXNlZCBvbiB0aGUgYnVnL3JlcGFpciB0byBtaXNzIHRo
YXQgcG9pbnQsIGFueXdheSB0aGF0J3MgcmVhbGx5Cmdvb2QgcG9pbnQgdG8gdHJ5IHRvIHJlc3Rv
cmUgZGF0YSBieSBjaGVja2luZyBhbmQgcmVhZGluZyBmcm9tIG9yaWdpbmFsCmxvY2F0aW9uLgoK
PiAKPiBJIGluc2lzdGVkIHRoYXQgaGUgdXNlIHRoaXMgb3Bwb3J0dW5pdHkgdG8gcmVwcm9kdWNl
IHRoZSBpc3N1ZSBpbiBhCj4gc2FmZSBmYXNoaW9uLCBjb21tdW5pY2F0ZSB3aXRoIHVwc3RyZWFt
IGFuZCBtYWtlIHN1cmUgbm8gb25lIGVsc2UgaGFzCj4gdG8gZ28gdGhyb3VnaCB0aGUgc2FtZSB0
aGluZyAoYWZ0ZXIgYSBmdWxsIGJhY2t1cCwgb2J2aW91c2x5KS4KClRoYW5rcywgaXQncyByZWFs
bHkgaW1wb3J0YW50IGZvciB1cyBhbmQgb3RoZXIgdXNlcy4KCkknbSBwbGFubmluZyB0byBwb3N0
IHJldmVydCBwYXRjaCBmb3IgLWkgc3VwcG9ydCB0b2RheSwgYW5kIGFsc28gSSdtIHRoaW5raW5n
CmFib3V0IGFkZGluZyBhIC1mIG9wdGlvbiB0byBhbGxvdyBkaXN0cm9zIHVzZXIgdG8gZm9yY2lu
ZyBydW5uaW5nIHJlc2l6ZSwgdy9vCi1mIG9wdGlvbiwgbGV0IGl0IG9ubHkgcHJpbnQgY2F1dGlv
biBtZXNzYWdlIG9mIHRoZSByaXNrLgoKPiAKPiBJJ2xsIHdhbGsgaGltIHRocm91Z2ggc2V0dGlu
ZyB1cCBhIGRtLXNuYXBzaG90IGFuZCBnYXRoZXIgdGhlCj4gaW5pdGlhbC9wcm9wZXIgcmVzaXpl
LCBtb3VudCwgZnNjayBsb2cgYWZ0ZXIgdGhlIGJhY2t1cC4KPiAKPiBPbmUgdGhpbmcgdG8gbm90
ZSBoZXJlIGlzIHRoYXQgaGUgc2FpZCB0aGF0IHRoZSB1dGlsaXphdGlvbiB3YXMgdmVyeQo+IGZ1
bGw6IG9ubHkgOEcgbGVmdC4gTWF5YmUgdGhpcyBpcyB0aGUgY29ybmVyIGNhc2UgdGhhdCB3ZSBu
ZWVkIHRvIGxvb2sKPiBvdXQgZm9yPwoKVGhhbmtzIGZvciB0aGUgaGludCwgbGV0IG1lIGNyZWF0
ZSB0ZXN0Y2FzZXMgYmFzZWQgb24gc3VjaCBjb25kaXRpb24gdG8Kc2VlIHdoZXRoZXIgaXQgY2Fu
IHRyaWdnZXIgdGhlIGJ1Zy4KClRoYW5rcywKCj4gCj4gVGhhbmtzLAo+IAo+IE9uIFRodSwgQXBy
IDEwLCAyMDI1IGF0IDEyOjE34oCvQU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3JnPiB3cm90ZToK
Pj4KPj4gT24gNC8xMC8yNSAxNDoxOSwgdXBsaW5rckBhaXJtYWlsLmNjIHdyb3RlOgo+Pj4gT24g
MjAyNS0wNC0xMCAwODo1MiwgQ2hhbyBZdSB3cm90ZToKPj4+PiBJIGNoZWNrZWQgdGhlIGxvZywg
SSBndWVzcyBpdCBhY3R1YWxseSBzZWVtcyBwcmV0dHkgYmFkLi4uIEkgZ3Vlc3Mgd2UKPj4+PiBu
ZWVkIHRvIGZpbmQgb3V0IHRob3NlIGZpbGUgd2hpY2ggaGFzIG5vdCBiZWVuIG1pZ3JhdGVkIGNv
cnJlY3RseSwgYW5kCj4+Pj4gdHJ5IHRvIGNvcnJlY3QgdGhlbSwgbWF5IGJlIHcvIGEgbmV3IHRv
b2wuCj4+Pgo+Pj4gSGVsbG8sCj4+Pgo+Pj4gVGhlIGlzc3VlIGlzIHRoZSBjb3JydXB0IHBhcnRp
dGlvbiBpbiBxdWVzdGlvbiBjb250YWlucyBhIGxvdCBvZiB1bmJhY2t1cHBlZCwgdmFsdWFibGUg
ZGF0YSBmb3IgbWUuIEkgd2Fzbid0IGF3YXJlIG9yIGluZm9ybWVkIG9mIHRoZSBwb3RlbnRpYWwg
aXNzdWVzIHJlc2l6aW5nIG9uIEYyRlMgaGFzICh0aGUgQXJjaFdpa2kgbGlzdGVkIG5vbmUpCj4+
PiBhbmQgYXMgc3VjaCByZWNvdmVyeSBvZiB0aGlzIHBhcnRpdGlvbiBpcyBhIGxpZmVsaW5lIGZv
ciBtZS4KPj4KPj4gU29ycnkgYWJvdXQgdGhpcywgd2Ugc2hvdWxkIGdpdmUgYSBleHBsaWNpdCBj
YXV0aW9uIGFib3V0IHJlc2l6ZSB0b29sCj4+IHVzZS4KPj4KPj4gQnV0IHN0aWxsIEkgZGlkbid0
IGdldCB3aHkgd2UgY2FuIHJ1biBpbnRvIHRoaXMgc2l0dWF0aW9uLCBzaW5jZSBhcyB5b3UKPj4g
c2FpZCwgcmVzaXplIHdlbnQgdGhyb3VnaCBzdWNjZXNzZnVsbHkuIENvdWxkIHlvdSBwbGVhc2Ug
cHJvdmlkZSBtb3JlCj4+IGRldGFpbHMgYWJvdXQgcHJvY2VzcyBvZiByZXNpemU/IFBhcmFtZXRl
cnMgZm9yIHJlc2l6ZT8gTG9ncyB5b3Uga2VwdAo+PiBkdXJpbmcgcmVzaXplPyBldGMuCj4+Cj4+
Pgo+Pj4gQ291bGQgeW91IHBsZWFzZSB3cml0ZSB0aGlzIHRvb2wgb3IgYSBwYXRjaCB0aGF0IEkg
Y2FuIHRyeSBpbiBmc2NrPwo+Pgo+PiBJIHdpbGwgdHJ5IG15IGJlc3QuCj4+Cj4+Pgo+Pj4gVGhh
bmtzLgo+PgoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCg==
