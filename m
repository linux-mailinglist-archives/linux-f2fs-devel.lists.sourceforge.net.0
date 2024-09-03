Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3A4296A501
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2024 19:07:28 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slWzy-0001uf-DY;
	Tue, 03 Sep 2024 17:07:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1slWzx-0001uW-45
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 17:07:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Cc:To:
 Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZmRrBdk0YyoahIQU+4VJgU7fDaRp5Sd7lIsYquyayUs=; b=Rl8Mqm4KmOGc4QVMA58hy30Ar8
 TzOnpvcZrfgIeFfUJ1kFaos43t2aAw/n7RaWlLVUOvtF/ZOmp/DTG8N92eTbOjm0896LwCLw+/BX1
 cEHwoc/r74cWdF4SQyOzwk+nnsDIFag4iJ+2W7tVXZg3Jj9EZRZbQ/FChd7i5pdeH1RA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Cc:To:Subject:Message-ID:Date:From
 :In-Reply-To:References:MIME-Version:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZmRrBdk0YyoahIQU+4VJgU7fDaRp5Sd7lIsYquyayUs=; b=BCgbf0GHIlMtyTF7upbJvd+Xmg
 qZyYZEPtFnATVHcE3TBx7ZDpd4HaoJdr97+iiTMI1lp9068g9sxDua/DAdMRLSKEwa+MeAHeiq/jw
 6o4XBLLNAndxOv073l630IdZz5DWAKae2btdQcF4XjB4TmvsYzgtSR+RKM1ojR2vDdKs=;
Received: from mail-ot1-f41.google.com ([209.85.210.41])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1slWzv-0004rA-Pa for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 17:07:20 +0000
Received: by mail-ot1-f41.google.com with SMTP id
 46e09a7af769-7094641d4e6so2072315a34.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 03 Sep 2024 10:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725383234; x=1725988034; darn=lists.sourceforge.net;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZmRrBdk0YyoahIQU+4VJgU7fDaRp5Sd7lIsYquyayUs=;
 b=l0nzacEpPTgpR4d0c3zCtQYWu9ODQqWG7CFhdljykx/nCak3kWQPd9BHpiu3HtBn/T
 KwvF5MzLLrrX10FDWOosUGFTzZVMuY+BXNx7QmIo3fxukAZK+o6OYVayYMcIQdrDjnBR
 a33z++YP9UeSupwz+Zou6si6g/JsMI62XewJMmqYPkviRgSR/9dfiRnB5reSqRt13rbv
 UGOISo5EDoKqVLjE29aalhO9MTb0xsOAMvgUYQsAbcXJmkSnOP28Arb3y2TR5JlzG8PU
 KvYUTRHCk2eH9yThE6s5qPC1WytHRod8kSaETYo4MJl2lZ1FCu8F8ARH1TUoMv6T2vmk
 ACHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725383234; x=1725988034;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZmRrBdk0YyoahIQU+4VJgU7fDaRp5Sd7lIsYquyayUs=;
 b=o9Ghi538oHkVfPIUiAaDwY33kPaknyljFzXqT+Z9RYGLiAfYmTi7G6C9rKLokDEZKJ
 Pjxh7nXm0q6hvw4lrIabkan8C9Hhpyoe39c/0pNnT5+16XDSYKSeE4bVRYx/XOpYQjME
 RrthejGyILagP7UySkyfzPKZ8I0/cUH0hpng58+k/98JeOqTg3XnobYAoYZy7IWRHUUF
 rUKK0u8dlysjaG9mwYEoQEsBm4miq/xAYRSadDOhr+JcusLgostU+ST0IjCsBLBq+Cqs
 geg7+dlUikW+sL5KKSifea7TnSRm6UCWb5iEAGniTcpwJTts22mq7RhV+svipKNqsAyO
 gLlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQbiiCxydXzb140daq1YjDPL+WYdhTk5KJql/BlZVzgGh48KlnECpsuBzRpextj6TLnKTq0gw8vMQmqLjQXhwI@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyY+DK8qPXj6DC38aYPlPDq8X5RFcOyjZfIhxwB3kI6uZ2KeeTS
 B5idg6bDSIdU0cniE6WYswq0LQwlxzD/czJQwCXhLXDpzPuH5i+VRZwVem+rtZAb1ED7Czbsg3r
 T9VfFTOlyy4NU0RFNMx85bRfF/Lc=
