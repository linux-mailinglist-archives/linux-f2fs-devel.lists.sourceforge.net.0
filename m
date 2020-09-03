Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 74E1F25B859
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Sep 2020 03:42:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kDeGi-0007Ap-VG; Thu, 03 Sep 2020 01:42:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kDeGh-0007Ai-Rz
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Sep 2020 01:42:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6zSwXrVukiq5YM9bw+PW++srJQ4q25zYBvB2S3DRBlU=; b=h+TZwCKP0o4gGPVMzkL9ypoZ3e
 XTlfiVs2bj/nvZqdWB1i3mik+KVOS2p5GbloiihEgv99qnHBphv/RA/+G7AbV6qNBmqPpxFeByrnf
 99MOnALysZIpOKuAgj1RrkOAn330Rg2O1c/HJF/Ynsgt8tOLOE0oGw1l+5JGidOJ0EgU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6zSwXrVukiq5YM9bw+PW++srJQ4q25zYBvB2S3DRBlU=; b=El94CjhvWFBOz3lrsTISMrAwrQ
 zrLHG061FPJC0wFUL7eOCNXGhJ+naxfzpu3jtOno6qrBOHJgBdILyN1noWEePDV5apLpqkopoQJK/
 gTmTK5GrWeJb2CmK6Z3imAnmuxQU0UnTeP4TTZnn9dml8zjjCeEXsBETIaC+yoDq+ilU=;
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kDeGc-009swQ-KG
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Sep 2020 01:42:27 +0000
Received: by mail-lf1-f68.google.com with SMTP id d2so914129lfj.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 02 Sep 2020 18:42:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6zSwXrVukiq5YM9bw+PW++srJQ4q25zYBvB2S3DRBlU=;
 b=XDO7c9LXiXxuZu1YOFSruOKlDMRcXpEIVhvmuMsDYYLonhoaewJsALutsbe4GBi2Ju
 knY/JP0D74pZpAmKBDZ13y0lgDWYPP0p644t1jhentFgywb3AD91XdyC5v7VJhLrH5cB
 +mxgoF/qBWIYp1j8zPULv0CncmH75YODusJ4RbTDHv1AhLx4HhewKy5RNxH7aSywclK7
 YI1GdZXVATXFvDUtcPNhj/GSVPZUp9p9/Cz660mAqX2Frdd1BrvCdNm13soKa/UxZ7zC
 p2nE8ovYfAHKodIbM0XCuaxTGo1f8nyQwkqbxhTn7BfoRqfU+zK/3PdU9B1D+gyL2ElM
 11CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6zSwXrVukiq5YM9bw+PW++srJQ4q25zYBvB2S3DRBlU=;
 b=TkG2DuN5KLSNCbDU4JLGzyS75MK0z8ftcUo8n8W1/XpN36yeUwtyfZcq3whKwtZ6li
 qyGHIO8H7GsAeKmkpfATywFXhtl1d0jgZEoAN6ATEb6ann5dypuB0ahegQU1892myg8P
 MdAg9is6zR5pC3mpHbDxWxZh3tiNVXJuOSeYs+ZwO0C5KDjR8qkOAAL8eDfc+yEYcHls
 udgaSTJxf5Y0VbckxmWntnDuPrUSrrzZICXXYI22txXxeKeQ8epgvm0/A3ecDbLL/C6p
 5sDkBEDOO3BGWb2aTKh3b9nAPMqtkNI4vPfo2Y2rkwWpbvwuGVH9Wqhn86Yj1SHsQDxA
 oJbw==
X-Gm-Message-State: AOAM53091J1IavuhRg23qiV2CimPqmlthhgG23Vl5Eo70w7BTSFfCVg/
 8kLBtwfUEwdER9iXiwjqM2tzQHaiiZAbLyoVmYU=
X-Google-Smtp-Source: ABdhPJz0+H8mUJHonxuZLf8e9ba9wrks2vnymsRG9xb7cnXA1B9Jgx66FVIhaqMqmFy6j/SqGT5r2sVZOVfycJiewDc=
X-Received: by 2002:ac2:546a:: with SMTP id e10mr389948lfn.100.1599097328641; 
 Wed, 02 Sep 2020 18:42:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200901033649.3537459-1-daeho43@gmail.com>
 <c5e20402-dc35-ea74-c4d2-3e1deeac6711@huawei.com>
