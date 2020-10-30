Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4958029FAB1
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 30 Oct 2020 02:46:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kYJV6-0003Lw-6H; Fri, 30 Oct 2020 01:46:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kYJV5-0003Li-1h
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Oct 2020 01:46:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fzIBdE11fRPXVpK/5f4gJOiYBzS/DWloWXyL0lox/F8=; b=DJ8GabHNVlfYkw3KueELQLVCef
 iUIil4F/bcj/lnl/jkBZf58mFzDxCBI8I7nlzpFxx8ald46qldRcWj2kAgnDcXuKMCqt+wVGWWeWH
 tTQbDRcycoiFTOOv30VGqhpwXNDAWWBooUJS2/8BrR852XHrsSnlWHrCsEEZzMkg2gfU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fzIBdE11fRPXVpK/5f4gJOiYBzS/DWloWXyL0lox/F8=; b=bTT2XbRB3GugVmg0hC6TEpvi5w
 ymAyAQH3GImQq8KnyajBAIwaPYGn6FVjS3ATYsHAiREdPLp2Gd5beTaOxCtmyJB8X2NWE1CeztDru
 HBlSVKagBhsK7qOBQIE6tTMuC+ZJM10I6CYgef9ZjA/RKFxJVGmWUuVqqdDCOt7sOYh4=;
