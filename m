Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B38A5C7F1A5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Nov 2025 07:38:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:
	List-Id:Subject:In-Reply-To:To:References:Date:Mime-Version:From:Message-Id:
	Sender:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U1bk4U8ykV9IE3grqoWh7ntVJLRtjM/50niJxs7qDGc=; b=cDhLBnOCtJTrQm4YWZ8Mm34OHm
	Rw0kgCEttsQflzuqXHO3vPQCrf7TXhur3xikDtbDTNwAUoNR285g+BtKmu9srvTIY2V5f1VJMl7A8
	/GCRTAeYgjpctRp8HHgwadgwu51Hx18CPdNASzw7uunRNhK628hjoiPNzoZp0O9DEGLM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNQDT-0007A0-As;
	Mon, 24 Nov 2025 06:38:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yukuai@fnnas.com>) id 1vNQDR-00079r-GN
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 06:38:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:To:References:Content-Type:
 Content-Transfer-Encoding:Date:Cc:Mime-Version:Subject:From:Message-Id:
 Reply-To:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1v8DjKDZXbkovGdNkFJdKNL/RGUBInSERiXq+wqH6GE=; b=CUKRnB4Zk7LN5KDJsUnTBHHDTP
 Un9rJZC2YvVG+pt7Ju0hYYGq+zODKXOt5LULC4hhOy1GLSJCQGeAcIRKqB3fkgw66HQEA6yUJ25+V
 oBVfqWoihxLxUM82wxQlgdPpZFDLXlHO5x9oVhD7Uw8Owy0yhdpDb9sxtxRVzMNPPM1k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:To:References:Content-Type:Content-Transfer-Encoding:Date:Cc:
 Mime-Version:Subject:From:Message-Id:Reply-To:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1v8DjKDZXbkovGdNkFJdKNL/RGUBInSERiXq+wqH6GE=; b=iBDDyZXAW2yxvdBWGD8s/1GXHp
 g3Xx4Tphfzxne7iH96Uu8YT4YxTjRjJ8oXQE7LT+G2Jf2DR70KyzYPH1SWQuH6xwvRR7M5IqEWSX8
 6tDp0JsO+UlBJ82PR48TzjNLmTZPhaUcyRG3rqJWoutBOptUfPhaAKgtQRVs1pAuDcV8=;
Received: from sg-1-36.ptr.blmpb.com ([118.26.132.36])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vNQDQ-0007pF-Db for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 06:38:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=fnnas-com.20200927.dkim.feishu.cn; t=1763965451;
 h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=1v8DjKDZXbkovGdNkFJdKNL/RGUBInSERiXq+wqH6GE=;
 b=NMaVJ26f6wCqj655OfZfLoFV8HUO5KA8eptMOPpNT59Q0VF84NED7z1T9jKNzaCerL0OU0
 Nt/skt4isLqE30nJINFcU89+VLzIkhsy1BzaJsFBA0qqUYfBYajIQk4uURYvp+hQkIQTXr
 wSXtzcxprblu4RivsUKndN7uQ7Hn3jwdNGx799dULSVIrM8/uTiR8NUwabxO5bWgt9WU8L
 5ccydH+OW7RoA9qXDY2udcI1niox7gGrCs0jN5CUMUYikBhxik8r4PkILp8Q6aIrP7Wt9C
 LDAIOg8YNaiOXZ9ZuFngyDKzRBhLWoyBSvEb8AQmiXL+rT2BvUX85HSJIZM/Jw==
Message-Id: <d86b820a-46c9-43b6-9fe2-dbd991b76520@fnnas.com>
X-Lms-Return-Path: <lba+26923fa09+9990e8+lists.sourceforge.net+yukuai@fnnas.com>
User-Agent: Mozilla Thunderbird
From: "Yu Kuai" <yukuai@fnnas.com>
Mime-Version: 1.0
Date: Mon, 24 Nov 2025 14:24:05 +0800
References: <20251124025737.203571-1-ckulkarnilinux@gmail.com>
 <20251124025737.203571-3-ckulkarnilinux@gmail.com>
Content-Language: en-US
To: "Chaitanya Kulkarni" <ckulkarnilinux@gmail.com>, <axboe@kernel.dk>, 
 <agk@redhat.com>, <snitzer@kernel.org>, <mpatocka@redhat.com>, 
 <song@kernel.org>, <hch@lst.de>, <sagi@grimberg.me>, <kch@nvidia.com>, 
 <jaegeuk@kernel.org>, <chao@kernel.org>, <cem@kernel.org>, 
 "Yu Kuai" <yukuai@fnnas.com>
In-Reply-To: <20251124025737.203571-3-ckulkarnilinux@gmail.com>
X-Original-From: Yu Kuai <yukuai@fnnas.com>
Received: from [192.168.1.104] ([39.182.0.153]) by smtp.feishu.cn with ESMTPS;
 Mon, 24 Nov 2025 14:24:08 +0800
