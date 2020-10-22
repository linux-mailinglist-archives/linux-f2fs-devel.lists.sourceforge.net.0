Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B54295687
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Oct 2020 04:53:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kVQjX-0008Sp-3q; Thu, 22 Oct 2020 02:53:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kVQjV-0008Sh-N9
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Oct 2020 02:53:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qg0FA381j6jxElnzXtOOWyYAwcDaYrU3Fm/GnZyYlts=; b=JNKRYguGunkTjBqVVRmdXEdydx
 x+HvL0+G9/fjBIiLvC8hHdkqZ1Yq1iQpnqrf+rQF6Zld1pZ3DcixaOqPjUtsd1ScMYPBu7qWgBV7M
 EP0gsZs6pcHcBeoIdVLxMyq4BtB0lyAfRKK/NArBYh8ZKDpQ0XKjJ+6rELVnn9FBTccA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qg0FA381j6jxElnzXtOOWyYAwcDaYrU3Fm/GnZyYlts=; b=G6SDQ7ogM4Z2rjSMcfJzpmZRlR
 v1/Wef3K+YQnmXXgexkRx0NSHEGgbo+0qjt6ST1l9VDVb0tIUFXFeLpCq8r0VrkvQsiED7ddh76eA
 WYaVe9zFgS5Dgegpes5Io3ix7D0TIy2egO9WTVnTrmsiCyQdALrmQZR3CvtlQCaC6ZBQ=;
