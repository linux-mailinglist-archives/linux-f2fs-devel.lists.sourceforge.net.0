Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D99322612D8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Sep 2020 16:42:19 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kFeoz-0002E2-0f; Tue, 08 Sep 2020 14:42:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1kFeox-0002Dv-NM
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Sep 2020 14:42:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZF+i2ngevySm2noG1kh8R8FeIEiMwqglWnWSAsZTveQ=; b=fbYezqywO+qGCAi4t6BKibsR29
 XP2F51yXwUsKlMcwDeHiwhfxhyqGTWPusTP2rZaKd40H8ILrLKKoNFTd/dDzkUAfxVUGIiMYMpig6
 aZNrdwB8mbRHgEfIwIHxUdwtgXehxX62PTBudYs0zLr/Ptfl6IId3ZvBkddzUOuUh4og=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:Cc:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZF+i2ngevySm2noG1kh8R8FeIEiMwqglWnWSAsZTveQ=; b=NymobalvnF0NHpBcXZrZucNt+v
 z7H4U1hIHzk5UXV6WQgvj5umZgzgnE8op82CMAcW7BIp4dh6yPTy3Xwoh44F0ihd7gChcuTcod/c5
 j3N/FFOJIr0K6PPGxCg+lFzmq9caugyO1X00Hj1KIL8t/lRLC2HcSVkzLeMx82a2VZfc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kFeoq-00GuA1-IS
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Sep 2020 14:42:07 +0000
Received: from [192.168.0.108] (unknown [117.89.211.136])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7649B20738;
 Tue,  8 Sep 2020 14:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1599576105;
 bh=pUvSZGEzBmeMT5do8CKTRcQIgzLPg8Ae9OqnXr3C6bg=;
 h=Subject:To:References:Cc:From:Date:In-Reply-To:From;
 b=C7eMaqys91OtZ7xrD1tpXIKHIIBtTxX75XOR0f482ufBg0K5XbUvo8LSu2OoJfC1d
 RhQJcOIU4aevcl3cQpsoJPcAsuGZSsHA3IVKN4V727fNf45WjeEAiUAaFj5jzaoVTc
 WTkVlJPecQJ3B3q+dn/qvMggad1bJrbeUSaeE37Y=
To: Daeho Jeong <daeho43@gmail.com>, Chao Yu <yuchao0@huawei.com>
References: <20200903024442.296703-1-daeho43@gmail.com>
 <4c5dcf19-4495-5181-1695-fddf05c3bf24@huawei.com>
 <CACOAw_xAjUEyVo0Jm4yPvg7KB4G=Mz=tSEQ_wz6OH-P+e_cP8Q@mail.gmail.com>
 <CACOAw_yXkCkZrDELqereZcyJpXHAmWOwS2Q2HiNGs3_63sYfQA@mail.gmail.com>
 <c695e23d-2d54-6912-f139-8c2cde1366b2@huawei.com>
 <CACOAw_zcX1059OytJtW-gwbmcv5T6pBsszESvybq2Xs09T8PMw@mail.gmail.com>
