Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DB7D4325B69
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Feb 2021 02:58:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lFSOJ-0004Vv-Bc; Fri, 26 Feb 2021 01:58:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <heyunlei@hihonor.com>) id 1lFSOH-0004VS-6K
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Feb 2021 01:58:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=thyf8GD+m4378vGV5SBBvoSBeggWoa/fo8qOmAFKdas=; b=NVNYAU2xMpbDzS/lHC2+oJurF6
 /fcRXZsk1djMUHxvLsoNA73/5fnH5GdEoWrMG3R4Thi6Q8LTV1GqsQvw+S+0bVsbAqlhJfTz246Nl
 o3PJujLqYljnnQFV3OYsgZYkaJHiT0y1oiOXaWZeMeCb2Le5+9BA/U9Enc5Gl3RLlloE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:References:Cc:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=thyf8GD+m4378vGV5SBBvoSBeggWoa/fo8qOmAFKdas=; b=iNX3SAZnUXSvhUfhd+gwa1ezZn
 4qXf+vh6jmh+P0BubPd/WL0d1/cL5dNmbWgCVGQcRKqpbK/mHuft+/qS1SkCa2WEUxfmY168VxyEy
 Qxh4wigDbAM1W0oeVn7VV3czW9ZCxZRhs0Oz6e6469eh4QdDQy98bBfS7d2QleVmVsOo=;
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net ([165.227.154.27])
 by sfi-mx-1.v28.lw.sourceforge.com with smtp (Exim 4.92.2)
 id 1lFSOA-005iWW-A8
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Feb 2021 01:58:01 +0000
Received: from [10.115.11.33] (unknown [198.19.131.34])
 by front-2 (Coremail) with SMTP id DAGowAC3gX4JUjhgB7o1AA--.5397S3;
 Fri, 26 Feb 2021 09:42:33 +0800 (CST)
To: Eric Biggers <ebiggers@kernel.org>
References: <20210223112425.19180-1-heyunlei@hihonor.com>
 <c1ce1421-2576-5b48-322c-fa682c7510d7@kernel.org>
 <YDbbGSsd6ibKOpzT@sol.localdomain> <YDbdEEcEV5bzgtL6@sol.localdomain>
From: heyunlei 00015531 <heyunlei@hihonor.com>
Message-ID: <fae4a2f9-b1c9-e673-cefe-fe024ce6f9ab@hihonor.com>
Date: Fri, 26 Feb 2021 09:42:33 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <YDbdEEcEV5bzgtL6@sol.localdomain>
X-CM-TRANSID: DAGowAC3gX4JUjhgB7o1AA--.5397S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Kry3urWDKw1DtFyUAry8Grg_yoW8Cw4DpF
 WkJF10ka1DAry7urn2vF109r1FyFWUKrW7ZF98Xw109F1vvFnagr40qrZY9anFqr4xGa10
 qw47GFZrXr48CaDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU901xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l1IIY67AE
 w4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2
 IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW0oVCq3wA2z4x0Y4vEx4A2
 jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAS0I0E0xvYzxvE52
 x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUtVWr
 XwAv7VC2z280aVAFwI0_Gr1j6F4UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr4
 1lF7I21c0EjII2zVCS5cI20VAGYxC7Mxk0xIA0c2IEe2xFo4CEbIxvr21lc2xSY4AK6svP
 MxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_XFWUJr1UMxC20s026xCaFVCjc4
 AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE
 17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMI
 IF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq
 3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIda
 VFxhVjvjDU0xZFpf9x0JULTmhUUUUU=
