Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5885A241A6D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Aug 2020 13:32:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k5SVj-0002Ej-Mk; Tue, 11 Aug 2020 11:32:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1k5SVi-0002Ec-9F
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Aug 2020 11:32:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NsxTq2hJFDhrj5npD19VEMk0elp7jl9d+dS7G7R9+H0=; b=e5cqQwg7S36kwi68HjfCwQ9J8p
 o93QB+UiMprMb9RqxqNvdiaRvWjVdg82QnXMTXoAY5MGXAk4SZEsYULM5vukPAJiolPXAFblw6AYS
 EAX/rNzMPw/u6WOCLSDaJGKisYqw0y1Tp4IiMbr928IVPwSkY5rbMwBvPMEoKFoJ5g88=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NsxTq2hJFDhrj5npD19VEMk0elp7jl9d+dS7G7R9+H0=; b=HyvNhWcstDS5kKWHcJ+4ESHp5T
 9jV04OlvqIXMY5iXbae3+RX5o8xpkYqwbpSR59bpil1X2GoCWdg60u4pbbNdnqmIKXrNhSV/UJhm+
 IKVVwl0qGAB4CXibDCO4dh27ne9hHyjqBCZB3epgMVAkDZn4t7wxg7hOXcKxJzf7oNfw=;
Received: from mail-lj1-f195.google.com ([209.85.208.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1k5SVf-005QKX-Iz
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 11 Aug 2020 11:32:06 +0000
Received: by mail-lj1-f195.google.com with SMTP id t6so13104797ljk.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 11 Aug 2020 04:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=NsxTq2hJFDhrj5npD19VEMk0elp7jl9d+dS7G7R9+H0=;
 b=sD8jA94PMGPpDFYMLLEWLQMu/TVAMrHiAfW0URFlU298Lgkw9BQ6kNu7SlY8XXKa8O
 P1ouiMD40YX4x/7FWlpPJ8O+bgKyItLW/uLPe1a9sCqQ3967SVPYvWG0eAE8WfB7p23N
 JK79hkWDS7ycnKZFuLOmg8a+ltRLgwcvscGGpR8WdTt0CP9BhjzS0/3NkoIs2V5Eggul
 Lp0quDbjrivbDIUF9RO8p49QmcutyqcUrSMHmEkgvBZJ3VX4SXVPfdkn+Gt+6DYRkMPE
 S5R1ONAlWvR7E26iUyqZqewJt1IuXhQltef9mADESy7ub7kUAoMApkTfD/JiZeqNR/0+
 6W3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=NsxTq2hJFDhrj5npD19VEMk0elp7jl9d+dS7G7R9+H0=;
 b=pPhlBlCBFdVZaKYvQXykVZNaIT2J/Km6/N+fU41TswtNtBfzjzoAJthxWH+mY5MIwG
 DuEr7A7jHapTmBrTagFa/ph5CQVbP0tACXadv3ytk1qFSvOzPjGoL2WdB0GATotgfEJX
 0ifkCrwU57diZHZhJCkk5s++Xlxqu5ZSOZMH8ep8JKShLyEO1WeUpQjPDmF980f9B9dE
 tAF/Stcb2wH3KmCnMX17FgYqMUjNB8qFnv70sZKfq2sDhUOKVSUGjYhPmpw+VFzzSS44
 el+1bNyOwZcSzuI2qYkNxgrs0OZccAb0PNA0rChI2AG5s8Z4fEDyxPbUKA3fP9GJOO+s
 O73A==
X-Gm-Message-State: AOAM532/zcO/yez6br5Fw8GwpiWy3MCcuckP+25aOx9aU3bUFW+2tLYh
 iLYc8EJIZvkoHA/GymhUII7j+UWf5xZd0/8FRpk=
X-Google-Smtp-Source: ABdhPJwwrqVlzleSsVvjFZzTMP7FfThPY4qYUrFEYqKFaqXkAuPi4bBx6KzR9xiqIhwQZSBoEjvnPTU5IoK9GFYOsg4=
X-Received: by 2002:a2e:b8cf:: with SMTP id s15mr2944467ljp.166.1597145509756; 
 Tue, 11 Aug 2020 04:31:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200811033753.783276-1-daeho43@gmail.com>
 <20200811071552.GA8365@xiangao.remote.csb>
 <3059d7b0-cf50-4315-e5a9-8d9c00965a7c@huawei.com>
 <CACOAw_yic7GF3E1zEvZ=Gea3XW4fMYdg-cNuu4wfg+uTKMcJqA@mail.gmail.com>
 <CACOAw_wi3C0iyTVYc3075d4K27NT7BGMGzsKFDDozf=98vWMcA@mail.gmail.com>
 <20200811101827.GA7870@xiangao.remote.csb>
 <CACOAw_zRPeGzHyc_siLqBRjURWTE61G5rGCwk7bnbcOnADGRpg@mail.gmail.com>
 <20200811112912.GB7870@xiangao.remote.csb>
In-Reply-To: <20200811112912.GB7870@xiangao.remote.csb>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 11 Aug 2020 20:31:38 +0900
Message-ID: <CACOAw_zAbTf+hEW0XVyL-aUw7oxCFTm_jRXLM8eiaOEdDWc0Qw@mail.gmail.com>
To: Gao Xiang <hsiangkao@redhat.com>
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.195 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1k5SVf-005QKX-Iz
Subject: Re: [f2fs-dev] [PATCH] f2fs: change virtual mapping way for
 compression pages
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
Cc: kernel-team@android.com, Daeho Jeong <daehojeong@google.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

UGx1cywgZGlmZmVyZW50bHkgZnJvbSB5b3VyIHRlc3RiZWQsIGluIG15IHBpeGVsIGRldmljZSwg
dGhlcmUgc2VlbXMKdG8gYmUgbXVjaCBtb3JlIGNvbnRlbnRpb24gaW4gdm1hcCgpIG9wZXJhdGlv
bi4KSWYgaXQncyBub3QgdGhlcmUsIEkgYWdyZWUgdGhhdCB0aGVyZSBtaWdodCBub3QgYmUgYSBi
aWcgZGlmZmVyZW5jZQpiZXR3ZWVuIHZtYXAoKSBhbmQgdm1fbWFwX3JhbSgpLgoKMjAyMOuFhCA4
7JuUIDEx7J28ICjtmZQpIOyYpO2bhCA4OjI5LCBHYW8gWGlhbmcgPGhzaWFuZ2thb0ByZWRoYXQu
Y29tPuuLmOydtCDsnpHshLE6Cj4KPiBPbiBUdWUsIEF1ZyAxMSwgMjAyMCBhdCAwODoyMToyM1BN
ICswOTAwLCBEYWVobyBKZW9uZyB3cm90ZToKPiA+IFN1cmUsIEknbGwgdXBkYXRlIHRoZSB0ZXN0
IGNvbmRpdGlvbiBhcyB5b3Ugc2FpZCBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuCj4gPiBGWUksIHRo
ZSB0ZXN0IGlzIGRvbmUgd2l0aCAxNmtiIGNodW5rIGFuZCBQaXhlbCAzIChhcm02NCkgZGV2aWNl
Lgo+Cj4gWWVhaCwgYW55d2F5LCBpdCdkIGJldHRlciB0byBsb2NrIHRoZSBmcmVxIGFuZCBvZmZs
aW5lIHRoZSBsaXR0bGUKPiBjb3JlcyBpbiB5b3VyIHRlc3QgYXMgd2VsbCAoaXQnZCBtYWtlIG1v
cmUgc2Vuc2UpLiBlLmcuIGlmIDE2ayBjbHVzdGVyCj4gaXMgYXBwbGllZCwgZXZlbiBhbGwgZGF0
YSBpcyB6ZXJvZWQsIHRoZSBjb3VudCBvZiB2bWFwL3ZtX21hcF9yYW0KPiBpc24ndCBodWdlb3Vz
IChhbmQgYXMgeW91IHNhaWQsICJzb21ldGltZXMsIGl0IGhhcyBhIHZlcnkgbG9uZyBkZWxheSIs
Cj4gaXQncyBtdWNoIGxpa2UgYW5vdGhlciBzY2hlZHVsaW5nIGNvbmNlcm4gYXMgd2VsbCkuCj4K
PiBBbnl3YXksIEknbSBub3QgYWdhaW5zdCB5b3VyIGNvbW1pdCBidXQgdGhlIGNvbW1pdCBtZXNz
YWdlIGlzIGEgYml0Cj4gb2YgdW5jbGVhci4gQXQgbGVhc3QsIGlmIHlvdSB0aGluayB0aGF0IGlz
IHJlYWxseSB0aGUgY2FzZSwgSSdtIG9rCj4gd2l0aCB0aGF0Lgo+Cj4gVGhhbmtzLAo+IEdhbyBY
aWFuZwo+Cj4gPgo+ID4gVGhhbmtzLAo+ID4KPiA+IDIwMjDDq+KApuKAniA4w6zigLrigJ0gMTHD
rO+/vcK8ICjDreKEouKAnSkgw6zLnMKkw63igLrigJ4gNzoxOCwgR2FvIFhpYW5nIDxoc2lhbmdr
YW9AcmVkaGF0LmNvbT7Dq+KAucucw6zvv73CtCDDrMW+4oCYw6zigJ7CsToKPiA+ID4KPiA+ID4g
T24gVHVlLCBBdWcgMTEsIDIwMjAgYXQgMDY6MzM6MjZQTSArMDkwMCwgRGFlaG8gSmVvbmcgd3Jv
dGU6Cj4gPiA+ID4gUGx1cywgd2hlbiB3ZSB1c2Ugdm1hcCgpLCB2bWFwKCkgbm9ybWFsbHkgZXhl
Y3V0ZXMgaW4gYSBzaG9ydCB0aW1lCj4gPiA+ID4gbGlrZSB2bV9tYXBfcmFtKCkuCj4gPiA+ID4g
QnV0LCBzb21ldGltZXMsIGl0IGhhcyBhIHZlcnkgbG9uZyBkZWxheS4KPiA+ID4gPgo+ID4gPiA+
IDIwMjDDg8Krw6LigqzCpsOi4oKsxb4gOMODwqzDouKCrMK6w6Ligqzvv70gMTHDg8Ksw6/Cv8K9
w4LCvCAow4PCrcOi4oCewqLDouKCrO+/vSkgw4PCrMOLxZPDgsKkw4PCrcOi4oKswrrDouKCrMW+
IDY6MjgsIERhZWhvIEplb25nIDxkYWVobzQzQGdtYWlsLmNvbT7Dg8Krw6LigqzCucOLxZPDg8Ks
w6/Cv8K9w4LCtCDDg8Ksw4XCvsOi4oKsy5zDg8Ksw6LigqzFvsOCwrE6Cj4gPiA+ID4gPgo+ID4g
PiA+ID4gQWN0dWFsbHksIGFzIHlvdSBjYW4gc2VlLCBJIHVzZSB0aGUgd2hvbGUgemVybyBkYXRh
IGJsb2NrcyBpbiB0aGUgdGVzdCBmaWxlLgo+ID4gPiA+ID4gSXQgY2FuIG1heGltaXplIHRoZSBl
ZmZlY3Qgb2YgY2hhbmdpbmcgdmlydHVhbCBtYXBwaW5nLgo+ID4gPiA+ID4gV2hlbiBJIHVzZSBu
b3JtYWwgZmlsZXMgd2hpY2ggY2FuIGJlIGNvbXByZXNzZWQgYWJvdXQgNzAlIGZyb20gdGhlCj4g
PiA+ID4gPiBvcmlnaW5hbCBmaWxlLAo+ID4gPiA+ID4gVGhlIHZtX21hcF9yYW0oKSB2ZXJzaW9u
IGlzIGFib3V0IDJ4IGZhc3RlciB0aGFuIHZtYXAoKSB2ZXJzaW9uLgo+ID4gPgo+ID4gPiBXaGF0
IGYyZnMgZG9lcyBpcyBtdWNoIHNpbWlsYXIgdG8gYnRyZnMgY29tcHJlc3Npb24uIEV2ZW4gaWYg
dGhlc2UKPiA+ID4gYmxvY2tzIGFyZSBhbGwgemVyb2VkLiBJbiBwcmluY2lwbGUsIHRoZSBtYXhp
bXVtIGNvbXByZXNzaW9uIHJhdGlvCj4gPiA+IGlzIGRldGVybWluZWQgKGNsdXN0ZXIgc2l6ZWQg
YmxvY2tzIGludG8gb25lIGNvbXByZXNzZWQgYmxvY2ssIGUuZwo+ID4gPiAxNmsgY2x1c3RlciBp
bnRvIG9uZSBjb21wcmVzc2VkIGJsb2NrKS4KPiA+ID4KPiA+ID4gU28gaXQnZCBiZSBiZXR0ZXIg
dG8gZGVzY3JpYmUgeW91ciBjb25maWd1cmVkIGNsdXN0ZXIgc2l6ZSAoMTZrIG9yCj4gPiA+IDEy
OGspIGFuZCB5b3VyIGhhcmR3YXJlIGluZm9ybWF0aW9uIGluIHRoZSBjb21taXQgbWVzc2FnZSBh
cyB3ZWxsLgo+ID4gPgo+ID4gPiBBY3R1YWxseSwgSSBhbHNvIHRyaWVkIHdpdGggdGhpcyBwYXRj
aCBhcyB3ZWxsIG9uIG15IHg4NiBsYXB0b3AganVzdAo+ID4gPiBub3cgd2l0aCBGSU8gKEkgZGlk
bid0IHVzZSB6ZXJvZWQgYmxvY2sgdGhvdWdoKSwgYW5kIEkgZGlkbid0IG5vdGljZQo+ID4gPiBt
dWNoIGRpZmZlcmVuY2Ugd2l0aCB0dXJibyBib29zdCBvZmYgYW5kIG1heGZyZXEuCj4gPiA+Cj4g
PiA+IEknbSBub3QgYXJndWluZyB0aGlzIGNvbW1pdCwganVzdCBhIG5vdGUgYWJvdXQgdGhpcyBj
b21taXQgbWVzc2FnZS4KPiA+ID4gPiA+ID4gPj4gMTA0ODU3NjAwMCBieXRlcyAoMC45IEcpIGNv
cGllZCwgOS4xNDYyMTcgcywgMTA5IE0vcwo+ID4gPiA+ID4gPiA+PiAxMDQ4NTc2MDAwIGJ5dGVz
ICgwLjkgRykgY29waWVkLCA5Ljk5NzU0MiBzLCAxMDAgTS9zCj4gPiA+ID4gPiA+ID4+IDEwNDg1
NzYwMDAgYnl0ZXMgKDAuOSBHKSBjb3BpZWQsIDEwLjEwOTcyNyBzLCA5OSBNL3MKPiA+ID4KPiA+
ID4gSU1ITywgdGhlIGFib3ZlIG51bWJlciBpcyBtdWNoIGxpa2UgZGVjb21wcmVzc2luZyBpbiB0
aGUgYXJtNjQgbGl0dGxlIGNvcmVzLgo+ID4gPgo+ID4gPiBUaGFua3MsCj4gPiA+IEdhbyBYaWFu
Zwo+ID4gPgo+ID4gPgo+ID4gPiA+ID4KPiA+ID4gPiA+IDIwMjDDg8Krw6LigqzCpsOi4oKsxb4g
OMODwqzDouKCrMK6w6Ligqzvv70gMTHDg8Ksw6/Cv8K9w4LCvCAow4PCrcOi4oCewqLDouKCrO+/
vSkgw4PCrMOLxZPDgsKkw4PCrcOi4oKswrrDouKCrMW+IDQ6NTUsIENoYW8gWXUgPHl1Y2hhbzBA
aHVhd2VpLmNvbT7Dg8Krw6LigqzCucOLxZPDg8Ksw6/Cv8K9w4LCtCDDg8Ksw4XCvsOi4oKsy5zD
g8Ksw6LigqzFvsOCwrE6Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IE9uIDIwMjAvOC8xMSAxNTox
NSwgR2FvIFhpYW5nIHdyb3RlOgo+ID4gPiA+ID4gPiA+IE9uIFR1ZSwgQXVnIDExLCAyMDIwIGF0
IDEyOjM3OjUzUE0gKzA5MDAsIERhZWhvIEplb25nIHdyb3RlOgo+ID4gPiA+ID4gPiA+PiBGcm9t
OiBEYWVobyBKZW9uZyA8ZGFlaG9qZW9uZ0Bnb29nbGUuY29tPgo+ID4gPiA+ID4gPiA+Pgo+ID4g
PiA+ID4gPiA+PiBCeSBwcm9maWxpbmcgZjJmcyBjb21wcmVzc2lvbiB3b3JrcywgSSd2ZSBmb3Vu
ZCB2bWFwKCkgY2FsbGluZ3MgYXJlCj4gPiA+ID4gPiA+ID4+IGJvdHRsZW5lY2tzIG9mIGYyZnMg
ZGVjb21wcmVzc2lvbiBwYXRoLiBDaGFuZ2luZyB0aGVzZSB3aXRoCj4gPiA+ID4gPiA+ID4+IHZt
X21hcF9yYW0oKSwgd2UgY2FuIGVuaGFuY2UgZjJmcyBkZWNvbXByZXNzaW9uIHNwZWVkIHByZXR0
eSBtdWNoLgo+ID4gPiA+ID4gPiA+Pgo+ID4gPiA+ID4gPiA+PiBbVmVyaWZpY2F0aW9uXQo+ID4g
PiA+ID4gPiA+PiBkZCBpZj0vZGV2L3plcm8gb2Y9ZHVtbXkgYnM9MW0gY291bnQ9MTAwMAo+ID4g
PiA+ID4gPiA+PiBlY2hvIDMgPiAvcHJvYy9zeXMvdm0vZHJvcF9jYWNoZXMKPiA+ID4gPiA+ID4g
Pj4gZGQgaWY9ZHVtbXkgb2Y9L2Rldi96ZXJvIGJzPTUxMmsKPiA+ID4gPiA+ID4gPj4KPiA+ID4g
PiA+ID4gPj4gLSB3L28gY29tcHJlc3Npb24gLQo+ID4gPiA+ID4gPiA+PiAxMDQ4NTc2MDAwIGJ5
dGVzICgwLjkgRykgY29waWVkLCAxLjk5OTM4NCBzLCA1MDAgTS9zCj4gPiA+ID4gPiA+ID4+IDEw
NDg1NzYwMDAgYnl0ZXMgKDAuOSBHKSBjb3BpZWQsIDIuMDM1OTg4IHMsIDQ5MSBNL3MKPiA+ID4g
PiA+ID4gPj4gMTA0ODU3NjAwMCBieXRlcyAoMC45IEcpIGNvcGllZCwgMi4wMzk0NTcgcywgNDkw
IE0vcwo+ID4gPiA+ID4gPiA+Pgo+ID4gPiA+ID4gPiA+PiAtIGJlZm9yZSBwYXRjaCAtCj4gPiA+
ID4gPiA+ID4+IDEwNDg1NzYwMDAgYnl0ZXMgKDAuOSBHKSBjb3BpZWQsIDkuMTQ2MjE3IHMsIDEw
OSBNL3MKPiA+ID4gPiA+ID4gPj4gMTA0ODU3NjAwMCBieXRlcyAoMC45IEcpIGNvcGllZCwgOS45
OTc1NDIgcywgMTAwIE0vcwo+ID4gPiA+ID4gPiA+PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykg
Y29waWVkLCAxMC4xMDk3MjcgcywgOTkgTS9zCj4gPiA+ID4gPiA+ID4+Cj4gPiA+ID4gPiA+ID4+
IC0gYWZ0ZXIgcGF0Y2ggLQo+ID4gPiA+ID4gPiA+PiAxMDQ4NTc2MDAwIGJ5dGVzICgwLjkgRykg
Y29waWVkLCAyLjI1MzQ0MSBzLCA0NDQgTS9zCj4gPiA+ID4gPiA+ID4+IDEwNDg1NzYwMDAgYnl0
ZXMgKDAuOSBHKSBjb3BpZWQsIDIuNzM5NzY0IHMsIDM2NSBNL3MKPiA+ID4gPiA+ID4gPj4gMTA0
ODU3NjAwMCBieXRlcyAoMC45IEcpIGNvcGllZCwgMi4xODU2NDkgcywgNDU4IE0vcwo+ID4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ID4gSW5kZWVkLCB2bWFwKCkgYXBwcm9hY2ggaGFzIHNvbWUgaW1w
YWN0IG9uIHRoZSB3aG9sZQo+ID4gPiA+ID4gPiA+IHdvcmtmbG93LiBCdXQgSSBkb24ndCB0aGlu
ayB0aGUgZ2FwIGlzIHN1Y2ggc2lnbmlmaWNhbnQsCj4gPiA+ID4gPiA+ID4gbWF5YmUgaXQgcmVs
YXRlcyB0byB1bmxvY2tlZCBjcHVmcmVxIChhbmQgYmlnIGxpdHRsZQo+ID4gPiA+ID4gPiA+IGNv
cmUgZGlmZmVyZW5jZSBpZiBpdCdzIG9uIHNvbWUgYXJtNjQgYm9hcmQpLgo+ID4gPiA+ID4gPgo+
ID4gPiA+ID4gPiBBZ3JlZWQsCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEkgZ3Vlc3MgdGhlcmUg
c2hvdWxkIGJlIG90aGVyIHJlYXNvbiBjYXVzaW5nIHRoZSBsYXJnZSBwZXJmb3JtYW5jZQo+ID4g
PiA+ID4gPiBnYXAsIHNjaGVkdWxpbmcsIGZyZXF1ZW5jeSwgb3Igc29tZXRoaW5nIGVsc2UuCj4g
PiA+ID4gPiA+Cj4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+Cj4gPiA+
ID4gPiA+ID4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
PiA+ID4gPiA+ID4gPiBMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdAo+ID4gPiA+ID4gPiA+
IExpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cj4gPiA+ID4gPiA+ID4gaHR0
cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZl
bAo+ID4gPiA+ID4gPiA+IC4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+Cj4gPiA+Cj4gPgo+CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1k
ZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQK
aHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1k
ZXZlbAo=