From: Chao Yu <chao@kernel.org>
Message-ID: <6461831c-7c57-abd6-ff33-37becbba450a@kernel.org>
Date: Tue, 8 Sep 2020 22:41:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CACOAw_zcX1059OytJtW-gwbmcv5T6pBsszESvybq2Xs09T8PMw@mail.gmail.com>
X-Spam-Score: -1.7 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.6 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1kFeoq-00GuA1-IS
Subject: Re: [f2fs-dev] [PATCH v2] f2fs_io: change fibmap to fiemap
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
Cc: Daeho Jeong <daehojeong@google.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMC05LTggMTA6MDksIERhZWhvIEplb25nIHdyb3RlOgo+IFRoZW4sIHlvdSBtZWFuIGxp
a2UgdGhlIGJlbG93PwoKWXVwLCBzb21ldGhpbmcgbGlrZSB0aGlzLgoKPiBJIGhhcmRseSBzZWUg
YW55IGJlbmVmaXQgaW4gdGhpcyB3YXksIGJlY2F1c2Ugd2Ugc3RpbGwgaGF2ZSB0byBkZWZpbmUK
PiBhbGwgdGhlIHN0dWZmLgoKSG1tLi4gSSd2ZSBubyBpZGVhIHdpdGggcHJldmlvdXMgaW1wbGVt
ZW50YXRpb24uCgpKYWVnZXVrLCBjb3VsZCB5b3UgZXhwbGFpbiB3aGF0J3MgdGhlIGJlbmVmaXQg
b2YgdGhpcz8KCj4KPiAjaWZkZWYgSEFWRV9MSU5VWF9UWVBFU19ICj4gI2luY2x1ZGUgPGxpbnV4
L2ZpZW1hcC5oPgo+ICNlbmRpZgo+Cj4gI2lmbmRlZiBIQVZFX0xJTlVYX1RZUEVTX0gKPiBzdHJ1
Y3QgZmllbWFwX2V4dGVudCB7Cj4gICAgICAgICB1NjQgZmVfbG9naWNhbDsKPiAgICAgICAgIHU2
NCBmZV9waHlzaWNhbDsKPiAgICAgICAgIHU2NCBmZV9sZW5ndGg7Cj4gICAgICAgICB1NjQgZmVf
cmVzZXJ2ZWQ2NFsyXTsKPiAgICAgICAgIHUzMiBmZV9mbGFnczsKPiAgICAgICAgIHUzMiBmZV9y
ZXNlcnZlZFszXTsKPiB9Owo+Cj4gc3RydWN0IGZpZW1hcCB7Cj4gICAgICAgICB1NjQgZm1fc3Rh
cnQ7Cj4gICAgICAgICB1NjQgZm1fbGVuZ3RoOwo+ICAgICAgICAgdTMyIGZtX2ZsYWdzOwo+ICAg
ICAgICAgdTMyIGZtX21hcHBlZF9leHRlbnRzOwo+ICAgICAgICAgdTMyIGZtX2V4dGVudF9jb3Vu
dDsKPiAgICAgICAgIHUzMiBmbV9yZXNlcnZlZDsKPiAgICAgICAgIHN0cnVjdCBmaWVtYXBfZXh0
ZW50IGZtX2V4dGVudFswXTsKPiB9OwoKU2hvdWxkIGFkanVzdCBhbmRyb2lkX2NvbmZpZy5oIGFu
ZCBjb25maWd1cmUuYWMgYXMgd2VsbD8KClRoYW5rcywKCj4KPiAjZGVmaW5lIEZJRU1BUCAgICAg
ICAgICAgICAgICAgICAgICAgICAgX0lPV1IoJ2YnLCAxMSwgc3RydWN0IGZpZW1hcCkKPiAjZW5k
aWYKPgo+IDIwMjDrhYQgOeyblCA47J28ICjtmZQpIOyYpOyghCAxMDo0MiwgQ2hhbyBZdSA8eXVj
aGFvMEBodWF3ZWkuY29tPuuLmOydtCDsnpHshLE6Cj4+Cj4+IE9uIDIwMjAvOS84IDg6NTIsIERh
ZWhvIEplb25nIHdyb3RlOgo+Pj4gSSd2ZSB0aG91Z2h0IGFib3V0IHRoaXMuCj4+PiBXZSBuZWVk
IHRvIHN1cHBvcnQgdGhpcyB0b29sIGZvciBkaWZmZXJlbnQgT1MsIG5vdCBvbmx5IGZvciBMaW51
eC4KPj4+IFNvLCBpcyBpdCBvayB0byBpbmNsdWRlIGxpbnV4L2ZpZW1hcC5oIGZvciB0aGlzPwo+
Pj4gQWN0dWFsbHksIHNpbmNlIEZJRU1BUCBhbmQgb3RoZXIgc3R1ZmYgd2VyZSBkZWZpbmVkIGlu
IGYyZnNfaW8uYwo+Pj4gZGlyZWN0bHkgYmVmb3JlLCBJIHRob3VnaHQgdGhhdCB0aGVyZSB3YXMg
c29tZSByZWFzb24gZm9yIGRvaW5nIHRoYXQKPj4+IGFuZCBJIGZvbGxvd2VkIHRoZSBjb252ZW50
aW9uLgo+Pj4KPj4+IFdoYXQgZG8geW91IHRoaW5rPwo+Pgo+PiBZZXMsIHRoYXQncyBnb29kIHBv
aW50Lgo+Pgo+PiBJIG5vdGljZWQgdGhhdCBmMmZzX2lvLmggaGFzIHNpbWlsYXIgY29uY2VybjoK
Pj4KPj4gI2lmZGVmIEhBVkVfTElOVVhfVFlQRVNfSAo+PiAjaW5jbHVkZSA8bGludXgvdHlwZXMu
aD4KPj4gI2VuZGlmCj4+Cj4+IC4uLgo+Pgo+PiAjaWZuZGVmIEhBVkVfTElOVVhfVFlQRVNfSAo+
PiB0eXBlZGVmIHU4ICAgICAgX191ODsKPj4gdHlwZWRlZiB1MTYgICAgIF9fdTE2Owo+PiB0eXBl
ZGVmIHUzMiAgICAgX191MzI7Cj4+IHR5cGVkZWYgdTE2ICAgICBfX2xlMTY7Cj4+IHR5cGVkZWYg
dTMyICAgICBfX2xlMzI7Cj4+IHR5cGVkZWYgdTE2ICAgICBfX2JlMTY7Cj4+IHR5cGVkZWYgdTMy
ICAgICBfX2JlMzI7Cj4+ICNlbmRpZgo+Pgo+PiBTbyBob3cgYWJvdXQgaW1wbGVtZW50aW5nIGFz
IGFib3ZlPwo+Pgo+PiBUaGFua3MsCj4+Cj4+Pgo+Pj4gMjAyMOuFhCA57JuUIDTsnbwgKOq4iCkg
7Jik7ZuEIDEyOjM5LCBEYWVobyBKZW9uZyA8ZGFlaG80M0BnbWFpbC5jb20+64uY7J20IOyekeyE
sToKPj4+Pgo+Pj4+IEl0J3Mgd2F5IGJldHRlcn4gOikKPj4+Pgo+Pj4+IDIwMjDrhYQgOeyblCA0
7J28ICjquIgpIOyYpO2bhCAxMjoxMSwgQ2hhbyBZdSA8eXVjaGFvMEBodWF3ZWkuY29tPuuLmOyd
tCDsnpHshLE6Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+Cj4+Pj4+IE9uIDIwMjAvOS8zIDEwOjQ0LCBEYWVo
byBKZW9uZyB3cm90ZToKPj4+Pj4+IEZyb206IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2ds
ZS5jb20+Cj4+Pj4+Pgo+Pj4+Pj4gQ3VycmVudGx5IHdlIHN1cHBvcnQgZmllbWFwIGNvbW1hbmQg
dXNpbmcgZmlibWFwLiBJdCdzIHNpbXBsZSBhbmQKPj4+Pj4+IGVhc3kgdG8gdXNlLCBidXQgd2Ug
Y2Fubm90IHVzZSB0aGlzIGZvciBjb21wcmVzc2VkIGZpbGUuIFRvIHN1cHBvcnQKPj4+Pj4+IG1v
cmUgZGlmZmVyZW50IHR5cGVzIG9mIGZpbGVzLCB3ZSBuZWVkIHRvIGNoYW5nZSB0aGlzIHRvIHVz
ZSBmaWVtYXAuCj4+Pj4+Pgo+Pj4+Pj4gU2lnbmVkLW9mZi1ieTogRGFlaG8gSmVvbmcgPGRhZWhv
amVvbmdAZ29vZ2xlLmNvbT4KPj4+Pj4+IC0tLQo+Pj4+Pj4gQ2hhbmdlcyBpbiB2MjoKPj4+Pj4+
ICAgIC0gTW92ZSBkZWNsYXJhdGlvbiB0byBoZWFkZXIgZmlsZQo+Pj4+Pj4gLS0tCj4+Pj4+PiAg
ICB0b29scy9mMmZzX2lvL2YyZnNfaW8uYyB8IDM3ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tLS0tLS0KPj4+Pj4+ICAgIHRvb2xzL2YyZnNfaW8vZjJmc19pby5oIHwgMjYgKysrKysr
KysrKysrKysrKysrKysrKysrKysKPj4+Pj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgNDMgaW5zZXJ0
aW9ucygrKSwgMjAgZGVsZXRpb25zKC0pCj4+Pj4+Pgo+Pj4+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xz
L2YyZnNfaW8vZjJmc19pby5jIGIvdG9vbHMvZjJmc19pby9mMmZzX2lvLmMKPj4+Pj4+IGluZGV4
IGFiYjY1NWEuLjlhNjUxYzAgMTAwNjQ0Cj4+Pj4+PiAtLS0gYS90b29scy9mMmZzX2lvL2YyZnNf
aW8uYwo+Pj4+Pj4gKysrIGIvdG9vbHMvZjJmc19pby9mMmZzX2lvLmMKPj4+Pj4+IEBAIC02MzEs
MjcgKzYzMSwxNyBAQCBzdGF0aWMgdm9pZCBkb19yYW5kcmVhZChpbnQgYXJnYywgY2hhciAqKmFy
Z3YsIGNvbnN0IHN0cnVjdCBjbWRfZGVzYyAqY21kKQo+Pj4+Pj4gICAgICAgIGV4aXQoMCk7Cj4+
Pj4+PiAgICB9Cj4+Pj4+Pgo+Pj4+Pj4gLXN0cnVjdCBmaWxlX2V4dCB7Cj4+Pj4+PiAtICAgICBf
X3UzMiBmX3BvczsKPj4+Pj4+IC0gICAgIF9fdTMyIHN0YXJ0X2JsazsKPj4+Pj4+IC0gICAgIF9f
dTMyIGVuZF9ibGs7Cj4+Pj4+PiAtICAgICBfX3UzMiBibGtfY291bnQ7Cj4+Pj4+PiAtfTsKPj4+
Pj4+IC0KPj4+Pj4+IC0jaWZuZGVmIEZJQk1BUAo+Pj4+Pj4gLSNkZWZpbmUgRklCTUFQICAgICAg
ICAgIF9JTygweDAwLCAxKSAgICAvKiBibWFwIGFjY2VzcyAqLwo+Pj4+Pj4gLSNlbmRpZgo+Pj4+
Pj4gLQo+Pj4+Pj4gICAgI2RlZmluZSBmaWVtYXBfZGVzYyAiZ2V0IGJsb2NrIGFkZHJlc3MgaW4g
ZmlsZSIKPj4+Pj4+ICAgICNkZWZpbmUgZmllbWFwX2hlbHAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBcCj4+Pj4+PiAgICAiZjJmc19pbyBmaWVtYXAgW29mZnNldCBpbiA0a2JdIFtj
b3VudF0gW2ZpbGVfcGF0aF1cblxuIlwKPj4+Pj4+Cj4+Pj4+PiAgICBzdGF0aWMgdm9pZCBkb19m
aWVtYXAoaW50IGFyZ2MsIGNoYXIgKiphcmd2LCBjb25zdCBzdHJ1Y3QgY21kX2Rlc2MgKmNtZCkK
Pj4+Pj4+ICAgIHsKPj4+Pj4+IC0gICAgIHU2NCBvZmZzZXQ7Cj4+Pj4+PiAtICAgICB1MzIgYmxr
bnVtOwo+Pj4+Pj4gICAgICAgIHVuc2lnbmVkIGNvdW50LCBpOwo+Pj4+Pj4gICAgICAgIGludCBm
ZDsKPj4+Pj4+ICsgICAgIF9fdTY0IHBoeV9hZGRyOwo+Pj4+Pj4gKyAgICAgc3RydWN0IGZpZW1h
cCAqZm0gPSB4bWFsbG9jKHNpemVvZihzdHJ1Y3QgZmllbWFwKSArCj4+Pj4+PiArICAgICAgICAg
ICAgICAgICAgICAgc2l6ZW9mKHN0cnVjdCBmaWVtYXBfZXh0ZW50KSk7Cj4+Pj4+Pgo+Pj4+Pj4g
ICAgICAgIGlmIChhcmdjICE9IDQpIHsKPj4+Pj4+ICAgICAgICAgICAgICAgIGZwdXRzKCJFeGNl
c3MgYXJndW1lbnRzXG5cbiIsIHN0ZGVycik7Cj4+Pj4+PiBAQCAtNjU5LDIxICs2NDksMjggQEAg
c3RhdGljIHZvaWQgZG9fZmllbWFwKGludCBhcmdjLCBjaGFyICoqYXJndiwgY29uc3Qgc3RydWN0
IGNtZF9kZXNjICpjbWQpCj4+Pj4+PiAgICAgICAgICAgICAgICBleGl0KDEpOwo+Pj4+Pj4gICAg
ICAgIH0KPj4+Pj4+Cj4+Pj4+PiAtICAgICBvZmZzZXQgPSBhdG9pKGFyZ3ZbMV0pOwo+Pj4+Pj4g
KyAgICAgZm0tPmZtX3N0YXJ0ID0gYXRvaShhcmd2WzFdKSAqIEYyRlNfQkxLU0laRTsKPj4+Pj4+
ICsgICAgIGZtLT5mbV9sZW5ndGggPSBGMkZTX0JMS1NJWkU7Cj4+Pj4+PiArICAgICBmbS0+Zm1f
ZXh0ZW50X2NvdW50ID0gMTsKPj4+Pj4+ICAgICAgICBjb3VudCA9IGF0b2koYXJndlsyXSk7Cj4+
Pj4+Pgo+Pj4+Pj4gICAgICAgIGZkID0geG9wZW4oYXJndlszXSwgT19SRE9OTFkgfCBPX0xBUkdF
RklMRSwgMCk7Cj4+Pj4+Pgo+Pj4+Pj4gLSAgICAgcHJpbnRmKCJGaWVtYXA6IG9mZnNldCA9ICUw
OCJQUkl4NjQiIGxlbiA9ICVkXG4iLCBvZmZzZXQsIGNvdW50KTsKPj4+Pj4+ICsgICAgIHByaW50
ZigiRmllbWFwOiBvZmZzZXQgPSAlMDgiUFJJeDY0IiBsZW4gPSAlZFxuIiwKPj4+Pj4+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZm0tPmZtX3N0YXJ0IC8gRjJGU19CTEtT
SVpFLCBjb3VudCk7Cj4+Pj4+PiAgICAgICAgZm9yIChpID0gMDsgaSA8IGNvdW50OyBpKyspIHsK
Pj4+Pj4+IC0gICAgICAgICAgICAgYmxrbnVtID0gb2Zmc2V0ICsgaTsKPj4+Pj4+IC0KPj4+Pj4+
IC0gICAgICAgICAgICAgaWYgKGlvY3RsKGZkLCBGSUJNQVAsICZibGtudW0pIDwgMCkKPj4+Pj4+
IC0gICAgICAgICAgICAgICAgICAgICBkaWVfZXJybm8oIkZJQk1BUCBmYWlsZWQiKTsKPj4+Pj4+
ICsgICAgICAgICAgICAgaWYgKGlvY3RsKGZkLCBGSUVNQVAsIGZtKSA8IDApCj4+Pj4+PiArICAg
ICAgICAgICAgICAgICAgICAgZGllX2Vycm5vKCJGSUVNQVAgZmFpbGVkIik7Cj4+Pj4+Pgo+Pj4+
Pj4gLSAgICAgICAgICAgICBwcmludGYoIiV1ICIsIGJsa251bSk7Cj4+Pj4+PiArICAgICAgICAg
ICAgIHBoeV9hZGRyID0gZm0tPmZtX2V4dGVudFswXS5mZV9waHlzaWNhbCAvIEYyRlNfQkxLU0la
RTsKPj4+Pj4+ICsgICAgICAgICAgICAgaWYgKHBoeV9hZGRyID09IE5FV19BRERSKQo+Pj4+Pj4g
KyAgICAgICAgICAgICAgICAgICAgIHByaW50ZigiTkVXX0FERFIgIik7Cj4+Pj4+PiArICAgICAg
ICAgICAgIGVsc2UKPj4+Pj4+ICsgICAgICAgICAgICAgICAgICAgICBwcmludGYoIiVsbHUgIiwg
cGh5X2FkZHIpOwo+Pj4+Pj4gKyAgICAgICAgICAgICBmbS0+Zm1fc3RhcnQgKz0gRjJGU19CTEtT
SVpFOwo+Pj4+Pj4gICAgICAgIH0KPj4+Pj4+ICAgICAgICBwcmludGYoIlxuIik7Cj4+Pj4+PiAr
ICAgICBmcmVlKGZtKTsKPj4+Pj4+ICAgICAgICBleGl0KDApOwo+Pj4+Pj4gICAgfQo+Pj4+Pj4K
Pj4+Pj4+IGRpZmYgLS1naXQgYS90b29scy9mMmZzX2lvL2YyZnNfaW8uaCBiL3Rvb2xzL2YyZnNf
aW8vZjJmc19pby5oCj4+Pj4+PiBpbmRleCBiZDE5ZmY5Li42MmQ2ZTdiIDEwMDY0NAo+Pj4+Pj4g
LS0tIGEvdG9vbHMvZjJmc19pby9mMmZzX2lvLmgKPj4+Pj4+ICsrKyBiL3Rvb2xzL2YyZnNfaW8v
ZjJmc19pby5oCj4+Pj4+PiBAQCAtMzgsNiArMzgsOSBAQCB0eXBlZGVmIHUxNiBfX2JlMTY7Cj4+
Pj4+PiAgICB0eXBlZGVmIHUzMiBfX2JlMzI7Cj4+Pj4+PiAgICAjZW5kaWYKPj4+Pj4+Cj4+Pj4+
PiArI2RlZmluZSBGMkZTX0JMS1NJWkUgNDA5Ngo+Pj4+Pj4gKyNkZWZpbmUgTkVXX0FERFIgICAg
IDB4RkZGRkZGRkYKPj4+Pj4+ICsKPj4+Pj4+ICAgICNpZm5kZWYgRlNfSU9DX0dFVEZMQUdTCj4+
Pj4+PiAgICAjZGVmaW5lIEZTX0lPQ19HRVRGTEFHUyAgICAgICAgICAgICAgICAgICAgIF9JT1Io
J2YnLCAxLCBsb25nKQo+Pj4+Pj4gICAgI2VuZGlmCj4+Pj4+PiBAQCAtMTMyLDYgKzEzNSwyOSBA
QCB0eXBlZGVmIHUzMiAgICAgIF9fYmUzMjsKPj4+Pj4+ICAgICNkZWZpbmUgRlNfQ0FTRUZPTERf
RkwgICAgICAgICAgICAgICAgICAgICAgMHg0MDAwMDAwMCAvKiBGb2xkZXIgaXMgY2FzZSBpbnNl
bnNpdGl2ZSAqLwo+Pj4+Pj4gICAgI2VuZGlmCj4+Pj4+Pgo+Pj4+Pj4gK3N0cnVjdCBmaWVtYXBf
ZXh0ZW50IHsKPj4+Pj4+ICsgICAgIHU2NCBmZV9sb2dpY2FsOwo+Pj4+Pj4gKyAgICAgdTY0IGZl
X3BoeXNpY2FsOwo+Pj4+Pj4gKyAgICAgdTY0IGZlX2xlbmd0aDsKPj4+Pj4+ICsgICAgIHU2NCBm
ZV9yZXNlcnZlZDY0WzJdOwo+Pj4+Pj4gKyAgICAgdTMyIGZlX2ZsYWdzOwo+Pj4+Pj4gKyAgICAg
dTMyIGZlX3Jlc2VydmVkWzNdOwo+Pj4+Pj4gK307Cj4+Pj4+PiArCj4+Pj4+PiArc3RydWN0IGZp
ZW1hcCB7Cj4+Pj4+PiArICAgICB1NjQgZm1fc3RhcnQ7Cj4+Pj4+PiArICAgICB1NjQgZm1fbGVu
Z3RoOwo+Pj4+Pj4gKyAgICAgdTMyIGZtX2ZsYWdzOwo+Pj4+Pj4gKyAgICAgdTMyIGZtX21hcHBl
ZF9leHRlbnRzOwo+Pj4+Pj4gKyAgICAgdTMyIGZtX2V4dGVudF9jb3VudDsKPj4+Pj4+ICsgICAg
IHUzMiBmbV9yZXNlcnZlZDsKPj4+Pj4+ICsgICAgIHN0cnVjdCBmaWVtYXBfZXh0ZW50IGZtX2V4
dGVudFswXTsKPj4+Pj4+ICt9Owo+Pj4+Pgo+Pj4+PiBXZSBkb24ndCBuZWVkIHRvIGNvcHkgJiBw
YXN0ZSBmaWVtYXAgcmVsYXRlZCBzdHJ1Y3R1cmUgaGVyZS4KPj4+Pj4KPj4+Pj4gTGV0J3MganVz
dCBpbmNsdWRlIDxsaW51eC9maWVtYXAuaD4gaW4gZjJmc19pby5oCj4+Pj4+Cj4+Pj4+IFRoYW5r
cywKPj4+Pj4KPj4+Pj4+ICsKPj4+Pj4+ICsjaWZuZGVmIEZJRU1BUAo+Pj4+Pj4gKyNkZWZpbmUg
RklFTUFQICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF9JT1dSKCdmJywgMTEsIHN0cnVj
dCBmaWVtYXApCj4+Pj4+PiArI2VuZGlmCj4+Pj4+PiArCj4+Pj4+PiAgICBzdHJ1Y3QgZjJmc19n
Y19yYW5nZSB7Cj4+Pj4+PiAgICAgICAgdTMyIHN5bmM7Cj4+Pj4+PiAgICAgICAgdTY0IHN0YXJ0
Owo+Pj4+Pj4KPj4+IC4KPj4+Cj4KPgo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCj4gTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKPiBMaW51eC1m
MmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldAo+IGh0dHBzOi8vbGlzdHMuc291cmNlZm9y
Z2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwKPgoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGlu
ZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlz
dHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
