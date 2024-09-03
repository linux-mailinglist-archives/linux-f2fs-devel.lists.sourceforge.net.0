Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A9DC969EE5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2024 15:19:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slTRQ-0005Nf-FT;
	Tue, 03 Sep 2024 13:19:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <sunjunchao2870@gmail.com>) id 1slTRO-0005NR-GW
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 13:19:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nXLxdtE8dKy73TUb2uzwOpBR3I6kFdQEuWkttJKFH4c=; b=MrmEtHCq1yIBeyHcVJAuFFoiW5
 vxa0C+0bEfy4Vf8rI0hIphwE2W+YIpjbRG9A4K7ZtiGC2iqS6sK8ciI5uptroX6wiOFz6SR1DIz4q
 eVX2GqnCH8iwHDK8XfcjcWWqG0RpXlltYSpIF2ftPTtvMmONqnBruq+BNJHzt/uXlloI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:References:
 In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nXLxdtE8dKy73TUb2uzwOpBR3I6kFdQEuWkttJKFH4c=; b=EeNHT4JhZuAhUBw8e1GMH5mOuA
 JL8K338kmVclRcL/Yy7e7Tn0jsupDDqlBOVk7ylbnFCnYjo4VaiaPTi7nBDiIETVYFuGn/l4JaxtY
 eckUgzPHfrm8eVfrDNlDYrsMle0nNc+KMlkjgkrV4TjWjHgFJpqrjt1cI0K5RjXywcE4=;
Received: from mail-oo1-f43.google.com ([209.85.161.43])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1slTRN-0005jh-OL for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 13:19:26 +0000
Received: by mail-oo1-f43.google.com with SMTP id
 006d021491bc7-5dfa315ccf1so3147707eaf.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 03 Sep 2024 06:19:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725369555; x=1725974355; darn=lists.sourceforge.net;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
 :date:message-id:reply-to;
 bh=nXLxdtE8dKy73TUb2uzwOpBR3I6kFdQEuWkttJKFH4c=;
 b=fhRY9JcaCWyiPyGpX33XyZx3E39dfEojgieZNnpxWmNRNhYzGoHq+WCgNq32upIiKb
 DUOz2y0b/T2o/rmdMyNMtjagq+/IA4FjW2F/1zEUN6cDP3rBz+Dsur1nVGXJ1t8OJhdk
 upVS58RJ8KPFhTEgDYg+dAhrVOnG8yFlGVXpbIIEIHBlOo1phuhTKi1ofEFBRDbdq/tC
 nQlObgUBUbNuDqoJDqiXdMIKGMcR/PQ/Zmg8oWk3LKYqSDWOq/3RKKAOpy5tmA+WIPGX
 zejipUf3lrn4jZlgLWxhL7y3rMcZPljP1kv6j7FtTJ+5QNKho9HTwoMVY/4EvUIC08OD
 6vZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725369555; x=1725974355;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=nXLxdtE8dKy73TUb2uzwOpBR3I6kFdQEuWkttJKFH4c=;
 b=EgGyGWZRj2cbezQb+8sYxrnCB/6e69JDNUnd9sUxRVeKJzX0UESRASlYDZdQvpjoBr
 ZMIgYgCU06RxF/pzVKPAaM9M5GSLgqaGLxp1WkCIwiQvGDNkC3WPw4TFR6qsw3Rygins
 oco4/6WAOQntIzXx78EKukyJyU9+XSDf8/X5hc/W1obAwSIVENxWgwNn2WN+eRyqO2us
 fPD9KdWdFbg1DA7qY/4BpiqW2ta0+P715QyNzWfknmPAXmLKWbYoeE6NY+dBJg+e61ej
 0L2cQFx68YZrhvvsgmxsGIsqQBVG3MT61uCqYKf6sf/nQq6rDRkwEzxec4vR2hZXECGS
 rY8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVlUpDTrjTWxXzOI+bax7vJRT3JNZ//KLm6RFbkIewbnYaow1X3MO0S4Y6+7Gm+51vNfrm6wo/ouTdYmkpUAxi9@lists.sourceforge.net