X-Spam-Score: 1.0 (+)
X-Spam-Report: Spam detection software, running on the system "sfi-spamd-1.hosts.colo.sdot.me",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  Hi, 在 2025/11/24 10:57, Chaitanya Kulkarni 写道: > __blkdev_issue_discard()
    always returns 0, making all error checking > at call sites dead code. >
   > For dm-thin change issue_discard() return type to [...] 
 
 Content analysis details:   (1.0 points, 5.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
  1.0 RCVD_IN_UCE2           RBL: IP Subnet Listed in UCEPROTECT Level 2
                             [39.182.0.153 listed in dnsbl-2.uceprotect.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
  0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1vNQDQ-0007pF-Db
Subject: Re: [f2fs-dev] [PATCH V2 2/5] dm: ignore discard return value
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
Reply-To: yukuai@fnnas.com
Cc: dm-devel@lists.linux.dev, linux-raid@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 bpf@vger.kernel.org, linux-xfs@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SGksCgrlnKggMjAyNS8xMS8yNCAxMDo1NywgQ2hhaXRhbnlhIEt1bGthcm5pIOWGmemBkzoKPiBf
X2Jsa2Rldl9pc3N1ZV9kaXNjYXJkKCkgYWx3YXlzIHJldHVybnMgMCwgbWFraW5nIGFsbCBlcnJv
ciBjaGVja2luZwo+IGF0IGNhbGwgc2l0ZXMgZGVhZCBjb2RlLgo+Cj4gRm9yIGRtLXRoaW4gY2hh
bmdlIGlzc3VlX2Rpc2NhcmQoKSByZXR1cm4gdHlwZSB0byB2b2lkLCBpbgo+IHBhc3Nkb3duX2Rv
dWJsZV9jaGVja2luZ19zaGFyZWRfc3RhdHVzKCkgcmVtb3ZlIHRoZSByIGFzc2lnbm1lbnQgZnJv
bQo+IHJldHVybiB2YWx1ZSBvZiB0aGUgaXNzdWVfZGlzY2FyZCgpLCBmb3IgZW5kX2Rpc2NhcmQo
KSBoYXJkY29kIHZhbHVlCj4gb2YgciB0byAwIHRoYXQgbWF0Y2hlcyBvbmx5IHZhbHVlIHJldHVy
bmVkIGZyb20KPiBfX2Jsa2Rldl9pc3N1ZV9kaXNjYXJkKCkuCj4KPiBtZCBwYXJ0IGlzIHNpbXBs
aWZpZWQgdG8gb25seSBjaGVjayAhZGlzY2FyZF9iaW8gYnkgaWdub3JpbmcgdGhlCj4gX19ibGtk
ZXZfaXNzdWVfZGlzY2FyZCgpIHZhbHVlLgo+Cj4gU2lnbmVkLW9mZi1ieTogQ2hhaXRhbnlhIEt1
bGthcm5pIDxja3Vsa2FybmlsaW51eEBnbWFpbC5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL21kL2Rt
LXRoaW4uYyB8IDEyICsrKysrLS0tLS0tLQo+ICAgZHJpdmVycy9tZC9tZC5jICAgICAgfCAgNCAr
Ky0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgOSBkZWxldGlvbnMoLSkK
Cm1kcmFpZCBhbmQgZG0gYXJlIGRpZmZlcmVudCBkcml2ZXJzLCBwbGVhc2Ugc3BsaXQgdGhlbS4K
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9tZC9kbS10aGluLmMgYi9kcml2ZXJzL21kL2RtLXRo
aW4uYwo+IGluZGV4IGM4NDE0OWJhNGUzOC4uNzdjNzZmNzVjODVmIDEwMDY0NAo+IC0tLSBhL2Ry
aXZlcnMvbWQvZG0tdGhpbi5jCj4gKysrIGIvZHJpdmVycy9tZC9kbS10aGluLmMKPiBAQCAtMzk1
LDEzICszOTUsMTMgQEAgc3RhdGljIHZvaWQgYmVnaW5fZGlzY2FyZChzdHJ1Y3QgZGlzY2FyZF9v
cCAqb3AsIHN0cnVjdCB0aGluX2MgKnRjLCBzdHJ1Y3QgYmlvICoKPiAgIAlvcC0+YmlvID0gTlVM
TDsKPiAgIH0KPiAgIAo+IC1zdGF0aWMgaW50IGlzc3VlX2Rpc2NhcmQoc3RydWN0IGRpc2NhcmRf
b3AgKm9wLCBkbV9ibG9ja190IGRhdGFfYiwgZG1fYmxvY2tfdCBkYXRhX2UpCj4gK3N0YXRpYyB2
b2lkIGlzc3VlX2Rpc2NhcmQoc3RydWN0IGRpc2NhcmRfb3AgKm9wLCBkbV9ibG9ja190IGRhdGFf
YiwgZG1fYmxvY2tfdCBkYXRhX2UpCj4gICB7Cj4gICAJc3RydWN0IHRoaW5fYyAqdGMgPSBvcC0+
dGM7Cj4gICAJc2VjdG9yX3QgcyA9IGJsb2NrX3RvX3NlY3RvcnModGMtPnBvb2wsIGRhdGFfYik7
Cj4gICAJc2VjdG9yX3QgbGVuID0gYmxvY2tfdG9fc2VjdG9ycyh0Yy0+cG9vbCwgZGF0YV9lIC0g
ZGF0YV9iKTsKPiAgIAo+IC0JcmV0dXJuIF9fYmxrZGV2X2lzc3VlX2Rpc2NhcmQodGMtPnBvb2xf
ZGV2LT5iZGV2LCBzLCBsZW4sIEdGUF9OT0lPLCAmb3AtPmJpbyk7Cj4gKwlfX2Jsa2Rldl9pc3N1
ZV9kaXNjYXJkKHRjLT5wb29sX2Rldi0+YmRldiwgcywgbGVuLCBHRlBfTk9JTywgJm9wLT5iaW8p
Owo+ICAgfQo+ICAgCj4gICBzdGF0aWMgdm9pZCBlbmRfZGlzY2FyZChzdHJ1Y3QgZGlzY2FyZF9v
cCAqb3AsIGludCByKQo+IEBAIC0xMTEzLDkgKzExMTMsNyBAQCBzdGF0aWMgdm9pZCBwYXNzZG93
bl9kb3VibGVfY2hlY2tpbmdfc2hhcmVkX3N0YXR1cyhzdHJ1Y3QgZG1fdGhpbl9uZXdfbWFwcGlu
ZyAqbQo+ICAgCQkJCWJyZWFrOwo+ICAgCQl9Cj4gICAKPiAtCQlyID0gaXNzdWVfZGlzY2FyZCgm
b3AsIGIsIGUpOwo+IC0JCWlmIChyKQo+IC0JCQlnb3RvIG91dDsKPiArCQlpc3N1ZV9kaXNjYXJk
KCZvcCwgYiwgZSk7Cj4gICAKPiAgIAkJYiA9IGU7Cj4gICAJfQo+IEBAIC0xMTg4LDggKzExODYs
OCBAQCBzdGF0aWMgdm9pZCBwcm9jZXNzX3ByZXBhcmVkX2Rpc2NhcmRfcGFzc2Rvd25fcHQxKHN0
cnVjdCBkbV90aGluX25ld19tYXBwaW5nICptKQo+ICAgCQlzdHJ1Y3QgZGlzY2FyZF9vcCBvcDsK
PiAgIAo+ICAgCQliZWdpbl9kaXNjYXJkKCZvcCwgdGMsIGRpc2NhcmRfcGFyZW50KTsKPiAtCQly
ID0gaXNzdWVfZGlzY2FyZCgmb3AsIG0tPmRhdGFfYmxvY2ssIGRhdGFfZW5kKTsKPiAtCQllbmRf
ZGlzY2FyZCgmb3AsIHIpOwo+ICsJCWlzc3VlX2Rpc2NhcmQoJm9wLCBtLT5kYXRhX2Jsb2NrLCBk
YXRhX2VuZCk7Cj4gKwkJZW5kX2Rpc2NhcmQoJm9wLCAwKTsKPiAgIAl9Cj4gICB9Cj4gICAKPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9tZC9tZC5jIGIvZHJpdmVycy9tZC9tZC5jCj4gaW5kZXggN2I1
YzU5Njc1NjhmLi5hZWI2MmRmMzk4MjggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tZC9tZC5jCj4g
KysrIGIvZHJpdmVycy9tZC9tZC5jCj4gQEAgLTkxMzIsOCArOTEzMiw4IEBAIHZvaWQgbWRfc3Vi
bWl0X2Rpc2NhcmRfYmlvKHN0cnVjdCBtZGRldiAqbWRkZXYsIHN0cnVjdCBtZF9yZGV2ICpyZGV2
LAo+ICAgewo+ICAgCXN0cnVjdCBiaW8gKmRpc2NhcmRfYmlvID0gTlVMTDsKPiAgIAo+IC0JaWYg
KF9fYmxrZGV2X2lzc3VlX2Rpc2NhcmQocmRldi0+YmRldiwgc3RhcnQsIHNpemUsIEdGUF9OT0lP
LAo+IC0JCQkmZGlzY2FyZF9iaW8pIHx8ICFkaXNjYXJkX2JpbykKPiArCV9fYmxrZGV2X2lzc3Vl
X2Rpc2NhcmQocmRldi0+YmRldiwgc3RhcnQsIHNpemUsIEdGUF9OT0lPLCAmZGlzY2FyZF9iaW8p
Owo+ICsJaWYgKCFkaXNjYXJkX2JpbykKPiAgIAkJcmV0dXJuOwo+ICAgCj4gICAJYmlvX2NoYWlu
KGRpc2NhcmRfYmlvLCBiaW8pOwoKLS0gClRoYW5rcwpLdWFpCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
