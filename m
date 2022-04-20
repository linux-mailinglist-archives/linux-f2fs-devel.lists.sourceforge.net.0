Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6993D5085EF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Apr 2022 12:30:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nh7bk-0008Hf-Uk; Wed, 20 Apr 2022 10:30:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chao@kernel.org>) id 1nh7bj-0008HZ-80
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Apr 2022 10:30:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x0LmH9bLfZciv+0Jfo253mz0lLIn4yftGKOGY84keYs=; b=kgDEEI7EDxR7ztFwwFQROYLQsw
 0IOtSyTUiZBw/0XeM1LkaCNfiJkCEBN0n7FTrQQS48iJ5Ii9FZrSVT4z+QkqXfCD7awXqbhv1723w
 RrydWKsCX4YJyIBEGoc1TbiBpXJVd6WA9V/ilBCz6WernMDejcs/fI1fNc0fWW2oiwAw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x0LmH9bLfZciv+0Jfo253mz0lLIn4yftGKOGY84keYs=; b=nRZyn+5heIaLm3WRO9CDXsY5cr
 e2BDXQDo2gSlki6MpjdnEbp11d0fMLYqRiHQK2ZD7ava7sp/n1fi/VmXy1pxBM8bDXxmwXshYyzjN
 TEFvTEMjpi9TxEGYSn1B4sjTtLWEmPFDlj+kbcJ9iASBNPhUwDHFq72U4qn9Nd5DNL78=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nh7be-004bYv-TT
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 20 Apr 2022 10:30:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AFE65617C5;
 Wed, 20 Apr 2022 10:30:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78906C385A0;
 Wed, 20 Apr 2022 10:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650450632;
 bh=vqS1WWRZzXHeBbiByLV1E04154iAQt2q/oPcDwT7ZUI=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=R29RxkkOWWNU/PDqmAMmrlg5nNqmthlTLo9BoMYxmfgvHmyW3QvFH3NKbNQtStKJm
 LEdP1ohJr146Mi7wB74i9VZOA/iWXjU4uOozciahag/aFqrt0/sMmL+NYjG2sauD2O
 q4sWI3/XLLPAorlxeYLDtudbDrWCnE3HJXBuZYrCBB54TM1ZcTu3B/WzY3YtPxKTCT
 Y/4+qd9I+k7QgQKKZpovvIOqAKE+Yvk1bCj3luf3gSCF/NDuYLfpNTNkJ6NkuRQ7Uy
 WOuoOdQzZGocpPQCV3xkUmTbI6ot+8MrfIIEaBnkfuNoZRZ7lJ4BTRb94rfNoujDif
 AAEgtSfR5E4LA==
Message-ID: <5385339a-4a9f-2499-0ee2-0358c456d2f1@kernel.org>
Date: Wed, 20 Apr 2022 18:30:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
To: Yufen Yu <yuyufen@huawei.com>, linux-f2fs-devel@lists.sourceforge.net
References: <20220418024327.1628327-1-yuyufen@huawei.com>
 <cddfa7a5-8e8d-6c15-707c-8721ab6c0be8@kernel.org>
 <ae3e6ed3-e153-de5c-03e8-c5f0924eb525@huawei.com>
