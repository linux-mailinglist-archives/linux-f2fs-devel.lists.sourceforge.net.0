Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C540BCDF338
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 Dec 2025 02:22:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tdlweBEqNS+Sz8OTmNyip9043GTxUPmiEbhGS7dyUw=; b=P42adT/BCmWlKyHM8F+GqNBtkJ
	sO0RJT8A+T0gduWrBXPLl31IfRDgxbmXSGhEN3VQMil+Tl5yiankenF8W7Jq1V74RYaxqwAx40EQl
	b1Eig2CCueavupyX7XCe6djCBuWYYPvsVcb9OwGX9vYrOevZOy4GlJ/oaUM7Xhb+pHfU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vZJ0W-00075m-30;
	Sat, 27 Dec 2025 01:22:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vZJ0V-00075g-Ao
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Dec 2025 01:22:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T8sc5HMSYjTsE/YWUd5q4bIEGnGSu9JNkawwJeVup08=; b=UGU0wnmHA2mQLIuSiDjWcyHC4P
 dkvEFMNJkAMh08XbIS0pd6sYIH1Wta7bIOLA2C4XIAJ1+0RtsnFKJUVnBsBER8ikLLM9j3Fhz6B4p
 GtVyZU3sULM4GXQghDx9kh7agkNbW0WOxUfa3c74FuC1purg1LT+0Fxah/sgvJ6LHBx8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T8sc5HMSYjTsE/YWUd5q4bIEGnGSu9JNkawwJeVup08=; b=ZNsQX+1/XdqaagJjtaRNo6ye0H
 9xfC8jnDniY7Pao+e2V45aT1HChLXGJU0LqhGtgaDjHGomCW/xV/wexImPaAURVry7vsKU7ZVnlY9
 vDiMVtCYBufWT7K7c2wc1zZIF2jnrzSC3sPopbd46NDUJEKJnZXNebtSBbJ20ebU3hT0=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vZJ0U-0000l1-OZ for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 Dec 2025 01:22:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 1E20560007;
 Sat, 27 Dec 2025 01:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82B1FC4CEF7;
 Sat, 27 Dec 2025 01:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766798524;
 bh=eWuOriUNjqy667RzNQl7Z9fwBVOoj5LCP8Vo5uyQPfU=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=OCLO9AQlB4W/3/Jz0mu5WRVuMwCYVLgDLlkpOFSKYGCLaW5V0SUA4A5pbvOTsB7x8
 UuVT9y7jR87OLtj9rSRjSysUIqzg5iCnvTQTHlpwO6kwosKpLWN9kKmBV8U7GpSRu1
 3WE5NNMM4TxgebY4V6Z+EMMjc3ZKT+uSbJYvjwxL9ln0NXEGoOvRVnWhf/JbjRnVOA
 Gr8l20j1J9dSKiuhdWwLx7eCCGqPEtX5WWI7aiv+l1H1Vh/y88RfzywK2MoQVfkGKh
 XfLabP75355jMhQ1/rhUVM0X5W3AlwRykFPDuv7s0O5AlHu+bF7mg5oM3xEy+lM/fd
 N8eUSPcfY0/ug==
Message-ID: <a2a86384-c718-4a5e-afef-d3360f327d35@kernel.org>
Date: Sat, 27 Dec 2025 09:22:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
References: <20251225125954.4055570-2-yangyongpeng.storage@gmail.com>
 <622035a5-b579-4575-b76c-f7a7b764f0e0@kernel.org>
 <fe7c94da-d16f-4de7-9d03-377e0085d060@gmail.com>
