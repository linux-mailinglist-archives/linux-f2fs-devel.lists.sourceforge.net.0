Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7130B4D27C5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  9 Mar 2022 05:12:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nRnh1-0001SJ-TI; Wed, 09 Mar 2022 04:12:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nRngz-0001SC-VC
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Mar 2022 04:12:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uTZdlSLWEfLCQ4Yu1JJWqXITEEMrkg4subH0/DEjQ8w=; b=Achv9eer3OKzyRF8VsshYSvByz
 ogaHsU2/Un/5SpYnfVRjs+9mQAg8yx10vGObVWtqjAjX1agBlT6GIixWzQMFVDs9KcTKcRaDT3oj/
 dHP8wIIxRxcq1sE8LWSes433/qJ3kih9aR3X/pqeqlBaAYrITa/lu8WjyOKbM1yHr48Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uTZdlSLWEfLCQ4Yu1JJWqXITEEMrkg4subH0/DEjQ8w=; b=Bnz+0k61IrQj0FLNlSQUYcoPhz
 NpkHHjJL0VniRTxGxFAqKDe/rIFdvwb4vAhEoxG9crlR1EHivsyuubEcsMzOVYX6EWumHX+EeFsGq
 1JV2JoL8hCQU//B/P56fNdPFePDYk49d+3tC/HaSmqA/Baxne1Iv1/U5a2mUP4qvhMGw=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nRngw-0002Jh-3Q
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 09 Mar 2022 04:12:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 80203CE095C;
 Wed,  9 Mar 2022 04:12:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD624C340E8;
 Wed,  9 Mar 2022 04:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646799153;
 bh=1SEMoTRfJqQyEp65LzLz5xMHwnsjleW4xciUaChBwdw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=NmoVoVtxe+gogqgtEaVbibfuaWrmfgtE0KZH6tKcfQW1lgXMpdYGotSbPjaOZnps/
 qQFcPz/1B5lRodfWz5YVA2cAx3OFW1et3g8DY6KDM3wf5SNiO8qq50xoufsA/p4Mw8
 AvuG00R7Ru8HfFVc4/0SZEQm9U18YEeLGkbHormv6abpOzQ2lghsxvUlB98m2Zf0pq
 83Utgl5sQI+XhwyGupMRxQ3pyIAZCrmnB6/989+Ldy3mwlVU1yUvBzq2JaDIMuQCcp
 wovy3HkGDv0HXu/yvogHOHftEjd5neZDSeEn1BA0mLXqGofYAvDWQq3qt+khdmCI7t
 pKIeo6DhBGfzA==
Message-ID: <edbf3e72-ab58-74d8-52f2-34b4034b484d@kernel.org>
Date: Wed, 9 Mar 2022 12:12:30 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Content-Language: en-US
To: Jia Yang <jiayang5@huawei.com>, jaegeuk@kernel.org
References: <20220307081227.1353957-1-jiayang5@huawei.com>
 <0833a084-f31d-2815-40cf-c8e173feec02@kernel.org>
 <1dfef1c2-2bea-e4ca-39d1-986c2c9b0813@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <1dfef1c2-2bea-e4ca-39d1-986c2c9b0813@huawei.com>
