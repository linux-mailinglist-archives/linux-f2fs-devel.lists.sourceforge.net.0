Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C8632C7C9E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Nov 2020 03:03:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kjYXC-0004qj-82; Mon, 30 Nov 2020 02:03:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kjYX7-0004qF-VN
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Nov 2020 02:03:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3TO1ey3aWGxK6ukP0NfOLDr7xuEoQlMHxFcRVvWIJ5s=; b=XlIljvFiOhOWS2K5MU8hbuJGp0
 /jJUer0x3s77cGplvYWcXKLz5sphaXuCcIZGoIZ6IZUpmCk8QXotYNlObYSxRTckV3a3RyKzIzwkl
 5g+VXvRN5Fy8y3WCwiuTzhFZJoeHjS/LE7826NdKhbNC0VyONY4p26bCIhhKaOX6P/v8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3TO1ey3aWGxK6ukP0NfOLDr7xuEoQlMHxFcRVvWIJ5s=; b=URstzaeux7vfd7sd6xDEDOvTFC
 SH9H4OjKJIiRsnjGXwcFtGADKOSBZj7Qws4+ivfjXu+L6eW+VuRSK72Bt5iU+3mx95ncC+P7Ug+ZO
 H4oJDgYX3iSJqoResqViZt7RLBz++lbs1G48U/23ZhsZKMrwT4hw5jugENb3cm3qOZa4=;
Received: from mail-lf1-f50.google.com ([209.85.167.50])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kjYWu-00AIsW-4f
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 30 Nov 2020 02:03:17 +0000
Received: by mail-lf1-f50.google.com with SMTP id a9so18103783lfh.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 29 Nov 2020 18:03:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=3TO1ey3aWGxK6ukP0NfOLDr7xuEoQlMHxFcRVvWIJ5s=;
 b=qwfKG2UhWCaxvPdtwP2BApBf3Kmr6PudiHv4/QikPOO6Lk9EmHruDCDAe/SEWOnrui
 MsTJm5mDpN94l6CrWtFFhtfdG8NT3s0O5e2+odH6Y0PS08TAzjMj6o+szLwYoUi56Ug1
 bk/x6PFI3d7UGOBh3ofpf5NGwrv/zM+Rp21M8WreQORYwHvVW8HyRgYpRct6TxBlVH6N
 ND86vaB8zwa9un6kWh5MUuKaAkhyqY4L5Fgn6Eoc4eMvCoq1CJ542BLb4Ue/7m/Ft1QM
 4nG3ysLwxvLne1gd326yhJvVSK3nGCah7IIYSWqQzHGo1SURnJbk5QgNCFXvMdlsOubI
 JYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=3TO1ey3aWGxK6ukP0NfOLDr7xuEoQlMHxFcRVvWIJ5s=;
 b=GjAXPxt9DqYgLzNoR7YlQe0a/JaJNGNz6hAST6rnL6aukLh1tbWz9FuCYb5Yg0k69u
 a1pzxeTAOhT+ROEefhe75WcumkrdwiKwCe1sPDUBr+LavT1VJz78LXiO62WyHe+ZOwPZ
 5OmsQJmdnDfyPfEhRyaglYoF23rm4omssPZTuWXebnM1uAMb4tWG42uszxiZm2GW/LS6
 puPwoa92Ia6fGph4nTdtLMt+IQ51pU8CRpfs0JGDE/8560NwuolH0BiHwjTSYv8aG1X0
 xJBKyoaWiYj4Qn6JIzFdxwaWOmMadoyX6vnB/OI6cm+MuD7ZSObAMBXxDZqdYtyzXaoW
 B5Gg==
X-Gm-Message-State: AOAM533toL5Ll6gAIGh5kde8jqWWBq3GCU4zNg30vGyV7A7PL7yJBVSB
 EEMPpQjMMw02VggkOmgGZePVAf99li+AuLSWJ0A=
X-Google-Smtp-Source: ABdhPJyZFfjdJpjvAvwZlBGOVGEd/wvu4ziTgCbdJkyJx5Znj4MmF/Xraqv7q3GPDc6DTVxwUmtG/fNDVUuQaNeYXyc=
X-Received: by 2002:a05:6512:3a6:: with SMTP id
 v6mr7471826lfp.90.1606701777492; 
 Sun, 29 Nov 2020 18:02:57 -0800 (PST)
