Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 148CBCCE4D3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 19 Dec 2025 03:52:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+W4JldZqfUk+YuSKiQjAI6eryKLL51/Jw4XEXMon7E8=; b=PJ1b0oLHYKco7tREJT05ChBlpz
	CsRYNhsjJLUycoafLb7I6pV6u/329tcXjX81CFuhmM6VHEOUc3RTQUFWaHR7rhmpv5jsf4NNzWhP3
	xvNKAm1US1gGkXC+Nxlme90Rr0ucKNol3A4DdUQevyKPjjK50y4kN+6sWLOX+5hNyIKk=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vWQbv-0005Em-Ew;
	Fri, 19 Dec 2025 02:52:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1vWQbt-0005Ed-9e
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Dec 2025 02:52:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bAZtpRM7ethfNa19X8w1rMUHVKtHOJbOPoInyReuRmI=; b=SbfI4fyJJtWVcFk/cYxBRCtFUq
 9AiMp/giX2TA3jYXJOYRJLhDyNVOFVyz43VWI1jzreF8Bk2pDZMSNS9uRWE60jojlNjjUKIyktwBx
 01/ozua1Z+sR2xqRzlshFBLGoEQc7+MOLqUXLjK3QtoI8r701FbeIEtOkGWzTvP0UPh4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bAZtpRM7ethfNa19X8w1rMUHVKtHOJbOPoInyReuRmI=; b=IcMY2Vv6eLNaKacXvjmQKiiWMH
 SU+vlnoLHVeFuUAi4nl0hc1z0IMbqtfnsNkceU9IQxInHaaV/B7Q9xdXRG0yvvWSHqdmFRBMeH1qE
 SeA/OTBb9xd8Tocj3xnJEY13Tw17agn7Dc+6wHlC/j5PWaYJvXvCfoktfUKjrm/8u3y8=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vWQbs-0000Pk-JG for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 19 Dec 2025 02:52:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3176A4426C;
 Fri, 19 Dec 2025 02:52:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C15E3C4CEFB;
 Fri, 19 Dec 2025 02:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1766112762;
 bh=P2XFgwFbwCrWfQGnYU7YgstMh9N4ny25QOmHF9zOnkk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=hXgw2GXqNEng+54iUc+jmUjaZXStmVEFc0zzeIaHGNLQQfHbmiXBohWfLZ5uACq50
 4uLvr+U7x8juV+GOinXngO8fUaK/I6RR/6E5a4e6dHToH0pmTASCe6Ma8WD3VsE58l
 7D21F/lnsIIlQVtRmy/QnzeHIw4pCeonapo0t/MQBT0vE6bQ03zJX4d/LnU9dz9Enu
 VGnfcS2efelE4nJ6hmaqGPbeDOFDA4ZdzGj8dJX3nrjIFIfEbXyWrQTadkSj4AJ7OF
 EAPLB1zc1B3H5HdfjhMhnAlYSjY72Tbke9v5gQv8CKDxDMFym0wme41Fs6ETawcgg6
 u4TqxdwQvpS8w==