In-Reply-To: <c5e20402-dc35-ea74-c4d2-3e1deeac6711@huawei.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 3 Sep 2020 10:41:57 +0900
Message-ID: <CACOAw_zjKDUu=tUhJ=acaBmjpT6jRPdNDvE-F=XYRcboM+z9TA@mail.gmail.com>
To: Chao Yu <yuchao0@huawei.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.68 listed in list.dnswl.org]
X-Headers-End: 1kDeGc-009swQ-KG
Subject: Re: [f2fs-dev] [PATCH] f2fs_io: change fibmap to fiemap
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

WWVzLCBJIGp1c3Qgd2FzIHNlYXJjaGluZyBmb3IgdGhhdCwgYnV0IGZhaWxlZC4KClRoYW5rcywK
CjIwMjDrhYQgOeyblCAz7J28ICjrqqkpIOyYpOyghCAxMDoxNSwgQ2hhbyBZdSA8eXVjaGFvMEBo
dWF3ZWkuY29tPuuLmOydtCDsnpHshLE6Cj4KPiBPbiAyMDIwLzkvMSAxMTozNiwgRGFlaG8gSmVv
bmcgd3JvdGU6Cj4gPiBGcm9tOiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+
ID4KPiA+IEN1cnJlbnRseSB3ZSBzdXBwb3J0IGZpZW1hcCBjb21tYW5kIHVzaW5nIGZpYm1hcC4g
SXQncyBzaW1wbGUgYW5kCj4gPiBlYXN5IHRvIHVzZSwgYnV0IHdlIGNhbm5vdCB1c2UgdGhpcyBm
b3IgY29tcHJlc3NlZCBmaWxlLiBUbyBzdXBwb3J0Cj4gPiBtb3JlIGRpZmZlcmVudCB0eXBlcyBv
ZiBmaWxlcywgd2UgbmVlZCB0byBjaGFuZ2UgdGhpcyB0byB1c2UgZmllbWFwLgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPiAtLS0K
PiA+ICAgdG9vbHMvZjJmc19pby9mMmZzX2lvLmMgfCA1NiArKysrKysrKysrKysrKysrKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygr
KSwgMTcgZGVsZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL3Rvb2xzL2YyZnNfaW8vZjJm
c19pby5jIGIvdG9vbHMvZjJmc19pby9mMmZzX2lvLmMKPiA+IGluZGV4IGFiYjY1NWEuLmZjODFi
OTMgMTAwNjQ0Cj4gPiAtLS0gYS90b29scy9mMmZzX2lvL2YyZnNfaW8uYwo+ID4gKysrIGIvdG9v
bHMvZjJmc19pby9mMmZzX2lvLmMKPiA+IEBAIC02MzEsMjcgKzYzMSw0MiBAQCBzdGF0aWMgdm9p
ZCBkb19yYW5kcmVhZChpbnQgYXJnYywgY2hhciAqKmFyZ3YsIGNvbnN0IHN0cnVjdCBjbWRfZGVz
YyAqY21kKQo+ID4gICAgICAgZXhpdCgwKTsKPiA+ICAgfQo+ID4KPiA+IC1zdHJ1Y3QgZmlsZV9l
eHQgewo+ID4gLSAgICAgX191MzIgZl9wb3M7Cj4gPiAtICAgICBfX3UzMiBzdGFydF9ibGs7Cj4g
PiAtICAgICBfX3UzMiBlbmRfYmxrOwo+ID4gLSAgICAgX191MzIgYmxrX2NvdW50Owo+ID4gK3N0
cnVjdCBmaWVtYXBfZXh0ZW50IHsKPiA+ICsgICAgIF9fdTY0IGZlX2xvZ2ljYWw7Cj4gPiArICAg
ICBfX3U2NCBmZV9waHlzaWNhbDsKPiA+ICsgICAgIF9fdTY0IGZlX2xlbmd0aDsKPiA+ICsgICAg
IF9fdTY0IGZlX3Jlc2VydmVkNjRbMl07Cj4gPiArICAgICBfX3UzMiBmZV9mbGFnczsKPiA+ICsg
ICAgIF9fdTMyIGZlX3Jlc2VydmVkWzNdOwo+ID4gICB9Owo+ID4KPiA+IC0jaWZuZGVmIEZJQk1B
UAo+ID4gLSNkZWZpbmUgRklCTUFQICAgICAgICAgIF9JTygweDAwLCAxKSAgICAvKiBibWFwIGFj
Y2VzcyAqLwo+ID4gK3N0cnVjdCBmaWVtYXAgewo+ID4gKyAgICAgX191NjQgZm1fc3RhcnQ7Cj4g
PiArICAgICBfX3U2NCBmbV9sZW5ndGg7Cj4gPiArICAgICBfX3UzMiBmbV9mbGFnczsKPiA+ICsg
ICAgIF9fdTMyIGZtX21hcHBlZF9leHRlbnRzOwo+ID4gKyAgICAgX191MzIgZm1fZXh0ZW50X2Nv
dW50Owo+ID4gKyAgICAgX191MzIgZm1fcmVzZXJ2ZWQ7Cj4gPiArICAgICBzdHJ1Y3QgZmllbWFw
X2V4dGVudCBmbV9leHRlbnRbMF07Cj4gPiArfTsKPiA+ICsKPiA+ICsjaWZuZGVmIEZJRU1BUAo+
ID4gKyNkZWZpbmUgRklFTUFQICAgICAgICAgICAgICAgX0lPV1IoJ2YnLCAxMSwgc3RydWN0IGZp
ZW1hcCkKPiA+ICAgI2VuZGlmCj4gPgo+ID4gKyNkZWZpbmUgTkVXX0FERFIgICAgIDB4RkZGRkZG
RkYKPiA+ICsKPiA+ICAgI2RlZmluZSBmaWVtYXBfZGVzYyAiZ2V0IGJsb2NrIGFkZHJlc3MgaW4g
ZmlsZSIKPiA+ICAgI2RlZmluZSBmaWVtYXBfaGVscCAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKPiA+ICAgImYyZnNfaW8gZmllbWFwIFtvZmZzZXQgaW4gNGtiXSBbY291bnRdIFtm
aWxlX3BhdGhdXG5cbiJcCj4gPgo+ID4gICBzdGF0aWMgdm9pZCBkb19maWVtYXAoaW50IGFyZ2Ms
IGNoYXIgKiphcmd2LCBjb25zdCBzdHJ1Y3QgY21kX2Rlc2MgKmNtZCkKPiA+ICAgewo+ID4gLSAg
ICAgdTY0IG9mZnNldDsKPiA+IC0gICAgIHUzMiBibGtudW07Cj4gPiAgICAgICB1bnNpZ25lZCBj
b3VudCwgaTsKPiA+ICAgICAgIGludCBmZDsKPiA+ICsgICAgIF9fdTY0IHBoeV9hZGRyOwo+ID4g
KyAgICAgc3RydWN0IGZpZW1hcCAqZm0gPSB4bWFsbG9jKHNpemVvZihzdHJ1Y3QgZmllbWFwKSAr
Cj4gPiArICAgICAgICAgICAgICAgICAgICAgc2l6ZW9mKHN0cnVjdCBmaWVtYXBfZXh0ZW50KSk7
Cj4gPgo+ID4gICAgICAgaWYgKGFyZ2MgIT0gNCkgewo+ID4gICAgICAgICAgICAgICBmcHV0cygi
RXhjZXNzIGFyZ3VtZW50c1xuXG4iLCBzdGRlcnIpOwo+ID4gQEAgLTY1OSwyMSArNjc0LDI4IEBA
IHN0YXRpYyB2b2lkIGRvX2ZpZW1hcChpbnQgYXJnYywgY2hhciAqKmFyZ3YsIGNvbnN0IHN0cnVj
dCBjbWRfZGVzYyAqY21kKQo+ID4gICAgICAgICAgICAgICBleGl0KDEpOwo+ID4gICAgICAgfQo+
ID4KPiA+IC0gICAgIG9mZnNldCA9IGF0b2koYXJndlsxXSk7Cj4gPiArICAgICBmbS0+Zm1fc3Rh
cnQgPSBhdG9pKGFyZ3ZbMV0pICogNDA5NjsKPiA+ICsgICAgIGZtLT5mbV9sZW5ndGggPSA0MDk2
Owo+Cj4gRjJGU19CTEtTSVpFCj4KPiA+ICsgICAgIGZtLT5mbV9leHRlbnRfY291bnQgPSAxOwo+
ID4gICAgICAgY291bnQgPSBhdG9pKGFyZ3ZbMl0pOwo+ID4KPiA+ICAgICAgIGZkID0geG9wZW4o
YXJndlszXSwgT19SRE9OTFkgfCBPX0xBUkdFRklMRSwgMCk7Cj4gPgo+ID4gLSAgICAgcHJpbnRm
KCJGaWVtYXA6IG9mZnNldCA9ICUwOCJQUkl4NjQiIGxlbiA9ICVkXG4iLCBvZmZzZXQsIGNvdW50
KTsKPiA+ICsgICAgIHByaW50ZigiRmllbWFwOiBvZmZzZXQgPSAlMDgiUFJJeDY0IiBsZW4gPSAl
ZFxuIiwKPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBm
bS0+Zm1fc3RhcnQgLyA0MDk2LCBjb3VudCk7Cj4KPiBGMkZTX0JMS1NJWkUKPgo+ID4gICAgICAg
Zm9yIChpID0gMDsgaSA8IGNvdW50OyBpKyspIHsKPiA+IC0gICAgICAgICAgICAgYmxrbnVtID0g
b2Zmc2V0ICsgaTsKPiA+IC0KPiA+IC0gICAgICAgICAgICAgaWYgKGlvY3RsKGZkLCBGSUJNQVAs
ICZibGtudW0pIDwgMCkKPiA+IC0gICAgICAgICAgICAgICAgICAgICBkaWVfZXJybm8oIkZJQk1B
UCBmYWlsZWQiKTsKPiA+IC0KPiA+IC0gICAgICAgICAgICAgcHJpbnRmKCIldSAiLCBibGtudW0p
Owo+ID4gKyAgICAgICAgICAgICBpZiAoaW9jdGwoZmQsIEZJRU1BUCwgZm0pIDwgMCkKPiA+ICsg
ICAgICAgICAgICAgICAgICAgICBkaWVfZXJybm8oIkZJRU1BUCBmYWlsZWQiKTsKPiA+ICsKPiA+
ICsgICAgICAgICAgICAgcGh5X2FkZHIgPSBmbS0+Zm1fZXh0ZW50WzBdLmZlX3BoeXNpY2FsIC8g
NDA5NjsKPgo+IEYyRlNfQkxLU0laRQo+Cj4gPiArICAgICAgICAgICAgIGlmIChwaHlfYWRkciA9
PSBORVdfQUREUikKPiA+ICsgICAgICAgICAgICAgICAgICAgICBwcmludGYoIk5FV19BRERSICIp
Owo+ID4gKyAgICAgICAgICAgICBlbHNlCj4gPiArICAgICAgICAgICAgICAgICAgICAgcHJpbnRm
KCIlbGx1ICIsIHBoeV9hZGRyKTsKPiA+ICsgICAgICAgICAgICAgZm0tPmZtX3N0YXJ0ICs9IDQw
OTY7Cj4KPiBGMkZTX0JMS1NJWkUKPgo+ID4gICAgICAgfQo+ID4gICAgICAgcHJpbnRmKCJcbiIp
Owo+ID4gKyAgICAgZnJlZShmbSk7Cj4gPiAgICAgICBleGl0KDApOwo+ID4gICB9Cj4gPgo+ID4K
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1m
MmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdl
Lm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1m
MmZzLWRldmVsCg==
