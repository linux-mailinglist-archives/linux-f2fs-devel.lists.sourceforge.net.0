Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37278CDE456
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Dec 2025 04:08:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MiUvTO/jJF4jDa2IX1tS6OpizT//ktRkpNjnSty1NVI=; b=K/rC2z19fHXMDNmneHJiKZDgAz
	vT+qfqLeEMnwrq0fQaBk75j6uKvDCyfoiCYUEhHHvxlDKJfTBkrp2sNBy86r6zvxezmBDkL4u9++c
	RSnqfbtVX61e7Hf0xhhiAepXZaNaoYepPumROOAvb6sI+s/gzJOBDHae2zEe12wxUmfk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vYyBO-0006aN-Jw;
	Fri, 26 Dec 2025 03:08:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vYyBN-0006a6-0P
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Dec 2025 03:08:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=elE6Vk4Vt4g0thmu5ovgm1JSZYIR/qeQxrzJiR6HGBY=; b=F5CgGQKL7AfdgqOzhKPr8CkgBZ
 303Ay+e+FkB5Jd5U2Y55VM7dhe/ya021abCjxT8PmY06o1Qqu7wQ1r/gnyEnkK2I6ywni+pcXkPhP
 1S4iFgJOe1rYiQUQJBnM/D7GJZ6KoezlZNCZG1V4TUhDUmpbBhyp4JUkD2P1C3ZPh8Xc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=elE6Vk4Vt4g0thmu5ovgm1JSZYIR/qeQxrzJiR6HGBY=; b=MD48rvtPg7W4cfDKBk7AfMXWuN
 +wSvzc35YweIyQaNi4Wdohx9ShTQCbgkdj3eE8gyDP/EtDGa+VGyAWufuRJWrx0FHYzWXDZFl4Cwf
 SjUQQqdSPIjHkAUm1GhNCoXfHbQBGhm+lsFn1Cdtcxmvu6nhXgrmuNTkEaIOCZ55csMM=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vYyBM-0001wS-3c for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Dec 2025 03:08:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C006943BE2;
 Fri, 26 Dec 2025 03:07:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5578DC4CEF1;
 Fri, 26 Dec 2025 03:07:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766718469;
 bh=1I8HltHfmQLYAYkipzB2XyRH6CbR+MF5NCf7duUiRT4=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=ZJUcEagx4sbHe3eg3lhMO3VcKcSDGo8OBQJnaNfwiX09BW6TDXhdV5zE8qa26cXEz
 Qvp+LAEHMrVYo8SGQpSQ5WGANXoLwMv79cYajYRcUqiEAE36MKQLF97cPRD1nqBJm3
 E6FNecm/tt4IWfFnC1wBIjXrHDhhhgxlqN34sxJFuWdzfL+Y0x/a24OHQIfJymCeaH
 7Lqm2nsn9MpqBx9ofZF4Ajpc7jy0KhBQUdNB5oH5ZD4VA9bB3OciKFmsOkkO0cijRr
 pRcJaUh1RGzjNcv/Oq439fUj9Yz92bhKPr0QkYhobw3gkT6vk+wo4H6rT4E29a2N5J
 IAN2ixhZFhaLA==
Message-ID: <67e83a0a-74d3-43cc-902a-28172cb33149@kernel.org>
Date: Fri, 26 Dec 2025 11:07:53 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Yunlei He <heyunlei1988@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251107062907.384287-1-heyunlei1988@gmail.com>
 <268cf104-6f77-419c-931e-c5cd82c3a921@kernel.org>
 <047b0d23-102e-41ce-b8b8-c7cb8ac31b21@gmail.com>
 <128fd300-d2d1-4169-a86f-a0babb47101b@kernel.org>
 <d6557e0a-a433-4dd1-bf02-d74cc6998592@gmail.com>