Message-ID: <d69247f1-0c1e-44d6-9aa8-2ce4b093df47@kernel.org>
Date: Fri, 19 Dec 2025 10:52:43 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Zhiguo Niu <niuzhiguo84@gmail.com>
References: <20251215122830.3495475-1-chao@kernel.org>
 <CAHJ8P3JECzewfv-JF69r7pvbt6gz++JBDPvFt2GXXwQ+RsCoTw@mail.gmail.com>
 <83a27ae7-ecc2-4d0d-8fb6-5841ed78b5eb@kernel.org>
 <CAHJ8P3JGz89k9XSjkZquZGgXdXOtWMymG34u9rqR7muAzBSUNA@mail.gmail.com>
 <6483577e-7455-4531-a33f-90b6541d8e42@kernel.org>
 <CAHJ8P3Kgo+YesOqWr=-=HEBY2u8-r17q6HCzxA=qBWHweVH+mg@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CAHJ8P3Kgo+YesOqWr=-=HEBY2u8-r17q6HCzxA=qBWHweVH+mg@mail.gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-2.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 12/18/2025 9:30 AM, Zhiguo Niu wrote: > Chao Yu <chao@kernel.org>
    于2025年12月17日周三 16:03写道： >> >> On 12/17/25 09:46, Zhiguo
    Niu wrote: >>> Chao Yu <chao@kernel.org> 于2025年12月1 [...] 
 
 Content analysis details:   (-0.2 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from author's
                             domain
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vWQbs-0000Pk-JG
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to sanity check on nat_entry.nid
 in f2fs_get_node_info()
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 stable@kernel.org, linux-kernel@vger.kernel.org
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTIvMTgvMjAyNSA5OjMwIEFNLCBaaGlndW8gTml1IHdyb3RlOgo+IENoYW8gWXUgPGNoYW9A
a2VybmVsLm9yZz4g5LqOMjAyNeW5tDEy5pyIMTfml6XlkajkuIkgMTY6MDPlhpnpgZPvvJoKPj4K
Pj4gT24gMTIvMTcvMjUgMDk6NDYsIFpoaWd1byBOaXUgd3JvdGU6Cj4+PiBDaGFvIFl1IDxjaGFv
QGtlcm5lbC5vcmc+IOS6jjIwMjXlubQxMuaciDE25pel5ZGo5LqMIDE2OjQ55YaZ6YGT77yaCj4+
Pj4KPj4+PiBPbiAxMi8xNi8yNSAwOTozNiwgWmhpZ3VvIE5pdSB3cm90ZToKPj4+Pj4gQ2hhbyBZ
dSB2aWEgTGludXgtZjJmcy1kZXZlbCA8bGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQ+Cj4+Pj4+IOS6jjIwMjXlubQxMuaciDE15pel5ZGo5LiAIDIwOjM05YaZ6YGT77yaCj4+
Pj4+Pgo+Pj4+Pj4gSW4gb3JkZXIgdG8gYXZvaWQgbG9hZGluZyBjb3JydXB0ZWQgbmF0IGVudHJ5
IGZyb20gZGlzay4KPj4+Pj4+Cj4+Pj4+PiBDYzogc3RhYmxlQGtlcm5lbC5vcmcKPj4+Pj4+IFNp
Z25lZC1vZmYtYnk6IENoYW8gWXUgPGNoYW9Aa2VybmVsLm9yZz4KPj4+Pj4+IC0tLQo+Pj4+Pj4g
ICBmcy9mMmZzL25vZGUuYyB8IDkgKysrKystLS0tCj4+Pj4+PiAgIDEgZmlsZSBjaGFuZ2VkLCA1
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCj4+Pj4+Pgo+Pj4+Pj4gZGlmZiAtLWdpdCBh
L2ZzL2YyZnMvbm9kZS5jIGIvZnMvZjJmcy9ub2RlLmMKPj4+Pj4+IGluZGV4IGNlNDcxZTAzMzc3
NC4uMTNjODhkZmQ3OTBkIDEwMDY0NAo+Pj4+Pj4gLS0tIGEvZnMvZjJmcy9ub2RlLmMKPj4+Pj4+
ICsrKyBiL2ZzL2YyZnMvbm9kZS5jCj4+Pj4+PiBAQCAtNjMwLDE0ICs2MzAsMTUgQEAgaW50IGYy
ZnNfZ2V0X25vZGVfaW5mbyhzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIG5pZF90IG5pZCwKPj4+
Pj4+ICAgICAgICAgIG5vZGVfaW5mb19mcm9tX3Jhd19uYXQobmksICZuZSk7Cj4+Pj4+PiAgICAg
ICAgICBmMmZzX2ZvbGlvX3B1dChmb2xpbywgdHJ1ZSk7Cj4+Pj4+PiAgIHNhbml0eV9jaGVjazoK
Pj4+Pj4+IC0gICAgICAgaWYgKF9faXNfdmFsaWRfZGF0YV9ibGthZGRyKG5pLT5ibGtfYWRkcikg
JiYKPj4+Pj4+ICsgICAgICAgaWYgKHVubGlrZWx5KG5pLT5uaWQgIT0gbmlkIHx8Cj4+Pj4+IEhp
IENoYW8sCj4+Pj4+IChuaS0+bmlkPT1uaWQpIHNob3VsZCBiZSBhbHdheXMgdHJ1ZT8gYmVjYXVz
ZSB0aGUgY29kZToKPj4+Pj4KPj4+Pj4gbmktPmZsYWcgPSAwOwo+Pj4+PiBuaS0+bmlkID0gbmlk
Owo+Pj4+PiByZXRyeToKPj4+Pj4gb3IgYW0gSSBtaXNzaW5nIHNvbWV0aGluZz8KPj4+Pgo+Pj4+
IFpoaWd1bywKPj4+Pgo+Pj4+IE9oLCBJIG1heSBtaXNzZWQgc29tZXRoaW5nLCBsZXQncyBpZ25v
cmUgdGhpcyBwYXRjaC4KPj4+Pgo+Pj4+Pgo+Pj4+Pj4gKyAgICAgICAgICAgICAgIChfX2lzX3Zh
bGlkX2RhdGFfYmxrYWRkcihuaS0+YmxrX2FkZHIpICYmCj4+Pj4+IGJ0dywgSXMgaXQgcG9zc2li
bGUgdG8gZGV0ZWN0IHRoYXQgc29tZSB2YWxpZCBOaWQgZW50cmllcyBjb250YWluCj4+Pj4+IGlu
Y29ycmVjdCBjb250ZW50Pwo+Pj4+PiBzdWNoIGFzICBpbm8vYmxvY2tfYWRkcj1OVUxMX0FERFIg
aW4gbmlkPTQgZW50cnk/Cj4+Pj4KPj4+PiBTb21ldGhpbmcgbGlrZSB0aGlzPwo+Pj4+Cj4+Pj4g
ZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9mMmZzLmgKPj4+PiBpbmRleCA2
NWNhMWE1ZWFhODguLmM0NThkZjkyYmIwZCAxMDA2NDQKPj4+PiAtLS0gYS9mcy9mMmZzL2YyZnMu
aAo+Pj4+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4+Pj4gQEAgLTQ5MjgsMTYgKzQ5MjgsMTYgQEAg
c3RhdGljIGlubGluZSBib29sIGlzX2pvdXJuYWxsZWRfcXVvdGEoc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpKQo+Pj4+ICAgICAgICAgIHJldHVybiBmYWxzZTsKPj4+PiAgIH0KPj4+Pgo+Pj4+IC1z
dGF0aWMgaW5saW5lIGJvb2wgZjJmc19xdW90YV9maWxlKHN0cnVjdCBpbm9kZSAqaW5vZGUpCj4+
Pj4gK3N0YXRpYyBpbmxpbmUgYm9vbCBmMmZzX3F1b3RhX2ZpbGUoc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpLCBuaWRfdCBpbm8pCj4+Pj4gICB7Cj4+Pj4gICAjaWZkZWYgQ09ORklHX1FVT1RBCj4+
Pj4gICAgICAgICAgaW50IGk7Cj4+Pj4KPj4+PiAtICAgICAgIGlmICghZjJmc19zYl9oYXNfcXVv
dGFfaW5vKEYyRlNfSV9TQihpbm9kZSkpKQo+Pj4+ICsgICAgICAgaWYgKCFmMmZzX3NiX2hhc19x
dW90YV9pbm8oc2JpKSkKPj4+PiAgICAgICAgICAgICAgICAgIHJldHVybiBmYWxzZTsKPj4+Pgo+
Pj4+ICAgICAgICAgIGZvciAoaSA9IDA7IGkgPCBNQVhRVU9UQVM7IGkrKykgewo+Pj4+IC0gICAg
ICAgICAgICAgICBpZiAoZjJmc19xZl9pbm8oRjJGU19JX1NCKGlub2RlKS0+c2IsIGkpID09IGlu
b2RlLT5pX2lubykKPj4+PiArICAgICAgICAgICAgICAgaWYgKGYyZnNfcWZfaW5vKHNiaS0+c2Is
IGkpID09IGlubykKPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIHRydWU7Cj4+
Pj4gICAgICAgICAgfQo+Pj4+ICAgI2VuZGlmCj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvaW5v
ZGUuYyBiL2ZzL2YyZnMvaW5vZGUuYwo+Pj4+IGluZGV4IDkyMWZiMDJjMGY0OS4uZDEyNzBiMjVh
ZDdkIDEwMDY0NAo+Pj4+IC0tLSBhL2ZzL2YyZnMvaW5vZGUuYwo+Pj4+ICsrKyBiL2ZzL2YyZnMv
aW5vZGUuYwo+Pj4+IEBAIC02MjEsNyArNjIxLDcgQEAgbWFrZV9ub3c6Cj4+Pj4gICAgICAgICAg
ICAgICAgICBpbm9kZS0+aV9mb3AgPSAmZjJmc19maWxlX29wZXJhdGlvbnM7Cj4+Pj4gICAgICAg
ICAgICAgICAgICBpbm9kZS0+aV9tYXBwaW5nLT5hX29wcyA9ICZmMmZzX2RibG9ja19hb3BzOwo+
Pj4+ICAgICAgICAgICAgICAgICAgaWYgKElTX0lNTVVUQUJMRShpbm9kZSkgJiYgIWYyZnNfY29t
cHJlc3NlZF9maWxlKGlub2RlKSAmJgo+Pj4+IC0gICAgICAgICAgICAgICAgICAgIWYyZnNfcXVv
dGFfZmlsZShpbm9kZSkpCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAhZjJmc19xdW90YV9maWxl
KHNiaSwgaW5vZGUtPmlfaW5vKSkKPj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgbWFwcGlu
Z19zZXRfZm9saW9fbWluX29yZGVyKGlub2RlLT5pX21hcHBpbmcsIDApOwo+Pj4+ICAgICAgICAg
IH0gZWxzZSBpZiAoU19JU0RJUihpbm9kZS0+aV9tb2RlKSkgewo+Pj4+ICAgICAgICAgICAgICAg
ICAgaW5vZGUtPmlfb3AgPSAmZjJmc19kaXJfaW5vZGVfb3BlcmF0aW9uczsKPj4+PiBkaWZmIC0t
Z2l0IGEvZnMvZjJmcy9ub2RlLmMgYi9mcy9mMmZzL25vZGUuYwo+Pj4+IGluZGV4IDdmZWVhZDU5
NWJhNS4uMTA0NDhlMTE1ZWEwIDEwMDY0NAo+Pj4+IC0tLSBhL2ZzL2YyZnMvbm9kZS5jCj4+Pj4g
KysrIGIvZnMvZjJmcy9ub2RlLmMKPj4+PiBAQCAtNjQzLDYgKzY0MywxNyBAQCBzYW5pdHlfY2hl
Y2s6Cj4+Pj4gICAgICAgICAgICAgICAgICByZXR1cm4gLUVGU0NPUlJVUFRFRDsKPj4+PiAgICAg
ICAgICB9Cj4+Pj4KPj4+IEhpIENoYW8KPj4+PiArICAgICAgIGlmICh1bmxpa2VseShmMmZzX3F1
b3RhX2ZpbGUoc2JpLCBuaS0+bmlkKSAmJgo+Pj4+ICsgICAgICAgICAgICAgICBfX2lzX3ZhbGlk
X2RhdGFfYmxrYWRkcihuaS0+YmxrX2FkZHIpKSkgewo+Pj4gICBfX2lzX3ZhbGlkX2RhdGFfYmxr
YWRkcihuaS0+YmxrX2FkZHIpIC0tPiAhCj4+PiBfX2lzX3ZhbGlkX2RhdGFfYmxrYWRkcihuaS0+
YmxrX2FkZHIpPz8KPj4KPj4gWmhpZ3VvLAo+Pgo+PiBPaCwgeWVzLgo+Pgo+Pj4+ICsgICAgICAg
ICAgICAgICBzZXRfc2JpX2ZsYWcoc2JpLCBTQklfTkVFRF9GU0NLKTsKPj4+PiArICAgICAgICAg
ICAgICAgZjJmc19lcnJfcmF0ZWxpbWl0ZWQoc2JpLAo+Pj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgICJmMmZzX2dldF9ub2RlX2luZm8gb2YgJXBTOiBpbmNvbnNpc3RlbnQgbmF0IGVudHJ5IGZy
b20gcWZfaW5vLCAiCj4+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgImlubzoldSwgbmlkOiV1
LCBibGthZGRyOiV1LCB2ZXI6JXUsIGZsYWc6JXUiLAo+Pj4+ICsgICAgICAgICAgICAgICAgICAg
ICAgIF9fYnVpbHRpbl9yZXR1cm5fYWRkcmVzcygwKSwKPj4+PiArICAgICAgICAgICAgICAgICAg
ICAgICBuaS0+aW5vLCBuaS0+bmlkLCBuaS0+YmxrX2FkZHIsIG5pLT52ZXJzaW9uLCBuaS0+Zmxh
Zyk7Cj4+Pj4gKyAgICAgICAgICAgICAgIGYyZnNfaGFuZGxlX2Vycm9yKHNiaSwgRVJST1JfSU5D
T05TSVNURU5UX05BVCk7Cj4+Pj4gKyAgICAgICB9Cj4+Pj4gKwo+Pj4gSSB0aGluayB0aGlzIGlz
IG9rIGZvciBxdW90YSBmaWxlLAo+Pj4gYW5kIFRoaXMgaXMgbm90IGVhc3kgdG8gYXBwbHkgdG8g
YWxsIGNvbW1vbiBjYXNlcyggbmlkIGVudHJ5IG5vdCBvbmx5Cj4+PiBmb3IgcXVvdGEpLCByaWdo
dD8gXl4KPj4KPj4gWWVzLCBJIGd1ZXNzIHBhcnRpYWwgb2YgdGhlbSBtYXkgYmUgY29tbW9uIGNh
c2UsIHdoaWNoIG1heSBoYXBwZW4gaW4gcmFjZQo+PiBjb25kaXRpb24sIGUuZy4gdHJ1bmNhdGUg
dnMgcmVhZC4KPiBIaSBDaGFvLAo+IFRoYW5rcyBmb3IgdGhpcyBleHBsYWluYXRpb24sIHNvCj4g
Q291bGQgeW91IHJlc2VuZCB0aGlzIG9mZmljaWFsIHBhdGNoPwoKRG9uZS4gOikKClRoYW5rcywK
Cj4gVGhhbmtzIQo+PiBUaGFua3MsCj4+Cj4+PiBUaGFua3MhCj4+Pj4gICAgICAgICAgLyogY2Fj
aGUgbmF0IGVudHJ5ICovCj4+Pj4gICAgICAgICAgaWYgKG5lZWRfY2FjaGUpCj4+Pj4gICAgICAg
ICAgICAgICAgICBjYWNoZV9uYXRfZW50cnkoc2JpLCBuaWQsICZuZSk7Cj4+Pj4KPj4+PiBUaGFu
a3MsCj4+Pj4KPj4+Pj4gVGhhbmtzCj4+Pj4+PiAgICAgICAgICAgICAgICAgICFmMmZzX2lzX3Zh
bGlkX2Jsa2FkZHIoc2JpLCBuaS0+YmxrX2FkZHIsCj4+Pj4+PiAtICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgREFUQV9HRU5FUklDX0VOSEFOQ0UpKSB7Cj4+Pj4+PiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgREFUQV9HRU5FUklDX0VOSEFOQ0Up
KSkpIHsKPj4+Pj4+ICAgICAgICAgICAgICAgICAgc2V0X3NiaV9mbGFnKHNiaSwgU0JJX05FRURf
RlNDSyk7Cj4+Pj4+PiAgICAgICAgICAgICAgICAgIGYyZnNfZXJyX3JhdGVsaW1pdGVkKHNiaSwK
Pj4+Pj4+IC0gICAgICAgICAgICAgICAgICAgICAgICJmMmZzX2dldF9ub2RlX2luZm8gb2YgJXBT
OiBpbmNvbnNpc3RlbnQgbmF0IGVudHJ5LCAiCj4+Pj4+PiArICAgICAgICAgICAgICAgICAgICAg
ICAiZjJmc19nZXRfbm9kZV9pbmZvIG9mICVwUzogbmlkOiV1LCBpbmNvbnNpc3RlbnQgbmF0IGVu
dHJ5LCAiCj4+Pj4+PiAgICAgICAgICAgICAgICAgICAgICAgICAgImlubzoldSwgbmlkOiV1LCBi
bGthZGRyOiV1LCB2ZXI6JXUsIGZsYWc6JXUiLAo+Pj4+Pj4gLSAgICAgICAgICAgICAgICAgICAg
ICAgX19idWlsdGluX3JldHVybl9hZGRyZXNzKDApLAo+Pj4+Pj4gKyAgICAgICAgICAgICAgICAg
ICAgICAgX19idWlsdGluX3JldHVybl9hZGRyZXNzKDApLCBuaWQsCj4+Pj4+PiAgICAgICAgICAg
ICAgICAgICAgICAgICAgbmktPmlubywgbmktPm5pZCwgbmktPmJsa19hZGRyLCBuaS0+dmVyc2lv
biwgbmktPmZsYWcpOwo+Pj4+Pj4gICAgICAgICAgICAgICAgICBmMmZzX2hhbmRsZV9lcnJvcihz
YmksIEVSUk9SX0lOQ09OU0lTVEVOVF9OQVQpOwo+Pj4+Pj4gICAgICAgICAgICAgICAgICByZXR1
cm4gLUVGU0NPUlJVUFRFRDsKPj4+Pj4+IC0tCj4+Pj4+PiAyLjQ5LjAKPj4+Pj4+Cj4+Pj4+Pgo+
Pj4+Pj4KPj4+Pj4+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCj4+Pj4+PiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+Pj4+Pj4gTGludXgtZjJm
cy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPj4+Pj4+IGh0dHBzOi8vbGlzdHMuc291cmNl
Zm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKPj4+Pgo+PgoKCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRl
dmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApo
dHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRl
dmVsCg==