Content-Language: en-US
In-Reply-To: <fe7c94da-d16f-4de7-9d03-377e0085d060@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 12/26/2025 11:39 AM, Yongpeng Yang wrote: > On 12/26/25
 09:52, Chao Yu via Linux-f2fs-devel wrote: >> On 12/25/2025 8:59 PM, Yongpeng
 Yang wrote: >>> From: Yongpeng Yang <yangyongpeng@xiaomi.com> > [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vZJ0U-0000l1-OZ
Subject: Re: [f2fs-dev] [PATCH 1/1] f2fs: return immediately after
 submitting the specified folio in __submit_merged_write_cond
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
Cc: Yongpeng Yang <yangyongpeng.storage@outlook.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTIvMjYvMjAyNSAxMTozOSBBTSwgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPiBPbiAxMi8yNi8y
NSAwOTo1MiwgQ2hhbyBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPj4gT24gMTIvMjUv
MjAyNSA4OjU5IFBNLCBZb25ncGVuZyBZYW5nIHdyb3RlOgo+Pj4gRnJvbTogWW9uZ3BlbmcgWWFu
ZyA8eWFuZ3lvbmdwZW5nQHhpYW9taS5jb20+Cj4+Pgo+Pj4gZjJmc19mb2xpb193YWl0X3dyaXRl
YmFjayBlbnN1cmVzIHRoZSBmb2xpbyB3cml0ZSBpcyBzdWJtaXR0ZWQgdG8gdGhlCj4+Cj4+IEFj
dHVhbGx5LCBfX3N1Ym1pdF9tZXJnZWRfd3JpdGVfY29uZCgpIHdhcyBjYWxsZWQgZnJvbSBtYW55
IG90aGVyIHBsYWNlcywKPj4gZm9yIHRob3NlIHNjZW5hcmlvLCB3ZSBjYW4gbm90IGVuc3VyZSB3
aGV0aGVyIHRoZSBEQVRBIG9yIE5PREUgdHlwZSBwYWdlcwo+PiB3ZXJlIGNhY2hlZCBpbiBvbmUg
YmlvIGNhY2hlIG9yIG5vdCwgc28gd2UgZGVjaWRlIHRvIHN1Ym1pdCBhbGwgY2FjaGVkIGJpb3MK
Pj4gdy8gREFUQSBvciBOT0RFIHR5cGUuCj4+Cj4+PiBibG9jayBsYXllciB2aWEgX19zdWJtaXRf
bWVyZ2VkX3dyaXRlX2NvbmQsIHRoZW4gd2FpdHMgZm9yIHRoZSBmb2xpbyB0bwo+Pj4gY29tcGxl
dGUuIE90aGVyIEkvTyBzdWJtaXNzaW9ucyBhcmUgaXJyZWxldmFudCB0bwo+Pj4gZjJmc19mb2xp
b193YWl0X3dyaXRlYmFjay4gVGh1cywgaWYgdGhlIGZvbGlvIHdyaXRlIGJpbyBpcyBhbHJlYWR5
Cj4+Cj4+IEZvciBmMmZzX2ZvbGlvX3dhaXRfd3JpdGViYWNrKCkgY2FzZSwgSSBndWVzcyB5b3Ug
Y2FuIG9wdGltaXplIGl0Cj4+IHNlcGFyYXRlbHksCj4+IG1heWJlIHBhc3NpbmcgYSBwYXJhbWV0
ZXIgdG8gX19zdWJtaXRfbWVyZ2VkX3dyaXRlX2NvbmQoKSBhcyBhIGhpbnQ/Cj4gCj4gQ3VycmVu
dGx5LCBvbmx5IHRoZSBjYWxsIGNoYWluIGYyZnNfZm9saW9fd2FpdF93cml0ZWJhY2sKPiAtPiBm
MmZzX3N1Ym1pdF9tZXJnZWRfd3JpdGVfY29uZC0+X19zdWJtaXRfbWVyZ2VkX3dyaXRlX2NvbmQg
cGFzc2VzIGEKPiBub24tTlVMTCBmb2xpbyB3aXRoIGEgTlVMTCBpbm9kZS4gV2hlbiB0aGUgcmV0
dXJuIHZhbHVlIG9mCj4gX19oYXNfbWVyZ2VkX3BhZ2UgaXMgdHJ1ZSBhbmQgdGhlIGZvbGlvIGlz
IG5vbi1OVUxMLCBpdCBpbmRpY2F0ZXMgdGhlCj4gY2FsbCBpcyBmcm9tIGYyZnNfZm9saW9fd2Fp
dF93cml0ZWJhY2suIEluZGVlZCwgdGhpcyBpcyB1bmNsZWFyLgo+IAo+IFRoZSBmb3JjZSBwYXJh
bWV0ZXIgc2VlbXMgcmVkdW5kYW50LCB3aGVyZSBmb3JjZSA9IHRydWUgaW1wbGllcyBgaW5vZGUK
PiA9PSBOVUxMICYmIGZvbGlvID09IE5VTEwgJiYgaW5vID09IDBgIGlzIHRydWUsIGFuZCBmb3Jj
ZSA9IGZhbHNlIGltcGxpZXMKPiBgaW5vZGUgIT0gTlVMTCB8fCBmb2xpbyAhPSBOVUxMIHx8IGlu
byAhPSAwYCBpcyB0cnVlLgo+IAo+IEhvdyBhYm91dCByZW1vdmluZyB0aGUgZm9yY2UgcGFyYW1l
dGVyIGFuZCBhZGRpbmcgYSBgYm9vbCB3cml0ZWJhY2tgCj4gcGFyYW1ldGVyIHRvIGluZGljYXRl
IGNhbGxzIGZyb20gZjJmc19mb2xpb193YWl0X3dyaXRlYmFjaz8KClN1cmUsIGNhbiB3ZSBjbGVh
biB1cCBmb3JjZSBwYXJhbWV0ZXIgaW4gc2VwYXJhdGVkIHBhdGNoPwoKVGhhbmtzLAoKPiAKPiBU
aGFua3MKPiBZb25ncGVuZywKPiAKPj4KPj4gVGhhbmtzLAo+Pgo+Pj4gc3VibWl0dGVkLCB0aGUg
ZnVuY3Rpb24gY2FuIHJldHVybiBpbW1lZGlhdGVseS4KPj4+Cj4+PiBTaWduZWQtb2ZmLWJ5OiBZ
b25ncGVuZyBZYW5nIDx5YW5neW9uZ3BlbmdAeGlhb21pLmNvbT4KPj4+IC0tLQo+Pj4gIMKgIGZz
L2YyZnMvZGF0YS5jIHwgNiArKysrKy0KPj4+ICDCoCAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRp
b25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZGF0YS5j
IGIvZnMvZjJmcy9kYXRhLmMKPj4+IGluZGV4IDEyYmY0YjZlMDA3NS4uYzc0MzM1MmI2ODZkIDEw
MDY0NAo+Pj4gLS0tIGEvZnMvZjJmcy9kYXRhLmMKPj4+ICsrKyBiL2ZzL2YyZnMvZGF0YS5jCj4+
PiBAQCAtNjc4LDggKzY3OCwxMiBAQCBzdGF0aWMgdm9pZCBfX3N1Ym1pdF9tZXJnZWRfd3JpdGVf
Y29uZChzdHJ1Y3QKPj4+IGYyZnNfc2JfaW5mbyAqc2JpLAo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHJldCA9IF9faGFzX21lcmdlZF9wYWdlKGlvLT5iaW8sIGlub2RlLCBmb2xpbywg
aW5vKTsKPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBmMmZzX3VwX3JlYWQoJmlvLT5p
b19yd3NlbSk7Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIH0KPj4+IC3CoMKgwqDCoMKgwqDCoCBp
ZiAocmV0KQo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlmIChyZXQpIHsKPj4+ICDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoCBfX2YyZnNfc3VibWl0X21lcmdlZF93cml0ZShzYmksIHR5cGUsIHRlbXAp
Owo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyogZG9uJ3QgbmVlZCB0byBzdWJtaXQgb3Ro
ZXIgdHlwZXMgb2YgYmlvLiAqLwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGZvbGlv
KQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBicmVhazsKPj4+ICvCoMKgwqDC
oMKgwqDCoCB9Cj4+PiAgwqAgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIFRPRE86IHVzZSBIT1QgdGVt
cCBvbmx5IGZvciBtZXRhIHBhZ2VzIG5vdy4gKi8KPj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgaWYg
KHR5cGUgPj0gTUVUQSkKPj4KPj4KPj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KPj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPj4gTGlu
dXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4gaHR0cHM6Ly9saXN0cy5zb3Vy
Y2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo+IAoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
