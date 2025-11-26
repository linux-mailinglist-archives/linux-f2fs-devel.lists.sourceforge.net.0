Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD0BBC89136
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 Nov 2025 10:48:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:In-Reply-To:From:References:To:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rpe0VNEjkKulbjhvFsmo/rr4LRBdzW7A+XhBii/lWic=; b=XfVlFdTYCizdFily+Pd+atlx7k
	AMqQLh4bhOCRl63R6S+9SXbhaoITKVePvpbqu+1qAva4MYk1M9Yn34ZPx5lgLNBR1KIman7gqPhoA
	4xg1HhrlAjJl21rOpQvv7svx1kFQ+qfhs7FmGy3c8XYQCix2p3/5SpKBQfQXuyORyO48=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vOC8g-0008SF-Kj;
	Wed, 26 Nov 2025 09:48:42 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vOC8f-0008S7-1E
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Nov 2025 09:48:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8uMB3N5rvsdxpxdbhQ4/rwp3UTr0eB1Bcl9iSw80eIw=; b=FWt2C9M8UgzKdGiDj0VvlW3Qtj
 OezcUZlIYepHkYObi1sB1z249Cu/H3M9njSupZd5Pyy6WG01xksWPtv/JLmHpN8X3sT6lAf0VO5uC
 Lb9UatTV/+AMtcmHVqkBtmVnBNaPy+fzi8iW7A5m1P2bJ4hcHAGvn8Xwl/xC6l44fNmA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8uMB3N5rvsdxpxdbhQ4/rwp3UTr0eB1Bcl9iSw80eIw=; b=QopPdY8VX+OPu760xs/UUDCgSa
 EUTIo6izCd/KBQ6jryGbpKNRmCwnQukXe4BDHNX1SAVcXF0T5fVCoat9Bz/0dbyU9fE1kTQ7exDyt
 Bf9VpnJfiTwQUcrHZR72+VhGIWbkK6eAhhZPN5p57Ab3ksXs1KIjdxAUk5QS87t2dTmQ=;
