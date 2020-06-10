Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D60971F5EC0
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jun 2020 01:31:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jjACD-0001Sk-4D; Wed, 10 Jun 2020 23:31:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jjACA-0001Sa-Ay
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 10 Jun 2020 23:31:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tHyLqUmtTTMIbIqoDwVSMrkpYuG5yIqYL6HxByUSF1k=; b=XyEW2QeAi75Ys4DH0Whb8yIEV8
 wi5M2/xiQcN5MJuyi0DQ+qZ52iLygumpBJBFaLaEhMg7XXJEZ9X4sBscR/ypT0EmE9eNEeoEAMaTE
 H606P21oTvqU51fYt7kTxjqxt/qlcGd7hPm5Hl9fPzwxMjdxWriQUFYC20DxCAfvLCPA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tHyLqUmtTTMIbIqoDwVSMrkpYuG5yIqYL6HxByUSF1k=; b=DDY15Oav80rWQJw27kvhUdnsvh
 ywlTFOK2T9XPZ1DQSUuJqgExATTXG+LzelnF81SEKYA20hg+OR6xEA9dIq6cn6AD2vgIRzHB9TK80
 1eguicpRxYJZK+BEblKZhEbl14XUrBh1Ds2s6WEWc7IszbrVXi9W7204GYD+sUF1a31I=;