From: Chao Yu <chao@kernel.org>
In-Reply-To: <ae3e6ed3-e153-de5c-03e8-c5f0924eb525@huawei.com>
X-Spam-Score: -9.9 (---------)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On 2022/4/20 15:27, Yufen Yu via Linux-f2fs-devel wrote: >
    > > On 2022/4/19 10:10, Chao Yu wrote: >> On 2022/4/18 10:43, Yufen Yu via
    Linux-f2fs-devel wrote: >>> Usage: >>>     dump.f2fs -I [inode [...] 
 
 Content analysis details:   (-9.9 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
                             high trust
                             [139.178.84.217 listed in list.dnswl.org]
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
 -4.1 NICE_REPLY_A           Looks like a legit reply (A)
 -0.6 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nh7be-004bYv-TT
Subject: Re: [f2fs-dev] [PATCH v2] dump.f2fs: add -I nid to dump inode by
 scan full disk
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMi80LzIwIDE1OjI3LCBZdWZlbiBZdSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToK
PiAKPiAKPiBPbiAyMDIyLzQvMTkgMTA6MTAsIENoYW8gWXUgd3JvdGU6Cj4+IE9uIDIwMjIvNC8x
OCAxMDo0MywgWXVmZW4gWXUgdmlhIExpbnV4LWYyZnMtZGV2ZWwgd3JvdGU6Cj4+PiBVc2FnZToK
Pj4+IMKgwqDCoMKgZHVtcC5mMmZzIC1JIFtpbm9kZSBuaWRdIC9kZXYvc2RhCj4+Pgo+Pj4gVGhp
cyBmZWF0dXJlIGNhbiBiZSB1c2VmdWwgZm9yIHNvbWUgYnVncyBjYXVzZWQgYnkgc3lzdGVtIGNy
YXNoLgo+Pj4gV2Ugbm90IG9ubHkgbmVlZCBkdW1wIGN1cnJlbnQgdmFsaWQgbm9kZSBwYWdlLCBi
dXQgYWxzZSB0aGUgaGlzdG9yeQo+Pj4gZGF0YSBpbiBkaXNrLCB3aGljaCBjYW4gZ2l2ZSBzb21l
IGNsdWVzIGZvciBzdGF0dXMgY2hhbmdlIG9mIHRoZSBpbm9kZS4KPj4+Cj4+PiBTaWduZWQtb2Zm
LWJ5OiBZdWZlbiBZdSA8eXV5dWZlbkBodWF3ZWkuY29tPgo+Pj4gLS0tCj4+PiDCoCBmc2NrL2R1
bXAuY8KgwqDCoMKgIHwgMjkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysKPj4+IMKgIGZz
Y2svZnNjay5owqDCoMKgwqAgfMKgIDEgKwo+Pj4gwqAgZnNjay9tYWluLmPCoMKgwqDCoCB8IDE0
ICsrKysrKysrKysrKystCj4+PiDCoCBtYW4vZHVtcC5mMmZzLjggfMKgIDcgKysrKysrKwo+Pj4g
wqAgNCBmaWxlcyBjaGFuZ2VkLCA1MCBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCj4+Pgo+
Pj4gZGlmZiAtLWdpdCBhL2ZzY2svZHVtcC5jIGIvZnNjay9kdW1wLmMKPj4+IGluZGV4IGZjZTg2
YzkuLjdmZjBiMjggMTAwNjQ0Cj4+PiAtLS0gYS9mc2NrL2R1bXAuYwo+Pj4gKysrIGIvZnNjay9k
dW1wLmMKPj4+IEBAIC01MzksNiArNTM5LDM1IEBAIHN0YXRpYyBib29sIGlzX3NpdF9iaXRtYXBf
c2V0KHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSwgdTMyIGJsa19hZGRyKQo+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgKGNvbnN0IGNoYXIgKilzZS0+Y3VyX3ZhbGlkX21hcCkgIT0gMDsK
Pj4+IMKgIH0KPj4+ICt2b2lkIGR1bXBfbm9kZV9zY2FuX2Rpc2soc3RydWN0IGYyZnNfc2JfaW5m
byAqc2JpLCBuaWRfdCBuaWQpCj4+PiArewo+Pj4gK8KgwqDCoCBzdHJ1Y3QgZjJmc19ub2RlICpu
b2RlX2JsazsKPj4+ICvCoMKgwqAgcGdvZmZfdCBibGthZGRyOwo+Pj4gK8KgwqDCoCBpbnQgcmV0
Owo+Pj4gK8KgwqDCoCBwZ29mZl90IHN0YXJ0X2Jsa2FkZHIgPSBTTV9JKHNiaSktPm1haW5fYmxr
YWRkcjsKPj4+ICvCoMKgwqAgcGdvZmZfdCBlbmRfYmxrYWRkciA9IHN0YXJ0X2Jsa2FkZHIgKwo+
Pj4gK8KgwqDCoMKgwqDCoMKgIChTTV9JKHNiaSktPm1haW5fc2VnbWVudHMgPDwgc2JpLT5sb2df
YmxvY2tzX3Blcl9zZWcpOwo+Pj4gKwo+Pj4gK8KgwqDCoCBub2RlX2JsayA9IGNhbGxvYyhCTE9D
S19TWiwgMSk7Cj4+PiArwqDCoMKgIEFTU0VSVChub2RlX2Jsayk7Cj4+PiArwqDCoMKgIE1TRygw
LCAiSW5mbzogc2NhbiBhbGwgbmlkOiAldSBmcm9tIGJsb2NrX2FkZHIgWyVsdTogJWx1XVxuIiwK
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIG5pZCwgc3RhcnRfYmxrYWRkciwgZW5kX2Jsa2Fk
ZHIpOwo+Pj4gKwo+Pj4gK8KgwqDCoCBmb3IgKGJsa2FkZHIgPSBzdGFydF9ibGthZGRyOyBibGth
ZGRyIDwgZW5kX2Jsa2FkZHI7IGJsa2FkZHIrKykgewo+Pgo+PiBTaG91bGRuJ3Qgd2Ugc2tpcCBk
YXRhIHNlZ21lbnQ/IG90aGVyd2lzZSBpdCdzIHBvc3NpYmxlIHRvIGVuY291bnRlciBkYXRhCj4+
IGNvbGxpc2lvbiBpbiB0cmF2ZXJzZWQgZGF0YSBibG9jay4KPj4KPiAKPiBZZWFoLCBza2lwcGlu
ZyBkYXRhIHNlZ21lbnQgY2FuIGJlIG1vcmUgc3RyaWN0LiBCdXQsIEkgYW0gbm90IHN1cmUgc2Vn
bWVudCB0eXBlCj4gaXMgY29ycmVjdCBmb3Igc29tZSBpbnZhbGlkIHNlZ21lbnRzLiBUbyBtYWtl
IHRoaW5ncyBtb3JlIGVhc3ksIEkganVzdCB0cmF2ZXJzZSBhbGwKPiBtYWluIGJsb2NrcyBhbmQg
aWRlbnRpZnkgdGhlIHRhcmdldCBpbm9kZSBieSBjaGVja2luZyBmb290ZXIuaW5vIGFuZCBmb290
ZXIubmlkLgoKRXZlbiBpZiBzZWdtZW50IGlzIGludmFsaWQsIGJsb2NrIHR5cGUgaW4gc2VnbWVu
dCBzaG91bGQgYmUgY29uc2lzdGVudCB3aXRoCnRoZSBzZWd0eXBlIHJlY29yZGVkIGluIFNJVCwg
cmlnaHQ/CgpUaGFua3MsCgo+IAo+IFRoYW5rcywKPiAKPiAKPj4gVGhhbmtzLAo+Pgo+Pj4gK8Kg
wqDCoMKgwqDCoMKgIHJldCA9IGRldl9yZWFkX2Jsb2NrKG5vZGVfYmxrLCBibGthZGRyKTsKPj4+
ICvCoMKgwqDCoMKgwqDCoCBBU1NFUlQocmV0ID49IDApOwo+Pj4gK8KgwqDCoMKgwqDCoMKgIGlm
IChsZTMyX3RvX2NwdShub2RlX2Jsay0+Zm9vdGVyLmlubykgIT0gbmlkIHx8Cj4+PiArwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGxlMzJfdG9fY3B1KG5vZGVfYmxrLT5mb290ZXIubmlk
KSAhPSBuaWQpCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsKPj4+ICvCoMKg
wqDCoMKgwqDCoCBNU0coMCwgIkluZm86IG5pZDogJXUsIGJsa2FkZHI6ICVsdVxuIiwgbmlkLCBi
bGthZGRyKTsKPj4+ICvCoMKgwqDCoMKgwqDCoCBNU0coMCwgIm5vZGVfYmxrLmZvb3Rlci5mbGFn
IFsweCV4XVxuIiwgbGUzMl90b19jcHUobm9kZV9ibGstPmZvb3Rlci5mbGFnKSk7Cj4+PiArwqDC
oMKgwqDCoMKgwqAgTVNHKDAsICJub2RlX2Jsay5mb290ZXIuY3BfdmVyIFsleF1cbiIsICh1MzIp
KGNwdmVyX29mX25vZGUobm9kZV9ibGspKSk7Cj4+PiArwqDCoMKgwqDCoMKgwqAgcHJpbnRfaW5v
ZGVfaW5mbyhzYmksIG5vZGVfYmxrLCAwKTsKPj4+ICvCoMKgwqAgfQo+Pj4gKwo+Pj4gK8KgwqDC
oCBmcmVlKG5vZGVfYmxrKTsKPj4+ICt9Cj4+PiArCj4+PiDCoCBpbnQgZHVtcF9ub2RlKHN0cnVj
dCBmMmZzX3NiX2luZm8gKnNiaSwgbmlkX3QgbmlkLCBpbnQgZm9yY2UpCj4+PiDCoCB7Cj4+PiDC
oMKgwqDCoMKgIHN0cnVjdCBub2RlX2luZm8gbmk7Cj4+PiBkaWZmIC0tZ2l0IGEvZnNjay9mc2Nr
LmggYi9mc2NrL2ZzY2suaAo+Pj4gaW5kZXggY2U1ZmZmZS4uMGM4MTlmMCAxMDA2NDQKPj4+IC0t
LSBhL2ZzY2svZnNjay5oCj4+PiArKysgYi9mc2NrL2ZzY2suaAo+Pj4gQEAgLTI2Miw2ICsyNjIs
NyBAQCBzdHJ1Y3QgZHVtcF9vcHRpb24gewo+Pj4gwqDCoMKgwqDCoCBpbnQgc3RhcnRfc3NhOwo+
Pj4gwqDCoMKgwqDCoCBpbnQgZW5kX3NzYTsKPj4+IMKgwqDCoMKgwqAgaW50MzJfdCBibGtfYWRk
cjsKPj4+ICvCoMKgwqAgbmlkX3Qgc2Nhbl9uaWQ7Cj4+PiDCoCB9Owo+Pj4gwqAgZXh0ZXJuIHZv
aWQgbmF0X2R1bXAoc3RydWN0IGYyZnNfc2JfaW5mbyAqLCBuaWRfdCwgbmlkX3QpOwo+Pj4gZGlm
ZiAtLWdpdCBhL2ZzY2svbWFpbi5jIGIvZnNjay9tYWluLmMKPj4+IGluZGV4IGU0Y2ZkZjQuLmM3
YWQ1YWQgMTAwNjQ0Cj4+PiAtLS0gYS9mc2NrL21haW4uYwo+Pj4gKysrIGIvZnNjay9tYWluLmMK
Pj4+IEBAIC05Myw2ICs5Myw3IEBAIHZvaWQgZHVtcF91c2FnZSgpCj4+PiDCoMKgwqDCoMKgIE1T
RygwLCAiW29wdGlvbnNdOlxuIik7Cj4+PiDCoMKgwqDCoMKgIE1TRygwLCAiwqAgLWQgZGVidWcg
bGV2ZWwgW2RlZmF1bHQ6MF1cbiIpOwo+Pj4gwqDCoMKgwqDCoCBNU0coMCwgIsKgIC1pIGlub2Rl
IG5vIChoZXgpXG4iKTsKPj4+ICvCoMKgwqAgTVNHKDAsICLCoCAtSSBpbm9kZSBubyAoaGV4KSBz
Y2FuIGZ1bGwgZGlza1xuIik7Cj4+PiDCoMKgwqDCoMKgIE1TRygwLCAiwqAgLW4gW05BVCBkdW1w
IG5pZCBmcm9tICMxfiMyIChkZWNpbWFsKSwgZm9yIGFsbCAwfi0xXVxuIik7Cj4+PiDCoMKgwqDC
oMKgIE1TRygwLCAiwqAgLU0gc2hvdyBhIGJsb2NrIG1hcFxuIik7Cj4+PiDCoMKgwqDCoMKgIE1T
RygwLCAiwqAgLXMgW1NJVCBkdW1wIHNlZ25vIGZyb20gIzF+IzIgKGRlY2ltYWwpLCBmb3IgYWxs
IDB+LTFdXG4iKTsKPj4+IEBAIC0zODIsNyArMzgzLDcgQEAgdm9pZCBmMmZzX3BhcnNlX29wdGlv
bnMoaW50IGFyZ2MsIGNoYXIgKmFyZ3ZbXSkKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoCB9Cj4+PiDC
oMKgwqDCoMKgIH0gZWxzZSBpZiAoIXN0cmNtcCgiZHVtcC5mMmZzIiwgcHJvZykpIHsKPj4+IMKg
ICNpZmRlZiBXSVRIX0RVTVAKPj4+IC3CoMKgwqDCoMKgwqDCoCBjb25zdCBjaGFyICpvcHRpb25f
c3RyaW5nID0gImQ6aTpuOk1zOlNhOmI6ViI7Cj4+PiArwqDCoMKgwqDCoMKgwqAgY29uc3QgY2hh
ciAqb3B0aW9uX3N0cmluZyA9ICJkOmk6STpuOk1zOlNhOmI6ViI7Cj4+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgc3RhdGljIHN0cnVjdCBkdW1wX29wdGlvbiBkdW1wX29wdCA9IHsKPj4+IMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIC5uaWQgPSAwLMKgwqDCoCAvKiBkZWZhdWx0IHJvb3QgaW5vICov
Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuc3RhcnRfbmF0ID0gLTEsCj4+PiBAQCAt
MzkyLDYgKzM5Myw3IEBAIHZvaWQgZjJmc19wYXJzZV9vcHRpb25zKGludCBhcmdjLCBjaGFyICph
cmd2W10pCj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuc3RhcnRfc3NhID0gLTEsCj4+
PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAuZW5kX3NzYSA9IC0xLAo+Pj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgLmJsa19hZGRyID0gLTEsCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCAuc2Nhbl9uaWQgPSAwLAo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIH07Cj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgYy5mdW5jID0gRFVNUDsKPj4+IEBAIC00MjQsNiArNDI2LDE0IEBAIHZvaWQg
ZjJmc19wYXJzZV9vcHRpb25zKGludCBhcmdjLCBjaGFyICphcmd2W10pCj4+PiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gc3NjYW5mKG9wdGFyZywgIiV4
IiwKPj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgJmR1bXBfb3B0Lm5pZCk7Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIGJyZWFrOwo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2FzZSAnSSc6Cj4+PiAr
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChzdHJuY21wKG9wdGFyZywgIjB4Iiwg
MikpCj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0ID0gc3Nj
YW5mKG9wdGFyZywgIiVkIiwKPj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgJmR1bXBfb3B0LnNjYW5fbmlkKTsKPj4+ICvCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgZWxzZQo+Pj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIHJldCA9IHNzY2FuZihvcHRhcmcsICIleCIsCj4+PiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZkdW1wX29wdC5zY2Fu
X25pZCk7Cj4+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGJyZWFrOwo+Pj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgY2FzZSAnbic6Cj4+PiDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHJldCA9IHNzY2FuZihvcHRhcmcsICIlZH4lZCIsCj4+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZkdW1w
X29wdC5zdGFydF9uYXQsCj4+PiBAQCAtOTE2LDYgKzkyNiw4IEBAIHN0YXRpYyB2b2lkIGRvX2R1
bXAoc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGR1bXBf
aW5mb19mcm9tX2Jsa2FkZHIoc2JpLCBvcHQtPmJsa19hZGRyKTsKPj4+IMKgwqDCoMKgwqAgaWYg
KG9wdC0+bmlkKQo+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgIGR1bXBfbm9kZShzYmksIG9wdC0+bmlk
LCAwKTsKPj4+ICvCoMKgwqAgaWYgKG9wdC0+c2Nhbl9uaWQpCj4+PiArwqDCoMKgwqDCoMKgwqAg
ZHVtcF9ub2RlX3NjYW5fZGlzayhzYmksIG9wdC0+c2Nhbl9uaWQpOwo+Pj4gwqDCoMKgwqDCoCBw
cmludF9jcF9zdGF0ZShmbGFnKTsKPj4+IGRpZmYgLS1naXQgYS9tYW4vZHVtcC5mMmZzLjggYi9t
YW4vZHVtcC5mMmZzLjgKPj4+IGluZGV4IDFkZGI3ZmMuLjk0YmY1ZjMgMTAwNjQ0Cj4+PiAtLS0g
YS9tYW4vZHVtcC5mMmZzLjgKPj4+ICsrKyBiL21hbi9kdW1wLmYyZnMuOAo+Pj4gQEAgLTEwLDYg
KzEwLDEwIEBAIGR1bXAuZjJmcyBcLSByZXRyaWV2ZSBkaXJlY3RvcnkgYW5kIGZpbGUgZW50cmll
cyBmcm9tIGFuIEYyRlMtZm9ybWF0ZWQgaW1hZ2UKPj4+IMKgIC5JIGlub2RlIG51bWJlcgo+Pj4g
wqAgXQo+Pj4gwqAgWwo+Pj4gKy5CIFwtSQo+Pj4gKy5JIGlub2RlIG51bWJlcgo+Pj4gK10KPj4+
ICtbCj4+PiDCoCAuQiBcLW4KPj4+IMKgIC5JIE5BVCByYW5nZQo+Pj4gwqAgXQo+Pj4gQEAgLTUy
LDYgKzU2LDkgQEAgaXMgMCBvbiBzdWNjZXNzIGFuZCAtMSBvbiBmYWlsdXJlLgo+Pj4gwqAgLkJJ
IFwtaSAiIGlub2RlIG51bWJlciIKPj4+IMKgIFNwZWNpZnkgYW4gaW5vZGUgbnVtYmVyIHRvIGR1
bXAgb3V0Lgo+Pj4gwqAgLlRQCj4+PiArLkJJIFwtSSAiIGlub2RlIG51bWJlciIKPj4+ICtTcGVj
aWZ5IGFuIGlub2RlIG51bWJlciBhbmQgc2NhbiBmdWxsIGRpc2sgdG8gZHVtcCBvdXQsIGluY2x1
ZGUgaGlzdG9yeSBpbm9kZSBibG9jawo+Pj4gKy5UUAo+Pj4gwqAgLkJJIFwtbiAiIE5BVCByYW5n
ZSIKPj4+IMKgIFNwZWNpZnkgYSByYW5nZSBwcmVzZW50ZWQgYnkgbmlkcyB0byBkdW1wIE5BVCBl
bnRyaWVzLgo+Pj4gwqAgLlRQCj4+IC4KPiAKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwo+IExpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0Cj4g
TGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKPiBodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBt
YWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6
Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