Received: from mail-lf1-f66.google.com ([209.85.167.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kVQjR-0089vz-TD
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Oct 2020 02:53:41 +0000
Received: by mail-lf1-f66.google.com with SMTP id l28so288047lfp.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Oct 2020 19:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Qg0FA381j6jxElnzXtOOWyYAwcDaYrU3Fm/GnZyYlts=;
 b=q3pxVs4HLo3It1DamBzUhxNl+Kr3z/DfHRs9Qe9zrcIHMC9Wc3mtoT3jotFAW8ks34
 Tg/jgufeADd3hRvrNeJfWY85lLl2kn8SDthL2WrSWAKIFaMvHu6J/2VleTbIwmi6ef9o
 JpAP41UHW1p9bYwMsNrjRFy1VdiqcZWsWWiBsGj0PlPBbsOjYS8T05cwcHCs6IqN5Wwm
 VaNEUZNPxG45J7cZR8HXFCCkhk36kyF1u0rSwt2H06gJMK196RlVjR43hRumS9gT+5l+
 3TJs7xk1gKJYZUQAhLjNQEkgoAVQP4OIrOZ0n4gM+fnh+opw0mUJusF9QpsUIGSbT0v2
 XfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Qg0FA381j6jxElnzXtOOWyYAwcDaYrU3Fm/GnZyYlts=;
 b=Q3goNIAsp/6goyhFrr4/i/2Xs3Clti+DCdcMtSQgYvoF7OEU/SLg+hRlNYut1ptUca
 pU8RjO2LaqEHj13fCqxe8lFudPfeNHJyOeNE1NQlQk3xxd2GZNGNfdWIEFA6GL2nVZxn
 cqO2/xNEv13lWv8Tw/P3+yxwjVEhrSo8aLd0hgCuLpdYUNYmIo4J9bPdno01Zpq51+9u
 tLEHdmCsrtnhq9SZ8jUaN1VF4VM2mXrcrccwXECgF0AunaVdeJid+UQ6ezlyY5Env8s3
 rC6eo8gbDJgcof7clNu+sa9GRZz/Orl+psDXiO7Y1xafOCLoqNC+JRE7NvBFkh4dHZV/
 xwKg==
X-Gm-Message-State: AOAM5322/zD0XFQSrGZcF2LDz1oadBRs3DZwuJxrCr/P7Ye1OkqnN9wr
 t4plj/NDcTTG89hWmgD5c0+4znB8Pm9Nj94T6lg=
X-Google-Smtp-Source: ABdhPJwkif7+CgTkcWtQA7UrO+FvhG2jWLZ+UJgZ+yjf0SBRaZC09VHIH6R9re8wydzUYYTSnf3Oh8vR8monjRi9AOE=
X-Received: by 2002:ac2:4da1:: with SMTP id h1mr89758lfe.343.1603335211187;
 Wed, 21 Oct 2020 19:53:31 -0700 (PDT)
MIME-Version: 1.0
References: <20201016051455.1913795-1-daeho43@gmail.com>
 <f8359dde-7e0c-b2fc-451f-2984c50fa552@huawei.com>
In-Reply-To: <f8359dde-7e0c-b2fc-451f-2984c50fa552@huawei.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 22 Oct 2020 11:53:20 +0900
Message-ID: <CACOAw_wrTSZ3DWBUJA=ePe=fDRgEgqCfsbSqKmE6+ACW8A-RQg@mail.gmail.com>
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
 [209.85.167.66 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.66 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1kVQjR-0089vz-TD
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

WWVwLCBJdCBzb3VuZHMgZ29vZCB0byBtZS4KCjIwMjDrhYQgMTDsm5QgMjHsnbwgKOyImCkg7Jik
7ZuEIDM6MDgsIENoYW8gWXUgPHl1Y2hhbzBAaHVhd2VpLmNvbT7ri5jsnbQg7J6R7ISxOgo+Cj4g
T24gMjAyMC8xMC8xNiAxMzoxNCwgRGFlaG8gSmVvbmcgd3JvdGU6Cj4gPiBGcm9tOiBEYWVobyBK
ZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4KPiA+IEFkZGVkIGNvbXByX2lub2RlIHRv
IHNob3cgY29tcHJlc3NlZCBpbm9kZSBjb3VudCBhbmQgY29tcHJfYmxvY2tzIHRvCj4gPiBzaG93
IGNvbXByZXNzZWQgYmxvY2sgY291bnQgaW4gc3lzZnMuCj4KPiBBcyB0aGVyZSBhcmUgc28gbWFu
eSBlbnRyaWVzIGluIC4uL2YyZnMvPGRpc2s+LyBkaXJlY3RvcnksIGl0IGxvb2tzIGEgbWVzcwo+
IHRoZXJlLCBJIHN1Z2dlc3QgdGhhdCB3ZSBjYW4gYWRkIGEgbmV3IGRpcmVjdG9yeSAnc3RhdHMn
IGluIC4uL2YyZnMvPGRpc2s+LywKPiBpbiB3aGVyZSB3ZSBjYW4gc3RvcmUgYWxsIHJlYWRvbmx5
IHN0YXRzIHJlbGF0ZWQgZW50cmllcyB0aGVyZSBsYXRlci4KPgo+IEhvdyBkbyB5b3UgdGhpbms/
Cj4KPiBUaGFua3MsCj4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBEYWVobyBKZW9uZyA8ZGFlaG9q
ZW9uZ0Bnb29nbGUuY29tPgo+ID4gLS0tCj4gPiAgIERvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcv
c3lzZnMtZnMtZjJmcyB8IDEwICsrKysrKysrKysKPiA+ICAgZnMvZjJmcy9zeXNmcy5jICAgICAg
ICAgICAgICAgICAgICAgICAgIHwgMTcgKysrKysrKysrKysrKysrKysKPiA+ICAgMiBmaWxlcyBj
aGFuZ2VkLCAyNyBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vQUJJL3Rlc3Rpbmcvc3lzZnMtZnMtZjJmcyBiL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcv
c3lzZnMtZnMtZjJmcwo+ID4gaW5kZXggODM0ZDBiZWNhZTZkLi5hMDFjMjY0ODRjNjkgMTAwNjQ0
Cj4gPiAtLS0gYS9Eb2N1bWVudGF0aW9uL0FCSS90ZXN0aW5nL3N5c2ZzLWZzLWYyZnMKPiA+ICsr
KyBiL0RvY3VtZW50YXRpb24vQUJJL3Rlc3Rpbmcvc3lzZnMtZnMtZjJmcwo+ID4gQEAgLTM1MCwz
ICszNTAsMTMgQEAgRGF0ZTogICAgICAgICAgICBBcHJpbCAyMDIwCj4gPiAgIENvbnRhY3Q6ICAg
ICJEYWVobyBKZW9uZyIgPGRhZWhvamVvbmdAZ29vZ2xlLmNvbT4KPiA+ICAgRGVzY3JpcHRpb246
ICAgICAgICBHaXZlIGEgd2F5IHRvIGNoYW5nZSBpb3N0YXRfcGVyaW9kIHRpbWUuIDNzZWNzIGJ5
IGRlZmF1bHQuCj4gPiAgICAgICAgICAgICAgIFRoZSBuZXcgaW9zdGF0IHRyYWNlIGdpdmVzIHN0
YXRzIGdhcCBnaXZlbiB0aGUgcGVyaW9kLgo+ID4gKwo+ID4gK1doYXQ6ICAgICAgICAgICAgICAg
IC9zeXMvZnMvZjJmcy88ZGlzaz4vY29tcHJfaW5vZGUKPiA+ICtEYXRlOiAgICAgICAgICAgICAg
ICBPY3RvYmVyIDIwMjAKPiA+ICtDb250YWN0OiAgICAgIkRhZWhvIEplb25nIiA8ZGFlaG9qZW9u
Z0Bnb29nbGUuY29tPgo+ID4gK0Rlc2NyaXB0aW9uOiBTaG93IGNvbXByZXNzZWQgaW5vZGUgY291
bnQKPiA+ICsKPiA+ICtXaGF0OiAgICAgICAgICAgICAgICAvc3lzL2ZzL2YyZnMvPGRpc2s+L2Nv
bXByX2Jsb2Nrcwo+ID4gK0RhdGU6ICAgICAgICAgICAgICAgIE9jdG9iZXIgMjAyMAo+ID4gK0Nv
bnRhY3Q6ICAgICAiRGFlaG8gSmVvbmciIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPiArRGVz
Y3JpcHRpb246IFNob3cgY29tcHJlc3NlZCBibG9jayBjb3VudAo+ID4gZGlmZiAtLWdpdCBhL2Zz
L2YyZnMvc3lzZnMuYyBiL2ZzL2YyZnMvc3lzZnMuYwo+ID4gaW5kZXggOTRjOThlNDEyYWExLi43
MTM5YTI5YTAwZDMgMTAwNjQ0Cj4gPiAtLS0gYS9mcy9mMmZzL3N5c2ZzLmMKPiA+ICsrKyBiL2Zz
L2YyZnMvc3lzZnMuYwo+ID4gQEAgLTIyMyw2ICsyMjMsMTkgQEAgc3RhdGljIHNzaXplX3QgYXZn
X3ZibG9ja3Nfc2hvdyhzdHJ1Y3QgZjJmc19hdHRyICphLAo+ID4gICAgICAgZjJmc191cGRhdGVf
c2l0X2luZm8oc2JpKTsKPiA+ICAgICAgIHJldHVybiBzcHJpbnRmKGJ1ZiwgIiVsbHVcbiIsICh1
bnNpZ25lZCBsb25nIGxvbmcpKHNpLT5hdmdfdmJsb2NrcykpOwo+ID4gICB9Cj4gPiArCj4gPiAr
c3RhdGljIHNzaXplX3QgY29tcHJfaW5vZGVfc2hvdyhzdHJ1Y3QgZjJmc19hdHRyICphLAo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgc3RydWN0IGYyZnNfc2JfaW5mbyAqc2JpLCBj
aGFyICpidWYpCj4gPiArewo+ID4gKyAgICAgcmV0dXJuIHNwcmludGYoYnVmLCAiJXVcbiIsIGF0
b21pY19yZWFkKCZzYmktPmNvbXByX2lub2RlKSk7Cj4gPiArfQo+ID4gKwo+ID4gK3N0YXRpYyBz
c2l6ZV90IGNvbXByX2Jsb2Nrc19zaG93KHN0cnVjdCBmMmZzX2F0dHIgKmEsCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZjJmc19zYl9pbmZvICpzYmksIGNoYXIgKmJ1
ZikKPiA+ICt7Cj4gPiArICAgICByZXR1cm4gc3ByaW50ZihidWYsICIlbGx1XG4iLCBhdG9taWM2
NF9yZWFkKCZzYmktPmNvbXByX2Jsb2NrcykpOwo+ID4gK30KPiA+ICsKPiA+ICAgI2VuZGlmCj4g
Pgo+ID4gICBzdGF0aWMgc3NpemVfdCBtYWluX2Jsa2FkZHJfc2hvdyhzdHJ1Y3QgZjJmc19hdHRy
ICphLAo+ID4gQEAgLTU5MSw2ICs2MDQsOCBAQCBGMkZTX1NUQVRfQVRUUihTVEFUX0lORk8sIGYy
ZnNfc3RhdF9pbmZvLCBnY19iYWNrZ3JvdW5kX2NhbGxzLCBiZ19nYyk7Cj4gPiAgIEYyRlNfR0VO
RVJBTF9ST19BVFRSKG1vdmVkX2Jsb2Nrc19iYWNrZ3JvdW5kKTsKPiA+ICAgRjJGU19HRU5FUkFM
X1JPX0FUVFIobW92ZWRfYmxvY2tzX2ZvcmVncm91bmQpOwo+ID4gICBGMkZTX0dFTkVSQUxfUk9f
QVRUUihhdmdfdmJsb2Nrcyk7Cj4gPiArRjJGU19HRU5FUkFMX1JPX0FUVFIoY29tcHJfaW5vZGUp
Owo+ID4gK0YyRlNfR0VORVJBTF9ST19BVFRSKGNvbXByX2Jsb2Nrcyk7Cj4gPiAgICNlbmRpZgo+
ID4KPiA+ICAgI2lmZGVmIENPTkZJR19GU19FTkNSWVBUSU9OCj4gPiBAQCAtNjc1LDYgKzY5MCw4
IEBAIHN0YXRpYyBzdHJ1Y3QgYXR0cmlidXRlICpmMmZzX2F0dHJzW10gPSB7Cj4gPiAgICAgICBB
VFRSX0xJU1QobW92ZWRfYmxvY2tzX2ZvcmVncm91bmQpLAo+ID4gICAgICAgQVRUUl9MSVNUKG1v
dmVkX2Jsb2Nrc19iYWNrZ3JvdW5kKSwKPiA+ICAgICAgIEFUVFJfTElTVChhdmdfdmJsb2Nrcyks
Cj4gPiArICAgICBBVFRSX0xJU1QoY29tcHJfaW5vZGUpLAo+ID4gKyAgICAgQVRUUl9MSVNUKGNv
bXByX2Jsb2NrcyksCj4gPiAgICNlbmRpZgo+ID4gICAgICAgTlVMTCwKPiA+ICAgfTsKPiA+CgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJm
cy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5u
ZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJm
cy1kZXZlbAo=
