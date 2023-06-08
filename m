Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E669727B98
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  8 Jun 2023 11:38:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q7C64-00049R-50;
	Thu, 08 Jun 2023 09:38:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1q7C62-00049L-H8
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jun 2023 09:38:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mowgfPODmJ8fZ0lRp+NbcEmQH9MxHOWzW0aw7P9cZ6Y=; b=K7dswUtxm4MOlQOW8awNhFxmWx
 8K9cz6CxVqHUpnVodqn54qu8l8Zw1hzOSz6WYPzMAmJ/ktnYHrd31OGpMpYshk9g1fx6Os8gtYNYy
 X2qTifaRmTxMRMZ8Qp1+DmAh9RalF+oD8JJuDz2l5Tkdjq1yXRZcquK/AJ7xRt1HSwEg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=mowgfPODmJ8fZ0lRp+NbcEmQH9MxHOWzW0aw7P9cZ6Y=; b=aS/rRi5dMZ87oQcl7EaK+4UVuy
 tqkFkFKjn3n9OE9tHh1ZVga8wN+frQ/TowM9TV/X3UgtkKqpujY+nosbOH2rm2DH1oGS+jyKq/1Xn
 aVqvXZJPr/GjCY7AGhGs5STqjZ4WXKr99XX4KKhDE3g8DTffU6DdJZfsOgF4QlTCwT4A=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q7C5z-00Ea0K-NU for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 08 Jun 2023 09:38:23 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E5F5464B57;
 Thu,  8 Jun 2023 09:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41AEFC433D2;
 Thu,  8 Jun 2023 09:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1686217090;
 bh=V19RuyGw5moEVQtVIKIzHCHkmzutxvLKUftm4u1YHGA=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=HfOYHujpVwPnBBs8MCW0W1iGvRx+wOQX/szfXZboXubF8q4XHtecO5OD86vbE2s6/
 mZqC2BoP61MJ50e1RU2Zai29XGG84KdAt/OcBUJn9L4xVsvdJiwcKv220DewoB1v1z
 DN/QCbMGv9MYdfe6PKd81teb+hFFuo+j96LSFw0cFG4OzNj0EzEAmi74B6EdK5m22T
 Ix9XVYwbr30CZrteZulUWuoeFXAca2v/YMiHIrlHUL6CEEKCnEO+5reOmkJA928/Kp
 XmSvzADO/8c4Ty1ufLex02AHZKKUpy0zQKelwWeOKlpsle0Yq04i+nEYxFcEovTFtw
 MRtwgvAmJOAsQ==
Message-ID: <059b17ce-cb65-fd55-29b1-2b253c6b41c4@kernel.org>
Date: Thu, 8 Jun 2023 17:38:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Content-Language: en-US
To: Yangtao Li <frank.li@vivo.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20230531144006.7307-1-frank.li@vivo.com>
 <e8e4758f-5895-acd7-27d2-4b72b69722b3@kernel.org>
 <29bea47b-9085-05e7-d254-a40007e6c7f3@vivo.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <29bea47b-9085-05e7-d254-a40007e6c7f3@vivo.com>
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2023/6/6 19:13, Yangtao Li wrote: > On 2023/6/6 14:43,
 Chao Yu wrote: > >> On 2023/5/31 22:40, Yangtao Li wrote: >>> This adds the
 async buffered write support to f2fs, >>> the following is the rel [...] 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1q7C5z-00Ea0K-NU