Content-Language: en-US
In-Reply-To: <d6557e0a-a433-4dd1-bf02-d74cc6998592@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/23/2025 8:02 PM, Yongpeng Yang wrote: > > On 11/10/25
 17:32, Chao Yu via Linux-f2fs-devel wrote: >> On 11/10/25 17:20, Yongpeng
 Yang wrote: >>> On 11/8/25 11:11, Chao Yu via Linux-f2fs-devel wro [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [172.234.252.31 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vYyBM-0001wS-3c
Subject: Re: [f2fs-dev] [PATCH] f2fs: drop non uptodata page during GC
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTIvMjMvMjAyNSA4OjAyIFBNLCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+IAo+IE9uIDExLzEw
LzI1IDE3OjMyLCBDaGFvIFl1IHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+PiBPbiAxMS8x
MC8yNSAxNzoyMCwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPj4+IE9uIDExLzgvMjUgMTE6MTEsIENo
YW8gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+Pj4gWXVubGVpLAo+Pj4+Cj4+Pj4g
T24gMjAyNS8xMS83IDE0OjI5LCBZdW5sZWkgSGUgd3JvdGU6Cj4+Pj4+IEZyb206IFl1bmxlaSBI
ZSA8aGV5dW5sZWlAeGlhb21pLmNvbT4KPj4+Pj4KPj4+Pj4gR0MgbW92ZSBmYmUgZGF0YSBibG9j
ayB3aWxsIGFkZCBzb21lIG5vbiB1cHRvZGF0ZSBwYWdlLCB3ZSdkCj4+Pj4+IGJldHRlciByZWxl
YXNlIGl0IGF0IHRoZSBlbmQuCj4+Pj4KPj4+PiBUaGlzIGlzIGp1c3QgZm9yIHNhdmluZyBtZW1v
cnksIHJpZ2h0Pwo+Pj4+Cj4+Pgo+Pj4gWWVzLCBtb3ZlX2RhdGFfYmxvY2soKSBkb2VzbuKAmXQg
cmVhZCBhbnkgZGF0YSB0byBmb2xpbywgYW5kIHRoZSBHQwo+Pj4gdXN1YWxseSBzZWxlY3RzIGNv
bGQgZGF0YS4gVGhlcmVmb3JlLCB0aGlzIGZvbGlvIGlzIHR5cGljYWxseSBub3QKPj4+IHVwdG9k
YXRlLCBhbmQgdGhlcmXigJlzIG5vIG5lZWQgZm9yIGl0IHRvIG9jY3VweSB0aGUgcGFnZSBjYWNo
ZS4KPj4+Cj4+Pj4+Cj4+Pj4+IFNpZ25lZC1vZmYtYnk6IFl1bmxlaSBIZSA8aGV5dW5sZWlAeGlh
b21pLmNvbT4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogWW9uZ3BlbmcgWWFuZyA8eWFuZ3lvbmdwZW5n
QHhpYW9taS5jb20+Cj4+Pj4+IC0tLQo+Pj4+PiAgwqAgZnMvZjJmcy9nYy5jIHwgNSArKysrKwo+
Pj4+PiAgwqAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9ucygrKQo+Pj4+Pgo+Pj4+PiBkaWZm
IC0tZ2l0IGEvZnMvZjJmcy9nYy5jIGIvZnMvZjJmcy9nYy5jCj4+Pj4+IGluZGV4IDhhYmY1MjE1
MzBmZi4uMDliNjVlNmVhODUzIDEwMDY0NAo+Pj4+PiAtLS0gYS9mcy9mMmZzL2djLmMKPj4+Pj4g
KysrIGIvZnMvZjJmcy9nYy5jCj4+Pj4+IEBAIC0xMzE1LDYgKzEzMTUsNyBAQCBzdGF0aWMgaW50
IG1vdmVfZGF0YV9ibG9jayhzdHJ1Y3QgaW5vZGUgKmlub2RlLCBibG9ja190IGJpZHgsCj4+Pj4+
ICDCoMKgwqDCoMKgIHN0cnVjdCBub2RlX2luZm8gbmk7Cj4+Pj4+ICDCoMKgwqDCoMKgIHN0cnVj
dCBmb2xpbyAqZm9saW8sICptZm9saW87Cj4+Pj4+ICDCoMKgwqDCoMKgIGJsb2NrX3QgbmV3YWRk
cjsKPj4+Pj4gK8KgwqDCoCBib29sIG5lZWRfaW52YWxpZGF0ZSA9IHRydWU7Cj4+Pj4+ICDCoMKg
wqDCoMKgIGludCBlcnIgPSAwOwo+Pj4+PiAgwqDCoMKgwqDCoCBib29sIGxmc19tb2RlID0gZjJm
c19sZnNfbW9kZShmaW8uc2JpKTsKPj4+Pj4gIMKgwqDCoMKgwqAgaW50IHR5cGUgPSBmaW8uc2Jp
LT5hbS5hdGdjX2VuYWJsZWQgJiYgKGdjX3R5cGUgPT0gQkdfR0MpICYmCj4+Pj4+IEBAIC0xNDUw
LDcgKzE0NTEsMTEgQEAgc3RhdGljIGludCBtb3ZlX2RhdGFfYmxvY2soc3RydWN0IGlub2RlICpp
bm9kZSwgYmxvY2tfdCBiaWR4LAo+Pj4+PiAgwqAgcHV0X291dDoKPj4+Pj4gIMKgwqDCoMKgwqAg
ZjJmc19wdXRfZG5vZGUoJmRuKTsKPj4+Pj4gIMKgIG91dDoKPj4+Pj4gK8KgwqDCoCBpZiAoZm9s
aW9fdGVzdF91cHRvZGF0ZShmb2xpbykpCj4+Pj4+ICvCoMKgwqDCoMKgwqDCoCBuZWVkX2ludmFs
aWRhdGUgPSBmYWxzZTsKPj4+Pgo+Pj4+IEhvdyBhYm91dCBkcm9wcGluZyBzdWNoIGZvbGlvIHVu
ZGVyIGl0cyBsb2NrPwo+Pj4+Cj4+Pj4gaWYgKCFmb2xpb190ZXN0X3VwdG9kYXRlKCkpCj4+Pj4g
IMKgwqDCoMKgwqB0cnVuY2F0ZV9pbm9kZV9wYXJ0aWFsX2ZvbGlvKCkKPj4+Pgo+Pj4KPj4+IHRy
dW5jYXRlX2lub2RlX3BhcnRpYWxfZm9saW8oKSBpcyBtb3JlIGVmZmljaWVudCBzaW5jZSBpdCBh
dm9pZHMgbG9va2luZwo+Pj4gdXAgdGhlIGZvbGlvIGFnYWluLCBidXQgaXTigJlzIGRlY2xhcmVk
IGluIG1tL2ludGVybmFsLmgsIHNvIGl0IGNhbm5vdCBiZQo+Pj4gY2FsbGVkIGRpcmVjdGx5Lgo+
Pgo+PiBZZWFoLCBvciBnZW5lcmljX2Vycm9yX3JlbW92ZV9mb2xpbygpLCBub3Qgc3VyZS4KPj4K
Pj4gSSBqdXN0IHRha2UgYSBsb29rIHRvIGNoZWNrIHdoZXRoZXIgdGhlcmUgaXMgYSBiZXR0ZXIg
YWx0ZXJuYXRpdmUgc2NoZW1lLgo+IAo+IEhvdyBhYm91dCB0aGUgZm9sbG93aW5nIG1vZGlmaWNh
dGlvbj8gVGhlIGZvbGlvIGlzIG1hcmtlZCB3aXRoCj4gUEdfZHJvcGJlaGluZCB1c2luZyBfX2Zv
bGlvX3NldF9kcm9wYmVoaW5kKCksIGFuZCBpcyBzdWJzZXF1ZW50bHkKPiByZW1vdmVkIGZyb20g
dGhlIHBhZ2UgY2FjaGUgdGhyb3VnaCBmb2xpb19lbmRfZHJvcGJlaGluZCgpLgo+IAo+IFRoYW5r
cywKPiBZb25ncGVuZwo+IAo+IC0tLSBhL2ZzL2YyZnMvZ2MuYwo+ICsrKyBiL2ZzL2YyZnMvZ2Mu
Ywo+IEBAIC0xMzI2LDYgKzEzMjYsNyBAQCBzdGF0aWMgaW50IG1vdmVfZGF0YV9ibG9jayhzdHJ1
Y3QgaW5vZGUgKmlub2RlLAo+IGJsb2NrX3QgYmlkeCwKPiAgICAgICAgICBmb2xpbyA9IGYyZnNf
Z3JhYl9jYWNoZV9mb2xpbyhtYXBwaW5nLCBiaWR4LCBmYWxzZSk7Cj4gICAgICAgICAgaWYgKElT
X0VSUihmb2xpbykpCj4gICAgICAgICAgICAgICAgICByZXR1cm4gUFRSX0VSUihmb2xpbyk7Cj4g
KyAgICAgICBfX2ZvbGlvX3NldF9kcm9wYmVoaW5kKGZvbGlvKTsKPiAKPiAgICAgICAgICBpZiAo
IWNoZWNrX3ZhbGlkX21hcChGMkZTX0lfU0IoaW5vZGUpLCBzZWdubywgb2ZmKSkgewo+ICAgICAg
ICAgICAgICAgICAgZXJyID0gLUVOT0VOVDsKPiBAQCAtMTQ1Myw3ICsxNDU0LDEwIEBAIHN0YXRp
YyBpbnQgbW92ZV9kYXRhX2Jsb2NrKHN0cnVjdCBpbm9kZSAqaW5vZGUsCj4gYmxvY2tfdCBiaWR4
LAo+ICAgcHV0X291dDoKPiAgICAgICAgICBmMmZzX3B1dF9kbm9kZSgmZG4pOwo+ICAgb3V0Ogo+
IC0gICAgICAgZjJmc19mb2xpb19wdXQoZm9saW8sIHRydWUpOwo+ICsgICAgICAgZm9saW9fdW5s
b2NrKGZvbGlvKTsKPiArICAgICAgIGZvbGlvX2VuZF9kcm9wYmVoaW5kKGZvbGlvKTsKPiArICAg
ICAgIGZvbGlvX3B1dChmb2xpbyk7CgpNYXliZToKCm91dDoKCWlmICghZm9saW9fdGVzdF91cHRv
ZGF0ZSkKCQlmb2xpb19zZXRfZHJvcGJlaGluZAoJZm9saW9fdW5sb2NrCglmb2xpb19lbmRfZHJv
cGJlaGluZAoJZm9saW9fdGVzdF9jbGVhcl9kcm9wYmVoaW5kIC8vIG1ha2Ugc3VyZSB0byBjbGVh
ciB0aGUgZmxhZwoJZm9saW9fcHV0CgpUaGFua3MsCgo+ICAgICAgICAgIHJldHVybiBlcnI7Cj4g
ICB9Cj4gCj4+Cj4+IFRoYW5rcywKPj4KPj4+Cj4+PiBZb25ncGVuZywKPj4+Cj4+Pj4+ICDCoMKg
wqDCoMKgIGYyZnNfZm9saW9fcHV0KGZvbGlvLCB0cnVlKTsKPj4+Pj4gK8KgwqDCoCBpZiAobmVl
ZF9pbnZhbGlkYXRlKQo+Pj4+PiArwqDCoMKgwqDCoMKgwqAgaW52YWxpZGF0ZV9tYXBwaW5nX3Bh
Z2VzKG1hcHBpbmcsIGJpZHgsIGJpZHgpOwo+Pj4+PiAgwqDCoMKgwqDCoCByZXR1cm4gZXJyOwo+
Pj4+PiAgwqAgfQo+Pj4+Cj4+Pj4KPj4+Pgo+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCj4+Pj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
Pj4+PiBMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+Pj4+IGh0dHBzOi8v
bGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKPj4+
Cj4+Cj4+Cj4+Cj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4+IExpbnV4LWYyZnMtZGV2ZWxA
bGlzdHMuc291cmNlZm9yZ2UubmV0Cj4+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKPiAKCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QK
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
