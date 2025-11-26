Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 325CFC88E41
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Nov 2025 10:15:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vjs9D4C9aOGprmVI6mgWR8WTg+i3R1NQIq8oN+vEkoM=; b=aXY3d6HeIKURyRpEEOFLbS581f
	vI8vL78UcO6Ytg/K6fBZPf0AprDe9S1z0Gsj+78qAf+p7Fc4MLuJQMebDH0ghH1dnS4yY00UgRU3Y
	yVZ86YcxMKuUs9HiPCQvev5smACLkc+gVoHW5fwwn8SbPMFucEsDbRFL74/xsguhcRV8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vOBcL-0007LW-Tk;
	Wed, 26 Nov 2025 09:15:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vOBc6-0007LE-Ir
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Nov 2025 09:15:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FsAxxdgt6IXuSxrdWBozCg8XdMM7lBgDlsl70F68Y1Y=; b=M8wBl8B7bYsx4WJcO8ir499R/s
 VFIzG5OPYE1qNdesd+wKzuCWqplweOy0XLR8Y7SoY7zYuYfHk6F6ne4Dt7yw40cCjDKx1SdNKKNhD
 kQd4LE9Cy1OX8Y/ySFVW6YOSyxEsoSmqJYi9BjNQM0xVJpNhaDqciYxAbL+9NUV4BH0A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FsAxxdgt6IXuSxrdWBozCg8XdMM7lBgDlsl70F68Y1Y=; b=UMyWIRMOzAAtbfdhgLEiNADIG/
 UuQ6nLLnzcpl3ARhC+9D00Ih+rLuR5GGn4PVcZeloxvpba+tOt9o32QPF7g9NhbE197k9sxm/r+ah
 vTZgUNJsTJllVY3y7HspBpr+jYKhTiAYfB8c2a6u+pVyx/NtF3c3I7EFVIHiw7erYCm8=;