Subject: Re: [f2fs-dev] [PATCH] f2fs: enable nowait async buffered writes
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
Cc: linux-kernel@vger.kernel.org, Lu Hongfei <luhongfei@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMy82LzYgMTk6MTMsIFlhbmd0YW8gTGkgd3JvdGU6Cj4gT24gMjAyMy82LzYgMTQ6NDMs
IENoYW8gWXUgd3JvdGU6Cj4gCj4+IE9uIDIwMjMvNS8zMSAyMjo0MCwgWWFuZ3RhbyBMaSB3cm90
ZToKPj4+IFRoaXMgYWRkcyB0aGUgYXN5bmMgYnVmZmVyZWQgd3JpdGUgc3VwcG9ydCB0byBmMmZz
LAo+Pj4gdGhlIGZvbGxvd2luZyBpcyB0aGUgcmVsZXZhbnQgdGVzdCBkYXRhLgo+Pgo+PiBZYW5n
dGFvLAo+Pgo+PiBDb3VsZCB5b3UgcGxlYXNlIHByb3ZpZGUgZGV0YWlsZWQgdGVzdCBjb21tYW5k
Pwo+IAo+IAo+IFVzZSBmaW8gdG8gdGVzdCwgdGhlIGZvbGxvd2luZyBpcyB0aGUgY29uZmlndXJh
dGlvbjoKPiAKPiAjIGlvX3VyaW5nCj4gW2dsb2JhbF0KPiBpb2VuZ2luZT1pb191cmluZwo+IHNx
dGhyZWFkX3BvbGw9MQo+IHRocmVhZHM9MQo+IGlvZGVwdGg9MzIKPiBoaXByaT0wCj4gZGlyZWN0
PTAKPiBmaXhlZGJ1ZnM9MAo+IHVuY2FjaGVkPTAKPiBub3dhaXQ9MAo+IGZvcmNlX2FzeW5jPTAK
PiByYW5kcmVwZWF0PTAKPiB0aW1lX2Jhc2VkPTAKPiBzaXplPTI1Nk0KPiBmaWxlbmFtZT0vZGF0
YS90ZXN0L2xvY2FsL2lvX3VyaW5nX3Rlc3QKPiBncm91cF9yZXBvcnRpbmcKPiBbcmVhZDI1NkIt
cmFuZF0KPiBicz00MDk2Cj4gcnc9cmFuZHdyaXRlCj4gbnVtam9icz0xCgpUaGFua3MsIGl0IGxv
b2tzIHRoZSBwZXJmb3JtYW5jZSBpcyBub3QgdmVyeSBzdGFibGUgd2hlbiBpb2RlcHRoIGlzCmxh
cmdlLCBlLmcuIDMyLgoKQ291bGQgeW91IHBsZWFzZSBhZGQgYWJvdmUgdGVzdCBwYXJhbWV0ZXIg
aW50byBjb21taXQgbWVzc2FnZT8KCk90aGVyd2lzZSwgdGhpcyBwYXRjaCBsb29rcyBnb29kIHRv
IG1lLgoKVGhhbmtzLAoKPiAKPiAKPj4KPj4gVGhhbmtzLAo+Pgo+Pj4KPj4+IGlvZGVwdGjCoMKg
wqDCoMKgIHwgMcKgwqDCoCB8IDLCoMKgwqAgfCA0wqDCoMKgIHwgOMKgwqDCoCB8IDE2wqDCoCB8
Cj4+PiBiZWZvcmUoTS9zKcKgIHwgMTAxMiB8IDExMzMgfCA4OTTCoCB8IDk4McKgIHwgODY2wqAg
fAo+Pj4gYWZ0ZXIoTS9zKcKgwqAgfCAxNDg4IHwgMTg5NiB8IDIwODEgfCAyMTg4IHwgMjIwNyB8
Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTHUgSG9uZ2ZlaSA8bHVob25nZmVpQHZpdm8uY29tPgo+
Pj4gU2lnbmVkLW9mZi1ieTogWWFuZ3RhbyBMaSA8ZnJhbmsubGlAdml2by5jb20+Cj4+PiAtLS0K
Pj4+IMKgIGZzL2YyZnMvZmlsZS5jIHwgNSArLS0tLQo+Pj4gwqAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZz
L2ZpbGUuYyBiL2ZzL2YyZnMvZmlsZS5jCj4+PiBpbmRleCAyM2M2OGVlOTQ2ZTUuLjRmYWYyYzA0
ZTMyNSAxMDA2NDQKPj4+IC0tLSBhL2ZzL2YyZnMvZmlsZS5jCj4+PiArKysgYi9mcy9mMmZzL2Zp
bGUuYwo+Pj4gQEAgLTU0Niw3ICs1NDYsNyBAQCBzdGF0aWMgaW50IGYyZnNfZmlsZV9vcGVuKHN0
cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBmaWxlICpmaWxwKQo+Pj4gwqDCoMKgwqDCoCBpZiAo
ZXJyKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiBlcnI7Cj4+PiDCoCAtwqDCoMKgIGZp
bHAtPmZfbW9kZSB8PSBGTU9ERV9OT1dBSVQgfCBGTU9ERV9CVUZfUkFTWU5DOwo+Pj4gK8KgwqDC
oCBmaWxwLT5mX21vZGUgfD0gRk1PREVfTk9XQUlUIHwgRk1PREVfQlVGX1JBU1lOQyB8IEZNT0RF
X0JVRl9XQVNZTkM7Cj4+PiDCoCDCoMKgwqDCoMKgIHJldHVybiBkcXVvdF9maWxlX29wZW4oaW5v
ZGUsIGZpbHApOwo+Pj4gwqAgfQo+Pj4gQEAgLTQ1MTUsOSArNDUxNSw2IEBAIHN0YXRpYyBzc2l6
ZV90IGYyZnNfYnVmZmVyZWRfd3JpdGVfaXRlcihzdHJ1Y3Qga2lvY2IgKmlvY2IsCj4+PiDCoMKg
wqDCoMKgIHN0cnVjdCBpbm9kZSAqaW5vZGUgPSBmaWxlX2lub2RlKGZpbGUpOwo+Pj4gwqDCoMKg
wqDCoCBzc2l6ZV90IHJldDsKPj4+IMKgIC3CoMKgwqAgaWYgKGlvY2ItPmtpX2ZsYWdzICYgSU9D
Ql9OT1dBSVQpCj4+PiAtwqDCoMKgwqDCoMKgwqAgcmV0dXJuIC1FT1BOT1RTVVBQOwo+Pj4gLQo+
Pj4gwqDCoMKgwqDCoCBjdXJyZW50LT5iYWNraW5nX2Rldl9pbmZvID0gaW5vZGVfdG9fYmRpKGlu
b2RlKTsKPj4+IMKgwqDCoMKgwqAgcmV0ID0gZ2VuZXJpY19wZXJmb3JtX3dyaXRlKGlvY2IsIGZy
b20pOwo+Pj4gwqDCoMKgwqDCoCBjdXJyZW50LT5iYWNraW5nX2Rldl9pbmZvID0gTlVMTDsKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCg==