X-CM-SenderInfo: pkh130hohlqxxlkr003uof0z/1tbiAQIGEV3ki2PqPwABsR
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [165.227.154.27 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: hihonor.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [165.227.154.27 listed in wl.mailspike.net]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.4 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1lFSOA-005iWW-A8
Subject: Re: [f2fs-dev] [PATCH] f2fs: fsverity: Truncate cache pages if set
 verity failed
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
Cc: jaegeuk@kernel.org, linux-fscrypt@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CuWcqCAyMDIxLzIvMjUgNzoxMSwgRXJpYyBCaWdnZXJzIOWGmemBkzoKPiBPbiBXZWQsIEZlYiAy
NCwgMjAyMSBhdCAwMzowMjo1MlBNIC0wODAwLCBFcmljIEJpZ2dlcnMgd3JvdGU6Cj4+IEhpIFl1
bmxlaSwKPj4KPj4gT24gV2VkLCBGZWIgMjQsIDIwMjEgYXQgMDk6MTY6MjRQTSArMDgwMCwgQ2hh
byBZdSB3cm90ZToKPj4+IEhpIFl1bmxlaSwKPj4+Cj4+PiBPbiAyMDIxLzIvMjMgMTk6MjQsIGhl
eXVubGVpIHdyb3RlOgo+Pj4+IElmIGZpbGUgZW5hYmxlIHZlcml0eSBmYWlsZWQsIHNob3VsZCB0
cnVuY2F0ZSBhbnl0aGluZyB3cm90ZQo+Pj4+IHBhc3QgaV9zaXplLCBpbmNsdWRpbmcgY2FjaGUg
cGFnZXMuCj4+PiArQ2MgRXJpYywKPj4+Cj4+PiBBZnRlciBmYWlsdXJlIG9mIGVuYWJsaW5nIHZl
cml0eSwgd2Ugd2lsbCBzZWUgdmVyaXR5IG1ldGFkYXRhIGlmIHdlIHRydW5jYXRlCj4+PiBmaWxl
IHRvIGxhcmdlciBzaXplIGxhdGVyPwo+Pj4KPj4+IFRoYW5rcywKSGkgRXJpY++8jAo+Pj4+IFNp
Z25lZC1vZmYtYnk6IGhleXVubGVpIDxoZXl1bmxlaUBoaWhvbm9yLmNvbT4KPj4+PiAtLS0KPj4+
PiAgICBmcy9mMmZzL3Zlcml0eS5jIHwgNCArKystCj4+Pj4gICAgMSBmaWxlIGNoYW5nZWQsIDMg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2ZzL2Yy
ZnMvdmVyaXR5LmMgYi9mcy9mMmZzL3Zlcml0eS5jCj4+Pj4gaW5kZXggMDU0ZWM4NTJiNWVhLi5m
MWY5YjkzNjFhNzEgMTAwNjQ0Cj4+Pj4gLS0tIGEvZnMvZjJmcy92ZXJpdHkuYwo+Pj4+ICsrKyBi
L2ZzL2YyZnMvdmVyaXR5LmMKPj4+PiBAQCAtMTcwLDggKzE3MCwxMCBAQCBzdGF0aWMgaW50IGYy
ZnNfZW5kX2VuYWJsZV92ZXJpdHkoc3RydWN0IGZpbGUgKmZpbHAsIGNvbnN0IHZvaWQgKmRlc2Ms
Cj4+Pj4gICAgCX0KPj4+PiAgICAJLyogSWYgd2UgZmFpbGVkLCB0cnVuY2F0ZSBhbnl0aGluZyB3
ZSB3cm90ZSBwYXN0IGlfc2l6ZS4gKi8KPj4+PiAtCWlmIChkZXNjID09IE5VTEwgfHwgZXJyKQo+
Pj4+ICsJaWYgKGRlc2MgPT0gTlVMTCB8fCBlcnIpIHsKPj4+PiArCQl0cnVuY2F0ZV9pbm9kZV9w
YWdlcyhpbm9kZS0+aV9tYXBwaW5nLCBpbm9kZS0+aV9zaXplKTsKPj4+PiAgICAJCWYyZnNfdHJ1
bmNhdGUoaW5vZGUpOwo+Pj4+ICsJfQo+Pj4+ICAgIAljbGVhcl9pbm9kZV9mbGFnKGlub2RlLCBG
SV9WRVJJVFlfSU5fUFJPR1JFU1MpOwo+Pj4+CkJ5IHRoZSB3YXnvvIxzaG91bGTCoCB3ZSBjb25z
aWRlcsKgIHNldCB4YXR0ciBmYWlsZWQ/CgpUaGFua3MuCgo+PiBUaGlzIGxvb2tzIGdvb2Q7IHRo
YW5rcyBmb3IgZmluZGluZyB0aGlzLiAgWW91IGNhbiBhZGQ6Cj4+Cj4+IAlSZXZpZXdlZC1ieTog
RXJpYyBCaWdnZXJzIDxlYmlnZ2Vyc0Bnb29nbGUuY29tPgo+Pgo+PiBJIHRob3VnaHQgdGhhdCBm
MmZzX3RydW5jYXRlKCkgd291bGQgdHJ1bmNhdGUgcGFnZWNhY2hlIHBhZ2VzIHRvbywgYnV0IGlu
IGZhY3QKPj4gdGhhdCdzIG5vdCB0aGUgY2FzZS4KPj4KPj4gZXh0NF9lbmRfZW5hYmxlX3Zlcml0
eSgpIGhhcyB0aGUgc2FtZSBidWcgdG9vLiAgQ2FuIHlvdSBwbGVhc2Ugc2VuZCBhIHBhdGNoIGZv
cgo+PiB0aGF0IHRvbyAodG8gbGludXgtZXh0NCk/Cj4+Cj4gQWxzbyBwbGVhc2UgaW5jbHVkZSB0
aGUgZm9sbG93aW5nIHRhZ3MgaW4gdGhlIGYyZnMgcGF0Y2g6Cj4KPiAJRml4ZXM6IDk1YWUyNTFm
ZTgyOCAoImYyZnM6IGFkZCBmcy12ZXJpdHkgc3VwcG9ydCIpCj4gCUNjOiA8c3RhYmxlQHZnZXIu
a2VybmVsLm9yZz4gIyB2NS40Kwo+Cj4gYW5kIGluIHRoZSBleHQ0IHBhdGNoOgo+Cj4gCUZpeGVz
OiBjOTNkOGY4ODU4MDkgKCJleHQ0OiBhZGQgYmFzaWMgZnMtdmVyaXR5IHN1cHBvcnQiKQo+IAlD
YzogPHN0YWJsZUB2Z2VyLmtlcm5lbC5vcmc+ICMgdjUuNCsKPgo+IC0gRXJpYwoKCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVs
IG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
Cg==