X-Spam-Score: -7.9 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022/3/8 16:19, Jia Yang via Linux-f2fs-devel wrote: >
 > > On 2022/3/7 18:40, Chao Yu wrote: >> On 2022/3/7 16:12,
 Jia Yang via Linux-f2fs-devel
 wrote: >>> F2FS_FITS_IN_INODE only cares the type of [...] 
 Content analysis details:   (-7.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nRngw-0002Jh-3Q
Subject: Re: [f2fs-dev] [PATCH -next] f2fs: remove unnecessary read for
 F2FS_FITS_IN_INODE
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMi8zLzggMTY6MTksIEppYSBZYW5nIHZpYSBMaW51eC1mMmZzLWRldmVsIHdyb3RlOgo+
IAo+IAo+IE9uIDIwMjIvMy83IDE4OjQwLCBDaGFvIFl1IHdyb3RlOgo+PiBPbiAyMDIyLzMvNyAx
NjoxMiwgSmlhIFlhbmcgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+PiBGMkZTX0ZJVFNf
SU5fSU5PREUgb25seSBjYXJlcyB0aGUgdHlwZSBvZiBmMmZzIGlub2RlLCBzbyB0aGVyZQo+Pj4g
aXMgbm8gbmVlZCB0byByZWFkIG5vZGUgcGFnZSBvZiBmMmZzIGlub2RlLgo+Pj4KPj4+IFNpZ25l
ZC1vZmYtYnk6IEppYSBZYW5nIDxqaWF5YW5nNUBodWF3ZWkuY29tPgo+Pj4gLS0tCj4+PiAgwqAg
ZnMvZjJmcy9maWxlLmMgfCAxMCArKy0tLS0tLS0tCj4+PiAgwqAgMSBmaWxlIGNoYW5nZWQsIDIg
aW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZnMvZjJm
cy9maWxlLmMgYi9mcy9mMmZzL2ZpbGUuYwo+Pj4gaW5kZXggY2ZkYzQxZjg3ZjVkLi40YjkzZmJl
YzJlYzAgMTAwNjQ0Cj4+PiAtLS0gYS9mcy9mMmZzL2ZpbGUuYwo+Pj4gKysrIGIvZnMvZjJmcy9m
aWxlLmMKPj4+IEBAIC0yOTk5LDcgKzI5OTksNyBAQCBzdGF0aWMgaW50IGYyZnNfaW9jX3NldHBy
b2plY3Qoc3RydWN0IGlub2RlICppbm9kZSwgX191MzIgcHJvamlkKQo+Pj4gIMKgIHsKPj4+ICDC
oMKgwqDCoMKgIHN0cnVjdCBmMmZzX2lub2RlX2luZm8gKmZpID0gRjJGU19JKGlub2RlKTsKPj4+
ICDCoMKgwqDCoMKgIHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSA9IEYyRlNfSV9TQihpbm9kZSk7
Cj4+PiAtwqDCoMKgIHN0cnVjdCBwYWdlICppcGFnZTsKPj4+ICvCoMKgwqAgc3RydWN0IGYyZnNf
aW5vZGUgKnJpOwo+Pgo+PiBzdHJ1Y3QgZjJmc19pbm9kZSAqcmkgPSBOVUxMOwo+Pgo+PiAob2Zm
c2V0b2YodHlwZW9mKCooZjJmc19pbm9kZSkpLCBmaWVsZCkgKwo+PiBzaXplb2YoKGYyZnNfaW5v
ZGUpLT5maWVsZCkKPj4KPj4gQSBsaXR0bGUgYml0IHdvcnJ5IGFib3V0IHVzaW5nIGEgTlVMTCBw
b2ludGVyIGhlcmUsIGR1ZSB0byBub3Qgc3VyZSB0aGUgcmVzdWx0IG9mCj4+IG9mZnNldG9mKCkg
YW5kIHNpemVvZigpIHdpbGwgYWx3YXlzIGJlIGNhbGN1bGF0ZWQgYXQgY29tcGlsaW5nIHRpbWUg
Zm9yIGFsbCBraW5kIG9mCj4+IGNvbXBpbGVycywgY2FuIHdlIGd1YXJhbnRlZSB0aGF0Pwo+IAo+
IFdlIGNhbid0IGd1YXJhbnRlZSB0aGF0LCBidXQgSSBzZWUgdGhhdCBmMmZzX2dldGF0dHIgYWxz
byBydW5zIGluIHRoaXMgd2F5LiBEbyB5b3UgdGhpbmsgdGhhdCBhbGxvY2F0aW5nIG1lbW9yeSBm
b3IKPiBmMmZzIGlub2RlIGlzIGF2YWlsYWJsZT8KCldlbGwsIGl0IGxvb2tzIGV4dDRfZ2V0YXR0
cigpIGFsc28gZGlkIHRoaXMgd2F5Li4uCgpIb3cgYWJvdXQgaW5pdGlhbGl6aW5nIHJpIHcvIE5V
TEwgYXQgbGVhc3Q/CgpUaGFua3MsCgo+IAo+IFRoYW5rcy4KPiAKPj4KPj4+ICDCoMKgwqDCoMKg
IGtwcm9qaWRfdCBrcHJvamlkOwo+Pj4gIMKgwqDCoMKgwqAgaW50IGVycjsKPj4+ICDCoCBAQCAt
MzAyMywxNyArMzAyMywxMSBAQCBzdGF0aWMgaW50IGYyZnNfaW9jX3NldHByb2plY3Qoc3RydWN0
IGlub2RlICppbm9kZSwgX191MzIgcHJvamlkKQo+Pj4gIMKgwqDCoMKgwqAgaWYgKElTX05PUVVP
VEEoaW5vZGUpKQo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gZXJyOwo+Pj4gIMKgIC3C
oMKgwqAgaXBhZ2UgPSBmMmZzX2dldF9ub2RlX3BhZ2Uoc2JpLCBpbm9kZS0+aV9pbm8pOwo+Pj4g
LcKgwqDCoCBpZiAoSVNfRVJSKGlwYWdlKSkKPj4+IC3CoMKgwqDCoMKgwqDCoCByZXR1cm4gUFRS
X0VSUihpcGFnZSk7Cj4+PiAgwqAgLcKgwqDCoCBpZiAoIUYyRlNfRklUU19JTl9JTk9ERShGMkZT
X0lOT0RFKGlwYWdlKSwgZmktPmlfZXh0cmFfaXNpemUsCj4+PiAtwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgaV9wcm9qaWQpKSB7
Cj4+PiArwqDCoMKgIGlmICghRjJGU19GSVRTX0lOX0lOT0RFKHJpLCBmaS0+aV9leHRyYV9pc2l6
ZSwgaV9wcm9qaWQpKSB7Cj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIGVyciA9IC1FT1ZFUkZMT1c7
Cj4+PiAtwqDCoMKgwqDCoMKgwqAgZjJmc19wdXRfcGFnZShpcGFnZSwgMSk7Cj4+PiAgwqDCoMKg
wqDCoMKgwqDCoMKgIHJldHVybiBlcnI7Cj4+Cj4+IHJldHVybiAtRU9WRVJGTE9XOwo+Pgo+PiBU
aGFua3MsCj4+Cj4+PiAgwqDCoMKgwqDCoCB9Cj4+PiAtwqDCoMKgIGYyZnNfcHV0X3BhZ2UoaXBh
Z2UsIDEpOwo+Pj4gIMKgIMKgwqDCoMKgwqAgZXJyID0gZjJmc19kcXVvdF9pbml0aWFsaXplKGlu
b2RlKTsKPj4+ICDCoMKgwqDCoMKgIGlmIChlcnIpCj4+IC4KPiAKPiAKPiBfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFp
bGluZyBsaXN0Cj4gTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRw
czovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVs
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
ZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3Jn
ZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgt
ZjJmcy1kZXZlbAo=