X-Google-Smtp-Source: AGHT+IGtQP6rYLYrnyeSqFZBp/F2I6FKttWBIQHRzg4h2pTNZPirp68TFtEoomZJkK4/ytsYL0bsc5Q1ACp0ApSgjhA=
X-Received: by 2002:a05:6808:190c:b0:3de:16f1:7653 with SMTP id
 5614622812f47-3df1d643e3dmr14213686b6e.25.1725383234001; Tue, 03 Sep 2024
 10:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240826202352.2150294-1-daeho43@gmail.com>
 <45a8a9f3-27b8-433e-a0ac-e457f4cdf1eb@kernel.org>
In-Reply-To: <45a8a9f3-27b8-433e-a0ac-e457f4cdf1eb@kernel.org>
From: Daeho Jeong <daeho43@gmail.com>
Date: Tue, 3 Sep 2024 10:07:03 -0700
Message-ID: <CACOAw_xMipooJy3GrZTc2CSpMoSs9FsErdxjqMWXVQ6iDiEZ0Q@mail.gmail.com>
To: Chao Yu <chao@kernel.org>
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software, running on the system "util-spamd-2.v13.lw.sourceforge.com",
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 
 Content preview:  On Mon, Sep 2, 2024 at 3:08 AM Chao Yu wrote: > > On 2024/8/27
    4:23, Daeho Jeong wrote: > > From: Daeho Jeong > > > > Keep atomic file clean
    while updating and make it dirtied during commit > > [...] 
 
 Content analysis details:   (0.0 points, 6.0 required)
 
  pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
                              no trust
                             [209.85.210.41 listed in list.dnswl.org]
  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
                             in digit
                             [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
  0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
                             provider
                             [daeho43[at]gmail.com]
  0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
  0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
                             [209.85.210.41 listed in wl.mailspike.net]
  0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
                             valid
 -0.1 DKIM_VALID             Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
                             author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
                             envelope-from domain
  0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1slWzv-0004rA-Pa
Subject: Re: [f2fs-dev] [PATCH] f2fs: prevent atomic file from being dirtied
 before commit
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

T24gTW9uLCBTZXAgMiwgMjAyNCBhdCAzOjA44oCvQU0gQ2hhbyBZdSA8Y2hhb0BrZXJuZWwub3Jn
PiB3cm90ZToKPgo+IE9uIDIwMjQvOC8yNyA0OjIzLCBEYWVobyBKZW9uZyB3cm90ZToKPiA+IEZy
b206IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5jb20+Cj4gPgo+ID4gS2VlcCBhdG9t
aWMgZmlsZSBjbGVhbiB3aGlsZSB1cGRhdGluZyBhbmQgbWFrZSBpdCBkaXJ0aWVkIGR1cmluZyBj
b21taXQKPiA+IGluIG9yZGVyIHRvIGF2b2lkIHVubmVjZXNzYXJ5IGFuZCBleGNlc3NpdmUgaW5v
ZGUgdXBkYXRlcyBpbiB0aGUgcHJldmlvdXMKPiA+IGZpeC4KPiA+Cj4gPiBGaXhlczogNGJmNzgz
MjIzNDZmICgiZjJmczogbWFyayBpbm9kZSBkaXJ0eSBmb3IgRklfQVRPTUlDX0NPTU1JVFRFRCBm
bGFnIikKPiA+IFNpZ25lZC1vZmYtYnk6IERhZWhvIEplb25nIDxkYWVob2plb25nQGdvb2dsZS5j
b20+Cj4gPiAtLS0KPiA+ICAgZnMvZjJmcy9mMmZzLmggICAgfCAgMyArLS0KPiA+ICAgZnMvZjJm
cy9pbm9kZS5jICAgfCAxMCArKysrKystLS0tCj4gPiAgIGZzL2YyZnMvc2VnbWVudC5jIHwgMTAg
KysrKysrKystLQo+ID4gICAzIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDggZGVs
ZXRpb25zKC0pCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvZjJmcy5oIGIvZnMvZjJmcy9m
MmZzLmgKPiA+IGluZGV4IDQ2NWIyZmQ1MGM3MC4uNWE3ZjZmYThiNTg1IDEwMDY0NAo+ID4gLS0t
IGEvZnMvZjJmcy9mMmZzLmgKPiA+ICsrKyBiL2ZzL2YyZnMvZjJmcy5oCj4gPiBAQCAtODAxLDcg
KzgwMSw3IEBAIGVudW0gewo+ID4gICAgICAgRklfQ09NUFJFU1NfUkVMRUFTRUQsICAgLyogY29t
cHJlc3NlZCBibG9ja3Mgd2VyZSByZWxlYXNlZCAqLwo+ID4gICAgICAgRklfQUxJR05FRF9XUklU
RSwgICAgICAgLyogZW5hYmxlIGFsaWduZWQgd3JpdGUgKi8KPiA+ICAgICAgIEZJX0NPV19GSUxF
LCAgICAgICAgICAgIC8qIGluZGljYXRlIENPVyBmaWxlICovCj4gPiAtICAgICBGSV9BVE9NSUNf
Q09NTUlUVEVELCAgICAvKiBpbmRpY2F0ZSBhdG9taWMgY29tbWl0IGNvbXBsZXRlZCBleGNlcHQg
ZGlzayBzeW5jICovCj4gPiArICAgICBGSV9BVE9NSUNfRElSVElFRCwgICAgICAvKiBpbmRpY2F0
ZSBhdG9taWMgZmlsZSBpcyBkaXJ0aWVkICovCj4gPiAgICAgICBGSV9BVE9NSUNfUkVQTEFDRSwg
ICAgICAvKiBpbmRpY2F0ZSBhdG9taWMgcmVwbGFjZSAqLwo+ID4gICAgICAgRklfT1BFTkVEX0ZJ
TEUsICAgICAgICAgLyogaW5kaWNhdGUgZmlsZSBoYXMgYmVlbiBvcGVuZWQgKi8KPiA+ICAgICAg
IEZJX01BWCwgICAgICAgICAgICAgICAgIC8qIG1heCBmbGFnLCBuZXZlciBiZSB1c2VkICovCj4g
PiBAQCAtMzA0Miw3ICszMDQyLDYgQEAgc3RhdGljIGlubGluZSB2b2lkIF9fbWFya19pbm9kZV9k
aXJ0eV9mbGFnKHN0cnVjdCBpbm9kZSAqaW5vZGUsCj4gPiAgICAgICBjYXNlIEZJX0lOTElORV9E
T1RTOgo+ID4gICAgICAgY2FzZSBGSV9QSU5fRklMRToKPiA+ICAgICAgIGNhc2UgRklfQ09NUFJF
U1NfUkVMRUFTRUQ6Cj4gPiAtICAgICBjYXNlIEZJX0FUT01JQ19DT01NSVRURUQ6Cj4gPiAgICAg
ICAgICAgICAgIGYyZnNfbWFya19pbm9kZV9kaXJ0eV9zeW5jKGlub2RlLCB0cnVlKTsKPiA+ICAg
ICAgIH0KPiA+ICAgfQo+ID4gZGlmZiAtLWdpdCBhL2ZzL2YyZnMvaW5vZGUuYyBiL2ZzL2YyZnMv
aW5vZGUuYwo+ID4gaW5kZXggMWViMjUwYzZiMzkyLi41ZGQzZTU1ZDJiZTIgMTAwNjQ0Cj4gPiAt
LS0gYS9mcy9mMmZzL2lub2RlLmMKPiA+ICsrKyBiL2ZzL2YyZnMvaW5vZGUuYwo+ID4gQEAgLTM1
LDYgKzM1LDExIEBAIHZvaWQgZjJmc19tYXJrX2lub2RlX2RpcnR5X3N5bmMoc3RydWN0IGlub2Rl
ICppbm9kZSwgYm9vbCBzeW5jKQo+ID4gICAgICAgaWYgKGYyZnNfaW5vZGVfZGlydGllZChpbm9k
ZSwgc3luYykpCj4KPiBJdCB3aWxsIHJldHVybiBkaXJlY3RseSBoZXJlIGlmIGlub2RlIHdhcyBk
aXJ0aWVkLCBzbyBpdCBtYXkgbWlzc2VkIHRvIHNldAo+IEZJX0FUT01JQ19ESVJUSUVEIGZsYWc/
CgpJcyBpdCBwb3NzaWJsZSBmb3IgaXQgdG8gYmUgYWxyZWFkeSBkaXJ0eSwgc2luY2Ugd2UgYWxy
ZWFkeSBtYWRlIGl0CmNsZWFuIHdpdGggZjJmc193cml0ZV9pbm9kZSgpIHdoZW4gd2Ugc3RhcnRl
ZCB0aGUgYXRvbWljIHdyaXRlPwoKPgo+IFRoYW5rcywKPgo+ID4gICAgICAgICAgICAgICByZXR1
cm47Cj4gPgo+ID4gKyAgICAgaWYgKGYyZnNfaXNfYXRvbWljX2ZpbGUoaW5vZGUpKSB7Cj4gPiAr
ICAgICAgICAgICAgIHNldF9pbm9kZV9mbGFnKGlub2RlLCBGSV9BVE9NSUNfRElSVElFRCk7Cj4g
PiArICAgICAgICAgICAgIHJldHVybjsKPiA+ICsgICAgIH0KPiA+ICsKPiA+ICAgICAgIG1hcmtf
aW5vZGVfZGlydHlfc3luYyhpbm9kZSk7Cj4gPiAgIH0KPiA+Cj4gPiBAQCAtNjUzLDEwICs2NTgs
NyBAQCB2b2lkIGYyZnNfdXBkYXRlX2lub2RlKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVjdCBw
YWdlICpub2RlX3BhZ2UpCj4gPiAgICAgICByaS0+aV9naWQgPSBjcHVfdG9fbGUzMihpX2dpZF9y
ZWFkKGlub2RlKSk7Cj4gPiAgICAgICByaS0+aV9saW5rcyA9IGNwdV90b19sZTMyKGlub2RlLT5p
X25saW5rKTsKPiA+ICAgICAgIHJpLT5pX2Jsb2NrcyA9IGNwdV90b19sZTY0KFNFQ1RPUl9UT19C
TE9DSyhpbm9kZS0+aV9ibG9ja3MpICsgMSk7Cj4gPiAtCj4gPiAtICAgICBpZiAoIWYyZnNfaXNf
YXRvbWljX2ZpbGUoaW5vZGUpIHx8Cj4gPiAtICAgICAgICAgICAgICAgICAgICAgaXNfaW5vZGVf
ZmxhZ19zZXQoaW5vZGUsIEZJX0FUT01JQ19DT01NSVRURUQpKQo+ID4gLSAgICAgICAgICAgICBy
aS0+aV9zaXplID0gY3B1X3RvX2xlNjQoaV9zaXplX3JlYWQoaW5vZGUpKTsKPiA+ICsgICAgIHJp
LT5pX3NpemUgPSBjcHVfdG9fbGU2NChpX3NpemVfcmVhZChpbm9kZSkpOwo+ID4KPiA+ICAgICAg
IGlmIChldCkgewo+ID4gICAgICAgICAgICAgICByZWFkX2xvY2soJmV0LT5sb2NrKTsKPiA+IGRp
ZmYgLS1naXQgYS9mcy9mMmZzL3NlZ21lbnQuYyBiL2ZzL2YyZnMvc2VnbWVudC5jCj4gPiBpbmRl
eCA3OGMzMTk4YTYzMDguLjJiNTM5MWIyMjlhOCAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvc2Vn
bWVudC5jCj4gPiArKysgYi9mcy9mMmZzL3NlZ21lbnQuYwo+ID4gQEAgLTE5Niw5ICsxOTYsMTIg
QEAgdm9pZCBmMmZzX2Fib3J0X2F0b21pY193cml0ZShzdHJ1Y3QgaW5vZGUgKmlub2RlLCBib29s
IGNsZWFuKQo+ID4gICAgICAgICAgICAgICB0cnVuY2F0ZV9pbm9kZV9wYWdlc19maW5hbChpbm9k
ZS0+aV9tYXBwaW5nKTsKPiA+Cj4gPiAgICAgICByZWxlYXNlX2F0b21pY193cml0ZV9jbnQoaW5v
ZGUpOwo+ID4gLSAgICAgY2xlYXJfaW5vZGVfZmxhZyhpbm9kZSwgRklfQVRPTUlDX0NPTU1JVFRF
RCk7Cj4gPiAgICAgICBjbGVhcl9pbm9kZV9mbGFnKGlub2RlLCBGSV9BVE9NSUNfUkVQTEFDRSk7
Cj4gPiAgICAgICBjbGVhcl9pbm9kZV9mbGFnKGlub2RlLCBGSV9BVE9NSUNfRklMRSk7Cj4gPiAr
ICAgICBpZiAoaXNfaW5vZGVfZmxhZ19zZXQoaW5vZGUsIEZJX0FUT01JQ19ESVJUSUVEKSkgewo+
ID4gKyAgICAgICAgICAgICBjbGVhcl9pbm9kZV9mbGFnKGlub2RlLCBGSV9BVE9NSUNfRElSVElF
RCk7Cj4gPiArICAgICAgICAgICAgIGYyZnNfbWFya19pbm9kZV9kaXJ0eV9zeW5jKGlub2RlLCB0
cnVlKTsKPiA+ICsgICAgIH0KPiA+ICAgICAgIHN0YXRfZGVjX2F0b21pY19pbm9kZShpbm9kZSk7
Cj4gPgo+ID4gICAgICAgRjJGU19JKGlub2RlKS0+YXRvbWljX3dyaXRlX3Rhc2sgPSBOVUxMOwo+
ID4gQEAgLTM2NSw3ICszNjgsMTAgQEAgc3RhdGljIGludCBfX2YyZnNfY29tbWl0X2F0b21pY193
cml0ZShzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+ID4gICAgICAgICAgICAgICBzYmktPnJldm9rZWRf
YXRvbWljX2Jsb2NrICs9IGZpLT5hdG9taWNfd3JpdGVfY250Owo+ID4gICAgICAgfSBlbHNlIHsK
PiA+ICAgICAgICAgICAgICAgc2JpLT5jb21taXR0ZWRfYXRvbWljX2Jsb2NrICs9IGZpLT5hdG9t
aWNfd3JpdGVfY250Owo+ID4gLSAgICAgICAgICAgICBzZXRfaW5vZGVfZmxhZyhpbm9kZSwgRklf
QVRPTUlDX0NPTU1JVFRFRCk7Cj4gPiArICAgICAgICAgICAgIGlmIChpc19pbm9kZV9mbGFnX3Nl
dChpbm9kZSwgRklfQVRPTUlDX0RJUlRJRUQpKSB7Cj4gPiArICAgICAgICAgICAgICAgICAgICAg
Y2xlYXJfaW5vZGVfZmxhZyhpbm9kZSwgRklfQVRPTUlDX0RJUlRJRUQpOwo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgIGYyZnNfbWFya19pbm9kZV9kaXJ0eV9zeW5jKGlub2RlLCB0cnVlKTsKPiA+
ICsgICAgICAgICAgICAgfQo+ID4gICAgICAgfQo+ID4KPiA+ICAgICAgIF9fY29tcGxldGVfcmV2
b2tlX2xpc3QoaW5vZGUsICZyZXZva2VfbGlzdCwgcmV0ID8gdHJ1ZSA6IGZhbHNlKTsKPgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LWYyZnMt
ZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0
Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMt
ZGV2ZWwK