MIME-Version: 1.0
References: <20201016051455.1913795-1-daeho43@gmail.com>
 <f8359dde-7e0c-b2fc-451f-2984c50fa552@huawei.com>
 <CACOAw_wrTSZ3DWBUJA=ePe=fDRgEgqCfsbSqKmE6+ACW8A-RQg@mail.gmail.com>
 <2d354bbe-9d1e-f3e0-b918-b9ec023a93ba@huawei.com>
In-Reply-To: <2d354bbe-9d1e-f3e0-b918-b9ec023a93ba@huawei.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Mon, 30 Nov 2020 11:02:46 +0900
Message-ID: <CACOAw_x1Zkn-yY-cmWwQUByHVg5mUDqYz86e+TFKWWuhas+_MA@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.50 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.50 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kjYWu-00AIsW-4f
Subject: Re: [f2fs-dev] [PATCH] f2fs: add compr_inode and compr_blocks sysfs
 nodes
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
Cc: Daeho Jeong <daehojeong@google.com>, kernel-team@android.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

U3VyZSwgYnV0IEkgZG9uJ3QgdGhpbmsgd2UgbmVlZCB0byBleHBvc2UgY29tcHJfaW5vZGUgYW5k
IGNvbXByX2Jsb2NrIHJpZ2h0IG5vdy4KCjIwMjDrhYQgMTHsm5QgMjfsnbwgKOq4iCkg7Jik7ZuE
IDY6NDQsIENoYW8gWXUgPHl1Y2hhbzBAaHVhd2VpLmNvbT7ri5jsnbQg7J6R7ISxOgo+Cj4gRGFl
aG8sCj4KPiBIb3cgYWJvdXQgdXBkYXRpbmcgdGhpcyBwYXRjaCBiYXNlZCBvbiBiZWxvdyBwYXRj
aD8KPgo+ICAgICAgICAgZjJmczogaW50cm9kdWNlIGEgbmV3IHBlci1zYiBkaXJlY3RvcnkgaW4g
c3lzZnMKPgo+IE9uIDIwMjAvMTAvMjIgMTA6NTMsIERhZWhvIEplb25nIHdyb3RlOgo+ID4gWWVw
LCBJdCBzb3VuZHMgZ29vZCB0byBtZS4KPiA+Cj4gPiAyMDIw64WEIDEw7JuUIDIx7J28ICjsiJgp
IOyYpO2bhCAzOjA4LCBDaGFvIFl1IDx5dWNoYW8wQGh1YXdlaS5jb20+64uY7J20IOyekeyEsToK
PiA+Pgo+ID4+IE9uIDIwMjAvMTAvMTYgMTM6MTQsIERhZWhvIEplb25nIHdyb3RlOgo+ID4+PiBG
cm9tOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4+Pgo+ID4+PiBBZGRl
ZCBjb21wcl9pbm9kZSB0byBzaG93IGNvbXByZXNzZWQgaW5vZGUgY291bnQgYW5kIGNvbXByX2Js
b2NrcyB0bwo+ID4+PiBzaG93IGNvbXByZXNzZWQgYmxvY2sgY291bnQgaW4gc3lzZnMuCj4gPj4K
PiA+PiBBcyB0aGVyZSBhcmUgc28gbWFueSBlbnRyaWVzIGluIC4uL2YyZnMvPGRpc2s+LyBkaXJl
Y3RvcnksIGl0IGxvb2tzIGEgbWVzcwo+ID4+IHRoZXJlLCBJIHN1Z2dlc3QgdGhhdCB3ZSBjYW4g
YWRkIGEgbmV3IGRpcmVjdG9yeSAnc3RhdHMnIGluIC4uL2YyZnMvPGRpc2s+LywKPiA+PiBpbiB3
aGVyZSB3ZSBjYW4gc3RvcmUgYWxsIHJlYWRvbmx5IHN0YXRzIHJlbGF0ZWQgZW50cmllcyB0aGVy
ZSBsYXRlci4KPiA+Pgo+ID4+IEhvdyBkbyB5b3UgdGhpbms/Cj4gPj4KPiA+PiBUaGFua3MsCj4g
Pj4KPiA+Pj4KPiA+Pj4gU2lnbmVkLW9mZi1ieTogRGFlaG8gSmVvbmcgPGRhZWhvamVvbmdAZ29v
Z2xlLmNvbT4KPiA+Pj4gLS0tCj4gPj4+ICAgIERvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lz
ZnMtZnMtZjJmcyB8IDEwICsrKysrKysrKysKPiA+Pj4gICAgZnMvZjJmcy9zeXNmcy5jICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMTcgKysrKysrKysrKysrKysrKysKPiA+Pj4gICAgMiBmaWxl
cyBjaGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspCj4gPj4+Cj4gPj4+IGRpZmYgLS1naXQgYS9Eb2N1
bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWZzLWYyZnMgYi9Eb2N1bWVudGF0aW9uL0FCSS90
ZXN0aW5nL3N5c2ZzLWZzLWYyZnMKPiA+Pj4gaW5kZXggODM0ZDBiZWNhZTZkLi5hMDFjMjY0ODRj
NjkgMTAwNjQ0Cj4gPj4+IC0tLSBhL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZnMt
ZjJmcwo+ID4+PiArKysgYi9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWZzLWYyZnMK
PiA+Pj4gQEAgLTM1MCwzICszNTAsMTMgQEAgRGF0ZTogICAgICAgICAgICBBcHJpbCAyMDIwCj4g
Pj4+ICAgIENvbnRhY3Q6ICAgICJEYWVobyBKZW9uZyIgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4K
PiA+Pj4gICAgRGVzY3JpcHRpb246ICAgICAgICBHaXZlIGEgd2F5IHRvIGNoYW5nZSBpb3N0YXRf
cGVyaW9kIHRpbWUuIDNzZWNzIGJ5IGRlZmF1bHQuCj4gPj4+ICAgICAgICAgICAgICAgIFRoZSBu
ZXcgaW9zdGF0IHRyYWNlIGdpdmVzIHN0YXRzIGdhcCBnaXZlbiB0aGUgcGVyaW9kLgo+ID4+PiAr
Cj4gPj4+ICtXaGF0OiAgICAgICAgICAgICAgICAvc3lzL2ZzL2YyZnMvPGRpc2s+L2NvbXByX2lu
b2RlCj4gPj4+ICtEYXRlOiAgICAgICAgICAgICAgICBPY3RvYmVyIDIwMjAKPiA+Pj4gK0NvbnRh
Y3Q6ICAgICAiRGFlaG8gSmVvbmciIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPj4+ICtEZXNj
cmlwdGlvbjogU2hvdyBjb21wcmVzc2VkIGlub2RlIGNvdW50Cj4gPj4+ICsKPiA+Pj4gK1doYXQ6
ICAgICAgICAgICAgICAgIC9zeXMvZnMvZjJmcy88ZGlzaz4vY29tcHJfYmxvY2tzCj4gPj4+ICtE
YXRlOiAgICAgICAgICAgICAgICBPY3RvYmVyIDIwMjAKPiA+Pj4gK0NvbnRhY3Q6ICAgICAiRGFl
aG8gSmVvbmciIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPj4+ICtEZXNjcmlwdGlvbjogU2hv
dyBjb21wcmVzc2VkIGJsb2NrIGNvdW50Cj4gPj4+IGRpZmYgLS1naXQgYS9mcy9mMmZzL3N5c2Zz
LmMgYi9mcy9mMmZzL3N5c2ZzLmMKPiA+Pj4gaW5kZXggOTRjOThlNDEyYWExLi43MTM5YTI5YTAw
ZDMgMTAwNjQ0Cj4gPj4+IC0tLSBhL2ZzL2YyZnMvc3lzZnMuYwo+ID4+PiArKysgYi9mcy9mMmZz
L3N5c2ZzLmMKPiA+Pj4gQEAgLTIyMyw2ICsyMjMsMTkgQEAgc3RhdGljIHNzaXplX3QgYXZnX3Zi
bG9ja3Nfc2hvdyhzdHJ1Y3QgZjJmc19hdHRyICphLAo+ID4+PiAgICAgICAgZjJmc191cGRhdGVf
c2l0X2luZm8oc2JpKTsKPiA+Pj4gICAgICAgIHJldHVybiBzcHJpbnRmKGJ1ZiwgIiVsbHVcbiIs
ICh1bnNpZ25lZCBsb25nIGxvbmcpKHNpLT5hdmdfdmJsb2NrcykpOwo+ID4+PiAgICB9Cj4gPj4+
ICsKPiA+Pj4gK3N0YXRpYyBzc2l6ZV90IGNvbXByX2lub2RlX3Nob3coc3RydWN0IGYyZnNfYXR0
ciAqYSwKPiA+Pj4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGYyZnNfc2Jf
aW5mbyAqc2JpLCBjaGFyICpidWYpCj4gPj4+ICt7Cj4gPj4+ICsgICAgIHJldHVybiBzcHJpbnRm
KGJ1ZiwgIiV1XG4iLCBhdG9taWNfcmVhZCgmc2JpLT5jb21wcl9pbm9kZSkpOwo+ID4+PiArfQo+
ID4+PiArCj4gPj4+ICtzdGF0aWMgc3NpemVfdCBjb21wcl9ibG9ja3Nfc2hvdyhzdHJ1Y3QgZjJm
c19hdHRyICphLAo+ID4+PiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZjJm
c19zYl9pbmZvICpzYmksIGNoYXIgKmJ1ZikKPiA+Pj4gK3sKPiA+Pj4gKyAgICAgcmV0dXJuIHNw
cmludGYoYnVmLCAiJWxsdVxuIiwgYXRvbWljNjRfcmVhZCgmc2JpLT5jb21wcl9ibG9ja3MpKTsK
PiA+Pj4gK30KPiA+Pj4gKwo+ID4+PiAgICAjZW5kaWYKPiA+Pj4KPiA+Pj4gICAgc3RhdGljIHNz
aXplX3QgbWFpbl9ibGthZGRyX3Nob3coc3RydWN0IGYyZnNfYXR0ciAqYSwKPiA+Pj4gQEAgLTU5
MSw2ICs2MDQsOCBAQCBGMkZTX1NUQVRfQVRUUihTVEFUX0lORk8sIGYyZnNfc3RhdF9pbmZvLCBn
Y19iYWNrZ3JvdW5kX2NhbGxzLCBiZ19nYyk7Cj4gPj4+ICAgIEYyRlNfR0VORVJBTF9ST19BVFRS
KG1vdmVkX2Jsb2Nrc19iYWNrZ3JvdW5kKTsKPiA+Pj4gICAgRjJGU19HRU5FUkFMX1JPX0FUVFIo
bW92ZWRfYmxvY2tzX2ZvcmVncm91bmQpOwo+ID4+PiAgICBGMkZTX0dFTkVSQUxfUk9fQVRUUihh
dmdfdmJsb2Nrcyk7Cj4gPj4+ICtGMkZTX0dFTkVSQUxfUk9fQVRUUihjb21wcl9pbm9kZSk7Cj4g
Pj4+ICtGMkZTX0dFTkVSQUxfUk9fQVRUUihjb21wcl9ibG9ja3MpOwo+ID4+PiAgICAjZW5kaWYK
PiA+Pj4KPiA+Pj4gICAgI2lmZGVmIENPTkZJR19GU19FTkNSWVBUSU9OCj4gPj4+IEBAIC02NzUs
NiArNjkwLDggQEAgc3RhdGljIHN0cnVjdCBhdHRyaWJ1dGUgKmYyZnNfYXR0cnNbXSA9IHsKPiA+
Pj4gICAgICAgIEFUVFJfTElTVChtb3ZlZF9ibG9ja3NfZm9yZWdyb3VuZCksCj4gPj4+ICAgICAg
ICBBVFRSX0xJU1QobW92ZWRfYmxvY2tzX2JhY2tncm91bmQpLAo+ID4+PiAgICAgICAgQVRUUl9M
SVNUKGF2Z192YmxvY2tzKSwKPiA+Pj4gKyAgICAgQVRUUl9MSVNUKGNvbXByX2lub2RlKSwKPiA+
Pj4gKyAgICAgQVRUUl9MSVNUKGNvbXByX2Jsb2NrcyksCj4gPj4+ICAgICNlbmRpZgo+ID4+PiAg
ICAgICAgTlVMTCwKPiA+Pj4gICAgfTsKPiA+Pj4KPiA+IC4KPiA+CgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5n
IGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0
cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