Received: from mail-lj1-f194.google.com ([209.85.208.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jjAC8-00EhYf-Tk
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 10 Jun 2020 23:31:46 +0000
Received: by mail-lj1-f194.google.com with SMTP id e4so4688556ljn.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 10 Jun 2020 16:31:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tHyLqUmtTTMIbIqoDwVSMrkpYuG5yIqYL6HxByUSF1k=;
 b=XG9A+T23tcxH5dzLrr0ymPt9XR35a61ozhwFwcrizTaPccaz9PvTnfAwC6+xJe1Z32
 bQhAZj7s4dptgCg/IUpHZopInAaxskDR5LI7XPW1MILHn0fk8E+x6zcGc6ilRrbp8SnT
 0VL2rAodo13s6qbJTM69fmuhCZ9qbEVDVdV/2Zz+cB/lML5pIoOSGlF/0d2OEVoYGTCK
 OVIjFc/CcuNMS/VhJcZZ3ZY0cLO0MwTvwS8WkKRkL2HVZXP+3BbcKE7YIkvRBL5UVPwz
 WAZkh9HrMoFlVUtr9z7OnyENLfUF+7/yqwuTBZFZJ9HiNSPWJhV3i4RijqKxyVTSBW1G
 eSww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tHyLqUmtTTMIbIqoDwVSMrkpYuG5yIqYL6HxByUSF1k=;
 b=QwCh11L4g1RHuaNHR6EIaEpzbGMIHNxCMpfeuMielwVkz04MZFaXfwCgri2wlengI2
 KgWNzyFlmkzJA9tGqDV4ZwdKz33kK++U1JN2vnf4tdk8YjfsLKs1I2ekMCQqZo0fm3Bo
 hgBGI/ZnbjGvwihfn5bBrXs4uyJS2cUtc+Q9XUr4hw9RBBOMrabj8GbkxJLs1VLE3h7S
 /lTvJI6r6CizGWb1X/sZ4W4KqUewFpKFzAJ8kd7qt4cDRWhHZdBUmRRIZYOi7/XOUfCJ
 VbcQYm6Ql4WBH/Y9TH1QctdJLC2JnYNedh52ZraCI0Jp7gsvn6gXNhZUL8tZypMNemQ+
 GLiA==
X-Gm-Message-State: AOAM531L1C6ybKpd21YZkED+SGhPUB+YYNsPwSynGqvxzRvjupGRzj/u
 NYvAJVdDDOEiSE+coqUroBVFjpCQT2BBCXm3m4Y=
X-Google-Smtp-Source: ABdhPJwWUXJSo7FIMR1sitkboYnLRaxiaNIMacyQbEajwe57eYp5VZ0caRZ+BgIp7IlUX8p+8hBglJH8Pks+BRRxhT8=
X-Received: by 2002:a2e:92cf:: with SMTP id k15mr2988702ljh.333.1591831891058; 
 Wed, 10 Jun 2020 16:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <20200609060137.143501-1-daeho43@gmail.com>
 <20200609165107.GA228564@gmail.com>
 <CACOAw_xEZ+au9yhFerq9amkRO62Dzxj7h71gEc=i16ReYu5xrg@mail.gmail.com>
 <20200610031532.GA6286@sol.localdomain>
 <CACOAw_wErOPC=Kf3UU8nFGhWRy84ZnCeJbsyPhSCcXv51B_XxQ@mail.gmail.com>
In-Reply-To: <CACOAw_wErOPC=Kf3UU8nFGhWRy84ZnCeJbsyPhSCcXv51B_XxQ@mail.gmail.com>
From: Daeho Jeong <daeho43@gmail.com>
Date: Thu, 11 Jun 2020 08:31:20 +0900
Message-ID: <CACOAw_zka6d06RxFOUTwEV7B6o8A2-_6FvqWh_A1nJ0+7FU9yQ@mail.gmail.com>
To: Eric Biggers <ebiggers@kernel.org>
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.194 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jjAC8-00EhYf-Tk
Subject: Re: [f2fs-dev] [PATCH] f2fs: add F2FS_IOC_SEC_TRIM_FILE ioctl
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

PiA+ID4gPiA+ICsKPiA+ID4gPiA+ICsgICAgIGlmIChmMmZzX3JlYWRvbmx5KHNiaS0+c2IpKQo+
ID4gPiA+ID4gKyAgICAgICAgICAgICByZXR1cm4gLUVST0ZTOwo+ID4gPiA+Cj4gPiA+ID4gSXNu
J3QgdGhpcyByZWR1bmRhbnQgd2l0aCBtbnRfd2FudF93cml0ZV9maWxlKCk/Cj4gPiA+ID4KPiA+
ID4gPiBBbHNvLCBzaG91bGRuJ3Qgd3JpdGUgYWNjZXNzIHRvIHRoZSBmaWxlIGJlIHJlcXVpcmVk
LCBpLmUuCj4gPiA+ID4gKGZpbHAtPmZfbW9kZSAmIEZNT0RFX1dSSVRFKT8gIFRoZW4gdGhlIGYy
ZnNfcmVhZG9ubHkoKSBhbmQKPiA+ID4gPiBtbnRfd2FudF93cml0ZV9maWxlKCkgY2hlY2tzIHdv
dWxkIGJlIHVubmVjZXNzYXJ5Lgo+ID4gPiA+Cj4gPiA+Cj4gPiA+IFVzaW5nIEZNT0RFX1dSSVRF
IGlzIG1vcmUgcHJvcGVyIGZvciB0aGlzIGNhc2UsIHNpbmNlIHdlJ3JlIGdvaW5nIHRvCj4gPiA+
IG1vZGlmeSB0aGUgZGF0YS4gQnV0IEkgdGhpbmsgbW50X3dhbnRfd3JpdGVfZmlsZSgpIGlzIHN0
aWxsIHJlcXVpcmVkCj4gPiA+IHRvIHByZXZlbnQgdGhlIGZpbGVzeXN0ZW0gZnJvbSBmcmVlemlu
ZyBvciBzb21ldGhpbmcgZWxzZS4KPiA+Cj4gPiBSaWdodCwgdGhlIGZyZWV6aW5nIGNoZWNrIGlz
IGFjdHVhbGx5IHN0aWxsIG5lY2Vzc2FyeS4gIEJ1dCBnZXR0aW5nIHdyaXRlIGFjY2Vzcwo+ID4g
dG8gdGhlIG1vdW50IGlzIG5vdCBuZWNlc3NhcnkuICBJIHRoaW5rIHlvdSBzaG91bGQgdXNlIGZp
bGVfc3RhcnRfd3JpdGUoKSBhbmQKPiA+IGZpbGVfZW5kX3dyaXRlKCksIGxpa2UgdmZzX3dyaXRl
KCkgZG9lcy4KCkkndmUgY2hlY2tlZCB0aGlzIGFnYWluLgoKQnV0IEkgdGhpbmsgbW50X3dhbnRf
d3JpdGVfZmlsZSgpIGxvb2tzIGJldHRlciB0aGFuIHRoZSBjb21iaW5hdGlvbiBvZgpjaGVja2lu
ZyBGTU9ERV9XUklURSBhbmQgZmlsZV9zdGFydF93cml0ZSgpLCBiZWNhdXNlCm1udF93YW50X3dy
aXRlX2ZpbGUoKSBoYW5kbGVzIGFsbCB0aGUgdGhpbmdzIHdlIG5lZWQuCkl0IGNoZWNrcyBGTU9E
RV9XUklURVIsIHdoaWNoIGlzIHNldCBpbiBkb19kZW50cnlfb3BlbigpIHdoZW4KRk1PREVfV1JJ
VEUgaXMgYWxyZWFkeSBzZXQsIGFuZCBkb2VzIHRoZSBzdHVmZiB0aGF0IGZpbGVfc3RhcnRfd3Jp
dGUoKQppcyBkb2luZy4gVGhpcyBpcyB3aHkgdGhlIG90aGVyIGZpbGVzeXN0ZW0gc3lzdGVtIGNh
bGxzIHVzZSBpdC4KCldoYXQgZG8geW91IHRoaW5rPwoKMjAyMOuFhCA27JuUIDEw7J28ICjsiJgp
IOyYpO2bhCAxMjo1NSwgRGFlaG8gSmVvbmcgPGRhZWhvNDNAZ21haWwuY29tPuuLmOydtCDsnpHs
hLE6Cj4KPiA+ID4KPiA+ID4gVG8gcHJldmVudCB0aGUgZmlsZSBkYXRhIGZyb20gZ2FyYmFnZSBj
b2xsZWN0aW5nLCB0aGUgdXNlciBuZWVkcyB0bwo+ID4gPiB1c2UgcGluZmlsZSBpb2N0bCBhbmQg
ZmFsbG9jYXRlIHN5c3RlbSBjYWxsIGFmdGVyIGNyZWF0aW5nIHRoZSBmaWxlLgo+ID4gPiBUaGUg
c2VxdWVuY2UgaXMgbGlrZSBiZWxvdy4KPiA+ID4gMS4gY3JlYXRlIGFuIGVtcHR5IGZpbGUKPiA+
ID4gMi4gcGluZmlsZQo+ID4gPiAzLiBmYWxsb2NhdGUoKQo+ID4KPiA+IElzIHRoYXQgcGVyc2lz
dGVudD8gIFNvIHRoZSBmaWxlIHdpbGwgbmV2ZXIgYmUgbW92ZWQgYWZ0ZXJ3YXJkcz8KPiA+Cj4g
PiBJcyB0aGVyZSBhIHBsYWNlIHdoZXJlIHRoaXMgaXMgKG9yIHNob3VsZCBiZSkgZG9jdW1lbnRl
ZD8KPgo+IFllcywgdGhpcyBpcyBwZXJzaXN0ZW50LiBGMkZTX0lPQ19TRVRfUElOX0ZJTEUgaW9j
dGwgaXMgdG8gcHJldmVudAo+IGZpbGUgZGF0YSBmcm9tIG1vdmluZyBhbmQgYmVpbmcgZ2FyYmFn
ZSBjb2xsZWN0ZWQsIGFuZCBmdXJ0aGVyIHVwZGF0ZQo+IHRvIHRoZSBmaWxlIHdpbGwgYmUgaGFu
ZGxlZCBpbiBpbi1wbGFjZSB1cGRhdGUgbWFubmVyLgo+IEkgZG9uJ3Qgc2VlIGFueSBkb2N1bWVu
dCBvbiB0aGlzLCBidXQgeW91IGNhbiBmaW5kIHRoZSBiZWxvdyBpbgo+IERvY3VtZW50YXRpb24v
ZmlsZXN5c3RlbXMvZjJmcy5yc3QKPgo+IEhvd2V2ZXIsIG9uY2UgRjJGUyByZWNlaXZlcyBpb2N0
bChmZCwgRjJGU19JT0NfU0VUX1BJTl9GSUxFKSBpbiBwcmlvciB0bwo+IGZhbGxvY2F0ZShmZCwg
REVGQVVMVF9NT0RFKSwgaXQgYWxsb2NhdGVzIG9uLWRpc2sgYmxvY2tzIGFkZHJlc3NlcyBoYXZp
bmcKPiB6ZXJvIG9yIHJhbmRvbSBkYXRhLCB3aGljaCBpcyB1c2VmdWwgdG8gdGhlIGJlbG93IHNj
ZW5hcmlvIHdoZXJlOgo+Cj4gIDEuIGNyZWF0ZShmZCkKPiAgMi4gaW9jdGwoZmQsIEYyRlNfSU9D
X1NFVF9QSU5fRklMRSkKPiAgMy4gZmFsbG9jYXRlKGZkLCAwLCAwLCBzaXplKQo+ICA0LiBhZGRy
ZXNzID0gZmlibWFwKGZkLCBvZmZzZXQpCj4gIDUuIG9wZW4oYmxrZGV2KQo+ICA2LiB3cml0ZShi
bGtkZXYsIGFkZHJlc3MpCj4KPiA+IFJpZ2h0LCB0aGUgZnJlZXppbmcgY2hlY2sgaXMgYWN0dWFs
bHkgc3RpbGwgbmVjZXNzYXJ5LiAgQnV0IGdldHRpbmcgd3JpdGUgYWNjZXNzCj4gPiB0byB0aGUg
bW91bnQgaXMgbm90IG5lY2Vzc2FyeS4gIEkgdGhpbmsgeW91IHNob3VsZCB1c2UgZmlsZV9zdGFy
dF93cml0ZSgpIGFuZAo+ID4gZmlsZV9lbmRfd3JpdGUoKSwgbGlrZSB2ZnNfd3JpdGUoKSBkb2Vz
Lgo+Cj4gWWVzLCBhZ3JlZWQuCj4KPiAyMDIw64WEIDbsm5QgMTDsnbwgKOyImCkg7Jik7ZuEIDEy
OjE1LCBFcmljIEJpZ2dlcnMgPGViaWdnZXJzQGtlcm5lbC5vcmc+64uY7J20IOyekeyEsToKPiA+
Cj4gPiBPbiBXZWQsIEp1biAxMCwgMjAyMCBhdCAxMTowNTo0NkFNICswOTAwLCBEYWVobyBKZW9u
ZyB3cm90ZToKPiA+ID4gPiA+IEFkZGVkIGEgbmV3IGlvY3RsIHRvIHNlbmQgZGlzY2FyZCBjb21t
YW5kcyBvci9hbmQgemVybyBvdXQKPiA+ID4gPiA+IHRvIHdob2xlIGRhdGEgYXJlYSBvZiBhIHJl
Z3VsYXIgZmlsZSBmb3Igc2VjdXJpdHkgcmVhc29uLgo+ID4gPiA+Cj4gPiA+ID4gV2l0aCB0aGlz
IGlvY3RsIGF2YWlsYWJsZSwgd2hhdCBpcyB0aGUgZXhhY3QgcHJvY2VkdXJlIHRvIHdyaXRlIGFu
ZCB0aGVuIGxhdGVyCj4gPiA+ID4gc2VjdXJlbHkgZXJhc2UgYSBmaWxlIG9uIGYyZnM/ICBJbiBw
YXJ0aWN1bGFyLCBob3cgY2FuIHRoZSB1c2VyIHByZXZlbnQgZjJmcwo+ID4gPiA+IGZyb20gbWFr
aW5nIG11bHRpcGxlIGNvcGllcyBvZiBmaWxlIGRhdGEgYmxvY2tzIGFzIHBhcnQgb2YgZ2FyYmFn
ZSBjb2xsZWN0aW9uPwo+ID4gPiA+Cj4gPiA+Cj4gPiA+IFRvIHByZXZlbnQgdGhlIGZpbGUgZGF0
YSBmcm9tIGdhcmJhZ2UgY29sbGVjdGluZywgdGhlIHVzZXIgbmVlZHMgdG8KPiA+ID4gdXNlIHBp
bmZpbGUgaW9jdGwgYW5kIGZhbGxvY2F0ZSBzeXN0ZW0gY2FsbCBhZnRlciBjcmVhdGluZyB0aGUg
ZmlsZS4KPiA+ID4gVGhlIHNlcXVlbmNlIGlzIGxpa2UgYmVsb3cuCj4gPiA+IDEuIGNyZWF0ZSBh
biBlbXB0eSBmaWxlCj4gPiA+IDIuIHBpbmZpbGUKPiA+ID4gMy4gZmFsbG9jYXRlKCkKPiA+Cj4g
PiBJcyB0aGF0IHBlcnNpc3RlbnQ/ICBTbyB0aGUgZmlsZSB3aWxsIG5ldmVyIGJlIG1vdmVkIGFm
dGVyd2FyZHM/Cj4gPgo+ID4gSXMgdGhlcmUgYSBwbGFjZSB3aGVyZSB0aGlzIGlzIChvciBzaG91
bGQgYmUpIGRvY3VtZW50ZWQ/Cj4gPgo+ID4gPiA+ID4gKwo+ID4gPiA+ID4gKyAgICAgaWYgKGYy
ZnNfcmVhZG9ubHkoc2JpLT5zYikpCj4gPiA+ID4gPiArICAgICAgICAgICAgIHJldHVybiAtRVJP
RlM7Cj4gPiA+ID4KPiA+ID4gPiBJc24ndCB0aGlzIHJlZHVuZGFudCB3aXRoIG1udF93YW50X3dy
aXRlX2ZpbGUoKT8KPiA+ID4gPgo+ID4gPiA+IEFsc28sIHNob3VsZG4ndCB3cml0ZSBhY2Nlc3Mg
dG8gdGhlIGZpbGUgYmUgcmVxdWlyZWQsIGkuZS4KPiA+ID4gPiAoZmlscC0+Zl9tb2RlICYgRk1P
REVfV1JJVEUpPyAgVGhlbiB0aGUgZjJmc19yZWFkb25seSgpIGFuZAo+ID4gPiA+IG1udF93YW50
X3dyaXRlX2ZpbGUoKSBjaGVja3Mgd291bGQgYmUgdW5uZWNlc3NhcnkuCj4gPiA+ID4KPiA+ID4K
PiA+ID4gVXNpbmcgRk1PREVfV1JJVEUgaXMgbW9yZSBwcm9wZXIgZm9yIHRoaXMgY2FzZSwgc2lu
Y2Ugd2UncmUgZ29pbmcgdG8KPiA+ID4gbW9kaWZ5IHRoZSBkYXRhLiBCdXQgSSB0aGluayBtbnRf
d2FudF93cml0ZV9maWxlKCkgaXMgc3RpbGwgcmVxdWlyZWQKPiA+ID4gdG8gcHJldmVudCB0aGUg
ZmlsZXN5c3RlbSBmcm9tIGZyZWV6aW5nIG9yIHNvbWV0aGluZyBlbHNlLgo+ID4KPiA+IFJpZ2h0
LCB0aGUgZnJlZXppbmcgY2hlY2sgaXMgYWN0dWFsbHkgc3RpbGwgbmVjZXNzYXJ5LiAgQnV0IGdl
dHRpbmcgd3JpdGUgYWNjZXNzCj4gPiB0byB0aGUgbW91bnQgaXMgbm90IG5lY2Vzc2FyeS4gIEkg
dGhpbmsgeW91IHNob3VsZCB1c2UgZmlsZV9zdGFydF93cml0ZSgpIGFuZAo+ID4gZmlsZV9lbmRf
d3JpdGUoKSwgbGlrZSB2ZnNfd3JpdGUoKSBkb2VzLgo+ID4KPiA+ID4gPgo+ID4gPiA+ID4gKwo+
ID4gPiA+ID4gKyAgICAgaWYgKGdldF91c2VyKGZsYWdzLCAodTMyIF9fdXNlciAqKWFyZykpCj4g
PiA+ID4gPiArICAgICAgICAgICAgIHJldHVybiAtRUZBVUxUOwo+ID4gPiA+ID4gKyAgICAgaWYg
KCEoZmxhZ3MgJiBGMkZTX1RSSU1fRklMRV9NQVNLKSkKPiA+ID4gPiA+ICsgICAgICAgICAgICAg
cmV0dXJuIC1FSU5WQUw7Cj4gPiA+ID4KPiA+ID4gPiBOZWVkIHRvIHJlamVjdCB1bmtub3duIGZs
YWdzOgo+ID4gPiA+Cj4gPiA+ID4gICAgICAgICBpZiAoZmxhZ3MgJiB+RjJGU19UUklNX0ZJTEVf
TUFTSykKPiA+ID4gPiAgICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7Cj4gPiA+Cj4gPiA+
IEkgbmVlZGVkIGEgZGlmZmVyZW50IHRoaW5nIGhlcmUuIFRoaXMgd2FzIHRvIGNoZWNrIG5laXRo
ZXIgZGlzY2FyZCBub3IKPiA+ID4gemVyb2luZyBvdXQgYXJlIG5vdCBoZXJlLiBCdXQgd2Ugc3Rp
bGwgbmVlZCB0byBjaGVjayB1bmtub3duIGZsYWdzLAo+ID4gPiB0b28uCj4gPiA+IFRoZSBiZWxv
dyBtaWdodCBiZSBiZXR0ZXIuCj4gPiA+IGlmICghZmxhZ3MgfHwgZmxhZ3MgJiB+RjJGU19UUklN
X0ZJTEVfTUFTSykKPiA+ID4gICAgICAgIHJldHVybiAtRUlOVkFMOwo+ID4KPiA+IFN1cmUsIGJ1
dCBwbGVhc2UgcHV0IHBhcmVudGhlc2VzIGFyb3VuZCB0aGUgc2Vjb25kIGNsYXVzZToKPiA+Cj4g
PiAgICAgICAgIGlmIChmbGFncyA9PSAwIHx8IChmbGFncyAmIH5GMkZTX1RSSU1fRklMRV9NQVNL
KSkKPiA+ICAgICAgICAgICAgICAgICByZXR1cm4gLUVJTlZBTDsKPiA+Cj4gPiAtIEVyaWMKCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCg==