Received: from mail-pf1-f179.google.com ([209.85.210.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vOBc5-00011d-Nu for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Nov 2025 09:15:02 +0000
Received: by mail-pf1-f179.google.com with SMTP id
 d2e1a72fcca58-7ba49f92362so432894b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 Nov 2025 01:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764148491; x=1764753291; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FsAxxdgt6IXuSxrdWBozCg8XdMM7lBgDlsl70F68Y1Y=;
 b=DAO2wYgsEc/0NMDrPL3MVKwqTljT8qFzufua749+TmPn+e6J3xH7HbTgfhefLU/7sm
 tqy/C70YfXEKB8Fu2ZpYHY9iA/oVN4Bwp0bJ8tJUXiJsQXLwma6l3vgDiu4vqARGYbZu
 lZPqKwPfGIBCEBJTSHX46nrubf+eBlNGEUk6TiBMtP7H+fxwk64gZWlZj5zfSBEU1b3Z
 5A1neNAJXjDErbu+AXi69JwBJNLBisP/bbcAJdAzb+uDkj5AChoGx0BsLID/UcxO5DQC
 OcxtQvGLjIT4+abEi/eTVbZKt165mxO+mKOIimO3KgITRjmJZe+w433zgFP/UQcMf4bK
 vXuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764148491; x=1764753291;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FsAxxdgt6IXuSxrdWBozCg8XdMM7lBgDlsl70F68Y1Y=;
 b=Kjt+yalkhRUtdKlEedDzq0V/LjBGgduUyaP1hBQAC8yX4TXktyQhSPKxNZR2qfFUNq
 puRdq3n6JZ76jyjK4bfKFbTo5qQOWAnZsMP1nhctr8nVDGpZR7K6kgRJljuRfuMF3Qy2
 3kQkTQi7vRIIlahT9h6+xtqCFOqSKDTYp/5LnsTrBxSNlC8SUpBvOeaarH0X6Fi4Vilu
 a51UZGCp+DYe4+ZnYF8eF08LeXtDon7GOFqi4HnY3wAoLjOuFzWjAn7nUuWQvUcrRoQn
 SglqDzli03ld0kIM/YiUbhbsG8TgDP5OmI8f14NiHxaliq8kYgZMkXeWDYCVjqcISGPN
 qEJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWpRlLpiisdLCptMJFsHc/6Nc3bIgFy55V+Wfo0Y+nu4G9AZEP2jh59lp/0obM+fXssmvd7ExnjjyqcRg3mmp2y@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyTbQbfJUNsZi2/9Hn3CuQFUqvcVrq2ovYlW3pkrkfDSpM4+nzh
 CGpY2QgbeyiEctotegh0cCDhM3NExgDdhp+T4cqPDhrLlXAKOaNncWSv
X-Gm-Gg: ASbGncv7g8bi6tRtYCQ5m0yA68Pg4bhXS1xiJZK3c2ABPpNcJK+oFBCPFislkOu9yes
 yMKIsrlS5PI+rREnjdcsrhHM0qY4kyrkT1zJgyIfAEFbCcJ6ITxl+QI/xZfmWhTItbbSXwpMRuf
 JJw0hRP7hfV2d2MB1X3HehQewJh4J+TqbbXgsfn7WR2e34mNplCbRKj+EYvcgF+qcBzbrp19Ld9
 CO//i61OmTxD9eDPyEG5LuqUNU14Eu1v9DPaeRi1W97LMe/Q0nBSXxASvaNMdo0v4Indk8d0aCD
 60tHqFx6FU+Df6nCyfwWHux5x6+FmevXCWRgFdY1OSLvIpxEHXNdYbcQF+E+HC5qsHCmIXUfBai
 xnXq5Xp7GlCQfpe1z7og7xk1Hza1BPH8qHn4C2ldC84z8zxUF8L5BuIXUBThaO3a3Z1zsk5FVrt
 rmiCtri7Ldp7CtBy28RG2+FJu8zlEANw==
X-Google-Smtp-Source: AGHT+IGT8gd70TCQi63rsPWx+UIJ4mcNla5iKtS6p8pWOc51DUh5MCPHup9N3N3lGRYqyvIBZTUYDg==
X-Received: by 2002:a05:6a20:a114:b0:342:fa5:8b20 with SMTP id
 adf61e73a8af0-3614f5aec2cmr19183971637.30.1764148490926; 
 Wed, 26 Nov 2025 01:14:50 -0800 (PST)
Received: from [10.189.138.37] ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7c3ecf7d849sm20690335b3a.14.2025.11.26.01.14.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 01:14:50 -0800 (PST)
Message-ID: <2da95607-9b21-4d21-8926-9463021a6f33@gmail.com>
Date: Wed, 26 Nov 2025 17:14:44 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Chaitanya Kulkarni <chaitanyak@nvidia.com>,
 Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Chaitanya Kulkarni <ckulkarnilinux@gmail.com>,
 "axboe@kernel.dk" <axboe@kernel.dk>, "agk@redhat.com" <agk@redhat.com>,
 "snitzer@kernel.org" <snitzer@kernel.org>,
 "mpatocka@redhat.com" <mpatocka@redhat.com>,
 "song@kernel.org" <song@kernel.org>, "yukuai@fnnas.com" <yukuai@fnnas.com>,
 "hch@lst.de" <hch@lst.de>, "sagi@grimberg.me" <sagi@grimberg.me>,
 "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>, "cem@kernel.org" <cem@kernel.org>
References: <20251124234806.75216-1-ckulkarnilinux@gmail.com>
 <20251124234806.75216-7-ckulkarnilinux@gmail.com>
 <b18c489f-d6ee-4986-94be-a9aade7d3a47@gmail.com>
 <218f0cd0-61bf-4afa-afb0-a559cd085d4a@nvidia.com>
Content-Language: en-US
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
In-Reply-To: <218f0cd0-61bf-4afa-afb0-a559cd085d4a@nvidia.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/26/25 16:07, Chaitanya Kulkarni via Linux-f2fs-devel
 wrote: > On 11/25/25 18:37,
 Yongpeng Yang wrote: >>> diff --git a/fs/xfs/xfs_discard.c
 b/fs/xfs/xfs_discard.c >>> index 6917de832191..b6ffe48 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.179 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vOBc5-00011d-Nu
Subject: Re: [f2fs-dev] [PATCH V3 6/6] xfs: ignore discard return value
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
Cc: "dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTEvMjYvMjUgMTY6MDcsIENoYWl0YW55YSBLdWxrYXJuaSB2aWEgTGludXgtZjJmcy1kZXZl
bCB3cm90ZToKPiBPbiAxMS8yNS8yNSAxODozNywgWW9uZ3BlbmcgWWFuZyB3cm90ZToKPj4+IGRp
ZmYgLS1naXQgYS9mcy94ZnMveGZzX2Rpc2NhcmQuYyBiL2ZzL3hmcy94ZnNfZGlzY2FyZC5jCj4+
PiBpbmRleCA2OTE3ZGU4MzIxOTEuLmI2ZmZlNDgwN2ExMSAxMDA2NDQKPj4+IC0tLSBhL2ZzL3hm
cy94ZnNfZGlzY2FyZC5jCj4+PiArKysgYi9mcy94ZnMveGZzX2Rpc2NhcmQuYwo+Pj4gQEAgLTEw
OCw3ICsxMDgsNyBAQCB4ZnNfZGlzY2FyZF9lbmRpbygKPj4+ICDCoMKgICogbGlzdC4gV2UgcGx1
ZyBhbmQgY2hhaW4gdGhlIGJpb3Mgc28gdGhhdCB3ZSBvbmx5IG5lZWQgYSBzaW5nbGUKPj4+IGNv
bXBsZXRpb24KPj4+ICDCoMKgICogY2FsbCB0byBjbGVhciBhbGwgdGhlIGJ1c3kgZXh0ZW50cyBv
bmNlIHRoZSBkaXNjYXJkcyBhcmUgY29tcGxldGUuCj4+PiAgwqDCoCAqLwo+Pj4gLWludAo+Pj4g
K3ZvaWQKPj4+ICDCoCB4ZnNfZGlzY2FyZF9leHRlbnRzKAo+Pj4gIMKgwqDCoMKgwqAgc3RydWN0
IHhmc19tb3VudMKgwqDCoCAqbXAsCj4+PiAgwqDCoMKgwqDCoCBzdHJ1Y3QgeGZzX2J1c3lfZXh0
ZW50c8KgwqDCoCAqZXh0ZW50cykKPj4+IEBAIC0xMTYsNyArMTE2LDYgQEAgeGZzX2Rpc2NhcmRf
ZXh0ZW50cygKPj4+ICDCoMKgwqDCoMKgIHN0cnVjdCB4ZnNfZXh0ZW50X2J1c3nCoMKgwqAgKmJ1
c3lwOwo+Pj4gIMKgwqDCoMKgwqAgc3RydWN0IGJpb8KgwqDCoMKgwqDCoMKgICpiaW8gPSBOVUxM
Owo+Pj4gIMKgwqDCoMKgwqAgc3RydWN0IGJsa19wbHVnwqDCoMKgwqDCoMKgwqAgcGx1ZzsKPj4+
IC3CoMKgwqAgaW50wqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBlcnJvciA9IDA7Cj4+PiAgwqAgwqDC
oMKgwqDCoCBibGtfc3RhcnRfcGx1ZygmcGx1Zyk7Cj4+PiAgwqDCoMKgwqDCoCBsaXN0X2Zvcl9l
YWNoX2VudHJ5KGJ1c3lwLCAmZXh0ZW50cy0+ZXh0ZW50X2xpc3QsIGxpc3QpIHsKPj4+IEBAIC0x
MjYsMTggKzEyNSwxMCBAQCB4ZnNfZGlzY2FyZF9leHRlbnRzKAo+Pj4gIMKgIMKgwqDCoMKgwqDC
oMKgwqDCoCB0cmFjZV94ZnNfZGlzY2FyZF9leHRlbnQoeGcsIGJ1c3lwLT5ibm8sIGJ1c3lwLT5s
ZW5ndGgpOwo+Pj4gIMKgIC3CoMKgwqDCoMKgwqDCoCBlcnJvciA9IF9fYmxrZGV2X2lzc3VlX2Rp
c2NhcmQoYnRwLT5idF9iZGV2LAo+Pj4gK8KgwqDCoMKgwqDCoMKgIF9fYmxrZGV2X2lzc3VlX2Rp
c2NhcmQoYnRwLT5idF9iZGV2LAo+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgeGZzX2dibm9fdG9fZGFkZHIoeGcsIGJ1c3lwLT5ibm8pLAo+Pj4gIMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgWEZTX0ZTQl9UT19CQihtcCwgYnVzeXAtPmxlbmd0aCksCj4+
PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRlBfS0VSTkVMLCAmYmlvKTsK
Pj4KPj4gSWYgYmxrX2FsbG9jX2Rpc2NhcmRfYmlvKCkgZmFpbHMgdG8gYWxsb2NhdGUgYSBiaW8g
aW5zaWRlCj4+IF9fYmxrZGV2X2lzc3VlX2Rpc2NhcmQoKSwgdGhpcyBtYXkgbGVhZCB0byBhbiBp
bnZhbGlkIGxvb3AgaW4KPj4gbGlzdF9mb3JfZWFjaF9lbnRyeXt9LiBJbnN0ZWFkIG9mIHVzaW5n
IF9fYmxrZGV2X2lzc3VlX2Rpc2NhcmQoKSwgaG93Cj4+IGFib3V0IGFsbG9jYXRlIGFuZCBzdWJt
aXQgdGhlIGRpc2NhcmQgYmlvcyBleHBsaWNpdGx5IGluCj4+IGxpc3RfZm9yX2VhY2hfZW50cnl7
fT8KPj4KPj4gWW9uZ3BlbmcsCj4gCj4gCj4gQ2FsbGluZyBfX2Jsa2Rldl9pc3N1ZV9kaXNjYXJk
KCkga2VlcHMgbWFuYWdpbmcgYWxsIHRoZSBiaW8gd2l0aCB0aGUKPiBhcHByb3ByaWF0ZSBHRlAg
bWFzaywgc28gdGhlIHNlbWFudGljcyBzdGF5IHRoZSBzYW1lLiBZb3UgYXJlIGp1c3QKPiBtb3Zp
bmcgbWVtb3J5IGFsbG9jYXRpb24gdG8gdGhlIGNhbGxlciBhbmQgcG90ZW50aWFsbHkgbG9va2lu
ZyBhdAo+IGltcGxlbWVudGluZyByZXRyeSBvbiBiaW8gYWxsb2NhdGlvbiBmYWlsdXJlLgo+IAo+
IFRoZSByZXRyeSBmb3IgZGlzY2FyZCBiaW8gbWVtb3J5IGFsbG9jYXRpb24gaXMgbm90IGRlc2ly
ZWQgSSB0aGluaywKPiBzaW5jZSBpdCdzIG9ubHkgYSBoaW50IHRvIHRoZSBjb250cm9sbGVyLgoK
QWdyZWVkLiBJJ20gbm90IHRyeWluZyB0byByZXRyeSBiaW8gYWxsb2NhdGlvbiBpbnNpZGUgdGhl
Cmxpc3RfZm9yX2VhY2hfZW50cnl7fSBsb29wLiBJbnN0ZWFkLCBzaW5jZSBibGtfYWxsb2NfZGlz
Y2FyZF9iaW8oKQpyZXR1cm5pbmcgTlVMTCBjYW5ub3QgcmVsaWFibHkgaW5kaWNhdGUgd2hldGhl
ciB0aGUgZmFpbHVyZSBpcyBkdWUgdG8KYmlvIGFsbG9jYXRpb24gZmFpbHVyZSwgaXQgY291bGQg
YWxzbyBiZSBjYXVzZWQgYnkgJ2Jpb19zZWN0cyA9PSAwJywgSSdkCmxpa2UgdG8gYWxsb2NhdGUg
dGhlIGJpbyBleHBsaWNpdGx5LgoKPiAKPiBUaGlzIHBhdGNoIGlzIHNpbXBseSBjbGVhbmluZyB1
cCBkZWFkIGVycm9yLWhhbmRsaW5nIGJyYW5jaGVzIGF0IHRoZQo+IGNhbGxlcnMgbm8gYmVoYXZp
b3JhbCBjaGFuZ2VzIGludGVuZGVkLgo+IAo+IFdoYXQgbWF5YmUgdXNlZnVsIGlzIHRvIHN0b3Ag
aXRlcmF0aW5nIG9uY2Ugd2UgZmFpbCB0byBhbGxvY2F0ZSB0aGUKPiBiaW8gWzFdLgo+IAo+IC1j
awo+IAo+IFsxXSBQb3RlbnRpYWwgYWRkaXRpb24gb24gdGhlIHRvcCBvZiB0aGlzIHRvIGV4aXQg
ZWFybHkgaW4gZGlzY2FyZCBsb29wCj4gICAgICAgb24gYmlvIGFsbG9jYXRpb24gZmFpbHVyZS4K
PiAKPiBkaWZmIC0tZ2l0IGEvZnMveGZzL3hmc19kaXNjYXJkLmMgYi9mcy94ZnMveGZzX2Rpc2Nh
cmQuYwo+IGluZGV4IGI2ZmZlNDgwN2ExMS4uMTUxOWY3MDhiYjc5IDEwMDY0NAo+IC0tLSBhL2Zz
L3hmcy94ZnNfZGlzY2FyZC5jCj4gKysrIGIvZnMveGZzL3hmc19kaXNjYXJkLmMKPiBAQCAtMTI5
LDYgKzEyOSwxMyBAQCB4ZnNfZGlzY2FyZF9leHRlbnRzKAo+ICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB4ZnNfZ2Jub190b19kYWRkcih4ZywgYnVzeXAtPmJubyksCj4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIFhGU19GU0JfVE9fQkIobXAsIGJ1c3lwLT5sZW5n
dGgpLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBHRlBfS0VSTkVMLCAmYmlv
KTsKPiArICAgICAgICAgICAgICAgLyoKPiArICAgICAgICAgICAgICAgICogV2UgZmFpbGVkIHRv
IGFsbG9jYXRlIGJpbyBpbnN0ZWFkIG9mIGNvbnRpbnVpbmcgdGhlIGxvb3AKPiArICAgICAgICAg
ICAgICAgICogc28gaXQgd2lsbCBsZWFkIHRvIGluY29uc2lzdGVudCBkaXNjYXJkcyB0byB0aGUg
ZGlzawo+ICsgICAgICAgICAgICAgICAgKiBleGl0IGVhcmx5IGFuZCBqdW1wIGludG8geGZzX2Rp
c2NhcmRfYnVzeV9jbGVhcigpLgo+ICsgICAgICAgICAgICAgICAgKi8KPiArICAgICAgICAgICAg
ICAgaWYgKCFiaW8pCj4gKyAgICAgICAgICAgICAgICAgICAgICAgYnJlYWs7CgpJIG5vdGljZWQg
dGhhdCBhcyBsb25nIGFzIFhGU19GU0JfVE9fQkIobXAsIGJ1c3lwLT5sZW5ndGgpIGlzIGdyZWF0
ZXIKdGhhbiAwIGFuZCB0aGVyZSBpcyBubyBiaW8gYWxsb2NhdGlvbiBmYWlsdXJlLCBfX2Jsa2Rl
dl9pc3N1ZV9kaXNjYXJkKCkKd2lsbCBuZXZlciByZXR1cm4gTlVMTC4gSSdtIG5vdCBmYW1pbGlh
ciB3aXRoIHRoaXMgcGFydCBvZiB0aGUgeGZzLCBzbwpJJ20gbm90IHN1cmUgd2hldGhlciB0aGVy
ZSBhcmUgY2FzZXMgd2hlcmUgJ1hGU19GU0JfVE9fQkIobXAsCmJ1c3lwLT5sZW5ndGgpJyBjb3Vs
ZCBiZSAwLiBJZiBzdWNoIGNhc2VzIGRvIG5vdCBleGlzdCwgdGhlbgpjaGVja2luZyB3aGV0aGVy
IHRoZSBiaW8gaXMgTlVMTCBzaG91bGQgYmUgc3VmZmljaWVudC4KCllvbmdwZW5nLAoKPiAgICAg
ICAgICAgfQo+ICAgIAo+ICAgICAgICAgICBpZiAoYmlvKSB7Cj4gPiBJZiB3ZSBrZWVwIGxvb3Bp
bmcgYWZ0ZXIgdGhlIGZpcnN0IGJpbyA9PSBOVUxMLCB0aGUgcmVzdCBvZiB0aGUgcmFuZ2UgaXMK
PiBndWFyYW50ZWVkIHRvIGJlIGluY29uc2lzdGVudCBhbnl3YXlzLCBiZWNhdXNlIGV2ZXJ5IHN1
YnNlcXVlbnQgaXRlcmF0aW9uCj4gd2lsbCBmYWxsIGludG8gb25lIG9mIHRocmVlIGNhc2VzOgo+
IAo+IC0gVGhlIGFsbG9jYXRvciBrZWVwcyByZXR1cm5pbmcgTlVMTCwgc28gbm9uZSBvZiB0aGUg
cmVtYWluaW5nIExCQXMgcmVjZWl2ZQo+ICAgICBkaXNjYXJkLgo+IC0gUmVzdCBvZiB0aGUgYWxs
b2NhdG9yIHN1Y2NlZWRzLCBidXQgd2XigJl2ZSBhbHJlYWR5IHNraXBwZWQgYSBjaHVuaywgbGVh
dmluZwo+ICAgICBhIGhvbGUgaW4gdGhlIGRpc2NhcmQgcmFuZ2UuCj4gLSBXZSBnZXQgaW50ZXJt
aXR0ZW50IHN1Y2Nlc3Nlcywgd2hpY2ggcHJvZHVjZXMgYWx0ZXJuYXRpbmcgY2h1bmtzIG9mCj4g
ICAgIGRpc2NhcmRlZCBhbmQgdW5kaXNjYXJkZWQgYmxvY2tzLgo+IAo+IEluIGVhY2ggb2YgdGhv
c2Ugc2NlbmFyaW9zLCB0aGUgZGlzayBlbmRzIHVwIHdpdGggYSBwYXJ0aWFsbHkgZGlzY2FyZGVk
Cj4gcmFuZ2UsIHNvIHRoZSBjb3JyZWN0IGZpeCBpcyB0byBicmVhayBvdXQgb2YgdGhlIGxvb3Ag
aW1tZWRpYXRlbHkgYW5kCj4gcHJvY2VlZCB0byB4ZnNfZGlzY2FyZF9idXN5X2NsZWFyKCkgb25j
ZSB0aGUgdmVyeSBmaXJzdCBhbGxvY2F0aW9uIGZhaWxzLgoKCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxp
c3QKTGludXgtZjJmcy1kZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5z
b3VyY2Vmb3JnZS5uZXQvbGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