X-Gm-Message-State: AOJu0YysFEmc6l3Jo3GmpriShqLvG1ACTtnRElwT9AWivFyymz/p12R5
 H0Gc7TZ3Q1MG4XMwHFDrllYc6PNdmCB7A2CEKTUbK1wU7r5ZALZKRtj332Qe
X-Google-Smtp-Source: AGHT+IHmqKB2ApI4jtmnVOIKPHAaEfmCOJEP0+RdE5W02PZplPzBvvvrHQ15gjBnd/lnsJzhYx3fSg==
X-Received: by 2002:a05:6358:528a:b0:1b8:15fd:49f6 with SMTP id
 e5c5f4694b2df-1b815fd4c10mr151831555d.27.1725369554677; 
 Tue, 03 Sep 2024 06:19:14 -0700 (PDT)
Received: from [127.0.0.1] ([191.96.241.67]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7d22e9be21bsm7983314a12.74.2024.09.03.06.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Sep 2024 06:19:14 -0700 (PDT)
Message-ID: <db89aa34ab0068581ecb103b3aea0d484d8534bc.camel@gmail.com>
From: Julian Sun <sunjunchao2870@gmail.com>
To: Chao Yu <chao@kernel.org>, linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 03 Sep 2024 21:19:10 +0800
In-Reply-To: <0f1e5069-7ff0-4d5f-8a3a-3806c8d21487@kernel.org>
References: <20240828165425.324845-1-sunjunchao2870@gmail.com>
 <0f1e5069-7ff0-4d5f-8a3a-3806c8d21487@kernel.org>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, 2024-09-02 at 16:13 +0800,
 Chao Yu wrote: > On 2024/8/29
 0:54, Julian Sun wrote: > > Hi, all. > > > > Recently syzbot reported a bug
 as following: > > > > kernel BUG at fs/f2fs/inode.c:896! > [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [sunjunchao2870[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [sunjunchao2870[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.161.43 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.161.43 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1slTRN-0005jh-OL
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: Do not check the FI_DIRTY_INODE
 flag when umounting a ro fs.
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
Cc: jaegeuk@kernel.org, syzbot+ebea2790904673d7c618@syzkaller.appspotmail.com,
 stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gTW9uLCAyMDI0LTA5LTAyIGF0IDE2OjEzICswODAwLCBDaGFvIFl1IHdyb3RlOgo+IE9uIDIw
MjQvOC8yOSAwOjU0LCBKdWxpYW4gU3VuIHdyb3RlOgo+ID4gSGksIGFsbC4KPiA+IAo+ID4gUmVj
ZW50bHkgc3l6Ym90IHJlcG9ydGVkIGEgYnVnIGFzIGZvbGxvd2luZzoKPiA+IAo+ID4ga2VybmVs
IEJVRyBhdCBmcy9mMmZzL2lub2RlLmM6ODk2IQo+ID4gQ1BVOiAxIFVJRDogMCBQSUQ6IDUyMTcg
Q29tbTogc3l6LWV4ZWN1dG9yNjA1IE5vdCB0YWludGVkIDYuMTEuMC0KPiA+IHJjNC1zeXprYWxs
ZXItMDAwMzMtZzg3MmNmMjhiOGRmOSAjMAo+ID4gUklQOiAwMDEwOmYyZnNfZXZpY3RfaW5vZGUr
MHgxNTk4LzB4MTVjMCBmcy9mMmZzL2lub2RlLmM6ODk2Cj4gPiBDYWxsIFRyYWNlOgo+ID4gwqAg
PFRBU0s+Cj4gPiDCoCBldmljdCsweDUzMi8weDk1MCBmcy9pbm9kZS5jOjcwNAo+ID4gwqAgZGlz
cG9zZV9saXN0IGZzL2lub2RlLmM6NzQ3IFtpbmxpbmVdCj4gPiDCoCBldmljdF9pbm9kZXMrMHg1
ZjkvMHg2OTAgZnMvaW5vZGUuYzo3OTcKPiA+IMKgIGdlbmVyaWNfc2h1dGRvd25fc3VwZXIrMHg5
ZC8weDJkMCBmcy9zdXBlci5jOjYyNwo+ID4gwqAga2lsbF9ibG9ja19zdXBlcisweDQ0LzB4OTAg
ZnMvc3VwZXIuYzoxNjk2Cj4gPiDCoCBraWxsX2YyZnNfc3VwZXIrMHgzNDQvMHg2OTAgZnMvZjJm
cy9zdXBlci5jOjQ4OTgKPiA+IMKgIGRlYWN0aXZhdGVfbG9ja2VkX3N1cGVyKzB4YzQvMHgxMzAg
ZnMvc3VwZXIuYzo0NzMKPiA+IMKgIGNsZWFudXBfbW50KzB4NDFmLzB4NGIwIGZzL25hbWVzcGFj
ZS5jOjEzNzMKPiA+IMKgIHRhc2tfd29ya19ydW4rMHgyNGYvMHgzMTAga2VybmVsL3Rhc2tfd29y
ay5jOjIyOAo+ID4gwqAgcHRyYWNlX25vdGlmeSsweDJkMi8weDM4MCBrZXJuZWwvc2lnbmFsLmM6
MjQwMgo+ID4gwqAgcHRyYWNlX3JlcG9ydF9zeXNjYWxsIGluY2x1ZGUvbGludXgvcHRyYWNlLmg6
NDE1IFtpbmxpbmVdCj4gPiDCoCBwdHJhY2VfcmVwb3J0X3N5c2NhbGxfZXhpdCBpbmNsdWRlL2xp
bnV4L3B0cmFjZS5oOjQ3NyBbaW5saW5lXQo+ID4gwqAgc3lzY2FsbF9leGl0X3dvcmsrMHhjNi8w
eDE5MCBrZXJuZWwvZW50cnkvY29tbW9uLmM6MTczCj4gPiDCoCBzeXNjYWxsX2V4aXRfdG9fdXNl
cl9tb2RlX3ByZXBhcmUga2VybmVsL2VudHJ5L2NvbW1vbi5jOjIwMAo+ID4gW2lubGluZV0KPiA+
IMKgIF9fc3lzY2FsbF9leGl0X3RvX3VzZXJfbW9kZV93b3JrIGtlcm5lbC9lbnRyeS9jb21tb24u
YzoyMDUKPiA+IFtpbmxpbmVdCj4gPiDCoCBzeXNjYWxsX2V4aXRfdG9fdXNlcl9tb2RlKzB4Mjc5
LzB4MzcwIGtlcm5lbC9lbnRyeS9jb21tb24uYzoyMTgKPiA+IMKgIGRvX3N5c2NhbGxfNjQrMHgx
MDAvMHgyMzAgYXJjaC94ODYvZW50cnkvY29tbW9uLmM6ODkKPiA+IMKgIGVudHJ5X1NZU0NBTExf
NjRfYWZ0ZXJfaHdmcmFtZSsweDc3LzB4N2YKPiA+IAo+ID4gVGhlIHN5emJvdCBjb25zdHJ1Y3Rl
ZCB0aGUgZm9sbG93aW5nIHNjZW5hcmlvOiBjb25jdXJyZW50bHkKPiA+IGNyZWF0aW5nIGRpcmVj
dG9yaWVzIGFuZCBzZXR0aW5nIHRoZSBmaWxlIHN5c3RlbSB0byByZWFkLW9ubHkuCj4gPiBJbiB0
aGlzIGNhc2UsIHdoaWxlIGYyZnMgd2FzIG1ha2luZyBkaXIsIHRoZSBmaWxlc3lzdGVtIHN3aXRj
aGVkIHRvCj4gPiByZWFkb25seSwgYW5kIHdoZW4gaXQgdHJpZWQgdG8gY2xlYXIgdGhlIGRpcnR5
IGZsYWcsIGl0IHRyaWdnZXJlZAo+ID4gdGhpcwo+ID4gY29kZSBwYXRoOiBmMmZzX21rZGlyKCkt
PiBmMmZzX3N5bmNfZnMoKS0+ZjJmc193cml0ZV9jaGVja3BvaW50KCkKPiA+IC0+ZjJmc19yZWFk
b25seSgpLiBUaGlzIHJlc3VsdGVkIEZJX0RJUlRZX0lOT0RFIGZsYWcgbm90IGJlaW5nCj4gPiBj
bGVhcmVkLAo+ID4gd2hpY2ggZXZlbnR1YWxseSBsZWQgdG8gYSBidWcgYmVpbmcgdHJpZ2dlcmVk
IGR1cmluZyB0aGUKPiA+IEZJX0RJUlRZX0lOT0RFCj4gPiBjaGVjayBpbiBmMmZzX2V2aWN0X2lu
b2RlKCkuCj4gPiAKPiA+IEluIHRoaXMgY2FzZSwgd2UgY2Fubm90IGRvIGFueXRoaW5nIGZ1cnRo
ZXIsIHNvIGlmIGZpbGVzeXN0ZW0gaXMKPiA+IHJlYWRvbmx5LAo+ID4gZG8gbm90IHRyaWdnZXIg
dGhlIEJVRy4gSW5zdGVhZCwgY2xlYW4gdXAgcmVzb3VyY2VzIHRvIHRoZSBiZXN0IG9mCj4gPiBv
dXIKPiA+IGFiaWxpdHkgdG8gcHJldmVudCB0cmlnZ2VyaW5nIHN1YnNlcXVlbnQgcmVzb3VyY2Ug
bGVhayBjaGVja3MuCj4gPiAKPiA+IElmIHRoZXJlIGlzIGFueXRoaW5nIGltcG9ydGFudCBJJ20g
bWlzc2luZywgcGxlYXNlIGxldCBtZSBrbm93LAo+ID4gdGhhbmtzLgo+ID4gCj4gPiBSZXBvcnRl
ZC1ieTogc3l6Ym90K2ViZWEyNzkwOTA0NjczZDdjNjE4QHN5emthbGxlci5hcHBzcG90bWFpbC5j
b20KPiA+IENsb3NlczoKPiA+IGh0dHBzOi8vc3l6a2FsbGVyLmFwcHNwb3QuY29tL2J1Zz9leHRp
ZD1lYmVhMjc5MDkwNDY3M2Q3YzYxOAo+ID4gRml4ZXM6IGNhN2Q4MDJhN2Q4ZSAoImYyZnM6IGRl
dGVjdCBkaXJ0eSBpbm9kZSBpbiBldmljdF9pbm9kZSIpCj4gPiBDQzogc3RhYmxlQHZnZXIua2Vy
bmVsLm9yZwo+ID4gU2lnbmVkLW9mZi1ieTogSnVsaWFuIFN1biA8c3VuanVuY2hhbzI4NzBAZ21h
aWwuY29tPgo+ID4gLS0tCj4gPiDCoCBmcy9mMmZzL2lub2RlLmMgfCAzICsrLQo+ID4gwqAgMSBm
aWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4gCj4gPiBkaWZm
IC0tZ2l0IGEvZnMvZjJmcy9pbm9kZS5jIGIvZnMvZjJmcy9pbm9kZS5jCj4gPiBpbmRleCBhZWY1
NzE3MjAxNGYuLmViZjgyNWRiYTBhNSAxMDA2NDQKPiA+IC0tLSBhL2ZzL2YyZnMvaW5vZGUuYwo+
ID4gKysrIGIvZnMvZjJmcy9pbm9kZS5jCj4gPiBAQCAtODkyLDcgKzg5Miw4IEBAIHZvaWQgZjJm
c19ldmljdF9pbm9kZShzdHJ1Y3QgaW5vZGUgKmlub2RlKQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgYXRvbWljX3JlYWQoJmZpLT5pX2NvbXByX2Js
b2NrcykpOwo+ID4gwqAgCj4gPiDCoMKgwqDCoMKgwqDCoMKgaWYgKGxpa2VseSghZjJmc19jcF9l
cnJvcihzYmkpICYmCj4gPiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAhaXNfc2JpX2ZsYWdfc2V0KHNiaSwKPiA+IFNCSV9DUF9E
SVNBQkxFRCkpKQo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIWlzX3NiaV9mbGFnX3NldChzYmksCj4gPiBTQklfQ1BfRElT
QUJMRUQpKSAmJgo+ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIWYyZnNfcmVhZG9ubHkoc2JpLT5zYikpCj4gCj4gSXMgaXQg
ZmluZSB0byBkcm9wIHRoaXMgZGlydHkgaW5vZGU/IFNpbmNlIG9uY2UgaXQgcmVtb3VudHMgZjJm
cyBhcwo+IHJ3IG9uZSwKPiBwcmV2aW91cyB1cGRhdGVzIG9uIHN1Y2ggaW5vZGUgbWF5IGJlIGxv
c3Q/IE9yIGFtIEkgbWlzc2luZwo+IHNvbWV0aGluZz8KSGksIENoYW8uCgpJIGJlbGlldmUgdGhl
IGlzc3VlIHlvdSBwb2ludGVkIG91dCBnb2VzIGJleW9uZCB0aGUgc2NvcGUgb2YgdGhlCnByb2Js
ZW0gcmVwb3J0ZWQgYnkgc3l6Ym90LCBhcyBJIGhhdmUgc2VlbiB0aGlzIGlzc3VlIGluIHNvbWUg
ZXhpc3RpbmcKY29kZSBhcyB3ZWxsLCBzdWNoIGFzIGluIHRoZSBoYW5kbGluZyBvZiByZWFkLW9u
bHkgZmlsZSBzeXN0ZW1zIGluCmYyZnNfbWFya19pbm9kZV9kaXJ0eV9zeW5jKCksIGYyZnNfd3Jp
dGVfY2hlY2twb2ludCgpLApmMmZzX2RvX3N5bmNfZmlsZSgpLCBldGMuCgpJZiB5b3UgZG8gYmVs
aWV2ZSB0aGUgcHJvYmxlbSBuZWVkcyB0byBiZSBmaXhlZCwgd2UgY2FuIGRpc2N1c3MgaXQKZnVy
dGhlciwgYnV0IGl0IHNob3VsZCBiZSBhZGRyZXNzZWQgaW4gYSBzZXBhcmF0ZSBwYXRjaC4KCklm
IHRoZXJlIGlzIGFueXRoaW5nIGltcG9ydGFudCBJJ20gbWlzc2luZywgcGxlYXNlIGxldCBtZSBr
bm93LCB0aGFua3MuCj4gCj4gVGhhbmtzLAo+IAo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqBmMmZzX2J1Z19vbihzYmksIGlzX2lub2RlX2ZsYWdfc2V0KGlub2RlLAo+ID4gRklf
RElSVFlfSU5PREUpKTsKPiA+IMKgwqDCoMKgwqDCoMKgwqBlbHNlCj4gPiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoGYyZnNfaW5vZGVfc3luY2VkKGlub2RlKTsKPiAKClRoYW5rcywK
LS0gCkp1bGlhbiBTdW4gPHN1bmp1bmNoYW8yODcwQGdtYWlsLmNvbT4KCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxp
bmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xp
c3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