Received: from mail-pl1-f176.google.com ([209.85.214.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vOC8e-00037j-HC for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 26 Nov 2025 09:48:40 +0000
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-298287a26c3so76016005ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 26 Nov 2025 01:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764150515; x=1764755315; darn=lists.sourceforge.net;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8uMB3N5rvsdxpxdbhQ4/rwp3UTr0eB1Bcl9iSw80eIw=;
 b=GuYkyjEsoyVo7ZK1uYZyETimdzYN9dByMHVEYn6lqCHKdOxqqWUoSySgn4Vhsd9K6K
 MxT+/mHdeVn/cRpn4QUqnYUjWAYi4pSgGxmIjfVhyibXeiVo/ETfCxEkzIxOH4MEm8/n
 xe8+B2VGdbhapx8+s2fXESCmnDKIOid0i5xkGW6miHInn9yaihYMKklrWHsW+VwJ5SEs
 dAFJpBowrVqg1lYmJh3kvkcASN6f5vsk0NJDc2PYM8yvWY2BJX7zPqMRd8njhE+s3Nyx
 XkoToOk6JMDyO6PWf++oVWlsnrrHTWQZYCt5ZBCgXFcRCXEd1lliHbJUxKpuJssHIaBY
 6Veg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764150515; x=1764755315;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8uMB3N5rvsdxpxdbhQ4/rwp3UTr0eB1Bcl9iSw80eIw=;
 b=rHc/Jl8kZ1IyGa2vLCCSKQCHE2lzz0hVQMGHHM/92tp5+zBBnMOZObaC0vmkEhIC9N
 UJGWofmS65F/ttVL2qHbE6eXWB0wcC3nFnFOhaTvoGd9yKyQuMIMvwiKPQEnGhvK22OR
 grv5gEFJDKCt8Ab2Ey+TsSu8TblRA1FLf8gW6wXBOgXYNGKnbum3vzQWA67EkEmkLMWP
 6AP7Q7Y0qzp3QQ2oM6XPHV7AZrptCrRJIEtg+kH73LaJmHdMyxFSv+klmX3j1wtcu4FL
 8o7yk3YAUffvpeXUqp4iDQqfnbSR+MDOrP5P/1I3YP3ciGT8aR/ikBng/bQ+xDqwEiKe
 PTZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXiRdRhi375LBNGajYq3MZS/k+NBDxBDSQ+y+4uTbc8JQBdtRW9Jm+ugslkzwbsQJ6+tUAYWvurV/ZNhTBQeITn@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwadMKlgBaT9aHESmEaZNjPwldWLocTSSE3MHTw16bj0JgcMVBX
 UgFvewq3bPZJx3N8XpyBXx29EL26TTGGp822dQ0z+Gx1L53cfXv4jmXw
X-Gm-Gg: ASbGnctYlw1i4LlccggqSeLxMbjUxJd5VeNgKgJ2dF2KceaqomsKnzQgRN8FWsxyq66
 yktrFugro74TB6CQDsmsOEXOPA6NP6b38EfcIx7Q7YUEcVZyhpptNNX0h8A+5XmA9jKgxFDkEYA
 EqWK/hzix48K2G/HUCNvqZ7TEATgHAJhGGcvuO+FdOtd8tez66cuXdynptYgrSqX7E/vQjDhxpY
 1KNZexdngpHULjwN697hZk0LdAjzdIKybLXmJX6cytycs4myt8E5t4E9FXJ3dlGrYhluEVHZqHW
 11jaGx+bLGOHeij6SeLPpl4zmcmayGLxlUTCyFtr41pTE1T17lDzxSoTfNmNMU+iOfOIBjGrXPG
 k9xTH3HEkgKLsL/ecOjX//1suwMbauSAhPuG6w9rRnQFbaJbWpkPxJcaEcKietkdZQzXiYM63uT
 xlA1efkcW+rfb7CoHOBvmhJJLURNk5WoWui4E16FEP
X-Google-Smtp-Source: AGHT+IF+9FtF7ayQC3G69Yp8vRWGltdYla+KBkYnRAEC4rmaUkKIhqBtAVHy/WEEjGIFeEh9j7Z8hw==
X-Received: by 2002:a17:90b:2ccc:b0:340:299f:130d with SMTP id
 98e67ed59e1d1-34733e60971mr18027499a91.13.1764150514677; 
 Wed, 26 Nov 2025 01:48:34 -0800 (PST)
Received: from [10.189.138.37] ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3476004dc3dsm1931007a91.9.2025.11.26.01.48.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 26 Nov 2025 01:48:34 -0800 (PST)
Message-ID: <5a1387fd-4952-42e0-b7a9-e614f7b20325@gmail.com>
Date: Wed, 26 Nov 2025 17:48:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Yongpeng Yang <yangyongpeng.storage@gmail.com>,
 Chaitanya Kulkarni <chaitanyak@nvidia.com>,
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
 <2da95607-9b21-4d21-8926-9463021a6f33@gmail.com>
Content-Language: en-US
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
In-Reply-To: <2da95607-9b21-4d21-8926-9463021a6f33@gmail.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/26/25 17:14, Yongpeng Yang wrote: > On 11/26/25 16:07, 
 Chaitanya Kulkarni via Linux-f2fs-devel wrote: >> On 11/25/25 18:37, Yongpeng
 Yang wrote: >>>> diff --git a/fs/xfs/xfs_discard.c b/fs/xfs/x [...] 
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
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.176 listed in wl.mailspike.net]
X-Headers-End: 1vOC8e-00037j-HC
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
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 Johannes Thumshirn <johannes.thumshirn@wdc.com>,
 Yongpeng Yang <yangyongpeng@xiaomi.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "bpf@vger.kernel.org" <bpf@vger.kernel.org>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMTEvMjYvMjUgMTc6MTQsIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4gT24gMTEvMjYvMjUgMTY6
MDcsIENoYWl0YW55YSBLdWxrYXJuaSB2aWEgTGludXgtZjJmcy1kZXZlbCB3cm90ZToKPj4gT24g
MTEvMjUvMjUgMTg6MzcsIFlvbmdwZW5nIFlhbmcgd3JvdGU6Cj4+Pj4gZGlmZiAtLWdpdCBhL2Zz
L3hmcy94ZnNfZGlzY2FyZC5jIGIvZnMveGZzL3hmc19kaXNjYXJkLmMKPj4+PiBpbmRleCA2OTE3
ZGU4MzIxOTEuLmI2ZmZlNDgwN2ExMSAxMDA2NDQKPj4+PiAtLS0gYS9mcy94ZnMveGZzX2Rpc2Nh
cmQuYwo+Pj4+ICsrKyBiL2ZzL3hmcy94ZnNfZGlzY2FyZC5jCj4+Pj4gQEAgLTEwOCw3ICsxMDgs
NyBAQCB4ZnNfZGlzY2FyZF9lbmRpbygKPj4+PiDCoMKgwqAgKiBsaXN0LiBXZSBwbHVnIGFuZCBj
aGFpbiB0aGUgYmlvcyBzbyB0aGF0IHdlIG9ubHkgbmVlZCBhIHNpbmdsZQo+Pj4+IGNvbXBsZXRp
b24KPj4+PiDCoMKgwqAgKiBjYWxsIHRvIGNsZWFyIGFsbCB0aGUgYnVzeSBleHRlbnRzIG9uY2Ug
dGhlIGRpc2NhcmRzIGFyZSAKPj4+PiBjb21wbGV0ZS4KPj4+PiDCoMKgwqAgKi8KPj4+PiAtaW50
Cj4+Pj4gK3ZvaWQKPj4+PiDCoMKgIHhmc19kaXNjYXJkX2V4dGVudHMoCj4+Pj4gwqDCoMKgwqDC
oMKgIHN0cnVjdCB4ZnNfbW91bnTCoMKgwqAgKm1wLAo+Pj4+IMKgwqDCoMKgwqDCoCBzdHJ1Y3Qg
eGZzX2J1c3lfZXh0ZW50c8KgwqDCoCAqZXh0ZW50cykKPj4+PiBAQCAtMTE2LDcgKzExNiw2IEBA
IHhmc19kaXNjYXJkX2V4dGVudHMoCj4+Pj4gwqDCoMKgwqDCoMKgIHN0cnVjdCB4ZnNfZXh0ZW50
X2J1c3nCoMKgwqAgKmJ1c3lwOwo+Pj4+IMKgwqDCoMKgwqDCoCBzdHJ1Y3QgYmlvwqDCoMKgwqDC
oMKgwqAgKmJpbyA9IE5VTEw7Cj4+Pj4gwqDCoMKgwqDCoMKgIHN0cnVjdCBibGtfcGx1Z8KgwqDC
oMKgwqDCoMKgIHBsdWc7Cj4+Pj4gLcKgwqDCoCBpbnTCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGVy
cm9yID0gMDsKPj4+PiDCoMKgIMKgwqDCoMKgwqAgYmxrX3N0YXJ0X3BsdWcoJnBsdWcpOwo+Pj4+
IMKgwqDCoMKgwqDCoCBsaXN0X2Zvcl9lYWNoX2VudHJ5KGJ1c3lwLCAmZXh0ZW50cy0+ZXh0ZW50
X2xpc3QsIGxpc3QpIHsKPj4+PiBAQCAtMTI2LDE4ICsxMjUsMTAgQEAgeGZzX2Rpc2NhcmRfZXh0
ZW50cygKPj4+PiDCoMKgIMKgwqDCoMKgwqDCoMKgwqDCoCB0cmFjZV94ZnNfZGlzY2FyZF9leHRl
bnQoeGcsIGJ1c3lwLT5ibm8sIGJ1c3lwLT5sZW5ndGgpOwo+Pj4+IMKgwqAgLcKgwqDCoMKgwqDC
oMKgIGVycm9yID0gX19ibGtkZXZfaXNzdWVfZGlzY2FyZChidHAtPmJ0X2JkZXYsCj4+Pj4gK8Kg
wqDCoMKgwqDCoMKgIF9fYmxrZGV2X2lzc3VlX2Rpc2NhcmQoYnRwLT5idF9iZGV2LAo+Pj4+IMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB4ZnNfZ2Jub190b19kYWRkcih4Zywg
YnVzeXAtPmJubyksCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIFhG
U19GU0JfVE9fQkIobXAsIGJ1c3lwLT5sZW5ndGgpLAo+Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBHRlBfS0VSTkVMLCAmYmlvKTsKPj4+Cj4+PiBJZiBibGtfYWxsb2Nf
ZGlzY2FyZF9iaW8oKSBmYWlscyB0byBhbGxvY2F0ZSBhIGJpbyBpbnNpZGUKPj4+IF9fYmxrZGV2
X2lzc3VlX2Rpc2NhcmQoKSwgdGhpcyBtYXkgbGVhZCB0byBhbiBpbnZhbGlkIGxvb3AgaW4KPj4+
IGxpc3RfZm9yX2VhY2hfZW50cnl7fS4gSW5zdGVhZCBvZiB1c2luZyBfX2Jsa2Rldl9pc3N1ZV9k
aXNjYXJkKCksIGhvdwo+Pj4gYWJvdXQgYWxsb2NhdGUgYW5kIHN1Ym1pdCB0aGUgZGlzY2FyZCBi
aW9zIGV4cGxpY2l0bHkgaW4KPj4+IGxpc3RfZm9yX2VhY2hfZW50cnl7fT8KPj4+Cj4+PiBZb25n
cGVuZywKPj4KPj4KPj4gQ2FsbGluZyBfX2Jsa2Rldl9pc3N1ZV9kaXNjYXJkKCkga2VlcHMgbWFu
YWdpbmcgYWxsIHRoZSBiaW8gd2l0aCB0aGUKPj4gYXBwcm9wcmlhdGUgR0ZQIG1hc2ssIHNvIHRo
ZSBzZW1hbnRpY3Mgc3RheSB0aGUgc2FtZS4gWW91IGFyZSBqdXN0Cj4+IG1vdmluZyBtZW1vcnkg
YWxsb2NhdGlvbiB0byB0aGUgY2FsbGVyIGFuZCBwb3RlbnRpYWxseSBsb29raW5nIGF0Cj4+IGlt
cGxlbWVudGluZyByZXRyeSBvbiBiaW8gYWxsb2NhdGlvbiBmYWlsdXJlLgo+Pgo+PiBUaGUgcmV0
cnkgZm9yIGRpc2NhcmQgYmlvIG1lbW9yeSBhbGxvY2F0aW9uIGlzIG5vdCBkZXNpcmVkIEkgdGhp
bmssCj4+IHNpbmNlIGl0J3Mgb25seSBhIGhpbnQgdG8gdGhlIGNvbnRyb2xsZXIuCj4gCj4gQWdy
ZWVkLiBJJ20gbm90IHRyeWluZyB0byByZXRyeSBiaW8gYWxsb2NhdGlvbiBpbnNpZGUgdGhlCj4g
bGlzdF9mb3JfZWFjaF9lbnRyeXt9IGxvb3AuIEluc3RlYWQsIHNpbmNlIGJsa19hbGxvY19kaXNj
YXJkX2JpbygpCj4gcmV0dXJuaW5nIE5VTEwgY2Fubm90IHJlbGlhYmx5IGluZGljYXRlIHdoZXRo
ZXIgdGhlIGZhaWx1cmUgaXMgZHVlIHRvCj4gYmlvIGFsbG9jYXRpb24gZmFpbHVyZSwgaXQgY291
bGQgYWxzbyBiZSBjYXVzZWQgYnkgJ2Jpb19zZWN0cyA9PSAwJywgSSdkCj4gbGlrZSB0byBhbGxv
Y2F0ZSB0aGUgYmlvIGV4cGxpY2l0bHkuCj4gCj4+Cj4+IFRoaXMgcGF0Y2ggaXMgc2ltcGx5IGNs
ZWFuaW5nIHVwIGRlYWQgZXJyb3ItaGFuZGxpbmcgYnJhbmNoZXMgYXQgdGhlCj4+IGNhbGxlcnMg
bm8gYmVoYXZpb3JhbCBjaGFuZ2VzIGludGVuZGVkLgo+Pgo+PiBXaGF0IG1heWJlIHVzZWZ1bCBp
cyB0byBzdG9wIGl0ZXJhdGluZyBvbmNlIHdlIGZhaWwgdG8gYWxsb2NhdGUgdGhlCj4+IGJpbyBb
MV0uCj4+Cj4+IC1jawo+Pgo+PiBbMV0gUG90ZW50aWFsIGFkZGl0aW9uIG9uIHRoZSB0b3Agb2Yg
dGhpcyB0byBleGl0IGVhcmx5IGluIGRpc2NhcmQgbG9vcAo+PiDCoMKgwqDCoMKgIG9uIGJpbyBh
bGxvY2F0aW9uIGZhaWx1cmUuCj4+Cj4+IGRpZmYgLS1naXQgYS9mcy94ZnMveGZzX2Rpc2NhcmQu
YyBiL2ZzL3hmcy94ZnNfZGlzY2FyZC5jCj4+IGluZGV4IGI2ZmZlNDgwN2ExMS4uMTUxOWY3MDhi
Yjc5IDEwMDY0NAo+PiAtLS0gYS9mcy94ZnMveGZzX2Rpc2NhcmQuYwo+PiArKysgYi9mcy94ZnMv
eGZzX2Rpc2NhcmQuYwo+PiBAQCAtMTI5LDYgKzEyOSwxMyBAQCB4ZnNfZGlzY2FyZF9leHRlbnRz
KAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqAgeGZzX2dibm9fdG9fZGFkZHIoeGcsIGJ1c3lwLT5ibm8pLAo+PiDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqAgWEZTX0ZTQl9UT19CQihtcCwgYnVzeXAtPmxlbmd0aCksCj4+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBHRlBf
S0VSTkVMLCAmYmlvKTsKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLyoKPj4gK8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAqIFdlIGZhaWxlZCB0byBhbGxvY2F0ZSBiaW8g
aW5zdGVhZCBvZiBjb250aW51aW5nIHRoZSAKPj4gbG9vcAo+PiArwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgICogc28gaXQgd2lsbCBsZWFkIHRvIGluY29uc2lzdGVudCBkaXNjYXJkcyB0
byB0aGUgZGlzawo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICogZXhpdCBlYXJs
eSBhbmQganVtcCBpbnRvIHhmc19kaXNjYXJkX2J1c3lfY2xlYXIoKS4KPj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAqLwo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBp
ZiAoIWJpbykKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IGJyZWFrOwo+IAo+IEkgbm90aWNlZCB0aGF0IGFzIGxvbmcgYXMgWEZTX0ZTQl9UT19CQihtcCwg
YnVzeXAtPmxlbmd0aCkgaXMgZ3JlYXRlcgo+IHRoYW4gMCBhbmQgdGhlcmUgaXMgbm8gYmlvIGFs
bG9jYXRpb24gZmFpbHVyZSwgX19ibGtkZXZfaXNzdWVfZGlzY2FyZCgpCj4gd2lsbCBuZXZlciBy
ZXR1cm4gTlVMTC4gSSdtIG5vdCBmYW1pbGlhciB3aXRoIHRoaXMgcGFydCBvZiB0aGUgeGZzLCBz
bwo+IEknbSBub3Qgc3VyZSB3aGV0aGVyIHRoZXJlIGFyZSBjYXNlcyB3aGVyZSAnWEZTX0ZTQl9U
T19CQihtcCwKPiBidXN5cC0+bGVuZ3RoKScgY291bGQgYmUgMC4gSWYgc3VjaCBjYXNlcyBkbyBu
b3QgZXhpc3QsIHRoZW4KPiBjaGVja2luZyB3aGV0aGVyIHRoZSBiaW8gaXMgTlVMTCBzaG91bGQg
YmUgc3VmZmljaWVudC4KPiAKPiBZb25ncGVuZywKCklmIF9fYmxrZGV2X2lzc3VlX2Rpc2NhcmQo
KSByZXF1aXJlcyBtdWx0aXBsZSBjYWxscyB0bwpibGtfYWxsb2NfZGlzY2FyZF9iaW8oKSwgb25j
ZSB0aGUgZmlyc3QgYmlvIGFsbG9jYXRpb24gc3VjY2VlZHMsIGl0IHdpbGwKbmV2ZXIgcmVzdWx0
IGluIGJpbyA9PSBOVUxMLCBtZWFuaW5nIHRoYXQgYW55IHN1YnNlcXVlbnQgYmlvIGFsbG9jYXRp
b24KZmFpbHVyZXMgY2Fubm90IGJlIGRldGVjdGVkLgoKWW9uZ3BlbmcsCgo+IAo+PiDCoMKgwqDC
oMKgwqDCoMKgwqAgfQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKGJpbykgewo+PiA+IElmIHdl
IGtlZXAgbG9vcGluZyBhZnRlciB0aGUgZmlyc3QgYmlvID09IE5VTEwsIHRoZSByZXN0IG9mIHRo
ZSAKPj4gcmFuZ2UgaXMKPj4gZ3VhcmFudGVlZCB0byBiZSBpbmNvbnNpc3RlbnQgYW55d2F5cywg
YmVjYXVzZSBldmVyeSBzdWJzZXF1ZW50IGl0ZXJhdGlvbgo+PiB3aWxsIGZhbGwgaW50byBvbmUg
b2YgdGhyZWUgY2FzZXM6Cj4+Cj4+IC0gVGhlIGFsbG9jYXRvciBrZWVwcyByZXR1cm5pbmcgTlVM
TCwgc28gbm9uZSBvZiB0aGUgcmVtYWluaW5nIExCQXMgCj4+IHJlY2VpdmUKPj4gwqDCoMKgIGRp
c2NhcmQuCj4+IC0gUmVzdCBvZiB0aGUgYWxsb2NhdG9yIHN1Y2NlZWRzLCBidXQgd2XigJl2ZSBh
bHJlYWR5IHNraXBwZWQgYSBjaHVuaywgCj4+IGxlYXZpbmcKPj4gwqDCoMKgIGEgaG9sZSBpbiB0
aGUgZGlzY2FyZCByYW5nZS4KPj4gLSBXZSBnZXQgaW50ZXJtaXR0ZW50IHN1Y2Nlc3Nlcywgd2hp
Y2ggcHJvZHVjZXMgYWx0ZXJuYXRpbmcgY2h1bmtzIG9mCj4+IMKgwqDCoCBkaXNjYXJkZWQgYW5k
IHVuZGlzY2FyZGVkIGJsb2Nrcy4KPj4KPj4gSW4gZWFjaCBvZiB0aG9zZSBzY2VuYXJpb3MsIHRo
ZSBkaXNrIGVuZHMgdXAgd2l0aCBhIHBhcnRpYWxseSBkaXNjYXJkZWQKPj4gcmFuZ2UsIHNvIHRo
ZSBjb3JyZWN0IGZpeCBpcyB0byBicmVhayBvdXQgb2YgdGhlIGxvb3AgaW1tZWRpYXRlbHkgYW5k
Cj4+IHByb2NlZWQgdG8geGZzX2Rpc2NhcmRfYnVzeV9jbGVhcigpIG9uY2UgdGhlIHZlcnkgZmly
c3QgYWxsb2NhdGlvbiBmYWlscy4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRl
dmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9s
aXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