Received: from mail-lf1-f68.google.com ([209.85.167.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kYJUv-00CLTF-PV
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 30 Oct 2020 01:46:42 +0000
Received: by mail-lf1-f68.google.com with SMTP id i6so5874543lfd.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 Oct 2020 18:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=fzIBdE11fRPXVpK/5f4gJOiYBzS/DWloWXyL0lox/F8=;
 b=OxJq8Wye4Jib/cR24NDT8S9LhUd0FrRqhkVj7Y5sYQr+wBOY7Mkg60jKF3r/ES06gR
 z30on/Hc3e4TIsfkf9E50y09ioQp6pfsSzUY8nsQxzS70iL4TDCIqSXQQDaabjKeig32
 PGc5a7qrgELguAr8mGObU2IZPNkzjI1SPWdAkf0TLs/AgLEc2lzpSrXP4VJCooCu8Fhc
 9Zbwq7ZSsyUgdl/C0sI6rd5BeiWyR52tJo0FFX0NKv2UdGYVjFMz8AHnw1DFqdATfOKp
 b+3/VMZzBB9dLTq/Nbe9b9eQlTkR659hY2IozF/7cHUdqzGaI+sv7M2la0zn7RnhKO0o
 2CtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=fzIBdE11fRPXVpK/5f4gJOiYBzS/DWloWXyL0lox/F8=;
 b=mbK8CNSXB/XTcuZswbZH31dDqxEWfdhUtESR4ag67ftLVC3B1yEFe5DYMvS3NWkyBm
 JISx9YpHHadaxVN0afrjMAofXMjM/Kk5Ki9FEy5pKovyYQvWuvVvv+lQIB1xxaOd9zSF
 pv+77DwX7CAw5hYTh6fXc0eZ74qvrP1tCkyZ9WEK8stzxKrBkjQAAKmzbYJ9mi0IS1KI
 7C061s6aRODquPVdzC30aeAEav5TuaBykS6JZxf5PaULBmawZSEQqvtKjOEHQ674WYVH
 w3GY9mRHTDBfQ7x6kdzlAzhzokEuiWPW/WUnY95sG08X1I+l7pyuBzANqazYxQ8zSNWD
 +53A==
X-Gm-Message-State: AOAM530GEKjV2f9Gz53TPWsftHEHkcM1D3G2LlycpzBrigJh2TFoxtbU
 5A5PXmiHhRmoSFKKr/BNNgvp9rIV55DXgBDJbXc=
X-Google-Smtp-Source: ABdhPJxnuRCWaAMORoO5AoECX4a4MDfVIv2Z7I16KDl5XTotB4z7o9iKC+y46fnn1yvHTbNzKSscXzwzd9j4fkoT454=
X-Received: by 2002:a19:420b:: with SMTP id p11mr2420961lfa.326.1604022387151; 
 Thu, 29 Oct 2020 18:46:27 -0700 (PDT)
MIME-Version: 1.0
References: <20201029041538.4165209-1-daeho43@gmail.com>
 <20201029041538.4165209-2-daeho43@gmail.com>
 <92f4da8e-27a1-7577-84f9-39038eaa88cb@huawei.com>
 <20201029155453.GB849@sol.localdomain>
In-Reply-To: <20201029155453.GB849@sol.localdomain>
From: Daeho Jeong <daeho43@gmail.com>
Date: Fri, 30 Oct 2020 10:46:16 +0900
Message-ID: <CACOAw_xc5KYhVgp-b8NTs8vapWxiLF3m-qUMO2qgjp4gQQb2Pw@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.167.68 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.68 listed in wl.mailspike.net]
X-Headers-End: 1kYJUv-00CLTF-PV
Subject: Re: [f2fs-dev] [PATCH v5 2/2] f2fs: add
 F2FS_IOC_SET_COMPRESS_OPTION ioctl
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

Q2hhbywgZ290IGl0IG9uIGYyZnNfaXNfY29tcHJlc3NfYWxnb3JpdGhtX3ZhbGlkKCkuCkkgYWxz
byBhZ3JlZSBvbiBFcmljJ3Mgb3BpbmlvbiBvbiB0aGF0IGVycm9yIHZhbHVlLgoKMjAyMOuFhCAx
MOyblCAzMOydvCAo6riIKSDsmKTsoIQgMTI6NTQsIEVyaWMgQmlnZ2VycyA8ZWJpZ2dlcnNAa2Vy
bmVsLm9yZz7ri5jsnbQg7J6R7ISxOgo+Cj4gT24gVGh1LCBPY3QgMjksIDIwMjAgYXQgMDM6Mjk6
MTdQTSArMDgwMCwgQ2hhbyBZdSB3cm90ZToKPiA+ID4gK3N0YXRpYyBpbnQgZjJmc19pb2Nfc2V0
X2NvbXByZXNzX29wdGlvbihzdHJ1Y3QgZmlsZSAqZmlscCwgdW5zaWduZWQgbG9uZyBhcmcpCj4g
PiA+ICt7Cj4gPiA+ICsgICBzdHJ1Y3QgaW5vZGUgKmlub2RlID0gZmlsZV9pbm9kZShmaWxwKTsK
PiA+ID4gKyAgIHN0cnVjdCBmMmZzX3NiX2luZm8gKnNiaSA9IEYyRlNfSV9TQihpbm9kZSk7Cj4g
PiA+ICsgICBzdHJ1Y3QgZjJmc19jb21wX29wdGlvbiBvcHRpb247Cj4gPiA+ICsgICBpbnQgcmV0
ID0gMDsKPiA+ID4gKwo+ID4gPiArICAgaWYgKCFmMmZzX3NiX2hhc19jb21wcmVzc2lvbihzYmkp
KQo+ID4gPiArICAgICAgICAgICByZXR1cm4gLUVPUE5PVFNVUFA7Cj4gPiA+ICsKPiA+ID4gKyAg
IGlmICghKGZpbHAtPmZfbW9kZSAmIEZNT0RFX1dSSVRFKSkKPiA+ID4gKyAgICAgICAgICAgcmV0
dXJuIC1FQkFERjsKPiA+ID4gKwo+ID4gPiArICAgaWYgKGNvcHlfZnJvbV91c2VyKCZvcHRpb24s
IChzdHJ1Y3QgZjJmc19jb21wX29wdGlvbiBfX3VzZXIgKilhcmcsCj4gPiA+ICsgICAgICAgICAg
ICAgICAgICAgICAgICAgICBzaXplb2Yob3B0aW9uKSkpCj4gPiA+ICsgICAgICAgICAgIHJldHVy
biAtRUZBVUxUOwo+ID4gPiArCj4gPiA+ICsgICBpZiAoIWYyZnNfY29tcHJlc3NlZF9maWxlKGlu
b2RlKSB8fAo+ID4gPiArICAgICAgICAgICAgICAgICAgIG9wdGlvbi5sb2dfY2x1c3Rlcl9zaXpl
IDwgTUlOX0NPTVBSRVNTX0xPR19TSVpFIHx8Cj4gPiA+ICsgICAgICAgICAgICAgICAgICAgb3B0
aW9uLmxvZ19jbHVzdGVyX3NpemUgPiBNQVhfQ09NUFJFU1NfTE9HX1NJWkUgfHwKPiA+ID4gKyAg
ICAgICAgICAgICAgICAgICBvcHRpb24uYWxnb3JpdGhtID49IENPTVBSRVNTX01BWCkKPiA+ID4g
KyAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiA+ICsKPiA+ID4gKyAgIGZpbGVfc3RhcnRf
d3JpdGUoZmlscCk7Cj4gPiA+ICsgICBpbm9kZV9sb2NrKGlub2RlKTsKPiA+ID4gKwo+ID4gPiAr
ICAgaWYgKGYyZnNfaXNfbW1hcF9maWxlKGlub2RlKSB8fCBnZXRfZGlydHlfcGFnZXMoaW5vZGUp
KSB7Cj4gPiA+ICsgICAgICAgICAgIHJldCA9IC1FQlVTWTsKPiA+ID4gKyAgICAgICAgICAgZ290
byBvdXQ7Cj4gPiA+ICsgICB9Cj4gPiA+ICsKPiA+ID4gKyAgIGlmIChpbm9kZS0+aV9zaXplICE9
IDApIHsKPiA+ID4gKyAgICAgICAgICAgcmV0ID0gLUVGQklHOwo+ID4gPiArICAgICAgICAgICBn
b3RvIG91dDsKPiA+ID4gKyAgIH0KPiA+Cj4gPiBIbW0uLi4KPiA+Cj4gPiBTaG91bGRuJ3QgaXQg
YmU6Cj4gPgo+ID4gaWYgKGFsZ29yaXRobSA+PSBDT01QUkVTU19NQVgpIHsKPiA+ICAgICAgIHJl
dCA9IC1FTk9QS0c7Cj4gPiAgICAgICBnb3RvIG91dDsKPiA+IH0KPiA+Cj4gPiBpZiAoIWYyZnNf
Y29wc1thbGdvcml0aG1dKQo+ID4gICAgICAgZjJmc193YXJuKC4uLik7Cj4KPiBOb3RlIHRoYXQg
bXkgaW50ZW50IHdpdGggcmVjb21tZW5kaW5nIEVOT1BLRyB3YXMgZm9yIGl0IHRvIGJlIHJldHVy
bmVkIGluIHRoZQo+ICFmMmZzX2NvcHNbYWxnb3JpdGhtXSBjYXNlLCBzaW1pbGFyIHRvIGhvdyBv
cGVuaW5nIGFuIGVuY3J5cHRlZCBmaWxlIHdoZW4gdGhlCj4gZW5jcnlwdGlvbiBhbGdvcml0aG0g
aXMgcmVjb2duaXplZCBidXQgbm90IHN1cHBvcnRlZCBieSB0aGUga2VybmVsIHJldHVybnMKPiBF
Tk9QS0cuICBGb3IgYSB0cnVseSB1bnJlY29nbml6ZWQgYWxnb3JpdGhtIChhbGdvcml0aG0gPj0g
Q09NUFJFU1NfTUFYKSwgRUlOVkFMCj4gd291bGQgcHJvYmFibHkgYmUgbW9yZSBhcHByb3ByaWF0
ZS4gIFNvIGlmICFmMmZzX2NvcHNbYWxnb3JpdGhtXSBpcyBub3cgYWxsb3dlZCwKPiB0aGVuIEVO
T1BLRyBzaG91bGQgbm8gbG9uZ2VyIGJlIGFtb25nIHRoZSBlcnJvciBjb2RlcyB0aGlzIGlvY3Rs
IHJldHVybnMuCj4KPiAtIEVyaWMKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
